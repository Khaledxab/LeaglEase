const UserModel = require("../models/user.model");
const jwt = require("jsonwebtoken");


class UserServices{
    static async registerUser(firstName,secondName,email,password,job){
        try {
            const createUser = new UserModel({firstName,secondName,email,password,job});
            return await createUser.save();
        }
        catch(err){
            console.log(err);
        }
    }

    static async checkUser(email){
        try {
            return await UserModel.findOne({email});
        }catch(error){
            throw error;
        }
    }

    static async generateAccessToken(tokenData,scretKey,jwt_expire){
        try {
            return await jwt.sign(tokenData,scretKey,{expiresIn:jwt_expire});
        } catch (error) {
            throw error;
        }
    }
}

module.exports = UserServices;