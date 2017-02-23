#
# Cookbook Name:: nrpe_liatrio
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

execute 'disable_selinux' do
  command 'setenforce 0'
end

include_recipe 'nrpe::default'

include_recipe 'yum-epel'
package 'nagios-plugins-all'
package 'nagios-plugins-nrpe'

remote_file "#{node['nrpe']['plugin_dir']}/check_mem}" do
  source 'https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl'
  owner 'root'
  group 'root'
  mode '755'
  action :create
end

nrpe_check 'check_load' do
  command "#{node['nrpe']['plugin_dir']}/check_load"
  warning_condition '10'
  critical_condition '15'
  action :add
end

nrpe_check 'check_disk' do
  command "#{node['nrpe']['plugin_dir']}/check_disk"
  warning_condition '10%'
  critical_condition '5%'
  action :add
end

nrpe_check 'check_mem' do
  command "#{node['nrpe']['plugin_dir']}/check_mem"
  warning_condition '5%'
  critical_condition '1%'
  action :add
end

service 'nrpe' do
  action :restart
end
