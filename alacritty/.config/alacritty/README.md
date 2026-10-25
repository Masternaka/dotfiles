# Alacritty Configuration

Configuration moderne et optimisée pour Alacritty avec support multi-thèmes et architecture modulaire.

## 📁 Structure

```
alacritty/
├── alacritty.toml          # Configuration principale
├── colors.toml             # Thème de couleurs actuel (Everforest)
├── fonts.toml              # Configuration des polices
├── themes/                 # Thèmes additionnels
│   └── noctalia.toml       # Thème Noctalia (Gruvbox)
├── colorschemes/           # Collection de thèmes
│   ├── Gruvbox_dark.yml
│   ├── Gruvbox_light.yml
│   ├── Gruvbox_material.yml
│   ├── gruvbox.yml
│   ├── gruvbox_powerline.yml
│   ├── dwm_gruvbox.yml
│   ├── dracula.yml
│   ├── nord.yml
│   ├── catppuccin.yml
│   ├── tokyonight.yml
│   ├── Tokyo_night_storm.yml
│   ├── everforest.yml
│   ├── tomorrow-night.yml
│   └── ...
└── README.md               # Documentation
```

## 🎨 Thème Actuel : Everforest

Le thème par défaut utilise la palette de couleurs **Everforest** :

### Couleurs principales
- **Background**: `#2b3339` (vert foncé apaisant)
- **Foreground**: `#d3c6aa` (crème doux)
- **Normal/Bright**: Palette cohérente avec tons verts et terreux

### Palette de couleurs
```toml
# Normal colors
black   = "#4b565c"   # Gris-vert foncé
red     = "#e67e80"   # Rouge doux
green   = "#a7c080"   # Vert principal
yellow  = "#dbbc7f"   # Jaune doux
blue    = "#7fbbb3"   # Bleu-vert
magenta = "#d699b6"   # Magenta doux
cyan    = "#83c092"   # Cyan-vert
white   = "#d3c6aa"   # Crème

# Bright colors (identiques pour cohérence)
```

## ⚙️ Configuration principale

### Curseur
- `style = { shape = "Underline", blinking = "On" }` - Curseur souligné avec clignotement activé
- `unfocused_hollow = true` - Curseur creux quand la fenêtre n'a pas le focus
- `thickness = 0.15` - Épaisseur du curseur
- `vi_mode_style = "None"` - Pas de style spécial en mode Vi

### Fenêtre
- `decorations = "Full"` - Barre de titre complète activée
- `decorations_theme_variant = "Dark"` - Variante sombre des décorations
- `dynamic_padding = true` - Padding dynamique selon la taille de la fenêtre
- `opacity = 0.8` - Transparence 80%
- `startup_mode = "Windowed"` - Mode fenêtré au démarrage
- `dimensions = 120x30` - Taille par défaut
- `padding = 19x19` - Marges confortables
- `dynamic_title = true` - Titre dynamique

### Performance
- `live_config_reload = true` - Rechargement automatique
- `history = 10000` - Historique de 10k lignes
- `multiplier = 3` - Trois lignes par cran de défilement

### Environnement
- `TERM = "xterm-256color"` - Compatibilité avec les applications nécessitant xterm
- `WINIT_X11_SCALE_FACTOR = "1.0"` - Échelle X11 fixe

### Sélection
- `save_to_clipboard = true` - Sauvegarde automatique dans le presse-papiers
- `semantic_escape_chars` - Caractères d'échappement sémantiques configurés

### Souris
- `hide_when_typing = true` - Cache la souris pendant la frappe
- `Middle click = PasteSelection` - Clic molette pour coller la sélection

## 🔤 Police

**JetBrainsMono Nerd Font Mono** en taille 12 pour tous les styles :
- Normal, Bold, Italic, Bold_italic
- Support complet des icônes Nerd Font
- Lisibilité optimale pour le code

## 🎭 Thèmes Disponibles

### Populaires
- **Gruvbox** (dark/light/material) - Thème programmer classique
- **Dracula** - Thème sombre populaire
- **Nord** - Thème nordique minimaliste
- **Catppuccin** - Thème pastel moderne

### Alternatives
- **Tokyo Night** / **Tokyo Night Storm** - Thème nocturne japonais
- **Everforest** - Thème vert apaisant (actuel)
- **Tomorrow Night** - Thème classique
- **Noctalia** (dans `themes/`) - Variante Gruvbox en format TOML

### Thèmes Gruvbox
Plusieurs variantes Gruvbox sont disponibles :
- `Gruvbox_dark.yml` - Version sombre classique
- `Gruvbox_light.yml` - Version claire
- `Gruvbox_material.yml` - Version Material Design
- `gruvbox.yml` - Version standard
- `gruvbox_powerline.yml` - Optimisé pour Powerline
- `dwm_gruvbox.yml` - Optimisé pour dwm

## 🚀 Installation

1. **Copier les fichiers** dans le répertoire de configuration Alacritty :
   ```bash
   cp -r alacritty/* ~/.config/alacritty/
   ```

2. **Installer la police** requise :
   ```bash
   brew install font-jetbrains-mono-nerd-font
   ```

3. **Redémarrer Alacritty** pour appliquer les changements.

## 🎯 Gestion des Thèmes

### Changer de thème
1. **Éditer** `alacritty.toml` et modifier la ligne `import` :
   ```toml
   import = [
       "~/.config/alacritty/colors.toml",  # Thème principal
       "~/.config/alacritty/fonts.toml",
       #"~/.config/alacritty/themes/noctalia.toml"  # Décommenter pour activer
   ]
   ```

2. **Ou remplacer** le contenu de `colors.toml` par un thème des `colorschemes/`

3. **Ou utiliser** un thème du dossier `themes/` en le décommentant dans les imports

### Créer un nouveau thème
1. **Copier** un thème existant :
   ```bash
   cp colorschemes/Gruvbox_dark.yml colorschemes/mon_theme.yml
   ```

2. **Modifier** les couleurs dans le nouveau fichier

3. **Mettre à jour** `alacritty.toml` pour l'importer

### Rechargement automatique
La configuration se recharge automatiquement grâce à `live_config_reload = true`. Il suffit de sauvegarder les fichiers pour voir les changements.

## ⌨️ Raccourcis Clavier

### Copier/Coller
- `Ctrl+Shift+C` - Copier la sélection
- `Ctrl+Shift+V` - Coller
- `Ctrl+Shift+F` - Rechercher vers l'avant
- `Ctrl+Shift+B` - Rechercher vers l'arrière

### Navigation dans l'historique
- `Shift+PageUp` - Défiler une page vers le haut
- `Shift+PageDown` - Défiler une page vers le bas
- `Shift+Home` - Aller en haut de l'historique
- `Shift+End` - Aller en bas de l'historique

### Autres
- `Ctrl+L` - Effacer les notifications de log
- `Ctrl+0` - Réinitialiser la taille de la police
- `F11` - Basculer en plein écran (raccourci système)

### Mode Vi
- `Ctrl+Shift+C` - Effacer la sélection en mode Vi

## 🔧 Personnalisation

### Ajuster la transparence
```toml
[window]
opacity = 0.9  # Plus transparent
opacity = 0.7  # Moins transparent
opacity = 1.0  # Opaque
opacity = 0.8  # Actuel
```

### Modifier les décorations
```toml
[window]
decorations = "Full"              # Barre de titre complète (actuel)
decorations = "None"              # Mode bordless
decorations_theme_variant = "Dark"  # Variante sombre
decorations_theme_variant = "Light" # Variante claire
```

### Modifier la taille de police
Dans `fonts.toml` :
```toml
[font]
size = 14  # Plus grand
size = 10  # Plus petit
```

### Ajuster les marges
```toml
[window.padding]
x = 10  # Marges horizontales
y = 8   # Marges verticales
```

### Changer le curseur
```toml
[cursor]
style = "Block"      # Carré
style = { shape = "Underline", blinking = "On" }  # Souligné clignotant (actuel)
style = "Beam"       # Vertical
thickness = 0.15     # Épaisseur (0.0 à 1.0)
unfocused_hollow = true  # Creux quand sans focus
```

## 🐛 Dépannage

### Le thème ne s'applique pas
- Vérifier les chemins dans `import`
- Redémarrer Alacritty complètement
- Vérifier la syntaxe TOML

### Police non trouvée
- Installer JetBrainsMono Nerd Font Mono
- Vérifier que la police est bien installée système

### Transparence ne fonctionne pas
- Vérifier que le compositeur fonctionne
- Sur certains systèmes, la transparence peut être désactivée

### Rechargement automatique ne fonctionne pas
- Avec Alacritty 0.13, placer `live_config_reload = true` et `import` à la racine du fichier, avant toute section `[env]` ou `[window]`
- Sauvegarder le fichier avec une extension `.toml` valide

## 📝 Notes

- Configuration optimisée pour macOS et Linux
- Architecture modulaire pour une maintenance facile
- Support complet des Nerd Fonts pour les icônes
- Transparence et mode bordless pour un look moderne
- Collection riche de thèmes pour tous les goûts

---

**Dernière mise à jour**: 2026-02-16
