Pod::Spec.new do |s|
  s.name             = 'TrezorCrypto'
  s.version          = '0.0.3'
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
    sed -i '' -e 's:USE_ETHEREUM 0:USE_ETHEREUM 1:g' trezor-crypto/options.h
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
    'TrezorCrypto.h',
    'trezor-crypto/*.{c,h,table}',
    'trezor-crypto/aes/*.{c,h}',
    'trezor-crypto/chacha20poly1305/*.{c,h}',
    'trezor-crypto/ed25519-donna/*.{c,h}'
  s.private_header_files = 
    'trezor-crypto/aes/aesopt.h',
    'trezor-crypto/aes/aestab.h',
    'trezor-crypto/ed25519-donna/curve25519-donna-scalarmult-base.h',
    'trezor-crypto/ed25519-donna/ed25519-hash-custom-keccak.h',
    'trezor-crypto/ed25519-donna/ed25519-hash-custom-sha3.h',
    'trezor-crypto/ed25519-donna/ed25519-hash-custom.h',
    'trezor-crypto/ed25519-donna/ed25519-keccak.h',
    'trezor-crypto/ed25519-donna/ed25519-sha3.h',
    'trezor-crypto/bip39_english.h',
    'trezor-crypto/blake2_common.h',
    'trezor-crypto/check_mem.h',
    'trezor-crypto/macros.h'
  s.exclude_files =
    'trezor-crypto/aes/aestst*.{c,h}',
    'trezor-crypto/gui/*.{c,h}',
    'trezor-crypto/rfc6979.c',
    'trezor-crypto/test*.{c,h}',
    'trezor-crypto/tools/*.{c,h}'
  s.libraries = 'c'
end
