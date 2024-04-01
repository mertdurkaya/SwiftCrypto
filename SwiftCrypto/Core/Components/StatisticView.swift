//
//  StatisticView.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 01/04/2024.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: (stat.percentageChange ?? 0) >= 0 ? "chevron.up" : "chevron.down")
                Text(stat.percentageChange?.asPercentString() ?? "")
            }
            .font(.caption)
            .bold()
            .foregroundStyle(stat.percentageChange ?? 0 >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0 : 1)
            
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.stat1)
                .preferredColorScheme(.light)
            StatisticView(stat: dev.stat2)
                .preferredColorScheme(.dark)
            StatisticView(stat: dev.stat1Minus)
                .preferredColorScheme(.light)
            StatisticView(stat: dev.stat1Minus)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
