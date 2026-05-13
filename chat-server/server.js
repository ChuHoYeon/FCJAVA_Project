const express = require('express');
const app = express();

const server = require('http').createServer(app);
const socketIo = require('socket.io');
const cors = require('cors')

const PORT = 3000;
const CLIENT_URL = 'http://localhost:8080';

const io = socketIo(server, {
    cors: {
        origin: CLIENT_URL,
        methods: ["GET", "POST"]
    }
});

app.use(cors({
	origin: CLIENT_URL
}));

let users = {}; 


function updateTeamSize(t_num) {
    io.in(t_num).allSockets()
        .then(sockets => {
            io.to(t_num).emit('team size', sockets.size);
        })
        .catch(err => {
            console.error(`Error retrieving sockets for team ${t_num}:`, err);
        });
}


io.on('connection', (socket) => {

    socket.on('join team', (data) => {
    	const {t_num, sessionID} = data;
		
		if (!t_num || !sessionID) {
			return;
		}
		
		const roomId = String(t_num);
		
		if (users[socket.id]?.t_num === roomId) {
			return;
		}
		
        socket.join(roomId);
        users[socket.id] = {
			t_num: roomId,
			sessionID
		};
		
        io.to(t_num).emit('user connected', sessionID);
        
        updateTeamSize(roomId);
    });
    
    socket.on('chat message', (message) => {
        const user = users[socket.id];
		
		if (!user) {
			return;
		}
		
		if (!message || String(message).trim() === '') {
			return;
		}
		
		message = String(message).trim();
		
		if (message.length > 500) {
			return;
		}
		
        const { t_num, sessionID } = user;
		
        io.to(t_num).emit('chat message', {
			sessionID,
			message
		});
    });
    
    socket.on('disconnect', () => {
        const user = users[socket.id];
		
		if (!user) {
			return;
		}
		
        const { t_num, sessionID } = user;
		
        delete users[socket.id];
		
        io.to(t_num).emit('user disconnected', sessionID);
        
        updateTeamSize(t_num);
    });
});

server.listen(PORT, () => {
	console.log(`Chat server running on port ${PORT}`);
});
