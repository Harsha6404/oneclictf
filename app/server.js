// Simple Node.js HTTP server
const http = require('http');
const port = process.env.PORT || 8080;


const server = http.createServer((req, res) => {
if (req.url === '/health') {
res.writeHead(200, {'Content-Type': 'text/plain'});
res.end('ok');
return;
}
if (req.url === '/') {
res.writeHead(200, {'Content-Type': 'text/plain'});
res.end('Hello from one-click API!');
return;
}
res.writeHead(404, {'Content-Type': 'text/plain'});
res.end('not found');
});


server.listen(port, () => {
console.log(`Server running on port ${port}`);
});
