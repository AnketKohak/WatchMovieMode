//
//  MovieView.swift
//  WatchMovieMode
//
//  Created by Anket Kohak on 22/01/25.
//

import SwiftUI

struct MovieView: View {
    // MARK: -Variable
    @StateObject var viewModel = MovieViewModel()
    @State private var selectedTab: Tab = .movies
    
    enum Tab {
        case movies
        case tvShows
    }
    // MARK: - Body
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Picker("Select Tab", selection: $selectedTab) {
                        Text("Movies").tag(Tab.movies)
                        Text("TV Shows").tag(Tab.tvShows)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    
                    LazyVStack(alignment: .leading, spacing: 8){
                        if viewModel.isLoading {
                            ProgressView("Loading...")
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                        } else if let error = viewModel.error {
                            Text("Error: \(error)")
                                .foregroundColor(.red)
                        }else{
                            ForEach(selectedTab == .movies ? viewModel.movieDetail : viewModel.tvShowDetail,id:\.id){
                                movie in
                                NavigationLink{
                                    MovieDetialView(movie: movie)
                                }label:{
                                    MovieRowView(movie: movie)
                                }
                            }
                        }
                    }.padding()
                }.background(.gray.opacity(0.2))
            }
        }
    }
    
}


#Preview {
    MovieView()
}
