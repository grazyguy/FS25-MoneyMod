MoneyMod = {}

function MoneyMod:loadMap(name)
    print("========================================")
    print("FS25 MoneyMod geladen")
    print("F8  = +100.000")
    print("F9  = +1.000.000")
    print("F10 = +10.000.000")
    print("========================================")

    addConsoleCommand(
        "money100k",
        "Add 100.000 money",
        "MoneyMod:add100k",
        self
    )

    addConsoleCommand(
        "money1m",
        "Add 1.000.000 money",
        "MoneyMod:add1m",
        self
    )

    addConsoleCommand(
        "money10m",
        "Add 10.000.000 money",
        "MoneyMod:add10m",
        self
    )
end

function MoneyMod:add100k()
    self:addMoney(100000)
end

function MoneyMod:add1m()
    self:addMoney(1000000)
end

function MoneyMod:add10m()
    self:addMoney(10000000)
end

function MoneyMod:addMoney(amount)

    if g_currentMission == nil then
        print("MoneyMod: Keine aktive Mission.")
        return
    end

    local farmId =
        g_currentMission:getFarmId()

    if farmId == nil then
        print("MoneyMod: Keine Farm gefunden.")
        return
    end

    local farm =
        g_farmManager:getFarmById(farmId)

    if farm == nil then
        print("MoneyMod: Farm nicht gefunden.")
        return
    end

    farm.money =
        farm.money + amount

    print(
        string.format(
            "MoneyMod: +%d Euro",
            amount
        )
    )

    print(
        string.format(
            "MoneyMod: Neues Guthaben: %.2f Euro",
            farm.money
        )
    )
end

function MoneyMod:deleteMap()
end

function MoneyMod:keyEvent(unicode, sym, modifier, isDown)
end

function MoneyMod:mouseEvent(posX, posY, isDown, isUp, button)
end

function MoneyMod:update(dt)
end

function MoneyMod:draw()
end

addModEventListener(MoneyMod)