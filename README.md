# Solana Pay QR generator

Unofficial QR code generator for Solana Pay based on
the [official specification](https://github.com/solana-labs/solana-pay/blob/master/SPEC.md),
you can use any Solana Wallet supporting Solana to scan generated QR codes and transfer funds

## Installation

Project uses [build_runner](https://pub.dev/packages/build_runner) for code generations,
generated files are not pushed to the repository and gitignored,
run `flutter pub run build_runner build --delete-conflicting-outputs` to generate all models

## Checklist

- ✅ Validation

- 🚧 Download QR code
- 🚧 SPL token picker
- 🚧 Upload custom icon
- 🚧 Adaptive layout
- 🚧 How it works page
- 🚧 Transaction request
- 🚧 Transactions history
