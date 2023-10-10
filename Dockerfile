FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/pytorch-inference:2.0.1-gpu-py310-cu118-ubuntu20.04-ec2

WORKDIR /var/inference

COPY ./llava ./llava

RUN pip install --upgrade pip
RUN pip install -e .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
