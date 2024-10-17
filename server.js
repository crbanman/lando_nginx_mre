const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
  const path = req.url;
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end(`Hello from Node.js! You are on the path: ${path}\n`);
});

server.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
