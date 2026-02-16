# Dotfiles de Masternaka

Ce dépôt contient mes fichiers de configuration pour différents outils en ligne de commande, terminaux, éditeurs et utilitaires que j’utilise au quotidien.

L’objectif est de :
- **reproduire rapidement** mon environnement sur une nouvelle machine,
- **versionner** mes réglages,
- **centraliser** toutes les configs au même endroit.

Le dépôt est organisé par application et pensé pour être utilisé avec **GNU Stow** : chaque dossier correspond en général à un “package” Stow dont le contenu sera placé sous `$HOME` (souvent `~/.config/<outil>` ou équivalent).

---

## Contenu du dépôt

- **`alacritty/`**  
  Configuration du terminal Alacritty (fichiers sous `.config/alacritty/`, destinés à `~/.config/alacritty/` via Stow).  
  - `alacritty.toml` : configuration principale (police, couleurs, raccourcis, comportement).  
  - `fonts.toml` : configuration liée aux polices utilisées.  
  - `colors.toml` et `colorschemes/*.yml` : jeux de couleurs (Catppuccin, Dracula, Gruvbox, Nord, Tokyo Night, etc.).

- **`fastfetch/`**  
  - `.config/fastfetch/config.jsonc` : configuration de l’outil `fastfetch` (affichage d’infos système dans le terminal, thème, icônes, modules affichés, etc.), destinée à être liée vers `~/.config/fastfetch/config.jsonc` via Stow.

- **`ghostty/`**  
  - `.config/ghostty/config` : fichier de configuration du terminal Ghostty (thème, police, options diverses), ainsi que des thèmes dans `.config/ghostty/themes/`.

- **`helix/`**  
  Configurations pour l’éditeur Helix.  
  - `config.toml` : configuration principale (thème, comportements, keybindings globaux).  
  - `languages.toml` : configuration spécifique aux langages (LSP, formatters, linters, etc.).  
  - `themes/catppuccin_mocha.toml` : thème personnalisé Catppuccin Mocha pour Helix.

- **`kitty/`**  
  Configurations pour le terminal Kitty (fichiers sous `.config/kitty/`, destinés à `~/.config/kitty/`).  
  - `kitty.conf` : configuration principale (polices, taille, comportements, raccourcis).  
  - `themes/*.conf` : différents thèmes de couleurs (Catppuccin, Dracula, Gruvbox, Nord…).

- **`ranger/`**  
  Configurations pour le gestionnaire de fichiers en TUI Ranger.  
  - `rc.conf` : configuration principale (raccourcis, options, comportement).  
  - `rifle.conf` : associations de fichiers (quel programme ouvrir pour quel type de fichier).  
  - `commands.py` : commandes personnalisées pour Ranger.  
  - `scope.sh` : script pour les prévisualisations dans Ranger.  
  - `README.md` : documentation spécifique à ma configuration Ranger.

- **`samba/`**  
  - `smb.conf` : configuration Samba (partages, permissions, options de serveur de fichiers).  
    Actuellement ce fichier sert surtout de modèle pour `/etc/samba/smb.conf` (copie manuelle ou gestion séparée de `/etc`). Il peut être adapté pour Stow si besoin (voir plus bas).

- **`wezterm/`**  
  - `.config/wezterm/wezterm.lua` : configuration du terminal WezTerm (thème, police, layout des panes, keybindings, etc.), à destination de `~/.config/wezterm/wezterm.lua`.

- **`yazi/`**  
  Configurations pour le gestionnaire de fichiers Yazi.  
  Les fichiers se trouvent dans `.config/yazi/` et sont prévus pour aller dans `~/.config/yazi/`.  
  - `yazi.toml` : configuration principale de Yazi.  
  - `keymap.toml` : raccourcis clavier personnalisés.  
  - `theme.toml` : thème de couleurs pour l’interface.  
  - `setup-yazi.sh` : script d’installation/initialisation pour Yazi (copie/symlinks des configs, dépendances éventuelles).  
  - `Guide d'installation Yazi.md` : guide détaillé (en français) expliquant comment installer et configurer Yazi avec ces fichiers.

- **`zed/`**  
  Configurations pour l’éditeur Zed.  
  - `.config/zed/settings.json` : préférences de l’éditeur (thèmes, police, comportements).  
  - `.config/zed/themes/.nordic.json` : thème personnalisé de type Nordique.

- **`.gitignore`**  
  Fichiers/chemins ignorés par Git (fichiers temporaires, caches, etc.).

- **`README.md`**  
  Ce fichier : description globale du dépôt et de son organisation.

---

## Installation / utilisation

### 1. Cloner le dépôt

```bash
git clone git@github.com:Masternaka/Dotfiles.git
cd Dotfiles
```

### 2. Utilisation avec GNU Stow

Le dépôt est organisé pour que **GNU Stow** gère automatiquement les liens symboliques depuis ton `$HOME`.  
Chaque dossier (par ex. `alacritty/`, `kitty/`, `helix/`, `yazi/`, `wezterm/`, etc.) contient une arborescence qui commence à partir de `$HOME` (souvent `./.config/...`).

```bash
# Depuis ton $HOME
cd ~/Github/Dotfiles   # ou le chemin où tu as cloné le dépôt

# Exemple : ne stower que Alacritty
stow alacritty

# Exemple : stower plusieurs outils d'un coup
stow alacritty kitty helix wezterm yazi ranger zed fastfetch ghostty gtk-3.0 gtk-4.0 qt5ct qt6ct Kvantum niri micro
```

Cela va créer les liens symboliques correspondants sous ton `$HOME` (par ex. `~/.config/alacritty/*`, `~/.config/kitty/*`, etc.).  
Pour supprimer les liens d’un package, il suffit d’utiliser :

```bash
stow -D alacritty
```

### 3. Chemins cibles (pour information)

Une fois Stow appliqué, les principaux fichiers se retrouvent typiquement aux emplacements suivants :

- Alacritty : `~/.config/alacritty/`
- Fastfetch : `~/.config/fastfetch/`
- Ghostty : `~/.config/ghostty/`
- Helix : `~/.config/helix/`
- Kitty : `~/.config/kitty/`
- Micro : `~/.config/micro/`
- Niri : `~/.config/niri/`
- QT5ct : `~/.config/qt5ct/`
- QT6ct : `~/.config/qt6ct/`
- Kvantum : `~/.config/Kvantum/`
- Ranger : `~/.config/ranger/`
- GTK 3 : `~/.config/gtk-3.0/`
- GTK 4 : `~/.config/gtk-4.0/`
- WezTerm : `~/.config/wezterm/`
- Yazi : `~/.config/yazi/`
- Zed : `~/.config/zed/` (ou emplacement spécifique selon ton OS)

Pour **Samba**, le fichier système attendu est en général `/etc/samba/smb.conf` (droits root requis).  
Le fichier `samba/smb.conf` de ce dépôt sert donc surtout de modèle ; libre à toi de l’adapter en package Stow (ex. `samba/etc/samba/smb.conf`) si tu souhaites aussi gérer `/etc` avec Stow.

### 4. Cas particulier : Yazi

Consulte le fichier `Guide d'installation Yazi.md` dans le dossier `yazi/` pour un guide complet.  
Tu peux également utiliser le script `setup-yazi.sh` s’il est prévu pour automatiser la mise en place (copie/symlinks et éventuelles dépendances) en complément ou à la place de Stow.

---

## Maintenance

- **Modifier une config** : éditer le fichier correspondant dans ce dépôt, puis `git commit` + `git push`.  
- **Nouvelle machine** : cloner ce dépôt, puis recréer les liens symboliques ou relancer les scripts d’installation (comme `setup-yazi.sh`).  
- **Sauvegarde** : avant de remplacer des fichiers système sensibles (par ex. `smb.conf`), conserver une copie de la version existante.

---

## Auteur

- **GitHub** : [Masternaka](https://github.com/Masternaka)
