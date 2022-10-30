//
//  RSA.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/8.
//

import Foundation
import SwCrypt
import SwiftyRSA

/// RSA 密钥生成 PKCS#1
/// - Returns: 私钥 - PKCS#1，公钥 - PKCS#1
func createPKCS1KeyPair() -> (String, String) {
    let (privateKey, publicKey) = try! CC.RSA.generateKeyPair(2048)
    let privateKeyPEM = SwKeyConvert.PrivateKey.derToPKCS1PEM(privateKey)
    let publicKeyPEM = SwKeyConvert.PublicKey.derToPKCS1PEM(publicKey)
    
    return (privateKeyPEM, publicKeyPEM)
}

/// RSA 密钥生成 DER
/// - Returns: 私钥 - DER，公钥 - DER
func createDERKeyPair() -> (Data, Data) {
    return try! CC.RSA.generateKeyPair(2048)
}

/// 将PKCS#1格式的密钥转换为DER格式
/// - Parameters:
///   - privateKey: 私钥 PKCS#1
///   - publicKey: 公钥 PKCS#1
/// - Returns: 私钥 - DER，公钥 - DER
func getDERKeyPairFromPKCS1(privateKey: String, publicKey: String) -> (Data, Data){
    let privateKeyDER = try! SwKeyConvert.PrivateKey.pemToPKCS1DER(privateKey)
    let publicKeyDER = try! SwKeyConvert.PublicKey.pemToPKCS1DER(publicKey)
    
    return (privateKeyDER, publicKeyDER)
}

/// 将DER格式的密钥转换为PKCS#1格式
/// - Parameters:
///   - privateKey: 私钥 DER
///   - publicKey: 公钥 DER
/// - Returns: 私钥 - PKCS#1，公钥 - PKCS#1
func getPKCS1KeyPairFromDER(privateKey: Data, publicKey: Data) -> (String, String) {
    let privateKeyPEM = SwKeyConvert.PrivateKey.derToPKCS1PEM(privateKey)
    let publicKeyPEM = SwKeyConvert.PublicKey.derToPKCS1PEM(publicKey)
    
    return (privateKeyPEM, publicKeyPEM)
}

/// 从PEM文件中加载RSA公钥
/// - Parameter key: PEM公钥
/// - Returns: SwiftyRSA PublicKey数据
func loadPublicKeyFromPEM(_ key: String) -> PublicKey {
    return try! PublicKey(pemEncoded: key)
}

/// 从PEM文件中加载RSA私钥
/// - Parameter key: PEM私钥
/// - Returns: SwiftyRSA PrivateKey数据
func loadPrivatecKeyFromPEM(_ key: String) -> PrivateKey {
    return try! PrivateKey(pemEncoded: key)
}

/// RSA 字符串加密
/// - Parameters:
///   - string: 明文字符串
///   - key: PublicKey密钥
/// - Returns: 编码后的Base64字符串
func rsaEncrypt(_ string: String, key: PublicKey) -> String {
    let clear = try! ClearMessage(string: string, using: .utf8)
    let encrypt = try! clear.encrypted(with: key, padding: .PKCS1)
    return encrypt.base64String
}

/// RSA 字符串加密
/// - Parameters:
///   - string: 明文字符串
///   - key: PublicKey密钥
/// - Returns: 原始Data数据
func rsaEncrypt(_ string: String, key: PublicKey) -> Data {
    let clear = try! ClearMessage(string: string, using: .utf8)
    let encrypt = try! clear.encrypted(with: key, padding: .PKCS1)
    return encrypt.data
}

/// RSA 数据加密
/// - Parameters:
///   - data: 明文数据
///   - key: PublicKey公钥
/// - Returns: 编码后的base64字符串
func rsaEncrypt(_ data: Data, key: PublicKey) -> String {
    let clear = ClearMessage(data: data)
    let encrypt = try! clear.encrypted(with: key, padding: .PKCS1)
    return encrypt.base64String
}

/// RSA 数据加密
/// - Parameters:
///   - data: 明文数据
///   - key: PublicKey公钥
/// - Returns: 原始Data数据
func rsaEncrypt(_ data: Data, key: PublicKey) -> Data {
    let clear = ClearMessage(data: data)
    let encrypt = try! clear.encrypted(with: key, padding: .PKCS1)
    return encrypt.data
}

/// RSA Base64 字符串解密
/// - Parameters:
///   - base64String: 密文 Base64 字符串
///   - key: PrivateKey 密钥
/// - Returns: 明文字符串
func rsaDecrypt(_ base64String: String, key: PrivateKey) -> String {
    let encrypted = try! EncryptedMessage(base64Encoded: base64String)
    let decrypt = try! encrypted.decrypted(with: key, padding: .PKCS1)
    return try! decrypt.string(encoding: .utf8)
}

/// RSA Base64 字符串解密
/// - Parameters:
///   - base64String: 密文 Base64 字符串
///   - key: PrivateKey 密钥
/// - Returns: 明文数据
func rsaDecrypt(_ base64String: String, key: PrivateKey) -> Data {
    let encrypted = try! EncryptedMessage(base64Encoded: base64String)
    let decrypt = try! encrypted.decrypted(with: key, padding: .PKCS1)
    return decrypt.data
}

/// RSA 数据解密
/// - Parameters:
///   - data: 密文数据
///   - key: PrivateKey 密钥
/// - Returns: 明文字符串
func rsaDecrypt(_ data: Data, key: PrivateKey) -> String {
    let encrypted = EncryptedMessage(data: data)
    let decrypt = try! encrypted.decrypted(with: key, padding: .PKCS1)
    return try! decrypt.string(encoding: .utf8)
}

/// RSA 数据解密
/// - Parameters:
///   - data: 密文数据
///   - key: PrivateKey 密钥
/// - Returns: 明文数据
func rsaDecrypt(_ data: Data, key: PrivateKey) -> Data {
    let encrypted = EncryptedMessage(data: data)
    let decrypt = try! encrypted.decrypted(with: key, padding: .PKCS1)
    return decrypt.data
}

/// PEM密钥解码
/// - Parameter pemString: PEM密钥
/// - Returns: 解码后的原始数据
func decodePEM(_ pemString: String, mode: RSAKey) -> Data {
    var editString = pemString.replacingOccurrences(of: "\n", with: "") // Remove newline
    editString = editString.replacingOccurrences(of: "-----", with: "") // Remove Identifer 1
    if  mode == .pub {
        editString = editString.replacingOccurrences(of: "BEGIN PUBLIC KEY", with: "")
        editString = editString.replacingOccurrences(of: "END PUBLIC KEY", with: "")
    } else {
        editString = editString.replacingOccurrences(of: "BEGIN RSA PRIVATE KEY", with: "")
        editString = editString.replacingOccurrences(of: "END RSA PRIVATE KEY", with: "")
    }
    return Data(base64Encoded: editString)!
}

/// PEM密钥编码
/// - Parameters:
///   - data: 解码后的原始数据
///   - mode: 编码模式。.pub为公钥模式，.pri为私钥模式
/// - Returns: PEM密钥
func encodePEM(_ data: Data, mode: RSAKey) -> String {
    var coden = [String]()
    var dataBase64 = data.base64EncodedString()
    let loopTime = (dataBase64.count - (dataBase64.count % 64)) / 64 + 1
    for i in 0...(loopTime - 1) {
        if i != loopTime - 1 {
            let cutString = String(dataBase64.prefix(64))
            dataBase64 = dataBase64.replacingOccurrences(of: cutString, with: "")
            print(cutString)
        } else {
            coden.append(dataBase64)
        }
    }
    let result = coden.joined(separator: "\n")
    if mode == .pub {
        return "-----BEGIN PUBLIC KEY-----\n\(result)\n-----END PUBLIC KEY-----"
    } else {
        return "-----BEGIN RSA PRIVATE KEY-----\n\(result)\n-----END RSA PRIVATE KEY-----"
    }
}

/// PEM密钥编码解码依赖
enum RSAKey {
    case pri, pub
}
