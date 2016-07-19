//
//  User.swift
//  FireSwiffer
//
//  Created by Rickey Hrabowskie on 7/18/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User {
    let uid:String
    let email:String
    init(userData:FIRUser) {
        uid = userData.uid
        
        if let mail = userData.providerData.first?.email {
            email = mail
        } else {
            email = ""
        }
    }
    
    init (uid:String, email:String) {
        self.uid = uid
        self.email = email 
    }
}