FROM ruby:3.2-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /site

COPY Gemfile* ./
RUN bundle install

EXPOSE 4001 35730

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "4001", "--livereload"]
