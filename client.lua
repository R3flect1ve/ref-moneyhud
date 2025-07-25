local QBCore = exports['qb-core']:GetCoreObject()

function UpdateHUD()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local cash = PlayerData.money["cash"] or 0
    local id = GetPlayerServerId(PlayerId())
    local count = #GetActivePlayers()

    SendNUIMessage({
        action = "updateHud",
        cash = cash,
        id = id,
        players = count
    })
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(1000)
    UpdateHUD()
end)
RegisterNetEvent('QBCore:Player:SetPlayerData', function()
    Wait(100)
    UpdateHUD()
end)
RegisterNetEvent('QBCore:Player:SetMoney', function()
    Wait(100)
    UpdateHUD()
end)
RegisterCommand("updatehud", function()
    UpdateHUD()
end)

CreateThread(function()
    while true do
        Wait(5000)
        UpdateHUD()
    end
end)
