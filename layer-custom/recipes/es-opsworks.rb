#
# Cookbook Name:: opsworks-elasticsearch-cookbook
# Recipe:: es-opsworks
#

# see README.md and test/fixtures/cookbooks for more examples!
include_recipe 'chef-sugar'

# see README.md and test/fixtures/cookbooks for more examples!
elasticsearch_user 'elasticsearch'

elasticsearch_install 'elasticsearch' do
  type node['elasticsearch']['install_type'].to_sym # since TK can't symbol.
end

elasticsearch_configure 'elasticsearch' do
	configuration ({
		'network.bind_host' => '0.0.0.0',
		'network.publish_host' => '_non_loopback_',
	})
end

node[:elasticsearch][:plugins].each do |plug|
  elasticsearch_plugin (plug.kind_of?(String) ? plug : plug[:name]) do
  	url plug[:url] if plug.kind_of?(Hash) && plug[:url]
  	action :install
	end
end if node[:elasticsearch] && node[:elasticsearch][:plugins]

elasticsearch_service 'elasticsearch' do
  service_actions [:enable, :start]
end
