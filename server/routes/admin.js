const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const {Product} = require('../models/product');
//Add product
adminRouter.post('/admin/add-product', admin, async(req, res)=>{
    try {
        const {name, description, images, quantity, price, category} = req.body;
        let product = Product({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });

        product = await product.save();// saving to mongo database and returning it
        res.json(product);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

//Get all the product product
adminRouter.get('/admin/get-products', admin, async(req, res)=>{
    try {
        const products = await Product.find({}); //gives list of document
        res.json(products);
    } catch (error) {
        res.status(500).json({error:error.message});
    }
    
})

//Delete the prouct
adminRouter.post('/admin/delete-product', admin, async(req, res)=>{
    try {
        const {id} = req.body;
        let product = await Product.findByIdAndDelete(id);
        
        res.json(product);
    } catch (error) {
        res.status(500).json({error:error.message});
    }
})

module.exports = adminRouter;