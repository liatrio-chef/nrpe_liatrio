default['nrpe']['install_method'] = 'source'
default['nrpe']['url'] = "https://sourceforge.net/projects/nagios/files/#{node['nrpe']['download']['dir']}"
default['nrpe']['checksum'] = '8f56da2d74f6beca1a04fe04ead84427e582b9bb88611e04e290f59617ca3ea3'

default['nrpe']['plugins']['initial_url'] = 'http://nagios-plugins.org/download/'
default['nrpe']['plugins']['version']  = '2.1.4'
default['nrpe']['plugins']['checksum'] = '4355b5daede0fa72bbb55d805d724dfa3d05e7f66592ad71b4e047c6d9cdd090'
