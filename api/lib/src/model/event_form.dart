//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'event_form.g.dart';

/// EventForm
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
abstract class EventForm implements Built<EventForm, EventFormBuilder> {
  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'startTime')
  int get startTime;

  @BuiltValueField(wireName: r'endTime')
  int get endTime;

  @BuiltValueField(wireName: r'latitude')
  String get latitude;

  @BuiltValueField(wireName: r'longitude')
  String get longitude;

  @BuiltValueField(wireName: r'placeSchema')
  String? get placeSchema;

  @BuiltValueField(wireName: r'maxPlace')
  int get maxPlace;

  @BuiltValueField(wireName: r'categoriesIds')
  BuiltList<int> get categoriesIds;

  EventForm._();

  factory EventForm([void updates(EventFormBuilder b)]) = _$EventForm;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EventFormBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EventForm> get serializer => _$EventFormSerializer();
}

class _$EventFormSerializer implements PrimitiveSerializer<EventForm> {
  @override
  final Iterable<Type> types = const [EventForm, _$EventForm];

  @override
  final String wireName = r'EventForm';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EventForm object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'startTime';
    yield serializers.serialize(
      object.startTime,
      specifiedType: const FullType(int),
    );
    yield r'endTime';
    yield serializers.serialize(
      object.endTime,
      specifiedType: const FullType(int),
    );
    yield r'latitude';
    yield serializers.serialize(
      object.latitude,
      specifiedType: const FullType(String),
    );
    yield r'longitude';
    yield serializers.serialize(
      object.longitude,
      specifiedType: const FullType(String),
    );
    if (object.placeSchema != null) {
      yield r'placeSchema';
      yield serializers.serialize(
        object.placeSchema,
        specifiedType: const FullType(String),
      );
    }
    yield r'maxPlace';
    yield serializers.serialize(
      object.maxPlace,
      specifiedType: const FullType(int),
    );
    yield r'categoriesIds';
    yield serializers.serialize(
      object.categoriesIds,
      specifiedType: const FullType(BuiltList, [FullType(int)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    EventForm object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EventFormBuilder result,
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
  EventForm deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EventFormBuilder();
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

