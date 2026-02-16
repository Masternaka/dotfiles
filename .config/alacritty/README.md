# Alacritty Configuration

Configuration moderne et optimisée pour Alacritty avec support multi-thèmes et architecture modulaire.

## 📁 Structure

```
alacritty/
├── alacritty.toml          # Configuration principale
├── colors.toml             # Thème de couleurs actuel (Everforest)
├── fonts.toml              # Configuration des polices
├── colorschemes/           # Collection de thèmes
│   ├── Gruvbox_dark.yml
│   ├── Gruvbox_light.yml
│   ├── gruvbox.yml
│   ├── dracula.yml
│   ├── nord.yml
│   ├── catppuccin.yml
│   ├── tokyonight.yml
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
- `shape = "Beam"` - Curseur fin vertical
- `blinking = "On"` - Clignotement activé
- `unfocused_hollow = false` - Curseur plein même sans focus

### Fenêtre
- `decorations = "none"` - Mode bordless/minimaliste
- `opacity = 0.8` - Transparence 80%
- `dimensions = 120x30` - Taille par défaut
- `padding = 19x19` - Marges confortables
- `dynamic_title = true` - Titre dynamique

### Performance
- `live_config_reload = true` - Rechargement automatique
- `history = 10000` - Historique de 10k lignes
- `multiplier = 3` - Buffer multiplié par 3

### Environnement
- `TERM = "alacritty"` - Terminal correctement détecté
- `WINIT_X11_SCALE_FACTOR = "1.0"` - Échelle X11 fixe

## 🔤 Police

**JetBrainsMono Nerd Font** en taille 12 pour tous les styles :
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
- **Tokyo Night** - Thème nocturne japonais
- **Everforest** - Thème vert apaisant (actuel)
- **Tomorrow Night** - Thème classique

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
       "~/.config/alacritty/colorschemes/Gruvbox_dark.yml",
       "~/.config/alacritty/fonts.toml",
   ]
   ```

2. **Ou remplacer** le contenu de `colors.toml` par un thème des `colorschemes/`

### Créer un nouveau thème
1. **Copier** un thème existant :
   ```bash
   cp colorschemes/Gruvbox_dark.yml colorschemes/mon_theme.yml
   ```

2. **Modifier** les couleurs dans le nouveau fichier

3. **Mettre à jour** `alacritty.toml` pour l'importer

### Rechargement automatique
La configuration se recharge automatiquement grâce à `live_config_reload = true`. Il suffit de sauvegarder les fichiers pour voir les changements.

## ⌨️ Raccourcis

### Plein écran
- `F11` - Basculer en plein écran

### Navigation
- Les raccourcis standards du terminal fonctionnent nativement

## 🔧 Personnalisation

### Ajuster la transparence
```toml
[window]
opacity = 0.9  # Plus transparent
opacity = 0.7  # Moins transparent
opacity = 1.0  # Opaque
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
[cursor.style]
shape = "Block"    # Carré
shape = "Underline" # Souligné
shape = "Beam"     # Vertical (actuel)
```

## 🐛 Dépannage

### Le thème ne s'applique pas
- Vérifier les chemins dans `import`
- Redémarrer Alacritty complètement
- Vérifier la syntaxe TOML

### Police non trouvée
- Installer JetBrainsMono Nerd Font
- Vérifier que la police est bien installée système

### Transparence ne fonctionne pas
- Vérifier que le compositeur fonctionne
- Sur certains systèmes, la transparence peut être désactivée

### Rechargement automatique ne fonctionne pas
- Ajouter `live_config_reload = true` dans `[general]`
- Sauvegarder le fichier avec une extension `.toml` valide

## 📝 Notes

- Configuration optimisée pour macOS et Linux
- Architecture modulaire pour une maintenance facile
- Support complet des Nerd Fonts pour les icônes
- Transparence et mode bordless pour un look moderne
- Collection riche de thèmes pour tous les goûts

---

**Dernière mise à jour**: 2026-02-11
