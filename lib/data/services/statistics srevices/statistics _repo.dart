import 'package:salvest_app/data/models/electronic%20property%20certificate/electronic.property.certificate.dart';
import 'package:salvest_app/data/models/get_Investments_ByMonthAndYear/investments.by.month.dart';
import 'package:salvest_app/data/models/investment/investment.mode.dart';
import 'package:salvest_app/data/models/lines%20chart/lines.chart.dart';
import 'package:salvest_app/data/models/showLargestReward/show.largest.reward.dart';

abstract class StatisticsRepo {
  Future<LinesChartResponse> fetchLinesChart({required int year});
  Future<LargestRewardResponse> fetchLargestReward();
  Future<InvestmentsByMonthResponse> fetchByMonth(int year, int month);
  Future<InvestmentModeResponse> fetchInvestmentModes(String mode);
  Future<ElectronicResponse> fetchCertificates();
}
