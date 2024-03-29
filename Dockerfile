FROM golang:1.19 
ENV TZ="America/New_York"
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install ca-certificates
RUN apt-get -y install lp-solve
WORKDIR /
ADD . /
RUN go get -d github.com/runthesims/golp
RUN mkdir -p /go/src/github.com/runthesims/golp/lpsolve
RUN curl -L http://sourceforge.net/projects/lpsolve/files/lpsolve/5.5.2.0/lp_solve_5.5.2.0_dev_ux64.tar.gz | tar xvz -C $GOPATH/src/github.com/runthesims/golp/lpsolve
RUN go install github.com/pressly/goose/v3/cmd/goose@v3.9.0
