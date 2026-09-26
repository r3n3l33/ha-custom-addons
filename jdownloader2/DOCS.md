Hier ist der angepasste und ins Deutsche übersetzte Text für deine README.md auf GitHub. Er wurde genau auf unsere Änderungen (Ingress, VNC und die entfernte YAML-Konfiguration) zugeschnitten:
Home Assistant Add-on: JDownloader 2 (mit VNC & Ingress)

JDownloader ist ein kostenloses, quelloffenes Download-Management-Tool mit einer riesigen Entwickler-Community, das das Herunterladen so einfach und schnell macht, wie es sein sollte. Nutzer können Downloads starten, stoppen oder pausieren, Bandbreitenbeschränkungen festlegen, Archive automatisch entpacken und vieles mehr. Es ist ein leicht erweiterbares Framework, das dir jeden Tag Stunden deiner wertvollen Zeit sparen kann!

Besonderheit dieser Version: Dieser Fork bietet eine vollständige grafische Benutzeroberfläche direkt in der Home Assistant Seitenleiste (via Ingress / noVNC) und ermöglicht direkten Zugriff auf deine lokalen Netzwerk- und Speicherpfade (/media und /share).
Installation

Da es sich um ein benutzerdefiniertes Add-on handelt, erfolgt die Installation über dein eigenes Home Assistant Repository:

    Navigiere in Home Assistant zu Einstellungen → Add-ons → Add-on Store.

    Klicke oben rechts auf das Menü (drei Punkte) und wähle Repositories.

    Füge die URL deines GitHub-Repositories hinzu und klicke auf Hinzufügen.

    Schließe das Fenster und klicke im Menü (drei Punkte) auf Neu laden.

    Suche im Add-on Store nach dem Add-on "JDownloader 2 (VNC)" und klicke auf Installieren.

    Aktiviere den Schalter In der Seitenleiste anzeigen, um JDownloader später bequem über das Menü aufzurufen.

    Starte das Add-on und prüfe den Reiter Protokolle (Logs), um sicherzustellen, dass der Startvorgang erfolgreich war.

Konfiguration & Nutzung

Da dieses Add-on eine vollwertige grafische Oberfläche bietet, ist keine umständliche Einrichtung über YAML-Konfigurationsfelder in Home Assistant nötig.

    Benutzeroberfläche öffnen: Klicke in der Seitenleiste deines Home Assistant auf JDownloader. Du erhältst direkten Zugriff auf das vollständige Desktop-Interface.

    MyJDownloader-Konto (Optional): Möchtest du JDownloader weiterhin über die MyJDownloader-App oder Browser-Erweiterung steuern, trage deine Zugangsdaten (E-Mail und Passwort) einfach direkt in der grafischen JDownloader-Oberfläche unter Einstellungen → MyJDownloader ein.

    Download-Pfade: Der interne Download-Ordner des Containers ist automatisch mit dem /media-Ordner deines Home Assistant Systems verknüpft. Wenn du in JDownloader etwas herunterlädst, landet es sicher auf deinem Samba-NAS-Speicher.

Füge diesen Text einfach in die README.md deines JDownloader-Ordners auf GitHub ein, dann sieht die Dokumentation im Home Assistant Add-on Store sofort professionell und aktuell aus.
