# DevOps - Git snippets

## Syntaxe Gitu

Pro využívání gitu se využívá obvyklá syntaxe v příkazovém řádku:

```bash
git <prikaz> -<x> <argument>
```

- `git` - značí, že budeme pracovat s gitem

- `<prikaz>` - kterou činnost chceme vykonat

- `<x>` - parametr upřesňující chování příkazu

- `<argument>` - informace, kterou příkaz / parametr využije

## Nová větev - Switch/Checkout

Pro vytvoření a následné přepnutí na novou větev slouží příkaz:

```bash
git switch -c nova_vetev
git checkout -b nova_vetev
```

- `switch` - přepnutí na novou větev

- `-c` - vytvoření nové větve pojmenované *nova_vetev*

Alternativa tomuto příkazu je zavolání:

```bash
git branch nova_vetev
git switch nova_vetev
```

>**Poznámka:** Parametr `-b` je běžně používán s příkazem `git checkout`  
> pro vytvoření nové větve a přepnutí na ni. -c` s `git switch` slouží k podobnému účelu.

## Přidání souborů do commitu - Add

Přidání souborů do příštího commitu se provádí příkazem:

```bash
git add .
```

- `add` - přidání souborů, dané cestou v argumentu, do příštího commitu

- `.` - cesta k souborům, v tomto případě aktuální adresář (může být adresář / konkrétní soubor)

## Vytvoření commitu - Commit

Po vybrání souborů je třeba vytvoření commitu příkazem:

```bash
git commit -m "moje skevela zprava"
```

- `commit` - Vytvoření nového commitu v aktuální větvi

- `-m` - parametr očekávající zprávu, která bude k commitu připojena

- `"moje skevela zprava"` - obvykle výstižná informace o proběhlých změnách (uvozovky nutné pro víceslovné zprávy)

## Odeslání změn na server - Push

Pro nahrání provedených commitnutých změn na server se docílí příkazem:

```bash
git push
```

- `push` - odešle commity vytvořené v aktuální větvi na sever

## Přepnutí větve - Checkout

Mezi různými větvemi se přepíná příkazem:

```bash
git checkout master
```

- `checkout` - přepne aktuální větev na větev v argumentu

- `master` - název cílové větve (master je označení hlavní větve)

>***Poznámka:*** V zadání je příkaz *chechout*, který v dokumentaci není, takže jsem zvolil nejpodobnější příkaz *checkout*.

## Stažení změn - Fetch

Pro stažení změn, které ostatní uživatelé provedli slouží příkaz:

```bash
git fetch --all
```

- `fetch` - stáhne aktualní verzi repozitáře / souborů ze serveru

- `--all` - vybrání všech dostupných souborů v aktuální větvi

## Synchronizace změn - Pull

Pro synchronizaci změn použijte příkaz:

```bash
git pull --all
```

- `pull` - synchronizuje aktualní verzi repozitáře / souborů s verzí na serveru

- `--all` - vybrání všech dostupných souborů v aktuální větvi

>***Poznámka:*** Podle dokumentace ***pull*** vnitřně volá ***fetch***  
> a podle zadaných parametrů následně naváže dalšími příkazy.

## Přepnutí větve - Switch

Druhý způsob pro přepnutí větve je příkazem:

```bash
git switch nove_vetev
```

- `switch` - přepne aktuální větev na větev v argumentu

- `nove_vetev` - název cílové větve

>***Poznámka:*** Podle mých zdrojů (stackoverflow) měl příkaz ***checkout*** v sobě zabudováno zbytečně mnoho,  
> tak byl rozdělen na více příkazů, jedním z nichž je switch

## Spojení větví - Merge

Spojení více větví nebo více verzí jedné větve se dosáhne příkazem:

```bash
git merge <nazev_vetve>
```

- `merge` - připojí do aktuální větve
- `<nazev_vetve>` - název větve, která bude spojena s aktuální větví
- `--squash` - Sloučí všechny změny do jednoho commitu bez zachování jednotlivé historie commitů z cílové větve.

## Conventional Commits

Convetional commits je způsob psaní commit zpráv,  
který zlepší čitelnost a účelnost commitů. Mohou se skládat z následujících částí:

```bash
git commit -m "<typ>[soubor/téma]: <popis>" -m "Breaking change: <popis>"
```

- `<typ>` - typ změny (např. feat pro nové funkce, fix pro opravy chyb)
- `[soubor/téma]` - specifikace části aplikace, na kterou se změna vztahuje (např. login, ui)
- `<popis>` - stručný popis provedené změny
- `-m` - parametr pro zprávu commitu
- `Breaking change` - pokud je změna zásadní, je třeba ji označit pomocí `BREAKING CHANGE:`

### Příklad

```bash
git commit -m "feat[login]: Přidání možnosti přihlášení pomocí Google" -m "Breaking change: Přidání nového způsobu přihlášení"
```
