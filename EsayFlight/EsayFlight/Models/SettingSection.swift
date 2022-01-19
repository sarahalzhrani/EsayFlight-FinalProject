//
//  SettingSection.swift
//  EsayFlight
//
//  Created by sara al zhrani on 06/06/1443 AH.
//

import Foundation

protocol sectionType:CustomStringConvertible {
    var containsSwitch: Bool { get }
    
}
enum settingsSection: Int, CaseIterable, CustomStringConvertible {
    case Social
    case communication
    var description: String {
        switch self {
        case .Social: return "Social"
        case .communication: return "communication"
        }
    }
    
}
enum SocialOption: Int, CaseIterable, sectionType {
 
    
    case editingprofile
    case logout
    
    var containsSwitch: Bool{ return false}
    var description: String {
        switch self {
        case .editingprofile: return  NSLocalizedString("Editing profile", comment:"")
        case .logout: return  NSLocalizedString("log Out", comment:"") 
        }
    }
    
}

enum CommunicationOption: Int, CaseIterable, sectionType {
   
    
    case darkmode
    case changelanguage
    case email
    var containsSwitch: Bool{
        switch self{
        case.darkmode: return true
        case.changelanguage: return true
        case.email: return true
        }
        
    }
    var description: String {
        switch self {
        case .darkmode: return  NSLocalizedString("Darkmode", comment:"") 
        case .changelanguage: return NSLocalizedString("Changelanguage", comment:"") 
        case .email: return  NSLocalizedString("Email", comment:"") 
        }
    }
    
}
