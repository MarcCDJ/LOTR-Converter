//
//  CurrencyStack.swift
//  LOTR Converter
//
//  Created by Marc Cruz on 7/26/23.
//

import SwiftUI

struct CurrencyStack: View {
    @State var side: String
    @State var amountTemp = ""
    @State var typing = false
    @State var showSelectCurrency = false
    
    @Binding var currency: Currency
    @Binding var otherCurrency: Currency
    @Binding var amount: String
    @Binding var otherAmount: String
    
    var body: some View {
        VStack {
            // currency
            HStack {
                if side == "left" {
                    // currency image
                    Image(CurrencyImage
                        .allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                }

                // currency text
                Text(CurrencyText
                    .allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                if side == "right" {
                    // currency image
                    Image(CurrencyImage
                        .allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                }
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
            }
            .sheet(isPresented: $showSelectCurrency, content: {
                SelectCurrency(leftCurrency: $currency, rightCurrency: $otherCurrency)
            })

            // text field
            TextField("Amount", text: $amount, onEditingChanged: { typing in
                self.typing = typing
                amountTemp = amount
            })
            .padding(17)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(7)
            .multilineTextAlignment(side == "left" ? .leading : .trailing)
            .keyboardType(.decimalPad)
            .onChange(of: typing ? amount : amountTemp) {
                otherAmount = currency
                    .convert(amountString: amount, to: otherCurrency)
            }
            .onChange(of: currency) {
                amount = otherCurrency.convert(amountString: otherAmount, to: currency)
            }
        }
    }
}

#Preview {
    CurrencyStack(side: "left", currency: .constant(.silverPiece), otherCurrency: .constant(.goldPiece), amount: .constant("0.0"), otherAmount: .constant("0.0"))
}
