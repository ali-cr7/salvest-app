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
    CacheHelper.setData(key: 'joinDate', value:response.data!.createdAt),
  ]);
}

Future<void> getCache() async {
  token = await CacheHelper.getData(key: 'token') ?? '';
  email = await CacheHelper.getData(key: 'email') ?? '';
  name = await CacheHelper.getData(key: 'name') ?? '';
  phone = await CacheHelper.getData(key: 'phone') ?? '';
  joinDate = await CacheHelper.getData(key: 'joinDate') ?? '';

  // isAdmin = await CacheHelper.getData(key: 'isAdmin') ?? false;
}

Future<void> removeCache() async {
  await CacheHelper.setData(key: 'firstTime', value: false);
  await CacheHelper.removeData(key: 'token');
  await CacheHelper.removeData(key: 'userId');
  await CacheHelper.removeData(key: 'userImage');
  await CacheHelper.removeData(key: 'kgID');
}
