---
title: "I Thought I Had My Own Dark Factory—Then Response Time Died"
description: "I let AI handle most of the implementation in a dark-factory-style workflow, then found 3000ms responses and a query fetching everything."
date: '2026-10-06'
tags:
  - Essay
  - AI
  - Programming
keywords:
  - dark factory
  - AI coding
  - OpenTelemetry
  - Neon
  - performance
---

The web app I've been building on my own is finally getting close to Closed Alpha.

I'm pretty happy about it.

This time, I've been seriously trying to develop it in something close to a dark factory style.

I say, “I want a feature like this.” AI writes the code. It writes the tests. It runs them. If something is wrong, it fixes it. I check what came out and give it the next instruction.

Repeat.

It's not completely unattended, of course, but I've personally been writing far less code.

And the application is actually taking shape.

Amazing.

I've written about dark factories before, but actually doing it myself feels incredibly futuristic.

“Is this really going to change how software gets built?”

That's the sort of thing I was thinking as I looked at the app coming together.

Closed Alpha was coming into view.

Nice.

I have my own dark factory now!


Except lately, the top page had been feeling sluggish.

So I measured it.

Over 3000ms.

...

......

You have GOT to be kidding me. There is still exactly ONE user!?

The app is built with Go, Neon DB, and HTML embedded in Go. It's not even downloading some enormous JavaScript bundle on the frontend. And yet the main page takes more than three seconds to open.

Locally, by the way, it comes in under 70ms.

Something is wrong.

## First, check the logs. Except there is nothing there. Nothing.

When something like this happens, the first thing you do is check the logs.

I've been a programmer for about twenty years. I'm not going to stare at “three seconds” and start reading every line of code from top to bottom.

You look at the logs and figure out where the time went.

Except—surprise!—there were no logs.

I wanted a dark factory. Which meant I'd handed a lot of this application's implementation over to AI.

“I want a feature like this!”

AI implements it. Tests it. It works.

Next feature.

That's how I'd been incrementally stacking up the minimum functionality.

And in that process, there was never really a moment when I told it what to log, or where.

If I had been writing the code myself, it probably would have been different.

At some point while debugging, I'd wonder, “What's happening here?” and print something out. Not because I had some grand Observability Strategy. Because I was stuck. Print debugging remains primitive and useful in every era.

But this time, I had handed that part of the process to AI too.

Features accumulated.

Logs did not.

So first I built proper request logging. I settled on a format and logged duration, status, request body size, and response body size. I also made it possible to filter by session.

That told me the browser-to-server network wasn't the problem.

The server itself was taking 3000ms.

Painful to look at.

## Add OpenTelemetry

Next I wanted metrics and traces. Naturally, AI wasn't going to add those by itself unless I asked.

So I added the usual OpenTelemetry setup. The coding agent told me it was “premature.”

No. I am having the problem right now.

Think Prometheus and Zipkin. The nice thing about instrumentation is that once it's there, measurements can happen automatically.

That said, this is a personal project. I didn't want to build a serious trace backend just to receive traces. That costs money too.

So I decided to dump the traces as text immediately after the request logs.

The DB library and server library could be auto-instrumented. I added spans around the relevant business logic.

Now I could finally see what was inside those 3000ms.

One DB query taking more than 1200ms.

Several queries taking around 200ms each.

I see.

I see?

I... see!?

## Singapore is far away

More than 100ms for a single query is absurd.

But I did have one obvious suspect.

The Neon DB is in Singapore. The application server is in the Kanto region of Japan.

That's far.

There are several things I could do about this.

I could pool connections. I could parallelize independent DB access. I could cache things. I could move the database itself to Kanto.

I could also move the application to Singapore, but I'm hesitant to do that. It would put the app closer to the DB, but farther from browsers in Japan. And once you start thinking about distributing HTTP requests too, “just put the app next to the DB” isn't necessarily the whole answer.

Anyway, that can wait.

You 200ms queries: I'll deal with all of you later.

But you, 1200ms query: absolutely not.

What on earth are you doing?

So at last, I looked at the query.

## Fetch-Everything-chan

What a magnificent piece of engineering...

It fetched all 600 records belonging to me—the application's one and only user—and then paginated them so it could render ten.

What a luxurious use of resources.

Absolutely not.

My local database has maybe a hundred records. At that size, fetching everything doesn't visibly hurt.

The production environment is supposed to reach the order of 10k records.

There is no universe in which this is acceptable.

So why did it get implemented this way?

I looked back at what I'd asked for.

I had told the AI:

“I want a feature like this!”

That's it.

There were no non-functional requirements in there.

What happens when the data grows? How many records should we assume? Should full-table-style fetching be avoided? What response time is acceptable?

I had specified none of that.

The AI implemented the feature I asked for.

It worked locally. The tests passed.

Nothing was wrong.

Well. Except please don't fetch everything.

## From 3000ms to 150ms

I fixed Fetch-Everything-chan.

The response that had taken more than 3000ms dropped to roughly 150ms.

Excellent.

And if there was one of these, there could obviously be more.

So, while crying internally, I asked the coding agent to list every pattern that might cause full data retrieval, and I went through them one by one.

A simple little job.

I'm very glad I found this before launching the service for real.

If a response takes three seconds, users get angry.

If I keep fetching everything and the transfer volume starts climbing too, I get to cry.

At worst, I go broke.

## Where did “obviously you do it this way” go?

I don't think this story is simply “AI wrote terrible code.”

Of course, I would very much prefer it not to fetch 10k records every time.

But if I had asked a human programmer for the same feature, the specification still wouldn't have said, “Fetching everything is prohibited.”

An experienced programmer would probably avoid it.

Because it feels wrong.

The data is likely to grow. This path will probably be called repeatedly. This is going to become annoying later.

After twenty years of programming, you accumulate a huge collection of those bad feelings.

Logging was the same.

If I had implemented this myself, I probably wouldn't have created a task called “Implement logging.” I would have gotten stuck while debugging and added logs anyway.

In other words, the act of a human writing code apparently contained a large collection of non-functional requirements that were never written in the specification.

When you remove the human from the implementation process in a dark-factory-style workflow, those disappear too.

Fine. Then tell the AI everything from the start.

Write performance requirements.

Write logging requirements.

Write monitoring requirements.

Ban fetching everything.

Ban N+1 queries.

...Is that all of them?

I don't think so.

Can I enumerate, in advance, everything an experienced programmer unconsciously avoids?

At least I can't.

This time, 3000ms became 150ms.

I still haven't added parallelization, connection pooling, or caching. If the Closed Alpha goes well, I'm considering moving from Neon to Fly.io Managed Postgres.

At the root of it, having the application and database outside the same network is still a problem.

But fixing that costs money.

For now, 150ms is good enough.

I found Fetch-Everything-chan this time.

How many more “obviously you do it this way” assumptions are still sitting in my head, never written down?

I don't know.

Dark factories are pretty interesting.
