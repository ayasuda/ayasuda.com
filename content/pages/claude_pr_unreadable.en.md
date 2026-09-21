---
title: "I Can't Read the PR Claude Wrote for Me"
description: "Claude writes thorough pull requests, but I can't follow them. On context, code reviews, and becoming the guy who clicks Approve."
date: '2026-09-21'
tags:
  - Essay
  - AI
  - Programming
keywords:
  - Claude
  - pull requests
  - code review
  - AI coding
  - context
---

Lately, I can't read the PRs Claude writes for me.

Well, I can still understand the title. “Add feature X,” “Fix bug Y.” So far, so good.

It's the body that's the problem.

Nope. You've lost me. What on earth are you talking about?

Maybe this is my own fault. I can't rule out the possibility that watching too many short videos and scrolling X has damaged my ability to read long passages.

Still, aren't AI-written PRs hard to read?

There's just so much of it. Background, changes, technical decisions, test results. Everything is explained very carefully.

But it's long.

And perhaps it assumes every reader is brilliant, because the context I need to follow the explanation never quite comes through. I can't tell what feature was changed, or how.

## Back when PRs had no body

When humans were writing code together, we went back and forth on how much a PR description needed to say.

Take PRs with no body. I wrote plenty of those myself. The title tells you what it does, right?

My colleagues sent me those too. Their PRs were beautifully scoped, so I could review them just fine from the title and diff.

Every now and then, though, a newcomer would submit a huge change, with unrelated fixes mixed in. We'd discuss it and come up with a rule: “Please include the background in your PR.”

Eventually we had templates, with more and more fields for background, changes, and testing.

But humans are humans. What we wrote in those fields was often pretty slapdash. I've even seen PRs merged with “TBD” still in the description.

Somehow, we managed.

AI is different. Give it a template and it fills everything in diligently. Background, changes, test results: all carefully documented.

AI finally does what we kept asking humans to do.

And now we can't read it.

Hard to blame it, really.

## A skill to remove PR slop

I've noticed a similar trend elsewhere: skills designed to remove “slop” from PR descriptions, shortening AI-generated explanations.

Do we really need that...?

Sure, if it makes things easier to read, that's good. But if the default output is unusable, isn't there something more seriously wrong here?

Humans didn't write descriptions, so we introduced templates. AI faithfully fills in the templates, so now we introduce a skill to delete the descriptions.

What are we doing?

And I'm not even sure shortening them would make them readable. All I know is that, for me, they're too long.

## The guy who clicks Approve

This happens in both my personal projects and my day job. It's worse at work.

At my current workplace, almost the entire development process has been AI-ified: FSD, acceptance criteria, issues, implementation, PRs, and merge.

AI writes specifications, defines acceptance criteria, creates issues, and writes code. Another AI reviews the resulting PR, both against the design and on the merits of the PR itself. My AI session fixes the issues it raises.

Then a colleague approves it.

I click Merge, with my brain switched off.

I don't even really know what the code in front of me is supposed to do.

I'd at least like to review PRs properly. But that seems difficult too. To understand a PR, I first need to understand what we're trying to build. That means reading the FSD and acceptance criteria.

...Which were also written by AI.

So I've become a middle-aged guy whose job is to burn through the tokens the company gives him and periodically click “Approve.”

## Personal projects are different

There, I've become the client. I play with the deployed app and grin to myself.

I don't read the PRs in the first place.

But I built the project from scratch, and my original design is still more or less there. When I occasionally look over a PR or the codebase as a whole, it's easy to spot where things seem to be going well—and where they aren't.

Even without understanding every implementation detail, I have a rough grasp of the whole thing.

Work is different. I joined a project that was already underway, with existing designs, specifications, and history.

In the past, I would have had to understand at least some of that before I could even start writing code.

Now AI writes it for me. The PR is ready before I understand it.

And because AI has made development faster, there's pressure to “get that PR out already.” From other people, and from myself.

Development keeps moving while the context never quite makes it into my head.

## We have documentation. Nobody reads it.

When I joined development teams in the past, I'd hear: “Sorry, we don't have documentation.”

Everyone was busy. Fair enough. So I'd read the existing code, ask colleagues, and learn the system bit by bit while working on it.

Now we have documentation. FSDs, acceptance criteria, issues—as much as AI can write.

But I suspect no human has actually read it all.

And the explanations are so packed with context that I can't follow them.

It's a strange situation. In the past, I couldn't understand things because there was no documentation. Now I can't understand them even though there is documentation.

And development can proceed without my understanding any of it.

## Where AI draws the context boundary

Thinking about this, I realized something: the boundaries of context are blurry for today's AI.

In a good way, it's full-stack. It can load the FSD, acceptance criteria, issues, frontend, backend, and existing code into one context. Then it writes code and documentation with all of that in mind.

That's wonderful.

But **the human reading that documentation is expected to have the same context.**

Suppose Claude reads a mountain of specs and existing code before changing a feature. It writes the PR description on that basis.

I haven't read all those materials. Even if I have, I don't have all of them in my head.

Claude doesn't know what I know or don't know. Of course it doesn't: I never gave it that instruction.

When humans worked together, I feel the context boundaries were a little clearer. Frontend developers understood the frontend; backend developers understood the backend. Of course people knew things outside their own areas, and teams varied. But my colleagues, at least, submitted PRs at a level of detail I could follow.

AI can cross those boundaries effortlessly. It can load knowledge that used to be spread across several people into a single context, then write a careful explanation as though everyone else knows it all too.

No wonder I can't read it.

Which brings me back to whether we really need a skill to shorten PR descriptions. Maybe the problem isn't just length. Maybe the writer and reader don't share the same context boundary.

Shortening the text might even remove the context I actually need.

Then again, to ask Claude to tailor its explanation to my context, I'd first need to work out what I don't understand.

Well, that's a problem.

## By the way

I started out complaining that I couldn't read Claude's PRs. Somehow we ended up talking about human-written PRs, the difference between work and personal projects, and AI's context boundaries.

This has turned into a rather long article.

By the way, this article was written by ChatGPT, based on a conversation with ChatGPT.

I talk through whatever comes to mind. ChatGPT organizes the background, extracts the points, and explains everything carefully. I read it, change what I don't like, and finally approve it.

...

At work I have Claude write PRs. For my personal projects I have Claude write code. For my blog I have ChatGPT write articles.

Apparently, being the guy who clicks Approve isn't just my day job anymore.

So.

Can you actually read this article?
