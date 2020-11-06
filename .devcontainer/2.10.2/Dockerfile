
FROM ubuntu:focal

ARG USER_NAME=ansible
ARG USER_UID=110
ARG USER_GID=110

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt update -y && \
    apt install -y python3 \
    python3-pip \
    sshpass \
    git \
    libssl-dev \
    curl \
    unzip \
    apt-utils \
    software-properties-common \
    sudo

#RUN useradd -s /bin/bash --uid ${USER_UID} --gid ${USER_GID} -m ${USER_NAME}
    

RUN curl https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip > /tmp/terraform.zip && \
    unzip -q /tmp/terraform.zip -d /bin/ && \
    /bin/terraform --version

    # Install Docker CE CLI. 
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
    && apt-get update \
    && apt-get install -y docker-ce-cli

RUN pip3 install \
    setuptools \
    molecule \
    ansible==2.10.2 \
    # Docker Support
    docker \
    # VMWare support
    PyVmomi \
    # Azure Support
    azure-mgmt-compute \
    azure-mgmt-storage \
    azure-mgmt-resource \
    azure-keyvault-secrets \
    azure-storage-blob \
    # AWS Support
    boto \
    boto3 \
    botocore 

VOLUME [ "/var/run/docker.sock", '/workspace/']

CMD [ "sleep", "infinity" ]
