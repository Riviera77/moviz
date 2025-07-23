<?php

namespace App\Repository;

use App\Entity\Movie;
use App\Entity\Director;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Movie>
 */
class MovieRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Movie::class);
    }

    //    /**
    //     * @return Movie[] Returns an array of Movie objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('m')
    //            ->andWhere('m.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('m.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Movie
    //    {
    //        return $this->createQueryBuilder('m')
    //            ->andWhere('m.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }

    public function findMovies($genreId = null, $directorId = null, $keyword = null)
    {
        $qb = $this->createQueryBuilder('m')
            ->leftJoin('m.genres', 'g')
            ->leftJoin('m.directors', 'd')
            ->select('m', 'g', 'd');

        if (!empty($genreId)) {
            $qb->andWhere('g.id = :genreId')
                ->setParameter('genreId', $genreId);
        }

        if (!empty($directorId)) {
            $qb->andWhere('d.id = :directorId')
            ->setParameter('directorId', $directorId);
        }

        if (!empty($keyword)) {
            $keyword = trim($keyword);
            $qb->andWhere('m.name LIKE :keyword')
            ->setParameter('keyword', '%'. $keyword .'%');
        }

        return $qb->getQuery()->getResult();
    }
}