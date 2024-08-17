//
//  NetworkingManager.swift
//  SwiftCrypto
//
//  Created by Mert Durkaya on 21/03/2024.
//

import Combine
import Foundation

class NetworkingManager {
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown

        var errorDescription: String? {
            switch self {
            case let .badURLResponse(url: url):
                return "[❌] Bad response from URL: \(url)"
            case .unknown:
                return "[⚠️] Unknown error occurred"
            }
        }
    }

    static func download(url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try handleResponse(output: $0) }
            .retry(3)
            .eraseToAnyPublisher()
    }

    static func handleResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingError.badURLResponse(url: output.response.url ?? URL(string: "n/a")!)
        }
        return output.data
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case let .failure(error):
            print("Error: \(error.localizedDescription)")
        }
    }
}
