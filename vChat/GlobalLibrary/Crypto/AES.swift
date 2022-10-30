//
//  AES.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/8.
//

import Foundation
import CryptoSwift

/// AES加密 - String
/// - Parameters:
///   - str: 需要加密的字符串
///   - aes_key: AES密钥
/// - Returns: Base64 字符串
func aesEncrypt(_ str: String, aes_key: String) -> String {
    let aes = try! AES(key: aes_key.bytes, blockMode: ECB())
    let encrypted = try! aes.encrypt(str.bytes)
    return encrypted.toBase64()
}

/// AES解密 - String
/// - Parameters:
///   - str: 加密后的Base64字符串
///   - aes_key: 加密使用的密钥
/// - Returns: 原文字符串
func aesDecrypt(_ str: String , aes_key: String) -> String {
    let aes = try! AES(key: aes_key.bytes, blockMode: ECB())
    return try! str.decryptBase64ToString(cipher: aes)
}

/// AES加密 - Data
/// - Parameters:
///   - data: 需要加密的Data
///   - aes_key: AES密钥
/// - Returns: 加密后的Data
func aesEncrypt(_ data: Data, aes_key: String) -> Data {
    let aes = try! AES(key: aes_key.bytes, blockMode: ECB())
    let encrypted = try! aes.encrypt(data.bytes)
    return Data(encrypted)
}

/// AES解密 - Data
/// - Parameters:
///   - data: 需要加密的Data
///   - aes_key: AES密钥
/// - Returns: 解密后的Data
func aesDecrypt(_ data: Data , aes_key: String) -> Data {
    let aes = try! AES(key: aes_key.bytes, blockMode: ECB())
    return try! data.decrypt(cipher: aes)
}
