//
//  Friend.swift
//  vChat
//
//  Created by 苏子轩 on 2022/6/17.
//

import Foundation
import UIKit
import SwiftUI

struct Person: Identifiable {
    var id: String{nickname}
    
    var nickname: String
    var uid: UInt
    var publicKey: NSObject
    var imageName: String?
    var remark: String?
}

let friendList = [
    Person(nickname: "Zhang San", uid: 100001, publicKey: NSObject(), imageName: "TestImage", remark: nil),
    Person(nickname: "ME", uid: 100002, publicKey: NSObject(), imageName: nil, remark: "Li Si"),
    Person(nickname: "I am 🤡", uid: 100003, publicKey: NSObject(), imageName: nil, remark: "小丑")
]
