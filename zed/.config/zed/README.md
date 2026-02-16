# Configuration Zed Editor

Ce dossier contient la configuration personnalisée pour l'éditeur de texte Zed.

## Structure

```
zed/
├── settings.json          # Configuration principale de Zed
├── themes/                # Thèmes personnalisés
│   ├── gruvbox.json
│   ├── gruvbox-light.json
│   ├── nordic.json
│   ├── nordic-light.json
└── README.md             # Ce fichier
```

## Configuration principale (`settings.json`)

### Paramètres configurés

- **Restauration au démarrage** : `launchpad` - Affiche l'écran de lancement
- **Forme du curseur** : `bar` - Curseur en forme de barre
- **Agent IA** : 
  - Profil par défaut : `ask`
  - Modèle : `claude-sonnet-4` (provider: zed.dev)
- **Télémesure** : Désactivée (métriques et diagnostics)
- **Raccourcis clavier** : `VSCode` - Compatible avec VSCode
- **Taille des polices** : 16px pour l'UI et l'éditeur
- **Thèmes** :
  - Mode système activé
  - Thème clair : `Gruvbox-light`
  - Thème sombre : `Gruvbox`
- **Minimap** :
  - Affichage : toujours visible
  - Position : éditeur actif uniquement
  - Largeur maximale : 140 colonnes

## Thèmes personnalisés

La collection comprend des variantes personnalisées des thèmes populaires :

### Thèmes Gruvbox
- `gruvbox.json` - Version standard sombre
- `gruvbox-light.json` - Version standard claire

### Thèmes Nordic
- `nordic.json` - Version standard sombre
- `nordic-light.json` - Version standard claire

## Installation et gestion

### 1. Installation de la configuration

Pour utiliser cette configuration dans Zed :

```bash
# Créer le lien symbolique vers la configuration Zed
ln -sf ~/Desktop/Github/Dotfiles/zed/settings.json ~/.config/zed/settings.json

# Créer le lien symbolique pour les thèmes
ln -sf ~/Desktop/Github/Dotfiles/zed/themes ~/.config/zed/themes
```

### 2. Modification des paramètres

Pour modifier la configuration :

1. Éditer le fichier `settings.json` directement dans ce dossier
2. Les changements seront automatiquement appliqués dans Zed
3. Pour voir tous les paramètres par défaut de Zed, utiliser la commande palette : `zed: open default settings`

### 3. Ajout de thèmes personnalisés

Pour ajouter un nouveau thème :

1. Créer un fichier `.json` dans le dossier `themes/`
2. Suivre le format de thème Zed (voir fichiers existants comme référence)
3. Le thème sera automatiquement disponible dans Zed

### 4. Synchronisation avec Git

Cette configuration est versionnée avec Git :

```bash
# Ajouter les changements
git add zed/

# Commiter les modifications
git commit -m "Update Zed configuration"

# Pousser les changements
git push
```

## Personnalisation recommandée

### Pour les développeurs

- **Taille de police** : Actuellement réglée à 16px pour une meilleure lisibilité
- **Thème** : Gruvbox pour réduire la fatigue oculaire
- **Raccourcis** : VSCode pour une transition facile

### Pour l'IA Assistant

- **Modèle** : Claude Sonnet 4 pour un bon équilibre performance/coût
- **Profil** : `ask` pour solliciter explicitement l'IA

## Ressources utiles

- [Documentation officielle de Zed](https://zed.dev/docs/configuring-zed)
- [Personnalisation des thèmes](https://zed.dev/docs/themes)
- [Configuration des raccourcis](https://zed.dev/docs/key-bindings)

## Dépannage

### Problèmes courants

1. **Thèmes non reconnus** : Vérifiez que les fichiers JSON sont valides
2. **Configuration non appliquée** : Redémarrez Zed après modification
3. **Liens symboliques cassés** : Recréez les liens avec les commandes ci-dessus

### Réinitialisation

Pour réinitialiser complètement la configuration :

```bash
# Supprimer les liens symboliques
rm ~/.config/zed/settings.json
rm -rf ~/.config/zed/themes

# Redémarrer Zed pour utiliser la configuration par défaut
```

---

*Mise à jour : Février 2026*
