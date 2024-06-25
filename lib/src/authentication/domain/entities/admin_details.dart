import 'package:dart_mappable/dart_mappable.dart';

part 'admin_details.mapper.dart';

// docs : https://pub.dev/documentation/dart_mappable/latest/topics/Polymorphism-topic.html
@MappableClass(discriminatorKey: 'type')
class AdminDetails with AdminDetailsMappable {
  const AdminDetails({
    required this.accountType,
    required this.name,
    required this.email,
    required this.displayPicture,
  });

  const AdminDetails.empty()
      : this(
          accountType: '',
          name: '',
          email: '',
          displayPicture: '',
        );

  final String accountType;
  final String name;
  final String email;
  final String displayPicture;
}
