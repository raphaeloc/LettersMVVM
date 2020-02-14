//
//  UINavigationControllerStub.swift
//  LettersMVVMTests
//
//  Created by Raphael Oliveira Chagas on 12/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class UINavigationControllerStub: UINavigationController {
    
    weak var pushedViewControllerForTests: UIViewController?
    weak var presentedViewControllerForTests: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
        pushedViewControllerForTests = viewController
    }
    
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        super.setNavigationBarHidden(hidden, animated: false)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: false, completion: completion)
        presentedViewControllerForTests = viewControllerToPresent
    }
}
