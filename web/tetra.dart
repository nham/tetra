import 'dart:html';
import 'dart:math';

final CanvasRenderingContext2D context =
(query("#canvas") as CanvasElement).context2D;

final InputElement slider = query("#slider");

void main() {
  context.lineWidth = 2;
  var side = 100;

  slider.onChange.listen((e) => draw(side, double.parse(slider.value), 1));
  draw(side, double.parse(slider.value), 1);
}


void draw(num s, num ratio, num sign) {
  // nx/nz = ratio
  context.clearRect(0, 0, 500, 500);
  print('ratio:');
  print(ratio);
  
  var z = sqrt(pow(s, 2) * 3/4 / (pow(ratio, 2) + 1));
  var x = -1 * ratio * z;
  
  print('==============');
  print('x:');
  print(x);
  print('z: ');
  print(z);
  context..beginPath()
         ..moveTo(10, 200)
         ..lineTo(10 + s, 200)
//         ..lineTo(10 + (s/2).round(), 200 -(sqrt(3)*(s/2)).round() )
         ..lineTo(10 + (s/2).round(), 200 -z.round() )
         ..closePath()
         ..stroke();
}
