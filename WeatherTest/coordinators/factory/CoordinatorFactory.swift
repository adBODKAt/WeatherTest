import Foundation

class CoordinatorFactory {
    func mainFlow(router:Router) -> MainCoordinatorProtocol {
        let dp = MainCoordinator.Dependencies(coordinatorFactory: self)
        return MainCoordinator.init(router: router, dependencies: dp)
    }
}
