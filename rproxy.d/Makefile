APACHE_CONF_DIR=/etc/apache2/conf.d/

RPROXY_CONF= \
	rproxy.fliprCorp.conf \
	rproxy.web.conf \
	rproxy.vidcon2014.conf \
	rproxy.android.conf \
	rproxy.chromecast.conf \
	rproxy.chromecastDemo.conf \
	rproxy.flipr6.conf \
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
	apps.fliprctvbayarea.conf \
	apps.crashcourse.conf \
	apps.networka.conf \
	apps.collegehumor.conf \
	apps.smosh.conf \
	apps.shane.conf \
	apps.nba.conf \
	apps.joeygraceffa.conf \
	apps.history.conf \
	apps.spinninrec.conf \
	apps.thefinebros.conf \
	apps.awesomenesstv.conf \
	apps.chinatimesflipr.conf \
	apps.clevvertv.conf \
	apps.echomusic.conf \
	apps.eratvgroup.conf \
	apps.ettvflipr.conf \
	apps.foxflipr.conf \
	apps.ftvflipr.conf \
	apps.gameview.conf \
	apps.gtvflipr.conf \
	apps.magazine.conf \
	apps.musicvideo.conf \
	apps.nexttv.conf \
	apps.piliflipr.conf \
	apps.setflipr.conf \
	apps.superstar.conf \
	apps.tbsflipr.conf \
	apps.thenewslens.conf \
	apps.twsuperstar.conf \
	apps.tzuchi.conf \
	apps.tzuchiorg.conf \
	apps.udntv.conf \
	apps.vice.conf \
	apps.news.conf \
	apps.daaitv.conf \
	apps.gametube.conf \
	apps.cw.conf \
	apps.test.conf
 
BEAGLE_CONF= \
	rproxy.prerender.conf \
	rproxy.ytcrawler.conf \
	rproxy.websocket.conf \
	rproxy.apidocs.conf

DEV6_CONF= \
	rproxy.prerender.conf \
	rproxy.dev6.conf \
	rproxy.corp.conf \
	rproxy.ytcrawler.conf

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
	cat ${BEAGLE_CONF} >> rproxy
	cat ${RPROXY_CONF} >> rproxy
	cat ${APPS_CONF}   >> rproxy
	cat rproxy.tail    >> rproxy
	cat rproxy.head.ssl  >>  rproxy
	cat ${BEAGLE_CONF} >> rproxy
	cat ${RPROXY_CONF} >> rproxy
	cat ${APPS_CONF}   >> rproxy
	cat rproxy.tail    >> rproxy

dev: ${DEV_CONF} rproxy.head rproxy.tail
	cat rproxy.head >  rproxy
	cat ${DEV_CONF} >> rproxy
	cat rproxy.tail >> rproxy

dev6: ${DEV6_CONF} ${DEV_CONF} rproxy.head rproxy.tail
	cat rproxy.head  >  rproxy
	cat ${DEV6_CONF} >> rproxy
	cat ${DEV_CONF}  >> rproxy
	cat rproxy.tail  >> rproxy
	cat rproxy.head.ssl  >>  rproxy
	cat ${DEV6_CONF} >> rproxy
	cat ${DEV_CONF}  >> rproxy
	cat rproxy.tail  >> rproxy

install: rproxy
	sudo cp -v rproxy ${APACHE_CONF_DIR} && sudo service apache2 restart

clean:
	rm -vf rproxy

