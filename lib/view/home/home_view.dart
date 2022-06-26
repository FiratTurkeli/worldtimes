library home_screen;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:world_times/constants/text_styles.dart';
import '../../constants/colors.dart';
import '../../database/theme_provider.dart';
import '../../view_model/home_view_model.dart';
import '../second/second.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


part 'components/home_vew_header.dart';
part 'components/home_view_body.dart';


class HomeView extends HomeViewModel {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider,child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).cardColor
            ),
          ),
          body: Column(
            children: [
               const HomeViewHeader(),
              times == null
                  ? const Center(child:CircularProgressIndicator(color: dark,) ,)
                  :   Flexible(
                   child: ListView.builder(
                    controller: ScrollController(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: times?.length,
                    itemBuilder: (context, index) {
                    return HomeViewBody(timeZone: times?[index],);

                  }
                ),
              )
            ]
          ),
        );
      }
    );
  }
}
