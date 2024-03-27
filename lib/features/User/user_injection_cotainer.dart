import 'package:whatsapp_FBI/features/User/Data/data_sources/remote/user_remote_data_source.dart';
import 'package:whatsapp_FBI/features/User/Domain/repository/user_repository.dart';
import 'package:whatsapp_FBI/features/User/Domain/usecases/credentials/SignInWithPhoneNumber.dart';
import 'package:whatsapp_FBI/features/User/Domain/usecases/users/GetAllUsersUseCase.dart';
import 'package:whatsapp_FBI/features/User/Domain/usecases/users/GetDeviceNumberUseCase.dart';

import '../../main_injection_container.dart';
import 'Data/data_sources/remote/user_remote_data_source_impl.dart';
import 'Data/repository/user_repository_impl.dart';
import 'Domain/usecases/credentials/SignOutUseCase.dart';
import 'Domain/usecases/credentials/VerifyPhoneNumber.dart';
import 'Domain/usecases/credentials/get_current_uid_usecase.dart';
import 'Domain/usecases/credentials/isSignInUseCase.dart';
import 'Domain/usecases/users/CreateUserUseCase.dart';
import 'Domain/usecases/users/GetSingleUserUseCase.dart';
import 'Domain/usecases/users/UpdateUserUseCase.dart';
import 'Presentation/bloc/cubit/auth/auth_cubit.dart';
import 'Presentation/bloc/cubit/get_DeviceNumber/get_device_number_cubit.dart';
import 'Presentation/bloc/cubit/get_SingleUser/cubit/get_single_user_cubit.dart';
import 'Presentation/bloc/cubit/user/cubit/user_cubit.dart';

Future<void> userInjectionContainer() async {
  // * CUBITS INJECTION

  sl.registerFactory<AuthCubit>(() => AuthCubit(
      getCurrentUidUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call()));

  sl.registerFactory<UserCubit>(() =>
      UserCubit(getAllUsersUseCase: sl.call(), updateUserUseCase: sl.call()));

  sl.registerFactory<GetSingleUserCubit>(
      () => GetSingleUserCubit(getSingleUserUseCase: sl.call()));

  // sl.registerFactory<CredentialCubit>(() => CredentialCubit(
  //     createUserUseCase: sl.call(),
  //     signInWithPhoneNumberUseCase: sl.call(),
  //     verifyPhoneNumberUseCase: sl.call()));

  sl.registerFactory<GetDeviceNumberCubit>(
      () => GetDeviceNumberCubit(getDeviceNumberUseCase: sl.call()));

  // * USE CASES INJECTION

  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));

  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<CreateUserUseCase>(
      () => CreateUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetAllUsersUseCase>(
      () => GetAllUsersUseCase(repository: sl.call()));

  sl.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetSingleUserUseCase>(
      () => GetSingleUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignInWithPhoneNumberUseCase>(
      () => SignInWithPhoneNumberUseCase(repository: sl.call()));

  sl.registerLazySingleton<VerifyPhoneNumberUseCase>(
      () => VerifyPhoneNumberUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetDeviceNumberUseCase>(
      () => GetDeviceNumberUseCase(repository: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
        auth: sl.call(),
        fireStore: sl.call(),
      ));
}

CredentialCubit(
    {required Object createUserUseCase,
    required Object signInWithPhoneNumberUseCase,
    required Object verifyPhoneNumberUseCase}) {}
