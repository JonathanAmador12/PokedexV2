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
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color("background1"),
                        Color("background2"),
                        Color("background3")
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            VStack {
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
