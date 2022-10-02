FROM python:3.8

# set the working directory in the container
WORKDIR /usr/src/app

COPY . .

RUN pip install pipenv
RUN pipenv install

RUN apt update && apt install libgl1-mesa-glx -y
RUN apt install python-celery-common -y

# установка locale
RUN apt-get install -y locales locales-all
ENV LANGUAGE ru_RU.UTF-8
ENV LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8
RUN locale-gen ru_RU.UTF-8 && dpkg-reconfigure locales

#Timezone
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
