# Merge Requests

We welcome merge requests with fixes and improvements to OpsEng code, tests, and/or documentation. The tickets that are
specifically suitable for community contributions are listed with the `Accepting Merge Requests` label but you are free
to contribute to any other ticket you want.

If you want to add a new feature that doesn't have a corresponding ticket yet, it is best to first create a `Feedback`
ticket and leave a comment asking for it to be marked as `Accepting Merge Requests`. Please include screenshots or
wireframes if the feature will also change the UI.

## Merge Request Guidelines

If you can, please submit a merge request with the fix or improvements including tests. If you don’t know how to fix the
issue but can write a test that exposes a bug we will accept that as well. In general bug fixes that include a
regression test are merged quickly while new features without proper tests are least likely to receive timely feedback.

The workflow to make a merge request is as follows:

1. Fork the project into your personal space on GitLab
2. Create a feature branch, branch away from `master`
3. Write tests and code
4. If you have multiple commits please combine them into a few logically organized commits by squashing them
5. Push the commit(s) to your fork
6. Rebase your feature branch on top of the latest `master`, if needed. Don’t merge `master` into your feature branch.
7. Submit a merge request (MR) to the `master` branch
    * Your merge request needs at least 1 approval from the maintainer groups
8. The MR title should describe the change you want to make
9. The MR description should give a motive for your change and the method you use to achieve it.
10. Mention the ticket(s) your merge request solves, using the Solves #XXX or Closes #XXX syntax to auto-close the
ticket(s) once the merge request will be merged
11. If you’re allowed to, set relevant labels
12. If the MR changes the UI it should include Before and After screenshots
13. Be prepared to answer questions and incorporate feedback even if requests for this arrive weeks or months after your
MR submission
    * If a discussion has been addressed, select the “Resolve discussion” button beneath it to mark it resolved
14. When writing commit messages please follow [these guidelines](commit_message.md)

Please keep changes in a single MR **as small as possible**. If you want to contribute a large feature think very
hard what the minimum viable change is. Can you split the functionality? Can you only submit the backend/API code? Can
you start with a very simple UI? Can you do part of the refactoring? The increased reviewability of small MRs that leads
to higher code quality is more important to us than having a minimal commit log. The smaller an MR is the more likely it
is it will be merged (quickly). After that you can send more MRs to enhance it.

If you would like quick feedback on your merge request feel free to mention someone from the OpsEng team.
Please ensure that your merge request meets the contribution acceptance criteria (see below).

When having your code reviewed and when reviewing merge requests please take the
[code review guidelines](code_review.md) into account.

## Contribution Acceptance Criteria

1. The change is as small as possible
2. Include proper tests and make all tests pass (unless it contains a test exposing a bug in existing code). Every new
class should have corresponding unit tests, even if the class is exercised at a higher level, such as a feature test
3. If you suspect a failing CI build is unrelated to your contribution, you may try and restart the failing CI job or
ask a developer to fix the aforementioned failing test
4. Your MR initially contains a single commit (please use `git rebase -i` to squash commits). However, changes after
submitting the merge request should not be squashed or rebased
5. Your changes can merge without problems (if not please rebase if you’re the only one working on your feature branch,
otherwise, merge master)
6. Does not break any existing functionality
7. Fixes one specific issue or implements one specific feature (do not combine things, send separate merge requests if
needed)
8. Keeps the code base clean and well structured
9. Contains functionality we think other users will benefit from too
10. Doesn’t add configuration options or settings options since they complicate making and testing future changes
11. Changes do not adversely degrade performance.
    * Avoid repeated polling of endpoints that require a significant amount of overhead
    * Avoid repeated access of filesystem
12. It conforms to the style guides (if applicable to the project) and the following:
    * If your change touches a line that does not follow the style, modify the entire line to follow it. This prevents
    linting tools from generating warnings
    * Don’t touch neighbouring lines. As an exception, automatic mass refactoring modifications may leave
    style non-compliant
13. If the merge request adds any new libraries (gems, JavaScript libraries, etc.), they should conform to our licensing guidelines (if applicable to the project)
14. The merge request meets the definition of done (see below)

## Definition of Done

If you contribute to OpsEng tools and services please know that changes involve more than just code. We have the
following definition of done. Please ensure that the feature you contribute through supports all of these steps.

1. Description explaining the relevancy
2. Working and clean code that is commented where needed
3. Unit, integration, and system tests that pass on the CI server
4. Black-box tests/end-to-end tests added if required
5. Performance/scalability implications have been considered, addressed, and tested
6. Documented appropriately
7. Changelog entry added, if necessary
8. Reviewed by project maintainers and any concerns are addressed
9. Merged by a project maintainer
10. Community questions answered

## Credits

Largely based on ["Contribute to GitLab. Merge requests."](https://docs.gitlab.com/ee/development/contributing/merge_request_workflow.html#merge-request-guidelines) by GitLab, Inc., licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
