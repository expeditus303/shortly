import joi from "joi";

const create = joi.object({
    url: joi.string().trim().uri().required()
})

const urlsSchemas = {
    create
}

export default urlsSchemas