FROM arm64v8/debian
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /remote

# Install dependencies
RUN apt-get update && apt-get install -y \
    git-core \
    git \
    cron \
    build-essential \
    gcc \
    wget \
    libc6:arm64 \
    libstdc++6:arm64\
    apache2 \
    php \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ADD WiringPi /remote/WiringPi
RUN dpkg -i /remote/WiringPi/debian-template/wiringpi_3.14_arm64.deb

ADD remote /remote/raspberry-remote
ADD cron /remote/cron
ADD webinterface /var/www/html/

RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /remote/cron/send433.sh

RUN chmod 755 /remote/raspberry-remote/daemon
RUN chmod 755 /remote/raspberry-remote/send
RUN rm -f /var/www/html/index.html

# Add the cron job
RUN crontab -l | { cat; echo "*/5 * * * * bash /remote/cron/send433.sh"; } | crontab -

EXPOSE 80/tcp

VOLUME /remote

CMD ( cron -l 8 & ) && apachectl -D FOREGROUND
