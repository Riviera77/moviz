<?php

namespace App\Controller;

use App\Repository\MovieRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

final class PageController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(MovieRepository $movieRepository, ParameterBagInterface $ParameterBagInterface): Response
    {
        /* dump($ParameterBagInterface->get('home_movies_limit')); */
        
        $limit = $ParameterBagInterface->get('home_movies_limit');
        $movies = $movieRepository->findBy([], ['id'=> 'DESC'], $limit);
        
        $websiteName= 'Moviz';
        return $this->render('page/index.html.twig', [
            'websiteName' => $websiteName,
            'movies' => $movies,
        ]);
    }

    #[Route('/about', name: 'app_about')]
    public function about(): Response
    {
        return $this->render('page/about.html.twig', [
            'controller_name' => 'PageController',
        ]);
    }

    #[Route('/faq', name: 'app_faq')]
    public function faq(): Response
    {
        return $this->render('page/faq.html.twig', [
            'controller_name' => 'PageController',
        ]);
    }
}