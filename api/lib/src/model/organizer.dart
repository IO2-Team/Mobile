//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organizer.g.dart';

/// Organizer
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [email] 
/// * [status] - User Status
@BuiltValue()
abstract class Organizer implements Built<Organizer, OrganizerBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'email')
  String get email;

  /// User Status
  @BuiltValueField(wireName: r'status')
  OrganizerStatusEnum get status;
  // enum statusEnum {  pending,  confirmed,  };

  Organizer._();

  factory Organizer([void updates(OrganizerBuilder b)]) = _$Organizer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganizerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Organizer> get serializer => _$OrganizerSerializer();
}

class _$OrganizerSerializer implements PrimitiveSerializer<Organizer> {
  @override
  final Iterable<Type> types = const [Organizer, _$Organizer];

  @override
  final String wireName = r'Organizer';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Organizer object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(OrganizerStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Organizer object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganizerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OrganizerStatusEnum),
          ) as OrganizerStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Organizer deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganizerBuilder();
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

class OrganizerStatusEnum extends EnumClass {

  /// User Status
  @BuiltValueEnumConst(wireName: r'pending')
  static const OrganizerStatusEnum pending = _$organizerStatusEnum_pending;
  /// User Status
  @BuiltValueEnumConst(wireName: r'confirmed')
  static const OrganizerStatusEnum confirmed = _$organizerStatusEnum_confirmed;

  static Serializer<OrganizerStatusEnum> get serializer => _$organizerStatusEnumSerializer;

  const OrganizerStatusEnum._(String name): super(name);

  static BuiltSet<OrganizerStatusEnum> get values => _$organizerStatusEnumValues;
  static OrganizerStatusEnum valueOf(String name) => _$organizerStatusEnumValueOf(name);
}

