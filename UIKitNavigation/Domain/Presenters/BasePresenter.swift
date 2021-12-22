//
//  BasePresenter.swift
//  UIKitNavigation
//
//  Created by Danil on 22.12.2021.
//

import Foundation
import Combine
import Foundation

extension String: Error {}

class BasePresenter {
    private var bag: Set<AnyCancellable> = []

    func baseRequest<T: Codable>(publisher: AnyPublisher<T, Error>, handler: @escaping (Result<T, String>) -> Void) {
        publisher
            .subscribe(on: DispatchQueue.global())
            .receive(on: DispatchQueue.main)
            .mapError { error -> Error in
                debugPrint(error.localizedDescription)
                handler(.failure(error.localizedDescription))
                return error
            }
            .sink(receiveCompletion: { _ in }, receiveValue: { result in
                debugPrint("result", result)
                handler(.success(result))
            })
            .store(in: &bag)
    }
}
