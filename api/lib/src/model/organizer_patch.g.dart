// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_patch.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizerPatch extends OrganizerPatch {
  @override
  final String? name;
  @override
  final String? password;

  factory _$OrganizerPatch([void Function(OrganizerPatchBuilder)? updates]) =>
      (new OrganizerPatchBuilder()..update(updates))._build();

  _$OrganizerPatch._({this.name, this.password}) : super._();

  @override
  OrganizerPatch rebuild(void Function(OrganizerPatchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizerPatchBuilder toBuilder() =>
      new OrganizerPatchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizerPatch &&
        name == other.name &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizerPatch')
          ..add('name', name)
          ..add('password', password))
        .toString();
  }
}

class OrganizerPatchBuilder
    implements Builder<OrganizerPatch, OrganizerPatchBuilder> {
  _$OrganizerPatch? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  OrganizerPatchBuilder() {
    OrganizerPatch._defaults(this);
  }

  OrganizerPatchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizerPatch other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizerPatch;
  }

  @override
  void update(void Function(OrganizerPatchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizerPatch build() => _build();

  _$OrganizerPatch _build() {
    final _$result =
        _$v ?? new _$OrganizerPatch._(name: name, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
