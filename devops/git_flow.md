# Git Workflow Model at Operations Engineering

## Purpose of This Document

At Operations Engineering, we define common engineering practices so that maintainers and contributors can develop tools
 and services efficiently and know what to expect from each other. 

One of these practices is the use of an efficient Git workflow. Such a workflow should be clearly defined and provide:

 * Seamless integration into the software development lifecycle
 * Easy issue tracking 
 * Productive cross-functional team collaboration
 * Support for the best DevOps practices
 
In this document, we'll review existing Git workflow models and explain why we've chosen the GitLab model.

## What's Out There

There are few Git workflow models widely accepted and used by the industry:
* [Git-Flow](http://nvie.com/posts/a-successful-git-branching-model/)
* [GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html) 
* [GitLab Flow](https://docs.gitlab.com/ee/workflow/gitlab_flow.html)
* Gerrit Flow

### Git-Flow

Git flow was one of the first proposals to use git branches and it has gotten a lot of attention. It advocates a `master` 
branch and a separate `develop` branch as well as supporting branches for features, releases, and hotfixes. The development
 happens on the `develop` branch, moves to a `release` branch and is finally merged into the `master` branch. Git flow is a 
 well-defined standard but its complexity introduces some challenges.

### GitHub Flow

As an attempt to address the challenges of Git-Flow a simpler alternative was detailed, GitHub Flow. This flow has only 
feature branches and a `master` branch. This is very simple and clean, many organizations have adopted it with great 
success. But this flow still leaves a lot of questions unanswered regarding deployments, environments, releases, and 
integrations with issues.

### GitLab Flow

GitLab Flow is a flow developed at GitLab, Inc. as an alternative to Git-Flow and GitHub Flow. GitLab Flow is, 
in a sense, an extension to GitHub Flow with a focus on supporting generic software development process and best DevOps 
practices. 

Read more about GitLab Flow, its base principles and differences between Git-Flow and GitHub Flow 
[here](https://docs.gitlab.com/ee/workflow/gitlab_flow.html).
 
## Why GitLab Flow and Why GitLab Workflow

GitLab is a platform that helps teams to go seamlessly through software development steps. From ideation and development to deployment and analysis, most of it can be done using GitLab only.

Considering the fact that GitLab provides not only a suitable Git workflow model but a platform that helps teams to go 
seamlessly through software development steps, we propose to adopt:
 * GitLab Flow as the main Git workflow model at OpsEnd
 * GitLab Workflow as a base workflow for software development cycle at OpsEnd  

The GitLab Workflow takes into account the GitLab Flow, which consists of Git-based methods and tactics for version management, such as branching strategy, Git best practices, and so on.

## How GtiLab Workflow Rocks

The natural course of the software development process passes through 10 major steps; GitLab has built solutions for all of them:

**IDEA** Every new proposal starts with an idea, which usually comes up in a chat. For this stage, GitLab integrates with [Mattermost](https://about.gitlab.com/2015/08/18/gitlab-loves-mattermost/).

**ISSUE** The most effective way to discuss an idea is creating an issue for it. Your team and your collaborators can help you to polish and improve it in the [issue tracker](https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-issue-tracker).

**PLAN** Once the discussion comes to an agreement, it's time to code. But wait! First, we need to prioritize and organize our workflow. For this, we can use the [Issue Board](https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-issue-board).

**CODE** Now we're ready to write our code, once we have everything organized.

**COMMIT** Once we're happy with our draft, we can commit our code to a feature-branch with version control.

**TEST** With [GitLab CI](https://about.gitlab.com/gitlab-ci/), we can run our scripts to build and test our application.

**REVIEW** Once our script works and our tests and builds succeeds, we are ready to get our [code reviewed](https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#gitlab-code-review) and approved.

**STAGING** Now it's time to [deploy our code to a staging environment](https://about.gitlab.com/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/) to check if everything worked as we were expecting or if we still need adjustments.

**PRODUCTION** When we have everything working as it should, it's time to [deploy to our production environment](https://about.gitlab.com/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/)!

**FEEDBACK** Now it's time to look back and check what stage of our work needs improvement. We use [Cycle Analytics](https://about.gitlab.com/product/cycle-analytics/) for feedback on the time we spent on key stages of our process.

To walk through these stages smoothly, it's important to have powerful tools to support this workflow. In the following sections, you'll find an overview of the toolset available from GitLab.

For a more detailed overview go [here](https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/#conclusions)

## GitLab WorkFlow Use-Case Scenario

To wrap-up, let's put everything together. It's easy!

Let's suppose you work in a team using one of the SRE automation tools. You created a new issue for developing a new feature to be implemented in one of your applications.

*Labels Strategy*

For this application, you already have created labels for "discussion", "backend", "frontend", "working on", "staging", 
"ready", "docs", "marketing", and "production." All of them already have their own lists in the Issue Board. Your issue 
currently has the label "discussion."

After the discussion in the issue tracker you came to an agreement, your backend team started to work on that issue, so 
their lead moved the issue from the list "discussion" to the list "backend." The first developer to start writing the 
code assigned the issue to him/herself, and added the label "working on."

*Code & Commit*

In his/hers first commit message, he/she referenced the issue number. After some work, he/she pushed his commits to a 
temporary feature-branch and created a new merge request, including the issue closing pattern in the MR description. 
His/Hers team reviewed the code and made sure all the tests and builds were passing.

*Using the Issue Board*

Once the backend team finished their work, they removed the label "working on" and moved the issue from the list 
"backend" to "frontend" in the Issue Board. So, the frontend team knew that the issue was ready for them.

*Deploying to Staging*

When a frontend developer started working on that issue, he/she added back the label "working on" and reassigned the 
issue to him/herself. When ready, the implementation was deployed to a staging environment. The label "working on" was 
removed and the issue card was moved to the "staging" list in the Issue Board.

*Teamwork*

Finally, when the implementation succeeded, your team moved it to the list "ready."

Then, the time came for your technical writing team to create the documentation for the new feature, and once someone 
got started, he/she added the label "docs." At the same time, your marketing team started to work on the campaign to 
launch and promote that feature, so someone added the label "marketing." When the tech writer finished the 
documentation, he/she removed the label "docs." Once the marketing team finished their work, they moved the issue from 
the list "marketing" to "production."

*Deploying to Production*

At last, you, being the person responsible for new releases, merged the MR and deployed the new feature into the 
production environment and the issue was closed.

*Feedback*

With Cycle Analytics, you studied the time taken to go from idea to production with your team and opened another issue 
to discuss the improvement of the process.

## A Short Demo

![A short demo video](media/gitlab_short_demo.mp4)

##  Conclusion

Even though GitLab at HERE is still in the proof of a concept stage (as of Dec 2018), it's worth considering as the best 
 platform for software development at Operations Engineering. Because GitLab is an efficient and simple tool for teams 
 to get faster from idea to production using a single platform.


- - - -

This material uses excerpts from ["GitLab Workflow: An Overview"](https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/) by GitLab, Inc. which is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
