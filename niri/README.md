# Configuration Niri

Ce dossier contient la configuration complète pour le gestionnaire de fenêtres Niri avec le thème Noctalia.

## Structure des fichiers

### Fichiers principaux

- **`config.kdl`** - Fichier de configuration principal qui inclut tous les autres fichiers de configuration
- **`noctalia.kdl`** - Configuration du schéma de couleurs Noctalia (thème vert/gris)

### Dossier `cfg/`

Le dossier `cfg/` contient tous les fichiers de configuration spécialisés :

#### 🎨 `animation.kdl`
Configure les animations du système :
- Changements d'espaces de travail (spring animation)
- Ouverture/fermeture des fenêtres (200ms, ease-out)
- Mouvements et redimensionnements (spring animations)
- Interface de capture d'écran et vue d'ensemble

#### 🚀 `autostart.kdl`
Applications lancées au démarrage :
- Agent d'authentification Polkit KDE
- Noctalia Shell (environnement de bureau)

#### 🖥️ `display.kdl`
Configuration des écrans :
- **DP-1** : Écran principal (1920x1080@60Hz, position 0,0)
  - Coins actifs : coin supérieur gauche
  - Couleur de fond : `#504945`
- **HDMI-A-2** : Écran secondaire (1920x1080@60Hz, position 1920,0)
  - Coins désactivés
  - Couleur de fond : `#504945`

#### ⌨️ `input.kdl`
Configuration des périphériques d'entrée :
- **Clavier** : Layout canadien avec variante "multix" pour les caractères accentués
- **Touchpad** : Tap-to-click et défilement naturel activés
- **Souris** : Focus suit la souris, warp-to-focus activé

#### 📐 `layout.kdl`
Paramètres d'agencement des fenêtres :
- Espacement entre fenêtres : 16px
- Colonnes centrées uniquement en cas de débordement
- Largeur par défaut des colonnes : 50%
- Largeurs prédéfinies : 33%, 50%, 67%
- Fond transparent (pour Noctalia Shell)

#### ⚙️ `misc.kdl`
Paramètres divers :
- Variables d'environnement Wayland
- Préférence pour les applications sans décoration client (CSD)
- Chemin des captures d'écran désactivé
- Vue d'ensemble zoomée à 25%
- Raccourcis clavier masqués au démarrage

#### 📋 `rules.kdl`
Règles spécifiques aux applications :
- **Rayon des coins** : 20px pour toutes les fenêtres
- **Firefox** : Workspace 1, maximisé au démarrage
- **Firefox PiP** : Flottant en bas à gauche
- **Discord** : Workspace 6
- **Obsidian** : Workspace 7, largeur 67%
- **Gnome Disk Utility** : Workspace 8, flottant, hauteur 50%
- **KeePassXC/Secrets** : Bloqué des captures d'écran

#### 🔢 `workspaces.kdl`
Configuration des espaces de travail :
- **Écran DP-1** : Workspaces 1-5
- **Écran HDMI-A-2** : Workspaces 6-10
- Section commentée avec des noms personnalisés (browser, code, terminal, etc.)

#### 📝 Fichiers additionnels (non inclus)
- `rules_name_workspaces.kdl` - Règles pour workspaces nommés
- `windows_switcher.kdl` - Configuration du switcher de fenêtres

## Thème Noctalia

Le thème utilise une palette de couleurs inspirée de Gruvbox :
- **Actif** : `#b8bb26` (vert)
- **Inactif** : `#282828` (gris foncé)
- **Urgent** : `#fb4934` (rouge)
- **Ombre** : `#28282870` (gris semi-transparent)

## Thème GTK3, GTK4 et QT

Pour gérer le thème des applications GTK3 et GTK4, il faut utiliser "nwg-look" et le thème "adw-gtk3". Si porblème avec certaines apps GTK4 et Flatpak, voir la page Wiki de Noctalia-shell pour la marche à suivre.

Pour gérer le thème des applications QT, il faut utiliser "qt6ct" et configurer une variable d'environnement, voir la page Wiki de Noctalia-shell pour la marche à suivre.

## Installation

1. Copier le dossier `.config/niri/` dans `~/.config/`
2. Redémarrer Niri ou recharger la configuration avec `niri msg reload-config`

## Personnalisation

Chaque fichier peut être modifié indépendamment pour adapter l'environnement à vos préférences. Les commentaires dans chaque fichier expliquent les options disponibles.

## Keybindings

Voir le fichier `niri-keybindings.md` pour les raccourcis clavier disponibles.
