//
//  NetworkRequestBuilder.swift
//  JobLogicAssignment
//
//  Created by chungmh on 08/07/2022.
//

import Foundation

enum ZPHTTPMethod: String {
    case post   = "POST"
    case get    = "GET"
    case put    = "PUT"
}

let defaultTimeout = 30.0

final class NetworkRequestBuilder {
    func getRequest(with host: String,
                    path: String,
                    params: JSON?,
                    headers: [String: String]? = nil) -> URLRequest {
        var request = makeURLRequest(from: host,
                                    path: path,
                                    params: params,
                                    timeout: defaultTimeout)
        addHeader(for: &request, withAdditionalHeaders: headers)
        request.httpMethod = ZPHTTPMethod.get.rawValue
        return request
    }

    func postRequest(with host: String,
                     path: String,
                     bodys: JSON?,
                     headers: [String: String]? = nil) -> URLRequest {

        var request = URLRequest(url: url(from: host, path: path),
                                 timeoutInterval: defaultTimeout)
        addHeader(for: &request, withAdditionalHeaders: headers)
        request.httpMethod = ZPHTTPMethod.post.rawValue
        request.httpBody = bodys?.toData
        return request
    }

    private func addHeader(for request: inout URLRequest,
                           withAdditionalHeaders additionalHeaders: [String: String]? = nil) {
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let nonNilAdditionalHeaders = additionalHeaders {
            nonNilAdditionalHeaders.forEach {
                request.setValue($0.value, forHTTPHeaderField: $0.key)
            }
        }
    }

    private func url(from host: String, path: String) -> URL {
        let fullPath = host + path
        // Force unwrap cause just sure that
        // cannot make request with empty host or path
        return URL(string: fullPath)!
    }
    
    func makeURLRequest(from host: String,
                              path: String,
                              params: JSON?,
                              timeout: TimeInterval) -> URLRequest {

        let url = host + path
        var components = URLComponents(string: url)!
        components.queryItems = params?.compactMap { (key, value) in
            if let value = value as? String {
                return URLQueryItem(name: key, value: value)
            }
            return nil
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        return URLRequest(url: components.url!,
                          timeoutInterval: timeout)
    }
}
