// class MyWithdrawlsRequestsReponse {




// }

// import 'dart:convert';

// import 'datum.dart';

import 'dart:convert';

import 'package:salvest_app/data/models/my_withdrawls_requests/my_withdrawls_requests.dart';

class MyWithdrawlsRequestsReponse {

  List<MyWithdrawlsRequests>? data;

  MyWithdrawlsRequestsReponse({ this.data});

  factory MyWithdrawlsRequestsReponse.from(Map<String, dynamic> data) {
    return MyWithdrawlsRequestsReponse(

      data:
          (data['data'] as List<dynamic>?)
              ?.map(
                (e) =>
                    MyWithdrawlsRequests.from(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
    );
  }

  Map<String, dynamic>
  toMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z() {
    return {

      'data':
          data
              ?.map(
                (e) =>
                    e.to(),
              )
              .toList(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyWithdrawlsRequests].
  // factory MyWithdrawlsRequests.fromJson(String data) {
  //   return MyWithdrawlsRequests.from(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [FaqRespone] to a JSON string.
  String toJson() => json.encode(
    toMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z(),
  );
}
