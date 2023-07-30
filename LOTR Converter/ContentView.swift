//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Marc Cruz on 7/20/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency
        = CurrencyUtils.getStoredCurrency(currencyName: "leftCurrency")
    @State var rightCurrency: Currency
        = CurrencyUtils.getStoredCurrency(currencyName: "rightCurrency")
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false

    var body: some View {
        ZStack {
            // background image
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)

            VStack {
                // prancing pony image
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                // currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                // currency conversion section
                HStack {
                    // left conversion section
                    CurrencyStack(side: "left",
                                  currency: $leftCurrency,
                                  otherCurrency: $rightCurrency,
                                  amount: $leftAmount,
                                  otherAmount: $rightAmount)

                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)

                    // right conversion section
                    CurrencyStack(side: "right",
                                  currency: $rightCurrency,
                                  otherCurrency: $leftCurrency,
                                  amount: $rightAmount,
                                  otherAmount: $leftAmount)
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)

                Spacer()

                // info button
                HStack {
                    Spacer()

                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfo()
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
