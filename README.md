# gitscrips - Simple scripts for simple workflow

This scripts are for working using branchs and merge changes in master, usefull to avoid common problems.
The script are on test state but usually work as intended.
I recommend using alias or add this cloned repo path to system variable PATH.
So you can use as follow in your git local repos.
Usual Workflow:

# new "BranchName"

- First use new,this will update master from origin,make new branch named BranchName based on master and finally checkout that branch.

# save "Commit message"

- Work on that branch and use save, this will add changed files, commit and them push current branch to origin. If there are changes in remote, it will trigger a merge from origin an them push.

# end "BranchName"

- When you end your branch, use end to merge changes to master and delete branch. If there are changes in remote master, it will trigger a merge from origin an them push.

# More:

- There are other usefull scripts:

  - reset "BranchName" // Reset Branch to last commit on origin
  - push "BranchName" // Simple push from that branch to origin
  - see // To see all branches in local and remote
  - reformat // format js using prettier // install using: npm install --global prettier
  
- Im working to add more usefull scripts to automate usual working flows, and add fail exceptions
