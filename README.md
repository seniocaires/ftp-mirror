# ftp-mirror

Use para fazer backup **DO** ftp **PARA** um diretório local


#### Exemplo de uso

```
docker run -it --rm \
    -e FTP_USUARIO='usuario' \
    -e FTP_SENHA='senha' \
    -e FTP_HOST='meu-ftp.com.br' \
    -e FTP_PASTA='.' \
    -e FTP_DOWNLOADS_PARALELOS=4 \
    -v $(pwd)/backup:/workspace \
seniocaires/ftp_mirror
```
