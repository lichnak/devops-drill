# Fix the several commits behind

## Fix only remote repository branch which is behind commit

Example: Both branches are on the remote side

- ahead === Master branch
- behind === Develop branch

Solution:

1. Clone the repository to the local workspace: this will give you the Master branch, which is ahead with commit

    ```bash
    git clone repositoryUrl
    ```

2. Create a branch with Develop name and checkout to that branch locally

    ```bash
    git checkout -b DevelopBranchName // this command creates and checkout the branch
    ```

3. Pull from the remote Develop branch. Conflict might occur. if so, fix the conflict and commit the changes.

    ```bash
    git pull origin DevelopBranchName
    ```

4. Merge the local Develop branch with the remote Develop branch

    ```bash
    git merge origin develop
    ```

5. Push the merged branch to the remote Develop branch

    ```bash
    git push origin develop
    ```

## Local Master branch is behind the remote Master branch

This means every locally created branch is behind.

Before preceding, you have to commit or stash all the changes you made on the branch behind commits.

Solution:

1. Checkout your local Master branch

    ```bash
    git checkout master
    ```

2. Pull from remote Master branch

    ```bash
    git pull origin master
    ```

3. Now your local Master is in sync with the remote branch. As a result of the above command, other local branches branched from the previous local Master branch are not in sync. To fix that:

4. Checkout the branch that is behind your local Master branch

    ```bash
    git checkout BranchNameBehindCommit
    ```

5. Merge with the local Master branch

    ```bash
    git merge master  // Now your branch is in sync with the local Master branch
    ```

6. If this branch is on the remote repository, you have to push your changes.

    ```bash
    git push origin branchBehindCommit
    ```
