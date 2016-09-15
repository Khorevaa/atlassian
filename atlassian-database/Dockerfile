FROM postgres:9.4

RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
ENV LANG en_GB.utf8
ENV ENTRY_DIR "/docker-entrypoint-initdb.d"

RUN mkdir -p ${ENTRY_DIR}

COPY "setup-bamboo-db.sh" "${ENTRY_DIR}"
COPY "setup-bitbucket-db.sh" "${ENTRY_DIR}"
COPY "setup-confluence-db.sh" "${ENTRY_DIR}"
COPY "setup-crowd-db.sh" "${ENTRY_DIR}"
COPY "setup-jira-db.sh" "${ENTRY_DIR}"

RUN chmod -R +x ${ENTRY_DIR}

ENTRYPOINT [
    "/docker-entrypoint-initdb.d/setup-bamboo-db.sh",
    "/docker-entrypoint-initdb.d/setup-bitbucket-db.sh",
    "/docker-entrypoint-initdb.d/setup-confluence-db.sh",
    "/docker-entrypoint-initdb.d/setup-crowd-db.sh",
    "/docker-entrypoint-initdb.d/setup-jira-db.sh",
]