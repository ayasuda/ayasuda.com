---
title: "Now That AI Has Come This Far, How Much IAM Access Should I Give It?"
description: "I already let AI run AWS CLI commands for me, and I want it to monitor and even deploy things on its own. But how much IAM access is too much?"
date: '2026-11-11'
tags:
  - Essay
  - AI
  - Programming
keywords:
  - IAM Role
  - AWS
  - AI agents
  - dark factory
  - infrastructure operations
---

Lately, I've been letting AI run AWS CLI commands.

I ask it to do something, and it checks my AWS environment or changes settings for me. Pretty handy.

The thing is, it's doing all of that with my permissions.

In other words, anything I can do in AWS, the AI can do too.

Well, I'm the one giving the instructions, so maybe that's fine.

But I'd like to start automating infrastructure operations.

For example, once a day, I want AI to check AWS metrics and suggest improvements. Have an event hook run it periodically, and let me know if there's a problem.

Sounds good.

Actually, why stop at suggestions? I'd like it to make the fixes, deploy them, check the logs, and decide whether everything is safe.

...Wait.

With my permissions?

No, no. I should create a dedicated service account for AI and give it its own IAM Role.

But how much access do I give it?

## How Much Should I Leave to AI?

I tried writing it down.

| What I want AI to do | How much access to give it |
|---|---|
| Read metrics and logs | Read-only should be fine |
| Suggest improvements | Please do that automatically |
| Modify code | I'm already letting it do that |
| Deploy to a test environment | Limited permissions seem fine |
| Deploy to production | I'd like that, but it's a little scary |
| Change IAM Roles | Pretty scary |
| Delete databases | Please don't |
| Change its own permissions | Absolutely not |

Something like that?

Eventually, I'd like it to handle production deployments too. Deploy a change, watch the logs for a while, and deal with any problems.

If it could do all that, perhaps I wouldn't have to get up in the middle of the night to handle things myself.

But it's scary.

"Here's your AWS bill for this month!"

And there's some ridiculous amount on it.

Or:

"Ah. Sorry. I deleted the master database."

No, I don't think that would happen.

I don't think so, but...

## Come to Think of It, I Want AI to Handle IAM Too

IAM Roles are hard to configure, aren't they?

Which service needs which permissions? Which actions should be allowed on which resources?

Figuring all that out and configuring it is a pain.

So why not let AI do it?

"Give Tanaka-san the permissions he needs."

If AI could work out the appropriate IAM Policy, configure it, and apply it, that would be fantastic.

...Wait.

That AI would need permission to change IAM settings.

So, in order to have AI grant permissions, I'd have to grant AI permission to grant permissions.

Is that okay?

I suppose I could restrict it properly. But if possible, I'd rather let AI figure out those restrictions too.

This is a problem.

## Humans Have Job Titles

What would I do with a human?

If Tanaka-san were responsible for infrastructure, I might give him permission to change IAM settings.

With humans, trust is based on their role or title.

Of course, a title doesn't mean someone should be allowed to do anything. But at least within an organization, people have defined roles, and permissions can be assigned accordingly.

What about AI?

Do I just give it the title of infrastructure administrator?

For all I know, AI might even configure IAM Policies better than a human.

That's why I want to delegate the work.

But it's still scary.

Maybe it comes down to how much responsibility I'm prepared to take.

Except I have no idea where the acceptable boundary is.

Seriously, what am I supposed to do?

## I Was Worrying About Something Similar Last Year

Come to think of it, I feel like I was worrying about the same sort of thing last year.

"How much coding should I leave to AI?"

Looking back to around November 2025, I think my worries were roughly like this.

| What I wanted AI to do | How far to automate it |
|---|---|
| Investigate and analyze code | Go ahead |
| Suggest implementation approaches | I'd like that automated |
| Generate and modify code | Let it do it, but I want to review the diff |
| Write tests | Probably fine to delegate |
| Run tests | Go ahead automatically |
| Refactor code | What if it breaks existing behavior? |
| Create Git commits | Should it really do that on its own? |
| Open pull requests | This much seems automatable |
| Merge pull requests | Only after human review |
| Deploy to production | Surely a human should decide? |

Back then, I'd have AI write code, review it myself, and wonder just how much I could trust it.

Now, though, I'm running a dark factory.

I'm already leaving a great deal of coding to AI.

And I worried so much about it last year.

Maybe by next year, I'll no longer be worried about IAM Roles either.

Maybe I'll be giving AI the permissions it needs and letting it operate my infrastructure on its own.

...Seriously?

How much IAM access are you giving AI?
