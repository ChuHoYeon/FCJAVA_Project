const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors')

const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
    cors: {
        origin: "http://http://localhost:8082",  // JSP 애플리케이션이 실행되는 도메인
        methods: ["GET", "POST"]
    }
});

app.use(cors())

app.get('/', (req, res) => {
    res.send('Socket.IO server running');
});

let users = {};

io.on('connection', (socket) => {
	 console.log('a user connected: ' + socket.id);
	
	 // 새로운 사용자가 연결되면 사용자 정보 저장
    socket.on('set username', (username) => {
    	console.log(username);
        users[socket.id] = username;
        console.log(users);
        io.emit('user connected', username);
    });
    
    socket.on('chat message', (msg) => {
        const username = users[socket.id] || 'Anonymous';
        io.emit('chat message', { username, msg });
    });
    
    socket.on('disconnect', () => {
        const username = users[socket.id];
        delete users[socket.id];
        io.emit('user disconnected', username);
        console.log('user disconnected: ' + socket.id);
    });
});

server.listen(3000, () => {
    console.log('listening on *:3000');
});