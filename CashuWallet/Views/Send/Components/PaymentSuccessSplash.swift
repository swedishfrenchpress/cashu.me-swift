import SwiftUI

/// Full-screen success splash used as an overlay on top of the Lightning
/// invoice display (receive) and the pending-ecash display (send) so both
/// screens celebrate completion identically.
///
/// Designed as an overlay rather than a body-branch swap so it doesn't have
/// to participate in the parent view's transition system — the previous
/// implementation lost its entrance animation to a competing dismiss.
struct PaymentSuccessSplash: View {
    let title: String           // "Received" / "Claimed"
    let amountSats: UInt64
    let onDone: () -> Void

    @ObservedObject private var settings = SettingsManager.shared
    @State private var didLand = false

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 128, weight: .semibold))
                    .foregroundStyle(.green)
                    .symbolEffect(.bounce.up.byLayer, options: .repeat(2), value: didLand)
                    .accessibilityHidden(true)

                VStack(spacing: 10) {
                    Text(title)
                        .font(.footnote.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .textCase(.uppercase)
                        .tracking(1.4)

                    CurrencyAmountDisplay(
                        sats: amountSats,
                        primary: $settings.amountDisplayPrimary,
                        primarySize: 72
                    )
                }

                Spacer()

                Button(action: onDone) {
                    Text("Done")
                        .font(.body.weight(.semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.primary, in: Capsule())
                        .foregroundStyle(Color(.systemBackground))
                }
                .buttonStyle(.plain)
                .padding(.horizontal)
                .padding(.bottom, 16)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title) \(amountSats) sats")
        .onAppear {
            // Defer the bounce trigger one tick so SwiftUI registers the
            // value change after the view is on screen.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                didLand = true
            }
        }
    }
}
