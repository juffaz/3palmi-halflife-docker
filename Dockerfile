FROM jives/hlds:valve

# Copy server configuration
COPY config/server.cfg /temp/config/server.cfg

# Copy custom maps
COPY maps/ /temp/mods/valve/maps/

# Optional mapcycle
COPY mapcycle.txt /temp/mods/valve/mapcycle.txt

# Не трогаем WORKDIR — пусть остаётся из базового образа

EXPOSE 27015/udp 27015/tcp 26900/udp

CMD ["+log", "on", "+map", "gas_workz", "+maxplayers", "16"]
