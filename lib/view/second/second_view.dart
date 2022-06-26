library second_screen;

import 'package:flutter/material.dart';
import 'package:world_times/constants/colors.dart';
import 'package:world_times/constants/text_styles.dart';
import 'package:world_times/models/world_time_model.dart';
import 'package:intl/intl.dart';


import '../../view_model/second_view_model.dart';

part 'components/second_view_header.dart';
part 'components/second_view_body.dart';
class SecondView extends SecondViewModel {
  SecondView({required super.time});


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SecondViewHeader(theme: Theme.of(context).textTheme.bodyText2?.color ),
            selectedtime == null
                ? Center(child:CircularProgressIndicator(color: Theme.of(context).textTheme.bodyText2!.color,) ,)
            :SecondViewBody(worldTime: selectedtime,),
          ],
        ),
      );
    }
  }
