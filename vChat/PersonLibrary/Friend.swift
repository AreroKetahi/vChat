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
}

let friend = Person(nickname: "Zhang San", uid: 000000, publicKey: NSObject(), imageName: "TestImage")
let me = Person(nickname: "ME", uid: 000000, publicKey: NSObject(), imageName: nil)

let friendList = [friend, me]
