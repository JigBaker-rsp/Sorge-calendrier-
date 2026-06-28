# Calendrier de Sorge — V3

Petite application HTML/JS + Supabase pour indiquer les jours où les enfants et petits-enfants sont à Sorge pour Jean-Luc.

## Nouveauté V3

La configuration Supabase est maintenant isolée dans `config.js`.

Objectif : tu peux mettre à jour l’application en remplaçant `index.html` sans écraser la connexion à la base.

## Fichiers

```txt
index.html          Application
config.js           Paramètres Supabase à garder précieusement
config.sample.js    Exemple de configuration
supabase.sql        Script de création de la table et des politiques RLS
README.md           Notice
```

## Installation Supabase

1. Créer un projet Supabase.
2. Ouvrir **SQL Editor**.
3. Coller et exécuter le contenu de `supabase.sql`.
4. Aller dans **Project Settings > Data API**.
5. Copier :
   - l’URL du projet ;
   - la clé publique `anon` / `publishable`.
6. Modifier uniquement `config.js` :

```js
window.APP_CONFIG = {
  SUPABASE_URL: "https://ton-projet.supabase.co",
  SUPABASE_PUBLISHABLE_KEY: "ta-cle-publique",
  TABLE_NAME: "sorge_presences"
};
```

## Déploiement GitHub Pages

1. Créer un repo GitHub.
2. Ajouter `index.html`, `config.js`, `supabase.sql`, `README.md`.
3. Aller dans **Settings > Pages**.
4. Choisir **Deploy from branch** puis la branche `main`.
5. Ouvrir l’URL GitHub Pages générée.

## Mise à jour future sans casser Supabase

Quand je te fournis une nouvelle version :

- remplace `index.html` ;
- remplace éventuellement `README.md` ;
- ne remplace pas `config.js` si tes vrais identifiants Supabase sont déjà dedans.

`config.sample.js` sert seulement d’exemple.

## Sécurité

Cette application est volontairement sans login. Toute personne ayant le lien peut lire, ajouter, modifier et supprimer les présences.

La clé Supabase utilisée côté navigateur est une clé publique. La vraie protection vient des politiques RLS dans `supabase.sql`. Pour un usage familial avec lien partagé, c’est volontairement simple.
