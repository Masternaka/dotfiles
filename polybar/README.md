# Polybar Configuration

Ce dossier contient la configuration de Polybar pour i3wm avec support multi-écrans.

## Structure des fichiers

```
polybar/
├── README.md                    # Ce fichier
├── config.ini                   # Configuration principale (Catppuccin)
├── polybar-i3                   # Script de lancement des barres
└── themes/                      # Dossier des thèmes
    ├── catppuccin/
    │   └── config.ini          # Thème Catppuccin
    ├── dracula/
    │   └── config.ini          # Thème Dracula
    ├── everforest/
    │   └── config.ini          # Thème Everforest
    ├── gruvbox/
    │   └── config.ini          # Thème Gruvbox
    ├── nord/
    │   └── config.ini          # Thème Nord
    └── tokyonight/
        └── config.ini          # Thème Tokyonight
```

## Utilisation

### Lancement automatique

Le script `polybar-i3` est conçu pour être lancé automatiquement par i3. Ajoutez cette ligne à votre fichier `~/.config/i3/config` :

```bash
exec --no-startup-id ~/.config/i3/polybar/polybar-i3
```

### Lancement manuel

```bash
# Lancer avec le thème par défaut (Catppuccin)
~/.config/i3/polybar/polybar-i3

# Ou pour tester avec un autre thème
THEME=tokyonight ~/.config/i3/polybar/polybar-i3
```

## Configuration multi-écrans

Le script détecte automatiquement vos écrans et lance deux barres :

- **Barre principale** (`main`) : Sur l'écran principal avec tous les modules y compris le tray
- **Barre secondaire** (`secondary`) : Sur l'écran secondaire sans tray pour éviter les conflits

### Détection des écrans

Le script utilise `xrandr` pour détecter les écrans :
- Écran primaire : `xrandr | grep " connected primary"`
- Écran secondaire : Premier écran connecté non primaire

### Noms d'écrans par défaut

Si `xrandr` ne détecte aucun écran, les noms par défaut sont :
- Primaire : `DP-1`
- Secondaire : `HDMI-A-2`

Vous pouvez modifier ces valeurs dans le script `polybar-i3` si nécessaire.

## Personnalisation

### Changer de thème

Pour utiliser un autre thème, modifiez le chemin dans le script `polybar-i3` :

```bash
# Remplacer catppuccin par le thème désiré
polybar -c ~/.config/i3/polybar/themes/[THEME]/config.ini main &
```

### Modules disponibles

Chaque barre contient les modules suivants :

**Barre principale :**
- `memory` : Utilisation de la RAM
- `cpu` : Utilisation du CPU
- `filesystem` : Espace disque
- `xworkspaces` : Espaces de travail i3
- `lock` : Indicateur verrouillage majuscule
- `tray` : Zone de notification (uniquement sur la barre principale)
- `pulseaudio` : Volume audio
- `date` : Date du jour
- `hour` : Heure actuelle

**Barre secondaire :**
- Mêmes modules que la barre principale sauf `tray` et `lock`

### Ajouter un nouveau thème

1. Créez un nouveau dossier dans `themes/`
2. Copiez la configuration d'un thème existant
3. Modifiez les couleurs dans la section `[colors]`
4. Adaptez les modules si nécessaire

## Dépannage

### Problèmes courants

**Polybar ne se lance pas :**
```bash
# Vérifiez la syntaxe du fichier de configuration
polybar -c ~/.config/i3/polybar/themes/catppuccin/config.ini --check

# Lancez en mode verbose pour voir les erreurs
polybar -c ~/.config/i3/polybar/themes/catppuccin/config.ini main -v
```

**Un seul écran est détecté :**
```bash
# Vérifiez les écrans détectés par xrandr
xrandr --listmonitors
# ou
xrandr | grep " connected"
```

**Les barres se superposent :**
- Vérifiez que les noms d'écrans sont corrects
- Assurez-vous que `tray-position = none` est bien configuré sur la barre secondaire

### Redémarrer Polybar

Après avoir modifié la configuration :

```bash
# Tuez toutes les instances de Polybar
killall polybar

# Relancez le script
~/.config/i3/polybar/polybar-i3
```

Ou rechargez i3 complètement : `Mod+Shift+r`

## Thèmes disponibles

| Thème | Couleurs principales | Style |
|-------|-------------------|-------|
| **Catppuccin** | Rose, Bleu, Vert | Doux et moderne |
| **Dracula** | Violet, Cyan, Rouge | Sombre et contrasté |
| **Everforest** | Vert, Brun, Orange | Naturel et apaisant |
| **Gruvbox** | Jaune, Bleu, Rouge | Rétro et chaleureux |
| **Nord** | Bleu, Cyan, Rouge | Froid et minimaliste |
| **Tokyonight** | Jaune, Bleu, Rouge | Moderne et élégant |

## Ressources

- [Documentation officielle de Polybar](https://github.com/polybar/polybar)
- [Wiki Polybar](https://github.com/polybar/polybar/wiki)
- [Configuration i3wm](https://i3wm.org/docs/userguide.html)
