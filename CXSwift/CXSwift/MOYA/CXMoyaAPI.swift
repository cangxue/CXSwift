//
//  CXMoyaAPI.swift
//  CXSwift
//
//  Created by mahong yang on 2019/6/26.
//  Copyright © 2019 mahong yang. All rights reserved.
//

import UIKit
import Moya

let CXMoyoAPIProvider = MoyaProvider<DouBan>()

public enum DouBan {
    case channels
    case playlist(String)
}

extension DouBan: TargetType {
    public var baseURL: URL {
        switch self {
        case .channels:
            return URL(string: "https://www.douban.com")!
        case .playlist(_):
            return URL(string: "https://douban.fm")!
            
        }
    }
    
    public var path: String {
        switch self {
        case .channels:
            return "/j/app/radio/channels"
        case .playlist(_):
            return "/j/mine/playlist"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .playlist(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    
}
