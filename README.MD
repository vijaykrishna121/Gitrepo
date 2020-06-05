How to Install Git Flow on Mac OS X

https://steemit.com/git/@tomas-petrauskas/how-to-install-git-flow-on-a-mac-os-x

Our team started using Gitflow Workflow few months back and we are so much happy to finally have an awesome branching model for project releases.

Another reason to use Gitflow Workflow is that GitVersion automatically generates version numbers for builds from branches for CI/CD tools.

Installation

Since GitFlow is not integrated in the default Git application for Mac, so we need to install it separately.

Install Brew (if you don't already have it installed)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Install git-flow
brew install git-flow

Start using git-flow by initializing it inside an existing git repository:

#git flow init

You'll have to answer a few questions regarding the naming conventions for your branches.
It's recommended to use the default values.

How it works

https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow


Develop and Master Branches
Instead of a single master branch, this workflow uses two branches to record the history of the project. The master branch stores the official release history, and the develop branch serves as an integration branch for features. It's also convenient to tag all commits in the master branch with a version number.

The first step is to complement the default master with a develop branch. A simple way to do this is for one developer to create an empty develop branch locally and push it to the server:

#git branch develop
#git push -u origin develop


