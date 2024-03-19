//
//  ButtonBenefitViewModel.swift
//  TossBenefitTab
//
//  Created by 최낙주 on 3/19/24.
//

import Foundation
import Combine

final class ButtonBenefitViewModel {
    @Published var benefit: Benefit
    @Published var benefitDetails: BenefitDetails?
    
    init(benefit: Benefit) {
        self.benefit = benefit
    }
    
    func fetchDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.benefitDetails = .default
        }
    }
}
