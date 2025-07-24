<?php
// src/Service/MovieApiService.php
namespace App\Service;

use Symfony\Contracts\HttpClient\HttpClientInterface;

class MovieApiService
{
    private string $apiKey = 'f11d2932f20dcd1289fa7e6586c4a7ec';

    public function __construct(private HttpClientInterface $client) {}

    public function fetchPopularMovies(int $page = 1): array
    {
        $url = "https://api.themoviedb.org/3/movie/popular?api_key={$this->apiKey}&language=fr&page={$page}";

        $response = $this->client->request('GET', $url);
        $data = $response->toArray();

        return $data['results'] ?? [];
    }
}