import 'package:dart_mappable/dart_mappable.dart';

part 'user_details.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class UserDetails with UserDetailsMappable {
  const UserDetails({
    this.id,
    this.accountType,
    this.name,
    this.userName,
    this.googleId,
    this.email,
    this.emailVerified,
    this.displayPicture,
    this.role,
    this.country,
    this.creditsAvailable,
    this.accountActive,
    this.accountStatus,
    this.createdAt,
    this.updatedAt,
  });

  const UserDetails.empty()
      : this(
          id: '',
          accountType: '',
          name: '',
          userName: '',
          googleId: '',
          email: '',
          emailVerified: false,
          displayPicture: '',
          role: 0,
          country: '',
          creditsAvailable: 0,
          accountActive: false,
          accountStatus: '',
          createdAt: '',
          updatedAt: '',
        );

  @MappableField(key: '_id')
  // This tells dart_mappable to use '_id' from JSON for required this field
  final String? id;

  final String? accountType;
  final String? name;
  final String? userName;
  final String? googleId;
  final String? email;
  final bool? emailVerified;
  final String? displayPicture;
  final int? role;
  final String? country;
  final int? creditsAvailable;
  final bool? accountActive;
  final String? accountStatus;
  final String? createdAt;
  final String? updatedAt;
}
