//
//  Scheduler.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//

import Foundation

final class Scheduler {
    static var backgroundWorkScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 5
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()
    static let mainScheduler = RunLoop.main
}
