###############################################################################
# --- Install apt-get packages ---
package 'build-essential' do
  version '11.6ubuntu6'
end
package 'make' do
  version '3.81-8.2ubuntu3'
end
package 'gcc' do
  version '4:4.8.2-1ubuntu6'
end
package 'gcc-avr' do
  version '1:4.8-2.1'
end
package 'avrdude' do
  version '6.0.1-1'
end
package 'arduino' do
  version '1:1.0.5+dfsg2-2'
end
package 'arduino-core' do
  version '1:1.0.5+dfsg2-2'
end
package 'arduino-mk' do
  version '1.3.1-1'
end
package 'avr-libc' do
  version '1:1.8.0-4.1'
end
package 'libzmq3-dev' do
  version '4.0.4+dfsg-2'
end
package 'python' do
  version '2.7.5-5ubuntu3'
end
package 'python-pip' do
  version '1.5.4-1'
end

# packages that we most likely won't care about which version we're running.
# Unless we get absurdly unlucky this shouldn't come back to bite us at any point
package 'cowsay'
package 'git'
package 'htop'

###############################################################################
# --- nodejs stuff ---
#
# install nodejs, globally installed npm packages, and dawn specific packages
# (we're assuming the dawn repo has been cloned in the expected location)
bash 'nodejsSetup' do
  code <<-EOH
    curl -sL https://deb.nodesource.com/setup | sudo bash
    sudo apt-get install -y nodejs
    sudo apt-get install -y npm
    sudo npm install -g gulp
    sudo npm install -g coffee-script
    # cd /vagrant/projects/dawn
    # npm install
  EOH
end

###############################################################################
# --- python stuff ---
bash 'pythonPackagesSetup' do
  code <<-EOH
    sudo pip install --upgrade enum34
    sudo pip install --upgrade pyserial
    sudo pip install --upgrade pyzmq
  EOH
end
