local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('wcrp:guarmaticketbuy')
AddEventHandler("wcrp:guarmaticketbuy", function()
    
    local _source = source

    local _ticket = Config.PricetoGuarma


end)

RegisterServerEvent('wcrp:guarmaticketbuy2')
AddEventHandler("wcrp:guarmaticketbuy2", function()
    
    local _source = source

    local _ticket = Config.PricetoSD


end)
