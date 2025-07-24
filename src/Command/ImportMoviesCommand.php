<?php
// src/Command/ImportMoviesCommand.php
namespace App\Command;

use App\Entity\Movie;
use App\Service\MovieApiService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

#[AsCommand(name: 'app:import-movies')]
class ImportMoviesCommand extends Command
{
    public function __construct(
        private MovieApiService $movieApiService,
        private EntityManagerInterface $em
    ) {
        parent::__construct();
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $output->writeln('📥 Import des films en cours...');

        for ($page = 1; $page <= 5; $page++) {
            $moviesData = $this->movieApiService->fetchPopularMovies($page);

            foreach ($moviesData as $data) {
                $movie = new Movie();

                $movie->setName($data['title'] ?? 'Sans titre');

                if (!empty($data['release_date'])) {
                    try {
                        $movie->setReleaseDate(new \DateTime($data['release_date']));
                    } catch (\Exception $e) {
                        $output->writeln("❌ Date invalide pour : {$data['title']}");
                    }
                }

                $movie->setSynopsis($data['overview'] ?? null);

                if (!empty($data['poster_path'])) {
                    $movie->setImageName(ltrim($data['poster_path'], '/')); // On stocke le nom seulement
                }

                $this->em->persist($movie);
            }
        }

        $this->em->flush();

        $output->writeln('✅ Import terminé ! Films ajoutés avec succès.');
        return Command::SUCCESS;
    }
}