// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_patch.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventPatch extends EventPatch {
  @override
  final String? title;
  @override
  final String? name;
  @override
  final int? startTime;
  @override
  final int? endTime;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  final String? placeSchema;
  @override
  final int? maxPlace;
  @override
  final BuiltList<int>? categoriesIds;

  factory _$EventPatch([void Function(EventPatchBuilder)? updates]) =>
      (new EventPatchBuilder()..update(updates))._build();

  _$EventPatch._(
      {this.title,
      this.name,
      this.startTime,
      this.endTime,
      this.latitude,
      this.longitude,
      this.placeSchema,
      this.maxPlace,
      this.categoriesIds})
      : super._();

  @override
  EventPatch rebuild(void Function(EventPatchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventPatchBuilder toBuilder() => new EventPatchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventPatch &&
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
    return (newBuiltValueToStringHelper(r'EventPatch')
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

class EventPatchBuilder implements Builder<EventPatch, EventPatchBuilder> {
  _$EventPatch? _$v;

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

  EventPatchBuilder() {
    EventPatch._defaults(this);
  }

  EventPatchBuilder get _$this {
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
      _categoriesIds = $v.categoriesIds?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventPatch other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventPatch;
  }

  @override
  void update(void Function(EventPatchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventPatch build() => _build();

  _$EventPatch _build() {
    _$EventPatch _$result;
    try {
      _$result = _$v ??
          new _$EventPatch._(
              title: title,
              name: name,
              startTime: startTime,
              endTime: endTime,
              latitude: latitude,
              longitude: longitude,
              placeSchema: placeSchema,
              maxPlace: maxPlace,
              categoriesIds: _categoriesIds?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categoriesIds';
        _categoriesIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EventPatch', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
