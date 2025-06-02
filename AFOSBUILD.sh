rm -rf /opt/ANDRAX/netexec

rm -rf /opt/ANDRAX/bin/nxc
rm -rf /opt/ANDRAX/bin/netexec
rm -rf /opt/ANDRAX/bin/NetExec
rm -rf /opt/ANDRAX/bin/nxcdb

PIPX_HOME=/opt/ANDRAX/pipx PIPX_BIN_DIR=/opt/ANDRAX/pipx/bin PIPX_MAN_DIR=/opt/ANDRAX/pipx/man /opt/ANDRAX/python3.13/bin/pipx install --force .

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Force local install... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf andraxbin/* /opt/ANDRAX/bin
