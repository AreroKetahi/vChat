//
//  Account.swift
//  vChat
//
//  Created by 苏子轩 on 2022/8/7.
//

import Foundation

struct Account {
    var nickname: String
    let email: String
    var passwordHash: String
}

let localAccount = [
    Account(nickname: "野兽先辈", email: "123@vchat.com", passwordHash: "B7AB30A912521AC36E433A5CFC8B5C1037884487AF45AE5311CED235EE77FAEF"), // 1145141919810
    Account(nickname: "七七", email: "5477@vchat.com", passwordHash: "5E85B9B9BDEB940666A7772DC7483F3C101B1710F1816FB56B9D51599A4287E3") //woshi77
]

func isAccountExist(_ groups: [Account], email: String, password: String) -> Bool {
    var value = false
    for i in 0...(groups.count - 1) {
        if groups[i].email == email && groups[i].passwordHash == password.sha256 {
            value = true
        }
    }
    return value
}

func isAccountExist(_ groups: [Account], email: String) -> Bool {
    var value = false
    for i in 0...(groups.count - 1) {
        if groups[i].email == email {
            value = true
        }
    }
    return value
}

