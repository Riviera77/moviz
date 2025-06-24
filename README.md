# 🎬 Moviz

Moviz est un site web de **notation et critique de films**. Il permet aux utilisateurs de s’inscrire, de noter des films et, s’ils le souhaitent, de publier une critique. Un espace d’administration permet de gérer les films, les réalisateurs, les critiques, et de modérer le contenu.

## 🧩 Fonctionnalités principales

- Inscription et authentification des utilisateurs
- Notation de films (avec ou sans critique écrite)
- Publication de critiques soumises à validation par un administrateur
- Gestion des films (nom, année de sortie, catégories)
- Association d’un film à plusieurs réalisateurs (nom, prénom)
- Filtrage des films par catégorie, réalisateur ou mot-clé
- Back-office pour administrer les films, critiques, catégories, réalisateurs
- Application d'une charte graphique définie

## 🛠️ Stack technique

- **Frontend** : HTML5, CSS3 (Bootstrap), JavaScript
- **Backend** : PHP 8.3, Symfony 6, Twig
- **Base de données relationnelle** : MySQL
- **Conteneurisation** : Docker & Docker Compose
- **CI/CD** : GitHub Actions
- **Déploiement** : 
- **Environnement local** : Docker Desktop

## 📁 Structure du projet
├── docker-compose.yml
├── Dockerfile
├── nginx/
│   └── conf.d/
├── src/
├── templates/
├── public/
├── config/
├── migrations/
└── README.md

## ⚙️ Démarrage local avec Docker

```bash
# Lancer les conteneurs
docker-compose up -d --build

# Installer les dépendances PHP 
# déjà intégré dans Dockerfile - utile pour un 
# déploiement en dehors de Docker
docker exec -it php_moviz composer install

# Créer la base de données et exécuter les migrations
docker exec -it php_moviz php bin/console doctrine:database:create
docker exec -it php_moviz php bin/console doctrine:migrations:migrate

🔐 Accès à l’application
	•	Frontend : http://localhost:8081
	•	Back-office : http://localhost:8081/admin (EasyAdmin)
	•	MySQL/PostgreSQL : accès via phpMyAdmin ou DBeaver
	•	MongoDB : accès via MongoDB Compass

📚 Documentation incluse
	•	Charte graphique appliquée
	•	Spécifications techniques et fonctionnelles
	•	Suivi du projet (Trello)

👩‍💻 Auteur

Développé par CodingQueen40 dans le cadre de l’ECF – Titre professionnel DWWM.