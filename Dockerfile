FROM ubuntu:18.04 as rtm

RUN apt-get update\
 && apt-get install -y --no-install-recommends\
 omniidl-python\
 python-omniorb\
 python-pip\
 wget\
 && pip install setuptools wheel\
 && pip install PyYAML rtshell-aist\
 && wget -O - 'https://github.com/OpenRTM/OpenRTM-aist-Python/archive/master.tar.gz'\
    | tar xzf -\
 && cd /OpenRTM-aist-Python-master\
 && python /OpenRTM-aist-Python-master/setup.py build_core\
 && python /OpenRTM-aist-Python-master/setup.py install\
 && rm -rf /OpenRTM-aist-Python-master\
 && apt-get purge -y omniidl-python python-pip wget libpython3.6-minimal\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*
