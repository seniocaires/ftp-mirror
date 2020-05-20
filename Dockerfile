FROM seniocaires/ubuntu-base

ENV FTP_USUARIO \
    FTP_SENHA \
    FTP_HOST \
    FTP_PASTA \
    FTP_DOWNLOADS_PARALELOS

RUN apt update && \
  # Instalação do lftp
    apt install -y lftp && \
  # Criando workspace (pasta onde será feito o espelhamento) (usar esta pasta como volume)
    mkdir -p /workspace && \
  # Criando o entrypoint
    echo "#!/bin/bash" > /entrypoint.sh && \
    echo 'lftp -c "open -u ${FTP_USUARIO},${FTP_SENHA} ${FTP_HOST}; mirror --delete --use-cache --verbose --allow-chown --allow-suid --no-umask --parallel=${FTP_DOWNLOADS_PARALELOS} ${FTP_PASTA} /workspace"' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
