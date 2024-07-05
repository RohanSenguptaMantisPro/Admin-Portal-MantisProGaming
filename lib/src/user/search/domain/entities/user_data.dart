import 'package:dart_mappable/dart_mappable.dart';

part 'user_data.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class UserData with UserDataMappable {
  const UserData({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
  });

  const UserData.empty()
      : this(
          id: '',
          name: '',
          userName: '',
          email: '',
        );

  @MappableField(key: '_id')
  // This tells dart_mappable to use '_id' from JSON for this field
  final String id;

  final String name;
  final String userName;
  final String email;
}
