import 'package:hive/hive.dart';

import '../box_name.dart';

part 'user_hive.g.dart';

@HiveType(typeId: BoxName.userId)
class UserHive extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String image;
  @HiveField(4)
  String createdAt;

  UserHive({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.createdAt,
  });
}
