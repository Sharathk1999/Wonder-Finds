//imports from packages
const express = require("express");
const mongoose = require("mongoose");

//imports from other files
const authRouter = require("./routes/auth");

//initializations
const PORT = 8000;
const app = express();
const DB =
  "mongodb+srv://sharath1999:sharath1999@cluster0.tgv5pcy.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json()); //returns a middleware that only parses json
app.use(authRouter);

//connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT,"0.0.0.0", () => {
  console.log(`Connected and listening to port ${PORT}`);
});
