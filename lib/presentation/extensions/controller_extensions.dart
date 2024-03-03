import 'package:flutter/cupertino.dart';

extension ScrollControllerExtension on ScrollController {
  bool isAtTop() => (position.atEdge && position.pixels == 0);

  bool isAtBottom() => (position.atEdge && position.pixels != 0);
}
