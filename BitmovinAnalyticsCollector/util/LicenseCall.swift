//
//  LicenseCall.swift
//  BitmovinAnalyticsCollector
//
//  Created by Cory Zachman on 1/30/18.
//  Copyright © 2018 Bitmovin. All rights reserved.
//

import Foundation

class LicenseCall {
    var config: BitmovinAnalyticsConfig
    var httpClient: HttpClient
    
    init(config: BitmovinAnalyticsConfig) {
        self.config = config
        self.httpClient = HttpClient(urlString: BitmovinAnalyticsConfig.analyticsLicenseUrl)
    }
    
    public func authenticate(_ completionHandler: @escaping (Bool) -> Void) -> Void {
        let licenseCallData = LicenseCallData()
        licenseCallData.key = self.config.key
        licenseCallData.domain = Util.bundle()
        licenseCallData.analyticsVersion = Util.version()
        self.httpClient.post(json: Util.toJson(object: licenseCallData)) { (data, response, error) in
            guard error == nil else {// check for fundamental networking error
                print(String(describing: error))
                completionHandler(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(false)
                return
            }
            
            if(httpResponse.statusCode >= 400){
                completionHandler(false)
            }
            
            guard let data = data else {
                completionHandler(false)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                if let status = json["status"] as? String {
                    return completionHandler(status == "granted")
                }
            } catch {
                completionHandler(false)
            }
        }
    }
}
