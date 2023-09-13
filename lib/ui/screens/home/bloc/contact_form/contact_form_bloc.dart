import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_form_event.dart';
part 'contact_form_state.dart';

class ContactFormBloc extends Bloc<ContactFormEvent, ContactFormState> {
  ContactFormBloc() : super(const ContactFormState()) {
    on<NameChanged>(_onNameChanged);
    on<BirthDateChanged>(_onBirthDateChanged);
    on<CityChanged>(_onCityChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PhoneChanged>(_onPhoneChanged);
  }

  void _onNameChanged(
    NameChanged event,
    Emitter<ContactFormState> emit,
  ) {
    final isValid = _isValid(
      event.name,
      state.birtDate,
      state.city,
      state.email,
      state.phone,
    );

    emit(
      state.copyWith(
        status: ContactFormStatus.validate,
        name: event.name,
        isValid: isValid,
      ),
    );
  }

  void _onBirthDateChanged(
    BirthDateChanged event,
    Emitter<ContactFormState> emit,
  ) {
    final isValid = _isValid(
      state.name,
      event.birtDate,
      state.city,
      state.email,
      state.phone,
    );

    emit(
      state.copyWith(
        status: ContactFormStatus.validate,
        birtDate: event.birtDate,
        isValid: isValid,
      ),
    );
  }

  void _onCityChanged(
    CityChanged event,
    Emitter<ContactFormState> emit,
  ) {
    final isValid = _isValid(
      state.name,
      state.birtDate,
      event.city,
      state.email,
      state.phone,
    );

    emit(
      state.copyWith(
        status: ContactFormStatus.validate,
        city: event.city,
        isValid: isValid,
      ),
    );
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<ContactFormState> emit,
  ) {
    final isValid = _isValid(
      state.name,
      state.birtDate,
      state.city,
      event.email,
      state.phone,
    );

    emit(
      state.copyWith(
        status: ContactFormStatus.validate,
        email: event.email,
        isValid: isValid,
      ),
    );
  }

  void _onPhoneChanged(
    PhoneChanged event,
    Emitter<ContactFormState> emit,
  ) {
    final isValid = _isValid(
      state.name,
      state.birtDate,
      state.city,
      state.email,
      event.phone,
    );

    emit(
      state.copyWith(
        status: ContactFormStatus.validate,
        phone: event.phone,
        isValid: isValid,
      ),
    );
  }

  bool _isValid(
    String name,
    String birtDate,
    String city,
    String email,
    String phone,
  ) {
    if (name.isNotEmpty &&
        birtDate.isNotEmpty &&
        city.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty) {
      return true;
    }

    return false;
  }
}
