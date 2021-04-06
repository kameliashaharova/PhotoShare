var express = require("express");
var router = express.Router();
const { successPrint, errorPrint } = require("../helpers/debug/debugprinters");
const { create } = require('../models/comments');

router.post('/create', (req, res, next) => {
    console.log(req.body);
    res.json("we got your comment");
})


module.exports = router;