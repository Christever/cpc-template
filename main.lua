io.stdout:setvbuf("no")

love.graphics.setDefaultFilter("nearest", "nearest")

-- require("core.Reg")

-- Configuration du rendu Amstrad CPC (Mode 1 : 320 x 200, 40 colonnes)
local SCREEN_W, SCREEN_H = 160, 200

-- On définit deux échelles : les pixels horizontaux sont 2 fois plus grands
local SCALE_Y = 4
local SCALE_X = SCALE_Y * 2 -- Soit un grossissement de 8 sur la largeur

local canvas = nil
require("core.CPCFont")
State = require("states.Menu")

function love.load()
    canvas = love.graphics.newCanvas(SCREEN_W, SCREEN_H)
    State.load()
end

function love.update(dt)
    State.update(dt)
end

function love.draw()
    -- 1. On cible le canvas pour dessiner le fond et le texte rétro
    love.graphics.setCanvas(canvas)
    love.graphics.clear(CPC_PALETTE[0]) -- Fond Bleu

    -- On force la couleur blanche par défaut avant d'écrire pour éviter les reliquats
    love.graphics.setColor(1, 1, 1)

    -- On écrit sur le canvas
    State.draw()

    -- 2. On arrête de cibler le canvas pour dessiner sur l'écran réel
    love.graphics.setCanvas()

    -- 3. On affiche le canvas à l'écran en blanc neutre (pour ne pas teinter le rendu)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(canvas, 0, 0, 0, SCALE_X, SCALE_Y)
end


function love.keypressed(key, isrepeat)
    State.keypressed(key)
end

function love.mousepressed(x, y, btn)
    State.mousepressed(x, y, btn)
end
