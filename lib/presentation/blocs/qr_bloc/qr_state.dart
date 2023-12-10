part of 'qr_bloc.dart';

@freezed
class QrState with _$QrState {
  const factory QrState.initial() = Initial;
  const factory QrState.loading() = Loading;
  const factory QrState.error() = Error;
  const factory QrState.success({required String url}) = Success;
}
