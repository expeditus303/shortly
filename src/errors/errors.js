function errorFactory(name, message) {
    return {name, message}
}

function unprocessableEntity(name, message){
    return errorFactory("UnprocessableEntityError", message)
}

const error = {
    unprocessableEntity
}

export default error