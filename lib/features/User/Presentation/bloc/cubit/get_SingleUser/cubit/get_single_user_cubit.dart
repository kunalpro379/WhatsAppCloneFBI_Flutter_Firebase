import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../Domain/entities/user_entity.dart';
import '../../../../../Domain/usecases/users/GetSingleUserUseCase.dart';
part 'get_single_user_state.dart';

class GetSingleUserCubit extends Cubit<GetSingleUserState> {
  final GetSingleUserUseCase getSingleUserUseCase;
  GetSingleUserCubit({required this.getSingleUserUseCase})
      : super(GetSingleUserInitial());

  Future<void> getSingleUser({required String uid}) async {
    emit(GetSingleUserLoading());
    final streamResponse = getSingleUserUseCase.call(uid);
    streamResponse.listen((users) {
      emit(GetSingleUserLoaded(singleUser: users.first));
    });
  }
}
