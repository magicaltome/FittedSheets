//
//  SheetContentViewDelegate.swift
//  FittedSheetsPod
//
//  Created by Gordon Tucker on 7/29/20.
//  Copyright © 2020 Gordon Tucker. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

protocol SheetContentViewDelegate: class {
    func preferredHeightChanged(oldHeight: CGFloat, newSize: CGFloat)
    func pullBarTapped()
    func dismissButtonTapped()
}

#endif // os(iOS) || os(tvOS) || os(watchOS)
