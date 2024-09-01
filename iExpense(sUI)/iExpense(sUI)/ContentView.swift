//
//  ContentView.swift
//  iExpense(sUI)
//
//  Created by David Guffre on 8/29/24.
//




// Challange
// Rebrand with the red/grey/yellow colors
// Split expeneses into Personal and Business
// Contain styling / $$$ signs dpeending on dollar amount ($10, $100, $1000, etc)


import SwiftUI


struct ExpenseItem: Identifiable, Codable {
	var id = UUID()
	let name: String
	let type: String
	let amount: Double
	
}

@Observable
class Expenses {
	var items = [ExpenseItem]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(items) {
				UserDefaults.standard.set(encoded, forKey: "Items")
			}
		}
	}
	
	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Items") {
			if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
				items = decodedItems
				return
			}
		}
		items = []
	}
	
}



struct ContentView: View {
	@State private var animationAmount: Double = 0.0
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@State private var showingSheet = false
	
	@State private var expenses = Expenses()
	@State private var showingAddExpense = false
	
	
	var body: some View {
		NavigationStack {
			List {
				ForEach(expenses.items) { item in
					HStack {
						VStack(alignment: .leading) {
							Text(item.name)
								.font(.headline)
							
							Text(item.type)
						}
						Spacer()
						
						Text(item.amount, format: .currency(code: "USD"))
					}
				}
				.onDelete(perform: removeItems)
			}
			.navigationTitle("iExpense")
			.toolbar {
				Button("Add Expense", systemImage: "plus") {
					showingAddExpense = true
				}
			}
			.sheet(isPresented: $showingAddExpense) {
				AddView(expenses: expenses)
			}
			
		}
	}
	
	
	func removeItems(at offsets: IndexSet) {
		expenses.items.remove(atOffsets: offsets)
	}
	
	
}

struct SecondView: View {
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@Environment(\.dismiss) var dismiss
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			Text("Error: ----->         immediately")
			Button("exit") {
				dismiss()
			}
		}
	}
}


#Preview {
	ContentView()
}

