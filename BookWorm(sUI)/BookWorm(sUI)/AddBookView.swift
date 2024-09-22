//
//  AddBookView.swift
//  BookWorm(sUI)
//
//  Created by David Guffre on 9/22/24.
//

import SwiftUI



struct AddBookView: View {
	
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss
	
	@State private var title: String = ""
	@State private var author: String = ""
	@State private var rating = 3
	@State private var genre = "Fantasy"
	@State private var review: String = ""
	
	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
		
		NavigationStack {
			Form {
				Section {
					TextField("Name of book", text: $title)
					TextField("Author's name", text: $author)
					
					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
				}
				Section("Write a review") {
					TextEditor(text: $review)
					RatingView(rating: $rating)
					
				}
				
				Section {
					Button("Save") {
						let newBook = Book(
							title: title,
							author: author,
							genre: genre,
							review: review,
							rating: rating
						)
						dismiss()
						modelContext.insert(newBook)
					}
				}
			}
			.navigationTitle("Add Book")
		}
    
		
		
		
    }
}



#Preview {
    AddBookView()
}
