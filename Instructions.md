# Marche à suivre

Avant de faire cet exercice il faut avant tout se rassurer que vous avez le serveur PostgreSQL qui est installé sur votre ordinateur.

- Lancer le serveur PostgreSQL si ce dernier ne l’est pas, avec la commande

```{SHELL}
systemctl start postgres
```

Une fois vous avez lancez le serveur vous pouvez vous connecter a PostgreSQL via un utilisateur present sur votre système et son mot de passe, si vous n’avez pas encore l’utilisateur, utiliser celui qui vient par defaut

```{SHELL}
sudo -u postgres psql`
```

Une fois connecté en tant que postgres vous allez creer Votre base de donnée, et suivre les etapes comme le montre le fichier `**gouniv.sql**`
Dans le cas où vous ne voulez pas suivre toutes les étapes selon ce fichier **`gouniv.sql`**,Vous avez juste à telecharger le fichier gouvinv.sql sur ce repos et executez-le dans postgres avec la commande:

```{SHELL}
psql -h localhost -p 5432 -u postgres -f gouniv.sql
```

Avec:

- -h : Comme HOST
- -p : Pour PORT
- -u : Pour User
- -f : Pour file

## Commande utiliser Dans le fichier gouniv.sql

- `sudo -u postgres -i psql` :Pour la Connexion à postgres comme DB par defaut
- `CREATE DATABASE` : Pour créer une Base de donnée
- `CREATE TABLE` : Pour créer une table
- `CREATE USER` : Pour créer un utilisateur
- `GRANT`  : peut être ajouté à un type de droit pour tester si le droit est obtenu
- `GRANT SELECT` : Pour Donner l’utilisateur le droit de lire les données dans la DB
- `GRANT INSERT` : Pour Donner l’utilisateur le droit d’insérer les données la DB
- `INSERT INTO` : Pour Insérer les éléments dans la table
- `SERIAL` : Pour l’auto-incrémentation et l’unicité d’une clé
- `REFERENCES ()`:Pour décrire une clé étrangers dans la DB

## Ressources utilisées

- [https://sql.sh](https://sql.sh/) Documentation PostgreSQL.pdf
- [https://www.ibm.com/docs/fr/qmf/11.1?topic=privileges-sql-grant-statement](https://www.ibm.com/docs/fr/qmf/11.1?topic=privileges-sql-grant-statement)
