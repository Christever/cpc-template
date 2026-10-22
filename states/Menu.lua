local Menu = {}
local menuSelection

local function play()
    State = require("states.Game")
    State.load()
end

local function instructions()
    -- Code pour afficher les instructions plus tard
end

local function credits()
    -- Code pour afficher les crédits plus tard
end

local menuEntries = {
    { ['text'] = 'PLAY',  ['action'] = play },
    { ['text'] = 'KEYS',  ['action'] = instructions }, -- Remplace "Instructions" (Beaucoup plus court !)
    { ['text'] = 'INFO',  ['action'] = credits },      -- Remplace "Credits"
    { ['text'] = 'QUIT',  ['action'] = love.event.quit }
}

-- Fonction locale pour centrer automatiquement le texte sur 20 colonnes
local function printCentered(text, row, ink_index)
    local max_cols = 20
    local text_length = #text
    local char_x = math.floor((max_cols - text_length) / 2)
    if char_x < 0 then char_x = 0 end
    
    CPCPrint(text, char_x, row, ink_index)
end

function Menu.load()
    menuSelection = 1
end

function Menu.update(dt)
    -- Logique si nécessaire
end

function Menu.draw()
    -- Titre principal du Menu (Ligne 2 et 3)
    printCentered("--- MAIN MENU ---", 2, 2) -- Encre Cyan (2)
    printCentered("=================", 3, 2)
    
    -- Affichage dynamique de vos entrées
    local start_row = 7
    for i, entry in ipairs(menuEntries) do
        local row = start_row + (i * 2) -- Espacement vertical (une ligne sur deux)
        
        if i == menuSelection then
            -- Option sélectionnée : encadrée par des flèches en Blanc (3)
            local active_text = "> " .. entry.text .. " <"
            printCentered(active_text, row, 3)
        else
            -- Option normale : texte brut en Jaune (1)
            printCentered(entry.text, row, 1)
        end
    end
    
    -- Petit rappel des touches en bas (Ligne 20)
    printCentered("Z/S OR KEYS TO MOVE", 20, 15) -- Encre Orange (15)
end

function Menu.keypressed(key)
    if key == "up" or key == "z" then
        menuSelection = (menuSelection - 2) % (#menuEntries) + 1
    elseif key == "down" or key == "s" then
        menuSelection = (menuSelection) % (#menuEntries) + 1
    elseif key == "return" or key == "space" then
        -- Exécute la fonction associée à l'entrée (play, instructions, etc.)
        menuEntries[menuSelection].action()
    elseif key == "escape" then
        love.event.quit()
    end
end

function Menu.mousepressed(x, y, btn)
    -- Inutilisé pour un jeu pur clavier rétro
end

return Menu
