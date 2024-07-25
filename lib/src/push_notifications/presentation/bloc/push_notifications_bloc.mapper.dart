// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'push_notifications_bloc.dart';

class PushNotificationEventMapper
    extends ClassMapperBase<PushNotificationEvent> {
  PushNotificationEventMapper._();

  static PushNotificationEventMapper? _instance;
  static PushNotificationEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PushNotificationEventMapper._());
      UploadNotificationImageEventMapper.ensureInitialized();
      DownloadNotificationImageEventMapper.ensureInitialized();
      SendNotificationEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PushNotificationEvent';

  @override
  final MappableFields<PushNotificationEvent> fields = const {};

  static PushNotificationEvent _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('PushNotificationEvent');
  }

  @override
  final Function instantiate = _instantiate;

  static PushNotificationEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PushNotificationEvent>(map);
  }

  static PushNotificationEvent fromJson(String json) {
    return ensureInitialized().decodeJson<PushNotificationEvent>(json);
  }
}

mixin PushNotificationEventMappable {
  String toJson();
  Map<String, dynamic> toMap();
  PushNotificationEventCopyWith<PushNotificationEvent, PushNotificationEvent,
      PushNotificationEvent> get copyWith;
}

abstract class PushNotificationEventCopyWith<
    $R,
    $In extends PushNotificationEvent,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  PushNotificationEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class UploadNotificationImageEventMapper
    extends ClassMapperBase<UploadNotificationImageEvent> {
  UploadNotificationImageEventMapper._();

  static UploadNotificationImageEventMapper? _instance;
  static UploadNotificationImageEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UploadNotificationImageEventMapper._());
      PushNotificationEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadNotificationImageEvent';

  static String _$userToken(UploadNotificationImageEvent v) => v.userToken;
  static const Field<UploadNotificationImageEvent, String> _f$userToken =
      Field('userToken', _$userToken);
  static XFile _$imageFile(UploadNotificationImageEvent v) => v.imageFile;
  static const Field<UploadNotificationImageEvent, XFile> _f$imageFile =
      Field('imageFile', _$imageFile);

  @override
  final MappableFields<UploadNotificationImageEvent> fields = const {
    #userToken: _f$userToken,
    #imageFile: _f$imageFile,
  };

  static UploadNotificationImageEvent _instantiate(DecodingData data) {
    return UploadNotificationImageEvent(
        userToken: data.dec(_f$userToken), imageFile: data.dec(_f$imageFile));
  }

  @override
  final Function instantiate = _instantiate;

  static UploadNotificationImageEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadNotificationImageEvent>(map);
  }

  static UploadNotificationImageEvent fromJson(String json) {
    return ensureInitialized().decodeJson<UploadNotificationImageEvent>(json);
  }
}

mixin UploadNotificationImageEventMappable {
  String toJson() {
    return UploadNotificationImageEventMapper.ensureInitialized()
        .encodeJson<UploadNotificationImageEvent>(
            this as UploadNotificationImageEvent);
  }

  Map<String, dynamic> toMap() {
    return UploadNotificationImageEventMapper.ensureInitialized()
        .encodeMap<UploadNotificationImageEvent>(
            this as UploadNotificationImageEvent);
  }

  UploadNotificationImageEventCopyWith<UploadNotificationImageEvent,
          UploadNotificationImageEvent, UploadNotificationImageEvent>
      get copyWith => _UploadNotificationImageEventCopyWithImpl(
          this as UploadNotificationImageEvent, $identity, $identity);
  @override
  String toString() {
    return UploadNotificationImageEventMapper.ensureInitialized()
        .stringifyValue(this as UploadNotificationImageEvent);
  }

  @override
  bool operator ==(Object other) {
    return UploadNotificationImageEventMapper.ensureInitialized()
        .equalsValue(this as UploadNotificationImageEvent, other);
  }

  @override
  int get hashCode {
    return UploadNotificationImageEventMapper.ensureInitialized()
        .hashValue(this as UploadNotificationImageEvent);
  }
}

extension UploadNotificationImageEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadNotificationImageEvent, $Out> {
  UploadNotificationImageEventCopyWith<$R, UploadNotificationImageEvent, $Out>
      get $asUploadNotificationImageEvent => $base.as(
          (v, t, t2) => _UploadNotificationImageEventCopyWithImpl(v, t, t2));
}

abstract class UploadNotificationImageEventCopyWith<
    $R,
    $In extends UploadNotificationImageEvent,
    $Out> implements PushNotificationEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken, XFile? imageFile});
  UploadNotificationImageEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadNotificationImageEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadNotificationImageEvent, $Out>
    implements
        UploadNotificationImageEventCopyWith<$R, UploadNotificationImageEvent,
            $Out> {
  _UploadNotificationImageEventCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadNotificationImageEvent> $mapper =
      UploadNotificationImageEventMapper.ensureInitialized();
  @override
  $R call({String? userToken, XFile? imageFile}) => $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (imageFile != null) #imageFile: imageFile
      }));
  @override
  UploadNotificationImageEvent $make(CopyWithData data) =>
      UploadNotificationImageEvent(
          userToken: data.get(#userToken, or: $value.userToken),
          imageFile: data.get(#imageFile, or: $value.imageFile));

  @override
  UploadNotificationImageEventCopyWith<$R2, UploadNotificationImageEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UploadNotificationImageEventCopyWithImpl($value, $cast, t);
}

class DownloadNotificationImageEventMapper
    extends ClassMapperBase<DownloadNotificationImageEvent> {
  DownloadNotificationImageEventMapper._();

  static DownloadNotificationImageEventMapper? _instance;
  static DownloadNotificationImageEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DownloadNotificationImageEventMapper._());
      PushNotificationEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DownloadNotificationImageEvent';

  static String _$userToken(DownloadNotificationImageEvent v) => v.userToken;
  static const Field<DownloadNotificationImageEvent, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$fileName(DownloadNotificationImageEvent v) => v.fileName;
  static const Field<DownloadNotificationImageEvent, String> _f$fileName =
      Field('fileName', _$fileName);

  @override
  final MappableFields<DownloadNotificationImageEvent> fields = const {
    #userToken: _f$userToken,
    #fileName: _f$fileName,
  };

  static DownloadNotificationImageEvent _instantiate(DecodingData data) {
    return DownloadNotificationImageEvent(
        userToken: data.dec(_f$userToken), fileName: data.dec(_f$fileName));
  }

  @override
  final Function instantiate = _instantiate;

  static DownloadNotificationImageEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownloadNotificationImageEvent>(map);
  }

  static DownloadNotificationImageEvent fromJson(String json) {
    return ensureInitialized().decodeJson<DownloadNotificationImageEvent>(json);
  }
}

mixin DownloadNotificationImageEventMappable {
  String toJson() {
    return DownloadNotificationImageEventMapper.ensureInitialized()
        .encodeJson<DownloadNotificationImageEvent>(
            this as DownloadNotificationImageEvent);
  }

  Map<String, dynamic> toMap() {
    return DownloadNotificationImageEventMapper.ensureInitialized()
        .encodeMap<DownloadNotificationImageEvent>(
            this as DownloadNotificationImageEvent);
  }

  DownloadNotificationImageEventCopyWith<DownloadNotificationImageEvent,
          DownloadNotificationImageEvent, DownloadNotificationImageEvent>
      get copyWith => _DownloadNotificationImageEventCopyWithImpl(
          this as DownloadNotificationImageEvent, $identity, $identity);
  @override
  String toString() {
    return DownloadNotificationImageEventMapper.ensureInitialized()
        .stringifyValue(this as DownloadNotificationImageEvent);
  }

  @override
  bool operator ==(Object other) {
    return DownloadNotificationImageEventMapper.ensureInitialized()
        .equalsValue(this as DownloadNotificationImageEvent, other);
  }

  @override
  int get hashCode {
    return DownloadNotificationImageEventMapper.ensureInitialized()
        .hashValue(this as DownloadNotificationImageEvent);
  }
}

extension DownloadNotificationImageEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownloadNotificationImageEvent, $Out> {
  DownloadNotificationImageEventCopyWith<$R, DownloadNotificationImageEvent,
          $Out>
      get $asDownloadNotificationImageEvent => $base.as(
          (v, t, t2) => _DownloadNotificationImageEventCopyWithImpl(v, t, t2));
}

abstract class DownloadNotificationImageEventCopyWith<
    $R,
    $In extends DownloadNotificationImageEvent,
    $Out> implements PushNotificationEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken, String? fileName});
  DownloadNotificationImageEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownloadNotificationImageEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownloadNotificationImageEvent, $Out>
    implements
        DownloadNotificationImageEventCopyWith<$R,
            DownloadNotificationImageEvent, $Out> {
  _DownloadNotificationImageEventCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownloadNotificationImageEvent> $mapper =
      DownloadNotificationImageEventMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? fileName}) => $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (fileName != null) #fileName: fileName
      }));
  @override
  DownloadNotificationImageEvent $make(CopyWithData data) =>
      DownloadNotificationImageEvent(
          userToken: data.get(#userToken, or: $value.userToken),
          fileName: data.get(#fileName, or: $value.fileName));

  @override
  DownloadNotificationImageEventCopyWith<$R2, DownloadNotificationImageEvent,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DownloadNotificationImageEventCopyWithImpl($value, $cast, t);
}

class SendNotificationEventMapper
    extends ClassMapperBase<SendNotificationEvent> {
  SendNotificationEventMapper._();

  static SendNotificationEventMapper? _instance;
  static SendNotificationEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendNotificationEventMapper._());
      PushNotificationEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SendNotificationEvent';

  static String _$userToken(SendNotificationEvent v) => v.userToken;
  static const Field<SendNotificationEvent, String> _f$userToken =
      Field('userToken', _$userToken);
  static String _$title(SendNotificationEvent v) => v.title;
  static const Field<SendNotificationEvent, String> _f$title =
      Field('title', _$title);
  static String _$body(SendNotificationEvent v) => v.body;
  static const Field<SendNotificationEvent, String> _f$body =
      Field('body', _$body);
  static String _$fileName(SendNotificationEvent v) => v.fileName;
  static const Field<SendNotificationEvent, String> _f$fileName =
      Field('fileName', _$fileName);

  @override
  final MappableFields<SendNotificationEvent> fields = const {
    #userToken: _f$userToken,
    #title: _f$title,
    #body: _f$body,
    #fileName: _f$fileName,
  };

  static SendNotificationEvent _instantiate(DecodingData data) {
    return SendNotificationEvent(
        userToken: data.dec(_f$userToken),
        title: data.dec(_f$title),
        body: data.dec(_f$body),
        fileName: data.dec(_f$fileName));
  }

  @override
  final Function instantiate = _instantiate;

  static SendNotificationEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendNotificationEvent>(map);
  }

  static SendNotificationEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SendNotificationEvent>(json);
  }
}

mixin SendNotificationEventMappable {
  String toJson() {
    return SendNotificationEventMapper.ensureInitialized()
        .encodeJson<SendNotificationEvent>(this as SendNotificationEvent);
  }

  Map<String, dynamic> toMap() {
    return SendNotificationEventMapper.ensureInitialized()
        .encodeMap<SendNotificationEvent>(this as SendNotificationEvent);
  }

  SendNotificationEventCopyWith<SendNotificationEvent, SendNotificationEvent,
          SendNotificationEvent>
      get copyWith => _SendNotificationEventCopyWithImpl(
          this as SendNotificationEvent, $identity, $identity);
  @override
  String toString() {
    return SendNotificationEventMapper.ensureInitialized()
        .stringifyValue(this as SendNotificationEvent);
  }

  @override
  bool operator ==(Object other) {
    return SendNotificationEventMapper.ensureInitialized()
        .equalsValue(this as SendNotificationEvent, other);
  }

  @override
  int get hashCode {
    return SendNotificationEventMapper.ensureInitialized()
        .hashValue(this as SendNotificationEvent);
  }
}

extension SendNotificationEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendNotificationEvent, $Out> {
  SendNotificationEventCopyWith<$R, SendNotificationEvent, $Out>
      get $asSendNotificationEvent =>
          $base.as((v, t, t2) => _SendNotificationEventCopyWithImpl(v, t, t2));
}

abstract class SendNotificationEventCopyWith<
    $R,
    $In extends SendNotificationEvent,
    $Out> implements PushNotificationEventCopyWith<$R, $In, $Out> {
  @override
  $R call({String? userToken, String? title, String? body, String? fileName});
  SendNotificationEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SendNotificationEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendNotificationEvent, $Out>
    implements SendNotificationEventCopyWith<$R, SendNotificationEvent, $Out> {
  _SendNotificationEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendNotificationEvent> $mapper =
      SendNotificationEventMapper.ensureInitialized();
  @override
  $R call({String? userToken, String? title, String? body, String? fileName}) =>
      $apply(FieldCopyWithData({
        if (userToken != null) #userToken: userToken,
        if (title != null) #title: title,
        if (body != null) #body: body,
        if (fileName != null) #fileName: fileName
      }));
  @override
  SendNotificationEvent $make(CopyWithData data) => SendNotificationEvent(
      userToken: data.get(#userToken, or: $value.userToken),
      title: data.get(#title, or: $value.title),
      body: data.get(#body, or: $value.body),
      fileName: data.get(#fileName, or: $value.fileName));

  @override
  SendNotificationEventCopyWith<$R2, SendNotificationEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SendNotificationEventCopyWithImpl($value, $cast, t);
}

class PushNotificationStateMapper
    extends ClassMapperBase<PushNotificationState> {
  PushNotificationStateMapper._();

  static PushNotificationStateMapper? _instance;
  static PushNotificationStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PushNotificationStateMapper._());
      PushNotificationInitialMapper.ensureInitialized();
      PushNotificationErrorMapper.ensureInitialized();
      UploadingNotificationImageMapper.ensureInitialized();
      UploadedNotificationImageMapper.ensureInitialized();
      DownloadingNotificationImageMapper.ensureInitialized();
      DownloadedNotificationImageMapper.ensureInitialized();
      SendingNotificationMapper.ensureInitialized();
      SentNotificationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PushNotificationState';

  @override
  final MappableFields<PushNotificationState> fields = const {};

  static PushNotificationState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('PushNotificationState');
  }

  @override
  final Function instantiate = _instantiate;

  static PushNotificationState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PushNotificationState>(map);
  }

  static PushNotificationState fromJson(String json) {
    return ensureInitialized().decodeJson<PushNotificationState>(json);
  }
}

mixin PushNotificationStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  PushNotificationStateCopyWith<PushNotificationState, PushNotificationState,
      PushNotificationState> get copyWith;
}

abstract class PushNotificationStateCopyWith<
    $R,
    $In extends PushNotificationState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  PushNotificationStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class PushNotificationInitialMapper
    extends ClassMapperBase<PushNotificationInitial> {
  PushNotificationInitialMapper._();

  static PushNotificationInitialMapper? _instance;
  static PushNotificationInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = PushNotificationInitialMapper._());
      PushNotificationStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PushNotificationInitial';

  @override
  final MappableFields<PushNotificationInitial> fields = const {};

  static PushNotificationInitial _instantiate(DecodingData data) {
    return PushNotificationInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static PushNotificationInitial fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PushNotificationInitial>(map);
  }

  static PushNotificationInitial fromJson(String json) {
    return ensureInitialized().decodeJson<PushNotificationInitial>(json);
  }
}

mixin PushNotificationInitialMappable {
  String toJson() {
    return PushNotificationInitialMapper.ensureInitialized()
        .encodeJson<PushNotificationInitial>(this as PushNotificationInitial);
  }

  Map<String, dynamic> toMap() {
    return PushNotificationInitialMapper.ensureInitialized()
        .encodeMap<PushNotificationInitial>(this as PushNotificationInitial);
  }

  PushNotificationInitialCopyWith<PushNotificationInitial,
          PushNotificationInitial, PushNotificationInitial>
      get copyWith => _PushNotificationInitialCopyWithImpl(
          this as PushNotificationInitial, $identity, $identity);
  @override
  String toString() {
    return PushNotificationInitialMapper.ensureInitialized()
        .stringifyValue(this as PushNotificationInitial);
  }

  @override
  bool operator ==(Object other) {
    return PushNotificationInitialMapper.ensureInitialized()
        .equalsValue(this as PushNotificationInitial, other);
  }

  @override
  int get hashCode {
    return PushNotificationInitialMapper.ensureInitialized()
        .hashValue(this as PushNotificationInitial);
  }
}

extension PushNotificationInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PushNotificationInitial, $Out> {
  PushNotificationInitialCopyWith<$R, PushNotificationInitial, $Out>
      get $asPushNotificationInitial => $base
          .as((v, t, t2) => _PushNotificationInitialCopyWithImpl(v, t, t2));
}

abstract class PushNotificationInitialCopyWith<
    $R,
    $In extends PushNotificationInitial,
    $Out> implements PushNotificationStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  PushNotificationInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PushNotificationInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PushNotificationInitial, $Out>
    implements
        PushNotificationInitialCopyWith<$R, PushNotificationInitial, $Out> {
  _PushNotificationInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PushNotificationInitial> $mapper =
      PushNotificationInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  PushNotificationInitial $make(CopyWithData data) => PushNotificationInitial();

  @override
  PushNotificationInitialCopyWith<$R2, PushNotificationInitial, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PushNotificationInitialCopyWithImpl($value, $cast, t);
}

class PushNotificationErrorMapper
    extends ClassMapperBase<PushNotificationError> {
  PushNotificationErrorMapper._();

  static PushNotificationErrorMapper? _instance;
  static PushNotificationErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PushNotificationErrorMapper._());
      PushNotificationStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PushNotificationError';

  static String _$errorMessage(PushNotificationError v) => v.errorMessage;
  static const Field<PushNotificationError, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage);

  @override
  final MappableFields<PushNotificationError> fields = const {
    #errorMessage: _f$errorMessage,
  };

  static PushNotificationError _instantiate(DecodingData data) {
    return PushNotificationError(errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static PushNotificationError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PushNotificationError>(map);
  }

  static PushNotificationError fromJson(String json) {
    return ensureInitialized().decodeJson<PushNotificationError>(json);
  }
}

mixin PushNotificationErrorMappable {
  String toJson() {
    return PushNotificationErrorMapper.ensureInitialized()
        .encodeJson<PushNotificationError>(this as PushNotificationError);
  }

  Map<String, dynamic> toMap() {
    return PushNotificationErrorMapper.ensureInitialized()
        .encodeMap<PushNotificationError>(this as PushNotificationError);
  }

  PushNotificationErrorCopyWith<PushNotificationError, PushNotificationError,
          PushNotificationError>
      get copyWith => _PushNotificationErrorCopyWithImpl(
          this as PushNotificationError, $identity, $identity);
  @override
  String toString() {
    return PushNotificationErrorMapper.ensureInitialized()
        .stringifyValue(this as PushNotificationError);
  }

  @override
  bool operator ==(Object other) {
    return PushNotificationErrorMapper.ensureInitialized()
        .equalsValue(this as PushNotificationError, other);
  }

  @override
  int get hashCode {
    return PushNotificationErrorMapper.ensureInitialized()
        .hashValue(this as PushNotificationError);
  }
}

extension PushNotificationErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PushNotificationError, $Out> {
  PushNotificationErrorCopyWith<$R, PushNotificationError, $Out>
      get $asPushNotificationError =>
          $base.as((v, t, t2) => _PushNotificationErrorCopyWithImpl(v, t, t2));
}

abstract class PushNotificationErrorCopyWith<
    $R,
    $In extends PushNotificationError,
    $Out> implements PushNotificationStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? errorMessage});
  PushNotificationErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PushNotificationErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PushNotificationError, $Out>
    implements PushNotificationErrorCopyWith<$R, PushNotificationError, $Out> {
  _PushNotificationErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PushNotificationError> $mapper =
      PushNotificationErrorMapper.ensureInitialized();
  @override
  $R call({String? errorMessage}) => $apply(FieldCopyWithData(
      {if (errorMessage != null) #errorMessage: errorMessage}));
  @override
  PushNotificationError $make(CopyWithData data) => PushNotificationError(
      errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  PushNotificationErrorCopyWith<$R2, PushNotificationError, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PushNotificationErrorCopyWithImpl($value, $cast, t);
}

class UploadingNotificationImageMapper
    extends ClassMapperBase<UploadingNotificationImage> {
  UploadingNotificationImageMapper._();

  static UploadingNotificationImageMapper? _instance;
  static UploadingNotificationImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UploadingNotificationImageMapper._());
      PushNotificationStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadingNotificationImage';

  @override
  final MappableFields<UploadingNotificationImage> fields = const {};

  static UploadingNotificationImage _instantiate(DecodingData data) {
    return UploadingNotificationImage();
  }

  @override
  final Function instantiate = _instantiate;

  static UploadingNotificationImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadingNotificationImage>(map);
  }

  static UploadingNotificationImage fromJson(String json) {
    return ensureInitialized().decodeJson<UploadingNotificationImage>(json);
  }
}

mixin UploadingNotificationImageMappable {
  String toJson() {
    return UploadingNotificationImageMapper.ensureInitialized()
        .encodeJson<UploadingNotificationImage>(
            this as UploadingNotificationImage);
  }

  Map<String, dynamic> toMap() {
    return UploadingNotificationImageMapper.ensureInitialized()
        .encodeMap<UploadingNotificationImage>(
            this as UploadingNotificationImage);
  }

  UploadingNotificationImageCopyWith<UploadingNotificationImage,
          UploadingNotificationImage, UploadingNotificationImage>
      get copyWith => _UploadingNotificationImageCopyWithImpl(
          this as UploadingNotificationImage, $identity, $identity);
  @override
  String toString() {
    return UploadingNotificationImageMapper.ensureInitialized()
        .stringifyValue(this as UploadingNotificationImage);
  }

  @override
  bool operator ==(Object other) {
    return UploadingNotificationImageMapper.ensureInitialized()
        .equalsValue(this as UploadingNotificationImage, other);
  }

  @override
  int get hashCode {
    return UploadingNotificationImageMapper.ensureInitialized()
        .hashValue(this as UploadingNotificationImage);
  }
}

extension UploadingNotificationImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadingNotificationImage, $Out> {
  UploadingNotificationImageCopyWith<$R, UploadingNotificationImage, $Out>
      get $asUploadingNotificationImage => $base
          .as((v, t, t2) => _UploadingNotificationImageCopyWithImpl(v, t, t2));
}

abstract class UploadingNotificationImageCopyWith<
    $R,
    $In extends UploadingNotificationImage,
    $Out> implements PushNotificationStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UploadingNotificationImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadingNotificationImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadingNotificationImage, $Out>
    implements
        UploadingNotificationImageCopyWith<$R, UploadingNotificationImage,
            $Out> {
  _UploadingNotificationImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadingNotificationImage> $mapper =
      UploadingNotificationImageMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UploadingNotificationImage $make(CopyWithData data) =>
      UploadingNotificationImage();

  @override
  UploadingNotificationImageCopyWith<$R2, UploadingNotificationImage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UploadingNotificationImageCopyWithImpl($value, $cast, t);
}

class UploadedNotificationImageMapper
    extends ClassMapperBase<UploadedNotificationImage> {
  UploadedNotificationImageMapper._();

  static UploadedNotificationImageMapper? _instance;
  static UploadedNotificationImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UploadedNotificationImageMapper._());
      PushNotificationStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UploadedNotificationImage';

  @override
  final MappableFields<UploadedNotificationImage> fields = const {};

  static UploadedNotificationImage _instantiate(DecodingData data) {
    return UploadedNotificationImage();
  }

  @override
  final Function instantiate = _instantiate;

  static UploadedNotificationImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UploadedNotificationImage>(map);
  }

  static UploadedNotificationImage fromJson(String json) {
    return ensureInitialized().decodeJson<UploadedNotificationImage>(json);
  }
}

mixin UploadedNotificationImageMappable {
  String toJson() {
    return UploadedNotificationImageMapper.ensureInitialized()
        .encodeJson<UploadedNotificationImage>(
            this as UploadedNotificationImage);
  }

  Map<String, dynamic> toMap() {
    return UploadedNotificationImageMapper.ensureInitialized()
        .encodeMap<UploadedNotificationImage>(
            this as UploadedNotificationImage);
  }

  UploadedNotificationImageCopyWith<UploadedNotificationImage,
          UploadedNotificationImage, UploadedNotificationImage>
      get copyWith => _UploadedNotificationImageCopyWithImpl(
          this as UploadedNotificationImage, $identity, $identity);
  @override
  String toString() {
    return UploadedNotificationImageMapper.ensureInitialized()
        .stringifyValue(this as UploadedNotificationImage);
  }

  @override
  bool operator ==(Object other) {
    return UploadedNotificationImageMapper.ensureInitialized()
        .equalsValue(this as UploadedNotificationImage, other);
  }

  @override
  int get hashCode {
    return UploadedNotificationImageMapper.ensureInitialized()
        .hashValue(this as UploadedNotificationImage);
  }
}

extension UploadedNotificationImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UploadedNotificationImage, $Out> {
  UploadedNotificationImageCopyWith<$R, UploadedNotificationImage, $Out>
      get $asUploadedNotificationImage => $base
          .as((v, t, t2) => _UploadedNotificationImageCopyWithImpl(v, t, t2));
}

abstract class UploadedNotificationImageCopyWith<
    $R,
    $In extends UploadedNotificationImage,
    $Out> implements PushNotificationStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UploadedNotificationImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UploadedNotificationImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UploadedNotificationImage, $Out>
    implements
        UploadedNotificationImageCopyWith<$R, UploadedNotificationImage, $Out> {
  _UploadedNotificationImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UploadedNotificationImage> $mapper =
      UploadedNotificationImageMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UploadedNotificationImage $make(CopyWithData data) =>
      UploadedNotificationImage();

  @override
  UploadedNotificationImageCopyWith<$R2, UploadedNotificationImage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UploadedNotificationImageCopyWithImpl($value, $cast, t);
}

class DownloadingNotificationImageMapper
    extends ClassMapperBase<DownloadingNotificationImage> {
  DownloadingNotificationImageMapper._();

  static DownloadingNotificationImageMapper? _instance;
  static DownloadingNotificationImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DownloadingNotificationImageMapper._());
      PushNotificationStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DownloadingNotificationImage';

  @override
  final MappableFields<DownloadingNotificationImage> fields = const {};

  static DownloadingNotificationImage _instantiate(DecodingData data) {
    return DownloadingNotificationImage();
  }

  @override
  final Function instantiate = _instantiate;

  static DownloadingNotificationImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownloadingNotificationImage>(map);
  }

  static DownloadingNotificationImage fromJson(String json) {
    return ensureInitialized().decodeJson<DownloadingNotificationImage>(json);
  }
}

mixin DownloadingNotificationImageMappable {
  String toJson() {
    return DownloadingNotificationImageMapper.ensureInitialized()
        .encodeJson<DownloadingNotificationImage>(
            this as DownloadingNotificationImage);
  }

  Map<String, dynamic> toMap() {
    return DownloadingNotificationImageMapper.ensureInitialized()
        .encodeMap<DownloadingNotificationImage>(
            this as DownloadingNotificationImage);
  }

  DownloadingNotificationImageCopyWith<DownloadingNotificationImage,
          DownloadingNotificationImage, DownloadingNotificationImage>
      get copyWith => _DownloadingNotificationImageCopyWithImpl(
          this as DownloadingNotificationImage, $identity, $identity);
  @override
  String toString() {
    return DownloadingNotificationImageMapper.ensureInitialized()
        .stringifyValue(this as DownloadingNotificationImage);
  }

  @override
  bool operator ==(Object other) {
    return DownloadingNotificationImageMapper.ensureInitialized()
        .equalsValue(this as DownloadingNotificationImage, other);
  }

  @override
  int get hashCode {
    return DownloadingNotificationImageMapper.ensureInitialized()
        .hashValue(this as DownloadingNotificationImage);
  }
}

extension DownloadingNotificationImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownloadingNotificationImage, $Out> {
  DownloadingNotificationImageCopyWith<$R, DownloadingNotificationImage, $Out>
      get $asDownloadingNotificationImage => $base.as(
          (v, t, t2) => _DownloadingNotificationImageCopyWithImpl(v, t, t2));
}

abstract class DownloadingNotificationImageCopyWith<
    $R,
    $In extends DownloadingNotificationImage,
    $Out> implements PushNotificationStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  DownloadingNotificationImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownloadingNotificationImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownloadingNotificationImage, $Out>
    implements
        DownloadingNotificationImageCopyWith<$R, DownloadingNotificationImage,
            $Out> {
  _DownloadingNotificationImageCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownloadingNotificationImage> $mapper =
      DownloadingNotificationImageMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  DownloadingNotificationImage $make(CopyWithData data) =>
      DownloadingNotificationImage();

  @override
  DownloadingNotificationImageCopyWith<$R2, DownloadingNotificationImage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownloadingNotificationImageCopyWithImpl($value, $cast, t);
}

class DownloadedNotificationImageMapper
    extends ClassMapperBase<DownloadedNotificationImage> {
  DownloadedNotificationImageMapper._();

  static DownloadedNotificationImageMapper? _instance;
  static DownloadedNotificationImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = DownloadedNotificationImageMapper._());
      PushNotificationStateMapper.ensureInitialized();
      ServerImageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DownloadedNotificationImage';

  static ServerImage _$serverImage(DownloadedNotificationImage v) =>
      v.serverImage;
  static const Field<DownloadedNotificationImage, ServerImage> _f$serverImage =
      Field('serverImage', _$serverImage);

  @override
  final MappableFields<DownloadedNotificationImage> fields = const {
    #serverImage: _f$serverImage,
  };

  static DownloadedNotificationImage _instantiate(DecodingData data) {
    return DownloadedNotificationImage(serverImage: data.dec(_f$serverImage));
  }

  @override
  final Function instantiate = _instantiate;

  static DownloadedNotificationImage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DownloadedNotificationImage>(map);
  }

  static DownloadedNotificationImage fromJson(String json) {
    return ensureInitialized().decodeJson<DownloadedNotificationImage>(json);
  }
}

mixin DownloadedNotificationImageMappable {
  String toJson() {
    return DownloadedNotificationImageMapper.ensureInitialized()
        .encodeJson<DownloadedNotificationImage>(
            this as DownloadedNotificationImage);
  }

  Map<String, dynamic> toMap() {
    return DownloadedNotificationImageMapper.ensureInitialized()
        .encodeMap<DownloadedNotificationImage>(
            this as DownloadedNotificationImage);
  }

  DownloadedNotificationImageCopyWith<DownloadedNotificationImage,
          DownloadedNotificationImage, DownloadedNotificationImage>
      get copyWith => _DownloadedNotificationImageCopyWithImpl(
          this as DownloadedNotificationImage, $identity, $identity);
  @override
  String toString() {
    return DownloadedNotificationImageMapper.ensureInitialized()
        .stringifyValue(this as DownloadedNotificationImage);
  }

  @override
  bool operator ==(Object other) {
    return DownloadedNotificationImageMapper.ensureInitialized()
        .equalsValue(this as DownloadedNotificationImage, other);
  }

  @override
  int get hashCode {
    return DownloadedNotificationImageMapper.ensureInitialized()
        .hashValue(this as DownloadedNotificationImage);
  }
}

extension DownloadedNotificationImageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DownloadedNotificationImage, $Out> {
  DownloadedNotificationImageCopyWith<$R, DownloadedNotificationImage, $Out>
      get $asDownloadedNotificationImage => $base
          .as((v, t, t2) => _DownloadedNotificationImageCopyWithImpl(v, t, t2));
}

abstract class DownloadedNotificationImageCopyWith<
    $R,
    $In extends DownloadedNotificationImage,
    $Out> implements PushNotificationStateCopyWith<$R, $In, $Out> {
  ServerImageCopyWith<$R, ServerImage, ServerImage> get serverImage;
  @override
  $R call({ServerImage? serverImage});
  DownloadedNotificationImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DownloadedNotificationImageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DownloadedNotificationImage, $Out>
    implements
        DownloadedNotificationImageCopyWith<$R, DownloadedNotificationImage,
            $Out> {
  _DownloadedNotificationImageCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DownloadedNotificationImage> $mapper =
      DownloadedNotificationImageMapper.ensureInitialized();
  @override
  ServerImageCopyWith<$R, ServerImage, ServerImage> get serverImage =>
      $value.serverImage.copyWith.$chain((v) => call(serverImage: v));
  @override
  $R call({ServerImage? serverImage}) => $apply(
      FieldCopyWithData({if (serverImage != null) #serverImage: serverImage}));
  @override
  DownloadedNotificationImage $make(CopyWithData data) =>
      DownloadedNotificationImage(
          serverImage: data.get(#serverImage, or: $value.serverImage));

  @override
  DownloadedNotificationImageCopyWith<$R2, DownloadedNotificationImage, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DownloadedNotificationImageCopyWithImpl($value, $cast, t);
}

class SendingNotificationMapper extends ClassMapperBase<SendingNotification> {
  SendingNotificationMapper._();

  static SendingNotificationMapper? _instance;
  static SendingNotificationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SendingNotificationMapper._());
      PushNotificationStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SendingNotification';

  @override
  final MappableFields<SendingNotification> fields = const {};

  static SendingNotification _instantiate(DecodingData data) {
    return SendingNotification();
  }

  @override
  final Function instantiate = _instantiate;

  static SendingNotification fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SendingNotification>(map);
  }

  static SendingNotification fromJson(String json) {
    return ensureInitialized().decodeJson<SendingNotification>(json);
  }
}

mixin SendingNotificationMappable {
  String toJson() {
    return SendingNotificationMapper.ensureInitialized()
        .encodeJson<SendingNotification>(this as SendingNotification);
  }

  Map<String, dynamic> toMap() {
    return SendingNotificationMapper.ensureInitialized()
        .encodeMap<SendingNotification>(this as SendingNotification);
  }

  SendingNotificationCopyWith<SendingNotification, SendingNotification,
          SendingNotification>
      get copyWith => _SendingNotificationCopyWithImpl(
          this as SendingNotification, $identity, $identity);
  @override
  String toString() {
    return SendingNotificationMapper.ensureInitialized()
        .stringifyValue(this as SendingNotification);
  }

  @override
  bool operator ==(Object other) {
    return SendingNotificationMapper.ensureInitialized()
        .equalsValue(this as SendingNotification, other);
  }

  @override
  int get hashCode {
    return SendingNotificationMapper.ensureInitialized()
        .hashValue(this as SendingNotification);
  }
}

extension SendingNotificationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SendingNotification, $Out> {
  SendingNotificationCopyWith<$R, SendingNotification, $Out>
      get $asSendingNotification =>
          $base.as((v, t, t2) => _SendingNotificationCopyWithImpl(v, t, t2));
}

abstract class SendingNotificationCopyWith<$R, $In extends SendingNotification,
    $Out> implements PushNotificationStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SendingNotificationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SendingNotificationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SendingNotification, $Out>
    implements SendingNotificationCopyWith<$R, SendingNotification, $Out> {
  _SendingNotificationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SendingNotification> $mapper =
      SendingNotificationMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SendingNotification $make(CopyWithData data) => SendingNotification();

  @override
  SendingNotificationCopyWith<$R2, SendingNotification, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SendingNotificationCopyWithImpl($value, $cast, t);
}

class SentNotificationMapper extends ClassMapperBase<SentNotification> {
  SentNotificationMapper._();

  static SentNotificationMapper? _instance;
  static SentNotificationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SentNotificationMapper._());
      PushNotificationStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SentNotification';

  @override
  final MappableFields<SentNotification> fields = const {};

  static SentNotification _instantiate(DecodingData data) {
    return SentNotification();
  }

  @override
  final Function instantiate = _instantiate;

  static SentNotification fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SentNotification>(map);
  }

  static SentNotification fromJson(String json) {
    return ensureInitialized().decodeJson<SentNotification>(json);
  }
}

mixin SentNotificationMappable {
  String toJson() {
    return SentNotificationMapper.ensureInitialized()
        .encodeJson<SentNotification>(this as SentNotification);
  }

  Map<String, dynamic> toMap() {
    return SentNotificationMapper.ensureInitialized()
        .encodeMap<SentNotification>(this as SentNotification);
  }

  SentNotificationCopyWith<SentNotification, SentNotification, SentNotification>
      get copyWith => _SentNotificationCopyWithImpl(
          this as SentNotification, $identity, $identity);
  @override
  String toString() {
    return SentNotificationMapper.ensureInitialized()
        .stringifyValue(this as SentNotification);
  }

  @override
  bool operator ==(Object other) {
    return SentNotificationMapper.ensureInitialized()
        .equalsValue(this as SentNotification, other);
  }

  @override
  int get hashCode {
    return SentNotificationMapper.ensureInitialized()
        .hashValue(this as SentNotification);
  }
}

extension SentNotificationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SentNotification, $Out> {
  SentNotificationCopyWith<$R, SentNotification, $Out>
      get $asSentNotification =>
          $base.as((v, t, t2) => _SentNotificationCopyWithImpl(v, t, t2));
}

abstract class SentNotificationCopyWith<$R, $In extends SentNotification, $Out>
    implements PushNotificationStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SentNotificationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SentNotificationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SentNotification, $Out>
    implements SentNotificationCopyWith<$R, SentNotification, $Out> {
  _SentNotificationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SentNotification> $mapper =
      SentNotificationMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SentNotification $make(CopyWithData data) => SentNotification();

  @override
  SentNotificationCopyWith<$R2, SentNotification, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SentNotificationCopyWithImpl($value, $cast, t);
}
