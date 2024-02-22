document.addEventListener("DOMContentLoaded", function() {
  const slides = document.querySelectorAll(".slide");
  const dots = document.querySelectorAll(".dot");
  let currentSlide = 0;
  let isDragging = false;
  let startPosX = 0;
  let endPosX = 0;

  // Fonction pour afficher une diapositive spécifique
  function showSlide(index) {
    // Afficher la diapositive correspondante et masquer les autres
    slides.forEach((slide, i) => {
      if (i === index) {
        slide.style.display = "block";
      } else {
        slide.style.display = "none";
      }
    });
    // Mettre à jour la classe active du point correspondant
    dots.forEach(dot => dot.classList.remove("active"));
    dots[index].classList.add("active");
  }

  // Afficher la première slide par défaut
  showSlide(currentSlide);

  // Gérer le clic sur un point pour afficher la diapositive correspondante
  dots.forEach((dot, i) => {
    dot.addEventListener("click", function() {
      currentSlide = parseInt(dot.getAttribute("data-index"));
      showSlide(currentSlide);
    });
  });

  // Ajouter les événements pour le défilement avec la souris
  document.addEventListener("mousedown", function(event) {
    isDragging = true;
    startPosX = event.clientX;
  });

  document.addEventListener("mousemove", function(event) {
    if (isDragging) {
      endPosX = event.clientX;
    }
  });

  document.addEventListener("mouseup", function(event) {
    if (isDragging) {
      const threshold = 50; // Seuil pour détecter le défilement
      const deltaX = endPosX - startPosX;
      if (deltaX > threshold) {
        // Défiler vers la gauche
        if (currentSlide > 0) {
          currentSlide--;
          showSlide(currentSlide);
        }
      } else if (deltaX < -threshold) {
        // Défiler vers la droite
        if (currentSlide < slides.length - 1) {
          currentSlide++;
          showSlide(currentSlide);
        }
      }
      isDragging = false;
    }
  });
});
