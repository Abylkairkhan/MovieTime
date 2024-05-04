String? passwordValidationUseCase(String password){
  if(password.isEmpty) {
    return 'Please enter password';
  } 
  else if(password.length < 8) {
    return 'Youre password should contain at least 8 characters';
  }
  else if(!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(password)) {
    return 'Your password should contain at least one uppercase letter, one lowercase letter, and one digit';
  }
  return null;
}