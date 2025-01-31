// ...

// Register
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
  
  // Login
  app.post('/login', function(req, res) {
    const user = req.body;
    collection.findOne({ email: user.email, password: user.password }, function(err, result) {
      if (err) {
        res.status(500).send(err);
      } else if (result) {
        if (result.role === 'admin') {
          res.send({ token: 'admin-token', role: 'admin' });
        } else {
          res.send({ token: 'user-token', role: 'user' });
        }
      } else {
        res.status(401).send('Invalid email or password');
      }
    });
  });
  
  // Get Aktivitas (admin only)
  app.get('/aktivitas', authenticateAdmin, function(req, res) {
    collection.find().toArray(function(err, result) {
      if (err) {
        res.status(500).send(err);
      } else {
        res.send(result);
      }
    });
  });
  
  // Post Aktivitas (admin only)
  app.post('/aktivitas', authenticateAdmin, function(req, res) {
    const aktivitas = req.body;
    collection.insertOne(aktivitas, function(err, result) {
      if (err) {
        res.status(500).send(err);
      } else {
        res.send('Aktivitas berhasil ditambahkan');
      }
    });
  });
  
  // Get Aktivitas (user only)
  app.get('/aktivitas/user', authenticateUser, function(req, res) {
    collection.find({ userId: req.user._id }).toArray(function(err, result) {
      if (err) {
        res.status(500).send(err);
      } else {
        res.send(result);
      }
    });
  });
  
  // ...
  
  function authenticateAdmin(req, res, next) {
    const token = req.headers['x-access-token'];
    if (token === 'admin-token') {
      next();
    } else {
      res.status(401).send('Unauthorized');
    }
  }
  
  function authenticateUser(req, res, next) {
    const token = req.headers['x-access-token'];
    if (token === 'user-token') {
      next();
    } else {
      res.status(401).send('Unauthorized');
    }
  }  