function SetGlobalInfo()
    CC_Info = {}
    local Role_info = require(CONFIG.ScriptPath .. "global/role/" .. "role_info")
    CC_Info.Role_Talent_Des = Role_info.talent_des()
end
