part of home_screen;

class HomeViewHeader extends StatefulWidget {
  const HomeViewHeader({Key? key}) : super(key: key);

  @override
  State<HomeViewHeader> createState() => _HomeViewHeaderState();
}

class _HomeViewHeaderState extends State<HomeViewHeader> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    return SizedBox(
      height: 221,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(32)
                )
              ),
              height: 199,
              child: Stack(
                 children: [
                  goodMorningMessage(),
                  localTime(),
                   currentDate(),
                   themeChangerButton(),
                ],
              ),
            ),
          searchBar()

        ],
      ),
    );
  }


  Widget goodMorningMessage() {
    return Positioned(
        left: 33,
        top: 69,
        bottom: 112,
        child: Text("Günaydın, Özgür", style: gmStyle,)
    );
  }

  Widget localTime() {
    var date = DateTime.now();
    var currentHour= DateFormat('hh : mm ').format(date);
    return Positioned(
        top: 92,
        bottom: 68,
        left: 33,
        child: Text(currentHour.toString(), style: timeStyle,
        )
    );
  }

  Widget currentDate() {
    var date = DateTime.now();
    var currentDate = DateFormat.yMMMMEEEEd('tr').format(date);
    String day = currentDate.toString().split(" ")[0];
    String month = currentDate.toString().split(" ")[1];
    String year = currentDate.toString().split(" ")[3];

    return Positioned(
        top: 136,
        bottom: 45,
        left: 33,
        child: Text("$day $month, $year", style: dateStyle
        )
    );
  }

  Widget searchBar() {
    return Positioned(
      top: 177,
      right: 33,
      left: 33,
      child: Padding(
        padding: const  EdgeInsets.only(bottom: 10),
        child: Container(
          width: double.infinity,
          height: 44,
          decoration: BoxDecoration(
            color: white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(99),
            border: Border.all(color: strokeblue, width: 1)
          ),
          child: searchIcon()
        ),
      ),
    );
  }

  Widget searchIcon(){
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(Icons.search, color: Colors.grey,),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Text("Arama", style: TextStyle(color: Colors.grey),),
        ),
      ],
    );
  }
  Widget themeChangerButton(){
    return Positioned(
      right:33,
      top: 63,
      bottom: 96,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        key: Key(Theme.of(context).brightness.toString()),
        child: Consumer<ThemeProvider>(
          builder: (context, provider,child) {
            return GestureDetector(
              onTap: () {
                provider.changeTheme(Theme.of(context).scaffoldBackgroundColor == dark ? "light" : "dark");
                print("changed");
                setState((){

                });

              },
              child: Container(
                  key: Key(Theme.of(context).brightness.toString()),
                  width: 41,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).textTheme.bodyText2?.color,
                      border: Border.all(color: strokeblue, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Theme.of(context).scaffoldBackgroundColor == dark ?
                  Icon(Icons.wb_sunny_outlined, color: Theme.of(context).cardColor,)
                  :Icon(Icons.nightlight_outlined, color: Theme.of(context).cardColor,)
              )

            );
          }
        ),
      ),
    );
  }
}













