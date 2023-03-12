//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'reservation_dto.g.dart';

/// ReservationDTO
///
/// Properties:
/// * [eventId] 
/// * [placeId] 
/// * [reservationToken] 
@BuiltValue()
abstract class ReservationDTO implements Built<ReservationDTO, ReservationDTOBuilder> {
  @BuiltValueField(wireName: r'eventId')
  int? get eventId;

  @BuiltValueField(wireName: r'placeId')
  int? get placeId;

  @BuiltValueField(wireName: r'reservationToken')
  String? get reservationToken;

  ReservationDTO._();

  factory ReservationDTO([void updates(ReservationDTOBuilder b)]) = _$ReservationDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReservationDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReservationDTO> get serializer => _$ReservationDTOSerializer();
}

class _$ReservationDTOSerializer implements PrimitiveSerializer<ReservationDTO> {
  @override
  final Iterable<Type> types = const [ReservationDTO, _$ReservationDTO];

  @override
  final String wireName = r'ReservationDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReservationDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.eventId != null) {
      yield r'eventId';
      yield serializers.serialize(
        object.eventId,
        specifiedType: const FullType(int),
      );
    }
    if (object.placeId != null) {
      yield r'placeId';
      yield serializers.serialize(
        object.placeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.reservationToken != null) {
      yield r'reservationToken';
      yield serializers.serialize(
        object.reservationToken,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReservationDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReservationDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'eventId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.eventId = valueDes;
          break;
        case r'placeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.placeId = valueDes;
          break;
        case r'reservationToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reservationToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReservationDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReservationDTOBuilder();
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

