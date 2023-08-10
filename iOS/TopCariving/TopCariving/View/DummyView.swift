//
//  dummyView.swift
//  TopCariving
//
//  Created by Eunno An on 2023/08/01.
//

import Combine
import UIKit

struct TapPublisher: Publisher {
    typealias Output = Void
    typealias Failure = Never
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
            
    func receive<S>(subscriber: S) where S: Subscriber, Never == S.Failure, Void == S.Input {
        let subscription = TapSubscription(subscriber: subscriber,
                                           view: view)
        subscriber.receive(subscription: subscription)
    }
}

class TapSubscription<S: Subscriber>: Subscription where S.Input == Void, S.Failure == Never {
    private var subscriber: S?
    
    init(subscriber: S, view: UIView) {
        self.subscriber = subscriber
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func request(_ demand: Subscribers.Demand) { }
    
    func cancel() {
        subscriber = nil
    }
    
    @objc private func tapped(sender: Any) {
        _ = subscriber?.receive(())
    }
}

extension UIView {
    func tapPublisher() -> TapPublisher {
        .init(view: self)
    }
}
