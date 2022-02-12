[irc.libera]
Server="irc.libera.chat:6697"
Nick="{{ .Env.IRC_NICK }}"
NickServNick="{{ .Env.IRC_NICK }}"
NickServPassword="{{ .Env.IRC_PASS }}"
UseTLS=true
UseSASL=true
SkipTLSVerify=true
Label="irc"
RemoteNickFormat="[{LABEL}] <{NICK}> "

[discord.lineageos]
Token="{{ .Env.DISCORD_TOKEN }}"
Server="628008280605589549"
Label="discord"
RemoteNickFormat="<{LABEL}> {NICK}"
AutoWebhooks=true
UseLocalAvatar=["irc.libera"]
AllowMention="users"

[[gateway]]
name="lineageos-dev-irc-lineageos-dev-653821680430481418"
enable=true
    [[gateway.inout]]
    account="discord.lineageos"
    channel="ID:653821680430481418"
    [[gateway.inout]]
    account="irc.libera"
    channel="#lineageos-dev"


[[gateway]]
name="lineageos-infra-irc-lineageos-infra-653821664509034516"
enable=true
    [[gateway.inout]]
    account="discord.lineageos"
    channel="ID:653821664509034516"
    [[gateway.inout]]
    account="irc.libera"
    channel="#lineageos-infra"


[[gateway]]
name="lineageos-irc-lineageos-653821647102672926"
enable=true
    [[gateway.inout]]
    account="discord.lineageos"
    channel="ID:653821647102672926"
    [[gateway.inout]]
    account="irc.libera"
    channel="#lineageos"

[[gateway]]
name="lineageos-offtopic-897603677831962634"
enable=true
    [[gateway.inout]]
    account="discord.lineageos"
    channel="ID:897603677831962634"
    [[gateway.inout]]
    account="irc.libera"
    channel="#lineageos-offtopic"

