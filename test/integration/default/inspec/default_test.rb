# # encoding: utf-8

pkg = if os.debian?
        'snmp snmpd'
      elsif os.redhat?
        'net-snmp net-snmp-utils'
      elsif os.suse?
        'net-snmp'
      elsif os.linux?
        'net-snmpd'
      elsif os.bsd?
        'net-snmpd'
      els
        'net-snmp net-snmp-utils'
      end

file = if os.debian?
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
   its('type') { should eq :file }
   it { should be_file }
   it { should_not be_directory }
   its('mode') { should cmp '0600' }
end
