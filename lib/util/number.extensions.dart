extension NumberParsing on int {
  String toOrdinalString() {
    if ((this < 0)) {
      throw Exception('Invalid number: Number must be a positive number');
    }
    if (this == 0) {
      return '0';
    }

    String stringValue = toString();

    switch (stringValue[stringValue.length - 1]) {
      case '1':
        if (stringValue.length > 1 && stringValue[stringValue.length - 2] == '1') {
          return '${stringValue}th';
        } else {
          return '${stringValue}st';
        }
      case '2':
        if (stringValue.length > 1 && stringValue[stringValue.length - 2] == '1') {
          return '${stringValue}th';
        } else {
          return '${stringValue}nd';
        }
      case '3':
        if (stringValue.length > 1 && stringValue[stringValue.length - 2] == '1') {
          return '${stringValue}th';
        } else {
          return '${stringValue}rd';
        }
      default:
        return '${stringValue}th';
    }
  }
}

extension PriceFormat on double {
  String get asPrice => '\$${toStringAsFixed(2)}';
}
