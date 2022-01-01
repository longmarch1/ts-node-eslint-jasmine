# ts-node-eslint-jasmine

Script to Set Up Repo with ts, node, eslint and jasmine
You should only need run it once for your repo.

Set up repo config is time-consuming and this script is helping you set up a typescript probject repo with minimal config work.

It does the following for you:

- add ```.editorconfig```
- add ```.gitignore```
- add ```.eslintrc```
- add ```jasmine.json```
- install typescript
- install eslint
- install jasmine
- add ```example.ts``` and ```spec/example.t.ts```

## Instruction

- copy ```gen-config.sh``` to your local repo root
- run ```./gen-config.sh```
- follow the instruction to copy test script to package.json
- run ```npm test``` to see test result
