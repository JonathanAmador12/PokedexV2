//
//  PokemonView.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import SwiftUI

struct PokemonView: View {
    
    let gridForm = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                ScrollView {
                    LazyVGrid(columns: gridForm, spacing: 20) {
                        ForEach(0...100, id: \.self) { numero in
                            VStack {
                                Rectangle()
                                    .frame(width: 100, height: 100)
                                    .background()
                                Text("\(numero)")
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
