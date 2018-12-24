import Foundation

protocol MainCoordinatorProtocol: Coordinatorable {
    var finishMain:((Bool) -> (Void))? { get set }
}

class MainCoordinator: Coordinator, MainCoordinatorProtocol {
    
    struct Dependencies {
        let coordinatorFactory: CoordinatorFactory
    }
    
    var finishMain: ((Bool) -> (Void))?
    
    // Private
    private let dp: Dependencies
    
    init(router: Router, dependencies: Dependencies) {
        self.dp = dependencies
        super.init(router: router)
    }
    
    override func start() {
    }
}
