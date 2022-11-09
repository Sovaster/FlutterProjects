import 'package:flutter/material.dart';
import 'package:flutter_application_sql/core/db/data_base_helper.dart';

void main() async {
  await DataBaseHelper.instance.init();
  runApp(Container());
}
