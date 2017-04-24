FROM ualibraries/ruby_plus2.3.3
RUN apt-get update -qq && \
    apt-get install -y libpq-dev \
                       nodejs \
                       libreoffice-core \
                       libreoffice-base-core \
                       libreoffice-common \
                       imagemagick\
                       unzip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /data
WORKDIR /data
ADD ./hyku /data
RUN bundle install
RUN bundle exec rake assets:precompile
ADD files/start_hyku.sh /usr/local/bin
ADD files/production.yml /data/config/settings
#ADD files/database.yml /data/config

EXPOSE 3000

