

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{
 final _storage= GetStorage();
 final RxBool _isFirstTime = true.obs;
 final RxBool _isloggedIn =false.obs;

 bool get isFirstTime => _isFirstTime.value;
 bool get isloggedIn => _isloggedIn.value;
  @override
  void onInit() {
    super.onInit();
    _loadInitialState();
  }

void _loadInitialState(){
    _isFirstTime(_storage.read('isFirstTime') ?? true);
    _isloggedIn(_storage.read('isloggedIn') ?? false);
}

void setFirstTime(){
  _isFirstTime.value  =  false;
  _storage.write('isFirstTime', false);
}

void setloggedIn(){
  _isloggedIn.value  =  true;
  _storage.write('isloggedIn', true);
}
void setloggedout(){
  _isloggedIn.value  =  false;
  _storage.write('isloggedIn', false);
}

}