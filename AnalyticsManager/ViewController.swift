//
//  ViewController.swift
//  AnalyticsManager
//
//  Created by Saikat Das on 14/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .cyan
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = LoginViewController(
            analyticsEngine: FirebaseAnalyticsEngine()
        )
        present(vc, animated: true)
    }
}



protocol AnalyticsEngine {
    func log(_ event: AnalyticsEvent)
}

protocol AnalyticsEvent {
    var name: String { get }
    var metadata: [String: String] { get }
}

class LoginViewController: UIViewController {
    var analyticsEngine: AnalyticsEngine
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(analyticsEngine: AnalyticsEngine) {
        self.analyticsEngine = analyticsEngine
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        analyticsEngine.log(LoginEventsEnum.viewWillAppear)
    }
}

enum LoginEventsEnum: AnalyticsEvent {
    var name: String {
        switch self {
        case .viewWillAppear:
            return "viewWillAppear"
        }
    }
    
    var metadata: [String : String] {
        switch self {
        case .viewWillAppear:
            return ["viewWillAppear": "Appeared"]
        }
    }
    
    case viewWillAppear
}

class FirebaseAnalyticsEngine: AnalyticsEngine {
    func log(_ event: AnalyticsEvent) {
        print(event.name)
        print(event.metadata)
    }
}


enum Sam {
    case sandy
    case das
}
