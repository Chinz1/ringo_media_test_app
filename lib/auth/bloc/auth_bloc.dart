import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Define events
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {}

// Define states
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  final String email;
  final String password;

  LoginInitial({this.email = '', this.password = ''});

  @override
  List<Object> get props => [email, password];
}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}

// Define the BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = event.email;
    final password = (state as LoginInitial).password;
    emit(LoginInitial(email: email, password: password));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    final email = (state as LoginInitial).email;
    emit(LoginInitial(email: email, password: password));
  }

  Stream<LoginState> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async* {
    yield LoginInProgress();
    await Future.delayed(Duration(seconds: 1));
    // Simulate login process and emit appropriate state
    yield LoginSuccess(); // or yield LoginFailure('Error message');
  }
}
