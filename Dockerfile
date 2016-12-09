FROM golang:1.6.4

MAINTAINER Curtis Downing <mindmorass@gmail.com>

ENV go_version=1.6
ENV oauth2_proxy_version=2.1

ADD https://github.com/bitly/oauth2_proxy/releases/download/v${oauth2_proxy_version}/oauth2_proxy-${oauth2_proxy_version}.linux-amd64.go${go_version}.tar.gz .
RUN tar -xzf oauth2_proxy-${oauth2_proxy_version}.linux-amd64.go${go_version}.tar.gz
RUN mv oauth2_proxy-${oauth2_proxy_version}.linux-amd64.go${go_version}/oauth2_proxy /usr/bin/
RUN rm -rf oauth2_proxy-*

ENTRYPOINT ["/usr/bin/oauth2_proxy"]
