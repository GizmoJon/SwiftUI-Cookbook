//
//  Contacts.swift
//  DeleteContactsApp
//
//  Created by giordano scalzo on 16/05/2020.
//  Copyright © 2020 giordano scalzo. All rights reserved.
//

import Foundation
import CoreData

extension Contact {
    static func insert(in context: NSManagedObjectContext,
                       firstName: String,
                       lastName: String,
                       phoneNumber: String) {
        let contact = Contact(context: context)
        contact.firstName = firstName
        contact.lastName = lastName
        contact.phoneNumber = phoneNumber
    }
}


func addContacts(to managedObjectContext: NSManagedObjectContext) {
    guard UserDefaults.standard.bool(forKey: "alreadyRun") == false else {
        return
    }
    UserDefaults.standard.set(true, forKey: "alreadyRun")

    [("Daenerys", lastName: "Targaryen", "02079460803"),
     ("Bran", lastName: "Stark", "02079460071"),
     ("Jon", lastName: "Snow", "02079460874"),
     ("Theon", lastName: "Greyjoy", "02890180771"),
     ("Ned", lastName: "Stark", "011774960111"),
     ("Tyrion", lastName: "Lannister", "02079460695"),
     ("Arya", lastName: "Stark", "02079460878"),
     ("Stannis", lastName: "Baratheon", "02079460367"),
     ("Samwell", lastName: "Tarly", "011774960104"),
     ("Jaime", lastName: "Lannister", "02890180239"),
     ("Jorah", lastName: "Mormont", "02079460025"),
     ("Jeor", lastName: "Mormont", "02079460127"),
     ("Robb", lastName: "Stark", "011774960384"),
     ("Joffrey", lastName: "Baratheon", "02079460963"),
     ("Tywin", lastName: "Lannister", "02890180899"),
     ("Margaery", lastName: "Tyrell", "011774960635"),
     ("Catelyn", lastName: "Stark", "02890180301"),
     ("Viserys", lastName: "Targaryen", "02079460220"),
     ("Cersei", lastName: "Lannister", "02890180492"),
     ("Davos", lastName: "Seaworth", "02079460848"),
     ("Sansa", lastName: "Stark", "02890180764")]
        .forEach { (firstName, lastName, phoneNumber) in
            Contact.insert(in: managedObjectContext,
                           firstName: firstName,
                           lastName: lastName,
                           phoneNumber: phoneNumber)
    }
    try? managedObjectContext.save()
}

