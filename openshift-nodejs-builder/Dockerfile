FROM docker.io/nodesource/centos7
RUN version="v1.3.0-alpha.2" commitId="983578e" && curl -L https://github.com/openshift/origin/releases/download/${version}/openshift-origin-client-tools-${version}-${commitId}-linux-64bit.tar.gz | tar -f - -x -z --strip-components=1 -C /usr/local/bin/ openshift-origin-client-tools-${version}-${commitId}-linux-64bit/oc
