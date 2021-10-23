require "simple-slider"
W = love.graphics.getWidth()
H = love.graphics.getHeight()
A = 0
B = 200
N = 1
f = 1
NA = newSlider(W*3/4, 125, 350, 0, -100, 100, function (v) A = v end)
NB = newSlider(W*3/4, 200, 350, 200, 110, 200, function (v) B = v end)
NN = newSlider(W*3/4, 50, 350, 1, 1, 200, function (v) N = v end)
function love.update()
    NA:update()
    NB:update()
    NN:update()
    a = math.floor(A)
    b = math.floor(B)
    n = math.floor(N)
end

function love.draw()
    --repère OXY
love.graphics.line(W/8,0,W/8,H*3/4) -- la droite OY
love.graphics.line(0,H/2,W/2,H/2) -- la droite OX
    --fonction
love.graphics.setColor(0.5,1,0.5) --vert
love.graphics.print("exemples de fonction :", 0 , H*3/4, 0, 2)
love.graphics.print("    linéaire                     polynome                     racine carée", 0,(H*3/4)+50,0,2)
function love.keyreleased(key)
    if key == "right" and f < 3 then
        f = f + 1
    elseif key == "right" and f == 3 then
        f = 1
    elseif key == "left" and f > 1 then
        f = f - 1
    elseif key == "left" and f == 1 then
        f = 3
    end
end

if f == 1 then
    love.graphics.rectangle("line",0,(H*3/4)+45,150,50)
    love.graphics.line(0,(H/2)+(W/8), (W/8)+W , (H/2)-W)
elseif f == 2 then
    love.graphics.rectangle("line",270,(H*3/4)+45,150,50)
    for i=-100, 300 do
        love.graphics.points((W/8)+i,(H/2)-(i*i*0.0025))
    end
elseif f == 3 then
    love.graphics.rectangle("line",540,(H*3/4)+45,215,50)
    for i=0, 300 do
        love.graphics.points((W/8)+i,(H/2)- math.sqrt(i*50))
    end
end

    --l'interface
love.graphics.setColor(0.5, 0.5, 1, 0.2) --violet foncé
love.graphics.rectangle("fill",0,H*3/4,W,H/4)
love.graphics.rectangle("fill",W/2,0,W/2,H*3/4)
--b
love.graphics.setColor(1,0.5,0.5) --rouge
love.graphics.line((W/8)+b,(H/2)+20,(W/8)+b,(H/2))
love.graphics.print("b",(W/8)+b,(H/2)+20,0,2)
love.graphics.print("b = "..b,W*3/4, 150,0,2)
NB:draw()
--a
love.graphics.setColor(0.5,0.5,1) --bleu
love.graphics.line((W/8)+a,(H/2)+20,(W/8)+a,(H/2))
love.graphics.print("a",(W/8)+a,(H/2)+20,0,2)
love.graphics.print("a = "..a,W*3/4, 75,0,2)
NA:draw()
--n
love.graphics.setColor(1,1,1) --blanc
for i=a, b, (b-a)/n do
    if i < b then
        if f == 1 then
            love.graphics.rectangle("line",(W/8)+i,(H/2)-i,(b-a)/n,i)
        elseif f == 2 then
            love.graphics.rectangle("line",(W/8)+i,(H/2)-(i*i*0.0025),(b-a)/n,i*i*0.0025)
        elseif f == 3 then
            love.graphics.rectangle("line",(W/8)+i,(H/2)-math.sqrt(i*50),(b-a)/n,math.sqrt(i*50))
        end
    end

end
love.graphics.print("n = "..n,W*3/4, 5,0,2)
NN:draw()
love.graphics.print("chouhbi abdelmojib", W-100,H-20,0,0.75)
end