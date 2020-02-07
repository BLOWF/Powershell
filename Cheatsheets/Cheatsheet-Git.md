<h1>Git Cheatsheet</h1>
<h2>Branch anlegen, Pushen, Pull Request erstellen</h2>
Branch anlegen (noch lokal)

```
git checkout -b added_AU_Script
```
Änderungen etc. anzeigen
```
git status
```
Änderungen bereitstellen (engl. stagen) (für commit vorereiten)
```
git add dateiname oder git add --all
```
Vorbereitung zum Pushen (Meassage wird festgelegt)
```
git commit -a -m "Added AAD_Manage_AdministrativeUnit script" 
```
In Bitbucket "hochgepushen"
```
git push origin $(current_branch)
```
Anschließend Pull Request erstellen

<h2>Sonstige Befehle</h2>

Branch löschen
```
git branch -d added_AU_Script
```
Branches anzeigen (lokal)
```
git branch -a
```
Alte branches aufräumen (wurden teilweise von bitbucket gezogen) ..muss einfach immer wieder mal gemacht werden
```
git fetch --all --prune 
```
Wenn lokal (alle) Dateien zerschossen wurden (bzw einfach um lokale Änderungen zu verwerfen)
```
git reset --hard
```
