part of second_screen;

class SecondViewHeader extends StatefulWidget{

  Color? theme;
  SecondViewHeader({Key? key,required this.theme}) : super(key: key);

  @override
  State<SecondViewHeader> createState() => _SecondViewHeaderState();


}

class _SecondViewHeaderState extends State<SecondViewHeader> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 111,
      width: double.infinity,
      child: Container(
        width: 111,
        decoration:  BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(32)
          )
        ),
        child: Stack(
          children: [
            backButton(),
            title()
          ],
        ),
      ),
    );
  }

  Widget backButton(){
    return Positioned(
      top: 55,
      left: 38,
      right: 330,
      child: IconButton(onPressed:(){
        Navigator.pop(context);
      },
        icon:  Icon(Icons.arrow_back, color: Theme.of(context).textTheme.bodyText2!.color, size: 25,),),
    );
  }
  Widget title(){
    String color = widget.theme == dark ? "dark" : "white" ;
    return Positioned(
        top: 71,
        bottom: 24,
        right: 113,
        left: 113,
        child: Image.asset("images/WORLDTIME${color.toString()}.png", width: 149,height: 16,) );
  }
}
