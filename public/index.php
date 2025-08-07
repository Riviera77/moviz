<?php

use App\Kernel;
use Symfony\Component\Dotenv\Dotenv;

require_once dirname(__DIR__).'/vendor/autoload_runtime.php';

// Fallback local uniquement si les variables d'env ne sont pas définies (Heroku n'a pas besoin du .env)
if (!isset($_ENV['APP_ENV']) && file_exists(dirname(__DIR__).'/.env')) {
    (new Dotenv())->bootEnv(dirname(__DIR__).'/.env');
}

return function (array $context) {
    return new Kernel($context['APP_ENV'], (bool) $context['APP_DEBUG']);
};