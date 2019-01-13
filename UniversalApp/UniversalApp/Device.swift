//
//  Device.swift
//  UniversalApp
//
//  Created by oingbong on 13/01/2019.
//

import UIKit

struct Device {
    static var isSimulator: Bool {
        return ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    
    static var version: String {
        let device = UIDevice()
        return device.systemVersion
    }
    
    static var name: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1, { ptr in
                String(validatingUTF8: ptr)
            })
        }
        return modelCode ?? ""
    }
}

// MARK: Reference
// [ios - 연결 usb 아이폰 맥북 현재 iPhone / 기기 모델을 확인하는 방법은 무엇입니까? - CODE Q&A 해결 된 문제](https://code.i-harness.com/ko-kr/q/18d2b76)
