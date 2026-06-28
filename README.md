# Calendrier de Sorge

Application familiale simple en HTML/JavaScript + Supabase, pensée pour :

- une **vue planning très lisible** pour Jean-Luc ;
- une **saisie rapide** pour les enfants et petits-enfants ;
- un déploiement direct sur **GitHub Pages**.

## Nouveautés UX

- Deux onglets :
  - **Planning** : vue mensuelle compacte, en carrés/semaine, avec des barres horizontales qui traversent les jours où chaque personne est présente.
  - **Saisie & modifications** : formulaire compact + liste des présences du mois.
- Boutons moins gros.
- Moins de scroll vertical.
- La vue principale donne la vision d’ensemble du mois.
- Cliquer sur une barre dans le planning ouvre directement la modification de la présence.

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

Cette version est volontairement sans compte utilisateur pour rester très simple.
Conséquence : toute personne qui a le lien peut lire, ajouter, modifier et supprimer les présences.

Pour une version plus protégée, il faudra ajouter une authentification Supabase ou une règle côté serveur.
