String? ValidateName(value) {
  if (value!.isEmpty) {
    return 'Please enter name';
  }
}

String? ValidatePassword(value) {
  if (value!.isEmpty || value.length < 7) {
    return 'Please enter a valid password';
  }
}

String? ValidateEmail(value) {
  if (value!.isEmpty || !value.contains('@')) {
    return 'Please enter a vaild email';
  }
}
