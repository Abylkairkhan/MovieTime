String? usernameValidationUseCase(String username) {
  if(username.isEmpty) {
    return 'Please enter username';
  }
  else if (username.length < 3) {
    return 'Your username should contain at least 3 characters';
  }
  return null;
}