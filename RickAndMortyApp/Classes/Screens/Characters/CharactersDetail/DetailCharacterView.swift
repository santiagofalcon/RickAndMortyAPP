//
//  DetailCharacterView.swift
//  RickAndMortyApp
//
//  Created by santiago falcón on 22/4/24.
//

import SwiftUI

struct DetailCharacterView: View {
    @StateObject var presenter: DetailCharacterPresenter
    @State private var uiImage: UIImage? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

            Text(presenter.character.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            HStack {
                Text("Status:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(presenter.character.status.rawValue)
                    .font(.headline)
                    .fontWeight(.light)
            }

            HStack {
                Text("Species:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(presenter.character.species)
                    .font(.headline)
                    .fontWeight(.light)
            }

            HStack {
                Text("Type:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(presenter.character.type)
                    .font(.headline)
                    .fontWeight(.light)
            }

            HStack {
                Text("Gender:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(presenter.character.gender.rawValue)
                    .font(.headline)
                    .fontWeight(.light)
            }

            HStack {
                Text("Origin:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(presenter.character.origin.name)
                    .font(.headline)
                    .fontWeight(.light)
            }

            HStack {
                Text("Location:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(presenter.character.location.name)
                    .font(.headline).fontWeight(.light)
            }

            HStack {
                Text("Created:")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(presenter.character.created)
                    .font(.headline)
                    .fontWeight(.light)
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadImage()
        }
    }

    private func loadImage() {
        
        if let cachedImage = presenter.storageManager.getCharacterImage(characterId: presenter.character.id) {
            uiImage = cachedImage
        } else {
            guard let imageUrl = presenter.character.image, let url = URL(string: imageUrl) else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.uiImage = uiImage

                        // Save the image in the cache
                        presenter.storageManager.saveCharacterImage(image: uiImage, characterId: presenter.character.id)
                    }
                }
            }.resume()
        }
    }
}


