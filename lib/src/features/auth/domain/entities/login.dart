import 'package:equatable/equatable.dart';




class Login extends Equatable {
  
  const Login({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  @override
  List<Object> get props => [
        email,
        
      ];
}
