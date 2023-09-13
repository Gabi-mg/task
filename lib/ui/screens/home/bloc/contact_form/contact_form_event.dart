part of 'contact_form_bloc.dart';

abstract class ContactFormEvent extends Equatable {
  const ContactFormEvent();
}

class NameChanged extends ContactFormEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class BirthDateChanged extends ContactFormEvent {
  const BirthDateChanged(this.birtDate);

  final int birtDate;

  @override
  List<Object> get props => [birtDate];
}

class CityChanged extends ContactFormEvent {
  const CityChanged(this.city);

  final String city;

  @override
  List<Object> get props => [city];
}

class EmailChanged extends ContactFormEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class PhoneChanged extends ContactFormEvent {
  const PhoneChanged(this.phone);

  final String phone;

  @override
  List<Object?> get props => [phone];
}
