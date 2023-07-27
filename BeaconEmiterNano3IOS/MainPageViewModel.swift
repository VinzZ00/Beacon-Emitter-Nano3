//
//  MainPageViewModel.swift
//  BeaconEmiterNano3IOS
//
//  Created by Elvin Sestomi on 20/07/23.
//

import Foundation
import SwiftUI
import CoreBluetooth
import CoreLocation

class MainPageViewModel : NSObject, CBPeripheralManagerDelegate, ObservableObject {
    
    @Published var beaconStat : Bool = false;
    var beaconPeripheralData : NSDictionary!
    var peripheralManager : CBPeripheralManager!
    
    let beacon1  = CLBeaconRegion(uuid: UUID(uuidString: "949F3728-40D9-439B-BA39-A6DA550A1A74")!, major: 10, minor: 15, identifier: "1stBeacon" )
    let beacon2  = CLBeaconRegion(uuid: UUID(uuidString: "F17FFF32-5BA6-4E61-8AEE-77CFF2E2C318")!, major: 10, minor: 15, identifier: "2ndBeacon" )
    let beacon3  = CLBeaconRegion(uuid: UUID(uuidString: "9D360FFC-CA2E-4257-B99F-6FA649E4FC43")!, major: 10, minor: 15, identifier: "3rdBeacon" )
    let beacon4  = CLBeaconRegion(uuid: UUID(uuidString: "1BA8DCB1-8F29-4309-BC05-B6927E59DA65")!, major: 10, minor: 15, identifier: "4thBeacon" )
    
    @Published var selectedBeacon : CLBeaconRegion?
    
    let beacons : [CLBeaconRegion] = [
        CLBeaconRegion(uuid: UUID(uuidString: "949F3728-40D9-439B-BA39-A6DA550A1A74")!, major: 10, minor: 15, identifier: "1stBeacon" ),
        CLBeaconRegion(uuid: UUID(uuidString: "F17FFF32-5BA6-4E61-8AEE-77CFF2E2C318")!, major: 10, minor: 15, identifier: "2ndBeacon" ),
        CLBeaconRegion(uuid: UUID(uuidString: "9D360FFC-CA2E-4257-B99F-6FA649E4FC43")!, major: 10, minor: 15, identifier: "3rdBeacon" ),
        CLBeaconRegion(uuid: UUID(uuidString: "1BA8DCB1-8F29-4309-BC05-B6927E59DA65")!, major: 10, minor: 15, identifier: "4thBeacon" )
    ]
    
    func startEmitting() {
        guard let selectedBeacon else {
            print("ERROR, gaad beacon")
            return
        }
        
        if peripheralManager != nil {
            if peripheralManager.isAdvertising {
                peripheralManager.stopAdvertising()
                peripheralManager = nil
            }
        }
        
        beaconPeripheralData = selectedBeacon.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
        self.beaconStat = true
    }
    
    func stopEmitting() {
        peripheralManager.stopAdvertising()
        peripheralManager = nil
        beaconPeripheralData = nil
        selectedBeacon = nil
    }
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            peripheralManager.startAdvertising(beaconPeripheralData as? [String: Any])
        }
        else if peripheral.state == .poweredOff {
            peripheralManager.stopAdvertising()
        }
    }
    
    
    
}
