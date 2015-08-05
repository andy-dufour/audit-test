#
# Cookbook Name:: rhel-test
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

control_group 'OpenSSH' do
  control 'SSH' do
    it 'should be listening on port 22' do
      expect(port(22)).to be_listening
    end
  end
  control 'OpenSSH Server Package' do
    it 'v1:6.7p1-2ubuntu2 of OpenSSH server should be installed' do
      expect(package("openssh-server")).to be_installed.with_version("1:6.7p1-2ubuntu2")
    end
  end
end
