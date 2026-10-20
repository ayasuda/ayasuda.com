---
title: "A High-Difficulty Code Review Request"
description: "If AI writes, reviews, and maintains our code, will humans still need to read it?"
date: '2026-10-20'
tags:
  - Essay
  - AI
  - Programming
keywords:
  - dark factory
  - code review
  - software factory
  - software architecture
  - AI coding
---

Lately, I've been aiming for a dark factory.

The term originally refers to a factory that operates with hardly any human involvement. No people means no need to turn on the lights. Hence the name: dark factory.

The idea is to bring that approach to software development.

Well, lights on or off, AI is already doing a substantial part of the work. It isn't just implementation anymore. AI is increasingly handling testing and code reviews, too.

And that raises a few questions.

Do we still need GitHub and pull requests?

Is code review still practical?

How much should we put in commit messages?

And, seriously, do we really, really need design?

## Code That Humans Don't Read

Let's start with code review.

Suppose AI writes the code, another AI reviews it, and AI even makes the corrections. Do we need to write pull request descriptions for human readers anymore?

The same goes for commit messages.

Why we made a change, the background, what exactly we fixed—we've traditionally recorded these things for other people. But if AI can examine and understand the change history when needed, does that information have to remain in human-readable prose?

Of course, a human might still need to investigate a problem someday.

Then again, we could leave the investigation to AI, too.

Follow that thought a little further and you get to a more troublesome question.

What happens to architecture?

Patterns such as MVC and Clean Architecture have, among their purposes, making complicated software understandable and changeable by humans. We can't hold a huge program in our heads all at once, so we separate responsibilities and arrange things into layers.

There are other reasons, of course: limiting the impact of changes and making testing easier, for example.

But what if AI is basically the only one reading the code?

Do we really need to keep its structure easy for humans to understand?

## The Software Factory

This reminds me of the software factory that Hitachi established in 1969.

The idea was to treat software development as industrial production, standardize the work, and manage quality.

During that era, approaches to quality assurance developed around inspecting individual programs and then checking the system made by combining them. Hitachi didn't invent unit testing, but the idea of dividing software into components and verifying each one fits the factory metaphor quite well.

What matters here, I think, is where we establish quality.

Check that a component behaves as required. Then check that the components together deliver the expected functions.

Humans don't necessarily need to understand every detail of the internal implementation to do that.

We can treat the component as a black box and test its behavior.

Of course, unit tests alone don't guarantee product quality. We also need integration tests and verification of non-functional requirements such as performance, reliability, and security.

Still, it's a straightforward way of thinking about the problem.

And I suspect this way of thinking will come back to the forefront as dark factories become more common.

AI handles the internals. Humans look at the requirements and whether those requirements have been satisfied.

Meanwhile, AI optimizes the implementation in whatever way suits it.

So what happens next?

## Mysterious Architecture, Mysterious Language

Imagine that one day, for some reason, you decide to read code you've been leaving entirely to AI.

You open the repository.

And there it is: an unfamiliar design, written in a language you've never seen before.

I wonder if that future is possible.

For now, AI uses programming languages and development tools built for humans. That makes sense: it has plenty of knowledge about them, and there are compilers, debuggers, and testing tools ready to use.

I don't expect some mysterious new language to appear tomorrow.

But if only AI writes the code, and only AI reads it, does it have to keep using programming languages designed for people forever?

There's no guarantee that our current architectures are optimal for AI, either.

Variable and function names meant to make sense to humans. Dependencies organized so that people can follow them. Perhaps those things help AI, too. Perhaps not.

After years of AI-driven modifications and optimization, we might end up with something that humans find almost impossible to understand.

After all, human readability wasn't part of the quality requirements.

## A High-Difficulty Code Review Request

Then again, code that's hard for humans to understand is hardly new.

Try reading the parts of a Linux device driver close to the hardware. There are architecture-specific operations, register manipulation, and sometimes even inline assembly.

Good luck reading that.

Some people certainly can, of course. But it's not easy for me.

And when I'm just using Linux, I don't need to read it anyway.

As long as it behaves as expected, that's fine.

So perhaps mysterious architectures in mysterious AI-generated languages won't be much of a problem, either.

Unless, for some reason, somebody asks a human to review the code.

"Could you take a quick look at this change?"

You open the repository and find an unknown language and an unknown architecture.

What's more, the code works. The tests pass. The non-functional requirements are met.

You can't tell what's wrong with it—or even what it's doing in the first place.

A high-difficulty code review request, indeed.

But come to think of it, human society runs on a far more mysterious set of specifications.

Laws, taxes, government institutions: systems held together by years of patches and exceptions. Who knows whether the specification even exists? And we can't exactly ask the original authors.

Yet, somehow, society keeps running.

Maybe a mysterious architecture in a mysterious language written by AI won't be such a big deal after all.
