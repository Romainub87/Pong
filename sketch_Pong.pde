// Constantes - Couleurs //<>//

final color NOIR = color(0);
final color BLANC = color(255);
final color ROUGE = color(255, 0, 0);
final color VERT = color(0, 255, 0);
final color BLEU = color(0, 0, 255);

// police score
PFont fontscore;
char tiret = '-';
PImage img;
PImage menubouton;

//Gestion des obstacles
int x;
int y;

// Etat du jeu
int etat = 1;
//Différent menus
Menu menu;
menuChoix menuchoix;

//Points des joueurs
int scoreJ1 = 0;
int scoreJ2 = 0;

/** Gestion de la pause */
boolean enPause = false;

/** La balle */
Ball ball, ball2, ball3, ball4;
Racket racket, racket2;
Obstacle obstacle, obstacle2, obstacle3;

/**
 * Fonction d'initialisation Processing.
 */
void setup()
{
  size(600, 400);
  frameRate(144);
  menubouton = loadImage("bouton_menu.png");
  //on définit l'image de fond du jeu
  img = loadImage("terrain_pong.jpg");

  // police score
  fontscore = loadFont("Arial-Black-48.vlw");

  // on initialise nos objets
  //Initialisation des balles
  ball = new Ball();
  ball2 = new Ball();
  ball3 = new Ball(); 
  ball4 = new Ball();
  //Initialisation des raquettes
  racket = new Racket(25, 175, BLEU);
  racket2 = new Racket(565, 175, ROUGE);
  //Initialisation des obstacles
  y = int(random(100, 350));
  x = int(random(325, 450));
  obstacle = new Obstacle(x, y, 255);
  y = int(random(100, 350));
  x = int(random(150, 255));
  obstacle2 = new Obstacle(x, y, 255);
  y = int(random(100, 250));
  x = int(random(150, 250));
  obstacle3 = new Obstacle(x, y, 255);


  //on initialise le menu
  menu = new Menu();

  //on initialise le menu de choix du nombre de balles
  menuchoix = new menuChoix();
}

/**
 * Fonction de rafraichissement Processing.
 */
void draw()
{
  if (etat == 0) {
    showJeu1Balle();
  } else if (etat == 1) {
    clear();
    showMenu(menu);
  } else if (etat == 2) {
    clear();
    showMenuChoix(menuchoix);
  } else if (etat == 3) {
    showJeu4balle();
  }
}

/* 
 Fonction qui permet de détecter si un clic de la souris est fait sur un des boutons
 */
void mousePressed() {
  if (etat == 1) {
    if ((mouseX > 405 && mouseX < 545) && (mouseY < 185 && mouseY > 125)) {
      etat = 2;
    } else if ((mouseX > 405 && mouseX < 545) && (mouseY < 290 && mouseY > 220)) {
      exit();
    }
  } else if (etat == 2) {
    if ((mouseX > 405 && mouseX < 545) && (mouseY < 185 && mouseY > 125)) {
      etat = 0;
    } else if ((mouseX > 405 && mouseX < 545) && (mouseY < 290 && mouseY > 220)) {
      etat = 3;
    }
  }
  if (enPause == true) {
    if ((mouseX > 265 && mouseX < 335) && (mouseY < 215 && mouseY > 150)) {
      exit();
    }
  }
}

/**
 * Détecte que l'utilisateur utilise une touche afin de donner une direction et une vitesse à la raquette
 *
 * @param ax Racket r : raquette 1
 * Rajoute ou enlève une valeur à x ou y de chaque raquette selon la touche pressée
 */

void keyPressed() {
  if (etat == 0) {
    if (keyCode == 32) {
      if (enPause == false) {
        noLoop();
        enPause = true;
        copy(menubouton, 45, 18, 150, 170, 265, 150, 70, 65);
      } else {
        loop();
        enPause = false;
      }
    }
  }

  switch (key)
  {
  case 'z' :
    racket.mvtY = -RACKET_SPEED;
    break;
  case 's' :
    racket.mvtY = RACKET_SPEED;
    break;
  case 'p' :
    racket2.mvtY = -RACKET_SPEED;
    break;
  case 'm' :
    racket2.mvtY = RACKET_SPEED;
    break;
  default :
    println("erreur");
    break;
  }
}

/*
  Fonction qui detecte si une touche donnée est relachée
 */
void keyReleased() {
  switch (key)
  {
  case 'z' :
  case 's' :
    racket.mvtY = 0;
    break;
  case 'p' :
  case 'm' :
    racket2.mvtY = 0;
    break;
  default :
    println("erreur");
    break;
  }
}

/*
  Fonction qui detecte si une balle est passé derrière une des raquettes qui permet d'ajouter 1 point au joueur qui en bénéficie
 */
int checkPoint() {
  int res = 0;
  if (ball.x < BALL_WIDTH + 10) {
    res = 1;
  } else if (ball2.x < BALL_WIDTH +10) {
    res = 3;
  } else if (ball3.x < BALL_WIDTH +10) {
    res = 4;
  } else if (ball4.x < BALL_WIDTH +10) {
    res = 5;
  } else if (ball.x > width - BALL_WIDTH - 10) {
    res = 2;
  } else if (ball2.x > width - BALL_WIDTH - 10) {
    res = 6;
  } else if (ball3.x > width - BALL_WIDTH - 10) {
    res = 7;
  } else if (ball4.x > width - BALL_WIDTH - 10) {
    res = 8;
  }
  return res;
}

void showJeu1Balle() {
  clear();
  image(img, 0, 0, 600, 400);
  showBall(ball); 
  moveBall(ball);
  showRacket(racket);
  showRacket(racket2);
  moveRacket(racket);
  moveRacket(racket2);
  if (checkPoint() == 2) {
    scoreJ1 += 1;
    ball.x = width/2;
    ball.y = height/2;
  } else if (checkPoint() == 1) {
    scoreJ2 += 1;
    ball.x = width/2;
    ball.y = height/2;
  } 
  showObstacle(obstacle);
  showObstacle(obstacle2);
  showObstacle(obstacle3);
  textFont(fontscore, 50);
  fill(BLEU);
  text(scoreJ1, 220, 70);
  fill(BLANC);
  text(tiret, 293, 70);
  fill(ROUGE);
  text(scoreJ2, 345, 70);
  mousePressed();
}

void showJeu4balle() {
  clear();
  image(img, 0, 0, 600, 400);
  showBall(ball);
  moveBall(ball);
  showBall(ball2);
  moveBall(ball2);
  showBall(ball3);
  moveBall(ball3);
  showBall(ball4);
  moveBall(ball4);
  showRacket(racket);
  showRacket(racket2);
  moveRacket(racket);
  moveRacket(racket2);
  if (checkPoint() == 2) {
    scoreJ1 += 1;
    ball.x = width/2;
    ball.y = int(random(125, 275));
  } else if (checkPoint() == 6) {
    scoreJ1 += 1;
    ball2.x = width/2;
    ball2.y = int(random(125, 275));
  } else if (checkPoint() == 7) {
    scoreJ1 += 1;
    ball3.x = width/2;
    ball3.y = int(random(125, 275));
  } else if (checkPoint() == 8) {
    scoreJ1 += 1;
    ball4.x = width/2;
    ball4.y = int(random(125, 275));
  } else if (checkPoint() == 1) {
    scoreJ2 += 1;
    ball.x = width/2;
    ball.y = int(random(125, 275));
  } else if (checkPoint() == 3) {
    scoreJ2 += 1;
    ball2.x = width/2;
    ball2.y = int(random(125, 275));
  } else if (checkPoint() == 4) {
    scoreJ2 += 1;
    ball3.x = width/2;
    ball3.y = int(random(125, 275));
  } else if (checkPoint() == 5) {
    scoreJ2 += 1;
    ball4.x = width/2;
    ball4.y = int(random(125, 275));
  }
  showObstacle(obstacle);
  showObstacle(obstacle2);
  showObstacle(obstacle3);
  textFont(fontscore, 50);
  fill(BLEU);
  text(scoreJ1, 220, 70);
  fill(BLANC);
  text(tiret, 293, 70);
  fill(ROUGE);
  text(scoreJ2, 345, 70);
}
