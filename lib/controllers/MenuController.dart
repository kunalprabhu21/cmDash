import 'package:admin_panel_responsive_flutter/models/Menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

MenuController menuController(context, {bool listen: true}) =>
    Provider.of<MenuController>(context, listen: listen);

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  double menuWidth = 0;
  bool _isLoading = true;
  List<MenuModel> _menuList = [];
  int _currentIndex = 0;

  bool get isLoading => _isLoading;
  int get currentPage => _currentIndex;
  List<MenuModel> get menuList => _menuList;

  set isLoading(bool value) {
    _isLoading = value;
    // notifyListeners();
  }

  set currentPage(int value) {
    _currentIndex = value;
    notifyListeners();
  }


  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }


  fetchMenu(){

    final data = [
      {
        'id':"1",
        'name':"Home",
      },
      {
        'id':"2",
        'name':"Calender",
      }
    ];
    final userData = data as List;
    userData.forEach((element) {
      menuList.add(MenuModel.fromJson(element));
    });


  }

  toggleMenu(){
    if(menuWidth == 250){
      menuWidth = 0;
    }else{
      menuWidth = 250;
    }
    notifyListeners();
  }
}
