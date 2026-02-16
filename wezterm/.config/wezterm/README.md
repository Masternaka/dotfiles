# Configuration WezTerm

Ce dossier contient la configuration personnalisée pour WezTerm, un émulateur de terminal moderne et performant.

## Structure

```
wezterm/
├── wezterm.lua              # Configuration principale de WezTerm
├── themes/                  # Thèmes personnalisés
│   ├── gruvbox-dark.lua
│   ├── catppuccin-mocha.lua
│   └── nord.lua
└── README.md               # Ce fichier
```

## Configuration principale (`wezterm.lua`)

### Thème actif
- **Thème par défaut** : `gruvbox-dark` (modifiable ligne 7)
- Autres thèmes disponibles : `catppuccin-mocha`, `nord`

### Raccourcis clavier configurés

#### Gestion des panneaux (ALT)
- `ALT + Enter` : Diviser horizontalement
- `ALT + SHIFT + Enter` : Diviser verticalement
- `ALT + w` : Fermer le panneau actuel
- `ALT + Flèches` : Naviguer entre les panneaux

#### Gestion des onglets (ALT)
- `ALT + t` : Nouvel onglet
- `ALT + q` : Fermer l'onglet actuel
- `ALT + 1-8` : Activer l'onglet 1-8
- `ALT + c` : Copier
- `ALT + v` : Coller

#### Déplacement des onglets (CTRL + ALT)
- `CTRL + ALT + Flèches gauche/droite` : Déplacer l'onglet
- `CTRL + ALT + Flèches haut/bas` : Activer le dernier onglet
- `CTRL + ALT + 1-8` : Déplacer vers la position 1-8

#### Taille de police (ALT)
- `ALT + =` : Augmenter la taille
- `ALT + -` : Diminuer la taille
- `ALT + 0` : Réinitialiser la taille

### Configuration des polices
- **Police principale** : Lilex Nerd Font Mono
- **Polices de secours** : SauceCodePro, FiraCode, Symbols Nerd Font
- **Taille par défaut** : 16px
- **Hauteur de ligne** : 1.1

### Performance et apparence
- **FPS maximum** : 120
- **Opacité du fond** : 0.98
- **Barre de défilement** : Masquée
- **Barre d'onglets** : Moderne, masquée si un seul onglet
- **Rendu** : OpenGL avec optimisations

### Souris
- **Clic droit** : Copier
- **Clic molette** : Diviser horizontalement
- `SHIFT + Clic molette` : Fermer le panneau

## Thèmes disponibles

### Gruvbox Dark
Thème sombre basé sur la palette Gruvbox, idéal pour une utilisation prolongée.

### Catppuccin Mocha
Variante sombre du thème Catppuccin avec des couleurs douces et modernes.

### Nord
Thème inspiré du design Nord, avec des couleurs froides et épurées.

## Installation et gestion

### 1. Installation de la configuration

Pour utiliser cette configuration :

```bash
# Créer le lien symbolique vers la configuration WezTerm
ln -sf ~/Desktop/Github/Dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

# Créer le lien symbolique pour les thèmes
ln -sf ~/Desktop/Github/Dotfiles/wezterm/themes ~/.config/wezterm/themes
```

### 2. Changement de thème

Pour changer de thème :

1. Éditer le fichier `wezterm.lua`
2. Modifier la ligne 7 :
   ```lua
   local THEME = "gruvbox-dark"  -- ou "catppuccin-mocha", "nord"
   ```
3. Recharger WezTerm (`CTRL + SHIFT + R`)

### 3. Création d'un thème personnalisé

Pour ajouter un nouveau thème :

1. Créer un fichier `<nom>.lua` dans le dossier `themes/`
2. Structure du fichier :
   ```lua
   -- Nom du thème
   return {
       foreground = "#ffffff",
       background = "#000000",
       cursor_bg = "#ffffff",
       cursor_fg = "#000000",
       cursor_border = "#ffffff",
       selection_fg = "#ffffff",
       selection_bg = "#444444",
       scrollbar_thumb = "#444444",
       split = "#444444",
       ansi = {
           "#000000", -- black
           "#ff0000", -- red
           "#00ff00", -- green
           "#ffff00", -- yellow
           "#0000ff", -- blue
           "#ff00ff", -- magenta
           "#00ffff", -- cyan
           "#ffffff", -- white
           -- ... 8 couleurs supplémentaires pour bright
       }
   }
   ```

### 4. Personnalisation des raccourcis

Les raccourcis sont définis dans la section `config.keys`. Pour ajouter/modifier :

```lua
table.insert(config.keys, { 
    mods = "ALT", 
    key = "x", 
    action = wezterm.action.VotreAction 
})
```

### 5. Synchronisation avec Git

```bash
# Ajouter les changements
git add wezterm/

# Commiter les modifications
git commit -m "Update WezTerm configuration"

# Pousser les changements
git push
```

## Dépannage

### Problèmes courants

1. **Polices non trouvées** : Installez les Nerd Fonts requises
2. **Thème non appliqué** : Vérifiez la syntaxe du fichier de thème
3. **Raccourcis non fonctionnels** : Rechargez WezTerm avec `CTRL + SHIFT + R`

### Installation des polices requises

```bash
# Avec Homebrew (macOS)
brew install font-lilex-nerd-font
brew install font-sauce-code-pro-nerd-font
brew install font-fira-code-nerd-font

# Ou télécharger depuis https://www.nerdfonts.com/
```

### Réinitialisation complète

Pour revenir à la configuration par défaut :

```bash
# Supprimer le lien symbolique
rm ~/.config/wezterm/wezterm.lua

# Redémarrer WezTerm pour utiliser la configuration par défaut
```

## Ressources utiles

- [Documentation officielle de WezTerm](https://wezfurlong.org/wezterm/config/)
- [Configuration Lua](https://wezfurlong.org/wezterm/config/lua/)
- [Key Bindings](https://wezfurlong.org/wezterm/config/key-bindings.html)
- [Color Schemes](https://wezfurlong.org/wezterm/config/appearance.html#color-schemes)

---

*Mise à jour : Février 2026*
