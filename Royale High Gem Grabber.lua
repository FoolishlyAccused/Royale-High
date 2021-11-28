--########    FPS Boost   ########--
_G.FpsBoost = true --If you want a bit more higher frames when autofarming, leave this on but it will look like complete ass

if _G.FpsBoost then
    for _,v in pairs(workspace:GetDescendants()) do
if v.ClassName == "Part"
    or v.ClassName == "SpawnLocation"
        or v.ClassName == "WedgePart"
            or v.ClassName == "Terrain"
                or v.ClassName == "MeshPart" then
v.BrickColor = BrickColor.new(155, 155, 155)
v.Material = "Plastic"
    end
end

for _,v in pairs(workspace:GetDescendants()) do
if v.ClassName == "Decal"
    or v.ClassName == "Texture" then
v:Destroy()
        end
    end
end
print("-------------###############################################")
warn("-             Textures, Meshes & Terrain Removed, Enjoy Ass!")
print("-------------###############################################")
wait(1.5)
--########    AutoExec Stuff & Server Hop   ########--
if  game.PlaceId == 735030788 then
repeat wait() until game:IsLoaded()
game:GetService("TeleportService"):Teleport(1765700510, LocalPlayer)
end
if  game.PlaceId == 1765700510 then
repeat wait() until game:IsLoaded()
spawn(function()
while wait() do
for _,v in pairs(game:GetService("Workspace").DIAMONDS:GetDescendants()) do
if v:IsA("TouchTransmitter") then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
end
end
end
end)
spawn(function()
for i=1,math.huge do 
warn('░█████╗░░█████╗░██████╗░██╗░░░██╗██████╗░░█████╗░██████╗░░█████╗░░░░██╗░██╗░░█████╗░░█████╗░░█████╗░░░███╗░░')
warn('██╔══██╗██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██████████╗██╔══██╗██╔═══╝░██╔══██╗░████║░░')
warn('██║░░╚═╝███████║██████╔╝░╚████╔╝░██████╦╝███████║██████╔╝███████║╚═██╔═██╔═╝╚█████╔╝██████╗░╚█████╔╝██╔██║░░')
warn('██║░░██╗██╔══██║██╔═══╝░░░╚██╔╝░░██╔══██╗██╔══██║██╔══██╗██╔══██║██████████╗██╔══██╗██╔══██╗██╔══██╗╚═╝██║░░')
warn('╚█████╔╝██║░░██║██║░░░░░░░░██║░░░██████╦╝██║░░██║██║░░██║██║░░██║╚██╔═██╔══╝╚█████╔╝╚█████╔╝╚█████╔╝███████╗')
warn('░╚════╝░╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░╚═╝░╚═╝░░░░╚════╝░░╚════╝░░╚════╝░╚══════╝')
wait(1)
print("-------------#############################")
warn('-             Grabbing Diamonds...') 
print("-------------#############################")
wait(2.5)
print("-------------#############################")
warn('-             If Kicked, Its A Success')
print("-------------#############################")
wait(10)
game.Players.LocalPlayer:Kick('Royale High Diamond Cooldown | Rejoining In 300 Seconds | All Diamonds Were Yoinked!')
wait(300)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

Teleport()
end
end)
end