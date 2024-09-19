//
//  Order.swift
//  CupcakeCorner(sUI)
//
//  Created by David Guffre on 9/17/24.
//

import Foundation


@Observable
class Order: Codable {
	
	
	static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
	
	var type = 0
	var quantity = 3
	
	var specialRequestEnabled = false {
		didSet {
			if specialRequestEnabled == false {
				extraFrosting = false
				addSprinkles = false
			}
		}
	}
	
	
	var extraFrosting = false
	var addSprinkles = false
	
	var name = ""
	var streetAddress = ""
	var city = ""
	var zip = ""
	
	var hasValidAddress: Bool {
		if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
			return false
		}
		return true
	}
	
	var cost: Decimal {
		// 2$ per cake
		var cost = Decimal(quantity) * 2
		
		cost += Decimal(type) / 2
		
		if extraFrosting {
			cost += Decimal(quantity)
		}
		if addSprinkles {
			cost += Decimal(quantity) / 2
		}
		
		return cost
		
	}
	
}
