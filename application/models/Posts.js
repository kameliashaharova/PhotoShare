var db = require("../config/database");
const PostModel = {};

PostModel.create = (title, description, photoPath, thumbnail, fk_userId) => {
  let baseSQL =
    "INSERT INTO posts (title, description, photopath, thumbnail, created, fk_userid) VALUES (?,?,?,?, now(),?);";
  return db
    .execute(baseSQL, [title, description, photoPath, thumbnail, fk_userId])
    .then(([results, fields]) => {
      return Promise.resolve(results && results.affectedRows);
    })
    .catch((err) => Promise.reject(err));
};

PostModel.search = (searchTerm) => {
  let baseSQL =
    "SELECT id, title, description, thumbnail, concat_ws('', title, description) AS haystack FROM posts HAVING haystack like ?;";
  let sqlReadySearchTerm = "%" + searchTree + "%";
  return db
    .execute(baseSQL, [sqlReadySearchTerm])
    .then(([results, fields]) => {
      return Promise.resolve(results);
    })
    .catch((err) => Promise.reject(err));
};

PostModel.getNRecentPosts = (numberOfPost) => {
  let baseSQL =
    "SELECT id, title, description, thumbnail, created FROM posts ORDER BY created DESC LIMIT ?";
  return db
    .execute(baseSQL, [numberOfPost])
    .then(([results, fields]) => {
      return Promise.resolve(results);
    })
    .catch((err) => Promise.reject(err));
};

PostModel.getPostById = (postId) => {
  let baseSQL =
    "SELECT users.username, posts.title, posts.description, posts.photopath, posts.created FROM users users INNER JOIN posts ON users.id=posts.fk_userid WHERE posts.id=?;";
  return db.execture(baseSQL, [postId]).then(([results, fields]) => {
      return Promise.resolve(results);
  })
  .catch((err) => Promise.reject(err));
};

module.exports = PostModel;
