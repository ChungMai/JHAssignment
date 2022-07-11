//
//  NetworkManager.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation
import RxSwift

struct ZPWError {
    
}
final class NetworkManager{
    static let shared = NetworkManager()
    private init() {}
    
    private var rqBuilder = NetworkRequestBuilder()
    
    func doPost<T:Decodable>(with host: String,
                              path: String,
                              params: JSON?,
                              headers: [String: String]? = nil) -> Observable<T> {
        let request = rqBuilder.postRequest(with: host,
                                            path: path,
                                            bodys: params,
                                            headers: headers)
        return start(request: request, path: path)
    }
    
    func doGet<T:Decodable>(with host: String,
                             path: String = "",
                             params: JSON? = nil,
                             headers: [String: String]? = nil) -> Observable<T> {
        let request = rqBuilder.getRequest(with: host,
                                           path: path,
                                           params: params,
                                           headers: headers)
        return start(request: request, path: path)
    }
    
    private func start<T: Decodable>(request: URLRequest, path: String) ->  Observable<T> {
        // Time start call api
        return Observable.create { (signal) -> Disposable in
            let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
                // Handle response
                guard let data = data else {
                    if let error = error {
                        signal.onError(error)
                    }
                    return
                }
                do {
                    let response = try T.parse(from: data)
                    signal.onNext(response)
                }
                catch let error {
                    signal.onError(error)
                }
            }
            
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
