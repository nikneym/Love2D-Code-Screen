graphics = love.graphics
keyboard = love.keyboard
mouse    = love.mouse
audio    = love.audio

local text = [[
local time
local limiter
local rand

local sfx = {}

for i = 1, 4 do
	table.insert(sfx, audio.newSource("sfx/key" .. i .. ".wav"))
	sfx[i]:setVolume(love.math.random(0.1, 0.3))
end

graphics.setNewFont("font/PixelOperatorMono-Bold.ttf", 20)

function love.load()
	time = 0
	limiter = 0
end

function love.update(dt)
	time = time + dt
	if time >= 0.040 and limiter < text:len() then
		time = 0
		rand = love.math.random(#sfx)
		sfx[rand]:stop()
		sfx[rand]:play()
		limiter = limiter + 1
	end
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == "r" then
		love.load()
	end
end

function love.draw()
	graphics.setBackgroundColor(30, 30, 30)
	graphics.setColor(153, 229, 80)
	graphics.print(text:sub(0, limiter) .. "|")
end]]

local time
local limiter
local rand

local sfx = {}

for i = 1, 4 do
	table.insert(sfx, audio.newSource("sfx/key" .. i .. ".wav"))
	sfx[i]:setVolume(love.math.random(0.1, 0.3))
end

graphics.setNewFont("font/PixelOperatorMono-Bold.ttf", 20)

function love.load()
	time = 0
	limiter = 0
end

function love.update(dt)
	time = time + dt
	if time >= 0.04 and limiter < text:len() then
		time = 0
		rand = love.math.random(#sfx)
		sfx[rand]:stop()
		sfx[rand]:play()
		limiter = limiter + 1
	end
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == "r" then
		love.load()
	end
end

function love.draw()
	graphics.setBackgroundColor(30, 30, 30)
	graphics.setColor(153, 229, 80)
	graphics.print(text:sub(0, limiter) .. "|")
end