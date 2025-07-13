#!/bin/bash

echo "📦 Renommage de App\\Entity\\User → App\\Entity\\UserAccount..."

# 1. Renommer le fichier
mv src/Entity/User.php src/Entity/UserAccount.php
echo "✅ Fichier renommé : User.php → UserAccount.php"

# 2. Renommer la classe dans le fichier
sed -i '' 's/class User /class UserAccount /' src/Entity/UserAccount.php
echo "✅ Classe renommée dans le fichier source"

# 3. Remplacer tous les use App\Entity\User par UserAccount
grep -rl "App\\Entity\\User" src/ | while read file; do
  sed -i '' 's/App\\Entity\\User/App\\Entity\\UserAccount/g' "$file"
  echo "🔁 Mise à jour : $file"
done

# 4. Mise à jour des relations Doctrine si nommées "user"
grep -rl "\$user" src/ | while read file; do
  sed -i '' 's/\$user/\$userAccount/g' "$file"
  echo "🧩 Variable renommée dans : $file"
done

# 5. Vider le cache Symfony
docker exec -it php_moviz php bin/console cache:clear --no-warmup
docker exec -it php_moviz php -r "opcache_reset();"
docker restart php_moviz

echo "🚀 Terminé. Recharge ton navigateur pour vérifier que l’erreur est disparue."
chmod +x rename-user-to-useraccount.sh

