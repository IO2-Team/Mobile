// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventForm extends EventForm {
  @override
  final String title;
  @override
  final String name;
  @override
  final int startTime;
  @override
  final int endTime;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String? placeSchema;
  @override
  final int maxPlace;
  @override
  final BuiltList<int> categoriesIds;

  factory _$EventForm([void Function(EventFormBuilder)? updates]) =>
      (new EventFormBuilder()..update(updates))._build();

  _$EventForm._(
      {required this.title,
      required this.name,
      required this.startTime,
      required this.endTime,
      required this.latitude,
      required this.longitude,
      this.placeSchema,
      required this.maxPlace,
      required this.categoriesIds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'EventForm', 'title');
    BuiltValueNullFieldError.checkNotNull(name, r'EventForm', 'name');
    BuiltValueNullFieldError.checkNotNull(startTime, r'EventForm', 'startTime');
    BuiltValueNullFieldError.checkNotNull(endTime, r'EventForm', 'endTime');
    BuiltValueNullFieldError.checkNotNull(latitude, r'EventForm', 'latitude');
    BuiltValueNullFieldError.checkNotNull(longitude, r'EventForm', 'longitude');
    BuiltValueNullFieldError.checkNotNull(maxPlace, r'EventForm', 'maxPlace');
    BuiltValueNullFieldError.checkNotNull(
        categoriesIds, r'EventForm', 'categoriesIds');
  }

  @override
  EventForm rebuild(void Function(EventFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventFormBuilder toBuilder() => new EventFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventForm &&
        title == other.title &&
        name == other.name &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        placeSchema == other.placeSchema &&
        maxPlace == other.maxPlace &&
        categoriesIds == other.categoriesIds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, placeSchema.hashCode);
    _$hash = $jc(_$hash, maxPlace.hashCode);
    _$hash = $jc(_$hash, categoriesIds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EventForm')
          ..add('title', title)
          ..add('name', name)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('placeSchema', placeSchema)
          ..add('maxPlace', maxPlace)
          ..add('categoriesIds', categoriesIds))
        .toString();
  }
}

class EventFormBuilder implements Builder<EventForm, EventFormBuilder> {
  _$EventForm? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _startTime;
  int? get startTime => _$this._startTime;
  set startTime(int? startTime) => _$this._startTime = startTime;

  int? _endTime;
  int? get endTime => _$this._endTime;
  set endTime(int? endTime) => _$this._endTime = endTime;

  String? _latitude;
  String? get latitude => _$this._latitude;
  set latitude(String? latitude) => _$this._latitude = latitude;

  String? _longitude;
  String? get longitude => _$this._longitude;
  set longitude(String? longitude) => _$this._longitude = longitude;

  String? _placeSchema;
  String? get placeSchema => _$this._placeSchema;
  set placeSchema(String? placeSchema) => _$this._placeSchema = placeSchema;

  int? _maxPlace;
  int? get maxPlace => _$this._maxPlace;
  set maxPlace(int? maxPlace) => _$this._maxPlace = maxPlace;

  ListBuilder<int>? _categoriesIds;
  ListBuilder<int> get categoriesIds =>
      _$this._categoriesIds ??= new ListBuilder<int>();
  set categoriesIds(ListBuilder<int>? categoriesIds) =>
      _$this._categoriesIds = categoriesIds;

  EventFormBuilder() {
    EventForm._defaults(this);
  }

  EventFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _name = $v.name;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _placeSchema = $v.placeSchema;
      _maxPlace = $v.maxPlace;
      _categoriesIds = $v.categoriesIds.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventForm;
  }

  @override
  void update(void Function(EventFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventForm build() => _build();

  _$EventForm _build() {
    _$EventForm _$result;
    try {
      _$result = _$v ??
          new _$EventForm._(
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'EventForm', 'title'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'EventForm', 'name'),
              startTime: BuiltValueNullFieldError.checkNotNull(
                  startTime, r'EventForm', 'startTime'),
              endTime: BuiltValueNullFieldError.checkNotNull(
                  endTime, r'EventForm', 'endTime'),
              latitude: BuiltValueNullFieldError.checkNotNull(
                  latitude, r'EventForm', 'latitude'),
              longitude: BuiltValueNullFieldError.checkNotNull(
                  longitude, r'EventForm', 'longitude'),
              placeSchema: placeSchema,
              maxPlace: BuiltValueNullFieldError.checkNotNull(
                  maxPlace, r'EventForm', 'maxPlace'),
              categoriesIds: categoriesIds.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoriesIds';
        categoriesIds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
