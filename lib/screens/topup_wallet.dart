import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/l10n/app_localizations.dart';
import 'package:testing/screens/payment.dart';
import 'package:testing/utilities/constants.dart';
import 'package:testing/widgets/footer.dart';
import 'package:testing/widgets/header.dart';

class TopupWallet extends StatefulWidget {
  const TopupWallet({super.key});

  @override
  State<TopupWallet> createState() => _TopupWalletState();
}

class _TopupWalletState extends State<TopupWallet> {
  final TextEditingController _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isContinueEnabled = false;

  @override
  void initState() {
    super.initState();
    _mobileController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isContinueEnabled = _mobileController.text.length == 9;
    });
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.33,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.enterMobileNumber,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.mobileNumber,
                            prefixText: '+971 ',
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: buttonBgColor,
                              ),
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(9),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter mobile number';
                            }
                            if (value.length != 9) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                        ),
                        // const SizedBox(height: 24),
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: 50,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       if (_formKey.currentState!.validate()) {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) =>
                        //                   const PaymentScreen(),
                        //             ));
                        //       }
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: Theme.of(context).primaryColor,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //     ),
                        //     child: const Text(
                        //       'Continue to Payment',
                        //       style: TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w600,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Footer(
              onBackPressed: () {
                Navigator.pop(context);
              },
              onContinuePressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      ));
                }
              },
              isContinueEnabled: _isContinueEnabled,
            )
          ],
        ),
      ),
    );
  }
}
