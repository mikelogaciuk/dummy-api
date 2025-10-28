FROM ruby:3.4-alpine3.22

RUN apk add --no-cache build-base bash git curl jq tzdata && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle install --jobs 4 --retry 3 --without development test

COPY . ./

EXPOSE 4567

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN chown -R appuser:appgroup /app
USER appuser

RUN ls -la

ENTRYPOINT [ "rake", "run" ]