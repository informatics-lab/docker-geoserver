FROM java:8

ENV GS_VERSION 2.9.1
ENV GEOSERVER_HOME /usr/share/geoserver/geoserver-${GS_VERSION}

RUN mkdir -p /tmp/resources/ \
    && wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/geoserver-${GS_VERSION}-bin.zip \
        -O /tmp/resources/geoserver.zip \
    && unzip /tmp/resources/geoserver.zip -d /usr/share/geoserver \
    && echo "export GEOSERVER_HOME=/usr/share/geoserver/geoserver-${GS_VERSION}/" >> ~/.profile \
    && mv ${GEOSERVER_HOME}/data_dir ${GEOSERVER_HOME}/data_dir_old
# Delete resources after installation
RUN rm -rf /tmp/resources

WORKDIR ${GEOSERVER_HOME}/bin


CMD ["/bin/sh", "startup.sh"]