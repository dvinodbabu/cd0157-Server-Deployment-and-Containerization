FROM python:stretch
COPY . /main
WORKDIR /main
RUN python3 -m pip install --upgrade pip
RUN pip3 install flask
RUN pip3 install gunicorn
RUN pip3 install pytest
RUN pip3 uninstall pyjwt
RUN pip3 install pyjwt==1.7.1
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]