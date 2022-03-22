#!/bin/bash
#
# Host Compliance Scan Script SSH and SCP based on text file.
# 2nd Stage of script
echo "Please do SSH copy ID and SCP command before run this script else it will definitely fail"
echo "Executing the CIS Bash Script..."
cat << "EOF"
echo "========================================="
   __________ __  __   ___        ______                     __
  / ___/ ___// / / /  ( _ )      / ____/  _____  _______  __/ /____
  \__ \\__ \/ /_/ /  / __ \/|   / __/ | |/_/ _ \/ ___/ / / / __/ _ \
 ___/ /__/ / __  /  / /_/  <   / /____>  </  __/ /__/ /_/ / /_/  __/
/____/____/_/ /_/   \____/\/  /_____/_/|_|\___/\___/\__,_/\__/\___/
EOF
echo "========================================="
echo ""
for server in $(cat ip.txt) # <-- Please modified this
do
ssh -t root@"$server"<<EOT
./filename.sh # <-- Please put appropiated command to be execute here line by line
exit
EOT
scp root@"$server":/cis_report.txt "$server"_cis_report.txt # <-- and change the filename for SCP
done
