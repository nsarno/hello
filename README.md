# Hello

## Getting Started with the app

- Build the docker image: `make build`
- Run the docker container: `make run`

Test the application `http://localhost:4000/api/hello`

## Continuous deploy

Pushing to `master` will trigger the buildkite pipeline reponsible to build image, run the tests and
push the image to Docker Hub.

TODO: Setup continuous deployment from Docker Hub to Docker Cloud

## Manual deploy

- Tag the image: `make tag`
- Push the image: `make push`
