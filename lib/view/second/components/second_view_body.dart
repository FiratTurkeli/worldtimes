part of second_screen;

class SecondViewBody extends StatefulWidget {
   WorldTime? worldTime;

  SecondViewBody({Key? key, required this.worldTime,}) : super(key: key);

  @override
  State<SecondViewBody> createState() => _SecondViewBodyState();
}

class _SecondViewBodyState extends State<SecondViewBody> {

  String checkNum(int x){
    return x<10?"0${x}":x.toString();
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.only(top: 50),
      height: 450,
      child: Stack(
        children: [
          positionedTimeContainer1(),
          points(),
          positionedTimeContainer2(),
          countryInfo(),
          gmtInfo(),
        ],
      ),
    );
  }



  Widget positionedTimeContainer1(){
    final line = widget.worldTime?.utcDatetime.toString();
    DateTime x = DateTime.parse(line!);
    return Positioned(
        left: 45,
        child: timeContainer(checkNum(x.hour) ?? "xx")
    );
  }


  Widget positionedTimeContainer2(){
    final line = widget.worldTime?.utcDatetime.toString();
    DateTime x = DateTime.parse(line!);
    return Positioned(
        right: 45,
        child: timeContainer(checkNum(x.minute) ?? "xx")
    );
  }


  Widget points(){
    return Center(
        heightFactor: 1.3,
        child: Text(":", style: bigTimeStyle.copyWith(color: Theme.of(context).canvasColor), textAlign: TextAlign.center,));
  }

  Widget timeContainer(String data){
    return  Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(14),
        border: Border.all(color: dark, width: 2)
      ),
      child: Center(child: Text(data , style: bigTimeStyle.copyWith(color: Theme.of(context).canvasColor),),),
    );
  }



  Widget countryInfo(){
    String line =  widget.worldTime!.timezone.toString();
    String country = line.characters.contains("/") == false  ? line : widget.worldTime!.timezone.toString().split("/")[1];
    String kita = line.characters.contains("/") == false  ? line :widget.worldTime!.timezone.toString().split("/")[0];

    return Container(
      margin: EdgeInsets.only(top: 168),
      child: Center(
        child: Column(
          children: [
            Text(country, style: countryStyle,),
            Text( kita, style: continentStyle,)
          ],
        ),
      ),
    );
  }


  Widget gmtInfo(){
    final line = widget.worldTime?.utcDatetime.toString();
    DateTime x = DateTime.parse(line!);
    var names = DateFormat.yMMMMEEEEd('tr').format(x);
    String day = names.toString().split(" ")[3];
    String month = names.toString().split(" ")[1];
    return Container(
      margin: EdgeInsets.only(top: 243),
      child: Center(
        child: Column(
          children: [
            Text("${day}, GMT ${widget.worldTime?.utcOffset.toString()}", style: gmtStyle,),
            Text("${month} ${x.day}, ${x.year}", style: gmtStyle,)
          ],
        ),
      ),
    );
  }
}
