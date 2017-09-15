require 'yaml'
data = YAML.load_file('/usr/src/config_test.types.yml')
puts sprintf('%0.01f', data['exp'])
puts sprintf('%0.16f', data['float'])
