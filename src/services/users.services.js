import usersRepositories from "../repositories/users.repositories.js"

async function getUserData(res){
    const { userId } = res.locals

    const userData = await usersRepositories.getUserData(userId)

    return userData.rows
}

const usersServices = {
    getUserData
}

export default usersServices