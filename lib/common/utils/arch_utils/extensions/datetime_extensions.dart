import 'package:intl/intl.dart';

extension ExtractDate on DateTime {
  String extract() => DateFormat("dd-MM-yyyy").format(this);

  int calculateDays(DateTime? date) => difference(date!).inDays;
}
