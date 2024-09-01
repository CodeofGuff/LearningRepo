//
//  ContentView.swift
//  Moonshot(sUI)
//
//  Created by David Guffre on 9/1/24.
//
import SwiftUI

struct ContentView: View {
	@State private var animationAmount: Double = 0.0
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	@State private var showingSheet = false
	
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			
			VStack {
				Button(action: {
					withAnimation {
						animationAmount += 360
						showingSheet.toggle()
					}
				}) {
					
					Image(systemName: "macpro.gen1.fill")
						.resizable()
						.frame(width: 50, height: 50)
						.foregroundStyle(.red)
						.rotationEffect(.degrees(animationAmount))
					
				}
				.sheet(isPresented: $showingSheet) {
					SecondView()
				}
				Text("Hello David")
					.font(.largeTitle)
					.bold()
					.foregroundStyle(.yellow)
			}
			
		}
		
		
		
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

