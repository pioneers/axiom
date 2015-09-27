###############################################################################
# --- packages needed by pretty much everyone ---
package 'build-essential' do
  version '11.6ubuntu6'
end
package 'make' do
  version '3.81-8.2ubuntu3'
end
package 'gcc' do
  version '4:4.8.2-1ubuntu6'
end
# packages that we most likely won't care about which version we're running.
# Unless we get absurdly unlucky this shouldn't come back to bite us at any point
package 'cowsay'
package 'git'
package 'htop'

package 'samba'
package 'cifs-utils'
bash 'sambaSetup' do
  code <<-EOH
    sudo smbpasswd -an vagrant
    # please ignore how jank this is for now
    sudo echo '[vagrant]' >> /etc/samba/smb.conf
    sudo echo 'path = /home/vagrant/' >> /etc/samba/smb.conf
    sudo echo 'available = yes' >> /etc/samba/smb.conf
    sudo echo 'read only = no' >> /etc/samba/smb.conf
    sudo echo 'browseable = yes' >> /etc/samba/smb.conf
    sudo echo 'public = yes' >> /etc/samba/smb.conf
    sudo echo 'writable = yes' >> /etc/samba/smb.conf
    sudo echo 'guest ok = yes' >> /etc/samba/smb.conf
    sudo echo 'guest only = yes' >> /etc/samba/smb.conf
    sudo echo 'vagrant = "vagrant"' >> /etc/samba/smbusers
    sudo service smbd restart
  EOH
end

###############################################################################
# --- packages for runtime and ui ---
#
package 'libzmq3-dev' do
  version '4.0.4+dfsg-2'
end
# install nodejs, globally installed npm packages, and dawn specific packages
# (we're assuming the dawn repo has been cloned in the expected location)
bash 'nodejsSetup' do
  code <<-EOH
    curl -sL https://deb.nodesource.com/setup | sudo bash
    sudo apt-get install -y nodejs
    sudo apt-get install -y npm
    sudo npm install -g gulp
    sudo npm install -g coffee-script
  EOH
end

package 'python' do
  version '2.7.5-5ubuntu3'
end
package 'python-dev' do
  version '2.7.5-5ubuntu3'
end
package 'python-pip' do
  version '1.5.4-1'
end
bash 'pythonPackagesSetup' do
  code <<-EOH
    sudo pip install --upgrade enum34
    sudo pip install --upgrade pyserial
    sudo pip install --upgrade pyzmq
  EOH
end

###############################################################################
# --- packages for web redesign ---
package 'ruby' do
  version '1:1.9.3.4'
end
package 'ruby-dev' do
  version '1:1.9.3.4'
end
bash 'jekyllSetup' do
  code <<-EOH
    sudo gem install jekyll --no-rdoc --no-ri
  EOH
end
