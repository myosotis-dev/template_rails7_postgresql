FROM ruby:3.3.5-slim-bullseye

WORKDIR /opt/app

RUN \

# install apt package.
	apt-get update \
	&& apt-get install -y \
		build-essential \
		curl \

		# for sqlite
		# libsqlite3-dev \

		# for postgresql
		libpq-dev \

		# when creating rails project.
		git \

# clear apt cache.
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* \

# add alias
	&& echo "gem: --no-document" >> ~/.gemrc \
	&& echo "alias ll='ls -la'" >> ~/.bashrc \

# install rails / bundler
	&& which gem \
	&& gem install rails -v 7.0.4 \
	&& gem install bundler -v 2.4.12 \
	&& rails -v

COPY ./ /opt/app/

RUN bundle install

EXPOSE 3000

ENTRYPOINT ["sh", "entrypoint.sh"]
