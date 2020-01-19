def livesfind(name, data)
    arr=[]
    i = 0
    while i < data[:lives].keys.length do
        if data[:lives][(data[:lives].keys[i])].include? name
            arr.push(data[:lives].keys[i])
        end
        i += 1
    end
    return arr
end

def colorfind(name, data)
    arr=[]
    i = 0
    while i < data[:color].keys.length do
        if data[:color][(data[:color].keys[i])].include? name
            arr.push(data[:color].keys[i].to_s)
        end
        i += 1
    end
    return arr
end

def nyc_pigeon_organizer(data)
    pidgeonNames = data[:gender][:male] + data[:gender][:female]
    count = 0
    newdata = {}
    lcount = 0


    while count < pidgeonNames.length
        colordata =  colorfind(pidgeonNames[count], data)
        livesdata = livesfind(pidgeonNames[count], data)
        newdata[pidgeonNames[count]] = {
                :color => (
                    colordata

                ),
                :gender => [
                    if count < data[:gender][:male].length
                        "male"
                    else
                        "female"
                    end
                ],
                :lives => (
                    livesdata
                )
            }
        count += 1
    end

    return newdata

end
