node.default['elasticsearch']['config'] =  {'node.rack_id' => "#{node[:opsworks][:instance][:availability_zone]}"}

