rm -rf /opt/ANDRAX/netexec

cp -Rf config /opt/ANDRAX/.config

rm -rf /opt/ANDRAX/cachevirtual/virtualenvs/*netexec*

cp -Rf /opt/ANDRAX/.config /root/
cp -Rf /opt/ANDRAX/.config /home/andrax/

chown -R root:root /root/.config
chown -R andrax:andrax /home/andrax/.config

sleep 01

source /opt/ANDRAX/PYENV/python3/bin/activate

/opt/ANDRAX/PYENV/python3/bin/pip3 install poetry

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Pip install poetry... PASS!"
else
  # houston we have a problem
  exit 1
fi

/opt/ANDRAX/PYENV/python3/bin/poetry install

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Poetry install NetExec... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf $(pwd) /opt/ANDRAX/NetExec

cp -Rf andraxbin/* /opt/ANDRAX/bin
rm -rf andraxbin
