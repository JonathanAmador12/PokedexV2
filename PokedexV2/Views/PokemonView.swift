//
//  PokemonView.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import SwiftUI
import Kingfisher

struct PokemonView: View {
    @ObservedObject var vm = PokemonViewModel()
    let gridForm = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("background1"), Color("background2"), Color("background3")]), startPoint: .top, endPoint: .bottom)
            VStack {
                ScrollView {
                    LazyVGrid(columns: gridForm, spacing: 20) {
                        ForEach(vm.pokemon) { pokemon in
                            VStack {
                                KFImage(URL(string: pokemon.imageUrl))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .background()
                                Text(pokemon.name)
                            }
                            .onAppear{
                                vm.loadMoreData(name: pokemon.name)
                            }
                        }
                    }
                    if vm.isLoading{
                        ProgressView("Loading")
                    }
                }
            }
            .padding()
        }
        .onAppear {
            vm.getPokemon()
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
