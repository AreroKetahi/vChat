//
//  CoreJSON.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/7.
//

import Foundation

/// 加载原始JSON文件
/// - Parameter fileURL: 文件路径
/// - Returns: 返回数据类型
func loadOriginalJson<T: Decodable>(_ fileURL: String) -> T {
    let data: Data

//  guard let file = Bundle.main.url(forResource: fileURL, withExtension: nil)
    guard let file = URL(string: fileURL)
    else {
        fatalError("Couldn't find \(fileURL) in file root.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileURL) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileURL) as \(T.self):\n\(error)")
    }
}

/// 写入原始JSON文件
/// - Parameters:
///   - fileURL: 文件路径
///   - data: 输入的数据类型
func writeOriginalJson<T: Decodable>(_ fileURL: String, data: T) {
    let data: Data
    
    guard let file = URL(string: fileURL)
    else {
        fatalError("Couldn't find \(fileURL) in file root.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileURL) from main bundle:\n\(error)")
    }
    
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(data)
        try data.write(to: file)
    } catch {
        fatalError("Couldn't write \(T.self) to \(fileURL):\n\(error)")
    }
}

/// 加载JSON字符串
/// - Parameter jsonString: JSON字符串
/// - Returns: 返回数据类型
func loadStringJson<T: Decodable>(_ jsonString: String) -> T {
    do {
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)!
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse this case of JSON string as \(T.self):\n\(error)")
    }
}

struct AppCore {
    var isSetup: Bool
    var isALEnable: Bool
    var userKey: String
    var appKey: String
}

struct Boot {
    var localUserData: String
    var appGlobalSetting: String
    var friendArray: String
}
