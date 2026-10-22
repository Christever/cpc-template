function love.conf(t)
    t.identity = "SpaceShooter_CPC" -- Nom du dossier de sauvegarde
    t.version = "11.5"              -- Version de LÖVE (à ajuster selon la vôtre)

    t.window.title = "SpaceShooter - CPC Mode 0"
    t.window.icon = nil -- Chemin vers un fichier image si vous en avez un

    -- DIMENSIONS EXACTES (160x200 * SCALE 5)
    t.window.width = 1200
    t.window.height = 800

    t.window.borderless = false -- Conserve les bordures de la fenêtre
    t.window.resizable = false  -- Empêche le redimensionnement manuel pour ne pas casser le ratio
    t.window.fullscreen = false -- Pas de plein écran par défaut
    t.window.vsync = 1          -- Active la synchronisation verticale pour un rendu fluide
end
