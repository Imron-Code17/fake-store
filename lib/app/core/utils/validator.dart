extension StringExt on String {
  bool hasRegexEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool passwordValidated() {
    return !RegExp(r"\s").hasMatch(this) && length >= 8;
  }
}

String? validatorText(String? value, String label, {double minChar = 0}) {
  if (value?.isEmpty ?? true) {
    return '$label tidak boleh kosong !';
  } else if (minChar > 0 && (value?.isNotEmpty ?? false)) {
    return '$label minimal harus $minChar karakter !';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  if (value?.isEmpty ?? true) {
    return 'Email tidak boleh kosong';
  } else {
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Email tidak valid'
        : null;
  }
}

String? validatePassword(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Password tidak boleh kosong !';
  } else if ((value?.length ?? 0) < 5) {
    return 'Password minimal harus 5 karakter !';
  } else {
    return null;
  }
}
