# MGE - No Alts

A SourceMod plugin that prevents alternative (alt) accounts from joining MGE arenas in Team Fortress 2.

## Description

This plugin integrates with MGE servers to automatically detect and block alt accounts from participating in MGE arenas. When an alt account attempts to join an arena, they are prevented from doing so and receive a notification explaining why they cannot join.

## Features

- **Alt Account Detection**: Automatically identifies alt accounts using the Whois system
- **Arena Access Control**: Blocks alt accounts from joining any MGE arena
- **User Feedback**: Provides clear messages to players when they are blocked, including information about their linked main account
- **Seamless Integration**: Works transparently with existing MGE functionality

## Dependencies

This plugin requires the following dependencies to function properly:

### Required Plugins

1. **[maxijabase/MGEMod](https://github.com/maxijabase/MGEMod)**
   - Provides the core MGE functionality and arena system
   - Required for the `MGE_OnPlayerArenaAdd` forward hook
   - Must be loaded before this plugin

2. **[maxijabase/sm-whois](https://github.com/maxijabase/sm-whois)**
   - Provides alt account detection and linking functionality
   - Required for the `Whois_IsLinkedAlt` native function
   - Must be loaded before this plugin