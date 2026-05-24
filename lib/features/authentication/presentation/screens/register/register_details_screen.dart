import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/consts/location_data.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/authentication/data/models/register/register_details_model.dart';

import 'package:pharmacy_app/features/authentication/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/register/terms_and_conditions_row.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/register/location_drop_down.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/register/progress_bar.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/top_section.dart';

class RegisterDetailsScreen extends StatelessWidget {
  const RegisterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterDetailsBody());
  }
}

class RegisterDetailsBody extends StatefulWidget {
  const RegisterDetailsBody({super.key});

  @override
  State<RegisterDetailsBody> createState() => _RegisterDetailsBodyState();
}

class _RegisterDetailsBodyState extends State<RegisterDetailsBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController pharmacyNameController;
  late final TextEditingController addressController;
  late final TextEditingController pharmacyLicenseController;

  ValueNotifier<String?> selectedGovernorate = ValueNotifier(null);
  ValueNotifier<String?> selectedCity = ValueNotifier(null);
  ValueNotifier<bool> acceptedTerms = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    pharmacyNameController = TextEditingController();
    addressController = TextEditingController();
    pharmacyLicenseController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    pharmacyNameController.dispose();
    addressController.dispose();
    pharmacyLicenseController.dispose();
    selectedGovernorate.dispose();
    selectedCity.dispose();
    acceptedTerms.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();

      final govKey = selectedGovernorate.value;
      final cityKey = selectedCity.value;

      final govId = govKey == null
          ? null
          : LocationData.getGovernorateId(govKey);
      final cityId = (govKey == null || cityKey == null)
          ? null
          : LocationData.getCityId(govKey, cityKey);

      if (govId == null || cityId == null) {
        return;
      }
      debugPrint(
        "Governorate ID: $govId, City ID: $cityId ,firstName: ${firstNameController.text.trim()}, lastName: ${lastNameController.text.trim()}, phone: ${phoneController.text.trim()}, pharmacyName: ${pharmacyNameController.text.trim()}, address: ${addressController.text.trim()}, pharmacyLicense: ${pharmacyLicenseController.text.trim()}",
      );
      context.push(
        AppRoutesKeys.registerCredentials,
        extra: RegisterDetailsModel(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phoneNumber: phoneController.text.trim(),
          pharmacyName: pharmacyNameController.text.trim(),
          governorateId: govId,
          cityId: cityId,
          address: addressController.text.trim(),
          licenceNumber: pharmacyLicenseController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: context.pHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.vLg,

                TopSection(
                  icon: LucideIcons.pill,
                  title: context.tr.auth_signup_account_title,
                  subTitle: context.tr.auth_signup_subtitle2,
                ),

                context.vLg,
                ProgressBar(currentStep: 1, totalSteps: 2),
                context.vLg,

                // =========================
                // Names
                // =========================
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        onlyLetters: true,
                        prefixIcon: LucideIcons.user,
                        hintText: context.tr.first_name_hint,
                        labelText: context.tr.first_name_label,
                        controller: firstNameController,
                        validator: (value) {
                          return ValidatorsManager.firstNameValidator(
                            value,
                          )?.localizedMessage(context);
                        },
                      ),
                    ),
                    context.hLg,
                    Expanded(
                      child: CustomTextField(
                        onlyLetters: true,
                        prefixIcon: LucideIcons.user,
                        hintText: context.tr.last_name_hint,
                        labelText: context.tr.last_name_label,
                        controller: lastNameController,
                        validator: (value) {
                          return ValidatorsManager.lastNameValidator(
                            value,
                          )?.localizedMessage(context);
                        },
                      ),
                    ),
                  ],
                ),

                context.vLg,

                // =========================
                // Phone
                // =========================
                CustomTextField(
                  prefixIcon: LucideIcons.phone,
                  hintText: "0912345678",
                  labelText: context.tr.phone_label,
                  controller: phoneController,
                  onlyDigits: true,

                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return ValidatorsManager.phoneValidator(
                      value,
                    )?.localizedMessage(context);
                  },
                ),

                context.vLg,

                // =========================
                // Pharmacy
                // =========================
                CustomTextField(
                  prefixIcon: LucideIcons.building,
                  hintText: context.tr.pharmacy_name_hint,
                  labelText: context.tr.pharmacy_name_label,
                  controller: pharmacyNameController,
                  validator: (value) {
                    return ValidatorsManager.pharmacyNameValidator(
                      value,
                    )?.localizedMessage(context);
                  },
                ),

                context.vLg,

                // =========================
                // LOCATION
                // =========================
                Row(
                  children: [
                    Expanded(
                      child: ValueListenableBuilder<String?>(
                        valueListenable: selectedGovernorate,
                        builder: (context, governorate, _) {
                          return LocationDropDown(
                            label: context.tr.auth_governorate_label,
                            initialValue: governorate,
                            hint: context.tr.auth_governorate_label,
                            items: LocationData.getGovernorateKeys(),
                            isGovernorate: true,
                            enabled: true,
                            onChanged: (value) {
                              selectedGovernorate.value = value;
                              selectedCity.value = null;
                            },
                            validator: (value) {
                              return ValidatorsManager.governorateValidator(
                                value,
                              )?.localizedMessage(context);
                            },
                          );
                        },
                      ),
                    ),

                    context.hLg,

                    Expanded(
                      child: ValueListenableBuilder<String?>(
                        valueListenable: selectedGovernorate,
                        builder: (context, governorate, _) {
                          return ValueListenableBuilder<String?>(
                            valueListenable: selectedCity,
                            builder: (context, city, _) {
                              return LocationDropDown(
                                label: context.tr.auth_city_label,
                                initialValue: city,
                                hint: context.tr.auth_city_label,
                                items: governorate == null
                                    ? []
                                    : LocationData.getCitiesKeys(governorate),
                                isGovernorate: false,
                                governorateKey: governorate,
                                enabled: governorate != null,
                                onChanged: (value) {
                                  selectedCity.value = value;
                                },
                                validator: (value) {
                                  return ValidatorsManager.cityValidator(
                                    value,
                                  )?.localizedMessage(context);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                context.vLg,
                CustomTextField(
                  height: 80,
                  hintText: context.tr.detailed_address_hint,
                  labelText: context.tr.detailed_address_label,
                  controller: addressController,
                ),

                context.vLg,

                // =========================
                // Pharmacy License
                // =========================
                CustomTextField(
                  keyboardType: TextInputType.number,
                  onlyDigits: true,
                  prefixIcon: LucideIcons.fileText,
                  hintText: "123456789",
                  labelText: context.tr.pharmacy_license_label,
                  controller: pharmacyLicenseController,
                  validator: (value) {
                    return ValidatorsManager.pharmacyLicenseValidator(
                      value,
                    )?.localizedMessage(context);
                  },
                ),

                /// =========================
                /// Buttons Row
                /// =========================
                ///
                context.vMd,
                ValueListenableBuilder(
                  valueListenable: acceptedTerms,
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        TermsAndConditionsRow(
                          onPrivacyTap: () {},
                          onTermsTap: () {},
                          acceptedTerms: value,
                          onChanged: (newValue) {
                            acceptedTerms.value = newValue ?? false;
                          },
                        ),
                        context.vSm,
                        // ButtonsFooter(
                        //   onBack: () {
                        //     context.pop();
                        //   },
                        //   onContinue: value ? _onContinue : null,
                        // ),
                        CustomButton(
                          onTap: value ? _onContinue : null,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.tr.continue_btn,
                                style: context.text.labelLarge?.copyWith(
                                  color: context.colors.onPrimary,
                                ),
                              ),
                              context.hSm,
                              Icon(
                                size: 20,
                                Icons.arrow_forward,
                                color: context.colors.onPrimary,
                              ),
                            ],
                          ),
                        ),
                        context.vMd,
                        AuthPromptRow(
                          promptText: context.tr.already_have_account,
                          actionText: context.tr.auth_signin,
                          onPressed: () => context.pop(),
                        ),
                      ],
                    );
                  },
                ),

                context.vMd,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
