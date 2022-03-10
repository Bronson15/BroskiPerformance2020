//
//  FetchHealthKitData.swift
//  Broski Performance
//
//  Created by Bronson Lane on 8/17/20.
//  Copyright © 2020 iOSLife. All rights reserved.
//

import HealthKit

func FetchHealthKitData() -> Void {
//    var user: User = userData
    let healthStore = HKHealthStore()
    
    if HKHealthStore.isHealthDataAvailable() {
        let readData = Set([HKObjectType.quantityType(forIdentifier: .bodyMassIndex)!,
                            HKObjectType.quantityType(forIdentifier: .bodyFatPercentage)!,
                            HKObjectType.quantityType(forIdentifier: .bodyMass)!])
        
        healthStore.requestAuthorization(toShare: [], read: readData) { (success, error) in
            if success {
                let calendar = NSCalendar.current
                var anchorComponents = calendar.dateComponents([.day, .month, .year, .weekday], from: NSDate() as Date)
                let offset = (7 + anchorComponents.weekday! - 2) % 7
                
                anchorComponents.day! -= offset
                anchorComponents.hour = 2
                
                guard let anchorDate = Calendar.current.date(from: anchorComponents) else {
                    fatalError("*** unable to create a valid date from the given components ***")
                }
                
                let interval = NSDateComponents()
                interval.minute = 30
                                    
                let endDate = Date()
                                            
                guard let startDate = calendar.date(byAdding: .month, value: -1, to: endDate) else {
                    fatalError("*** Unable to calculate the start date ***")
                }
                                    
                guard let bodyFatQuantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyFatPercentage) else {
                    fatalError("*** Unable to create a step count type ***")
                }

                let bodyFatQuery = HKStatisticsCollectionQuery(quantityType: bodyFatQuantityType,
                                                        quantitySamplePredicate: nil,
                                                        options: .discreteAverage,
                                                        anchorDate: anchorDate,
                                                        intervalComponents: interval as DateComponents)
                
                bodyFatQuery.initialResultsHandler = {
                    query, results, error in
                    
                    guard let statsCollection = results else {
                        fatalError("*** An error occurred while calculating the statistics: \(String(describing: error?.localizedDescription)) ***")
                        
                    }
                                        
                    statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                        if let quantity = statistics.averageQuantity() {
                            let value = quantity.doubleValue(for: HKUnit.percent())
                            print("Body Fat Percentage: " + String(value))
//                            user.bodyFatPercent = value
                                                        
                        }
                    }
                    
                }
                
                guard let bodyMassIndexQuantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex) else {
                    fatalError("*** Unable to create a step count type ***")
                }

                let bodyMassIndexQuery = HKStatisticsCollectionQuery(quantityType: bodyMassIndexQuantityType,
                                                        quantitySamplePredicate: nil,
                                                        options: .discreteAverage,
                                                        anchorDate: anchorDate,
                                                        intervalComponents: interval as DateComponents)
                
                bodyMassIndexQuery.initialResultsHandler = {
                    query, results, error in
                    
                    guard let statsCollection = results else {
                        fatalError("*** An error occurred while calculating the statistics: \(String(describing: error?.localizedDescription)) ***")
                        
                    }
                                        
                    statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                        if let quantity = statistics.averageQuantity() {
                            let value = quantity.doubleValue(for: HKUnit.count())
                            print("Body Mass Index: " + String(value))
//                            user.bodyMassIndex = value
                        }
                    }
                    
                }
                
                guard let bodyMassQuantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass) else {
                    fatalError("*** Unable to create a step count type ***")
                }

                let bodyMassQuery = HKStatisticsCollectionQuery(quantityType: bodyMassQuantityType,
                                                        quantitySamplePredicate: nil,
                                                        options: .discreteAverage,
                                                        anchorDate: anchorDate,
                                                        intervalComponents: interval as DateComponents)
                
                bodyMassQuery.initialResultsHandler = {
                    query, results, error in
                    
                    guard let statsCollection = results else {
                        fatalError("*** An error occurred while calculating the statistics: \(String(describing: error?.localizedDescription)) ***")
                        
                    }
                                        
                    statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                        if let quantity = statistics.averageQuantity() {
                            let value = quantity.doubleValue(for: HKUnit.pound())
                            print("Body Mass: " + String(value))
//                            user.userWeight = value
                        }
                    }
                    
                }
                
                healthStore.execute(bodyFatQuery)
                healthStore.execute(bodyMassIndexQuery)
                healthStore.execute(bodyMassQuery)
                
                
                let file = Bundle.main.url(forResource: "userData.json", withExtension: nil)
//                writeToFile(location: file!, user: user)
            } else {
                    print("Authorization failed")
            }
        }

    } else {
        print("No HealthKit data available")
    }
}

func writeToFile(location: URL, user: User) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
//            let JsonData = try encoder.encode(user)
//            try JsonData.write(to: location)
        }catch{}
    }
