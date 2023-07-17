const jwt = require('jsonwebtoken');

const auth = async (req, ress, next) => {
    try{
        const token = req.header('x-auth-token');
        if(!token) return ress.status(401).json({msg: 'No auth token, acces denied'});

        const verified = jwt.verify(token, 'passwordKey');
        if(!verified) return ress.status(400).json({msg: 'Token verification failed authorization denied.'});

        req.user = verified.id;
        req.token = token;
        next();
    }catch(err){
        ress.state(500).json({error: err.message});
    }
}

module.exports = auth;