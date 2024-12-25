class ValidationRegex {
  static RegExp get mobilePhone => RegExp(r'^(?:[+0]9)?[0-9]{9}$');
  static RegExp get emailAddress => RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b');
  static RegExp get name => RegExp(r'[A-Za-zÀ-ÖØ-öø-ÿ]{2,}');
  static RegExp get lastName => name;
  static RegExp get polishPostalCode => RegExp(r'^\d{2}-\d{3}$');
  static RegExp get usPostalCode => RegExp(r'^\d{5}(-\d{4})?$');
  static RegExp get houseNumber =>
      RegExp(r'^\d+[a-zA-Z]?$', caseSensitive: false);
  static RegExp get flatNumber =>
      RegExp(r'^[\dA-Za-z-/]+$', caseSensitive: false);
  static RegExp get streetName =>
      RegExp(r'^[A-Za-z0-9\s.-]+$', caseSensitive: false);
  static RegExp get city => RegExp(r"^[A-Za-z\s.'-]+$", caseSensitive: false);
  static RegExp get password =>
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\w\s]).{8,16}$');
  static RegExp get mobilePin => RegExp(r'^\d{4}$');

  //Bank account numbers
  static RegExp get accountNrbForElixirTransfer => RegExp(r'^\d{26}$');
  static RegExp get accountNrbForExpressElixirTransfer =>
      accountNrbForElixirTransfer;
  static RegExp get accountNrbForSepaTransfer =>
      RegExp(r'^[A-Z]{2}\d{2}[A-Z0-9]{1,30}$');
  static RegExp get accountNrbForSwiftBicTransfer =>
      RegExp(r'^[A-Z]{6}[A-Z2-9]{2}([A-Z0-9]{3})?$');
}
