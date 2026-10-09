---
title: "Could QA Engineers Become Much More Valuable in the Age of Vibe Coding?"
description: "As AI speeds up development, perhaps the people who understand test design and testability will become far more valuable."
date: '2026-10-09'
tags:
  - Essay
  - AI
  - Engineering
keywords:
  - vibe coding
  - QA
  - software testing
  - pairwise testing
  - testability
---

At my company, we make extensive use of AI to develop software.

And, well, naturally, bugs happen.

When one does, somebody sometimes asks, “Did you test it?” Sometimes rather often, actually.

Of course we did. My colleagues and I test before releasing. It's not as though we're shipping things without even checking whether they work.

But what we're doing is what you'd call *developer testing*.

## But I did test it

Developers test to confirm that the software they implemented works.

QA and test engineers, on the other hand, test to find out where the software doesn't work.

…Okay, that's probably putting it a bit too strongly. Developers test failure cases, too, and QA engineers certainly test happy paths.

Still, I suspect there's a difference in how we approach testing.

The computer scientist Edsger Dijkstra once wrote:

> Program testing can be used to show the presence of bugs, but never to show their absence!

— *Edsger W. Dijkstra, [Notes on Structured Programming (EWD249)](https://www.cs.utexas.edu/~EWD/transcriptions/EWD02xx/EWD249.html)*

Well, obviously.

Just because every test passes doesn't prove there are no bugs. Something might break under conditions you didn't test. Or the test cases themselves might be wrong.

So you have to think about *what* to test and *how*.

And that takes specialized knowledge.

## Starting with system testing

Anyway, back to AI.

Vibe coding is wonderfully convenient. You tell an AI, “Build me something like this,” and it gives you something that runs.

It really runs. Fantastic.

You try the finished thing and go, “Oh, it works.”

But come to think of it, isn't that rather like starting straight with system testing?

Traditionally, you'd design something, implement it, run unit tests, run integration tests, and so on. With AI, you can jump straight to a working application.

Of course you can ask AI to write unit tests. Plenty of people do.

But having test code and testing appropriately are two different things.

Real software involves complicated interactions among models, states, and conditions.

An operation may be allowed in one state but forbidden in another. A bug may occur only when two conditions coincide. Some combinations shouldn't even be possible.

How do you test all that?

One technique is pairwise, or all-pairs, testing: designing cases so that every possible pair of values across two factors is covered.

Of course, that alone isn't sufficient. Interactions among three or more factors matter, and so do state transitions.

The point is, just poking at the software until it seems to work isn't enough.

## And then there's testability

There's another issue: testability.

Software needs to be designed so that it can actually be tested.

If reproducing a particular state requires waiting several days, or you can't observe the internal state from outside, testing becomes difficult.

So you make it possible to construct states, control time, and observe the information you need.

These things have to be considered during design.

Now then.

How many engineers think about testability when writing prompts for AI-generated software?

“Implement this feature, but make sure I can run combinatorial tests that account for constraints between states, freely construct test data, and control time and external dependencies.”

…Somehow I doubt many people include instructions like that every single time.

At the very least, simply asking AI to “write tests too” doesn't solve the problem.

## So who's the expert here?

AI has made software development faster.

But that doesn't automatically make verifying software correctly any easier.

Writing test code isn't the same as designing tests. And you also need to design software with testability in mind.

So who actually specializes in talking about these things?

Well, QA and test engineers, obviously.

Sure, some developers know this stuff very well. But test techniques and quality assurance are precisely what QA and test engineers have specialized in.

If AI produces software in huge quantities, there's also more software to verify.

That doesn't mean the number of people with the expertise to verify it will increase at the same rate.

…Wait a minute.

Could the market value of QA and test engineers be about to skyrocket?

That's what I've been thinking.

For the record, I do test my code.

I really do, though…
