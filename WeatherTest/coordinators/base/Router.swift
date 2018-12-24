import UIKit


//Copy/Paste from extist project
//Don't know where source for it
protocol Routerable: Presentable {
  
  func presentModal(_ module: Presentable)
  func presentModal(_ module: Presentable, animated: Bool)
  func presentModal(_ module: Presentable, animated: Bool, completion: @escaping (() -> Void))
  func dismissModal()
  func dismissModal(animated: Bool, completion: @escaping (() -> Void))
  
  func push(_ module: Presentable)
  func push(_ module: Presentable, animated: Bool)
  func pop()
  func pop(animated: Bool)
  
  func push(_ modules: [Presentable])
  func push(_ modules: [Presentable], animated: Bool)
  func push(_ modules: [Presentable], after: PresentableID)
  func push(_ modules: [Presentable], after: PresentableID, animated: Bool)
  func pop(count:Int)
  func pop(count:Int, animated: Bool)
  func popTo(_ presentId: PresentableID, animated: Bool)
  
  func setModules(_ modules: [Presentable])
  func setModules(_ modules: [Presentable], hideBar: Bool)
  func setModules(_ modules: [Presentable], hideBar: Bool, animated: Bool)
  
  func popToRootModule(animated: Bool)
  func showTabBar(_ show: Bool)
}

class Router: Routerable {
  
  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  // MARK: - Modal presentation / dismissal
  
  func presentModal(_ module: Presentable) {
    self.dismissModal(animated: false) {}
    presentModal(module, animated: true)
  }
  
  func presentModal(_ module: Presentable, animated: Bool) {
    navigationController.present(module.presentable(), animated: animated, completion: {})
  }
  
  func presentModal(_ module: Presentable, animated: Bool, completion: @escaping (() -> Void)) {
    navigationController.present(module.presentable(), animated: animated, completion: completion)
  }
  
  func dismissModal() {
    dismissModal(animated: true, completion: {})
  }
  
  func dismissModal(animated: Bool, completion: @escaping (() -> Void)) {
    navigationController.dismiss(animated: animated, completion: completion)
  }
  
  // MARK: - push/pop single view controler
  
  func push(_ module: Presentable)  {
    push(module, animated: true)
  }
  
  func push(_ module: Presentable, animated: Bool) {
    let controller = unwrapPresentable(module)
    navigationController.pushViewController(controller, animated: animated)
  }
  
  func push(_ modules: [Presentable]) {
    push(modules, animated: true)
  }
  
  func pop()  {
    pop(animated: true)
  }
  
  func pop(animated: Bool)  {
    navigationController.popViewController(animated: animated)
  }
  
  // MARK: - push/pop several view controlers
  
  func push(_ modules: [Presentable], animated: Bool) {
    let controllers = unwrapPresentables(modules)
    let stack = navigationController.viewControllers + controllers
    navigationController.setViewControllers(stack, animated: animated)
  }
  
  func push(_ modules: [Presentable], after: PresentableID) {
    push(modules, after: after, animated: true)
  }
  
  func push(_ modules: [Presentable], after: PresentableID, animated: Bool) {
    var stack = navigationController.viewControllers
    let vc = stack.first(where: {vc -> Bool in
      return vc.presentId() == after
    })
    if let vc = vc {
      var proceed = true
      while proceed {
        proceed = stack.popLast() == vc
      }
      let controlers = unwrapPresentables(modules)
      stack += controlers
      navigationController.setViewControllers(stack, animated: animated)
    }
  }
  
  func pop(count:Int) {
    pop(count: count, animated: true)
  }
  
  func pop(count:Int, animated: Bool) {
    var stack = navigationController.viewControllers
    var popCount = count
    while !stack.isEmpty && popCount > 0  {
      stack.removeLast()
      popCount -= 1
    }
    navigationController.setViewControllers(stack, animated: animated)
  }
  
  func popTo(_ presentId: PresentableID, animated: Bool) {
    let vc = navigationController.viewControllers.first { vc -> Bool in
      return vc.presentId() == presentId
    }
    if let vc = vc {
      navigationController.popToViewController(vc, animated: animated)
    }
  }
  
  // MARK: - replace full navigation stack
  
  func setModules(_ modules: [Presentable]) {
    setModules(modules, hideBar: false)
  }
  
  func setModules(_ modules: [Presentable], hideBar: Bool) {
    setModules(modules, hideBar: hideBar, animated: true)
  }
  
  func setModules(_ modules: [Presentable], hideBar: Bool, animated: Bool) {
    let controllers = unwrapPresentables(modules)
    
    navigationController.setViewControllers(controllers, animated: animated)
    navigationController.isNavigationBarHidden = hideBar
  }
  
  // MARK: - Utility
  
  func popToRootModule(animated: Bool) {
    navigationController.popToRootViewController(animated: animated)
  }
  
  func showTabBar(_ show: Bool) {
    let showBlock = { [weak self] in
      self?.navigationController.tabBarController?.tabBar.alpha = 1
    }
    let hideBlock = { [weak self] in
      self?.navigationController.tabBarController?.tabBar.alpha = 0
    }
    UIView.animate(withDuration: 0.3) {
      show ? showBlock() : hideBlock()
    }
  }
  
  private func unwrapPresentables(_ modules: [Presentable]) -> [UIViewController] {
    let controllers = modules.map { module -> UIViewController in
      return unwrapPresentable(module)
    }
    return controllers
  }
  
  private func unwrapPresentable(_ module: Presentable) -> UIViewController {
    let controller = module.presentable()
    if controller is UINavigationController {
      assertionFailure("Forbidden push UINavigationController.")
    }
    return controller
  }
  
  // MARK: - Presentable
  
  func presentable() -> UIViewController {
    return navigationController
  }
  
  func presentId() -> String {
    return navigationController.presentId()
  }
  static func presentId() -> String {
    return UINavigationController.presentId()
  }
  
}
