
FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt update -y && \
    apt install -y python3 \
    python3-pip \
    sshpass \
    git \
    libssl-dev \
    curl \
    unzip

RUN curl https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip > /tmp/terraform.zip && \
    unzip -q /tmp/terraform.zip -d /bin/ && \
    /bin/terraform --version

#RUN /bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
#    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && \
#    apt install -y docker \
#    apt-transport-https \
#    ca-certificates \
#    curl \ 
#    software-properties-common \
#    docker-ce

RUN pip3 install virtualenv

RUN mkdir /workspace && \
    cd /workspace && \
    virtualenv /workspace

RUN pip3 install \
    setuptools \
    molecule \
    ansible \
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
