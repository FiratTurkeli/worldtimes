part of home_screen;

class HomeViewBody extends StatefulWidget {
  String? timeZone;
  HomeViewBody({Key? key, required this.timeZone,}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Second(
            time: widget.timeZone.toString(),

        )));
      },
      child: SizedBox(
          child: Stack(
            alignment: Alignment.centerRight,
              children: [
                listContainer(),
                goButton()
          ]))
    );
  }

  Widget listContainer(){
    return Container(
      margin: const EdgeInsets.only(right: 33, top: 10, left: 33),
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).cardColor
      ),
      child: Container(
          margin: const EdgeInsets.only(left: 20, top: 18),
          child: Text(widget.timeZone.toString() , style: listStyle)),

    );
  }

  Widget goButton(){
    return Positioned(
      bottom: 11,
      right: 15,
      child: Container(
        width: 31,
        height: 31,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3)
        ),
          child: Icon(Icons.arrow_forward_ios, color:Theme.of(context).textTheme.bodyText2!.color , size: 10,),
      ),
    );
  }
}
