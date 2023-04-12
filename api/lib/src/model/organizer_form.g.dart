// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizer_form.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizerForm extends OrganizerForm {
  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  factory _$OrganizerForm([void Function(OrganizerFormBuilder)? updates]) =>
      (new OrganizerFormBuilder()..update(updates))._build();

  _$OrganizerForm._(
      {required this.name, required this.email, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'OrganizerForm', 'name');
    BuiltValueNullFieldError.checkNotNull(email, r'OrganizerForm', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'OrganizerForm', 'password');
  }

  @override
  OrganizerForm rebuild(void Function(OrganizerFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizerFormBuilder toBuilder() => new OrganizerFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizerForm &&
        name == other.name &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizerForm')
          ..add('name', name)
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class OrganizerFormBuilder
    implements Builder<OrganizerForm, OrganizerFormBuilder> {
  _$OrganizerForm? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  OrganizerFormBuilder() {
    OrganizerForm._defaults(this);
  }

  OrganizerFormBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizerForm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizerForm;
  }

  @override
  void update(void Function(OrganizerFormBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizerForm build() => _build();

  _$OrganizerForm _build() {
    final _$result = _$v ??
        new _$OrganizerForm._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'OrganizerForm', 'name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'OrganizerForm', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'OrganizerForm', 'password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
