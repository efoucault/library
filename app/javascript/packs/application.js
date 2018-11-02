import "bootstrap";

const resultats = document.querySelector(".resultats");
const bookKey = document.querySelector('.googlebook_key').dataset.google;
const contenu = document.querySelector("#livre_titre");

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

function ClickItem(data) {
  const resultatsCliques = document.querySelectorAll(".resultat");
  var description = document.querySelector("#livre_description");
  var titre = document.querySelector("#livre_titre");
  var auteur = document.querySelector("#livre_auteur");
  if (resultatsCliques !== null) {
    resultatsCliques.forEach((resultat) => {
      resultat.addEventListener("click", (event) => {
        const index = event.currentTarget.dataset.compteur;
        description.value = data.items[index].volumeInfo.description;
        auteur.value = data.items[index].volumeInfo.authors[0];
      });
    });
  }
}
