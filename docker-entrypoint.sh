#!/bin/sh
# docker-entrypoint.sh

# Optional: Debug-Ausgabe
echo "Checking /data permissions..."
ls -la /data

# Setze die Berechtigungen für /data auf den Portainer-Benutzer
# -R für rekursiv
# -h für keine Verfolgung von Symlinks (gut für Volumes)
chown -R 10000:10000 /data || true # UID:GID von portainer-user
# Das || true verhindert, dass der Container abbricht, falls chown fehlschlägt,
# was bei bestimmten Volume-Typen passieren kann (z.B. NFS ohne root squashing).
# Entferne es, wenn du möchtest, dass es unbedingt fehlschlägt.

echo "New /data permissions:"
ls -la /data

# Führe den eigentlichen Container-Befehl aus
exec "$@"