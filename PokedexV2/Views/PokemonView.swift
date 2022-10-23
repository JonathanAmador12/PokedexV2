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
    @State var pokemonId: Int?
    @State var isActive = false
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Pokedex")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                .padding()
                .background(Color("primary"))
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
                            .onTapGesture(count: 1) {
                                isActive = true
                                self.pokemonId = pokemon.id
                            }
                        }
                    }
                    if vm.isLoading{
                        ProgressView("Loading")
                    }
                }
            }
            
            if isActive, let pokemonId = pokemonId {
                PokemonDetailsView(pokemonId: pokemonId, isActive: $isActive)
                    .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .onAppear {
            vm.getPokemon()
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemonId: 1)
    }
}
