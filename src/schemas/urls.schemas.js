import joi from "joi";

const create = joi.object({
    url: joi.string().trim().uri().required()
})

const id = joi.object({
    id: joi.string().pattern(/^\d+$/).messages({'string.pattern.base': 'The id parameter must contain only numbers.'}).required()
})

const shortUrl = joi.object({
    shortUrl: joi.string().required()
})

const urlsSchemas = {
    create,
    id,
    shortUrl
}


export default urlsSchemas