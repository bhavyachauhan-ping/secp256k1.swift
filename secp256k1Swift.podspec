Pod::Spec.new do |s|
  s.name             = 'secp256k1Swift'
  s.version          = '0.7.1'
  s.summary          = 'elliptic curve public key cryptography, ECDSA, Schnorr Signatures for Bitcoin and C bindings from libsecp256k1.'

  s.homepage         = 'https://github.com/portto/secp256k1.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'csjones' => '' }
  s.source           = {
    :git => 'git@github.com:portto/secp256k1.swift.git',
    :tag => s.version.to_s,
    :submodules => true
  }
  s.social_media_url = 'https://twitter.com/BloctoApp'
  s.swift_version = '5.0'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'

  s.source_files =
    'Sources/implementation/Asymmetric.swift',
    'Sources/implementation/DH.swift',
    'Sources/implementation/Digests.swift',
    'Sources/implementation/ECDH.swift',
    'Sources/implementation/ECDSA.swift',
    'Sources/implementation/EdDSA.swift',
    'Sources/implementation/Errors.swift',
    'Sources/implementation/PrettyBytes.swift',
    'Sources/implementation/SafeCompare.swift',
    'Sources/implementation/Schnorr.swift',
    'Sources/implementation/secp256k1.swift',
    'Sources/implementation/SHA256.swift',
    'Sources/implementation/swift-crypto/Sources/Crypto/Digests/Digest.swift',
    'Sources/implementation/swift-crypto/Sources/Crypto/Signatures/Signature.swift',
    'Sources/implementation/swift-crypto/Sources/Crypto/Util/BoringSSL/RNG_boring.swift',
    'Sources/implementation/swift-crypto/Sources/Crypto/Util/SecureBytes.swift',
    'Sources/implementation/swift-crypto/Tests/_CryptoExtrasTests/Utils/BytesUtil.swift',
    'Sources/implementation/Tweak.swift',
    'Sources/implementation/Utility.swift',
    'Sources/implementation/Zeroization.swift'
  s.dependency 'secp256k1Wrapper'

end

