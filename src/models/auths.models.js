import Joi from "joi";

export const signupModel = Joi.object({
  name: Joi.string().min(3).required(),
  email: Joi.string().email().required(),
  password: Joi.string().required(),
  confirmPassword: Joi.string().valid(Joi.ref("password")).required().messages({
    "any.only": "Passwords must match",
  }),
});

export const signinModel = Joi.object({
  email: Joi.string().email().required(),
  password: Joi.string().required()
})

// export const tokenModel = Joi.object({
//   authorization: Joi.string().required()
// })