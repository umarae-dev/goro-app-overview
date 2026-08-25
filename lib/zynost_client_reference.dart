library zynost_client_reference;

enum RunStatus { queued, running, completed, failed }

enum CheckoutStage {
  idle,
  awaitingWallet,
  awaitingSignature,
  submitted,
  confirmed,
  expired,
  failed,
}

class AnalysisRun {
  final String id;
  final String symbol;
  final RunStatus status;
  final bool ownerVerified;

  const AnalysisRun({
    required this.id,
    required this.symbol,
    required this.status,
    required this.ownerVerified,
  });

  bool get mayRenderResult => ownerVerified && status == RunStatus.completed;
}

class EvidenceItem {
  final String name;
  final String role;
  final String status;
  final String? stance;

  const EvidenceItem({
    required this.name,
    required this.role,
    required this.status,
    this.stance,
  });

  bool get isAvailable => status == 'available';
}

class CheckoutState {
  final String orderId;
  final int chainId;
  final CheckoutStage stage;
  final bool backendConfirmed;

  const CheckoutState({
    required this.orderId,
    required this.chainId,
    required this.stage,
    required this.backendConfirmed,
  });

  bool get isBnbSmartChain => chainId == 56;

  bool get mayGrantEntitlement =>
      backendConfirmed && stage == CheckoutStage.confirmed;

  CheckoutState moveTo(CheckoutStage next, {bool? backendConfirmed}) {
    if (!_allowed(stage, next)) {
      throw StateError('Invalid checkout transition: $stage -> $next');
    }
    return CheckoutState(
      orderId: orderId,
      chainId: chainId,
      stage: next,
      backendConfirmed: backendConfirmed ?? this.backendConfirmed,
    );
  }

  static bool _allowed(CheckoutStage from, CheckoutStage to) {
    const allowed = <CheckoutStage, Set<CheckoutStage>>{
      CheckoutStage.idle: {
        CheckoutStage.awaitingWallet,
        CheckoutStage.expired,
        CheckoutStage.failed,
      },
      CheckoutStage.awaitingWallet: {
        CheckoutStage.awaitingSignature,
        CheckoutStage.expired,
        CheckoutStage.failed,
      },
      CheckoutStage.awaitingSignature: {
        CheckoutStage.submitted,
        CheckoutStage.expired,
        CheckoutStage.failed,
      },
      CheckoutStage.submitted: {
        CheckoutStage.confirmed,
        CheckoutStage.expired,
        CheckoutStage.failed,
      },
      CheckoutStage.confirmed: {},
      CheckoutStage.expired: {},
      CheckoutStage.failed: {},
    };
    return allowed[from]!.contains(to);
  }
}

class PublicClientPolicy {
  const PublicClientPolicy();

  bool canTrustClientClaim({required bool serverVerified}) => serverVerified;

  String unavailableLabel(bool available) =>
      available ? 'available' : 'unavailable';
}
