//
//  DummyViewModel.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/03.
//

import Foundation
import Combine

final class DummyViewModel: ViewModelType {
    // MARK: - Input
    struct Input {
        
    }
    // MARK: - Output
    struct Output {
    }
    // MARK: - Dependency
    
    // MARK: - LifeCycle
    
    // MARK: - Helper
    internal func transform(input: Input) -> Output {
        return Output()
    }
}

