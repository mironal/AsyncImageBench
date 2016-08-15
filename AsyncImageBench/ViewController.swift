//
//  ViewController.swift
//  AsyncImageBench
//
//  Created by mironal on 2016/08/15.
//  Copyright © 2016年 com.covelline. All rights reserved.
//

import UIKit

import SDWebImage
import PINRemoteImage
import PINCache

/*

 500 枚の画像の読み込みを 4回繰り返した合計時間(つまり2000枚の画像の読み込みを行った合計時間).

 時間, 終了時のメモリ使用量

 ### SDWebImage

 15.459992945194244 ms, 305.4 MB
 15.180207014083862 ms, 305.9 MB
 14.194296956062317 ms, 306.4 MB
 15.525336980819702 ms, 305.5 MB
 15.591868042945862 ms, 305.4 MB

 ### PINRemoteImage

 13.661346018314362 ms, 34.7 MB
 13.862448990345001 ms, 35.7 MB
 14.107374012470245 ms, 35.8 MB
 13.682069957256317 ms, 34.4 MB
 15.576615989208221 ms, 35.1 MB

 */
class ViewController: UIViewController {

    @IBOutlet weak var iv1: UIImageView!

    @IBOutlet weak var urlField: UITextField!

    var dataSource = DataSource()

    var baseURL = NSURL()

    var datas = [String]()

    var startTime: NSDate?
    var endTime: NSDate?

    var numOfFiles = 0

    @IBAction func pushStartSDWebImage(sender: AnyObject) {

        func bind(iv: UIImageView) {

            if let url = take() {

                iv.sd_setImageWithURL(url) { (image, error, type, url) in

                    guard error == nil else {
                        print(error)
                        return
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        bind(iv)
                    })
                }
            } else {
                finish()
            }
        }

        clearCache {[unowned self] in
            self.reset()
            bind(self.iv1)
        }
    }

    @IBAction func pushStartPINRemoteImage(sender: AnyObject) {

        func bind(iv: UIImageView) {
            if let url = take() {
                iv.pin_setImageFromURL(url, completion: { (result) in

                    guard result.error === nil else {
                        print(result.error!)
                        return
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        bind(iv)
                    })
                })
            } else {
                finish()
            }
        }

        clearCache {[unowned self] in
            self.reset()
            bind(self.iv1)
        }
    }

    func take() -> NSURL? {

        if datas.isEmpty {
            return nil
        }

        let filename = datas.removeFirst()

        let cnt = datas.count

        if cnt % 100 == 0 {
            print("\(cnt) / \(numOfFiles)")
        }

        return baseURL.URLByAppendingPathComponent(filename)
    }

    func clearCache(completion: () -> ()) {

        PINRemoteImageManager.sharedImageManager().cache.removeAllObjects()
        SDWebImageManager.sharedManager().imageCache.clearMemory()
        SDWebImageManager.sharedManager().imageCache.clearDiskOnCompletion {
            completion()
        }
    }

    func reset() {

        datas.removeAll()

        datas.appendContentsOf(dataSource.images)
        datas.appendContentsOf(dataSource.images)
        datas.appendContentsOf(dataSource.images)
        datas.appendContentsOf(dataSource.images)

        numOfFiles = datas.count

        baseURL = NSURL(string: urlField.text!)!
        startTime = NSDate()
    }

    func finish() {

        endTime = NSDate()
        let interval = endTime?.timeIntervalSinceDate(startTime!)
        print("interval:", interval)
    }
}
