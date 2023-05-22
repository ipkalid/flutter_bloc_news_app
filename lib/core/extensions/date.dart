import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensions on DateTime {
  // ignore: non_constant_identifier_names
  String to_dMMM() {
    final DateFormat formatter = DateFormat('d MMM');
    return formatter.format(this);
  }

  // ignore: non_constant_identifier_names
  String to_dMMMYY() {
    final DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.format(this);
  }

  // ignore: non_constant_identifier_names
  String to_dMMMjm() {
    final DateFormat formatter = DateFormat('d MMM').add_jm();

    return formatter.format(this);
  }

  String format(String format) {
    final DateFormat formatter = DateFormat(format);

    return formatter.format(this);
  }
}

class DatePicker {
  static Future<DateTime?> selectDate(
    BuildContext context, {
    required DateTime firstDate,
  }) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: DateTime(2101),
    );

    return picked;
  }
}
