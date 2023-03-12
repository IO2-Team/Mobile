// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EventStatus _$inFuture = const EventStatus._('inFuture');
const EventStatus _$pending = const EventStatus._('pending');
const EventStatus _$done = const EventStatus._('done');
const EventStatus _$cancelled = const EventStatus._('cancelled');

EventStatus _$valueOf(String name) {
  switch (name) {
    case 'inFuture':
      return _$inFuture;
    case 'pending':
      return _$pending;
    case 'done':
      return _$done;
    case 'cancelled':
      return _$cancelled;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EventStatus> _$values =
    new BuiltSet<EventStatus>(const <EventStatus>[
  _$inFuture,
  _$pending,
  _$done,
  _$cancelled,
]);

class _$EventStatusMeta {
  const _$EventStatusMeta();
  EventStatus get inFuture => _$inFuture;
  EventStatus get pending => _$pending;
  EventStatus get done => _$done;
  EventStatus get cancelled => _$cancelled;
  EventStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<EventStatus> get values => _$values;
}

abstract class _$EventStatusMixin {
  // ignore: non_constant_identifier_names
  _$EventStatusMeta get EventStatus => const _$EventStatusMeta();
}

Serializer<EventStatus> _$eventStatusSerializer = new _$EventStatusSerializer();

class _$EventStatusSerializer implements PrimitiveSerializer<EventStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'inFuture': 'inFuture',
    'pending': 'pending',
    'done': 'done',
    'cancelled': 'cancelled',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'inFuture': 'inFuture',
    'pending': 'pending',
    'done': 'done',
    'cancelled': 'cancelled',
  };

  @override
  final Iterable<Type> types = const <Type>[EventStatus];
  @override
  final String wireName = 'EventStatus';

  @override
  Object serialize(Serializers serializers, EventStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EventStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EventStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
