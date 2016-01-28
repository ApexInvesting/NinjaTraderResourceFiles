# NinjaTraderResourceFiles

Order of the branches are: 

Alpha, Cloud, PreBeta, Beta, Master.

When making a change, make the change in alpha. After committing, merge the changes into the "downstream" branches.

git checkout alpha
// make changes and commit, then:

// merge into the other branches (only the branches that should have the changes)
git checkout cloud
git merge alpha
git checkout prebeta
git merge alpha
git checkout beta
git merge alpha

// notice I didn't merge the changes into master, because in this 
// imaginary scenario, master is not ready for the changes.

// then push all branches
git push --all origin
