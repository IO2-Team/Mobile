// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReservationDTO extends ReservationDTO {
  @override
  final int eventId;
  @override
  final int placeId;
  @override
  final String reservationToken;

  factory _$ReservationDTO([void Function(ReservationDTOBuilder)? updates]) =>
      (new ReservationDTOBuilder()..update(updates))._build();

  _$ReservationDTO._(
      {required this.eventId,
      required this.placeId,
      required this.reservationToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        eventId, r'ReservationDTO', 'eventId');
    BuiltValueNullFieldError.checkNotNull(
        placeId, r'ReservationDTO', 'placeId');
    BuiltValueNullFieldError.checkNotNull(
        reservationToken, r'ReservationDTO', 'reservationToken');
  }

  @override
  ReservationDTO rebuild(void Function(ReservationDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReservationDTOBuilder toBuilder() =>
      new ReservationDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReservationDTO &&
        eventId == other.eventId &&
        placeId == other.placeId &&
        reservationToken == other.reservationToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, eventId.hashCode);
    _$hash = $jc(_$hash, placeId.hashCode);
    _$hash = $jc(_$hash, reservationToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReservationDTO')
          ..add('eventId', eventId)
          ..add('placeId', placeId)
          ..add('reservationToken', reservationToken))
        .toString();
  }
}

class ReservationDTOBuilder
    implements Builder<ReservationDTO, ReservationDTOBuilder> {
  _$ReservationDTO? _$v;

  int? _eventId;
  int? get eventId => _$this._eventId;
  set eventId(int? eventId) => _$this._eventId = eventId;

  int? _placeId;
  int? get placeId => _$this._placeId;
  set placeId(int? placeId) => _$this._placeId = placeId;

  String? _reservationToken;
  String? get reservationToken => _$this._reservationToken;
  set reservationToken(String? reservationToken) =>
      _$this._reservationToken = reservationToken;

  ReservationDTOBuilder() {
    ReservationDTO._defaults(this);
  }

  ReservationDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventId = $v.eventId;
      _placeId = $v.placeId;
      _reservationToken = $v.reservationToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReservationDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReservationDTO;
  }

  @override
  void update(void Function(ReservationDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReservationDTO build() => _build();

  _$ReservationDTO _build() {
    final _$result = _$v ??
        new _$ReservationDTO._(
            eventId: BuiltValueNullFieldError.checkNotNull(
                eventId, r'ReservationDTO', 'eventId'),
            placeId: BuiltValueNullFieldError.checkNotNull(
                placeId, r'ReservationDTO', 'placeId'),
            reservationToken: BuiltValueNullFieldError.checkNotNull(
                reservationToken, r'ReservationDTO', 'reservationToken'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
