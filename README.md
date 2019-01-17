pre-commit-docker-jenkinslint
========================

## What is this?

This provides a [pre-commit](http://pre-commit.com)
hook for jenkinslint via docker. It uses the [jflint](https://www.npmjs.com/package/jflint)
package to detect issues in your Jenkinsfile.

## How does this work?

`pre-commit` by convention mounts the user's code at `/src` inside the
container.  The executable is fed relative path filename arguments.  The hook
may make changes to the files as the source is mounted read-write and the
executables are run as the user.

The metadata in hooks.yaml hooks this up:

```yaml
    entry: jflint -j http://localhost -u admin -p $(cat /var/jenkins_home/secrets/initialAdminPassword)
    language: docker
```

Here `jflint` is the executable inside the container and we tell `pre-commit`
that the language is `docker`.


## How would I use this repository with pre-commit?

Add this to your `.pre-commit-config.yaml`:

```yaml
-   repo: https://github.com/askulkarni2/pre-commit-docker-jenkinslint
    rev: '0.0.1'  # Fill this in with a current revision
    hooks:
    -   id: docker-jenkinslint
```

You'll also need to use at least version 0.10.0 of pre-commit.