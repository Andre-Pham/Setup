# Useful Git Commands

## Un-Commit

This is when you've pressed commit but haven't pushed.

```
$ git reset --soft HEAD~1
```

Source: https://stackoverflow.com/a/70972183

If you want to go back two commits:

```
$ git reset --soft HEAD~2
```

## Pushed to Wrong Branch

This is when you've pushed to a branch but it was the wrong one.

#### Step 1:

```
$ git reset --soft HEAD~1 && git stash save "wrong branch" && git push origin +HEAD
```

`HEAD~1` can be replaced with the commit you want to go back to instead, e.g. `884ffb1464d6c6865afe449078a90886b51de2fd`.

#### Step 2:

Switch to the correct branch.

#### Step 3:

Restore the stash called "wrong branch" and push your changes there. You can have multiple stashes with the same name, so don't worry about that.

#### Explanation

Go to the previous commit in the timeline (branch graph) and have your changes that you made since that commit in your stash:

```
$ git reset --soft HEAD~1
```

Then stash your changes into a new stash called "wrong branch":

```
$ git stash save "wrong branch"
```

Then force push. Since you're in the previous commit with all your changes removed (stashed), you'll be force pushing to a previous commit, erasing the existence of any subsequent commits.

```
$ git push origin +HEAD
```

Then you can switch to the correct branch and restore your stash.

## Stage Undo of Previous Commit

This will undo all the changes from the previous commit, but stage it as a new commit, as if you went through all the changes made in the previous commit and edited the text files to be exactly like it. 

E.g. if I committed “hello world" to a file, this command would add changes to my file that remove “hello world" from that file.

```
$ git revert HEAD
```

## Undo Merge

I just merged master into my branch and got a lot of merge conflicts. I want to undo this action.

To revert your branch to the state it was in before the merge:

```
$ git merge --abort
```

## Create New Branch with Specific Commits

> Here’s the scenario: I have a master branch. I created a branch “branch A” and made changes. I made a branch off branch A “branch B” and made some changes. I merged branch A into master. I want to create a new branch “branch C” off master, and only apply the changes from the commits on branch B.

Create a new branch off master `branch-c`

If you want to cherry pick specific commits, run for each commit:

```
$ git cherry-pick <commit-hash>
```

If you want to cherry pick a range of commits:

```
$ git cherry-pick <starting-commit>^..<ending-commit>
```

Resolve the conflicts (if any) and push.
