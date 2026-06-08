# IT-Forum Troms — statisk nettside

En moderne, statisk HTML-versjon av it-troms.no som erstatning for den gamle WordPress-siden. Ingen database, ingen plugins, ingenting å oppdatere – bare statiske filer.

## Innhold

```
.
├── index.html            # Forside
├── dette-gjor-vi.html    # Dette gjør vi (med kontaktskjema)
├── bli-med.html          # Bli med (priser + medlemsfordeler)
├── om-oss.html           # Om oss (formål + styret)
├── medlemmer.html        # Medlemmer
├── 404.html              # Feilside
├── _redirects            # Videresending fra gamle WordPress-URLer (Netlify)
├── netlify.toml          # Netlify-konfig (headers, caching)
├── robots.txt
├── sitemap.xml
└── assets/
    ├── css/style.css
    ├── js/main.js        # Mobilmeny
    └── img/logo.svg      # Plassholder-logo (bytt ut med egen)
```

## Forhåndsvis lokalt

Åpne `index.html` i nettleseren, eller kjør en lokal server:

```bash
python3 -m http.server 8000
# Åpne http://localhost:8000
```

## Alternativ A — Netlify (anbefalt)

1. Logg inn på https://app.netlify.com
2. **Add new site → Deploy manually**, og dra hele mappen inn i opplastingsfeltet.
   (Eller koble til et Git-repo for automatisk publisering ved hver endring.)
3. Siden er live på en `*.netlify.app`-adresse med en gang.
4. **Domains → Add domain**: legg til `it-troms.no`. Følg Netlify sine instruksjoner for å peke DNS (A-record / CNAME) hos din domeneleverandør. Netlify gir gratis HTTPS automatisk.
5. `_redirects` og `netlify.toml` virker automatisk – gamle lenker som `/om-oss/` videresendes til de nye sidene.

## Alternativ B — GitHub Pages

1. Lag et repo og last opp alle filene (behold mappestrukturen).
2. **Settings → Pages → Source: Deploy from a branch**, velg `main` / root.
3. Siden publiseres på `https://<bruker>.github.io/<repo>/`.
4. For eget domene: legg til en fil `CNAME` med innholdet `it-troms.no`, og sett DNS hos domeneleverandøren.

Merk: `_redirects` virker **ikke** på GitHub Pages.

## Slik bytter du ut logoen

Legg din egen logo i `assets/img/` og oppdater `<img class="logo-mark" ...>` i toppen av hver HTML-side (og `favicon`-lenken). En kvadratisk SVG eller PNG passer best.

## Oppdatere innhold

Alt er ren HTML – rediger teksten direkte i filene. Medlemslisten ligger i `medlemmer.html`, styret i `om-oss.html`, og priser i `bli-med.html`.
