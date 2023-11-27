import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

part 'qr_bloc.freezed.dart';
part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc() : super(const QrState.initial()) {
    on<_ScanEvent>((event, emit) async {
      try {
        final String? url = event.result.code;
        // ignore: deprecated_member_use
        await launch(url!);
        emit(QrState.success(url: url));
      } catch (e) {
        emit(const QrState.error());
      }
    });
  }
}
