FROM python:3.11-slim

RUN pip install bumpver==2023.1126

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
