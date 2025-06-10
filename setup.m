websave("/tmp/get-pip.py","https://bootstrap.pypa.io/get-pip.py");
!python /tmp/get-pip.py
!python -m pip install --quiet nba_api pandas
pe = pyenv(Version="/usr/bin/python3", ...
    ExecutionMode="OutOfProcess")