# common shell routines for s2i scripts

# insert settings for HTTP proxy into settings.xml if supplied
function configure_proxy() {
  if [ -n "$HTTP_PROXY_HOST" -a -n "$HTTP_PROXY_PORT" ]; then
    xml="<proxy>\
         <id>genproxy</id>\
         <active>true</active>\
         <protocol>http</protocol>\
         <host>$HTTP_PROXY_HOST</host>\
         <port>$HTTP_PROXY_PORT</port>"
    if [ -n "$HTTP_PROXY_USERNAME" -a -n "$HTTP_PROXY_PASSWORD" ]; then
      xml="$xml\
         <username>$HTTP_PROXY_USERNAME</username>\
         <password>$HTTP_PROXY_PASSWORD</password>"
    fi
    if [ -n "$HTTP_PROXY_NONPROXYHOSTS" ]; then
      xml="$xml\
         <nonProxyHosts>$HTTP_PROXY_NONPROXYHOSTS</nonProxyHosts>"
    fi
  xml="$xml\
       </proxy>"
    sed -i "s|<!-- ### configured http proxy ### -->|$xml|" $HOME/.m2/settings.xml
  fi
}

# insert settings for mirrors/repository managers into settings.xml if supplied
function configure_mirrors() {
  if [ -n "$MAVEN_MIRROR_URL" ]; then
    xml="    <mirror>\
      <id>mirror.default</id>\
      <url>$MAVEN_MIRROR_URL</url>\
      <mirrorOf>external:*</mirrorOf>\
    </mirror>"
    sed -i "s|<!-- ### configured mirrors ### -->|$xml|" $HOME/.m2/settings.xml
  fi
}

# XXX: need to parameterize the globs; tomcat7 just .war
function copy_artifacts() {
  d="$1"
  if [ -d $LOCAL_SOURCE_DIR/$d ]; then
    echo "Copying all $@ artifacts from $LOCAL_SOURCE_DIR/$d directory into $DEPLOY_DIR for later deployment..."
    shift
    while [ $# -gt 0 ]; do
        cp -v $LOCAL_SOURCE_DIR/$d/*.$1 $DEPLOY_DIR 2> /dev/null
        shift
    done
  fi
}

# handle incremental builds. If we have been passed build artifacts, untar
# them over the supplied source.
manage_incremental_build() {
    if [ -d /tmp/artifacts ]; then
        echo "Expanding artifacts from incremental build..."
        ( cd /tmp/artifacts && tar cf - . ) | ( cd ${HOME} && tar xvf - )
        rm -rf /tmp/artifacts
    fi
}

# s2i 'save-artifacts' routine
s2i_save_build_artifacts() {
    cd ${HOME}
    tar cf - .m2
}

# optionally clear the local maven repository after the build
clear_maven_repository() {
    mcr=$(echo "${MAVEN_CLEAR_REPO}" | tr [:upper:] [:lower:])
    if [ "${mcr}" = "true" ]; then
        rm -rf ${HOME}/.m2/repository/*
    fi
}
