#!/bin/sh
BUILDDIR=$HOME/build/nginx
cd $BUILDDIR
LIBDIR=$HOME/build/lib
MODDIR=$HOME/build/nginx-modules
NGDIR="C:/server/nginx"
export ARCH=native
export HOST=x86_64-w64-mingw32
export LUAJIT_LIB=/usr/$HOST/bin
export LUAJIT_INC=/usr/$HOST/include/luajit-2.1
auto/configure \
--prefix=$NGDIR \
--crossbuild=win32 \
--with-cc=$HOST-gcc \
--with-cpp=$HOST-g++ \
--sbin-path=nginx.exe \
--pid-path=nginx.pid \
--lock-path=nginx.lock \
--error-log-path=logs/error.log \
--http-log-path=logs/access.log \
--http-client-body-temp-path=$NGDIR/temp/client_body \
--http-proxy-temp-path=$NGDIR/temp/proxy \
--http-fastcgi-temp-path=$NGDIR/temp/fastcgi \
--with-select_module \
--with-http_ssl_module \
--with-http_v2_module \
--with-http_addition_module \
--with-http_realip_module \
--with-file-aio \
--with-openssl=$LIBDIR/openssl \
--with-pcre=$LIBDIR/pcre --with-pcre-jit \
--with-zlib=$LIBDIR/zlib \
--without-http_ssi_module \
--without-http_userid_module \
--without-http_geo_module \
--without-http_map_module \
--without-http_referer_module \
--without-http_scgi_module \
--without-http_uwsgi_module \
--without-http_memcached_module \
--without-mail_pop3_module \
--without-mail_imap_module \
--without-mail_smtp_module \
--without-http_browser_module \
--without-http_upstream_ip_hash_module \
--without-http_upstream_least_conn_module \
--without-http_upstream_keepalive_module \
--without-http_upstream_zone_module \
--without-http_empty_gif_module \
--without-http_split_clients_module \
--without-http_limit_conn_module \
--without-http_limit_req_module \
--add-module=$MODDIR/ngx_devel_kit \
--add-module=$MODDIR/echo-nginx-module \
--add-module=$MODDIR/lua-nginx-module \
--add-module=$MODDIR/ngx-fancyindex
