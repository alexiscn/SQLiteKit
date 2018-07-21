//
//  SQLiteAttribute.swift
//  SQLiteKit
//
//  Created by xu.shuifeng on 2018/7/16.
//

import Foundation

/// Specified column attributes with your codable model
/// eg: Specifiy `Primary Key` with Attribute.isPK
/// eg: Specifiy `AUTOINCREMENT Key` with Attribute.autoInc
public struct SQLiteAttribute {
    
    /// Name of property
    public let name: String
    
    /// Attribute of property
    public let attribute: Attribute
    
    public init(name: String, attribute: Attribute) {
        self.name = name
        self.attribute = attribute
    }
}

public struct Attribute: OptionSet {
    
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let none = Attribute(rawValue: 1 << 0)

    /// Make property the primary key of table
    public static let isPK = Attribute(rawValue: 1 << 1)
    
    /// Make property AUTOINCREMENT, which can only have the type of `Int` or `Int64`
    public static let autoInc = Attribute(rawValue: 1 << 2)

    public static let nonull = Attribute(rawValue: 1 << 3)
    
    /// Create index
    public static let indexed = Attribute(rawValue: 1 << 4)
    
    /// Table name
    public static let tableName = Attribute(rawValue: 1 << 5)
    
    /// Member that defins when `ignore` will not create column
    public static let ignore = Attribute(rawValue: 1 << 6)
}
