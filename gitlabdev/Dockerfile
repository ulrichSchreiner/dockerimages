FROM ubuntu:14.04

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate python-docutils pkg-config cmake git-core mysql-server mysql-client libmysqlclient-dev redis-server

RUN mkdir /tmp/ruby && cd /tmp/ruby && curl -L -k https://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz | tar xz
RUN cd /tmp/ruby/ruby-2.1.3 && ./configure --disable-install-rdoc && make && make install
RUN gem install bundler --no-ri --no-rdoc
RUN adduser --disabled-login --gecos 'GitLab' git
ADD initdb.sql /tmp/initdb.sql
RUN service mysql start && mysql < /tmp/initdb.sql

RUN sed -i -e 's/^port .*/port 0/' /etc/redis/redis.conf
RUN echo 'unixsocket /var/run/redis/redis.sock' >> /etc/redis/redis.conf
RUN service redis-server restart
RUN usermod -aG redis git
WORKDIR /home/git
RUN sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-ce.git -b 7-3-stable gitlab
RUN sed -i -e 's/password_expires_at/#password_expires/g' /home/git/gitlab/db/fixtures/production/001_admin.rb
RUN cp /home/git/gitlab/config/gitlab.yml.example /home/git/gitlab/config/gitlab.yml
WORKDIR /home/git/gitlab
RUN chown -R git log/
RUN chown -R git tmp/
RUN chmod -R u+rwX log/
RUN chmod -R u+rwX tmp/
RUN chmod -R u+rwX tmp/pids/
RUN chmod -R u+rwX tmp/sockets/
RUN sudo -u git -H mkdir /home/git/gitlab-satellites
RUN sudo chmod u+rwx,g=rx,o-rwx /home/git/gitlab-satellites
RUN sudo -u git -H cp /home/git/gitlab/config/unicorn.rb.example /home/git/gitlab/config/unicorn.rb
RUN sudo -u git -H cp /home/git/gitlab/config/initializers/rack_attack.rb.example /home/git/gitlab/config/initializers/rack_attack.rb

RUN sudo -u git -H git config --global user.name "GitLab"
RUN sudo -u git -H git config --global user.email "gitlabdev"
RUN sudo -u git -H git config --global core.autocrlf input

RUN sudo -u git -H cp /home/git/gitlab/config/resque.yml.example /home/git/gitlab/config/resque.yml
RUN sudo -u git cp /home/git/gitlab/config/database.yml.mysql /home/git/gitlab/config/database.yml
RUN sed -i -e "s/secure password/git/g" /home/git/gitlab/config/database.yml

RUN sudo -u git -H bundle install --deployment --without development test postgres aws
RUN sudo -u git -H bundle exec rake gitlab:shell:install[v2.0.0] REDIS_URL=unix:/var/run/redis/redis.sock RAILS_ENV=production

RUN service redis-server start && service mysql start && echo "yes" | sudo -u git -H bundle exec rake gitlab:setup RAILS_ENV=production GITLAB_ROOT_PASSWORD=start123
RUN sudo cp lib/support/init.d/gitlab /etc/init.d/gitlab
RUN sudo -u git -H bundle exec rake assets:precompile RAILS_ENV=production

RUN sed -i -s 's/127.0.0.1/0.0.0.0/g' /home/git/gitlab/config/unicorn.rb

RUN sed -i -s 's/port: 80/port: 8080/g' /home/git/gitlab/config/gitlab.yml
RUN sed -i -s 's/# ssh_port: 22/ssh_port: 1022/g' /home/git/gitlab/config/gitlab.yml
RUN sed -i -s 's/Port 22/Port 1022/g' /etc/ssh/sshd_config
RUN sed -i -s 's/localhost/localhost:8080/g' /home/git/gitlab-shell/config.yml

ADD startup.sh /home/git/startup.sh
ADD noconfirm.patch /home/git/gitlab/lib/api/noconfirm.patch

RUN cd /home/git/gitlab/lib/api && patch < noconfirm.patch

EXPOSE 8080
CMD /home/git/startup.sh
