/*
  Un menu pour le choix entre 1 et 4 balles
 */
class menuChoix {
  PImage fondMenu;
  PImage bouton;

  //Constructeur de la classe menuChoix
  menuChoix() {
    fondMenu = loadImage("menu.jpeg");
    bouton = loadImage("bouton_mode_balles.png");
  }
}

/* Action qui permet d'afficher le menu pour le choix du mode de jeu
 *
 * @param menuChoix menu: un menu construit par la classe menuChoix
 *
 * Permet au menu d'être affiché dans la fenêtre
 */
void showMenuChoix(menuChoix menu) {
  background(menu.fondMenu);
  copy(menu.bouton, 0, 100, 150, 60, 400, 225, 150, 60); 
  copy(menu.bouton, 0, 0, 150, 60, 400, 125, 150, 60);

  /* Boucle if qui vérifie la position de la souris dans la fenêtre et change la couleur d'un boutons si elle est sur le des boutons */
  if ((mouseX > 405 && mouseX < 545) && (mouseY < 190 && mouseY > 120)) {
    copy(menu.bouton, 200, 0, 150, 60, 400, 125, 150, 60);
  } else if ((mouseX > 405 && mouseX < 545) && (mouseY < 290 && mouseY > 220)) {
    copy(menu.bouton, 200, 100, 150, 60, 400, 225, 150, 60);
  }
}
