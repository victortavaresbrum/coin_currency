enum ExchangesStatus {
  low,
  medium,
  high;

  const ExchangesStatus();

  static ExchangesStatus fromValue(double value) {
    if (value < 1) {
      return low;
    }
    if (value >= 1 && value < 5) {
      return medium;
    }

    return high;
  }
}
