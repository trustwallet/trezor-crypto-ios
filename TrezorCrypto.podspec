Pod::Spec.new do |s|
  s.name             = "TrezorCrypto"
  s.version          = "0.0.1"
  s.summary          = "Heavily optimized cryptography algorithms for iOS."

  s.homepage         = "https://github.com/TrustWallet/trezor-crypto-ios"
  s.license          = 'MIT'
  s.authors          = { "Alejandro Isaza" => "al@isaza.ca" }
  s.source           = { git: 'https://github.com/TrustWallet/trezor-crypto-ios.git', tag: s.version.to_s }
  
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.10"
  s.pod_target_xcconfig = {
      'SWIFT_INCLUDE_PATHS' => '${PODS_ROOT}',
      'OTHER_CFLAGS' => '-O3 -std=c99',
      'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/trezor-crypto" "${PODS_ROOT}/trezor-crypto/aes" "${PODS_ROOT}/trezor-crypto/chacha20poly1305" "${PODS_ROOT}/trezor-crypto/ed25519-donna"'
  }

  s.source_files = 
    'trezor-crypto/address.{c,h}',
    'trezor-crypto/base32.{c,h}',
    'trezor-crypto/base58.{c,h}',
    'trezor-crypto/bignum.{c,h}',
    'trezor-crypto/bip32.{c,h}',
    'trezor-crypto/bip39.{c,h}',
    'trezor-crypto/bip39_english.h',
    'trezor-crypto/blake256.{c,h}',
    'trezor-crypto/blake2b.{c,h}',
    'trezor-crypto/blake2s.{c,h}',
    'trezor-crypto/curves.{c,h}',
    'trezor-crypto/ecdsa.{c,h}',
    'trezor-crypto/hasher.{c,h}',
    'trezor-crypto/hmac.{c,h}',
    'trezor-crypto/nem.{c,h}',
    'trezor-crypto/nist256p1.{c,h}',
    'trezor-crypto/pbkdf2.{c,h}',
    'trezor-crypto/rand.{c,h}',
    'trezor-crypto/rc4.{c,h}',
    'trezor-crypto/ripemd160.{c,h}',
    'trezor-crypto/script.{c,h}',
    'trezor-crypto/secp256k1.{c,h}',
    'trezor-crypto/sha2.{c,h}',
    'trezor-crypto/sha3.{c,h}',
    'trezor-crypto/aes/aes_modes.{c,h}',
    'trezor-crypto/aes/aescrypt.{c,h}',
    'trezor-crypto/aes/aeskey.{c,h}',
    'trezor-crypto/aes/aestab.{c,h}',
    'trezor-crypto/chacha20poly1305/chacha20poly1305.{c,h}',
    'trezor-crypto/chacha20poly1305/chacha_merged.{c,h}',
    'trezor-crypto/chacha20poly1305/poly1305-donna.{c,h}',
    'trezor-crypto/chacha20poly1305/rfc7539.{c,h}',
    'trezor-crypto/ed25519-donna/curve25519-donna-32bit.{c,h}',
    'trezor-crypto/ed25519-donna/curve25519-donna-helpers.{c,h}',
    'trezor-crypto/ed25519-donna/modm-donna-32bit.{c,h}',
    'trezor-crypto/ed25519-donna/ed25519-donna-basepoint-table.{c,h}',
    'trezor-crypto/ed25519-donna/ed25519-donna-32bit-tables.{c,h}',
    'trezor-crypto/ed25519-donna/ed25519-donna-impl-base.{c,h}',
    'trezor-crypto/ed25519-donna/ed25519.{c,h}',
    'trezor-crypto/ed25519-donna/curve25519-donna-scalarmult-base.{c,h}',
    'trezor-crypto/ed25519-donna/ed25519-sha3.{c,h}',
    'trezor-crypto/ed25519-donna/ed25519-keccak.{c,h}'
  s.exclude_files =
    'trezor-crypto/test*.{c,h}',
    'trezor-crypto/tools/*.{c,h}',
    'trezor-crypto/gui/*.{c,h}'
end
