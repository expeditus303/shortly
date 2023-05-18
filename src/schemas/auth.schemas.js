import joi from "joi";

const signUp = joi.object({
    name: joi.string().trim().required(),
    email: joi.string().email({ minDomainSegments: 2, maxDomainSegments: 3}).trim().required(),
    password: joi.string().min(4).max(100).required(),
    confirmPassword: joi.string().valid(joi.ref("password")).messages({'any.only': 'Passwords do not match'}).required(),
})

const signIn = joi.object({
    email: joi.string().email({ minDomainSegments: 2, maxDomainSegments: 3}).trim().required(),
    password: joi.string().min(4).max(100).required(),

})

const authSchemas = {
    signUp,
    signIn
}

export default authSchemas