FROM eclipse-temurin:11
LABEL org.opencontainers.image.authors="alvarojusten@gmail.com"

ARG GIT_TAG
WORKDIR /app

RUN apt -qq update \
	&& apt -qq install -y unzip \
	&& apt -qq clean \
	&& apt -qq purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
	&& rm -rf /var/lib/apt/lists/*

COPY download.sh web.sh /app/
RUN /app/download.sh

CMD "/app/web.sh"
