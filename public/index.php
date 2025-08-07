<?php

use App\Kernel;
use Symfony\Component\Dotenv\Dotenv;

require_once dirname(__DIR__) . '/vendor/autoload_runtime.php';

// ✅ Ne charge .env que si aucune variable d'environnement n'est déjà définie (ex: sur Heroku)
if ($_ENV['APP_ENV'] ?? ($_SERVER['APP_ENV'] ?? null)) {
    // Les variables sont déjà définies (ex : via Heroku Config Vars)
} elseif (file_exists(dirname(__DIR__) . '/.env')) {
    (new Dotenv())->loadEnv(dirname(__DIR__) . '/.env');
}

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};