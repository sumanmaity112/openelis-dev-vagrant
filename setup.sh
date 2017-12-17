#!/usr/bin/env bash

# Install JDK-7
yum install -y java-1.7.0-openjdk-devel

# Install ant-1.9.9
wget http://www-eu.apache.org/dist//ant/binaries/apache-ant-1.9.9-bin.tar.gz
tar -xvzf apache-ant-1.9.9-bin.tar.gz

echo "export ANT_HOME=`pwd`/apache-ant-1.9.9" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-openjdk" >> ~/.bashrc
echo "export PATH=\$PATH:\$ANT_HOME/bin" >> ~/.bashrc
source ~/.bashrc

# Add to normal user's .bashrc
echo "export ANT_HOME=`pwd`/apache-ant-1.9.9" >> `pwd`/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-openjdk" >> `pwd`/.bashrc
echo "export PATH=\$PATH:\$ANT_HOME/bin" >> `pwd`/.bashrc

# Install Ruby and RVM
# For more info read https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/aws/nginx/oss/install_language_runtime.html
yum install -y curl gpg gcc gcc-c++ make
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | sudo bash -s stable
sudo usermod -a -G rvm `whoami`
source /etc/profile.d/rvm.sh
rvm install ruby
rvm --default use ruby
gem install bundler --no-rdoc --no-ri

# Install Compass
gem install compass

# Install Postgresql-9.2
yum install -y https://download.postgresql.org/pub/repos/yum/9.2/redhat/rhel-6-x86_64/pgdg-centos92-9.2-2.noarch.rpm
yum install -y postgresql92 postgresql92-libs postgresql92-server postgresql92-contrib
service postgresql-9.2 initdb
chkconfig postgresql-9.2 on
mv -f pg_hba.conf /var/lib/pgsql/9.2/data/pg_hba.conf
service postgresql-9.2 start