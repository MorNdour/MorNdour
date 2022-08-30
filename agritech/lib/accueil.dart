import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}


class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    int _currentIndex = 0;
    final PageController controller = PageController();
    List images=[
      {'maladie_atteinte':'healty','temperature':'30 C','humidite':'45 %','image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDuE2ejpy-CjPVNdAhuIVch-8DRr20pvVwxs2pBWtl&s'},
      {'maladie_atteinte':'virus_zemoi','temperature':'37 C','humidite':'48%','image':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfRQHBPjb91iTc0PNfJ25PfgjWkJo0uVdlRwoJpd2d&s'},
      {'maladie_atteinte':'healty','temperature':'24 C','humidite':'35 %','image':'https://cdn.futura-sciences.com/buildsv6/images/wide1920/6/5/2/652a7adb1b_98148_01-intro-773.jpg'},
      {'maladie_atteinte':'late_blight','temperature':'45 C','humidite':'60 %','image':'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'},
      {'maladie_atteinte':'healty','temperature':'28 C','humidite':'39 %','image':'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png'},
    ];
    List<String> _date =['2022-04-23','2022-04-24','2022-04-25','2022-05-05','2022-05-07'];
    String _dateVal ;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.arrow_back),
                ),
        title: const Text('AGRITECH'),
        backgroundColor: Colors.green[500],
      ),
      // body is the majority of the screen.
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30.0),
            child: Container(
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2.0),
              borderRadius: BorderRadius.circular(10.0)
              ),
              child: DropdownButton(
                      hint: Text("select date",style: TextStyle(color: Colors.grey, fontSize: 22.0),),
                      dropdownColor: Color.fromARGB(255, 151, 225, 153),
                      elevation: 5,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      //value: _dateVal,
                      style: TextStyle(color: Colors.black, fontSize: 22.0),
                      onChanged: (value){
                        setState(() {
                          //_dateVal : value;
                        });
                      },
                      items: _date.map((value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value,)
                          );
                      }).toList(),
                    ),
            ),
          ),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: PageView.builder(
                controller : controller,
                onPageChanged: (index){
                  setState(() {
                  _currentIndex = index % images.length;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child:SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                      images[index % images.length]['image'],
                      fit: BoxFit.cover,
                  ),
                ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
        ),
          Card(
            elevation: 16,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.green,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                              Text("$_currentIndex",
                                style: TextStyle(color: Colors.white, fontSize: 22.0),
                              ),
                              Text(images[_currentIndex]['maladie_atteinte'],
                                style: TextStyle(color: Colors.white, fontSize: 22.0),
                              ),
                          ],  
                      ), 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                            Text("Tempearture",
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ),
                            Text(images[_currentIndex]['temperature'],
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ),
                        ],  
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                            Text("humidite",
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ),
                            Text(images[_currentIndex]['humidite'],
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ),
                        ],  
                      ),
                    ],
                  ),
                  ),
            ],),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     for( var i = 0; i < images.length; i++) buildIndicator(currentIndex == i)
          // ],
          // ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){
                      controller.jumpToPage(_currentIndex - 1);
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 20.0,
                ),
                IconButton(
                  onPressed: (){
                    controller.jumpToPage(_currentIndex + 1);
                  },
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 20.0,
                ),
              ],
            ),
          ),
        ],
      )
      );
  }
  // Widget buildIndicator(bool isSelected){
  //   return Container(
  //     height: isSelected ? 12 :8 ,
  //     width: isSelected ? 12 : 8,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       color: isSelected ? Colors.black : Colors.grey,
  //     ),
  //   );
  // }
}