#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
package 'java-1.7.0-openjdk-devel'

group 'tomcat'

user 'tomcat' do
  manage_home false
  shell '/bin/nologin'
  group 'tomcat'
  home '/opt/tomcat'
end

#wget http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz
remote_file 'apache-tomcat-8.5.24.tar.gz' do
  source 'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.24/bin/apache-tomcat-8.5.24.tar.gz'
end

directory '/opt/tomcat' do
  action:create

end

execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
execute 'chgrp -R tomcat /opt/tomcat/conf'
execute 'chmod -R g+r /opt/tomcat/conf/*'
#chmod g+x conf

directory '/opt/tomcat/conf' do
  mode '0070'
end


execute 'chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/'

template '/etc/systemd/system/tomcat.service' do
  source 'tomcat.service.erb'
end


execute '/opt/tomcat/bin/startup.sh'

#service 'daemon-reload' do
 # action [:reload]
#end

#service 'tomcat' do
 # action [:start, :enable]
#end
