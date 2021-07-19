// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final bool loginState;
  @override
  final int appLanguage;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.loginState, this.appLanguage}) : super._() {
    if (loginState == null) {
      throw new BuiltValueNullFieldError('AppState', 'loginState');
    }
    if (appLanguage == null) {
      throw new BuiltValueNullFieldError('AppState', 'appLanguage');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        loginState == other.loginState &&
        appLanguage == other.appLanguage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, loginState.hashCode), appLanguage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('loginState', loginState)
          ..add('appLanguage', appLanguage))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _loginState;
  bool get loginState => _$this._loginState;
  set loginState(bool loginState) => _$this._loginState = loginState;

  int _appLanguage;
  int get appLanguage => _$this._appLanguage;
  set appLanguage(int appLanguage) => _$this._appLanguage = appLanguage;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _loginState = _$v.loginState;
      _appLanguage = _$v.appLanguage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    final _$result = _$v ??
        new _$AppState._(loginState: loginState, appLanguage: appLanguage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
