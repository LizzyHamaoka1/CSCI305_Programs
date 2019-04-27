import 'dart:html';
import 'dart:async';

bool t = true;
CanvasElement canvas;
CanvasRenderingContext2D ctx;

Ball ball;

class Ball {
  double x;
  double y;
  var r = 15;
  double vx;
  double vy;
  Ball(startX, startY) {
    x = startX;
    y = startY;
    vx = 0;
    vy = 0;
  }
}

void drawBall(ball) {
  ctx.save();
  clear();

  ctx.fillStyle = "white";
  ctx.beginPath();
  ctx.arc(ball.x, ball.y, ball.r, 0, 3.14 * 2);
  ctx.closePath();
  ctx.fill();
  ctx.restore();
}

void drawMove(MouseEvent event) {
  //ball = Ball(event.offset.x, event.offset.y,);
  ball.x = event.offset.x;
  ball.y = event.offset.y;
  drawBall(ball);
  move(ball);
}

void clear() {
  ctx.save();
  ctx..fillStyle = "teal";
  ctx..fillRect(0, 0, canvas.width, canvas.height);
  ctx.restore();
}

void move(ball) {
// 1 - apply velocity to position (vx -> x)
  ball.x += ball.vx;
  ball.y += ball.vy;

// 2 - apply drag/friction to velocity
  ball.vx *= .99;
  ball.vy *= .99;
// 3 - apply gravity to velocity
  ball.vy += .25;
  ball.vx += .25;
// 4 - check for collisions
  if (ball.y + ball.r > canvas.height) {
    ball.y = canvas.height - ball.r;
    ball.vy = -ball.vy.abs();
  }
  if (ball.y - ball.r < 0) {
    ball.y = ball.r;
    ball.vy = -ball.vy.abs() + 1;
  }
  if (ball.x + ball.r > canvas.width) {
    ball.x = canvas.width - ball.r;
    ball.vx = -ball.vx.abs();
  }

  if (ball.x - ball.r < 0) {
    ball.x = ball.r;
    ball.vx = ball.vx.abs() + 1;
    t = true;
  }
  drawBall(ball);
}

void main() {
  const one = Duration(milliseconds: 16);
  new Timer.periodic(one, (Timer t) => move(ball));
  ball = new Ball(0, 0);
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');
  clear();
  querySelector('canvas').onClick.listen(drawMove);
}
