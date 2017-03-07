FROM ubuntu:xenial
MAINTAINER Like Ma <likemartinma@gmail.com>

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y --no-install-recommends sudo sshpass ruby \
		glusterfs-client nodejs-legacy \
		ruby-dev npm git make g++ libsqlite3-dev && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* && \
    npm install -g bower && \
	echo "gem: --no-rdoc --no-ri" > ~/.gemrc && \
	gem install bundler && \
	git clone https://github.com/oss2016summer/gluster-web-interface.git /gluster-web

WORKDIR /gluster-web

RUN bower install --allow-root && \
	bundle install && \
	bin/rake db:migrate && \
	rm -rf Gemfile.* ~/.gem ~/.bundle /usr/lib/ruby/gems/2.3.0/cache && \
	apt-get remove --purge -y ruby-dev npm git make g++ libsqlite3-dev && \
	apt-get autoremove --purge -y

COPY entrypoint /
EXPOSE 3000
ENTRYPOINT ["/entrypoint"]
