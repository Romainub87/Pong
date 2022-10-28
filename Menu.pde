/*
  * Un menu
*/
class Menu {
  PImage fond;
  PImage button;

  /* Constructeur de la classe Menu */
  Menu() {
    fond = loadImage("menu.jpeg");
    button = loadImage("button.png");
  }
}

/* Action qui affiche le menu, les boutons PLAY et QUIT
*
* @param Menu m : Un menu construit à partir de la classe Menu
*/
void showMenu(Menu m) {
  background(m.fond);
  copy(m.button, 0, 100, 150, 60, 400, 125, 150, 60); 
  copy(m.button, 0, 0, 150, 60, 400, 225, 150, 60);

  /* Boucle if qui vérifie la position de la souris dans la fenêtre et change la couleur d'un boutons si elle est sur le des boutons */
  if ((mouseX > 405 && mouseX < 545) && (mouseY < 190 && mouseY > 120)) {
    copy(m.button, 200, 100, 150, 60, 400, 125, 150, 60);
  } else if ((mouseX > 405 && mouseX < 545) && (mouseY < 290 && mouseY > 220)) {
    copy(m.button, 200, 0, 150, 60, 400, 225, 150, 60);
  }
}
