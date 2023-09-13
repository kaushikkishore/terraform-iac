### You can create your own module. And later you can use in your code.

Beenefits of creating and using a module is `DRY` principles. This will help to have proper codebase with correct set of guidelines.

You can specify variables in module and that can be overriden by the end user who is using it.

There are standard module which is provided by the different cloud providers like `AWS`, `GCP`, `AZURE` you can look at terraform registry to get standard module and you can customise based on your needs.

> Note - Use local variables in case when you do not want to expose the variables to user and to keep the `DRY` up.

### Workspcae

You can create multiple workspace and then you can define a map to be used by the workspace. That will help you to get the better variables usage and then switch to workspace where you are.
