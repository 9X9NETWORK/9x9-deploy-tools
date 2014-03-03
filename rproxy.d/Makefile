APACHE_CONF_DIR=/etc/apache2/conf.d/

RPROXY_CONF= \
	rproxy.web.conf \
	rproxy.android.conf \
	rproxy.chromecast.conf \
	rproxy.cms.conf \
	rproxy.corp.conf \
	rproxy.geoip.conf \
	rproxy.jetty.conf \
	rproxy.mobile.conf

APPS_CONF= \
	apps.9x9.conf \
	apps.cts.conf \
	apps.ddtv.conf \
	apps.fcu.conf \
	apps.goodtv.conf \
	apps.crashcourse.conf \
	apps.networka.conf \
	apps.collegehumor.conf \
	apps.smosh.conf \
	apps.shane.conf \
	apps.nba.conf \
	apps.joeygraceffa.conf \
	apps.history.conf \
	apps.spinninrec.conf \
	apps.thefinebros.conf
 

BEAGLE_CONF= \
	rproxy.ytcrawler.conf \
	rproxy.apidocs.conf

DEV6_CONF= \
	rproxy.ytcrawler.conf \
	rproxy.dev6.conf

DEV_CONF= \
	rproxy.web.conf \
	rproxy.cms.conf \
	rproxy.jetty.conf \
	rproxy.mobile.conf

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

dev6: ${DEV6_CONF} ${DEV_CONF} rproxy.head rproxy.tail
	cat rproxy.head  >  rproxy
	cat ${DEV_CONF}  >> rproxy
	cat ${DEV6_CONF} >> rproxy
	cat rproxy.tail  >> rproxy

install: rproxy
	sudo cp -v rproxy ${APACHE_CONF_DIR} && sudo service apache2 restart

clean:
	rm -vf rproxy

