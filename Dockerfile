FROM mcr.microsoft.com/dotnet/core/sdk:3.1

LABEL "com.github.actions.name"="Lambda deployment"
LABEL "com.github.actions.description"="Deploy lambda to s3"
LABEL "com.github.actions.icon"="play-circle"
LABEL "com.github.actions.color"="purple"
LABEL "maintainer"="David B, CH <support@resqme.io>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      groff \
      jq \
      python \
      python3-pip \
      python3-setuptools \
      zip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install awscli

RUN dotnet tool install -g Amazon.Lambda.Tools

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
