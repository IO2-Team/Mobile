//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_patch.g.dart';

/// EventPatch
///
/// Properties:
/// * [title] 
/// * [name] 
/// * [startTime] 
/// * [endTime] 
/// * [latitude] 
/// * [longitude] 
/// * [placeSchema] 
/// * [maxPlace] 
/// * [categoriesIds] 
@BuiltValue()
abstract class EventPatch implements Built<EventPatch, EventPatchBuilder> {
  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'startTime')
  int? get startTime;

  @BuiltValueField(wireName: r'endTime')
  int? get endTime;

  @BuiltValueField(wireName: r'latitude')
  String? get latitude;

  @BuiltValueField(wireName: r'longitude')
  String? get longitude;

  @BuiltValueField(wireName: r'placeSchema')
  String? get placeSchema;

  @BuiltValueField(wireName: r'maxPlace')
  int? get maxPlace;

  @BuiltValueField(wireName: r'categoriesIds')
  BuiltList<int>? get categoriesIds;

  EventPatch._();

  factory EventPatch([void updates(EventPatchBuilder b)]) = _$EventPatch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventPatchBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventPatch> get serializer => _$EventPatchSerializer();
}

class _$EventPatchSerializer implements PrimitiveSerializer<EventPatch> {
  @override
  final Iterable<Type> types = const [EventPatch, _$EventPatch];

  @override
  final String wireName = r'EventPatch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventPatch object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.startTime != null) {
      yield r'startTime';
      yield serializers.serialize(
        object.startTime,
        specifiedType: const FullType(int),
      );
    }
    if (object.endTime != null) {
      yield r'endTime';
      yield serializers.serialize(
        object.endTime,
        specifiedType: const FullType(int),
      );
    }
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(String),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(String),
      );
    }
    if (object.placeSchema != null) {
      yield r'placeSchema';
      yield serializers.serialize(
        object.placeSchema,
        specifiedType: const FullType(String),
      );
    }
    if (object.maxPlace != null) {
      yield r'maxPlace';
      yield serializers.serialize(
        object.maxPlace,
        specifiedType: const FullType(int),
      );
    }
    if (object.categoriesIds != null) {
      yield r'categoriesIds';
      yield serializers.serialize(
        object.categoriesIds,
        specifiedType: const FullType(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EventPatch object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventPatchBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'startTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.startTime = valueDes;
          break;
        case r'endTime':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.endTime = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.longitude = valueDes;
          break;
        case r'placeSchema':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.placeSchema = valueDes;
          break;
        case r'maxPlace':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxPlace = valueDes;
          break;
        case r'categoriesIds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.categoriesIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EventPatch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventPatchBuilder();
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

