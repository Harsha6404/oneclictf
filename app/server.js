const http = require('http');
const port = 8080;


const server = http.createServer((req, res) => {
if (req.url === '/health') {
res.writeHead(200, {'Content-Type': 'text/plain'});
res.end('ok');
return;
}
if (req.url === '/') {
res.writeHead(200, {'Content-Type': 'text/plain'});
res.end('Hello from Terraform Provisioner version!');
return;
}
res.writeHead(404);
res.end('not found');
});


server.listen(port, () => console.log("Server running on port", port));
