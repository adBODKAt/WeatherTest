//
//
//
//
//
//
//

import Foundation

protocol AppCoordinatorProtocol: class {}

class AppCoordinator: Coordinator, AppCoordinatorProtocol {
    struct Dependencies {
        let coordinatorFactory: CoordinatorFactory
    }
    
    private let dp: Dependencies
    
    init(router: Router, dependencies: Dependencies) {
        self.dp = dependencies
        super.init(router: router)
    }
    
    override func start() {
        startMain()
    }
    
    func startMain() {
        let coordinator = dp.coordinatorFactory.mainFlow(router: router)
        coordinator.finishMain = { [weak self] success in
            self?.removeChild(coordinator)
            self?.start()
        }
        self.addChild(coordinator)
        coordinator.start()
    }
}
