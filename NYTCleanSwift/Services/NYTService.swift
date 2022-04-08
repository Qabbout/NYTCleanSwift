//
//  NYTService.swift
//  NYTCleanSwift
//
//  Created by Abdulrahman on 4/8/22.
//

import Foundation


struct NYTService {

    //MARK: Variables


    static let API_KEY = (Bundle.main.infoDictionary?["API_KEY"] as? String)!

    static let section = "all-sections"
    static let period = "7"
    static let baseUrlString = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(API_KEY)"



    private init() { }
    static var shared = NYTService()


    //MARK: Business Logic

    func getArticles(with urlString: String, completion: @escaping (Swift.Result<ResultResponse, Error>) -> Void) {
        if let url = URL(string: urlString) {

            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { data, response, error in

                if let error = error {
                    completion(.failure(error))

                }

                if let data = data {
                    do {
                        let results = try JSONDecoder().decode(ResultResponse.self, from: data)
                        completion(.success(results))
                    } catch {
                        completion(.failure(error))
                    }



                }
            }
            task.resume()
        }

    }



}
