rm -rf /opt/ANDRAX/netexec

rm -rf /opt/ANDRAX/bin/nxc
rm -rf /opt/ANDRAX/bin/netexec
rm -rf /opt/ANDRAX/bin/NetExec
rm -rf /opt/ANDRAX/bin/nxcdb

python3 -m venv /opt/ANDRAX/netexec

source /opt/ANDRAX/netexec/bin/activate

/opt/ANDRAX/netexec/bin/pip install pyinstaller .

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Pip install local... PASS!"
else
  # houston we have a problem
  exit 1
fi

/opt/ANDRAX/netexec/bin/pyinstaller netexec.spec

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Pyinstaller BUILD... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf dist/nxc /opt/ANDRAX/bin/

rm -rf /opt/ANDRAX/netexec/
