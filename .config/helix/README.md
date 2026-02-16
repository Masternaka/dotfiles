# Configuration Helix

Ce dossier contient la configuration complète de l'éditeur de texte Helix, un éditeur modal moderne inspiré de Vim et Kakoune.

## Structure des fichiers

```
helix/
├── config.toml          # Configuration principale de l'éditeur
├── languages.toml        # Configuration des langages et LSP
├── themes/               # Thèmes personnalisés
│   └── catppuccin_mocha.toml
└── README.md             # Ce fichier
```

## Fichiers de configuration

### `config.toml`

Fichier de configuration principal qui définit :

- **Thème** : `catppuccin_mocha`
- **Éditeur** : numéros de ligne relatifs, support souris, complétion automatique, formatage automatique
- **LSP** : messages d'aide, snippets, indices inline
- **Raccourcis clavier** : configurations personnalisées pour les modes normal, insertion et sélection

#### Sections principales

- `[editor]` : Configuration de base de l'éditeur
- `[editor.statusline]` : Personnalisation de la barre d'état
- `[editor.lsp]` : Configuration du Language Server Protocol
- `[editor.cursor-shape]` : Formes du curseur selon les modes
- `[keys.normal]`, `[keys.insert]`, `[keys.select]` : Raccourcis clavier personnalisés

### `languages.toml`

Configure le support des langages de programmation :

- **Serveurs LSP** : Configuration pour Rust, Python, TypeScript, JavaScript, Go, etc.
- **Formatters** : Integration avec black, prettier, rustfmt, alejandra, etc.
- **Indentation** : Paramètres spécifiques à chaque langage
- **Auto-complétion** et **formatage automatique** activés

#### Langages configurés

- Rust (rust-analyzer + rustfmt + clippy)
- Python (pylsp + black)
- TypeScript/JavaScript (typescript-language-server + prettier)
- Go (gopls)
- Nix (nil + alejandra)
- Et bien d'autres...

### `themes/catppuccin_mocha.toml`

Thème Catppuccin Mocha personnalisé avec :

- **Palette de couleurs** complète basée sur Catppuccin Mocha
- **Syntax highlighting** détaillé pour tous les types de tokens
- **Interface utilisateur** : curseurs, sélections, barres d'état
- **Diagnostics** : couleurs distinctes pour erreurs, avertissements, informations

## Installation et utilisation

### Prérequis

Assurez-vous d'avoir installé les LSP et formatters nécessaires :

```bash
# Rust
cargo install rust-analyzer

# Python
pip install python-lsp-server black

# Node.js/TypeScript
npm install -g typescript-language-server prettier

# Go
go install golang.org/x/tools/gopls@latest

# Nix
nix-env -iA nixpkgs.alejandra

# Autres outils utiles
npm install -g vscode-langservers-extracted  # HTML, CSS, JSON
pip install pylsp
```

### Configuration

1. Copiez les fichiers dans `~/.config/helix/`
2. Le thème sera automatiquement chargé depuis `themes/`
3. Lancez Helix avec `hx <fichier>`

## Raccourcis clavier personnalisés

### Mode Normal

- `Ctrl+S` : Sauvegarder (`:w`)
- `Ctrl+Q` : Quitter (`:q`)
- `Ctrl+Z` : Annuler (`undo`)
- `Ctrl+Y` : Rétablir (`redo`)
- `Alt+J/K` : Déplacer les lignes vers le bas/haut
- `Ctrl+J/K` : Navigation dans l'historique des sauts

### Espace (leader key)

- `Space + q/Q` : Quitter (forcer avec Q)
- `Space + w/W` : Sauvegarder (quitter avec W)
- `Space + f/F` : Sélecteur de fichiers
- `Space + b` : Sélecteur de buffers
- `Space + /` : Recherche globale

### Mode Insertion

- `Ctrl+S` : Sauvegarder
- `Alt+X` ou `j+k` : Retour au mode normal

## Fonctionnalités principales

### Édition modal

- **Mode Normal** : Navigation et commandes
- **Mode Insertion** : Saisie de texte
- **Mode Sélection** : Sélection et manipulation de texte

### LSP Integration

- **Auto-complétion** intelligente
- **Diagnostics** en temps réel
- **Go to definition** et **references**
- **Rename symbol** et **formatage**
- **Inlay hints** pour les types et paramètres

### Personnalisation

- **Thème** Catppuccin Mocha cohérent
- **Règles** à 80 et 120 caractères
- **Guides d'indentation** visibles
- **Soft wrap** activé pour les longues lignes
- **Bufferline** pour la navigation entre fichiers

## Maintenance

Pour mettre à jour la configuration :

1. Mettre à jour les LSP et formatters
2. Vérifier la compatibilité des versions
3. Tester les nouveaux raccourcis

## Ressources

- [Documentation officielle Helix](https://docs.helix-editor.com/)
- [Thème Catppuccin](https://github.com/catppuccin/helix)
- [Language Server Protocol](https://microsoft.github.io/language-server-protocol/)
