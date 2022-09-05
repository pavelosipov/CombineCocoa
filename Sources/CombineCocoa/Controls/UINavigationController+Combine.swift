//
//  UINavigationController+Combine.swift
//  CombineCocoa
//
//  Created by Pavel Osipov on 06.09.2022.
//  Copyright © 2022 PJSC MegaFon. All rights reserved.
//

#if !(os(iOS) && (arch(i386) || arch(arm)))

import UIKit
import OpenCombine

public extension UINavigationController {
    /// Combine publisher for delegate method `navigationController(:willShow:animated:)`.
    var willShowPublisher: AnyPublisher<(viewController: UIViewController, animated: Bool), Never> {
        let selector = #selector(UINavigationControllerDelegate.navigationController(_:willShow:animated:))
        return delegateProxy
            .interceptSelectorPublisher(selector)
            .map { args -> (viewController: UIViewController, animated: Bool) in
                // swiftlint:disable force_cast
                let viewController = args[1] as! UIViewController
                let animated = (args[2] as! NSNumber).boolValue
                return (viewController, animated)
                // swiftlint:enable force_cast
            }
            .eraseToAnyPublisher()
    }

    /// Combine publisher for delegate method `navigationController(:didShow:animated:)`.
    var didShowPublisher: AnyPublisher<(viewController: UIViewController, animated: Bool), Never> {
        let selector = #selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:))
        return delegateProxy
            .interceptSelectorPublisher(selector)
            .map { args -> (viewController: UIViewController, animated: Bool) in
                // swiftlint:disable force_cast
                let viewController = args[1] as! UIViewController
                let animated = (args[2] as! NSNumber).boolValue
                return (viewController, animated)
                // swiftlint:enable force_cast
            }
            .eraseToAnyPublisher()
    }

    private var delegateProxy: UINavigationControllerDelegateProxy {
        .createDelegateProxy(for: self)
    }
}

private class UINavigationControllerDelegateProxy: DelegateProxy, UINavigationControllerDelegate, DelegateProxyType {
    func setDelegate(to object: UINavigationController) {
        object.delegate = self
    }
}

#endif

