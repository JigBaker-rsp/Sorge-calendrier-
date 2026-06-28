# Calendrier de Sorge

Application familiale ultra simple en HTML/JavaScript + Supabase.

## Fonctionnalités

- Vue mensuelle lisible avec très gros boutons.
- Ajout d'une présence sur un jour ou une période.
- Modification et suppression par tout le monde.
- Synchronisation Supabase.
- Compatible GitHub Pages : aucun build, aucun backend à coder.

## Installation Supabase

1. Crée un projet Supabase.
2. Va dans **SQL Editor**.
3. Colle et exécute le contenu du fichier `supabase.sql`.
4. Va dans **Project Settings > Data API**.
5. Copie :
   - l'URL du projet ;
   - la clé publique / anon / publishable key.
6. Dans `index.html`, remplace :

```js
const SUPABASE_URL = "https://TON-PROJET.supabase.co";
const SUPABASE_PUBLISHABLE_KEY = "TON_ANON_OU_PUBLISHABLE_KEY";
```

## Déploiement GitHub Pages

1. Crée un repo GitHub, par exemple `calendrier-sorge`.
2. Ajoute `index.html` à la racine du repo.
3. Dans GitHub : **Settings > Pages**.
4. Source : `Deploy from a branch`.
5. Branch : `main` / folder `/root`.
6. Partage le lien GitHub Pages à la famille.

## Sécurité

Cette version est volontairement sans compte utilisateur pour être simple.
Conséquence : toute personne qui a le lien peut lire, ajouter, modifier et supprimer les présences.

Pour une version plus protégée, ajoute une authentification Supabase ou un petit code PIN familial côté application + règle côté serveur.
