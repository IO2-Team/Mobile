// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Event extends Event {
  @override
  final int id;
  @override
  final String? title;
  @override
  final int? startTime;
  @override
  final int? endTime;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  final String? name;
  @override
  final String? placeSchema;
  @override
  final EventStatus? status;
  @override
  final BuiltList<Category>? categories;
  @override
  final int? freePlace;
  @override
  final int? maxPlace;
  @override
  final BuiltList<Place>? places;

  factory _$Event([void Function(EventBuilder)? updates]) =>
      (new EventBuilder()..update(updates))._build();

  _$Event._(
      {required this.id,
      this.title,
      this.startTime,
      this.endTime,
      this.latitude,
      this.longitude,
      this.name,
      this.placeSchema,
      this.status,
      this.categories,
      this.freePlace,
      this.maxPlace,
      this.places})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Event', 'id');
  }

  @override
  Event rebuild(void Function(EventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventBuilder toBuilder() => new EventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Event &&
        id == other.id &&
        title == other.title &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        name == other.name &&
        placeSchema == other.placeSchema &&
        status == other.status &&
        categories == other.categories &&
        freePlace == other.freePlace &&
        maxPlace == other.maxPlace &&
        places == other.places;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, startTime.hashCode);
    _$hash = $jc(_$hash, endTime.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, placeSchema.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, freePlace.hashCode);
    _$hash = $jc(_$hash, maxPlace.hashCode);
    _$hash = $jc(_$hash, places.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Event')
          ..add('id', id)
          ..add('title', title)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('latitude', latitude)
          ..add('longitude', longitude)
          ..add('name', name)
          ..add('placeSchema', placeSchema)
          ..add('status', status)
          ..add('categories', categories)
          ..add('freePlace', freePlace)
          ..add('maxPlace', maxPlace)
          ..add('places', places))
        .toString();
  }
}

class EventBuilder implements Builder<Event, EventBuilder> {
  _$Event? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

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

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _placeSchema;
  String? get placeSchema => _$this._placeSchema;
  set placeSchema(String? placeSchema) => _$this._placeSchema = placeSchema;

  EventStatus? _status;
  EventStatus? get status => _$this._status;
  set status(EventStatus? status) => _$this._status = status;

  ListBuilder<Category>? _categories;
  ListBuilder<Category> get categories =>
      _$this._categories ??= new ListBuilder<Category>();
  set categories(ListBuilder<Category>? categories) =>
      _$this._categories = categories;

  int? _freePlace;
  int? get freePlace => _$this._freePlace;
  set freePlace(int? freePlace) => _$this._freePlace = freePlace;

  int? _maxPlace;
  int? get maxPlace => _$this._maxPlace;
  set maxPlace(int? maxPlace) => _$this._maxPlace = maxPlace;

  ListBuilder<Place>? _places;
  ListBuilder<Place> get places => _$this._places ??= new ListBuilder<Place>();
  set places(ListBuilder<Place>? places) => _$this._places = places;

  EventBuilder() {
    Event._defaults(this);
  }

  EventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _latitude = $v.latitude;
      _longitude = $v.longitude;
      _name = $v.name;
      _placeSchema = $v.placeSchema;
      _status = $v.status;
      _categories = $v.categories?.toBuilder();
      _freePlace = $v.freePlace;
      _maxPlace = $v.maxPlace;
      _places = $v.places?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Event other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Event;
  }

  @override
  void update(void Function(EventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Event build() => _build();

  _$Event _build() {
    _$Event _$result;
    try {
      _$result = _$v ??
          new _$Event._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Event', 'id'),
              title: title,
              startTime: startTime,
              endTime: endTime,
              latitude: latitude,
              longitude: longitude,
              name: name,
              placeSchema: placeSchema,
              status: status,
              categories: _categories?.build(),
              freePlace: freePlace,
              maxPlace: maxPlace,
              places: _places?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();

        _$failedField = 'places';
        _places?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Event', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
