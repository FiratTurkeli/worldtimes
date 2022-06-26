import 'package:flutter/material.dart';
import 'package:world_times/models/world_time_model.dart';
import 'package:world_times/services/services.dart';
import 'package:provider/provider.dart';
import '../view/home/home.dart';

abstract class HomeViewModel extends State<Home> {


   List? times ;


  @override
  void initState()  {
    super.initState();
     getAllTimes();
  }

  void  getAllTimes() async {
    times = await context.read<WorldTimeServices>().allTimes();
    setState(() {

    });
  }
}