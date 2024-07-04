import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_data.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_data_model.mapper.dart';

@MappableClass(discriminatorValue: 'userDataModel')
class UserDataModel extends UserData with UserDataModelMappable {
  const UserDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.userName,
  });

  const UserDataModel.empty()
      : this(
          id: '',
          name: '',
          email: '',
          userName: '',
        );
}
