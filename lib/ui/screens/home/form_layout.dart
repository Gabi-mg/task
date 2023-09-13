import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:task/common/utils.dart';
import 'package:task/core/extension/localizations.dart';
import 'package:task/core/theme/app_font_style.dart';
import 'package:task/ui/screens/home/bloc/contact_form/contact_form_bloc.dart';

class FormLayout extends StatelessWidget {
  const FormLayout({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateInput = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => GetIt.I<ContactFormBloc>(),
      child: BlocBuilder<ContactFormBloc, ContactFormState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                TextFormField(
                  onChanged: (value) {
                    context.read<ContactFormBloc>().add(NameChanged(value));
                  },
                  decoration: const InputDecoration().copyWith(
                    labelText: context.localizations.name,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: dateInput,
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) {
                    context
                        .read<ContactFormBloc>()
                        .add(BirthDateChanged(value));
                  },
                  decoration: const InputDecoration().copyWith(
                    labelText: context.localizations.birth_date,
                  ),
                  validator: (value) {
                    try {
                      final date = DateFormat('dd/MM/yyyy').parse(value!);
                      return null;
                    } catch (e) {
                      return context.localizations.date_not_valid;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    context.read<ContactFormBloc>().add(CityChanged(value));
                  },
                  decoration: const InputDecoration().copyWith(
                    labelText: context.localizations.city,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    context.read<ContactFormBloc>().add(EmailChanged(value));
                  },
                  decoration: const InputDecoration().copyWith(
                    labelText: context.localizations.email,
                  ),
                  validator: (value) {
                    if (!Utils.isValidEmail(value!)) {
                      return context.localizations.email_not_valid;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    context.read<ContactFormBloc>().add(PhoneChanged(value));
                  },
                  decoration: const InputDecoration().copyWith(
                    labelText: context.localizations.phone,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: state.isValid
                      ? () {
                          formKey.currentState!.validate();
                        }
                      : null,
                  child: Text(
                    context.localizations.send,
                    style: AppFontStyles.robotoWhite18w700,
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
