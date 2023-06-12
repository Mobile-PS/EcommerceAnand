import 'package:flutter/material.dart';


class AcceptBottomNavigation extends StatelessWidget {
  final VoidCallback onApply;

  const AcceptBottomNavigation({Key? key, required this.onApply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Padding(padding: EdgeInsets.all(15),
        child:Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: 30,
              height: 49,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), primary: Colors.white, elevation: 5),
                onPressed: () {
                },
                child: Text(
                  'Discard',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: SizedBox(
              width: 30,
              height: 49,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(), primary: Colors.red, elevation: 5),
                onPressed: () {
                },
                child: Text(
                  'Apply',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
