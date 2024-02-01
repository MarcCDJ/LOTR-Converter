//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Marc Cruz on 7/23/23.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: ImageResource
    @State var text: String
    @State var rightImage: ImageResource
    
    var body: some View {
        HStack {
            // left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)

            // exchange rate text
            Text(text)

            // right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

struct ExchangeRate_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRate(leftImage: .goldpenny,
                     text: "1 Gold Penny = 4 Silver Pieces",
                     rightImage: .silverpiece)
            .previewLayout(.sizeThatFits)
    }
}
