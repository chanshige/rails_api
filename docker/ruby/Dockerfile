FROM ruby:3.0.0-alpine3.12
ENV LANG C.UTF-8

RUN apk upgrade --update && \
  apk --no-cache add icu-dev \
  autoconf \
  make \
  g++ \
  gcc \
  libpng-dev \
  libzip-dev \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  postgresql-dev \
  tzdata \
  wget \
  unzip \
  git \
  build-base \
  curl-dev \
  sqlite-dev

WORKDIR /var/www

ADD ./www/Gemfile /var/www/Gemfile
ADD ./www/Gemfile.lock /var/www/Gemfile.lock

RUN gem update --system
RUN bundle install

RUN rm -rf /var/cache/apk/*
#RUN apk del autoconf make g++ gcc build-packages
