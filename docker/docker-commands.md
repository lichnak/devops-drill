## Historie příkazů

```
docker stop $(docker ps -q --all | cut -d " " -f 1)
```

- **docker ps -q --all**: &nbsp; &nbsp; Tento příkaz zobrazí seznam ID všech kontejnerů(včetně zastavených)

- **docker stop $(...)**: &nbsp; &nbsp; Příkaz docker stop zastaví běžící kontejnery

- **můžeme použít také**: <code>docker stop $(docker ps -q --all)</code>

```
docker compose --env-file ./src/.env -f docker-compose.dev.yml down
```

- **docker compose**: &nbsp; Příkaz pro správu multi-kontejnerových Docker aplikací.
- **--env-file ./src/.env**: &nbsp; Určuje soubor s prostředím (.env), který se má použít.
- **-f docker-compose.dev.yml**: &nbsp; Určuje konkrétní YAML soubor pro Docker Compose konfiguraci, ergo docker-compose.dev.yml.
- **down**: &nbsp; Zastaví a odstraní kontejnery, sítě, svazky a obrazy definované v Docker Compose souboru.

```
source ~/.zshrc
```

- načte a provede příkazy uložené v souboru .zshrc

```
docker exec -it 755f181aese777 sh
```

- **docker exec**: &nbsp; Příkaz pro spuštění nového procesu v běžícím kontejneru.
- **-it**: &nbsp; Přepínače pro interaktivní režim s připojením na terminál.
- **755f181aese777**: &nbsp; ID běžícího kontejneru, ve kterém se má spustit příkaz.
- **sh**: &nbsp; Shell, který se má spustit uvnitř kontejneru.

```
docker logs -f 755f181aese777
```

- **docker logs**: &nbsp; Příkaz pro zobrazení logů kontejneru.
- **-f**: &nbsp; Sleduje (streamuje) nové logy v reálném čase
- **755f181aese777**: &nbsp; ID nebo název kontejneru, jehož logy se mají zobrazit.

```
docker pull node
```

- **docker pull**: &nbsp; Příkaz pro stažení Docker obrazu z registru.
- **node**: &nbsp; Název a tag obrazu, který se má stáhnout (v tomto případě poslední verze Node.js).

```
docker run -it -v /mnt/c/www/github/f13-zkouska:/data node`
```

- **docker run**: &nbsp; Příkaz pro spuštění nového kontejneru.
- **-it**: &nbsp; Přepínače pro interaktivní režim s připojením na terminál.
- **-v /mnt/c/www/github/f13-zkouska**: &nbsp;/data: Připojení svazku (volumes) z hostitelského systému do kontejneru. V tomto případě adresář /mnt/c/www/github/f13-zkouska na hostiteli je připojen jako /data v kontejneru.
- **node**: &nbsp; Název a tag obrazu, který se má použít pro kontejner.

```
docker run -it --rm --name my-node-test -v "$PWD":/usr/src/app -w /usr/src/app node sh -c "npm install -D && npm i eslint-config-next -D"
```

- **docker run**: &nbsp; Příkaz pro spuštění nového kontejneru.
- **-it**: &nbsp; Přepínače pro interaktivní režim s připojením na terminál.
- **--rm**: &nbsp; Automaticky odstraní kontejner po jeho ukončení.
- **--name my-node-test**: &nbsp; Přiřazuje jméno kontejneru (my-node-test).
- **-v "$PWD":/usr/src/app**: &nbsp; Připojuje aktuální pracovní adresář (host) do /usr/src/app (kontejner).
- **-w /usr/src/app**: &nbsp; Nastavuje pracovní adresář v kontejneru na /usr/src/app.
- **node:** Název a tag obrazu, který se má použít pro kontejner.
- **sh -c "npm install -D && npm i eslint-config-next -D"**: &nbsp; Spustí shell s příkazem, který nainstaluje závislosti pomocí npm.

---

### Cvičení

---

**Co dělají příkazy:**

<details>
<summary>
docker compose
</summary>
<code>Příkaz pro správu multi-kontejnerových Docker aplikací.</code>
</details>

<details>
<summary>
source ~/.zshrc
</summary>
<code>Příkaz načte a provede obsah souboru `.zshrc` v domovském adresáři uživatele. </br> Tento soubor obvykle obsahuje nastavení proměnných prostředí, aliasů a funkcí pro Zsh shell.
</code>
</details>

<details>
<summary>
docker exec -it 755f181aese777 sh
</summary>
<code>Příkaz spustí nový proces v běžícím Docker kontejneru.</br>
Přepínače `-it` zajišťují interaktivní režim s připojením na terminál. `sh` spustí shell uvnitř kontejneru s ID `755f181aese777`.
</code>
</details>

<details>
<summary>
docker logs -f 755f181aese777
</summary>
<code>Příkaz zobrazí logy kontejneru s ID `755f181aese777`.</br>
Přepínač `-f` sleduje (streamuje) nové logy v reálném čase.
</code>
</details>

<details>
<summary>
docker pull node
</summary>
<code>Příkaz stáhne nejnovější verzi Docker obrazu pro Node.js z Docker registru.
</code>
</details>
