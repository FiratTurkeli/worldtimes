import 'package:flutter/material.dart';

import 'second_view.dart';

class Second extends StatefulWidget {
  String time;
  Second({required this.time});
  @override
  State<Second> createState() => SecondView( time: time);
}