const express = require("express");
const User = require("../models/user");
const bcrypt = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

//!post request signup
authRouter.post("/api/signup", async (req,res)=>{ 
  try {
    const {name, email, password} = req.body;

  const  existingUser = await User.findOne({email});
  if (existingUser) {''
    return res.status(400).json({
        msg:"User with same email already exits"
    });
  }

  //hast the password
const hashedPassword = await bcrypt.hash(password, 8);

 let user = new User({
    name,
    email,
    password: hashedPassword,
  });

  user = await user.save();
  res.json(user);
  } catch (e) {
    res.status(500).json({
        error : e.message
    });
  }

});

//!post signIn
authRouter.post("/api/signin", async (req,res)=>{
  try {
    const {email,password} = req.body;

    const user = await User.findOne({email});
    if (!user) {
      return res.status(400).json({msg:"User with this email does not exits..!"});
    }
    const isMatch =await bcrypt.compare(password,user.password);

    if (!isMatch) {
      return res.status(400).json({msg : "Incorrect password..!"})
    }
    const token = jwt.sign({id: user._id},"passwordKey");
    res.json({token, ...user._doc});
  } catch (e) {
    res.status(500).json({error: e.message});
  }
})



module.exports = authRouter;