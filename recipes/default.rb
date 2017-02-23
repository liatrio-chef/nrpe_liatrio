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
package 'sysstat'

remote_file "#{node['nrpe']['plugin_dir']}/check_mem" do
  source 'https://raw.githubusercontent.com/justintime/nagios-plugins/master/check_mem/check_mem.pl'
  owner 'root'
  group 'root'
  mode '755'
  action :create
end

remote_file "#{node['nrpe']['plugin_dir']}/check_cpu_stats" do
  source 'https://raw.githubusercontent.com/etsy/nagios-herald/master/contrib/nrpe-plugins/check_cpu_stats.sh'
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
  command "#{node['nrpe']['plugin_dir']}/check_mem -f"
  warning_condition '5%'
  critical_condition '1%'
  action :add
end

nrpe_check 'check_cpu_stats' do
  command "#{node['nrpe']['plugin_dir']}/check_cpu_stats"
  warning_condition '70,40,30'
  critical_condition '90,50,40'
end

service 'nrpe' do
  action :restart
end
