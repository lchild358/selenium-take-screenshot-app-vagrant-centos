# For installing nodejs 8
execute 'for nodejs' do
  command 'sudo curl -sL https://rpm.nodesource.com/setup_8.x | bash -'
end

%w{nodejs}.each do |package|
  yum_package package do
    action :install
  end
end

# For installing google-chrome
cookbook_file '/etc/yum.repos.d/google-chrome.repo' do
  source 'google-chrome.repo'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

%w{google-chrome-stable}.each do |package|
  yum_package package do
    action :install
  end
end

# For installing others
%w{git gcc-c++ cairo cairo-devel cairomm-devel libjpeg-turbo-devel pango pango-devel pangomm pangomm-devel google-chrome-stable nodejs}.each do |package|
  yum_package package do
    action :install
  end
end


# Git
bash 'Clone git repository' do
  cwd '/home/vagrant'
  code <<-EOH
    cd '/home/vagrant'
    git clone 'https://github.com/lchild358/selenium-take-screenshot-app.git'
  EOH
  user 'vagrant'
end
