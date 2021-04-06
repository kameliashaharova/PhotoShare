const mysql = require('mysql2');
/*const express = require('express');
const router = express.Router(); */

const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "password",
    database: "csc317db",
    connectionLimit: 50,
    debug:false,

});

/*
pool.query(`select * from posts`, (err, result, fields) => {
    if(err) {
        return console.log(err);
    }
    return console.log(result);
}) 

pool.query(`select * from posts`, (err, result, fields) => {
    if(err) {
        return console.log(err);
    }
    return console.log(result);
}) */


const promisePool = pool.promise(); 

module.exports = promisePool;
