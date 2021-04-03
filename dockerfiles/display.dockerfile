# FROM balenalib/intel-nuc-debian:buster
FROM balenalib/intel-nuc-debian:stretch-run

ENV APP_NAME=display
ENV CARMA_MESSENGER_RELEASE=carma-system-3.4.3
ENV OVERRIDES_BASE_DIR=applications/${CARMA_MESSENGER_RELEASE}/${APP_NAME}/

ENV UDEV=1

ENV URL="http://127.0.0.1"


# Install desktop environment
# RUN install_packages xserver-xorg-core \
#    xinit lxsession desktop-file-utils \
#    matchbox-keyboard firefox-esr

RUN apt-get update && \
    apt-get install -y \
        xserver-xorg=1:7.7+19 \
        xserver-xorg-input-evdev \
        xserver-xorg-core \
        x11-xserver-utils \
        xinit \
        xfce4 \
        lxsession \
        desktop-file-utils \
        matchbox-keyboard \
        dbus-x11 \
        libgl1-mesa-dri \
        firefox-esr


# disable lxpolkit popup warning
RUN mv /usr/bin/lxpolkit /usr/bin/lxpolkit.bak

# RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
#  && echo "" >> /etc/X11/xinit/xserverrc \
#  && echo 'exec /usr/bin/X -nocursor -s 0 dpms -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo "" >> /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -s 0 -dpms -nolisten tcp "$@"' >> /etc/X11/xinit/xserverrc

# Setting working directory
WORKDIR /usr/src/app

COPY ${OVERRIDES_BASE_DIR}/start.sh start.sh

# Adding things to autostart will cause them to be launchd automatically on starup
COPY ${OVERRIDES_BASE_DIR}/autostart /etc/xdg/lxsession/LXDE-pi/autostart

COPY ${OVERRIDES_BASE_DIR}/policies.json /usr/lib/firefox-esr/distribution/

CMD ["bash", "start.sh"]
