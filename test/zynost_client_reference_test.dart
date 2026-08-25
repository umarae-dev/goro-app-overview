import 'package:test/test.dart';
import 'package:zynost_client_public_reference/zynost_client_reference.dart';

void main() {
  test('client cannot grant entitlement without backend confirmation', () {
    const state = CheckoutState(
      orderId: 'example-order',
      chainId: 56,
      stage: CheckoutStage.submitted,
      backendConfirmed: false,
    );
    expect(state.mayGrantEntitlement, isFalse);
  });

  test('confirmed BNB checkout may grant entitlement', () {
    const state = CheckoutState(
      orderId: 'example-order',
      chainId: 56,
      stage: CheckoutStage.confirmed,
      backendConfirmed: true,
    );
    expect(state.isBnbSmartChain, isTrue);
    expect(state.mayGrantEntitlement, isTrue);
  });

  test('invalid checkout transition is rejected', () {
    const state = CheckoutState(
      orderId: 'example-order',
      chainId: 56,
      stage: CheckoutStage.idle,
      backendConfirmed: false,
    );
    expect(() => state.moveTo(CheckoutStage.confirmed), throwsStateError);
  });

  test('analysis result requires ownership and completion', () {
    const run = AnalysisRun(
      id: 'run-1',
      symbol: 'BNB',
      status: RunStatus.completed,
      ownerVerified: false,
    );
    expect(run.mayRenderResult, isFalse);
  });
}
