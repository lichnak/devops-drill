# Průvodce Markdownlint

Markdownlint je nástroj založený na Node.js, který pomáhá udržet vaše soubory Markdown čisté a konzistentní.  
Běžně se používá k prosazení pravidel stylu a konzistence v dokumentaci Markdown.

## Instalace

### Globální instalace

Pro globální instalaci Markdownlint, aby bylo možné jej spustit z jakéhokoliv adresáře na vašem systému,  
použijte následující příkaz npm:

```bash
npm install -g markdownlint-cli
```

## Lokální instalace

Pokud chcete nainstalovat Markdownlint pouze pro konkrétní projekt, můžete použít následující příkaz npm:

```bash
npm install markdownlint-cli --save-dev
```

## Použití

Markdownlint můžete spustit na soubory nebo adresáře pomocí následujícího příkazu:

```bash
markdownlint <soubor nebo adresář>
```

Například, pokud chcete spustit Markdownlint na všechny soubory Markdown v aktuálním adresáři, můžete použít:

```bash
markdownlint .
```

## Konfigurace

Například, pokud chcete povolit dlouhé řádky a zakázat inline HTML, můžete vytvořit soubor .markdownlint.json s následujícím obsahem:

```json
{
    "MD013": false,
    "MD033": true
}
```

## Oficiální dokumentace

Pro více informací o Markdownlint a jeho konfiguraci navštivte oficiální dokumentaci  
na adrese: [Markdownlint](https://github.com/DavidAnson/markdownlint#related)
