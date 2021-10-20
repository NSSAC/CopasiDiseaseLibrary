# dismolib: Copasi Disease Library
Repo for storing developed copasi models for infectious diseases with the reference papers (loaded in the folder ReferenceLit).

Copasi files are coded as: '{disease name}_ {author of reference paper}_ {year of reference paper's publication}.cps'
Papers on which the codes are based can be found in the 'ReferenceLit' directory.
                                                                             
Documentation may be found at https://www.overleaf.com/read/tsyhztjmhdfv

## Development and Deployment of the ShinyCOPASI Web Application
Currently changes pushed to the 'test' branch will trigger a rebuild of the Docker container, and deployment
of the updated site (currenly [dismolib.uvadcos.io](http://dismolib.uvadcos.io/)). So a good workflow might be . . .

```bash
git checkout main # in case you aren't already on 'main'
# Do some development
git add . . .
git commit . . .
git pull --rebase && git push # pull in others' updates, add yours to the tip of those, immediately push (hopefully) before other push new updates

# When you are ready to deploy . . .
git checkout test # should pull 'test' from github, and start tracking it locally, if you don't already have it
git pull # to pull in changes from GitHub, if you've already gotten this branch, previously
git rebase main
git push
git checkout main # to make sure you're back on the branch you will want to develop on, next time
```
