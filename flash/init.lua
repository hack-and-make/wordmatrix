dofile('Matrix.lua')
dofile('LedMatrix.lua')

lastWordId = 0
wordId = 0

local randomWordTimer = tmr.create()
randomWordTimer:register(5000, tmr.ALARM_AUTO, function(t) randomWord(); end)
randomWordTimer:start()

function randomWord()
    local json = readFile('words.json')
    local words = sjson.decode(json)
    local wordcount = table.getn(words["words"])

    setRandomWordId(wordcount)
    setLeds(getWord(words, wordId))
end

function setRandomWordId(wordcount)
    while(wordId == lastWordId) do
        wordId = node.random(wordcount)
        print("wordId " .. wordId .. ", lastWordId " .. lastWordId)
    end

    lastWordId = wordId
end

function getWord(words, id)
    for i, v in ipairs(words["words"]) do
        if i == id then
            return v
        end
    end
end

function setLeds(word)
    ws2812.init()
    local ledMatrixInstance = newLedMatrix(10, 1, true, false, false, true, true)

    for k,v in pairs(word) do
        ledMatrixInstance:set(v, 1, 255, 255, 255)
        print("setLed(r, g, b, " .. v .. ")")
    end

    ledMatrixInstance:show()
end

function readFile(filename)
    local out

    if file.open(filename) then
        out = file.read()
        file.close()
    end

    return out
end
