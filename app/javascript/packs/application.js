import "bootstrap";

const stars = document.querySelectorAll(".clickstar");

stars.forEach((star) => {
  star.addEventListener("click", (event) => {
    stars.forEach((star) => {
      star.classList.remove("yellow")
    });
    var compteur = star.dataset.star;
    const note = document.querySelector("#emprunt_note");
    note.value = compteur;
    stars.forEach((star) => {
      if (star.dataset.star <= compteur) {
        star.classList.add("yellow");
      }
    });
  });
});

document.addEventListener("DOMContentLoaded", (event) => {
  const note = document.querySelector("#emprunt_note");
  const stars = document.querySelectorAll(".clickstar");
  stars.forEach((star) => {
      if (star.dataset.star <= note.value) {
        star.classList.add("yellow");
      }
    });
});

// affichage des éléments de ma wishlist
const wishlistButtons = document.querySelectorAll(".fa-list-alt");
wishlistButtons.forEach((button) => {
  button.addEventListener("click", (event) => {
    if (button.dataset.like == "true") {
      console.log("true");
      button.classList.remove("likeButton");
    }
    else {
      console.log("false");
      button.classList.add("likeButton");
    }
  });
});

// Profil User
const MesLivres = document.querySelector(".mes-livres");
const MesEmprunts = document.querySelector(".mes-emprunts");
const MesNotifs = document.querySelector(".notifications");
const MaWishlist = document.querySelector(".wishlist");

if (MesLivres != null) {
  const LivreIcon = document.querySelector(".fa-book");
  LivreIcon.addEventListener("click", (event) => {
    MesLivres.classList.remove("hidden");
    MesEmprunts.classList.add("hidden");
    MesNotifs.classList.add("hidden");
    MaWishlist.classList.add("hidden");
    LivreIcon.classList.add("red");
    GlassesIcon.classList.remove("red");
    HeartIcon.classList.remove("red");
    EnvelopeIcon.classList.remove("red");
  });
  const GlassesIcon = document.querySelector(".fa-glasses");
  GlassesIcon.addEventListener("click", (event) => {
    MesLivres.classList.add("hidden");
    MesEmprunts.classList.remove("hidden");
    MesNotifs.classList.add("hidden");
    MaWishlist.classList.add("hidden");
    LivreIcon.classList.remove("red");
    GlassesIcon.classList.add("red");
    HeartIcon.classList.remove("red");
    EnvelopeIcon.classList.remove("red");
  });
  const HeartIcon = document.querySelector(".fa-heart");
  HeartIcon.addEventListener("click", (event) => {
    MesLivres.classList.add("hidden");
    MesEmprunts.classList.add("hidden");
    MesNotifs.classList.add("hidden");
    MaWishlist.classList.remove("hidden");
    LivreIcon.classList.remove("red");
    GlassesIcon.classList.remove("red");
    HeartIcon.classList.add("red");
    EnvelopeIcon.classList.remove("red");
  });
  const EnvelopeIcon = document.querySelector(".fa-envelope");
  EnvelopeIcon.addEventListener("click", (event) => {
    MesLivres.classList.add("hidden");
    MesEmprunts.classList.add("hidden");
    MesNotifs.classList.remove("hidden");
    MaWishlist.classList.add("hidden");
    LivreIcon.classList.remove("red");
    GlassesIcon.classList.remove("red");
    HeartIcon.classList.remove("red");
    EnvelopeIcon.classList.add("red");
  });
}

const resultats = document.querySelector(".resultats");
const bookKey = document.querySelector('.googlebook_key').dataset.google;
const contenu = document.querySelector("#livre_titre");

if (contenu != null) {
  contenu.addEventListener('blur', (evt) => {
    fetch(`https://www.googleapis.com/books/v1/volumes?q=${contenu.value}&key=${bookKey}`, {
       method: "GET",
       })
       .then(response => response.json())
       .then((data) => {
        const resultats = document.querySelector(".resultats");
        resultats.classList.remove("hidden");
        const Ensembleresultats = document.querySelectorAll(".resultat");
        Ensembleresultats.forEach((resultat) => {
          resultat.parentNode.removeChild(resultat);
        });
         var compteur;
         for (compteur = 2; compteur >= 0; compteur--) {
           const titre = data.items[compteur].volumeInfo.title;
           const auteur = data.items[compteur].volumeInfo.authors[0];
           var thumbnail = "https://books.google.fr/googlebooks/images/no_cover_thumb.gif"
           if (data.items[compteur].volumeInfo.imageLinks !== undefined) {
             thumbnail = data.items[compteur].volumeInfo.imageLinks.thumbnail;
           }
           resultats.insertAdjacentHTML("afterbegin", `<div class="resultat" data-compteur="${compteur}"> \n
              <div class="livre-couverture"> \n
                <img src="${thumbnail}" width="50%" height="80%" alt=""> \n
              </div> \n
              <div class="details"> \n
                <p><strong>${titre}</strong></p> \n
                <p id="auteur">${auteur}</p> \n
              </div> \n
            </div> \n
            `);

           ClickItem(data);
      }
    });
  });
}

// // Get Book thumbnail
// function bookThumbnail(data, compteur) {
//    if (data.items[compteur].volumeInfo.imageLinks !== undefined) {
//       thumbnail = data.items[compteur].volumeInfo.imageLinks.thumbnail;
//    }
//   return thumbnail;
// }

function ClickItem(data) {
  const resultatsCliques = document.querySelectorAll(".resultat");
  var description = document.querySelector("#livre_description");
  var titre = document.querySelector("#livre_titre");
  var auteur = document.querySelector("#livre_auteur");
  var pochette = document.querySelector("#livre_pochette");
  if (resultatsCliques !== null) {
    resultatsCliques.forEach((resultat) => {
      resultat.addEventListener("click", (event) => {
        resultatsCliques.forEach((resultat) => {
          resultat.classList.remove('selected');
        });
        const index = event.currentTarget.dataset.compteur;
        description.value = data.items[index].volumeInfo.description;
        auteur.value = data.items[index].volumeInfo.authors[0];
        resultat.classList.add('selected');
        if (data.items[index].volumeInfo.imageLinks !== undefined) {
          pochette.value = data.items[index].volumeInfo.imageLinks.thumbnail;
        }
      });
    });
  }
}

// click on choose file when clicking on the camera icon
const cameraIcon = document.querySelector(".fa-video");
if (cameraIcon != null) {
  cameraIcon.addEventListener("click", (event) => {
    const index = event.currentTarget.dataset.index;
    document.getElementById("livre_video").click();
  });
}

// Preview de la video lors de la création d'un livre
const videoCachee = document.querySelector(".video");
const preview = document.querySelector(".video-preview");
if (cameraIcon != null && preview != null) {
  videoCachee.addEventListener("change", (event) => {
    preview.classList.remove("hidden");
    let reader = new FileReader();
    reader.onload = function (e) {
        $(".video-preview").attr('src', e.target.result);
      }
      reader.readAsDataURL(videoCachee.files[0]);
  });
}



