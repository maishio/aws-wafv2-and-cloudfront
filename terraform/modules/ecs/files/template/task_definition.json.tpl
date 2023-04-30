[
    {
        "name": "api",
        "image": "${REPOSITORY_URL}:latest",
        "command": [
            "/usr/local/bin/uvicorn", "fastapi_demo.main:app", "--host", "0.0.0.0"
        ],
        "cpu": 0,
        "essential": true,
        "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                "awslogs-group": "/aws/ecs/${SERVICE}-${ENV}-api",
                "awslogs-region": "${REGION}",
                "awslogs-create-group": "true",
                "awslogs-stream-prefix": "ecs"
            }
        },
        "mountPoints": [],
        "portMappings": [
            {
                "hostPort": 8000,
                "protocol": "tcp",
                "containerPort": 8000
            }
        ],
        "environmentFiles": [],
        "environment": [],
        "secrets": [],
        "volumesFrom": []
    }
]
