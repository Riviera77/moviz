<?php

namespace App\Form;

use App\Entity\Genre;
use App\Entity\Movie;
use App\Entity\Director;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class MovieFilterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('keyword', TextType::class, [
                'required' => false,
                'label' => 'Titre du film',
                'attr' => ['placeholder' => 'Rechercher un titre...']
            ])
            ->add('genre', EntityType::class, [
                'class' => Genre::class,
                'choice_label' => 'name',
                'required' => false,
                'placeholder' => 'Tous les genres',
                'label' => 'Genre',
            ])
            ->add('director', EntityType::class, [
                'class' => Director::class,
                'choice_label' => function ($director) {
                    return $director->getFirstName() . ' ' . $director->getLastName();
                },
                'required' => false,
                'placeholder' => 'Tous les réalisateurs',
                'label' => 'Réalisateur',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Movie::class,
        ]);
    }
}