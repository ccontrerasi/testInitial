//
//  
//  FilmdDetailViewController.swift
//  test
//
//  Created by Cristian Contreras on 14/2/23.
//
//  Created by Cristian Contreras 
//
import SwiftUI

final class FilmdDetailViewController: View {
    @StateObject private var viewModel: FilmdDetailViewModel

    // MARK: - Init
    
    init(viewModel: FilmdDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        FilmdDetailCoordinator(state: viewModel, content: content)
    }

    @ViewBuilder private func content() -> some View {
        ZStack {
            switch viewModel.state {
                case .idle, .loading: Text("Loading....")
                case .failed(_): Text("Failed....")
                case .result(_): Text("Result")
            }
        }
    }
}

struct FilmdDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        FilmdDetailViewController(
                            viewModel: FilmdDetailViewModel(
                                useCase: FilmdDetailUseCase()))
    }
}
