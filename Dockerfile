FROM        perl:latest
MAINTAINER  Robert Norris rob@eatenbyagrue.org

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

RUN ps -ef
RUN pwd
RUN cachebuster=b5545464 git clone https://github.com/jinnks/printevolve.git
RUN cd printevolve && carton install
EXPOSE 3000

WORKDIR printevolve
RUN cp PrintMove/Printmove.db ./~
RUN cd PrintMove && export PERL5LIB=/printevolve/local/lib/perl5/ && carton exec /script/printmove_server.pl &
