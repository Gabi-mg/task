part of 'contact_form_bloc.dart';

enum ContactFormStatus { initial, validate }

extension ContactFormStatusX on ContactFormStatus {
  bool get isInitial => this == ContactFormStatus.initial;
  bool get isValidate => this == ContactFormStatus.validate;
}

class ContactFormState extends Equatable {
  const ContactFormState({
    this.status = ContactFormStatus.initial,
    this.name = '',
    this.birtDate = '',
    this.city = '',
    this.email = '',
    this.phone = '',
    this.isValid = false,
  });

  final ContactFormStatus status;
  final String name;
  final String birtDate;
  final String city;
  final String email;
  final String phone;
  final bool isValid;

  @override
  List<Object> get props => [
        status,
        name,
        birtDate,
        city,
        email,
        phone,
        isValid,
      ];

  ContactFormState copyWith({
    ContactFormStatus? status,
    String? name,
    String? birtDate,
    String? city,
    String? email,
    String? phone,
    bool? isValid,
  }) {
    return ContactFormState(
      status: status ?? this.status,
      name: name ?? this.name,
      birtDate: birtDate ?? this.birtDate,
      city: city ?? this.city,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
    );
  }
}
