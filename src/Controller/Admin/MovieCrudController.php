<?php

namespace App\Controller\Admin;

use App\Entity\Movie;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TimeField;
use Vich\UploaderBundle\Form\Type\VichImageType;

class MovieCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Movie::class;
    }

    
    public function configureFields(string $pageName): iterable
    {

        //pour ne pas récupérer l'image du film en dur
        $mappingsParams = $this->getParameter('vich_uploader.mappings');
        $moviesImagePath = $mappingsParams['movies']['uri_prefix'];

        yield TextField::new("name")
            ->setLabel("Nom")
            ->setRequired(true)
            ->setHelp("Entrez le nom du réalisateur");

        yield DateField::new("release_date")
            ->setLabel("Date de sortie")
            ->setRequired(false)
            ->setHelp("Entrez la date de sortie du film");
        
        yield TimeField::new("duration")
            ->setLabel("Durée")
            ->setRequired(false)
            ->setHelp("Entrez la durée du film (HH:MM:SS)");
        
        yield TextEditorField::new("synopsis")
            ->setLabel("Synopsis")
            ->setRequired(false)
            ->setHelp("Entrez une description du film");
        
        yield TextareaField::new("imageFile")
            ->setLabel("Image")
            ->setFormType(VichImageType::class)
            ->hideOnIndex() // Affiche le champ uniquement dans le formulaire pas dans la liste
            ->setRequired(false)
            ->setHelp("Entrez le chemin de l'image associée au film");

        yield ImageField::new('imageName')
            ->setBasePath($moviesImagePath)
            ->setLabel('Image')
            ->hideOnForm() //n'affiche pas le champ dans le formulaire
            ->setRequired(false)
            ->setHelp('Image du film (affichée dans la liste des films)')
            ->onlyOnIndex();

        yield AssociationField::new('directors')
            ->setLabel('Réalisateurs')
            ->setRequired(isRequired: false)
            ->setHelp('Sélectionnez les réalisateurs associés à ce film');
        
        yield AssociationField::new('genres')
            ->setLabel('Genres')
            ->setRequired(false)
            ->setHelp('Sélectionnez les genres associés à ce film');
    }
}