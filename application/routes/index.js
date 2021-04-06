var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;
/*var getRecentPosts = require('../middleware/postsmiddleware').getRecentPosts;*/
const {getRecentPosts, getPostById, getCommentsByPostId} = require('../middleware/postsmiddleware');
const { post } = require('jquery');
var db = require("../config/database");

/* GET home page. */
router.get('/', getRecentPosts, (req, res, next) => {
  res.render("index", {title:"Photo App"});
});

router.get('/index', (req, res, next) => {
  res.render("index", {title:"Photo App"});
});

router.get('/login',(req, res, next) => {
  res.render('login', {title:"Log In"});
})

router.get('/registration',(req, res, next) => {
  res.render('registration', {title:"Register"});
})

router.use('/postImage', isLoggedIn);
router.get('/postImage', (req, res, next) => {
  res.render('postImage', {title:"Post an Image"});
});

/* router.get("/posts/:id(\\)", getPostById, getCommentsByPostId, (req, res, next) => // */

router.get('/post/:id(\\d+)', (req, res, next) => {
  let baseSQL = "SELECT u.username, p.title, p.description, p.photopath, p.created FROM users u JOIN posts p ON u.id=fk_userid WHERE p.id=?;";
  let postId = req.params.id;

  db.execute(baseSQL, [postId])
  .then(([results, fields]) => {
    if(results && results.length){
      let post = results[0];
      res.render('imagepost', {currentPost: post});
    }else{
      req.flash('error', 'This is not the post you are looking for!');
      res.redirect('/');
    }
  })
}); 


module.exports = router;
