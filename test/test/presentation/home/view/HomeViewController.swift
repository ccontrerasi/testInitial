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
            viewModel.exampleInvocation()
        }
    }
    
    private func menuList(_ items: [Home]) -> some View {
        VStack {
            VerticalList(content: {
                ForEach(items, id: \.id) { item in
                    MenuCard(item: item).onTapGesture {
                        //self.viewModel.goToInfo(index: menu.id)
                    }
                    Divider().frame(height: 3)
                }
            })
        }
    }
    
    struct MenuCard: View {
        let item: Home
        var body: some View {
            ZStack(alignment: .center) {
                VStack(alignment: .trailing) {
                    Text("\(item.id)").frame(maxWidth: .infinity).padding().background(Color.red).lineLimit(1)
                    if let show = item.show.first {
                        
                        HStack {
                            if let moviewPictures = show.moviePictures, let pictureUrl = moviewPictures.pictureUrl, let url = URL(string: pictureUrl) {
                                AsyncImage(
                                    url: url,
                                    placeholder: { ProgressView() },
                                    image: { Image(uiImage: $0).resizable() }
                                ).frame(width: 50, height: 50).scaledToFit().padding()
                            }
                            
                            Text("\(show.title) - \(show.year)").frame(maxWidth: .infinity).padding()
                        }
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
