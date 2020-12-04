//
//  PBResult+Swift.swift
//  ObjCResult
//
//  Created by Andrii Serohin on 15.07.2020.
//  Copyright © 2020 Andrii Serohin. All rights reserved.
//


extension Result where Success: AnyObject, Failure: NSError {
    
    init(objC: PBResult<Success, Failure>) {
        switch objC.identifier {
        case .success:
            guard let value = objC.value else { fatalError() }
            self = .success(value)
        case .failure:
            guard let error = objC.error else { fatalError() }
            self = .failure(error)
        @unknown default:
            fatalError("Unexpected PBResult identifier \(objC.identifier).")
        }
    }
    
    var objC: PBResult<Success, NSError> {
        switch self {
        case .success(let value):
            return .success(value)
        case .failure(let error):
            return .failure(error)
        }
    }
    
}


@objc
extension ViewController {
    
    func get(result: PBResult<NSString, NSError>) {
        
        let swift: Result<NSString, NSError> = .init(objC: result)
        let value = try? swift.get()

        print("\(value ?? "---") == \(swift.objC.value ?? "---")")
    }
    
}
