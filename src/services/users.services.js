import usersRepositories from "../repositories/users.repositories.js"

async function getUserData(res){
    const { userId } = res.locals

    const {rows: [userData]} = await usersRepositories.getUserData(userId)

    return userData
}

async function getRanking(){
    const {rows: ranking} = await usersRepositories.getRanking()

    return ranking
}

const usersServices = {
    getUserData,
    getRanking
}

export default usersServices