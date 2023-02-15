//
//  
//  HomeViewController.swift
//  test
//
//  Created by Cristian Contreras on 9/2/23.
//
//  Created by Cristian Contreras 
//
import SwiftUI

struct HomeViewController: View {
    @StateObject private var viewModel: HomeViewModel
    
    // MARK: - Init
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Body
    
    var body: some View {
        HomeCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            switch viewModel.state {
            case .idle, .loading: ProgressView()
            case .failed(_): Text("Failed....")
            case .result(let result): menuList(result)
            }
        }.onAppear {
            viewModel.loadInfo()
        }
    }
    
    private func menuList(_ items: [Home]) -> some View {
        VStack {
            VerticalList(content: {
                ForEach(items, id: \.id) { item in
                    ForEach(item.show, id: \.id) { item in
                        MenuCard(item: item).onTapGesture {
                            viewModel.goToDetail(id: item.id)
                        }
                        Divider().frame(height: 3)
                    }
                }
            })
        }
    }
    
    struct MenuCard: View {
        let item: Show
        var body: some View {
            ZStack(alignment: .center) {
                VStack(alignment: .trailing) {
                    Text("\(item.id)").frame(maxWidth: .infinity).padding().background(Color.red).lineLimit(1)
                    HStack {
                        if let moviewPictures = item.moviePictures, let pictureUrl = moviewPictures.pictureUrl, let url = URL(string: pictureUrl) {
                            AsyncImage(
                                url: url,
                                placeholder: { ProgressView() },
                                image: { Image(uiImage: $0).resizable() }
                            ).frame(width: 50, height: 50).scaledToFit().padding()
                        }
                        
                        Text("\(item.title) - \(item.year)").frame(maxWidth: .infinity, alignment: .leading).padding()
                    }
                }
            }
        }
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewController(
            viewModel: HomeViewModel(
                useCase: HomeUseCase(homeRepository: HomeRepository())))
    }
}
