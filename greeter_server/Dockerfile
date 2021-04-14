From golang:1.14.9

COPY ./app /bin/app
COPY ./grpc-health-probe /bin/grpc-health-probe

RUN chmod +x /bin/app
RUN chmod +x /bin/grpc-health-probe

CMD ["/bin/app"]
