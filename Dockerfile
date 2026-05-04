FROM --platform=$BUILDPLATFORM golang:1.26.2-alpine AS build
ARG TARGETOS
ARG TARGETARCH
ARG APPLICATION_VERSION

WORKDIR /app

ADD * .

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-X main.Version=${APPLICATION_VERSION} -X main.BuildTime=$(date '+%FT%T')" -o server .

FROM alpine
COPY --from=build /app/server /server

EXPOSE 8080

ENTRYPOINT ["/server"]
