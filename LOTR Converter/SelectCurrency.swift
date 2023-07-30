//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Marc Cruz on 7/24/23.
//

import SwiftUI

struct SelectCurrency: View {
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // background image: parchment
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)

            VStack {
                // text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                // currency icons
                IconGrid(currency: $leftCurrency)

                // text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                // currency icons
                IconGrid(currency: $rightCurrency)

                // Done button
                Button("Done") {
                    if let encodedLeftCurrency = try? JSONEncoder().encode(leftCurrency) {
                        UserDefaults.standard.set(encodedLeftCurrency, forKey: "leftCurrency")
                    }
                    if let encodedRightCurrency = try? JSONEncoder().encode(rightCurrency) {
                        UserDefaults.standard.set(encodedRightCurrency, forKey: "rightCurrency")
                    }
                    dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundStyle(.white)
                .background(.brown)
                .cornerRadius(15)
            }
        }
    }
}

struct SelectCurrency_Previews: PreviewProvider {
    static var previews: some View {
        SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
    }
}
