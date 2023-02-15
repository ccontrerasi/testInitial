//
//  
//  HomeCoordinator.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//
//  Created by Christian Contreras
//
import Foundation
import SwiftUI
import Swinject

protocol IHomeFlowStateProtocol: ObservableObject {
    var activeLink: HomeNavigationLink? { get set }
}

struct HomeCoordinator<State: IHomeFlowStateProtocol, Content: View>: View {
    @ObservedObject var state: State
    let content: () -> Content
    
    private var activeLink: Binding<HomeNavigationLink?> {
        $state.activeLink.map(get: { $0?.navigationLink }, set: { $0 })
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                content()
                navigationLinks
            }
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .goToDetail(), selection: activeLink, destination: goToDetail) { EmptyView() }
    }
    
    private func goToDetail() -> some View {
        var id: String?
        if case let .goToDetail(param) = state.activeLink {
            id = param
        }
        
        if let id = id {
            let rp = HomeRepository()
            let vc = FilmdDetailViewModel(useCase: FilmdDetailUseCase(repository: rp), idFilm: id)
            return AnyView(FilmdDetailViewController(viewModel: vc))
        }
        
        return AnyView(EmptyView())
    }
}
