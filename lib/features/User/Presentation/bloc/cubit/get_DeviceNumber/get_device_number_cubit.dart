import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Domain/entities/contact_entity.dart';
import '../../../../Domain/usecases/users/GetDeviceNumberUseCase.dart';
import '../auth/auth_cubit.dart';

part 'get_device_number_state.dart';

class GetDeviceNumberCubit extends Cubit<GetDeviceNumberState> {
  GetDeviceNumberUseCase getDeviceNumberUseCase;
  GetDeviceNumberCubit({required this.getDeviceNumberUseCase})
      : super(GetDeviceNumberInitial());

  Future<void> getDeviceNumber() async {
    try {
      final contactNumbers = await getDeviceNumberUseCase.call();
      emit(GetDeviceNumberLoaded(contacts: contactNumbers));
    } catch (_) {
      emit(GetDeviceNumberFailure());
    }
  }
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}
