import 'package:bloc/bloc.dart';
import 'package:salvest_app/data/services/statistics%20srevices/statistics%20_repo_impl.dart';
import 'electronic_certificate_event.dart';
import 'electronic_certificate_state.dart';

class ElectronicCertificateBloc
    extends Bloc<ElectronicCertificateEvent, ElectronicCertificateState> {
  final StatisticsRepoImpl _repo;

  ElectronicCertificateBloc(this._repo)
    : super(ElectronicCertificateInitial()) {
    on<LoadElectronicCertificates>((_, emit) async {
      emit(ElectronicCertificateLoading());
      try {
        final resp = await _repo.fetchCertificates();
        emit(ElectronicCertificateLoaded(resp.data ?? []));
      } catch (e) {
        emit(ElectronicCertificateError(e.toString()));
      }
    });
  }
}
