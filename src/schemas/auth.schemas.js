import joi from "joi";

const signUp = joi.object({
    name: joi.string().trim().required(),
    email: joi.string().email({ minDomainSegments: 2, tlds: { allow: ["com", "net"] } }).trim().required(),
    password: joi.string().min(4).max(100).required(),
    confirmPassword: joi.string().valid(joi.ref("password")).required(),
})