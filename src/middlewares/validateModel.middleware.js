export function validateModel(model){
    return (req, res, next) => {
        const { error, value } = model.validate(req.body, {abortEarly: false})
        console.log(value)

        if (error) {
            const errors = error.details.map((detail) => detail.message)
            return res.status(422).send(errors)
        }
    }
}