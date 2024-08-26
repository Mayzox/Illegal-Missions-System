ByYoSe.Config.Language = {}

ByYoSe.Config.Language['fr'] = {
    talk_to_boss = "Appuyez sur ~INPUT_CONTEXT~ pour parler au boss",
    job = "Malcom : Yo mec, je suis ici pour te proposer un travail et tu chaud ?",
    already = "Malcom : Je te rappelle que tu es en train de faire une mission !",
    accept = "Appuyez sur Y pour accepter",
    refuse = "Appuyez sur G pour refuser",
    cooldown = "Malcom : Mec, attend un peu je dois chercher du travail pour toi, repasse dans : %s",
    leave = "Appuyez sur G pour partir",
    blip = "Lieu de la mission",
    blip_final = "Lieu de finale",
    vehicle_destroyed = "Le véhicule a été détruit",
    target_killed = "Vous avez tué la cible mission réussie",
    finish_mission = "Appuyez sur ~INPUT_CONTEXT~ pour terminer la mission",
    notify_final = "Malcom : Merci mec, tu es un bon gars",
    vehicle_too_far = "Malcom : fait pas le con rend moi mon véhicule",
}

ByYoSe.Config.Language['en'] = {
    talk_to_boss = "Press ~INPUT_CONTEXT~ to talk to the boss",
    job = "Malcom: Yo man, I'm here to offer you a job and you hot?",
    already = "Malcom: I remind you that you are doing a mission!",
    accept = "Press Y to accept",
    refuse = "Press G to refuse",
    cooldown = "Malcom: Man, wait a minute I have to look for work for you, go back to: %s",
    leave = "Press G to leave",
    blip = "Mission location",
    blip_final = "Final location",
    vehicle_destroyed = "The vehicle has been destroyed",
    target_killed = "You killed the target mission successful",
    finish_mission = "Press ~INPUT_CONTEXT~ to finish the mission",
    notify_final = "Malcom: Thanks man, you're a good guy",
    vehicle_too_far = "Malcom: don't be stupid give me back my vehicle",
}

ByYoSe.Config.Language['es'] = {
    talk_to_boss = "Presione ~INPUT_CONTEXT~ para hablar con el jefe",
    job = "Malcom: Yo hombre, estoy aquí para ofrecerte un trabajo y estás caliente?",
    already = "Malcom: Te recuerdo que estás haciendo una misión!",
    accept = "Presione Y para aceptar",
    refuse = "Presione G para rechazar",
    cooldown = "Malcom: Hombre, espera un minuto tengo que buscar trabajo para ti, vuelve a: %s",
    leave = "Presione G para salir",
    blip = "Ubicación de la misión",
    blip_final = "Ubicación final",
    vehicle_destroyed = "El vehículo ha sido destruido",
    target_killed = "Has matado al objetivo, la misión es exitosa",
    finish_mission = "Presione ~INPUT_CONTEXT~ para terminar la misión",
    notify_final = "Malcom: Gracias hombre, eres un buen tipo",
    vehicle_too_far = "Malcom: no seas tonto, devuélveme mi vehículo",
}

ByYoSe.Config.Language['pr'] = {
    talk_to_boss = "Pressione ~INPUT_CONTEXT~ para falar com o chefe",
    job = "Malcom: Yo homem, estou aqui para oferecer um trabalho e você está quente?",
    already = "Malcom: Lembre-se de que você está fazendo uma missão!",
    accept = "Pressione Y para aceitar",
    refuse = "Pressione G para recusar",
    cooldown = "Malcom: Homem, espere um minuto, tenho que procurar trabalho para você, volte para: %s",
    leave = "Pressione G para sair",
    blip = "Localização da missão",
    blip_final = "Localização final",
    vehicle_destroyed = "O veículo foi destruído",
    target_killed = "Você matou o alvo, a missão foi bem sucedida",
    finish_mission = "Pressione ~INPUT_CONTEXT~ para terminar a missão",
    notify_final = "Malcom: Obrigado homem, você é um bom cara",
    vehicle_too_far = "Malcom: não seja idiota, devolva meu veículo",
}

ByYoSe.Config.Language['uk'] = {
    talk_to_boss = "Натисніть ~INPUT_CONTEXT~ щоб поговорити з босом",
    job = "Malcom: Йо чоловіче, я тут щоб запропонувати тобі роботу і ти гарний?",
    already = "Malcom: Я нагадую тобі, що ти займаєшся місією!",
    accept = "Натисніть Y, щоб прийняти",
    refuse = "Натисніть G, щоб відхилити",
    cooldown = "Malcom: Чоловіче, зачекай хвилинку, мені потрібно шукати роботу для тебе, повернися до: %s",
    leave = "Натисніть G, щоб вийти",
    blip = "Місія місцезнаходження",
    blip_final = "Кінцеве місце",
    vehicle_destroyed = "Автомобіль був знищений",
    target_killed = "Ви знищили ціль, місія була успішною",
    finish_mission = "Натисніть ~INPUT_CONTEXT~ щоб завершити місію",
    notify_final = "Malcom: Дякую чоловіче, ти добрий чоловік",
    vehicle_too_far = "Malcom: не будь дурнем, поверніть мені мій автомобіль",
}

function getSetence(id)
    return ByYoSe.Config.Language[ByYoSe.Config.Locale][id]
end 