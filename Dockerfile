# Development image
FROM node:latest

ARG USER=developer
ARG UID=1000

# Global
RUN npm install -g yarn

# Security Restriction
RUN useradd --uid ${UID} ${USER}
RUN mkdir -p /home/${USER}
RUN chown -Rf ${USER} /home/${USER}

WORKDIR /opt

CMD bash
