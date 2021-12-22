import 'package:cyb/model/models.dart';
import 'package:cyb/provider/homePagePro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var homePro=Provider.of<HomePagePro>(context);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:homePro.current ,
          onTap: (val) {
            homePro.onTap(val);

          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Text("newest"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text("Category"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text("Trending"),
              label: "",
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          homePro.fetchTipsDetails();
        },
      ),
      appBar: AppBar(
        title: Text("Health Tips"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: homePro.fetchTipsDetails(),
          builder: (context,snap){
            if(!snap.hasData){
              return  Center(
                  child:
                  CircularProgressIndicator());
            }
            else{

              final data=  snap.data as List<HealthTipsData> ;

              //final dat=data.where((element) => element.itemName=="newest").toList()
              return  ListView(
                children:data.where((element) => element.itemName==homePro.cat).map((e) =>
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  children: e.tips!.map((e) =>   Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          height: 200,
                          width: size.width,
                          decoration: BoxDecoration(

                            // image: DecorationImage(
                            //     image: NetworkImage(data.banner![0].image.toString()),
                            //     fit: BoxFit.fill
                            // ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                child: Row(
                                  children: [
                                    Expanded(child: Text(e.title.toString())),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.share)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(e.image.toString()),
                                      fit: BoxFit.fill
                                  ),

                                ),

                              )),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                child: Text(e.title.toString()),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                child: Text(e.description.toString(),maxLines: 2,),
                              ),

                              // Padding(
                              //   padding: EdgeInsets.only(left: 5, right: 10, top: 5),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),).toList(),


                  // [
                  //   Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       SizedBox(
                  //         height: 5,
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(left: 20, right: 20),
                  //         child: Container(
                  //           height: 200,
                  //           width: size.width,
                  //           decoration: BoxDecoration(
                  //
                  //             // image: DecorationImage(
                  //             //     image: NetworkImage(data.banner![0].image.toString()),
                  //             //     fit: BoxFit.fill
                  //             // ),
                  //               color: Colors.white,
                  //               borderRadius: BorderRadius.circular(10),
                  //               boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  //                 child: Row(
                  //                   children: [
                  //                     Expanded(child: Text("print('');")),
                  //                     Row(
                  //                       children: [
                  //                         Icon(
                  //                           Icons.favorite,
                  //                           color: Colors.red,
                  //                         ),
                  //                         SizedBox(
                  //                           width: 5,
                  //                         ),
                  //                         Icon(Icons.share)
                  //                       ],
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //               Expanded(child: Container(
                  //                 decoration: BoxDecoration(
                  //                   // image: DecorationImage(
                  //                   //     image: NetworkImage(),
                  //                   //     fit: BoxFit.fill
                  //                   // ),
                  //
                  //                 ),
                  //
                  //               )),
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  //                 child: Text("SAr"),
                  //               ),
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  //                 child: Text("Sa"),
                  //               ),
                  //
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: 5, right: 10, top: 5),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     Text("data"),
                  //                     Text("Da"),
                  //                     Text("data")
                  //                   ],
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ],
                )


                ).toList()




              );



            }
          }




      )




    );
  }
}
