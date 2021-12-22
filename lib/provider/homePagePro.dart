import 'package:cyb/model/models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class HomePagePro extends ChangeNotifier{


  Article? _article;
  Article? get article => _article;


  HealthTips? _healthTips;
  HealthTips? get healthTips => _healthTips; // Response? response;


  Dio dio=Dio();


  int _current=0;
  int get current => _current;

  String? _cat="newest";
  String? get cat => _cat;

  void onTap(int val){
    switch(val){
      case 0:{
        _current=0;
        _cat="newest";
        notifyListeners();
      }
      break;
      case 1:{
        _current=1;
        _cat="category";
        notifyListeners();

      }
      break;
      case 1:{
        _current=2;
        _cat="trending";
        notifyListeners();



      }


    }





  }




  Future<Data?> fetchDetails() async {
    String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMjVlZjVmZTVmNWMzOTYxNDI4NDIzYyIsImlhdCI6MTY0MDE3MDg2NSwiZXhwIjoxNjQyNzYyODY1fQ.o5-VC_lbWeFQxC5ffdazWEqf6GAB4VNcfdVMhVraYlg";
    try {
      Response response = await dio.get(
        'http://143.110.240.107:8000/user/get_medfeed_home',

        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      _article = Article.fromJson(response.data);


      print(response.data);
      //print(_article!.data);

      return _article!.data;
    } on DioError catch (e) {

      print(e);
    }
  }



  Future<List<HealthTipsData>?> fetchTipsDetails() async {
    String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMjVlZjVmZTVmNWMzOTYxNDI4NDIzYyIsImlhdCI6MTY0MDE3MDg2NSwiZXhwIjoxNjQyNzYyODY1fQ.o5-VC_lbWeFQxC5ffdazWEqf6GAB4VNcfdVMhVraYlg";
    try {
     Response response = await dio.post(
        'http://143.110.240.107:8000/user/get_health_tips',

        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      _healthTips = HealthTips.fromJson(response.data);

      print(response.data);
      //print(_article!.data);

      return _healthTips!.data;
    } on DioError catch (e) {

      print(e);
    }
  }








}