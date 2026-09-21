param([string]$Hugo = 'hugo')
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$work = Join-Path ([IO.Path]::GetTempPath()) ('ayasuda-multilingual-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $work | Out-Null
foreach ($item in @('config.yaml', 'themes', 'layouts', 'assets', 'content', 'static')) {
    Copy-Item (Join-Path $root $item) $work -Recurse
}
function Build {
    & $Hugo --source $work --destination (Join-Path $work 'public') --cleanDestinationDir
    if ($LASTEXITCODE -ne 0) { throw 'Hugo build failed' }
}
function Read-Page($path) {
    Get-Content (Join-Path $work "public/$path/index.html") -Raw
}
function Assert($condition, $message) {
    if (-not $condition) { throw $message }
}
function Fixture($name, $extra = '') {
    @"
---
title: Language switch test
$extra
---
Test content.
"@ | Set-Content (Join-Path $work "content/pages/$name") -Encoding utf8
}
Build
$existing = @(Get-ChildItem (Join-Path $work 'public/pages') -Filter index.html -Recurse)
foreach ($page in $existing) {
    Assert ((Get-Content $page -Raw) -notmatch 'article-languages|class=.?lang-switch') "Unexpected switch: $($page.FullName)"
}
Fixture 'language-test.md'
Fixture 'language-test.en.md'
Fixture 'untranslated-test.md'
Fixture 'draft-translation-test.md'
Fixture 'draft-translation-test.en.md' 'draft: true'
Fixture 'future-translation-test.md'
Fixture 'future-translation-test.en.md' "publishDate: '2999-01-01'"
Fixture 'hidden-meta-test.md' 'hideMeta: true'
Fixture 'hidden-meta-test.en.md' 'hideMeta: true'
Fixture 'english-only-test.en.md'
New-Item -ItemType Directory (Join-Path $work 'content/pages/bundle-test') | Out-Null
Fixture 'bundle-test/index.md'
Fixture 'bundle-test/index.en.md'
Build
foreach ($slug in @('language-test', 'hidden-meta-test', 'bundle-test')) {
    foreach ($prefix in @('', 'en/')) {
        $html = Read-Page "${prefix}pages/$slug"
        $switch = [regex]::Match($html, '<nav class="?article-languages"?[^>]*>.*?</nav>').Value
        Assert ($switch.Length -gt 0) "Missing switch: $prefix$slug"
        Assert ($switch -match '日本語</a>.*?/.*?English</a>') 'Language order or labels changed'
        Assert ($switch -match "href=[`"']?/pages/$slug/") 'Missing Japanese URL'
        Assert ($switch -match "href=[`"']?/en/pages/$slug/") 'Missing English URL'
        Assert (([regex]::Matches($switch, 'aria-current=')).Count -eq 1) 'Expected exactly one current language'
        $currentUrl = "/${prefix}pages/$slug/"
        Assert ($switch -match ('href=["'']?' + [regex]::Escape($currentUrl) + '[^>]*aria-current=')) 'Wrong current language'
        Assert ($html.IndexOf('article-languages') -lt $html.IndexOf('class=post-content')) 'Switch must precede content'
        Assert ($html -notmatch 'class=.?lang-switch') 'Unexpected global language switch'
    }
}
foreach ($slug in @('untranslated-test', 'draft-translation-test', 'future-translation-test')) {
    Assert ((Read-Page "pages/$slug") -notmatch 'article-languages') "Unexpected switch: $slug"
}
Assert ((Read-Page 'en/pages/english-only-test') -notmatch 'article-languages') 'English-only page has a switch'
Write-Host "PASS: $($existing.Count) existing pages without switches; translated, untranslated, draft, future, hidden metadata, English-only and bundle cases."
Write-Host "Test output: $work"
