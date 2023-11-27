part of 'qr_bloc.dart';

@freezed
class QrEvent with _$QrEvent {
  const factory QrEvent.scan({
    required Barcode result,
  }) = _ScanEvent;
}
