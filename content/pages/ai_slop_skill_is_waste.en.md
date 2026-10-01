---
title: "A Skill for Fixing AI Slop Feels Like a Terrible Waste"
description: "Before fixing AI-like prose, I think we should decide who the document is for and what it is actually trying to say."
date: '2026-10-01'
tags:
  - Essay
  - AI
  - Writing
keywords:
  - AI slop
  - yomiyasu
  - AI writing
  - documentation
  - Claude Code
---

Today I read a Zenn article titled “[I Built ‘yomiyasu,’ a Skill for Making AI-Slop Japanese Readable at the Structural Level](https://zenn.dev/algoartis/articles/0b1c731881b25c).”

It introduces an Agent Skill for rewriting the kind of Japanese we call AI slop into prose that feels more natural and readable to humans.

And while I was reading it, I had a thought.

A skill for fixing AI-slop documents feels like a terrible waste.

This is not to say that yomiyasu is bad. If anything, it takes the question of what makes AI-generated prose hard to read quite seriously and breaks the problem down carefully.

What bothered me was what comes after that.

One example in the article rewrites an AI-generated explanation of design systems.

The original is full of phrases AI seems to love: things like an “operating system for decision-making,” “feel,” and “resolution.” After yomiyasu rewrites it, the text gives a concrete explanation: shared UI components reduce the work required to build screens, and so on.

It is definitely easier to read.

But I found myself wondering about something else.

Who are you telling that “we need a design system” to, and why?

There is another example about asynchronous processing.

The original includes a mysterious sentence along the lines of, “Dependencies cannot be divided. Turn back while moving.” I have no idea what that is supposed to mean.

The rewrite turns it into concrete implementation advice about idempotency, retries, and dead-letter queues.

Again, the rewritten version is dramatically easier to understand.

But once you have made it that concrete, you have done more than make the prose easier to read.

You have decided who needs an explanation of “things to watch out for when using messaging for asynchronous processing,” at what level, and for what purpose. Then you have written the content required for that purpose.

The meaning, the purpose, and the intended reader have all changed.

It feels like asking someone to make a beginner’s introductory spice curry easier to eat, and getting nikudofu instead.

Sure, it is easy to eat.

But isn’t that a different dish?

I suspect the most troublesome part of AI slop is not the wording.

Maybe it is asking AI to “write a nice document” before there is any clear idea of who the document is for or what it is supposed to communicate.

AI can write.

It can write with an ambiguous purpose.

It can write without an intended reader.

It can even fill in missing substance and produce something that looks plausible.

That is when it starts saying things like “what matters is,” inventing strange metaphors, and growing lists of exactly three bullet points.

Then we come along afterward and try to fix it with banned words, syntactic rules, and linters.

Hmm.

Wouldn’t it be faster to decide what we are writing first?

A lot of the writing on ayasuda.com is written with AI too.

Actually, these days, almost all of it is.

I chat with ChatGPT.

I talk through something that has been bothering me.

At some point I go, “Oh. That’s what I’m trying to say.”

Then I have it write a first draft.

I read it and fix the parts that feel wrong.

This article was made the same way.

So if you say AI wrote it, then yes, AI absolutely wrote it.

But at least there is something I want to write before the prose appears.

For me it is less “who am I explaining this to?” and more “I thought this thing about this subject.”

I suspect things get difficult when that part is missing, we generate the prose anyway, and only afterward try to remove the smell of AI from it.

For work documents, the purpose can be much clearer.

I want the person implementing this specification to know about this constraint.

I want the reviewer of this PR to understand why the change exists and what it affects.

I want someone doing this procedure for the first time to complete it without getting lost.

Once that much is decided, we can tell the AI to write for that purpose from the beginning.

If it still produces weird prose, then fix it. A skill for doing that can be useful.

But if nobody knows why a document exists in the first place, spending a lot of effort downstream to make it sound “human” probably does not solve much.

What removes AI slop is not a skill for removing AI slop.

It is having something to say.

What we need is feeling. Feeling! Passion.

...which suddenly sounds like exactly the thing AI would have the hardest time dealing with.
