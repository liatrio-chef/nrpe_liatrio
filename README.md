nrpe_liatrio Cookbook
========================
A wrapper cookbook that installs nrpe

Requirements
------------
The following versions of ChefDK, Vagrant, and VirtualBox.
```
$ chef -v
Chef Development Kit Version: 0.16.28
chef-client version: 12.12.15
delivery version: master (921828facad8a8bbbd767368bfc72f19bd30e7bd)
berks version: 4.3.5
kitchen version: 1.10.2

$ vagrant -v
Vagrant 1.8.4

$ VBoxManage -v
5.0.26r108824
```  

Warning: Do not have `vagrant-vbguest` plugin installed as there is a conflict.   

Warning: This cookbook is meant to run on EL 6.X (unlike this rest of the liatrio
cookbooks which run on 7.X). The Nagios cookbook is only tested on EL 5.X/6.X

Usage
-----
#### nrpe_liatrio::default

`vagrant up`

or

Just include `nrpe_liatrio` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nrpe_liatrio]"
  ]
}
```

Attributes
----------
N/A

Data Bags
----------
* [nagios_services](https://github.com/schubergphilis/nagios/tree/master/test/integration/data_bags/nagios_services) 

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Eddie Bracho <eddieb@liatrio.com>
