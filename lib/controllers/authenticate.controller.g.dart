// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticateController on _AuthenticateControllerBase, Store {
  final _$currentUserAtom =
      Atom(name: '_AuthenticateControllerBase.currentUser');

  @override
  Data get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(Data value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_AuthenticateControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$currentNameAtom =
      Atom(name: '_AuthenticateControllerBase.currentName');

  @override
  String get currentName {
    _$currentNameAtom.context.enforceReadPolicy(_$currentNameAtom);
    _$currentNameAtom.reportObserved();
    return super.currentName;
  }

  @override
  set currentName(String value) {
    _$currentNameAtom.context.conditionallyRunInAction(() {
      super.currentName = value;
      _$currentNameAtom.reportChanged();
    }, _$currentNameAtom, name: '${_$currentNameAtom.name}_set');
  }

  final _$currentCPFAtom = Atom(name: '_AuthenticateControllerBase.currentCPF');

  @override
  String get currentCPF {
    _$currentCPFAtom.context.enforceReadPolicy(_$currentCPFAtom);
    _$currentCPFAtom.reportObserved();
    return super.currentCPF;
  }

  @override
  set currentCPF(String value) {
    _$currentCPFAtom.context.conditionallyRunInAction(() {
      super.currentCPF = value;
      _$currentCPFAtom.reportChanged();
    }, _$currentCPFAtom, name: '${_$currentCPFAtom.name}_set');
  }

  final _$currentEmailAtom =
      Atom(name: '_AuthenticateControllerBase.currentEmail');

  @override
  String get currentEmail {
    _$currentEmailAtom.context.enforceReadPolicy(_$currentEmailAtom);
    _$currentEmailAtom.reportObserved();
    return super.currentEmail;
  }

  @override
  set currentEmail(String value) {
    _$currentEmailAtom.context.conditionallyRunInAction(() {
      super.currentEmail = value;
      _$currentEmailAtom.reportChanged();
    }, _$currentEmailAtom, name: '${_$currentEmailAtom.name}_set');
  }

  final _$currentPasswordAtom =
      Atom(name: '_AuthenticateControllerBase.currentPassword');

  @override
  String get currentPassword {
    _$currentPasswordAtom.context.enforceReadPolicy(_$currentPasswordAtom);
    _$currentPasswordAtom.reportObserved();
    return super.currentPassword;
  }

  @override
  set currentPassword(String value) {
    _$currentPasswordAtom.context.conditionallyRunInAction(() {
      super.currentPassword = value;
      _$currentPasswordAtom.reportChanged();
    }, _$currentPasswordAtom, name: '${_$currentPasswordAtom.name}_set');
  }

  final _$tokenAtom = Atom(name: '_AuthenticateControllerBase.token');

  @override
  String get token {
    _$tokenAtom.context.enforceReadPolicy(_$tokenAtom);
    _$tokenAtom.reportObserved();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.context.conditionallyRunInAction(() {
      super.token = value;
      _$tokenAtom.reportChanged();
    }, _$tokenAtom, name: '${_$tokenAtom.name}_set');
  }

  final _$authenticateUserAsyncAction = AsyncAction('authenticateUser');

  @override
  Future authenticateUser(String cpf, String password, bool onBackgroundFetch) {
    return _$authenticateUserAsyncAction
        .run(() => super.authenticateUser(cpf, password, onBackgroundFetch));
  }

  final _$loadCurrentUserAsyncAction = AsyncAction('loadCurrentUser');

  @override
  Future<void> loadCurrentUser() {
    return _$loadCurrentUserAsyncAction.run(() => super.loadCurrentUser());
  }

  final _$_AuthenticateControllerBaseActionController =
      ActionController(name: '_AuthenticateControllerBase');

  @override
  dynamic clearCurrentUser() {
    final _$actionInfo =
        _$_AuthenticateControllerBaseActionController.startAction();
    try {
      return super.clearCurrentUser();
    } finally {
      _$_AuthenticateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentUser: ${currentUser.toString()},isLoading: ${isLoading.toString()},currentName: ${currentName.toString()},currentCPF: ${currentCPF.toString()},currentEmail: ${currentEmail.toString()},currentPassword: ${currentPassword.toString()},token: ${token.toString()}';
    return '{$string}';
  }
}
