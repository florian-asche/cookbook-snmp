# # encoding: utf-8

pkg = if os.debian?
        'net-snmpd'
      elsif os.redhat?
        'net-snmpd'
      elsif os.suse?
        'net-snmpd'
      elsif os.linux?
        'net-snmpd'
      elsif os.bsd?
        'net-snmpd'
      end

config = if os.debian?
        '/etc/snmp/snmpd.conf'
      elsif os.redhat?
        '/etc/snmp/snmpd.conf'
      elsif os.suse?
        '/etc/snmp/snmpd.conf'
      elsif os.linux?
        '/etc/snmp/snmpd.conf'
      elsif os.bsd?
        ' /usr/local/share/snmp/snmpd.conf'
      end

describe package(pkg) do
  it { should be_installed }
end

describe service('snmpd') do
  it { should be_installed }
  it { should be_running }
end

describe file(file) do
   it { should exist }
   it { should be_owned_by 'root' }
   it { should be_readable.by('root')}
   its('type') { should eq 'file' }
   it { should be_file }
   it { should_not be_directory }
   its('mode') { should cmp '00644' }
end
