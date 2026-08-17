MoneyMod = {}

local MONEY_100K = 100000
local MONEY_1M = 1000000
local MONEY_10M = 10000000
local MONEY_100M = 100000000
local MONEY_1B = 1000000000


function MoneyMod:loadMap()

    print("========================================")
    print("FS25 MoneyMod geladen")
    print("========================================")
    print("money100k  = +100.000 €")
    print("money1m    = +1.000.000 €")
    print("money10m   = +10.000.000 €")
    print("money100m  = +100.000.000 €")
    print("money1b    = +1.000.000.000 €")
    print("========================================")


    addConsoleCommand(
        "money100k",
        "Fügt 100.000 € hinzu",
        "MoneyMod:add100k",
        self
    )


    addConsoleCommand(
        "money1m",
        "Fügt 1.000.000 € hinzu",
        "MoneyMod:add1m",
        self
    )


    addConsoleCommand(
        "money10m",
        "Fügt 10.000.000 € hinzu",
        "MoneyMod:add10m",
        self
    )


    addConsoleCommand(
        "money100m",
        "Fügt 100.000.000 € hinzu",
        "MoneyMod:add100m",
        self
    )


    addConsoleCommand(
        "money1b",
        "Fügt 1.000.000.000 € hinzu",
        "MoneyMod:add1b",
        self
    )

end


function MoneyMod:add100k()

    self:addMoney(
        MONEY_100K
    )

end


function MoneyMod:add1m()

    self:addMoney(
        MONEY_1M
    )

end


function MoneyMod:add10m()

    self:addMoney(
        MONEY_10M
    )

end


function MoneyMod:add100m()

    self:addMoney(
        MONEY_100M
    )

end


function MoneyMod:add1b()

    self:addMoney(
        MONEY_1B
    )

end


function MoneyMod:addMoney(
    amount
)

    if g_currentMission == nil then

        print(
            "MoneyMod: Keine aktive Mission."
        )

        return

    end


    if g_currentMission:getIsServer() == false then

        print(
            "MoneyMod: Nur auf dem Server/Host verfügbar."
        )

        return

    end


    local farmId =
        g_currentMission:getFarmId()


    if farmId == nil then

        print(
            "MoneyMod: Keine Farm gefunden."
        )

        return

    end


    if g_currentMission.addMoney ~= nil then

        g_currentMission:addMoney(
            amount,
            farmId,
            MoneyType.OTHER,
            true
        )


        print(
            string.format(
                "MoneyMod: +%d € für Farm %d",
                amount,
                farmId
            )
        )

    else

        print(
            "MoneyMod: Diese FS25-Version unterstützt die verwendete API nicht."
        )

    end

end


function MoneyMod:deleteMap()
end


function MoneyMod:keyEvent(
    unicode,
    sym,
    modifier,
    isDown
)
end


function MoneyMod:mouseEvent(
    posX,
    posY,
    isDown,
    isUp,
    button
)
end


function MoneyMod:update(
    dt
)
end


function MoneyMod:draw()
end


addModEventListener(
    MoneyMod
)