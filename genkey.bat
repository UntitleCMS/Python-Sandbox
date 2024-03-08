ssh-keygen -q -f %cd%\id_rsa -b 4096 -t rsa -q -N ""

move /Y id_rsa ./config/id_rsa
move /Y id_rsa.pub ./config/authorized_keys
