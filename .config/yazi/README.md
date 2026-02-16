# Gruvbox — Yazi Flavors (Dark + Light)

Thèmes Gruvbox complets pour [Yazi](https://yazi-rs.github.io/), le file manager
terminal en Rust. Inclut les deux variantes Dark et Light avec coloration syntaxique
pour les previews de code.

---

## Structure des fichiers

```
yazi-gruvbox/
│
├── README.md                         ← ce fichier
├── theme.toml                        → copier dans ~/.config/yazi/
│
├── gruvbox-dark.yazi/                → copier dans ~/.config/yazi/flavors/
│   ├── flavor.toml                   (styles de l'interface)
│   └── tmtheme.xml                   (coloration syntaxique des previews)
│
└── gruvbox-light.yazi/               → copier dans ~/.config/yazi/flavors/
    ├── flavor.toml
    └── tmtheme.xml
```

Et ce que ça donne dans ta config finale :

```
~/.config/yazi/
│
├── theme.toml          ← active les flavors (dark/light automatique)
├── keymap.toml         (ta config de touches, non fourni ici)
├── yazi.toml           (ta config générale, non fourni ici)
│
└── flavors/
    ├── gruvbox-dark.yazi/
    │   ├── flavor.toml
    │   └── tmtheme.xml
    └── gruvbox-light.yazi/
        ├── flavor.toml
        └── tmtheme.xml
```

---

## Installation

### Option A — À la main (recommandé)

```bash
# 1. Créer le dossier flavors s'il n'existe pas
mkdir -p ~/.config/yazi/flavors

# 2. Copier les deux flavors
cp -r gruvbox-dark.yazi  ~/.config/yazi/flavors/
cp -r gruvbox-light.yazi ~/.config/yazi/flavors/

# 3. Activer les thèmes
#    Si tu n'as pas encore de theme.toml :
cp theme.toml ~/.config/yazi/theme.toml

#    Si tu as déjà un theme.toml, ajoute simplement ces lignes :
#    [flavor]
#    dark  = "gruvbox-dark"
#    light = "gruvbox-light"
```

### Option B — Avec un script

```bash
#!/usr/bin/env bash
YAZI_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/yazi"
mkdir -p "$YAZI_DIR/flavors"

cp -r gruvbox-dark.yazi  "$YAZI_DIR/flavors/"
cp -r gruvbox-light.yazi "$YAZI_DIR/flavors/"

# Injecte [flavor] dans theme.toml existant, ou le crée
if grep -q '\[flavor\]' "$YAZI_DIR/theme.toml" 2>/dev/null; then
  echo "⚠️  [flavor] déjà présent dans theme.toml — édite-le manuellement."
else
  cat >> "$YAZI_DIR/theme.toml" <<'EOF'

[flavor]
dark  = "gruvbox-dark"
light = "gruvbox-light"
EOF
  echo "✅  theme.toml mis à jour."
fi
```

---

## Fonctionnement dark/light automatique

Yazi détecte le mode sombre/clair du terminal via deux mécanismes :

1. **`$COLORFGBG`** — variable d'environnement définie par certains terminaux
   (Kitty, Alacritty, WezTerm). Format : `"foreground;background"` où le fond
   < 8 = dark, ≥ 8 = light.

2. **OSC 11** — requête de couleur de fond terminal (méthode moderne, fonctionne
   avec la plupart des terminaux récents).

Si ton terminal ne supporte ni l'un ni l'autre, Yazi utilise `dark` par défaut.
Tu peux forcer un mode en mettant la même valeur pour `dark` et `light`.

---

## Personnaliser sans toucher aux flavors

Le `theme.toml` peut **surcharger** n'importe quelle valeur d'un flavor.
Les overrides se placent **en dehors** de la section `[flavor]` :

```toml
# ~/.config/yazi/theme.toml

[flavor]
dark  = "gruvbox-dark"
light = "gruvbox-light"

# ── Surcharges personnelles ────────────────────────────────────────────────
# Exemple : changer la couleur du CWD
[manager]
cwd = { fg = "#fabd2f", bold = true }

# Exemple : changer les bordures
[manager]
border_style = { fg = "#928374" }

# Exemple : forcer des permissions en italic
[status]
permissions_x = { fg = "#b8bb26", italic = true }
```

> Les overrides dans `theme.toml` ont priorité sur le `flavor.toml`.
> Le flavor n'est jamais modifié, ce qui facilite les mises à jour.

---

## Palette de couleurs

### Gruvbox Dark

| Nom      | Hex       | Usage dans le thème                        |
|----------|-----------|--------------------------------------------|
| bg0      | `#282828` | Fond global, texte des éléments hover      |
| bg1      | `#3c3836` | Onglets inactifs, fond status bar          |
| bg2      | `#504945` | Sélections                                 |
| bg3      | `#665c54` | Bordures                                   |
| bg4      | `#7c6f64` | Éléments inactifs                          |
| fg1      | `#ebdbb2` | Texte principal, fichiers texte            |
| red      | `#fb4934` | Mots-clés, archives, fichiers coupés       |
| green    | `#b8bb26` | Mode normal, exécutables, copie            |
| yellow   | `#fabd2f` | Hover, onglet actif, input, titres         |
| blue     | `#83a598` | CWD, fonctions, clés TOML                  |
| aqua     | `#8ec07c` | Liens symboliques, permission exec         |
| orange   | `#fe8019` | Vidéo/audio, regex, gras markdown          |
| purple   | `#d3869b` | Images, constantes, fichiers marqués       |
| gray     | `#928374` | Commentaires, permissions spéciaux         |

### Gruvbox Light

| Nom      | Hex       | Équivalent dark                            |
|----------|-----------|--------------------------------------------|
| bg0      | `#fbf1c7` | `#282828`                                  |
| bg1      | `#ebdbb2` | `#3c3836`                                  |
| bg2      | `#d5c4a1` | `#504945`                                  |
| bg3      | `#bdae93` | `#665c54`                                  |
| fg1      | `#3c3836` | `#ebdbb2`                                  |
| red      | `#9d0006` | `#fb4934`                                  |
| green    | `#79740e` | `#b8bb26`                                  |
| yellow   | `#b57614` | `#fabd2f`                                  |
| blue     | `#076678` | `#83a598`                                  |
| aqua     | `#427b58` | `#8ec07c`                                  |
| orange   | `#af3a03` | `#fe8019`                                  |
| purple   | `#8f3f71` | `#d3869b`                                  |
| gray     | `#928374` | `#928374` (identique)                      |

---

## Fichiers du flavor — référence rapide

### `flavor.toml` — sections disponibles

| Section        | Contrôle                                          |
|----------------|---------------------------------------------------|
| `[manager]`    | Liste de fichiers, onglets, marqueurs, bordures   |
| `[mode]`       | Indicateur de mode en bas à gauche                |
| `[status]`     | Barre de statut, permissions, progression         |
| `[input]`      | Champ de saisie (renommage, recherche…)           |
| `[select]`     | Menu de sélection                                 |
| `[completion]` | Autocomplétion de la command palette              |
| `[tasks]`      | Panneau des tâches en cours                       |
| `[spot]`       | Popup d'info rapide                               |
| `[notify]`     | Notifications (info / warn / error)               |
| `[help]`       | Panneau d'aide (`~` par défaut)                   |
| `[filetype]`   | Couleur par type MIME ou attribut fichier         |

### `tmtheme.xml` — coloration syntaxique

Utilisé pour les previews de fichiers de code dans le panel de droite.
Format compatible **TextMate / Sublime Text / Syntect**.

Les scopes couverts : commentaires, strings, nombres, mots-clés, opérateurs,
types, fonctions, variables, constantes, balises HTML/XML, regex, Markdown
(titres, gras, italique, liens, code inline), TOML/JSON/YAML, erreurs.

---

## Mise à jour

Pour mettre à jour un flavor sans perdre tes overrides :

```bash
# Remplacer le dossier du flavor (tes overrides sont dans theme.toml, pas ici)
cp -r gruvbox-dark.yazi ~/.config/yazi/flavors/
cp -r gruvbox-light.yazi ~/.config/yazi/flavors/
# theme.toml n'est pas touché → tes personnalisations sont conservées
```

---

## Ressources

- [Documentation des thèmes Yazi](https://yazi-rs.github.io/docs/configuration/theme)
- [Flavors officiels](https://github.com/yazi-rs/flavors)
- [Palette Gruvbox originale](https://github.com/morhetz/gruvbox)