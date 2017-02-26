FROM centos:latest

RUN yum update -y; yum clean all
RUN yum install -y openssh-clients cronie sudo epel-release; yum clean all
RUN yum update -y; yum clean all
RUN yum --enablerepo=epel install -y sshpass; yum clean all
RUN sudo echo "KexAlgorithms diffie-hellman-group1-sha1" >> /etc/ssh/ssh_config

COPY cronjob.txt /etc/crontab
RUN chmod 0644 /etc/crontab
RUN touch /var/log/cron

#RUN /usr/bin/crontab /etc/cron

CMD crond -n

#CMD ["/usr/bin/supervisord"]
