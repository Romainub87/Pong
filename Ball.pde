/** largeur (ou diamètre) de la balle */
final int BALL_WIDTH = 10;
/** vitesse de déplacement de la balle */
final int BALL_SPEED = 2;
/** couleur de la balle */
final color BALL_COLOR = BLANC;


PImage styleballe;
/**
 * Une balle.
 */
class Ball {

  /** abscisse du centre de la balle */
  int x;

  /** ordonnée du centre de la balle */
  int y;

  /** mouvement sur l'axe des abscisses */
  int mvt_x;

  /** mouvement sur l'axe des ordonnées */
  int mvt_y;

  PImage styleballe;

  /**
   * Initialisation d'une balle : tous les attributs prennent des valeurs par défaut.
   */
  Ball() {
    x = width/2;
    y = int(random(125, 275));
    mvt_x = BALL_SPEED;
    mvt_y = BALL_SPEED;
    styleballe = loadImage("ball.png");
  }
}

/**
 * Affichage de la balle
 */
void showBall(Ball b)
{
  image(b.styleballe, b.x, b.y, BALL_WIDTH, BALL_WIDTH);
}

/**
 * Déplacement de la balle
 */
void moveBall(Ball b)
{
  // Mouvement Horizontal
  b.x += b.mvt_x;
  if (collisionHorizontale(b))
  {
    b.x -= b.mvt_x;// changement de direction
    b.mvt_x *= -1;
  }

  // Mouvement Vertical
  b.y += b.mvt_y ;
  if (collisionVerticale(b)) {
    b.y -= b.mvt_y; // mouvement annulé
    b.mvt_y *= -1; // changement de direction
  }
}

/**
 * Retourne vrai si la balle ....
 */
boolean collisionHorizontale(Ball b)
{
  return (b.x > width - BALL_WIDTH/2) || (b.x < 0 + BALL_WIDTH/2) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, racket.x, racket.y, RACKET_WIDTH, RACKET_HEIGHT) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, racket2.x, racket2.y, RACKET_WIDTH, RACKET_HEIGHT) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, obstacle.x, obstacle.y, OBS_WIDTH, OBS_HEIGHT) 
    || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, obstacle2.x, obstacle2.y, OBS_WIDTH, OBS_HEIGHT) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, obstacle3.x, obstacle3.y, OBS_WIDTH, OBS_HEIGHT);
}

/**
 * Retourne vrai si la balle ...
 */
boolean collisionVerticale(Ball b)
{
  return (b.y > height - BALL_WIDTH/2) || (b.y < 0 + BALL_WIDTH/2) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, racket.x, racket.y, RACKET_WIDTH, RACKET_HEIGHT) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, racket2.x, racket2.y, RACKET_WIDTH, RACKET_HEIGHT) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, obstacle.x, obstacle.y, OBS_WIDTH, OBS_HEIGHT)
    || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, obstacle2.x, obstacle2.y, OBS_WIDTH, OBS_HEIGHT) || collision(b.x, b.y, BALL_WIDTH, BALL_WIDTH, obstacle3.x, obstacle3.y, OBS_WIDTH, OBS_HEIGHT);
}
