import 'package:flutter_core/presentation/presentation.dart';
import 'package:flutter_dependencies/flutter_dependencies.dart';
import 'package:meutrabalhoapp/domain/entities/session.dart';

part 'ana_home_state.freezed.dart';

/// Represents the authentication application state
@freezed
class AnaHomeState extends ViewModelState with _$AnaHomeState {
  const AnaHomeState._();

  /// Initializes global Home state as unauthenticated.
  const factory AnaHomeState({
    @Default('') String message,
    Session? session,
  }) = _AnaHomeState;

  factory AnaHomeState.initial() => const AnaHomeState();
}
