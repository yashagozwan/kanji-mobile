// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kanji_app/data/repository/jisho_repository.dart' as _i10;
import 'package:kanji_app/data/repository/user_repository.dart' as _i12;
import 'package:kanji_app/data/source/local/hive/user_hive_local_data_source.dart'
    as _i6;
import 'package:kanji_app/data/source/local/user_local_data_source.dart' as _i5;
import 'package:kanji_app/data/source/remote/firebase/firebase_remote_data_source.dart'
    as _i8;
import 'package:kanji_app/data/source/remote/jisho_api_remote_data_source.dart'
    as _i4;
import 'package:kanji_app/data/source/remote/jisho_remote_data_source.dart'
    as _i3;
import 'package:kanji_app/data/source/remote/user_remote_data_source.dart'
    as _i7;
import 'package:kanji_app/domain/repository/i_jisho_repository.dart' as _i9;
import 'package:kanji_app/domain/repository/i_user_repository.dart' as _i11;
import 'package:kanji_app/domain/usecase/jisho_interactor.dart' as _i14;
import 'package:kanji_app/domain/usecase/jisho_usecase.dart' as _i13;
import 'package:kanji_app/domain/usecase/user_interactor.dart' as _i17;
import 'package:kanji_app/domain/usecase/user_usecase.dart' as _i16;
import 'package:kanji_app/presentation/detail/detail_cubit.dart' as _i18;
import 'package:kanji_app/presentation/home/home_cubit.dart' as _i19;
import 'package:kanji_app/presentation/login/login_cubit.dart' as _i20;
import 'package:kanji_app/presentation/search/search_cubit.dart' as _i15;
import 'package:kanji_app/presentation/start/start_cubit.dart' as _i21;
import 'package:kanji_app/presentation/user/user_cubit.dart' as _i22;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.JishoRemoteDataSouce>(_i4.JishoApiRemoteDataSource());
    gh.singleton<_i5.UserLocalDataSource>(_i6.UserHiveLocalDataSource());
    gh.singleton<_i7.UserRemoteDataSource>(_i8.FirebaseRemoteDataSource());
    gh.singleton<_i9.IJishoRepository>(
        _i10.JishoRepository(gh<_i3.JishoRemoteDataSouce>()));
    gh.factory<_i11.IUserRepository>(() => _i12.UserRepository(
          gh<_i7.UserRemoteDataSource>(),
          gh<_i5.UserLocalDataSource>(),
        ));
    gh.singleton<_i13.JishoUseCase>(
        _i14.JishoIteractor(gh<_i9.IJishoRepository>()));
    gh.singleton<_i15.SearchCubit>(_i15.SearchCubit(gh<_i13.JishoUseCase>()));
    gh.factory<_i16.UserUseCase>(
        () => _i17.UserInteractor(gh<_i11.IUserRepository>()));
    gh.singleton<_i18.DetailCubit>(_i18.DetailCubit(gh<_i13.JishoUseCase>()));
    gh.singleton<_i19.HomeCubit>(_i19.HomeCubit(gh<_i16.UserUseCase>()));
    gh.singleton<_i20.LoginCubit>(_i20.LoginCubit(gh<_i16.UserUseCase>()));
    gh.singleton<_i21.StartCubit>(_i21.StartCubit(gh<_i16.UserUseCase>()));
    gh.singleton<_i22.UserCubit>(_i22.UserCubit(gh<_i16.UserUseCase>()));
    return this;
  }
}
