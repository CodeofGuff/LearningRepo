//
//  AddressView.swift
//  CupcakeCorner(sUI)
//
//  Created by David Guffre on 9/17/24.
//

import SwiftUI

struct AddressView: View {
	
	@Bindable var order: Order
	
    var body: some View {
		Form {
			Section {
				TextField("Name", text: $order.name)
				TextField("Street Address", text: $order.streetAddress)
				TextField("City", text: $order.city)
				TextField("Zip", text: $order.zip)
			}
			
			Section {
				NavigationLink("Check out") {
					CheckoutView(order: order)
				}
			}
			.disabled(order.hasValidAddress == false)
		}
		.navigationTitle("Delivery Details")
		.navigationBarTitleDisplayMode(.inline)
		.scrollBounceBehavior(.basedOnSize) // works here to stop the pull bounce even though its a scroll

    }
}

#Preview {
	AddressView(order: Order())
}
