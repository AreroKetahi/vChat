//
//  GlobalVars.swift
//  vChat
//
//  Created by 苏子轩 on 2022/7/21.
//

import Foundation
import SwiftUI

let selfImageName: String? = "TestImage"

let friendList = [
    Person(nickname: "Zhang San", uid: 100001, publicKey: NSObject(), imageName: "TestImage", remark: nil),
    Person(nickname: "ME", uid: 100002, publicKey: NSObject(), imageName: nil, remark: "Li Si"),
    Person(nickname: "I am 🤡", uid: 100003, publicKey: NSObject(), imageName: nil, remark: "小丑")
]

let selfPerson = Person(nickname: "我是个人", uid: 101010, publicKey: NSObject(), imageName: "TestImage")

// localPassword is SHA256 string of "1145141919810"
final class StoragedVars: ObservableObject {
    @Published var uiColor: Color = .blue
    @Published var isAppLocked: Bool = true
    @Published var isAppLockEnable: Bool = true
    @Published var localPassword: String = "B7AB30A912521AC36E433A5CFC8B5C1037884487AF45AE5311CED235EE77FAEF"
}
