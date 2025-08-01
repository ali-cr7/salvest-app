import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/log_in_response/log_in_response.dart';
import 'package:salvest_app/utility/cash_helper.dart';

//import 'package:teacher_and_children/features/Manager/data/models/login_models/login_response.dart';

Future<void> setCache(LogInResponse response) async {
  token = response.token;
  email = response.data!.email;
  name = response.data!.name;
  phone = response.data!.phone;
  joinDate = response.data!.createdAt;
  await Future.wait([
    CacheHelper.setData(key: 'token', value: response.token),
    CacheHelper.setData(key: 'email', value: response.data!.email),
    CacheHelper.setData(key: 'name', value: response.data!.name),
    CacheHelper.setData(key: 'phone', value: response.data!.phone),
     CacheHelper.setData(key: 'autoInvestToggle', value: true),
    CacheHelper.setData(key: 'joinDate', value: response.data!.createdAt),
  ]);
}

Future<void> getCache() async {
  token = await CacheHelper.getData(key: 'token') ?? '';
  email = await CacheHelper.getData(key: 'email') ?? '';
  name = await CacheHelper.getData(key: 'name') ?? '';
  phone = await CacheHelper.getData(key: 'phone') ?? '';
  joinDate = await CacheHelper.getData(key: 'joinDate') ?? '';
}

Future<void> removeCache() async {
  print("logout is executed");

  await CacheHelper.removeData(key: 'token');
  await CacheHelper.removeData(key: 'name');
  await CacheHelper.removeData(key: 'email');
  await CacheHelper.removeData(key: 'phone');
  await CacheHelper.removeData(key: 'joinDate');

  // Clear memory
  token = null; // Make sure it's declared as String? token;
  name = '';
  email = '';
  phone = '';
  joinDate = '';
}