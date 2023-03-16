//
//  Delegate.swift
//  ProtocolSwitchLamp
//
//  Created by TJ on 2022/06/12.
//

import Foundation

protocol EditDelegate
{
    func didCompleteDone(_ controller: EditController , lampState: LampState)
}
