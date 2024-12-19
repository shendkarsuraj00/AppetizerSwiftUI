//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Macbook on 19/12/24.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var hunderedYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
