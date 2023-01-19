FROM alpine:latest

MAINTAINER niliovo 1791356563@qq.com

ENV m_dir="/frp"

WORKDIR $m_dir

COPY frp_build.sh $m_dir

COPY frp_startup.sh $m_dir

COPY health_check.sh $m_dir

RUN chmod a+x $m_dir/frp_build.sh && $m_dir/frp_build.sh

HEALTHCHECK --interval=30s --timeout=10s \
  CMD [ "/bin/sh", "health_check.sh" ]

ENTRYPOINT [ "/bin/sh", "frp_startup.sh" ]