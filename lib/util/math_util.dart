class MathU {
  static String to2D(double value) {
    return value.toStringAsPrecision(2);
  }

  static double clamp(double value, double min, double max) {
    if (value > max) {
      return max;
    }
    if (value < min) {
      return min;
    }
    return value;
  }

  static int mode(num v) {
    if (v > 0) {
      return 1;
    } else if (v < 0) {
      return -1;
    }
    return 0;
  }

  static num abs(num v) {
    if(v < 0) return -v;
    return v;
  }

  /// v1 / v2
  static int computePercent(String? value1, String? value2) {
    double v1 = double.tryParse("$value1") ?? 0;
    double v2 = double.tryParse("$value2") ?? 9999999999;
    if (v2 == 0) {
      v2 = 1;
      v1 = 0;
      return 0;
    }
    return (v1 / v2 * 100).toInt();
  }
}
