function errorFactory(name, message) {
    return {name, message}
}

function unprocessableEntity(message = "Unprocessable Entity"){
    return errorFactory("UnprocessableEntityError", message)
}

function conflict(message = "Conflict") {
    return errorFactory("ConflictError", message)
}

const error = {
    unprocessableEntity,
    conflict
}

export default error