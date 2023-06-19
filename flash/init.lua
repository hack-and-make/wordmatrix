lastWordId = 1
wordId = 1


local randomWordTimer = tmr.create()
randomWordTimer:register(5000, tmr.ALARM_AUTO, function(t) randomWord(); end)
randomWordTimer:start()

function foo() 
    ws2812.init()
    local ledCount = 784
    local bytesPerLed = 3
    local words
    
    return {
        ledCount = ledCount;
        bytesPerLed = bytesPerLed;
        ledBuffer = ws2812.newBuffer(ledCount, bytesPerLed);
        init = function(this)
            print("init")
            local json = readFile('words.json')
            print(json)
            this.words = sjson.decode(json)
        end;
        set = function(this,id)
            print("set")
            this.ledBuffer:set(id, 255, 255, 255)
        end;
        show = function(this)
            print("show")
            ws2812.write(this.ledBuffer)
        end;
        reset = function(this)
            this.ledBuffer:fill(0,0,0)
        end;
    }
end

function randomWord()
    local wordcount = table.getn(fooInstance.words["words"])
    
    setRandomWordId(wordcount)
    setLeds(getWord(fooInstance.words, wordId))
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
    fooInstance:reset()
    for k,v in pairs(word) do
        print("setLed(r, g, b, " .. v .. ")")
        fooInstance:set(v)
    end

    fooInstance:show()
end

function readFile(filename)
    local out

    if file.open(filename) then
        out = file.read(2000)
        file.close()
    end

    return out
end

fooInstance = foo()
fooInstance:init()