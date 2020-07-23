FROM alpine:latest

ENV DB_DATA_PATH="/var/lib/mysql" \
    DB_ROOT_PASS="mariadb_root_password" \
    DB_NAME="sampledb" \
    DB_USER="mariadb_user" \
    DB_PASS="mariadb_user_password"

RUN apk --no-cache update \
    && apk --no-cache add openrc mariadb mariadb-client tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo "Asia/Tokyo" > /etc/timezone \
    && apk del tzdata \
    && sed -i 's/#rc_sys=""/rc_sys="lxc"/g' /etc/rc.conf \
    && echo 'rc_provide="loopback net"' >> /etc/rc.conf \
    && sed -i 's/^#\(rc_logger="YES"\)$/\1/' /etc/rc.conf \
    && sed -i '/tty/d' /etc/inittab \
    && sed -i 's/hostname $opts/# hostname $opts/g' /etc/init.d/hostname \
    && sed -i 's/mount -t tmpfs/# mount -t tmpfs/g' /lib/rc/sh/init.sh \
    && sed -i 's/cgroup_add_service /# cgroup_add_service /g' /lib/rc/sh/openrc-run.sh \
    && rc-status \
    && touch /run/openrc/softlevel \
    && sed -i 's/^skip-networking/skip-networking = 0\nskip-bind-address\nskip-name-resolve\nport = 3306\ncharacter-set-server = utf8/g' /etc/my.cnf.d/mariadb-server.cnf

COPY entrypoint.sh /root/entrypoint.sh

ENTRYPOINT /bin/sh /root/entrypoint.sh
EXPOSE 3306
