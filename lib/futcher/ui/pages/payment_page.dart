import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:redturant_app/futcher/ui/pages/show_dilog.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_batton.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // 🔷 إعدادات الـ Borders المعاد استخدامها
  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Details"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      resizeToAvoidBottomInset: true, // يمنع تداخل لوحة المفاتيح مع الواجهة
      body: SafeArea(
        child: Column(
          children: [
            // البطاقة التي تتحدث بناءً على الإدخال
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              isHolderNameVisible: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {
                // يمكن استخدامه لتغيير تصميم الواجهة بناءً على نوع البطاقة (Visa, MasterCard, etc.)
              },
            ),

            // الفورم
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      onCreditCardModelChange: (CreditCardModel data) {
                        setState(() {
                          cardNumber = data.cardNumber;
                          expiryDate = data.expiryDate;
                          cardHolderName = data.cardHolderName;
                          cvvCode = data.cvvCode;
                          isCvvFocused = data.isCvvFocused;
                        });
                      },
                      // 👇 هنا التعديل الرئيسي: استخدام inputConfiguration
                      inputConfiguration: InputConfiguration(
                        cardNumberDecoration: InputDecoration(
                          labelText: 'Card Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          border: _border,
                          focusedBorder: _border.copyWith(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 1.6,
                            ),
                          ),
                        ),
                        expiryDateDecoration: InputDecoration(
                          labelText: 'Expiry Date',
                          hintText: 'MM/YY',
                          border: _border,
                          focusedBorder: _border.copyWith(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 1.6,
                            ),
                          ),
                        ),
                        cvvCodeDecoration: InputDecoration(
                          labelText: 'CVV',
                          hintText: 'XXX',
                          border: _border,
                          focusedBorder: _border.copyWith(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 1.6,
                            ),
                          ),
                        ),
                        cardHolderDecoration: InputDecoration(
                          labelText: 'Card Holder',
                          border: _border,
                          focusedBorder: _border.copyWith(
                            borderSide: const BorderSide(
                              color: Colors.deepPurple,
                              width: 1.6,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // زر تأكيد الدفع
                    CustomButton(
                      text: 'Confirm Order ✅',
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          showSuccessDialog(context);
                        } else {
                           ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete card data')),
      );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
