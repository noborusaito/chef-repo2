#
# Cookbook Name:: testcook
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
service "iptables" do
	action [:stop, :disable]
end
%w{php php-common php-mbstring php-xml php-devel php-process php-cli php-pear php-mysql mysql-server}.each do |p|
	 package p do
		action :install
	end
end
#apachのインストール
package "httpd" do
	action :install
end

service "httpd" do
	action [:start, :enable]
end

template "/var/www/html/index.html" do
	source "index.html.erb"
	mode 0644
end
