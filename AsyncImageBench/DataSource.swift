//
//  DataSource.swift
//  AsyncImageBench
//
//  Created by mironal on 2016/08/15.
//  Copyright © 2016年 com.covelline. All rights reserved.
//

import UIKit

class DataSource: NSObject {

    let images = {
        return Array(1...500).map {
            String(format: "%04d.png", $0)
        }
    }()

    func urlForImage(baseURL: NSURL, atIndex: NSInteger) -> NSURL {
        return baseURL.URLByAppendingPathComponent(images[atIndex])
    }
}
