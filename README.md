# Zeus project : infrastructure “Cloud”

### Principal contributors :
[Arthur][A]
& [Etienne][E]

[A]:https://github.com/adjikpo
[E]:https://github.com/Lorddistrict

---------------------------------------------------------
## Information 
- Debian Buster 64 Bits
- Apache2
- PHP 7
- MariaDB 10
## Déploiement
Ecrire la configuration Kubernetes permettant de déployer le services suivants :

- MariaDB
sur une seule réplique ;
avec les bons volumes pour sauver les données et la configuration de l’application ;
- Dolibarr
sur 2 répliques
paramétré pour se connecter sur MariaDB ;
avec les bons volumes pour sauver les données et la configuration de l’application ;
un load balancer permettra de balancer les requêtes entrantes d’une réplique à l’autre (round-robin).

