FROM openjdk:8
COPY ./credhub /usr/src/credhub
COPY ./setup_dev_mtls.sh /usr/src/credhub/setup_dev_mtls.sh
COPY ./fetch-version.sh /usr/src/credhub/fetch-version.sh
COPY ./credhub-acceptance-tests /usr/src/acceptance/src/github.com/cloudfoundry-incubator/credhub-acceptance-tests
ENV GOPATH /usr/src/acceptance
WORKDIR /usr/src/credhub

RUN "./setup_dev_mtls.sh"
RUN ["./gradlew", "--no-daemon", "assemble"]

COPY ./entrypoint.sh /usr/src/credhub/entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
