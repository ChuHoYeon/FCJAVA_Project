const express = require('express');
const app = express();
const server = require('http').createServer(app);
const socketIo = require('socket.io');
const cors = require('cors')
const PORT = 3000;
const io = socketIo(server, {
    cors: {
        origin: 'http://localhost:8082',
        methods: ["GET", "POST"]
    }
});

app.use(cors())

let users = {}; 

io.on('connection', (socket) => {

    socket.on('join team', (data) => {
    	const {t_num, sessionID} = data;
        socket.join(t_num);
        users[socket.id] = { t_num, sessionID };
        io.to(t_num).emit('user connected', sessionID);
        
        io.in(t_num).allSockets().then(sockets => {
            const numClients = sockets.size;
            io.to(t_num).emit('team size', numClients);
        }).catch(err => {
            console.error(`Error retrieving sockets for team ${t_num}:`, err);
        });
    });
    
    socket.on('chat message', (message) => {
        const user = users[socket.id];
        if (user) {
            const { t_num, sessionID } = user;
            io.to(t_num).emit('chat message', { sessionID, message });
        }
    });
    
    socket.on('disconnect', () => {
        const user = users[socket.id];
        if (user) {
            const { t_num, sessionID } = user;
            io.to(t_num).emit('user disconnected', sessionID);
            delete users[socket.id];
            
            io.in(t_num).allSockets().then(sockets => {
                const numClients = sockets.size;
                io.to(t_num).emit('team size', numClients);
            }).catch(err => {
                console.error(`Error retrieving sockets for team ${t_num}:`, err);
            });
        }
    });
});

server.listen(PORT, () => {
	console.log('Start Server');
});
