import 'package:salvest_app/constants.dart';
import 'package:salvest_app/data/models/electronic%20property%20certificate/electronic.property.certificate.dart';
import 'package:salvest_app/data/models/get_Investments_ByMonthAndYear/investments.by.month.dart';
import 'package:salvest_app/data/models/investment/investment.mode.dart';
import 'package:salvest_app/data/models/lines%20chart/lines.chart.dart';
import 'package:salvest_app/data/models/showLargestReward/show.largest.reward.dart';
import 'package:salvest_app/data/services/statistics%20srevices/statistics%20_repo.dart';
import 'package:salvest_app/utility/api_config/api_config.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';
import 'package:salvest_app/utility/enums.dart';

class StatisticsRepoImpl implements StatisticsRepo {
  final ApiService _apiService;

  StatisticsRepoImpl(this._apiService);
  @override
  Future<InvestmentModeResponse> fetchInvestmentModes(String mode) async {
    final helper = await _apiService.post(
      endpoint: APIConfig.getPropertiesByInvestmentMode,
      token: token,
      data: {
        'investment_mode': mode, // هنا نستخدم قيمة mode الممررة
      },
    );

    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return InvestmentModeResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load investment modes');
    }
  }

  @override
  Future<InvestmentsByMonthResponse> fetchByMonth(int year, int month) async {
    final helper = await _apiService.post(
      endpoint: APIConfig.getInvestmentsByMonthAndYear,
      token: token,
      data: {'year': year, 'month': month},
    );
    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return InvestmentsByMonthResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load investments by month');
    }
  }

  @override
  Future<LargestRewardResponse> fetchLargestReward() async {
    final helper = await _apiService.get(
      endpoint: APIConfig.shoLargestReward,
      token: token,
    );
    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return LargestRewardResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load largest reward');
    }
  }

  @override
  Future<LinesChartResponse> fetchLinesChart({required int year}) async {
    final helper = await _apiService.post(
      endpoint: APIConfig.getProfitAndInvestmentPercentages,
      token: token,
      data: {'year': year},
    );
    print(' the statistics response ${helper.fullBody}');
    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return LinesChartResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load lines chart data');
    }
  }

  Future<ElectronicResponse> fetchCertificates() async {
    final helper = await _apiService.get(
      endpoint: APIConfig.getElectronicCertificates,
      token: token,
    );
    if (helper.servicesResponse == ServicesResponseStatues.success) {
      return ElectronicResponse.fromJson(helper.fullBody!);
    } else {
      throw Exception('Failed to load certificates');
    }
  }
}
