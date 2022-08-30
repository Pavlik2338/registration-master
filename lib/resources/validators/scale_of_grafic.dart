int scaleTitle = 10;

class Scale {
  int chooseScale(double value) {
    double scale = 10000;
    if (value > 10000) {
      scale = value * 10;
      scaleTitle = scale~/10000;
    } else if (value > 100000) {
      scale = value * 20;
      scaleTitle = scale~/10000;
    }
    return scale.toInt();
  }
}
