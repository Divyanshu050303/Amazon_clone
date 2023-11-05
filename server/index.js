// import from package
const express =require('express');
const mongoose =require('mongoose');
//import from other files
const authRouter=require('./route/auth.js');
// initialize
const PORT=3000;
const app=express();
const DB="mongodb+srv://divyanshu:divya1234@cluster0.iamchvs.mongodb.net/?retryWrites=true&w=majority";
//middleware
app.use(express.json());
app.use(authRouter);
// connections

mongoose.connect(DB).then(()=>{
    console.log('connect');
}).catch(err=>{
    console.log(err);
})
app.listen(PORT,"0.0.0.0",() => {
console.log(`Connected At port ${PORT} hello`);
});