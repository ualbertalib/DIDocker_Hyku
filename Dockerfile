FROM ualibraries/ruby_plus2.3.3
RUN apt-get update -qq && \
    apt-get install -y libpq-dev nodejs libreoffice imagemagick unzip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /data
WORKDIR /data
ADD hyku/Gemfile /data/Gemfile
ADD hyku/Gemfile.lock /data/Gemfile.lock
RUN bundle install
ADD ./hyku /data
RUN bundle exec rake assets:precompile
RUN useradd solr -m
RUN mkdir /solr
RUN mkdir /fedora
RUN chown solr:solr  /solr
ADD files/start_solr.sh /usr/local/bin
ADD files/start_fedora.sh /usr/local/bin
ADD files/database.yml /data/config
ADD files/start_hyku.sh /usr/local/bin

EXPOSE 3000

