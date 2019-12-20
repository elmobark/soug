// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let products = try? newJSONDecoder().decode(Products.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProduct { response in
//     if let product = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Product
struct Product: Codable {
    let the0, the1, the2, the3: String
    let the4, the5, the6, the7: String
    let the8, the9, the10, the11: String
    let the12, the13, the14, the15: String
    let the16, id, categoryID, userID: String
    let name, city, status, offer: String
    let mark, price, useDate, details: String
    let contactPhone, checked, ask, createdAt: String
    let updatedAt, image: String
    static func getOnline(param:Selection,completion : @escaping (Products)->()){
        let url = utils().API_URL + "show/products.php?x=y&city=\(param.city)&status=\(param.type)&category=\(param.cat)"
        Alamofire.request(url).responseProducts { response in
                 if let product = response.result.value {
                   completion(product)
                }
               }
    }
    enum CodingKeys: String, CodingKey {
        case the0 = "0"
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
        case the6 = "6"
        case the7 = "7"
        case the8 = "8"
        case the9 = "9"
        case the10 = "10"
        case the11 = "11"
        case the12 = "12"
        case the13 = "13"
        case the14 = "14"
        case the15 = "15"
        case the16 = "16"
        case id
        case categoryID = "category_id"
        case userID = "user_id"
        case name, city, status, offer, mark, price
        case useDate = "use_date"
        case details
        case contactPhone = "contact_phone"
        case checked, ask
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case image
    }
}

typealias Products = [Product]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseProducts(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Products>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}
