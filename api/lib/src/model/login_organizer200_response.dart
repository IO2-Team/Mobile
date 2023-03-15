//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_organizer200_response.g.dart';

/// LoginOrganizer200Response
///
/// Properties:
/// * [sessionToken] - The session token.
@BuiltValue()
abstract class LoginOrganizer200Response implements Built<LoginOrganizer200Response, LoginOrganizer200ResponseBuilder> {
  /// The session token.
  @BuiltValueField(wireName: r'sessionToken')
  String? get sessionToken;

  LoginOrganizer200Response._();

  factory LoginOrganizer200Response([void updates(LoginOrganizer200ResponseBuilder b)]) = _$LoginOrganizer200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginOrganizer200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginOrganizer200Response> get serializer => _$LoginOrganizer200ResponseSerializer();
}

class _$LoginOrganizer200ResponseSerializer implements PrimitiveSerializer<LoginOrganizer200Response> {
  @override
  final Iterable<Type> types = const [LoginOrganizer200Response, _$LoginOrganizer200Response];

  @override
  final String wireName = r'LoginOrganizer200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginOrganizer200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.sessionToken != null) {
      yield r'sessionToken';
      yield serializers.serialize(
        object.sessionToken,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginOrganizer200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LoginOrganizer200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'sessionToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sessionToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginOrganizer200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginOrganizer200ResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

