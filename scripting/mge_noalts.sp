#include <sourcemod>
#include <mge>
#include <whois>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo =
{
    name = "MGE - No Alts",
    author = "ampere",
    description = "Prevents alt accounts from joining MGE arenas",
    version = "1.1",
    url = "github.com/maxijabase"
};

public void OnPluginStart()
{
    LoadTranslations("common.phrases");
}

// Checks if client is an alt account before allowing arena addition
public Action MGE_OnPlayerArenaAdd(int client, int arena_index, int slot)
{
    if (!IsValidClient(client))
        return Plugin_Continue;
    
    char steamid[32];
    char mainSteamId[32]; 
    char permaname[64];
    
    if (!GetClientAuthId(client, AuthId_Steam2, steamid, sizeof(steamid)))
        return Plugin_Continue;
    
    if (Whois_IsLinkedAlt(steamid, mainSteamId, sizeof(mainSteamId), permaname, sizeof(permaname)))
    {
        PrintToChat(client, "\x07FF6B6B[MGE]\x01 Alt accounts are not allowed to join arenas.");
        PrintToChat(client, "\x07FF6B6B[MGE]\x01 This account is linked to: %s (%s)", permaname, mainSteamId);
        return Plugin_Stop;
    }
    
    return Plugin_Continue;
}

// Validates client index and connection status
bool IsValidClient(int client)
{
    return (client > 0 && client <= MaxClients && IsClientConnected(client) && IsClientInGame(client) && !IsFakeClient(client));
}
