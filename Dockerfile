FROM ubuntu

ENV TERRAFORM_VERSION 0.15.1

RUN apt-get update && apt-get install -y wget ca-certificates unzip git bash && \
    wget -q -O /terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /terraform.zip -d /bin && \
    apt-get remove --purge -y wget ca-certificates unzip && \
    rm -rf /var/cache/apt/* /terraform.zip

WORKDIR /data

ENTRYPOINT ["/bin/terraform"]

CMD ["version"]