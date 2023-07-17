
// IMPOrts FROM PACKAGES
const express  = require('express'); //imoprt statement
const mongoose = require('mongoose');
const cors = require('cors');

//IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

const PORT = process.env.PORT || 3000;
const app = express(); //initalizing app variable constant
const DB = "mongodb+srv://ishan:ishanskm@cluster0.vcehgp6.mongodb.net/?retryWrites=true&w=majority"

//middleware
//CLIENT -> MIDDLEWARE -> SERVER -> CLIENT

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//Connections
mongoose.connect(DB).then(()=> {
    console.log("Connection Sucessful");
}).catch((e)=>{
    console.log(e);
});

// Crateaing an API
//  GET, PUT, POST, DELETE, UPDATE -> CRUD REQUEST
// http://<yourIPadderss>/hello-world
// app.get("/hello-world", (req, res)=>{
//     // res.send("hello world");
//     res.json({
//         name: 'Ishan',
//         class: 'A',
//         gender: 'Male'
//     });
// });
 

app.listen(PORT,"0.0.0.0", ()=>{
    console.log(`connected at ${PORT} `);
}); //binds to a host andlistens to any change 
    // IP if left empty, it will connnect localhost
    