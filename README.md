# serverless lando template

A sample template for bootstraping [lando](https://github.com/softprops/lando) applications with ⚡ serverless framework ⚡

## 📦 install

Install the [serverless framework](https://serverless.com/framework/) cli.

Then then run the following in your terminal

```bash
$ serverless install \
  --url https://github.com/softprops/serverless-lando \
  --name my-new-service
```

This will download the source of a sample lando application and unpack it as a new service named
"my-new-service" in a directory called "my-new-service"


## 🧙 how to be a wizard

Assumming you have aws credentials with appropriate deployment permissions configured
in a profile named "prod", you could impress your friends by creating a project
that is _born_ in production.

```bash
$ serverless install \
  --url https://github.com/softprops/serverless-lando \
  --name my-new-service \
  && cd my-new-service \
  && AWS_PROFILE=prod make dependencies deploy
```

`make dependencies` will make sure npm dependencies are installed locally, this only needs run once.
The first time you run `make deploy` it will pull down and compile the base set
of rustlang dependencies and your application. Unless the dependencies change afterwards,
this should only happen once, resulting in an our of the box rabbit deployment
cycle.

## 👴 retiring

Experimentation will likely facilitate retiring ideas. Retiring applications should be as easy as creating and deploying them them. This project provides
 a dual to `make deploy` for doing so: `make destroy`

```bash
$ AWS_PROFILE=prod make destroy
```