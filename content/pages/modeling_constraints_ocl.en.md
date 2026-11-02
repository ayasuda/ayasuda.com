---
title: "No Matter How Hard I Model, I Can't Write the Constraints"
description: "An old CASE tool dream comes back in the age of AI—and then I discover OCL."
date: '2026-11-03'
tags:
  - Essay
  - AI
  - Programming
keywords:
  - domain modeling
  - CASE tools
  - constraint logic programming
  - OCL
  - UML
---

Lately, AI-driven software development has been everywhere.

Watching it, I get the feeling that an old dream from the good old days might finally come true.

The dream of [CASE tools](https://en.wikipedia.org/wiki/Computer-aided_software_engineering).

There used to be this idea: draw a class diagram in a tool like [Enterprise Architect (the product)](https://en.wikipedia.org/wiki/Enterprise_Architect_%28software%29), and have it generate database definitions and ORM code.

Add a class, get a table. Change an attribute, get a column change. Edit the model, and even get a migration file.

Wonderful.

Of course, tools aiming for this have existed for ages, and some parts of the dream already worked. But trusting them with an entire real-world application was another matter.

Now, though, we have AI.

Define the model, let AI write the code, and let it keep everything in sync as the model changes.

Maybe the dream is finally coming true?

## Modeling matters

For years I've been a member of the “domain modeling and database design are really important” faction.

Actually, I still am.

Understanding the business, sorting out its concepts, and defining the relationships between them helps keep software structured. At least it's better than just writing code without thinking.

So even if AI is going to build the application, I think we should start with a proper domain model.

But here's a question.

“20% off when it rains.”

Where does that go on a class diagram?

Or this one:

“Up to two children get half price per accompanying parent.”

You can model parents and children. You can model prices, discounts, even weather.

But a class diagram alone can't describe all the business constraints that connect those concepts.

An RDBMS can express some constraints using CHECK clauses and foreign keys, but these conditional business rules are much harder to capture that way.

So no matter how hard I work on the model, I can't write the constraints that actually matter.

## Then just write the constraints!

With AI everywhere, [constraint logic programming](https://en.wikipedia.org/wiki/Constraint_logic_programming) is getting attention again.

AI-generated code may look right and even run. That doesn't mean it's correct.

Why not define the constraints separately and verify the result against them?

I get the logic.

But constraint logic programming is hard.

For example, here's a simplified Prolog CLP(FD) program expressing the rule about two half-price children per parent. It maximizes the number of children eligible for the discount.

```prolog
:- use_module(library(clpfd)).

discounted_children(Parents, Children, Discounted) :-
    Discounted in 0..Children,
    Discounted #=< Parents * 2,
    labeling([max(Discounted)], [Discounted]).

% ?- discounted_children(2, 5, D).
% D = 4.
```

Two parents, five children, four discounted tickets. It works.

And this is the easy version. Now add age limits, incompatible promotions, and effective dates.

There's another approach, too: instead of finding values that satisfy constraints, use a proof assistant such as [Lean](https://en.wikipedia.org/wiki/Lean_(proof_assistant)) to prove that a program cannot violate them.

For the same two-children-per-parent rule, it might look something like this:

```lean
def discountedChildren (parents children : Nat) : Nat :=
  min children (parents * 2)

-- Never discount more children than actually exist
theorem never_exceeds_children (p c : Nat) :
    discountedChildren p c ≤ c := by
  simp [discountedChildren]

-- At most two discounted children per parent
theorem never_exceeds_parent_limit (p c : Nat) :
    discountedChildren p c ≤ p * 2 := by
  simp [discountedChildren]
```

This isn't just checking the case of two parents and five children. It's proving that the number of discounted children never exceeds the limits, for any natural-number inputs.

By the way, the author cannot read this code. AI wrote it for me. I ask AI to write code that proves the correctness of code written by AI. And then I can't read the proof code either.

...What exactly am I verifying here?

Of course, these proofs concern only the function shown here. They don't prove that some separately generated implementation is correct, let alone that the business rules themselves make sense.

Software development is already complicated enough. Are we really going to ask every engineer on the team to master constraint logic programming just to validate AI-generated code?

Wouldn't that kill the team?

So I had an idea.

What if we combined a domain model with business constraints written in something closer to prose, like [Gherkin](https://cucumber.io/docs/gherkin/reference/)?

For example:

- Give 20% off on rainy days.
- Give half price to up to two children per parent.
- Do not modify an order once confirmed, but allow an administrator to cancel it.

Write those rules in a format understandable to both people and AI.

Then ask AI to implement them *and* verify that the implementation satisfies them.

A domain model and business constraints.

That sounds like a pretty nice development environment.

...Wait.

What would the syntax look like?

Too close to natural language and it becomes ambiguous. Make it rigorous and you're essentially inventing another programming language.

Oh no. I have no idea.

## Claude, you...

I was discussing this with Claude.

Claude said, in effect:

“Sounds nice, but there's something you haven't thought about.”

What's that?

“Business constraints change. All the time.”

Oh, come on.

Of course they do.

This month's rainy-day 20% discount might become weekends-only next month, then members-only the month after that.

Existing bookings might still need the old rules.

The constraints you define today don't stay fixed forever.

Even if you create a beautiful way to describe them, they keep changing.

How do you manage those versions? How do you apply them to code? How do you verify them?

We're back to the same old problem software developers have always faced: business rules change.

Why is the real world so difficult?

I thought AI might finally fulfill that old CASE tool dream. Apparently it's still a long way off.

## But wait, there's more

...That was the blog post I was going to write.

So I started chatting with ChatGPT.

“No matter how hard I model, I can't write the constraints.”

ChatGPT replied:

“Actually, UML does have a way to express constraints.”

What?

“There's a language called [OCL (Object Constraint Language)](https://en.wikipedia.org/wiki/Object_Constraint_Language) for specifying constraints on UML models.”

What's that supposed to be?

Apparently OCL lets you express conditions, invariants, and preconditions and postconditions for operations on a UML model.

Even a rule like “Once an order is confirmed, it can't be modified, except that an administrator may cancel it” can be expressed with operation contracts.

And OCL has been around since the 1990s.

Seriously?

Of course, being able to *write* constraints in OCL doesn't automatically generate an implementation or a verifier. Nor does it solve the problem of business rules changing.

But at least my assumption that “UML can't express constraints” was wrong.

Someone had the idea of combining domain models and constraints decades ago.

IT ALREADY EXISTS?!

Hang on.

So you *can* express the constraints after all.
