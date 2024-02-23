#
# TODO: wrap this in a bashic interactive script
#

# Get Sensor Status
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 sdr

# Enable Manual Fan Control
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0x30 0x01 0x00

# Disable Manual Fan Control
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0x30 0x01 0x01

# Set fan speed to 0 offset (results in 1680RPM)
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0x30 0x02 0xff 0x00

# Set fan speed to 20 offset
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0x30 0x02 0xff 0x14

# Set fan speed to 30 offset
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0x30 0x02 0xff 0x1e

# Set fan speed to 100 offset
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0x30 0x02 0xff 0x64

# Disable 3rd Party Card Fan Behaviour
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0xce 0x00 0x16 0x05 0x00 0x00 0x00 0x05 0x00 0x01 0x00 0x00

# Enable 3rd Party Card Fan Behaviour
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0xce 0x00 0x16 0x05 0x00 0x00 0x00 0x05 0x00 0x00 0x00 0x00

# Check 3rd Party Card fan behavior
ipmitool -I lanplus -U <user> -P <pass> -H 192.168.88.90 raw 0x30 0xce 0x01 0x16 0x05 0x00 0x00 0x00
