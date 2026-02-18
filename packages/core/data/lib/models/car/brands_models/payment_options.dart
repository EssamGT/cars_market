import 'package:constants/strings_manager.dart';

enum PaymentOptions { cash, cashOrInstallments, exchange, installments, none }

extension PaymentOptionsExtension on PaymentOptions {
  String get getText {
    switch (this) {
      case PaymentOptions.cash:
        return StringsManager.cashLabel;
      case PaymentOptions.cashOrInstallments:
        return StringsManager.cashOrInstallmentsLabel;
      case PaymentOptions.exchange:
        return StringsManager.exchangeLabel;
      case PaymentOptions.installments:
        return StringsManager.installmentLabel;
      case PaymentOptions.none:
        return StringsManager.nonePaymentLabel;
    }
  }
}
