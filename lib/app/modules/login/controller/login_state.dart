

part of 'login_controller_cubit.dart';

enum LoginStatus{initial, loading, erro, sucesse}

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;

  const LoginState._({
    required this.status,
    this.errorMessage,
  });

  const LoginState.initial() : this._(status: LoginStatus.initial);

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

   @override
  List<Object?> get props => [status, errorMessage];
}
