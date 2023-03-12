// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_organizer200_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginOrganizer200Response extends LoginOrganizer200Response {
  @override
  final String? sessionToken;

  factory _$LoginOrganizer200Response(
          [void Function(LoginOrganizer200ResponseBuilder)? updates]) =>
      (new LoginOrganizer200ResponseBuilder()..update(updates))._build();

  _$LoginOrganizer200Response._({this.sessionToken}) : super._();

  @override
  LoginOrganizer200Response rebuild(
          void Function(LoginOrganizer200ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginOrganizer200ResponseBuilder toBuilder() =>
      new LoginOrganizer200ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginOrganizer200Response &&
        sessionToken == other.sessionToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sessionToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginOrganizer200Response')
          ..add('sessionToken', sessionToken))
        .toString();
  }
}

class LoginOrganizer200ResponseBuilder
    implements
        Builder<LoginOrganizer200Response, LoginOrganizer200ResponseBuilder> {
  _$LoginOrganizer200Response? _$v;

  String? _sessionToken;
  String? get sessionToken => _$this._sessionToken;
  set sessionToken(String? sessionToken) => _$this._sessionToken = sessionToken;

  LoginOrganizer200ResponseBuilder() {
    LoginOrganizer200Response._defaults(this);
  }

  LoginOrganizer200ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessionToken = $v.sessionToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginOrganizer200Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginOrganizer200Response;
  }

  @override
  void update(void Function(LoginOrganizer200ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginOrganizer200Response build() => _build();

  _$LoginOrganizer200Response _build() {
    final _$result =
        _$v ?? new _$LoginOrganizer200Response._(sessionToken: sessionToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
