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
        do {
            let moduleInput = WeatherViewModel.ModuleInputData()
            let (viewController, _) = try WeatherConfigurator.configure(data: moduleInput)
            self.router.push( viewController )
        } catch {
            print("Unexpected error: \(error)")
        }
    }
}
