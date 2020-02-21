FROM openjdk:8

WORKDIR /home

RUN curl "https://download.checkmarx.com/8.9.0/Plugins/CxConsolePlugin-8.90.2.zip" -o CxConsolePlugin-8.90.2.zip \
    && unzip CxConsolePlugin-8.90.2.zip \
    && mv CxConsolePlugin-8.90.2 CxConsolePlugin \
    && chmod +x CxConsolePlugin/runCxConsole.sh

WORKDIR CxConsolePlugin

COPY ./run.sh ./run.sh
RUN chmod +x run.sh    

CMD ["/home/CxConsolePlugin/run.sh"]