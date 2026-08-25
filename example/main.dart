import 'package:zynost_client_public_reference/zynost_client_reference.dart';

void main() {
  var checkout = const CheckoutState(
    orderId: 'demo-order',
    chainId: 56,
    stage: CheckoutStage.idle,
    backendConfirmed: false,
  );

  checkout = checkout.moveTo(CheckoutStage.awaitingWallet);
  checkout = checkout.moveTo(CheckoutStage.awaitingSignature);
  checkout = checkout.moveTo(CheckoutStage.submitted);
  checkout = checkout.moveTo(
    CheckoutStage.confirmed,
    backendConfirmed: true,
  );

  print('BNB Smart Chain: ${checkout.isBnbSmartChain}');
  print('Entitlement allowed: ${checkout.mayGrantEntitlement}');
}
