import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_times/models/world_time_model.dart';
import 'package:world_times/services/services.dart';

import 'package:world_times/view/second/second.dart';

abstract class SecondViewModel extends State<Second>{
  String? time;
  SecondViewModel({required this.time, this.selectedtime});

  WorldTime? selectedtime ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelectedTime();
  }

  void getSelectedTime() async {
    selectedtime = await context.read<WorldTimeServices>().selectedTime(time!);
    setState((){

    });
  }
}