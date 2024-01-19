const express = require("express");
const app = express();
const port = 3000;
const mysql = require("mysql");

const connection = mysql.createConnection({
  host: process.env.TARGET,
  user: "dbuser",
  password: "s3kreee7",
  database: "my_db",
});

connection.connect();

app.get("/", (req, res) => {
  res.send("Hola Mundo");
});

app.get("/db", (req, res) => {
  connection.query("SELECT 1 + 1 AS solution", (err, rows, fields) => {
    if (err) throw err;

    console.log("The solution is: ", rows[0].solution);
    res.json(rows[0].solution);
  });
});

app.listen(port, () => {
  console.log(`🚀 Example app listening on port ${port}`);
});
