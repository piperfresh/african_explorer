import 'package:intl/intl.dart';

String formatNumber(String amount) {
  double amountToDouble;
  try {
    amountToDouble = double.parse(amount);
  } catch (e) {
    return amount;
  }
  final formatter = NumberFormat('#,##0');
  return formatter.format(amountToDouble);
}
