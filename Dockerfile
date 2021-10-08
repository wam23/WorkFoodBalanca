FROM ruby

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential libpq-dev nodejs vim

ENV RAILS_ROOT /home/wfb2/WFB2/

RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

# Download Node and Yarn

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install Node.js and Yarn
RUN apt-get update && apt-get install -y nodejs yarn

# This is because I get an error in testing stating that the yarn file is not 
# up-to-date, though it still says that after running this so I have to turn off the
# integrity check.

RUN yarn install --check-files

RUN gem update --system

ENV PORT 3000

EXPOSE $PORT

RUN gem install rails bundler
RUN gem install rails
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

COPY WFB2/Gemfile ./
COPY WFB2/Gemfile.lock ./
# Installs the Gem File.
RUN bundle install

COPY WFB2/. .

ENTRYPOINT [ "/bin/bash" ]
#CMD ["rails", "server", "-b", "0.0.0.0"]