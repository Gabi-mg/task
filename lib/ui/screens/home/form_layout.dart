import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:task/common/utils.dart';
import 'package:task/core/extension/locale.dart';
import 'package:task/core/extension/localizations.dart';
import 'package:task/core/theme/app_font_style.dart';
import 'package:task/ui/screens/home/bloc/contact_form/contact_form_bloc.dart';

class FormLayout extends StatefulWidget {
  const FormLayout({super.key});

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  final TextEditingController _dateInput = TextEditingController();

  @override
  void dispose() {
    _dateInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: _dateInput,
                  readOnly: true,
                  canRequestFocus: false,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null && context.mounted) {
                      _dateInput.text = Utils.convertDateWithoutHour(
                        date.millisecondsSinceEpoch,
                        context.locale.languageCode,
                      );

                      context.read<ContactFormBloc>().add(
                            BirthDateChanged(
                              date.millisecondsSinceEpoch,
                            ),
                          );
                    }
                  },
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) {},
                  decoration: const InputDecoration().copyWith(
                    labelText: context.localizations.birth_date,
                  ),
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
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(context.localizations.valid_form),
                              ),
                            );
                          }
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
