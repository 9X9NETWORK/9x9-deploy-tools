
APACHE_CONF_D=/etc/apache2/conf.d/

RPROXY_CONF= \
	rproxy.android.conf \
	rproxy.chromecast.conf \
	rproxy.cms.conf \
	rproxy.corp.conf \
	rproxy.geoip.conf \
	rproxy.ios.conf \
	rproxy.jetty.conf \
	rproxy.player50.conf

APPS_CONF= \
	apps.9x9.conf \
	apps.cts.conf \
	apps.ddtv.conf \
	apps.fcu.conf \
	apps.goodtv.conf \
	apps.tzuchi40.conf

BEAGLE_CONF= \
	rproxy.ytcrawler.conf \
	rproxy.apidocs.conf

DEV_CONF= \
	rproxy.cms.conf \
	rproxy.jetty.conf \
	rproxy.player50.conf

# production conf is default
rproxy: ${APPS_CONF} ${RPROXY_CONF} rproxy.head rproxy.tail
	cat rproxy.head    >  rproxy
	cat ${RPROXY_CONF} >> rproxy
	cat ${APPS_CONF}   >> rproxy
	cat rproxy.tail    >> rproxy

beagle: ${BEAGLE_CONF} ${APPS_CONF} ${RPROXY_CONF} rproxy.head rproxy.tail
	cat rproxy.head    >  rproxy
	cat ${RPROXY_CONF} >> rproxy
	cat ${BEAGLE_CONF} >> rproxy
	cat ${APPS_CONF}   >> rproxy
	cat rproxy.tail    >> rproxy

dev: ${DEV_CONF} rproxy.head rproxy.tail
	cat rproxy.head >  rproxy
	cat ${DEV_CONF} >> rproxy
	cat rproxy.tail >> rproxy

install: rproxy
	sudo cp -v rproxy ${APACHE_CONF_D} && echo "\nRestarting apache server ...\n" && sudo service apache2 restart

clean:
	rm rproxy

