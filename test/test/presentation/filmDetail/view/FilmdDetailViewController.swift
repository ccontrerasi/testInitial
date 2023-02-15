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

struct FilmdDetailViewController: View {
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
                case .result(let result): mainView(show: result)
            }
        }.onAppear {
            viewModel.loadInfo()
        }
    }
    
    private func mainView(show: Show) -> some View {
        VStack {
            HStack {
                GeometryReader { geometry in
                    
                    if let itemUrl = show.moviePictures?.pictureUrl, let url = URL(string: itemUrl) {
                        AsyncImage(
                            url: url,
                            placeholder: { ProgressView() },
                            image: { Image(uiImage: $0).resizable() }
                        ).scaledToFit().padding()
                            .ignoresSafeArea()
                    } else {
                        Image(imageResource: R.image.photo)
                            .resizable()
                            .scaledToFit().padding().ignoresSafeArea()
                    }
                }
            }
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            Text(show.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 16)
                                .padding(.horizontal, 16)
                            
                            Text("\(show.year)")
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 8)
                                .padding(.horizontal, 16)
                                .frame(width: geometry.size.width)
                            
                            
                            Text(show.synopsisLong)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 8)
                                    .padding(.horizontal, 16)
                                    .frame(width: geometry.size.width)
                            
                        }
                    }
                }
            }
    }
}

struct FilmdDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        FilmdDetailViewController(
                            viewModel: FilmdDetailViewModel(
                                useCase: FilmdDetailUseCase(repository: HomeRepository()),
                                idFilm: ""))
    }
}
