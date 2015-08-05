
file "/tmp/chef_environment" do
  content node.environment
end

control_group '1 Check Operating System and Environment' do
  control '1.1 Check OS Version' do
    let(:check_os_vers) { command('cat /etc/redhat-release') }

    it 'returns CentOS release 6.5' do
      expect(check_os_vers.stdout).to contain('6.5')
    end
  end
  control '1.2 Check Nodes Environment' do
    it 'belongs to _default environment' do
      expect(file('/tmp/chef_environment')).to contain("_default")
    end
  end
end
