# Hello

## Getting Started with the app

- Build the docker image: `make build`
- Run the docker container: `make run`

Test the application `http://localhost:4000/api/hello`

- Tag the image: `make tag`
- Push the image: `make push`

## Getting Started with ECS

- Create a cluster: `make cluster`
- Create a task definition: `make task-definition`
- Create a service: `make service`
- Create the ecs instance role: `make ecs-instance-role`
- Launch the EC2 instance associated with the cluster: `make launch-instance`
