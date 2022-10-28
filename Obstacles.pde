// Largeur d'un obstacle
int OBS_WIDTH = 30;
// Hauteur d'un obstacle
int OBS_HEIGHT = 60;

/*
  Un obstacle
*/
class Obstacle {
  int x;
  int y;
  int couleur;
  
  // Constructeur de la classe Obstacle
  Obstacle(int xObs, int yObs, color couleurObs){
    x = xObs;
    y = yObs;
    couleur = couleurObs;
  }
}

/* Action qui permet d'afficher l'obstacle à l'écran
*
* @param Obsatcle obs : un obstacle construit à partir de la classe Obstacle
*
* Affiche l'obstacle avec les coordonnées qui lui sont affectées au moment de la construction
*/
void showObstacle(Obstacle obs) {
  rect(obs.x, obs.y, OBS_WIDTH, OBS_HEIGHT);
}
