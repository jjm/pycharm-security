FROM anthonypjshaw/pycharm-security:latest
COPY action.sh /action.sh
COPY parse.py /code/parse.py
RUN apt-get -y install python3 python3-pip python3-venv && python3 -m pip install setuptools
RUN ["chmod", "+x", "/action.sh"]
ENTRYPOINT ["/action.sh"]
