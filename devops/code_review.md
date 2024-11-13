# Code Review Guidelines

This guide contains advice and best practices for performing code review, and having your code reviewed.

All merge requests for OpsEng code base, whether written by an OpsEng team member or a volunteer contributor, must go
through a code review process to ensure the code is effective, understandable, maintainable, and secure.

## Getting Your Merge Request Reviewed, Approved, and Merged

You are strongly encouraged to get your code reviewed by a reviewer as soon as there is any code to review, to get a
second opinion on the chosen solution and implementation, and an extra pair of eyes looking for bugs, logic problems, or
uncovered edge cases. The reviewer can be from a different team, but it is recommended to pick someone who knows the
domain well. You can read more about the importance of involving reviewer(s) in the section on the responsibility of the
author below.

If you need some guidance (e.g. it’s your first merge request), feel free to ask one of the OpsEng team members.

For approvals, we use the approval functionality found in the merge request widget. Reviewers can add their approval by
approving additionally.

If your merge request requires more than one approval, the last maintainer to review and approve it will also merge it.

### Approval Guidelines

Changes should be reviewed and approved by a domain maintainer, for example:

1. If your merge request includes backend changes, it must be approved by a backend maintainer.
2. If your merge request includes frontend changes, it must be approved by a frontend maintainer.
3. If your merge request includes UX changes, it must be approved by a UX team member.

As described in the section on the responsibility of the maintainer below, you are recommended to get your merge request
approved and merged by maintainer(s) from teams other than your own.

### Security Requirements (To Be Clarified)

1. If your merge request is processing, storing, or transferring any kind of Personal Data, it must be approved by a
dedicated Security Engineer.
2. If your merge request involves implementing, utilizing, or is otherwise related to any type of authentication,
authorization, or session handling mechanism, it must be approved by a dedicated Security Engineer.
3. If your merge request has a goal which requires a cryptographic function such as: confidentiality, integrity,
authentication, or non-repudiation, it must be approved by a dedicated Security Engineer.

### The Responsibility of the Merge Request Author

The responsibility to find the best solution and implement it lies with the merge request author.

Before assigning a merge request to a maintainer for approval and merge, they should be confident that it actually
solves the problem it was meant to solve, that it does so in an appropriate way, that it satisfies all
requirements, and that there are no remaining bugs, logical problems, uncovered edge cases, or known vulnerabilities.
The merge request should be passing CI pipeline to avoid unnecessary back and forth.

To reach the required level of confidence in their solution, an author is expected to involve other people in the
investigation and implementation processes as appropriate.

They are encouraged to reach out to domain experts to discuss different solutions or get an implementation reviewed, to
product managers and UX designers to clear up confusion or verify that the end result matches what they had in mind, to
database specialists to get input on the data model or specific queries, or to any other developer to get an in-depth
review of the solution.

If an author is unsure if a merge request needs a domain expert’s opinion, that’s usually a pretty good sign that it
does, since without it the required level of confidence in their solution will not have been reached.

Before the review, the author is requested to submit comments on the merge request diff alerting the reviewer to
anything important as well as for anything that demands further explanation or attention. Examples of content that may
warrant a comment could be:

* The addition of a linting rule (Rubocop, JS etc)
* The addition of a library (Ruby gem, JS lib etc)
* Where not obvious, a link to the parent class or method
* Any benchmarking performed to complement the change
* Potentially insecure code

Do not add these comments directly to the source code, unless the reviewer requires you to do so.

This saves reviewers time and helps authors catch mistakes earlier.

### The Responsibility of the Maintainer

Maintainers are responsible for the overall health, quality, and consistency of the OpsEng codebase, across domains and
product areas.

Consequently, their reviews will focus primarily on things like overall architecture, code organization, separation of
concerns, tests, DRYness, consistency, and readability.

Since a maintainer’s job only depends on their knowledge of the overall OpsEng codebase, and not that of any specific
domain, they can review, approve and merge MRs from any team and in any product area.

In fact, authors are encouraged to get their merge requests merged by maintainers from teams other than their own, to
ensure that all code across OpsEng is consistent and can be easily understood by all contributors, from both inside and
outside the company, without requiring team-specific expertise.

Maintainers will do their best to also review the specifics of the chosen solution before merging, but as they are not
necessarily domain experts, they may be poorly placed to do so without an unreasonable investment of time. In those
cases, they will defer to the judgment of the author and earlier reviewers and involved domain experts, in favor of
focusing on their primary responsibilities.

If a developer who happens to also be a maintainer was involved in a merge request as a domain expert and/or reviewer,
it is recommended that they are not also picked as the maintainer to ultimately approve and merge it.

Maintainers should check before merging if the merge request is approved by the required approvers.

Maintainers must check before merging if the merge request is introducing new vulnerabilities, by inspecting the list in
the Merge Request Security Widget. When in doubt, a Security Engineer can be involved. The list of detected
vulnerabilities must be either empty or containing:

* dismissed vulnerabilities in case of false positives
* vulnerabilities converted to tickets

Maintainers should never dismiss vulnerabilities to “empty” the list, without duly verifying them.

## Best Practices

### Everyone

* Accept that many programming decisions are opinions. Discuss tradeoffs, which you prefer, and reach a resolution
quickly.
* Ask questions; don’t make demands. (“What do you think about naming this :user_id?”)
* Ask for clarification. (“I didn’t understand. Can you clarify?”)
* Avoid selective ownership of code. (“mine”, “not mine”, “yours”)
* Avoid using terms that could be seen as referring to personal traits (“dumb”, “stupid”). Assume everyone is
attractive, intelligent, and well-meaning.
* Be explicit. Remember people don’t always understand your intentions online.
* Be humble. (“I’m not sure - let’s look it up.”)
* Don’t use hyperbole. (“always”, “never”, “endlessly”, “nothing”)
* Be careful about the use of sarcasm. Everything we do is public; what seems like good-natured ribbing to you and a
long-time colleague might come off as mean and unwelcoming to a person new to the project.
* Consider one-on-one chats or video calls if there are too many “I didn’t understand” or “Alternative solution:”
comments. Post a follow-up comment summarizing one-on-one discussion.
* If you ask a question to a specific person, always start the comment by mentioning them; this will ensure they see it
if their notification level is set to “mentioned” and other people will understand they don’t have to respond.

### Having Your Code Reviewed

Please keep in mind that code review is a process that can take multiple iterations, and reviewers may spot things later
that they may not have seen the first time.

* The first reviewer of your code is you. Before you perform that first push of your shiny new branch, read through the
entire diff. Does it make sense? Did you include something unrelated to the overall purpose of the changes? Did you
forget to remove any debugging code?
* Be grateful for the reviewer’s suggestions. (“Good call. I’ll make that change.”)
* Don’t take it personally. The review is of the code, not of you.
* Explain why the code exists. (“It’s like that because of these reasons. Would it be more clear if I rename this
class/file/method/variable?”)
* Extract unrelated changes and refactorings into future merge requests/tickets.
* Seek to understand the reviewer’s perspective.
* Try to respond to every comment.
* Let the reviewer select the “Resolve discussion” buttons.
* Push commits based on earlier rounds of feedback as isolated commits to the branch. Do not squash until the branch is
ready to merge. Reviewers should be able to read individual updates based on their earlier feedback.

### Assigning a Merge Request for a Review

If you want to have your merge request reviewed, you can assign it to any reviewer. The list of reviewers can be found
in the project's `CONTRIBUTION.md` file.

You can also use `ready for review` label. That means that your merge request is ready to be reviewed and any reviewer
can pick it. It is recommended to use that label only if there isn’t time pressure and make sure the merge request is
assigned to a reviewer.

When your merge request was reviewed and can be passed to a maintainer you can either pick a specific maintainer or use
a label ready for merge.

It is responsibility of the author of a merge request that the merge request is reviewed. If it stays in ready for
review state too long it is recommended to assign it to a specific reviewer.

### List of Merge Requests Ready for Review

Developers who have capacity can regularly check the list of merge requests to review and assign any merge request they
want to review.

### Reviewing Code

Understand why the change is necessary (fixes a bug, improves the user experience, refactors the existing code). Then:

* Try to be thorough in your reviews to reduce the number of iterations.
* Communicate which ideas you feel strongly about and those you don’t.
* Identify ways to simplify the code while still solving the problem.
* Offer alternative implementations, but assume the author already considered them. (“What do you think about using a
custom validator here?”)
* Seek to understand the author’s perspective.
* If you don’t understand a piece of code, say so. There’s a good chance someone else would be confused by it as well.
* After a round of line notes, it can be helpful to post a summary note such as “LGTM :thumbsup:”, or “Just a couple
things to address.”
* Assign the merge request to the author if changes are required following your review.
* Avoid accepting a merge request before the job succeeds. Of course, “Merge When Pipeline Succeeds” (MWPS) is fine.
* If you set the MR to “Merge When Pipeline Succeeds”, you should take over subsequent revisions for anything that would
be spotted after that.
* Consider using the "Squash and merge feature" when the merge request has a lot of commits. When merging code a
maintainer should only use the squash feature if the author has already set this option or if the merge request clearly
contains a messy commit history that is intended to be squashed.

### The Right Balance

One of the most difficult things during code review is finding the right balance in how deep the reviewer can interfere
with the code created by a reviewee.

* Learning how to find the right balance takes time; that is why we have reviewers that become maintainers after some
time spent on reviewing merge requests.
* Finding bugs and improving code style is important, but thinking about good design is important as well. Building
abstractions and good design is what makes it possible to hide complexity and makes future changes easier.
* Asking the reviewee to change the design sometimes means the complete rewrite of the contributed code. It’s usually a
good idea to ask another maintainer or reviewer before doing it, but have the courage to do it when you believe it is
important.
* There is a difference in doing things right and doing things right now. Ideally, we should do the former, but in the
real world we need the latter as well. A good example is a security fix which should be released as soon as possible.
Asking the reviewee to do the major refactoring in the merge request that is an urgent fix should be avoided.
* Doing things well today is usually better than doing something perfectly tomorrow. Shipping a kludge today is usually
worse than doing something well tomorrow. When you are not able to find the right balance, ask other people about their
opinion.

## Credits

Largely based on ["GitLab development guides. Code Review Guidelines."](https://docs.gitlab.com/ee/development/code_review.html) by GitLab, Inc., licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
