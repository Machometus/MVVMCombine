//
//  HttpProtocol.swift
//  MyUnicorn
//
//  Created by Mohamed Salem on 27.12.19.
//  Copyright © 2020 Mohamed Salem. All rights reserved.
//

import Foundation
import Combine

protocol HttpProtocol {
    
    /// Use GET requests to retrieve resource representation/information only – and not to modify it in any way. As GET requests do not change the state of the resource, these are said to be safe methods. Additionally, GET APIs should be idempotent, which means that making multiple identical requests must produce the same result every time until another API (POST or PUT) has changed the state of the resource on the server.
    func get(url: URL?) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
    
    /// Use POST APIs to create new subordinate resources, e.g., a file is subordinate to a directory containing it or a row is subordinate to a database table. Talking strictly in terms of REST, POST methods are used to create a new resource into the collection of resources.
    func post<T: Codable>(url: URL?, value: T) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
    
    /// Use PUT APIs primarily to update existing resource (if the resource does not exist, then API may decide to create a new resource or not). If a new resource has been created by the PUT API, the origin server MUST inform the user agent via the HTTP response code 201 (Created) response and if an existing resource is modified, either the 200 (OK) or 204 (No Content) response codes SHOULD be sent to indicate successful completion of the request.
    func put<T: Codable>(url: URL?, value: T) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
    
    /// DELETE APIs are used to delete resources (identified by the Request-URI). DELETE operations are idempotent. If you DELETE a resource, it’s removed from the collection of resources. If the request passes through a cache and the Request-URI identifies one or more currently cached entities, those entries SHOULD be treated as stale. Responses to this method are not cacheable.
    func delete(url: URL?) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}
