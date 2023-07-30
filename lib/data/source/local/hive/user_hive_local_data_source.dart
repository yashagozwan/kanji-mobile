import 'dart:async';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:kanji_app/data/mapper/user_mapper.dart';
import 'package:kanji_app/data/source/local/hive/box_name.dart';
import 'package:kanji_app/data/source/local/user_local_data_source.dart';
import 'package:kanji_app/domain/model/user/user_model.dart';

import 'user/user_hive.dart';

@Singleton(as: UserLocalDataSource)
class UserHiveLocalDataSource implements UserLocalDataSource {
  Future<Box<UserHive>> get _userBox => Hive.openBox<UserHive>(BoxName.user);

  @override
  Future<bool> insertAccount(UserModel user) async {
    try {
      final box = await _userBox;
      await box.clear();
      await box.put(user.id, UserMapper.toHive(user));
      return true;
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<bool> removeAccount() async {
    try {
      final box = await _userBox;
      await box.clear();
      return true;
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<UserModel> getAccount() async {
    try {
      final box = await _userBox;
      final user = box.values.first;
      return UserMapper.toModel(user);
    } on HiveError {
      rethrow;
    }
  }
}
