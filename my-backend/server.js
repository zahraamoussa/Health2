const express = require('express');
const app = express();
const bodyParser = require('body-parser');

// Dummy users data
const users = [
  { id: '1', email: 'user@example.com', password: 'password123' }
];

// Middleware to parse JSON bodies
app.use(bodyParser.json());

// Login endpoint
app.post('/login', (req, res) => {
  const { email, password } = req.body;
  const user = users.find(u => u.email === email && u.password === password);
  if (user) {
    res.status(200).json(user);
  } else {
    res.status(401).json({ message: 'Invalid credentials' });
  }
});

// Start the server
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
