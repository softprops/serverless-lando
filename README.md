# serverless lando template

A sample template for bootstraping lando applications with serverless framework

## install

Install the [serverless framework](https://serverless.com/framework/).

Then then run the following

```bash
$ serverless install \
  --url https://github.com/softprops/serverless-lando \
  --name my-new-service
```

Assumming you have aws credentials with appropriate deployment permissions configured
in a profile named "prod". Ideally you could impress your friends by creating a project
that is _born_ in production.

```
$ serverless install \
  --url https://github.com/softprops/serverless-lando \
  --name my-new-service \
  && cd my-new-service \
  && AWS_PROFILE=prod make dependencies deploy
```