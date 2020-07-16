FROM registry.access.redhat.com/ubi8/ubi:latest

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /bin/tini
ADD bin/entrypoint.sh /bin/entrypoint

RUN dnf install -y python3 python3-pip && \
  pip3 install ansible openshift kubernetes jq pyyaml && \
  chmod +x /bin/tini /bin/entrypoint && \
  rm -rf /var/cache/dnf

ENV HOME=/ansible
RUN mkdir -p ${HOME} ${HOME}/.ansible/tmp && \
	chmod -R g+w ${HOME} && chgrp -R root ${HOME} && \
	chmod g+w /etc/passwd
WORKDIR /ansible

ENTRYPOINT ["entrypoint"]
CMD ["sleep", "infinity"]