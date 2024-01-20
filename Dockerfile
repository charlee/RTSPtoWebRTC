FROM golang:1.20.5-alpine3.18 AS builder

WORKDIR /go/src/
COPY . /go/src
RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/RTSPtoWebRTC .

FROM scratch
COPY --from=builder /go/bin/RTSPtoWebRTC /RTSPtoWebRTC
EXPOSE 8083

ENTRYPOINT ["/RTSPtoWebRTC"]
