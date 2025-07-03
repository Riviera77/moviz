<?php

namespace App\Controller\Admin;

use App\Entity\Movie;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class MovieCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Movie::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        yield TextField::new("name")
            ->setLabel("Nom")
            ->setRequired(true)
            ->setHelp("Entrez le nom du réalisateur");

        yield DateTimeField::new("release_date")
            ->setLabel("Date de sortie")
            ->setRequired(true)
            ->setHelp("Entrez la date de sortie du film");
        
        yield AssociationField::new('directors')
            ->setLabel('Réalisateurs')
            ->setRequired(true)
            ->setHelp('Sélectionnez les réalisateurs associés à ce film');
        
        yield AssociationField::new('genres')
            ->setLabel('Genre')
            ->setRequired(true)
            ->setHelp('Sélectionnez les genres associés à ce film');
    }
   
}