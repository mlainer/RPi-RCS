FROM navikey/raspbian-bullseye
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    git-core \
    cron \
    build-essential \
    gcc \
    wget \
    libc6:armhf \
    libstdc++6:armhf\
    apache2 \
    php7.4 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://project-downloads.drogon.net/wiringpi-latest.deb 
RUN sudo dpkg -i wiringpi-latest.deb

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

# Define working directory
WORKDIR /remote
VOLUME /remote
CMD ( cron -l 8 & ) && apachectl -D FOREGROUND
