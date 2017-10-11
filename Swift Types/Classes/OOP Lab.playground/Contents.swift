//: Playground - noun: a place where people can play

import UIKit

class Carrier {
    
    private var phones: [String: Phone] = [ : ]
    
    func connectCall(fromPhone: Phone, toPhoneNumber phoneNumber: String) {
        
        guard let phone = phones[phoneNumber]
        else {
            return
        }
        
        phone.receiveCall(fromPhone: fromPhone)
        print("\(fromPhone.phoneNumber) called \(phoneNumber)")
    }
    
    func deliverText(text: String, fromPhone: Phone, toPhoneNumber phoneNumber: String) {
        
        guard let receivingPhone = phones[phoneNumber] else { return }
        
        receivingPhone.receiveText(text: text, fromPhone: fromPhone)
        
        print("\(fromPhone.phoneNumber) sent text \(text) to \(phoneNumber)")
    }
    
    func registerPhone(newPhone: Phone) {
        self.phones[newPhone.phoneNumber] = newPhone
    }
    
}


class Phone {
    
    let phoneNumber: String
    private var carrier: Carrier?
    
    private var textMessages: [String: [String]] = [ : ]
    private var callsPlaced: [String] = []
    private var callsReceived: [String] = []
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    
    func call(number: String) {
        carrier?.connectCall(fromPhone: self, toPhoneNumber: number)
    }
    
    func text(text: String, number: String) {
        carrier?.deliverText(text: text, fromPhone: self, toPhoneNumber: number)
    }
    
    func receiveCall(fromPhone phone: Phone) {
        callsReceived.append(phone.phoneNumber)
    }
    
    func receiveText(text: String, fromPhone phone: Phone) {
        
        var messageLog = textMessages[phone.phoneNumber] ?? []
        messageLog.append(text)
    }
    
    func register(withCarrier carrier: Carrier) {
        self.carrier = carrier
        self.carrier?.registerPhone(newPhone: self)
    }
    
}

class Person {
    
    let name: String
    
    private var phone: Phone?
    
    init(name: String) {
        self.name = name
    }
    
    private var phoneNumber: String? {
        return phone?.phoneNumber
    }
    
    func call(friend: Person) {
        
        guard let myPhone = phone,
              let friendPhoneNumber = friend.phoneNumber
        else {
            return
        }
        
        myPhone.call(number: friendPhoneNumber)
    }
    
    func textFriend(text: String, friend: Person) {
        
        guard let myPhone = phone,
              let friendPhoneNumber = friend.phoneNumber
        else {
            return
        }
        
        myPhone.text(text: text, number: friendPhoneNumber)
    }
}

//First create the carrier
let carrier = Carrier()

//Create Danny and his phone.
let danny = Person(name: "Danny")
let dannysPhone = Phone(phoneNumber: "254568")
dannysPhone.register(withCarrier: carrier)
//Give the phone to Danny
danny.phone = dannysPhone

//Create Giselle and her phone
let giselle = Person(name: "Giselle")
let gisellesPhone = Phone(phoneNumber: "3435234")
gisellesPhone.register(withCarrier: carrier)
//Give Giselle her phone
giselle.phone = gisellesPhone


danny.textFriend(text: "What's Cookin?", friend: giselle)

giselle.call(friend: danny)

for _ in 1...100 {
    danny.textFriend(text: "LOL", friend: giselle)
}
