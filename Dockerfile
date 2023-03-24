FROM ruby:3-alpine
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV LIB_PATH /var/fhir_client

RUN apk add --update --no-cache make gcc g++ git libc-dev && \
    gem update --system && gem install bundler

WORKDIR $LIB_PATH

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]