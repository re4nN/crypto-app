//
//  CryptoService.swift
//  Crypto
//
//  Created by Ryan Rouxinol on 21/08/24.
//

import Foundation

class CryptoService {
    
    private let baseURL: String = "https://api.coincap.io/v2/assets"
    private let session = URLSession.shared
    
    func fetchCryptos(_ completion: @escaping ([Crypto]?) -> Void) {
        guard let url = URL(string: baseURL) else {
            print("URL inválida")
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Nenhum dado retornado")
                completion(nil)
                return
            }
            
            do {
                let cryptoResponse = try JSONDecoder().decode(CryptoResponse.self, from: data)
                completion(cryptoResponse.data)
            } catch {
                print("Erro ao decodificar JSON: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}

// MARK: - CryptoResponse
struct CryptoResponse: Codable {
    let data: [Crypto]
}

// MARK: - Crypto
struct Crypto: Codable {
    let id: String
    let symbol: String
    let name: String
    let priceUsd: String
    let changePercent24Hr: String

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case priceUsd = "priceUsd"
        case changePercent24Hr = "changePercent24Hr"
    }
}
