import 'package:flutter/material.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/app_colors.dart';


import '../../../utility/enums.dart';


class DialogsWidgetsSnackBar {

  static void showScaffoldSnackBar({
    required String title,
    required BuildContext context,
    Color color = AppColors.redColor,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: k5RadiusLowerPadding,
          // ),
          dismissDirection: DismissDirection.none,
          content: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Color(0xffF0F0F0)),
          ),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 70),
          backgroundColor: color,
          duration: const Duration(milliseconds: 1500),
        ))
        .closed
        .then((value) {
      //return ScaffoldMessenger.of(context).clearSnackBars();
    });
  }

  static void showSnackBarFromStatus({
    required BuildContext context,
    required HelperResponse helperResponse,
    bool showServerError = false,
    bool popOnSuccess = true,
    int popOnSuccessCount = 1,
  }) {
    if (helperResponse.servicesResponse == ServicesResponseStatues.success) {
      if(popOnSuccess){
        for(int i=0;i<popOnSuccessCount;i++){
          Navigator.of(context).pop();
        }
      }
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
          color: AppColors.green15,
          context: context
      );

    }
    if(showServerError){
      if (helperResponse.servicesResponse == ServicesResponseStatues.networkError){
        return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
          context: context,
        );
      }
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
          title: helperResponse.response,
          color: AppColors.redColor,
          context: context
      );
    }
    if (helperResponse.servicesResponse == ServicesResponseStatues.networkError){
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
        title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
        context: context,
      );
    }
    else {
      return DialogsWidgetsSnackBar.showScaffoldSnackBar(
        title: "${serviceValues.reverse[helperResponse.servicesResponse]}" ,
        context: context,
      );
    }

  }


}
