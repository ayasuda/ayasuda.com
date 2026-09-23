---
title: "Where Did the Implementation Train Come From?"
description: "A story about AI reading previous AI output as fact, until nobody's decision quietly becomes a project rule."
date: '2026-09-23'
tags:
  - Essay
  - AI
  - Programming
keywords:
  - Claude Code
  - AI coding
  - AI slop
  - documentation
  - specifications
---

For a while, Claude Code kept using the phrase "implementation train" in one of my personal projects.

Implementation train.

What the hell is that?

At first, I thought it might be a real term. I had never seen it in Japanese, but maybe "Implementation Train" or something like it had become popular in English-speaking developer circles.

Apparently not.

When I traced it back through the old documentation, it looked like Claude Code had once compared something to a train. That sentence survived somewhere in the docs.

Then, on another day, another session picked it up.

Another session used it somewhere else.

And before I knew it, my project had acquired a mysterious term: "implementation train."

Nobody had decided to call it that.

At least, I hadn't.

## AI writes it, and AI reads it

Lately, I've been doing development as a loop with AI.

AI writes the issues. AI writes the documentation. AI implements the feature. AI writes the tests.

As I wrote in an earlier post, once you do this for a while, the documentation and PRs gradually become unreadable to humans.

There's simply too much of it.

One response to this problem is tools and skills such as [tanteki](https://iwasa-kosui.github.io/tanteki/), which try to suppress the verbose output we tend to call AI slop.

I understand the idea.

But something about it bothers me.

If we can get AI to write well in the first place without another tool cleaning up afterward, surely that's better.

So what exactly are we getting wrong?

While thinking about that, I came across a paper called [Artificial intelligence sustains higher strategic tension than humans in chess](https://journals.aps.org/apsos/abstract/10.1103/63cv-52fj).

It describes how AI sustains higher strategic tension than humans in chess.

Reading it made something click.

Who actually reads our comments, documentation, and PRs now?

AI does.

## Does it need to be readable to humans?

Humans can carry a large amount of long-term context, somewhat inaccurately.

"I think we talked about something like this around there."

"If I remember correctly, we designed it this way for some reason."

That's roughly how I remember old decisions.

AI, on the other hand, can use a fairly large amount of context inside a single session, as far as its available memory allows.

Of course there are limits.

But it will at least read far more documentation than I do.

Which makes me wonder whether shortening AI-written documentation for humans is always the right thing to do.

The next reader may also be AI.

Information that looks redundant to a human might be useful context for the next AI.

A structure that is too complicated for a human might still be manageable for AI as it is.

In an AI development loop, human readability and AI usability may gradually start drifting apart.

And once the human stops reading, the "implementation train" appears.

## "Did I ever decide that?"

The implementation train is mostly funny.

All that happened was that my project gained one weird term.

But I occasionally see the same thing happen with specifications.

I say:

"I want this feature to work like this."

AI replies:

"But you explicitly decided in the past not to do that."

Did I?

I look it up.

Sure enough, it's written down.

But if I dig a little further, I find that I wasn't the one who made the decision.

An earlier AI session had filled in a missing part of the specification and written its own decision into the documentation.

To the next session, that is no longer an AI decision.

It is an existing specification written in the project documentation.

So the AI follows it.

Then it implements something based on that specification.

Another AI sees the implementation, and now there is another piece of evidence: "the existing implementation works this way."

Something that began as a gap filled by one session gradually turns into a project rule.

## The places nobody is watching

With product behavior, I can still notice.

I can ask myself, "Did I ever decide that?"

The harder problem is the stuff I don't normally look at.

How should the application access the database?

What should be tested?

What should be logged?

I don't review every one of those decisions.

AI picks an approach.

It writes that approach into the documentation.

The next AI reads it.

That AI treats it as the way this project does things.

Then it writes the same idea somewhere else.

A method that some AI once filled in starts spreading throughout the project.

And there is another complication.

Different sessions read different documents.

One session reads document A.

Another reads document B.

If A and B contradict each other, neither session can notice unless it reads both.

AI doesn't notice.

How much less likely am I to notice?

## What is this?

So something strange happens when I keep running development as an AI loop.

AI makes a decision.

AI documents it.

The next AI reads that document as an existing rule.

Then it makes another decision.

That decision remains in the code, tests, or documentation.

Humans aren't reading all of it.

At least, I'm not.

The product still works.

The tests still pass.

And somewhere outside my view, the implementation train starts running.

For now, this is a personal project.

I'm the only human developer.

I'm also the only human deciding what the product is supposed to do.

And it's already like this.

So what happens when several people on the same team are each developing with their own AI?

I don't know.

Also, does this phenomenon already have a name?

It doesn't quite feel like AI slop.

It doesn't quite feel like ordinary documentation decay either.

AI creates something. The next AI receives it as fact, creates something else from that fact, and little by little it becomes simply "how this project works."

I couldn't come up with a name for it.

Someone please invent a nice-sounding term.
