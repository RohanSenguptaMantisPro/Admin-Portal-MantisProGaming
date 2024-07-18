import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_details_model.mapper.dart';

@MappableClass(discriminatorValue: 'userDetailsModel')
class UserDetailsModel extends UserDetails with UserDetailsModelMappable {
  const UserDetailsModel({
    super.id,
    super.accountType,
    super.name,
    super.userName,
    super.googleId,
    super.email,
    super.emailVerified,
    super.displayPicture,
    super.role,
    super.locale,
    super.country,
    super.creditsAvailable,
    super.accountActive,
    super.accountStatus,
    super.createdAt,
    super.updatedAt,
  });

  const UserDetailsModel.empty()
      : super(
          id: '',
          accountType: '',
          name: '',
          userName: '',
          googleId: '',
          email: '',
          emailVerified: false,
          displayPicture: '',
          role: 0,
          locale: '',
          country: '',
          creditsAvailable: 0,
          accountActive: false,
          accountStatus: '',
          createdAt: '',
          updatedAt: '',
        );

  static UserDetailsModel fromJson(String json) =>
      UserDetailsModelMapper.fromJson(json);
}
