<?php

namespace App\Controller;

use App\Entity\Movie;
use App\Entity\Review;
use App\Form\ReviewType;
use App\Repository\DirectorRepository;
use App\Repository\GenreRepository;
use App\Repository\MovieRepository;
use App\Repository\ReviewRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

final class MovieController extends AbstractController
{
    #[Route('/films', name: 'app_movie')]
    public function index(MovieRepository $movieRepository, GenreRepository $genreRepository, 
                            DirectorRepository $directorRepository, Request $request): Response
    {
        
        // Retrieve the parameters of search from URL
        $genreId = $request->get('genreId');
        $directorId = $request->get('directorId');
        $keyword = $request->get('keyword');

        //call the repository avec all filters
        $movies = $movieRepository->findMovies($genreId, directorId: $directorId, keyword: $keyword);

        /* dump($movies); */

        return $this->render('movie/index.html.twig', [
            'movies' => $movies,
            'genreId' => $genreId,
            'directorId' => $directorId,
            'keyword' => $keyword,
            'genres' => $genreRepository->findAll(),
            'directors' => $directorRepository->findAll(),
        ]);
    }

    #[Route('/films/{id}', name: 'app_movie_show', requirements: ['id' => '\d+'])]
    public function show(Movie $movie, Request $request, EntityManagerInterface $em, Security $security, 
                        ReviewRepository $reviewRepository, SessionInterface $session): Response
    {
        // redirect to the previous page where the user was before to connect himself
        $session->set('previous_url', $request->getUri());
        
        //retrieve the average rate for the movie
        $averageRate = round($reviewRepository->getAverageRateByMovieId($movie->getId()));
        
        //recover the user from the security context
        $user = $security->getUser();

        //if the user has already submitted a review for this movie, retrieve it for display and modification
        $review = $reviewRepository->findOneBy(['movie'=> $movie, 'userAccount'=> $user]);

        
        //if the user has not submitted a review for this movie, create a new review
        if (!$review) {
            //create a form to add a review
            $review = new Review();
            //associate the review to the film
            $review->setMovie($movie);
            //associate the review to the user
            $review->setUserAccount($user);
            //review : display approved
            $review->setApproved(false);
        };
        

        $form= $this->createForm(ReviewType::class, $review );
        $form->handleRequest($request);

        //verify if the form is submitted and valid and persist the review in the database
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($review);
            $em->flush();

            return $this->redirectToRoute('app_movie_show', ['id' => $movie->getId()]);
        }

        return $this->render('movie/show.html.twig', [
            'movie' => $movie,
            'form' => $form,
            'user' => $user,
            'averageRate'=> $averageRate,
        ]);
    }
}