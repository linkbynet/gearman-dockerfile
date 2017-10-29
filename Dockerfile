FROM centos
RUN yum -y install epel-release && yum -y install gearmand
COPY files/start.sh /
COPY files/wait-for-it.sh /
RUN chmod +x /*.sh
EXPOSE 4730
CMD ["/start.sh"]
