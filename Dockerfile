FROM ruby:2.6.2

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
  && rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT

