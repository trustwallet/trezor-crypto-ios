Pod::Spec.new do |s|
  s.name             = 'TrezorCrypto'
  s.version          = '0.0.1'
  s.summary          = 'Heavily optimized cryptography algorithms for iOS.'

  s.homepage         = 'https://github.com/TrustWallet/trezor-crypto-ios'
  s.license          = { type: 'MIT', file: 'trezor-crypto/LICENSE' }
  s.authors          = { 'Alejandro Isaza' => 'al@isaza.ca' }
  s.source           = { git: 'https://github.com/TrustWallet/trezor-crypto-ios.git', tag: s.version, submodules: true }
  
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'

  s.prepare_command = <<-CMD
    sed -i '' -e 's:ed25519-donna/::g' ./**/*.c
    sed -i '' -e 's:ed25519-donna/::g' ./**/*.h
  CMD
  s.module_map = 'TrezorCrypto.modulemap'
  search_paths = [
    '"${PODS_ROOT}/trezor-crypto"',
    '"${PODS_ROOT}/trezor-crypto/aes"',
    '"${PODS_ROOT}/trezor-crypto/chacha20poly1305"',
    '"${PODS_ROOT}/trezor-crypto/ed25519-donna"'
  ]
  s.pod_target_xcconfig = {
      'SWIFT_INCLUDE_PATHS' => '${PODS_ROOT}',
      'OTHER_CFLAGS' => '-O3 -std=c99',
      'HEADER_SEARCH_PATHS' => search_paths.join(' ')
  }

  s.source_files = 
    'trezor-crypto/*.{c,h,table}',
    'trezor-crypto/aes/*.{c,h}',
    'trezor-crypto/chacha20poly1305/*.{c,h}',
    'trezor-crypto/ed25519-donna/*.{c,h}'
  s.private_header_files = 
    'trezor-crypto/aes/aesopt.h',
    'trezor-crypto/aes/aestab.h',
    'trezor-crypto/aes/brg_types.h',
    'trezor-crypto/chacha20poly1305/ecrypt-config.h',
    'trezor-crypto/chacha20poly1305/ecrypt-machine.h',
    'trezor-crypto/chacha20poly1305/ecrypt-portable.h',
    'trezor-crypto/chacha20poly1305/ecrypt-sync.h',
    'trezor-crypto/chacha20poly1305/ecrypt-donna-32.h',
    'trezor-crypto/chacha20poly1305/ecrypt-donna.h',
    'trezor-crypto/chacha20poly1305/rfc7539.h',
    'trezor-crypto/ed25519-donna/curve25519-donna-32bit.h',
    'trezor-crypto/ed25519-donna/curve25519-donna-helpers.h',
    'trezor-crypto/ed25519-donna/curve25519-donna-scalarmult-base.h',
    'trezor-crypto/ed25519-donna/ed25519-donna-32bit-tables.h',
    'trezor-crypto/ed25519-donna/ed25519-donna-basepoint-table.h',
    'trezor-crypto/ed25519-donna/ed25519-donna-impl-base.h',
    'trezor-crypto/ed25519-donna/ed25519-donna-portable.h',
    'trezor-crypto/ed25519-donna/ed25519-hash-custom-keccak.h',
    'trezor-crypto/ed25519-donna/ed25519-hash-custom-sha3.h',
    'trezor-crypto/ed25519-donna/ed25519-hash-custom.h',
    'trezor-crypto/ed25519-donna/ed25519-keccak.h',
    'trezor-crypto/ed25519-donna/ed25519-sha3.h',
    'trezor-crypto/ed25519-donna/ed25519.h',
    'trezor-crypto/ed25519-donna/modm-donna-32bit.h',
    'trezor-crypto/bip39_english.h',
    'trezor-crypto/blake2_common.h',
    'trezor-crypto/check_mem.h',
    'trezor-crypto/macros.h',
    'trezor-crypto/options.h'
  s.public_header_files =
    'TrezorCrypto.h',
    'trezor-crypto/aes/aes.h',
    'trezor-crypto/chacha20poly1305/chacha20poly1305.h',
    'trezor-crypto/ed25519-donna/ed25519-donna.h',
    'trezor-crypto/address.h',
    'trezor-crypto/base32.h',
    'trezor-crypto/base58.h',
    'trezor-crypto/bignum.h',
    'trezor-crypto/bip32.h',
    'trezor-crypto/bip39.h',
    'trezor-crypto/blake256.h',
    'trezor-crypto/blake2b.h',
    'trezor-crypto/blake2s.h',
    'trezor-crypto/curves.h',
    'trezor-crypto/ecdsa.h',
    'trezor-crypto/hasher.h',
    'trezor-crypto/hmac.h',
    'trezor-crypto/nem.h',
    'trezor-crypto/nist256p1.h',
    'trezor-crypto/pbkdf2.h',
    'trezor-crypto/rand.h',
    'trezor-crypto/rc4.h',
    'trezor-crypto/secp256k1.h',
    'trezor-crypto/segwit_addr.h',
    'trezor-crypto/sha2.h',
    'trezor-crypto/sha3.h'
  s.exclude_files =
    'trezor-crypto/aes/aestst*.{c,h}',
    'trezor-crypto/gui/*.{c,h}',
    'trezor-crypto/rfc6979.c',
    'trezor-crypto/test*.{c,h}',
    'trezor-crypto/tools/*.{c,h}'
  s.libraries = 'c'
end
