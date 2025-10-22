import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:homework1/core/l10n/app_localization.dart';
import 'package:homework1/core/utils/app_colors.dart';
import 'package:homework1/router/name_routes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ButtonAndTextField extends StatefulWidget {
  const ButtonAndTextField({super.key, required this.isRegisteredBefore});

  final bool isRegisteredBefore;


  @override
  State<ButtonAndTextField> createState() => _ButtonAndTextFieldState();
}

class _ButtonAndTextFieldState extends State<ButtonAndTextField> {
  late bool isRegistratedBefore;
  bool dontshowOtp = true;
  String text = "";
  Color btn_color = AppColors.pressed_orange;
  final TextEditingController _pinController = TextEditingController();
  String currentPin = "";

  @override
  void initState() {
    super.initState();
    isRegistratedBefore = widget.isRegisteredBefore;
    _pinController.addListener(_onPinChanged);
  }

  void _onPinChanged() {
    currentPin = _pinController.text;
    if (currentPin.length == 4) {
      _handleOtpComplete(currentPin);
    }
  }

  final phoneMask = MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  @override
  void dispose() {
    _pinController.removeListener(_onPinChanged);
    _pinController.dispose();
    super.dispose();
  }
  void _handleOtpComplete(String otp) {
    if (otp.length == 4) {
      context.push(Routes.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: dontshowOtp ?
          Column(
            children: [
              TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [phoneMask],
                onChanged: (value) {
                  setState(() {
                    text = value;
                    btn_color = text.isNotEmpty
                        ? AppColors.orange
                        : AppColors.unpressable_orange;
                  });
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)?.translate("phone_number") ?? "Номер телефона",
                  hintStyle: TextStyle(
                    color: AppColors.dark_gray,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.5,
                    letterSpacing: 0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.border_color,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.border_color,
                      width: 1,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                ),
              ),


              SizedBox(height: 16),

              Container(
                width: double.infinity,
                height: 0.06 * MediaQuery
                    .of(context)
                    .size
                    .height,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      text = phoneMask.getUnmaskedText();
                      if (text.length== 9) {
                        if (!isRegistratedBefore) {
                          dontshowOtp = false;
                          isRegistratedBefore = true;
                        } else {
                          context.push(Routes.catalogue);
                        };
                      }
                    });
                  },
                  child: Text(
                    AppLocalizations.of(context)?.translate("continue") ?? "Продолжить",
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      letterSpacing: 0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: btn_color),
                ),
              )
            ],
          ) : Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            child: PinInputTextField(
              controller: _pinController,
              pinLength: 4,
              decoration: _buildCustomDecoration(),
              enabled: true,// is active or read - only mode
              autoFocus: true,
              keyboardType: TextInputType.number,
              // inputFormatters: [
              //   FilteringTextInputFormatter.digitsOnly,
              //   LengthLimitingTextInputFormatter(1)
              // ],
              onSubmit: _handleOtpComplete,
            ),
          )
        ),
      ],
    );
  }
}

PinDecoration _buildCustomDecoration() {
  return BoxLooseDecoration(
      strokeWidth: 1.0,
      gapSpace: 20,
      strokeColorBuilder: PinListenColorBuilder(
          AppColors.light_green,
          AppColors.dark_gray
      ),
      bgColorBuilder: FixedColorBuilder(AppColors.transparent),
      textStyle: TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        color: AppColors.dark_gray,
      ),
      // obscureStyle: ObscureStyle(
      //   isTextObscure: false,
      //   obscureText: "0",
      // )
  );
}
