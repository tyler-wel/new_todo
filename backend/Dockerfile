FROM ruby:2.6

RUN apt-get update -qq && \
    apt-get install -y nodejs \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    gem update

ENV APP /usr/src/app
RUN mkdir $APP
WORKDIR $APP

COPY Gemfile $APP/Gemfile
COPY Gemfile.lock $APP/Gemfile.lock
RUN bundle install

COPY . $APP/

#Add script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 8000
CMD ["rails", "server", "-b", "0.0.0.0"]