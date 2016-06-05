PROJECT = hello
IMAGE = nsarno/$(PROJECT)
PORT = 4000
TAG = v1

$(PROJECT): build run

build:
	docker build -t $(IMAGE) .

run:
	docker run -p $(PORT):4000 --rm -it $(IMAGE)

console:
	docker run -p $(PORT):4000 --rm -it $(IMAGE) iex -S mix phoenix.server

tag: 
	docker tag $(IMAGE) $(IMAGE):$(TAG)

push:
	docker push $(IMAGE)

log-group:
	aws logs create-log-group \
		--log-group-name awslogs-hello \
		--region us-east-1

cluster:
	aws ecs create-cluster \
		--cli-input-json file://aws_config/cluster_definition.json

task-definition:
	aws ecs register-task-definition \
		--cli-input-json file://aws_config/task_definition.json

service:
	aws ecs create-service \
		--cli-input-json file://aws_config/service_definition.json

ecs-instance-role:
	aws iam create-role \
		--role-name ecsInstanceRole \
		--assume-role-policy-document file://aws_config/ecs_policy.json

launch-instance:
	aws ec2 run-instances \
		--cli-input-json file://aws_config/ec2_instance_definition.json \
		--user-data file://aws_config/instance_user_data.json

cw-policy:
	aws iam create-policy \
		--policy-name ECS-CloudWatchLogs \
		--policy-document file://aws_config/cw_policy.json

attach-cw-role-policy:
	aws iam attach-role-policy \
		--role-name ecsInstanceRole \
		--policy-arn arn:aws:iam::290114975187:policy/ECS-CloudWatchLogs
