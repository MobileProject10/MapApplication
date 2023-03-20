const userModel = require('../models/userModel.js');
const bcrypt = require('bcrypt');
const validator = require('validator');

const register = (req, res) => {
    const {username, password, password_rpt} = req.body

    if(typeof username !== 'string' || typeof password !== 'string' || typeof password_rpt !== 'string'){
        return res.status(400).json({msg:'Inputs are not valid'})
    }
    
    if(!username){
        return res.status(400).json({
            msg:'Please enter an username'
        })
    }
    if(!password || password.length < 5){
        return res.status(400).json({
            msg:'Password must have more than 5 characters'
        })
    }
    if(!password_rpt || password !== password_rpt){
        return res.status(400).json({
            msg:'Passwords must match'
        })
    }

    if(username.length < 3){
        return res.status(400).json({
            msg:'Username is too short'
        })
    }

    if(!validator.isStrongPassword(password, {minLength: 6, minLowercase: 0, minUppercase: 0, minSymbols: 0, minNumbers: 1})){

        return res.status(400).json({
            msg:'Password is not valid'
        })
    }

    bcrypt.hash(password, 10, (err, hash) => {

        if(err){
            console.log(err);
            return res.status(500).json({msg:'Error on registering user'}) 
        }

        userModel.register(username, hash, (err, dbRes) => {
            if(err){
                if(err.errno == 1062)
                    return res.status(400).json({msg:'Username already exists'}) 
    
                return res.status(500).json(err)
            }else{
                return res.status(200).json({msg:'s New user uccessfully registered'})
            }
        })
    })
}

const login = (req, res) => {
    const {username, password} = req.body;

    if(!username || !password){
        return res.status(400).json({status:"error",msg:"One or more fields are missing"})
    }

    if(typeof username !== 'string' || typeof password !== 'string'){
        return res.status(400).json({msg:'Inputs are not valid'})
    }

    userModel.getUserByName(username, (err, result) => {
        if(err){
            console.log(err)
            return res.status(500).json({status:"error", msg:err})
        }

        if(!result[0]){
            return res.status(400).json({status:"error", msg:"Invalid username or password"})
        }

        bcrypt.compare(password, result[0].password, (err, correctPassword) => {
            if(err){
                console.log(err)
                return res.status(500).json({status:"error", msg:"Error on comparing passwords"})
            }

            if(!correctPassword){
                return res.status(400).json({status:"error", msg:"Invalid username or password"})
            }
        })
    })

}


module.exports = {
    register,
    login
}