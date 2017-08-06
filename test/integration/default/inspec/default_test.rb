# # encoding: utf-8

pkg = if os.debian?
        'snmpd'
      elsif os.redhat?
        'snmpd'
      elsif os.suse?
        'snmpd'
      elsif os.linux?
        'snmpd'
      elsif os.bsd?
        'snmpd'
      end

describe package(pkg) do
  it { should be_installed }
end

describe service('snmpd') do
  it { should be_installed }
  it { should be_running }
end

describe file('/etc/snmp/snmpd.conf') do
   it { should exist }
   it { should be_owned_by 'root' }
   it { should be_readable.by('root')}
   its('type') { should eq 'file' }
   it { should be_file }
   it { should_not be_directory }
   its('mode') { should cmp '00644' }
end
