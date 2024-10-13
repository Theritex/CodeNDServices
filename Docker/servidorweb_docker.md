
Creacion de contenedor:
`docker run -d --name my-apache-app -p 8080:80 httpd:2.4`

Acceder al contenedor
`docker exec -it my-apache-app bash`
`cd /usr/local&apache2/htdocs`
`echo "<h1>Hello world</h1>" > index.html`