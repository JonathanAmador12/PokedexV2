//
//  PokemonFeatures.swift
//  PokedexV2
//
//  Created by JonathanA on 19/10/22.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsView: View {
    @ObservedObject var vm = PokemonViewModel()
    var pokemonId: Int
    @Binding var isActive: Bool
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                HStack{
                    Button(action: {
                        isActive = false
                    }) {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .foregroundColor(Color("primary"))
                    }
                    .padding()
                    Spacer()
                }
                ScrollView {
                    if let pokemonDetails = vm.selectedPokemon{
                        VStack(spacing:20) {
                            Text(pokemonDetails.name)
                                .font(.title)
                                .fontWeight(.heavy)
                            KFImage(URL(string: pokemonDetails.imageUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .background(.red)
                                .clipShape(Circle())
                            Text("N~ \(pokemonDetails.id)")
                                .font(.title)
                                .fontWeight(.heavy)
                            ForEach(pokemonDetails.types, id: \.self) { type in
                                VStack{
                                    Text(type)
                                        .frame(maxWidth: .infinity)
                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                        .font(.title3)
                                        .fontWeight(.black)
                                        .overlay{
                                            RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(
                                                    style: StrokeStyle(
                                                        lineWidth: 4,
                                                        dash: [4]
                                                    )
                                                )
                                        }
                                }
                                .padding(.horizontal, 25)
                            }
                            ForEach(pokemonDetails.stats, id: \.self) { stat in
                                HStack{
                                    Text(stat.name)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text("\(stat.value)")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                }
                                .padding(.horizontal, 25)
                            }
                        }
                    }
                }
            }
        }
        .onAppear{
            vm.getPokemonDetails(id: pokemonId)
        }
    }
}

struct PokemonFeatures_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemonId: 1, isActive: .constant(false))
    }
}
