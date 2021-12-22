import 'package:cyb/model/models.dart';
import 'package:cyb/provider/homePagePro.dart';
import 'package:cyb/ui/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget card({required String name,void Function()? onTap,}){
      return   GestureDetector(
        onTap:onTap ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Center(
                child: Icon(Icons.ac_unit),
              ),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 10)
                  ]),
            ),
            SizedBox(height: 5,),
            Text(name)
          ],
        ),
      );

    }


    var homePro=Provider.of<HomePagePro>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          homePro.fetchDetails();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Med Feed"),
        centerTitle: true,
      ),
      body:
      FutureBuilder(
          future: homePro.fetchDetails(),
          builder:(context,snap){
            if(!snap.hasData) {
              return Center(
                  child:
                  CircularProgressIndicator());
            }else{
              final data=  snap.data as Data ;
              return  ListView(
                children: [
                  Container(

                    height: 200,
                    width: size.width,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                            image: NetworkImage(data.banner![0].image.toString()),
                            fit: BoxFit.fill
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 10)
                        ]),


                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        card(name: "Med Article"),
                        card(name: "Health Quiz"),
                        card(name: "Health Advice")





                       ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       card(name: "Health Tips",onTap: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => SecondPage()),
                         );

                       }),
                        card(name: "Live Updates"),
                        card(name: "Health Care Viseo"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: DefaultTabController(
                        length: data.articles!.length,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TabBar(
                              isScrollable: true,
                              tabs:data.articles!.map((e) =>

                        Text(e.name.toString(),style: TextStyle(fontSize: 20,color: Colors.black),),

                              ).toList()


                              // [
                               // Text("sar",style: TextStyle(fontSize: 20,color: Colors.black),),
                              //   Text("FAs",style: TextStyle(fontSize: 20,color: Colors.black),)
                              // ],
                            ),
                            Container(
                              height: size.height/2,
                              child: TabBarView(
                                  children:data.articles!.map((e) =>
                                      ListView(
                                        shrinkWrap: true,
                                        children: e.articleList!.map((e) =>
                                        Padding(
                                          padding: EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(e.image.toString()),
                                                      fit: BoxFit.fill
                                                  ),
                                                ),

                                              ),
                                              SizedBox(height: 5,)
                                            ],
                                          ),
                                        )


                                        ).toList()
                                      ),

                                  ).toList()



                                  // [
                                  //   ListView(
                                  //     shrinkWrap: true,
                                  //     children: [
                                  //
                                  //     ],
                                  //   ),
                                  //   ListView(
                                  //     shrinkWrap: true,
                                  //     children: [
                                  //
                                  //     ],
                                  //   )
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  // ]


                              ),
                            )
                          ],
                        )),
                  )


                ],
              );




            }




          } ),



    );
  }
}
