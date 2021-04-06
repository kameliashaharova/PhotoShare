const express = require('express');
const router = express.Router();
const db = require('../config/database');

/*
router.get('/getAllUsers', (req, res, next) => {
    db.query('SELECT * from users;', (err, results, fields) => 
    {
        console.log(results);
        res.send(results);
    }) 
}); */

router.get('/getAllUsersU', (req, res, next) => {
    db.query('SELECT * from users;')
    .then(([results, fields]) => {
        console.log(results);
        res.send(results);
    })
    .catch((err) => {
        next(err);
    })
});

/*
router.get('/getAllPosts', (req, res, next) => {
    db.query('SELECT * from posts;', (err, results, fields) => 
    {
        console.log(results);
        res.send(results);
    }) 
});  */

router.get('/getAllPostsP', (req, res, next) => {
    db.query('SELECT * from posts;')
    .then(([results, fields]) => {
        console.log(results);
        res.send(results);
    })
    .catch((err) => {
        next(err);
    })
});

router.post('/createUser', (req, res, next) => {
    console.log(req.body);
    let username = req.body.username;
    let email = reg.body.email;
    let password = req.body.password;

    let baseSQL = 'INSERT INTO users (username, email, password, created) VALUES (?, ?, ?, now())';
    db.query(baseSQL, [username, email, password]).
    then(([results, fields]) => {
        if(results && results.affectedRows) {
            res.send('user was made');
        }else{
            res.send('user was not made for some reason');
        }
    })
    .catch((err) => {
            next(err);
    })
});


module.exports = router;
