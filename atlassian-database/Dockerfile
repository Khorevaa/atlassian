FROM postgres:9.4

RUN localedef -i de_DE -c -f UTF-8 -A /usr/share/locale/locale.alias en_GB.UTF-8
ENV LANG en_GB.utf8
ENV ENTRY_DIR "/docker-entrypoint-initdb.d"

RUN mkdir -p ${ENTRY_DIR}

COPY "../atlassian-bamboo/setup-bamboo-db.sh" "${ENTRY_DIR}"
COPY "../atlassian-bitbucket/setup-bitbucket-db.sh" "${ENTRY_DIR}"
COPY "../atlassian-confluence/setup-confluence-db.sh" "${ENTRY_DIR}"
COPY "../atlassian-crowd/setup-crowd-db.sh" "${ENTRY_DIR}"
COPY "../atlassian-jira/setup-jira-db.sh" "${ENTRY_DIR}"

RUN chmod -R +x ${ENTRY_DIR}

ENTRYPOINT [
    "${ENTRY_DIR}/setup-bamboo-db.sh",
    "${ENTRY_DIR}/setup-bitbucket-db.sh",
    "${ENTRY_DIR}/setup-confluence-db.sh",
    "${ENTRY_DIR}/setup-crowd-db.sh",
    "${ENTRY_DIR}/setup-jira-db.sh",
]