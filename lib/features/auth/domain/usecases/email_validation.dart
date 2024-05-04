String? emailValidationUseCase(String email) {
  if(email.isEmpty) {
    return 'Please enter an email address';
  } 
  else if(!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
    return 'Please enter a valid email address';
  }
  return null;
}