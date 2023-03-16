//
//  Protocol.swift
//  NavigationProtocolDataFlow
//
//  Created by TJ on 2022/06/12.
//

import Foundation

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController , message: String)
    
    func didIsOnChangeDone(_ controller: EditViewController , isOn: Bool)
    
}
