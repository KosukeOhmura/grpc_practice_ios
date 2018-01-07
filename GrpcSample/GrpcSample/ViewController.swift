//
//  ViewController.swift
//  GrpcSample
//
//  Created by Ohmura Kosuke on 2018/01/03.
//  Copyright © 2018年 KosukeOhmura. All rights reserved.
//

import UIKit
import gRPC

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTap(_ sender: UIButton) {
        let service = Echo_EchoService(address: "192.168.1.191:50051", secure: false)

        let request = Echo_EchoRequest.with { $0.text = "this is the first request" }
        do {
            let response = try service.get(request)
            print("sync: \(response.text)")
        } catch {
            print("error:", error)
        }
    }

}
