//
//  ModelOptionViewModel.swift
//  TopCariving
//
//  Created by 조승기 on 2023/08/22.
//

import Combine
import Foundation

class ModelOptionViewModel: ViewModelType {
    // MARK: - Input
    struct Input {
        let viewDidLoadPublisher: AnyPublisher<Void, Never>
        let tapNextButtonPublisher: AnyPublisher<Void, Never>
        let tapCarIndexPublisher: AnyPublisher<Int, Never>
    }
    // MARK: - Output
    struct Output {
        var model = PassthroughSubject<Model, Never>()
    }
    // MARK: - Dependency
    var bag = Set<AnyCancellable>()
    let httpClient: HTTPClientProtocol
    
    // MARK: - LifeCycle
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    // MARK: - Helper
    func transform(input: Input) -> Output {
        let output = Output()
        input.viewDidLoadPublisher.sink(receiveValue: { [weak self] _ in
            guard let self else { return }
            Task {
//                httpClient.sendRequest(endPoint: <#T##EndPoint#>, responseModel: <#T##Decodable.Protocol#>)
            }
        }).store(in: &bag)
        return output
    }
}
