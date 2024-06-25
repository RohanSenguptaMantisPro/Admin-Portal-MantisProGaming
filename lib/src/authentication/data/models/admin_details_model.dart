import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'admin_details_model.mapper.dart';

@MappableClass(discriminatorValue: 'adminDetailsModel')
class AdminDetailsModel extends AdminDetails with AdminDetailsModelMappable {
  const AdminDetailsModel({
    required super.accountType,
    required super.name,
    required super.email,
    required super.displayPicture,
  });

  const AdminDetailsModel.empty()
      : this(
          accountType: '',
          name: '',
          email: '',
          displayPicture: '',
        );

  static AdminDetailsModel fromJson(String json) =>
      AdminDetailsModelMapper.fromJson(json);
}
