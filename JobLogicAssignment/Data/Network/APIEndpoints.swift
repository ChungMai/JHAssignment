//
//  APIEndpoints.swift
//  JobLogicAssignment
//
//  Created by chungmh on 21/09/2022.
//

import Foundation

struct APIEndpoints {
    static func makeCallEndpoint() -> Endpoint<[JHContact]> {
        return Endpoint(path: "https://my-json-server.typicode.com/imkhan334/demo-1/call",
                        method: .get)
    }
}
