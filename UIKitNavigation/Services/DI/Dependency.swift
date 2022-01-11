//
//  Dependency.swift
//  UIKitNavigation
//
//  Created by Danil on 11.01.2022.
//

import Foundation

struct Dependency {
    typealias ResolveBlock<T> = () -> T

    private(set) var value: Any! // Actual value will be assigned after resolve() call
    private let resolveBlock: ResolveBlock<Any>
    let name: String

    init<T>(_ block: @escaping ResolveBlock<T>) {
        resolveBlock = block // Save block for future
        name = String(describing: T.self)
    }
    mutating func resolve() {
        value = resolveBlock()
    }
}

@resultBuilder struct DependencyBuilder {
    static func buildBlock(_ dependency: Dependency) -> Dependency { dependency }
    static func buildBlock(_ dependencies: Dependency...) -> [Dependency] { dependencies }
    static func buildBlock(_ dependencies: [Dependency]...) -> [Dependency] { dependencies.reduce([], { $0 + $1 }) }
}

class Dependencies {
    
    static private(set) var shared = Dependencies() // 1
    fileprivate var dependencies = [Dependency]() // 2
    
    convenience init(@DependencyBuilder _ dependencies: () -> [Dependency]) {
        self.init()
        dependencies().forEach { register($0) }
    }

    convenience init(@DependencyBuilder _ dependency: () -> Dependency) {
        self.init()
        register(dependency())
    }

    func register(_ dependency: Dependency) {
        // Avoid duplicates
        guard dependencies.firstIndex(where: { $0.name == dependency.name }) == nil else {
            debugPrint("\(String(describing: dependency.name)) already registered, ignoring")
            return
        }
        dependencies.append(dependency)
    }

    func build() {
        // We assuming that at this point all needed dependencies are registered
        for index in dependencies.startIndex..<dependencies.endIndex {
            dependencies[index].resolve()
        }
        Self.shared = self // 3
    }

    func resolve<T>() -> T {
        guard let dependency = dependencies.first(where: { $0.value is T })?.value as? T else {
            fatalError("Can't resolve \(T.self)")
        }
        return dependency
    }
}


@propertyWrapper
struct Injected<Dependency> {

    var dependency: Dependency! // Resolved dependency

    var wrappedValue: Dependency {
        mutating get {
            if dependency == nil {
                let copy: Dependency = Dependencies.shared.resolve()
                self.dependency = copy // Keep copy
            }
            return dependency
        }
        mutating set {
            dependency = newValue
        }
    }
}
