# Configuration Kitty Terminal

Cette configuration pour Kitty Terminal utilise le thème Gruvbox et optimise l'expérience utilisateur sur macOS avec des fonctionnalités avancées et des raccourcis pratiques.

## 📁 Structure des fichiers

```
kitty/
├── kitty.conf              # Configuration principale
├── themes/
│   ├── gruvbox.conf        # Thème Gruvbox (actif)
│   ├── catppuccin-macchiato.conf
│   ├── dracula.conf
│   └── ...
└── README.md               # Ce fichier
```

## 🎨 Thème

### Gruvbox Dark
Le thème Gruvbox est activé par défaut avec une palette de couleurs cohérente :
- **Fond** : `#282828` (gris foncé)
- **Texte** : `#ebdbb2` (crème clair)
- **Curseur** : `#928374` (gris moyen)
- **Transparence** : 0.9 (90% d'opacité)

## ⚙️ Configuration détaillée

### Fenêtre et affichage
- **Dimensions initiales** : 120x30 caractères
- **Espacement** : 10px de padding
- **Décorations** : Cachées pour un look minimaliste
- **Transparence** : 0.9 avec fond flou optionnel

### Police
- **Famille** : JetBrainsMono Nerd Font
- **Taille** : 11.0pt (optimisée pour la lisibilité)
- **Ligatures** : Activées pour une meilleure typographie
- **Variations** : Auto pour gras/italique

### Comportement
- **Historique** : 10,000 lignes de scrollback
- **Copie** : Automatique sur sélection
- **Navigation** : Focus suit la souris
- **Notifications** : Visuelles seulement (pas de son)

## ⌨️ Raccourcis clavier

### Gestion des onglets
- `Ctrl+Tab` : Onglet suivant
- `Ctrl+Shift+Tab` : Onglet précédent
- `Ctrl+Shift+T` : Nouvel onglet
- `Ctrl+Shift+W` : Fermer l'onglet

### Split de fenêtre
- `Ctrl+Shift+D` : Split horizontal
- `Ctrl+Shift+E` : Split vertical
- `Ctrl+Shift+Flèches` : Navigation entre splits

### Navigation et scroll
- `Ctrl+Shift+Haut/Bas` : Ligne par ligne
- `Ctrl+Shift+Page Haut/Bas` : Page par page
- `Ctrl+Shift+Home/End` : Début/Fin du buffer

### Copier-coller
- `Ctrl+Shift+C` : Copier
- `Ctrl+Shift+V` : Coller

### Taille de police
- `Ctrl+Shift+Plus` : Augmenter la police
- `Ctrl+Shift+Moins` : Diminuer la police
- `Ctrl+Shift+0` : Réinitialiser la taille

### Autres
- `Ctrl+Shift+F11` : Plein écran
- `Ctrl+Shift+F2` : Éditer la configuration

## 🍎 Intégration macOS

### Optimisations spécifiques
- **Option comme Alt** : `macos_option_as_alt yes`
- **Couleur barre de titre** : Fond de l'application
- **Quitter automatique** : Ferme avec la dernière fenêtre
- **Pas de masquage** : Visible dans le switcher d'applications

### Compatibilité
- Support des URLs cliquables
- Intégration shell activée
- Contrôle distant autorisé

## 🚀 Performance

### Optimisations
- **Délai de rendu** : 10ms pour une réponse rapide
- **Délai d'entrée** : 3ms pour une faible latence
- **Synchronisation** : Avec le moniteur activée
- **Composition texte** : Strategy legacy pour la clarté

## 🛠️ Personnalisation

### Changer de thème
1. Commentez la ligne actuelle dans `kitty.conf` :
   ```conf
   # include ~/.config/kitty/themes/gruvbox.conf
   ```
2. Ajoutez le nouveau thème :
   ```conf
   include ~/.config/kitty/themes/votre-theme.conf
   ```

### Ajuster la transparence
Modifiez la ligne 27 :
```conf
background_opacity 0.95  # Plus opaque
background_opacity 0.8   # Plus transparent
```

### Ajouter des raccourcis
Utilisez le format :
```conf
map vos+raccourcis votre_commande
```

## 📝 Installation

1. Installer Kitty :
   ```bash
   brew install --cask kitty
   ```

2. Lier la configuration :
   ```bash
   ln -s ~/.config/kitty/kitty.conf ~/.config/kitty/
   ```

3. Redémarrer Kitty pour appliquer les changements

## 🔧 Dépannage

### Problèmes courants
- **Police non trouvée** : Installez JetBrainsMono Nerd Font
- **Thème ne s'applique pas** : Vérifiez le chemin du fichier de thème
- **Raccourcis ne fonctionnent pas** : Redémarrez Kitty

### Logs et debug
Activer le mode debug :
```bash
kitty --debug-config
```

## 📚 Ressources

- [Documentation Kitty](https://sw.kovidgoyal.net/kitty/)
- [Thèmes Kitty](https://github.com/kovidgoyal/kitty-themes)
- [Gruvbox Theme](https://github.com/morhetz/gruvbox)

---

*Configuration maintenue pour une expérience terminal optimale sur macOS*
