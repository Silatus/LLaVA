#!/usr/bin/env bash

CONTROLLER_HOST="${CONTROLLER_HOST:-llava-controller-service}"
WORKER_HOST="${WORKER_HOST:-llava-worker-service}"

if [[ "$MODE" == "controller" ]]; then
    python -m llava.serve.controller --host 0.0.0.0 --port 52345
elif [[ "$MODE" == "model_worker" ]]; then
    python -m llava.serve.model_worker --host 0.0.0.0 --controller http://$CONTROLLER_HOST:52345 --port 57890 --worker http://$WORKER_HOST:57890 --model-path liuhaotian/llava-v1.5-13b --load-4bit
else
    echo "Invalid mode. Set MODE=controller or MODE=model_worker."
    exit 1
fi
