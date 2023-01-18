FROM ruby:3.1.2
ARG ROOT="/api"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update
RUN apt-get install -y build-essential \
  libpq-dev \
  sudo

WORKDIR ${ROOT}

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN gem install bundler
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
