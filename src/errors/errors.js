function errorFactory(name, message) {
    return {name, message}
}

function unprocessableEntity(message = "Unprocessable Entity"){
    return errorFactory("UnprocessableEntityError", message)
}

function conflict(message = "Conflict") {
    return errorFactory("ConflictError", message)
}

function unauthorized(message = "Unauthorized"){
    return errorFactory("UnauthorizedError", message)
}

const error = {
    unprocessableEntity,
    conflict,
    unauthorized
}

export default error