local PLUGIN = PLUGIN
PLUGIN.name = "Status Bar"
PLUGIN.author = "ZeroLive"
PLUGIN.description = "Status hud."

-- BEGIN: Add health bar
local function DrawHealthBar()
    local ply = LocalPlayer()
    local health = ply:Health()
    local maxHealth = ply:GetMaxHealth()

    -- Calculate the width of the health bar
    local barWidth = math.Clamp(ScrW() * 0.1 * (health / maxHealth), 0, ScrW() * 0.1)

    -- Draw the health bar
    draw.RoundedBox(4, 50, 10, barWidth, 20, Color(255, 0, 0, 200))
    surface.SetMaterial(Material("materials/gui/hp.png"))
    surface.DrawTexturedRect(20, 10, 20, 20)
end

-- Hook into the HUDPaint event to draw the health bar
hook.Add("HUDPaint", "DrawHealthBar", DrawHealthBar)
-- END: Add health bar

-- BEGIN: Add armor bar
local function DrawArmorBar()
    local ply = LocalPlayer()
    local armor = ply:Armor()
    local maxArmor = 100 -- Set the maximum armor value here

    -- Calculate the width of the armor bar
    local barWidth = math.Clamp(ScrW() * 0.1 * (armor / maxArmor), 0, ScrW() * 0.1)

    -- Draw the armor bar
    draw.RoundedBox(4, 50, 40, barWidth, 20, Color(0, 0, 255, 200))
    surface.SetMaterial(Material("materials/gui/armor.png"))
    surface.DrawTexturedRect(20, 40, 20, 20)
end

-- Hook into the HUDPaint event to draw the armor bar
hook.Add("HUDPaint", "DrawArmorBar", DrawArmorBar)
-- END: Add armor bar

-- BEGIN: Add stamina bar
local function DrawStaminaBar()
    local ply = LocalPlayer()
    local stamina = ply:GetNetVar("stm", 100)
    local maxStamina = 100 -- Set the maximum stamina value here

    -- Calculate the width of the stamina bar
    local barWidth = math.Clamp(ScrW() * 0.128 * (stamina / maxStamina), 0, ScrW() * 0.2)

    -- Draw the stamina bar
    draw.RoundedBox(4, 50, 70, barWidth, 20, Color(0, 255, 13))
    surface.SetMaterial(Material("materials/gui/stamina.png"))
    surface.DrawTexturedRect(20, 70, 20, 20)
end

-- Hook into the HUDPaint event to draw the stamina bar
hook.Add("HUDPaint", "DrawStaminaBar", DrawStaminaBar)
-- END: Add stamina bar

function PLUGIN:ShouldHideBars()
    return true
end
