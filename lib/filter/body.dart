import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  RangeValues values = RangeValues(0, 100);
  List<String> otherSkillList = ['Cat1','Cat1','Cat1gdgd','Cat1hdhd','Cat1','Cat1','Cat1','Cat1','Cat1gdgd','Cat1hdhd','Cat1','Cat1'];
  List<String> othersubSkillList = ['Cat1','Cat1','Cat1','Cat1','Cat1','Cat1','Cat1','Cat1','Cat1gdgd','Cat1hdhd','Cat1','Cat1'];
  List<String> otherdiscountList = ['10%','20%','30%','10%','20%','30%','10%','20%','30%','10%','20%','30%'];

  bool t1 = false;
  bool t2 = false;
  bool t3 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
        child:
        Column(
          children: [
            SizedBox(height:20),
            Text('Price range',style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 5,),
            RangeSlider(
                activeColor: Colors.red[700],
                inactiveColor: Colors.red[300],
                max: 100,
                divisions: 5,
                labels: RangeLabels(
                  values.start.round().toString(),
                  values.end.round().toString(),
                ),
                values: values,
                onChanged: (values){
                  setState(() {
                    values =values;
                  });
                }
            ),
           SizedBox(height: 10,),
            Text('Category',style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 5,),
            Wrap(
                spacing: 9.0,
                runSpacing: 9.0,
                children: List<Widget>.generate(otherSkillList.length, (int index) {
                  return ChoiceChip(
                    label: Text(otherSkillList[index],style: TextStyle(color: Colors.black)),
                    selected: t1,
                    selectedColor: Colors.red,
                    disabledColor: Colors.grey,
                    onSelected: (value) {
                      setState(() {
                        t1 =value;
                      });

                    },

                  );
                })
            ),
            SizedBox(height: 10,),

            Text('Sub Category',style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 5,),
            Wrap(
                spacing: 9.0,
                runSpacing: 9.0,
                children: List<Widget>.generate(othersubSkillList.length, (int index) {
                  return ChoiceChip(
                    label: Text(othersubSkillList[index],style: TextStyle(color: Colors.black)),
                    selected: t2,
                    selectedColor: Colors.red,
                    onSelected: (value) {
                      setState(() {
                        t2 =value;
                      });                    },
                  );
                })
            ),
            SizedBox(height: 10,),
            Text('Discount',style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 5,),
            Wrap(
                spacing: 9.0,
                runSpacing: 9.0,
                children: List<Widget>.generate(otherdiscountList.length, (int index) {
                  return ChoiceChip(
                    label: Text(otherdiscountList[index],style: TextStyle(color: Colors.black),),
                    selected: t3,
                    selectedColor: Colors.red,
                    onSelected: (value) {
                      setState(() {
                        t3 =value;
                      });
                    },
                  );
                })
            ),
            SizedBox(height: 30,),

          ],
        )),

    );
  }
}
