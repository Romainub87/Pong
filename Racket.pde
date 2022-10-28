/** largeur d'une raquette */
final int RACKET_WIDTH  = 10;
/** hauteur d'une raquette */
final int RACKET_HEIGHT = 40;
/** vitesse de déplacement vertical d'une raquette */
final int RACKET_SPEED  = 7;
/** distance du bord de la fenêtre pour la raquette */
final int BORDER_SPACE  = 20;

PImage styleraquette;

/*
 * Une raquette.
*/
class Racket {
  int x;
  int y;
  int couleur;
  int mvtY;
  PImage style;
  
  
  /* Constructeur de la classe Racket:
  *
  * @param int xR : abscisse de la raquette
  * @param int yR : ordonné de la raquette
  * @param color couleurR : couleur de la raquette
  *
  * Affecte les valeurs des paramètres aux attributs de la classe Racket
  */
  Racket(int xR, int yR, color couleurR) {
    x = xR;
    y = yR;
    couleur = couleurR;
    mvtY = 0;
    style = loadImage("player01.png");
  }
}

/* Action qui permet d'afficher la raquette à l'écran
*
* @param Racket r : une raquette construite à partir de la classe Racket
*
* Affiche la raquette avec les coordonnées qui lui sont affectées au moment de la construction
*/
void showRacket(Racket r) {
  image(r.style,r.x, r.y, RACKET_WIDTH, RACKET_HEIGHT);
}

/* Action qui permet de donner un mouvement à la raquette
*
* @param Racket r : une raquette construite à partir de la classe Racket
*
* Donne un mouvement à la raquette
*/
void moveRacket(Racket r)
{
  r.y += r.mvtY;
  if (r.y <= 0){
    r.y = 0;
  }else if (r.y >= 400 - RACKET_HEIGHT){
    r.y = 400 - RACKET_HEIGHT;
  }
}


    
