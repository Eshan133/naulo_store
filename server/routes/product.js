const express = require('express');
const auth = require('../middlewares/auth');
const productRouter = express.Router();
const {Product} = require('../models/product');

//   /api/products?category=Essentials
// ->req.query.category

//   /api/amazon?theme=dark
// ->req.query.theme

//  /api/products:category=Essentials
// -> req.params.category

//Get all the product product
productRouter.get('/api/products', auth, async(req, res)=>{
    try {
       
        const products = await Product.find({category: req.query.category}); //gives list of document
        res.json(products); //return to user
    } catch (error) {
        res.status(500).json({error:error.message});
    }
    
});

//Get products based on searchQuery
productRouter.get('/api/products/search/:name', auth, async(req, res)=>{
    try {
       
        const products = await Product.find({
            name: {$regex: req.params.name, $options:"i"},
        });
        res.json(products);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

//rate the product
productRouter.post('/api/rate-product', auth, async(req, res)=>{
    try {
        const{id, rating} = req.body;
        let product = await Product.findById(id);

        for(let i=0; i<product.ratings.length; i++){
            if(product.ratings[i].userId == req.user){
                product.ratings.splice(i,1);
                break;
            }
        }

        const ratingSchema = {
            userId: req.user,
            rating,
        }

        product.ratings.push(ratingSchema);
        product = await product.save();
        res.json(product);
        
    } catch (error) {
        res.status(500).json({error:error.message});
    }
});

//getting deal of the day
productRouter.get('/api/deal-of-the-day', auth,async(req, res)=>{
    try {
        //getting all the product
        let products = await Product.find({});

        //sort in a descending order based on rating
        products = products.sort((a,b)=>{
            let aSum = 0;
            let bSum = 0;

            for(let i = 0; i < a.ratings.length; i++){
                aSum += a.ratings[i].rating;
            }

            for(let i = 0; i < b.ratings.length; i++){
                bSum += b.ratings[i].rating;
            }

            return aSum < bSum ? 1:-1;
        });

        //returning to the frontend
        res.json(products[0]);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});
module.exports = productRouter;