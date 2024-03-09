#
# TODO: wrap this in a bashic interactive script
#
# default user and pass for Dell iDrac is root/calvin
#

# Get Sensor Status (get names of sensors to use with sdr get)
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> sdr

# Get Fan Sensor Data for R730
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> sdr get "Fan1 RPM" "Fan2 RPM" "Fan3 RPM" "Fan4 RPM" "Fan5 RPM" "Fan6 RPM"

# Enable Manual Fan Control
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0x30 0x01 0x00

# Disable Manual Fan Control
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0x30 0x01 0x01

# Set fan speed to 0 offset (results in 1680RPM)
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0x30 0x02 0xff 0x00

# Set fan speed to 20 offset
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0x30 0x02 0xff 0x14

# Set fan speed to 30 offset
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0x30 0x02 0xff 0x1e

# Set fan speed to 100 offset
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0x30 0x02 0xff 0x64

# Disable 3rd Party Card Fan Behaviour
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0xce 0x00 0x16 0x05 0x00 0x00 0x00 0x05 0x00 0x01 0x00 0x00

# Enable 3rd Party Card Fan Behaviour
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0xce 0x00 0x16 0x05 0x00 0x00 0x00 0x05 0x00 0x00 0x00 0x00

# Check 3rd Party Card fan behavior
ipmitool -I lanplus -U <user> -P <pass> -H <iDrac IP> raw 0x30 0xce 0x01 0x16 0x05 0x00 0x00 0x00
