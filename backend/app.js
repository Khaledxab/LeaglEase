const express = require("express");
const body_parser = require("body-parser");
const userRouter = require("./routes/user.router");

const MongoClient = require('mongodb').MongoClient;
const mongoURL = 'mongodb://127.0.0.1:27017';
dbName = 'legaleaseDB';
const app = express();

app.use(body_parser.json())

app.use("/", userRouter);

app.post('/data', async (req, res) => {
    try {
      const client = await MongoClient.connect(mongoURL);
      const db = client.db(dbName);
      
      // Store the received data in MongoDB
      await db.collection('Cases').insertOne(req.body);
      
      client.close();
      
      res.sendStatus(200);
    } catch (err) {
      console.error(err);
      res.sendStatus(500);
    }
  });

module.exports = app;