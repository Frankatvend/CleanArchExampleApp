//
//  CleanArchDemoApp.swift
//  CleanArchDemo
//
//  Created by Frank Feng on 18/10/21.
//

import SwiftUI

@main
struct CleanArchDemoApp: App {
    let appEnv: AppEnvironment
    let appState: AppState
    
    init() {
        appState = AppState()
        let interactors = Interactors(appState: appState, loginInteractor: RealLoginInteractors(appState: appState), userlistInteractor: RealUserlistInteractors(appState: appState, API: RealUserAPI()))
        appEnv = AppEnvironment(interactors: interactors)
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.appEnv, appEnv)
                .environmentObject(appState)
        }
    }
}
