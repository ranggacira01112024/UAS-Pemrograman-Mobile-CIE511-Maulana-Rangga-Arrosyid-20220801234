const express = require('express');
const app = express();
const MongoClient = require('mongodb').MongoClient;
const url = 'mongodb://localhost:27017';
const dbName = 'dji_smart_health';

app.use(express.json());

MongoClient.connect(url, function(err, client) {
  if (err) {
    console.log(err);
  } else {
    console.log('Connected to MongoDB');
    const db = client.db(dbName);
    const collection = db.collection('users');

    app.post('/register', function(req, res) {
      const user = req.body;
      collection.insertOne(user, function(err, result) {
        if (err) {
          res.status(500).send(err);
        } else {
          res.send('User registered successfully');
        }
      });
    });

    app.post('/login', function(req, res) {
      const user = req.body;
      collection.findOne({ email: user.email, password: user.password }, function(err, result) {
        if (err) {
          res.status(500).send(err);
        } else if (result) {
          res.send('User logged in successfully');
        } else {
          res.status(401).send('Invalid email or password');
        }
      });
    });
  }
});

app.listen(3000, function() {
  console.log('DJI Smart Health Server listening on port 3000');
});
