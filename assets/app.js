/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */
import './styles/app.scss';
import 'bootstrap/js/index.umd.js';

// Optionnel : importer Popper explicitement si nécessaire
import '@popperjs/core';

// --- Interactivité personnalisée Moviz --- //
document.addEventListener('DOMContentLoaded', () => {
    console.log('Moviz JavaScript actif ✅');

    // Fermeture automatique des messages flash après 4 secondes
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(() => {
        alert.classList.remove('show');
        }, 4000);
    });
});
// --- Validation des formulaires Bootstrap --- //
const forms = document.querySelectorAll('.needs-validation');
forms.forEach(form => {
    form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
        }
        form.classList.add('was-validated');
    });

// Appel asynchrone (chargement des derniers films)
const container = document.querySelector('#latest-movies');
if (container) {
    fetch('/api/movies/latest')
        .then(response => response.json())
        .then(data => {
            data.forEach(movie => {
            const card = document.createElement('div');
            card.classList.add('movie-card');
            card.innerHTML = `<h5>${movie.title}</h5><p>${movie.description || ''}</p>`;
            container.appendChild(card);
            });
        })
        .catch(error => console.error('Erreur de chargement des films :', error));
    }
});

