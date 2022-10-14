//
//  MainView.swift
//  PokedexV2
//
//  Created by JonathanA on 12/10/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("primary"), Color("background3")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Pokedex")
                        .foregroundColor(.white)
                        .font(.title)
                    .fontWeight(.black)
                    Spacer()
                }
                .padding(.horizontal)
                PokemonView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
