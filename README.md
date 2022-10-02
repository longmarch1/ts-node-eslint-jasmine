# ts-node-eslint-jasmine

Script to Set Up Repo with ts, node, eslint and jasmine
You should only need run it once for your repo.

Set up repo config is time-consuming and this script is helping you set up a typescript probject repo with minimal config work.

It does the following:

-   add `.editorconfig`
-   add `.gitignore`
-   add `.eslintrc`
-   add `spec/support/jasmine.json`
-   add `spect/helpers/console_reporter_helper.js`
-   add `example.ts` and `spec/example.t.ts`
-   add `package.json`
-   install all packages

## Instruction

-   copy `gen-config.sh` to your local repo root
-   run `./gen-config.sh`
-   run `npm test` to see the test result
