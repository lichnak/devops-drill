# Commit Message Guidelines

To make code reviews easier and also commits easier to revert, commits should be small and have separate commits for
separate changes.

Have small commits. Small commits are much faster to review and also more errors are found. In case a commit has to be
reverted it's much easier with small atomic commits.

Have only one change per commit. That means there should be either a formatting change, or a refactoring or a behavior
change. If commits can be split they probably should be; more is more.

Review the commit yourself. Ideally you can do that already when staging the lines.

## Commit Message Style

Writing good git commit messages:

* Separate subject from body with a blank line.
* Limit the subject line to 50 characters. The subject should mainly summarize what was changed.
* Do not end the subject line with a period.
* Use the imperative mood in the subject line.
* Wrap the body at 72 characters.
* Use the body to explain *what* and *why* vs. *how*. Especially for more complex changes the explanation should contain
the information what was the reason of the change and how the change solves the problem.
* Refer to tickets at the end. This allows tracing from code to tasks/requirements and back which is required in most projects at your work.

Example:

```
Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Closes #123
Relates to #321
See also #456, #789
```
