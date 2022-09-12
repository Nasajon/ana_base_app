import 'package:flutter_core/flutter_core.dart';
import 'package:meutrabalhoapp/domain/domain.dart';
import 'package:meutrabalhoapp/services/auth/auth_notifier.dart';

import 'ana_home_state.dart';

/// [AnaHomeViewModel] allows you to listen to user homeentication state.
class AnaHomeViewModel extends ViewModel<AnaHomeState> {
  final AuthNotifier _authNotifier;

  ///  Create new instance of [AnaHomeViewModel]
  AnaHomeViewModel({required AuthNotifier authNotifier})
      : _authNotifier = authNotifier,
        super(AnaHomeState.initial());

  @override
  void initViewModel() {
    super.initViewModel();
  }

  /// Toggle the user home state
  Future<void> checkAndUpdateHomeStatus() async {
    _authNotifier.loadSession();
  }

  Future<bool> isLoggedIn() async {
    return Future.value(state.session != null);
  }

  Future<void> saveSession(Session session) async {
    _authNotifier.saveSession(session);
  }

  Future<void> loadSession() async {
    _authNotifier.loadSession();
  }
}
