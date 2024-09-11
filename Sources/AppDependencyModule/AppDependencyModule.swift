//
//  AppDependencyModule.swift
//
//
//  Created by Abdelrahman Mohamed on 11/09/2024.
//

import Foundation
import BrandUseCase
import BrandRepository
import NetworkLayer

public final class AppDependencyModule {
    
    // Create the network service
    private static func makeNetworkService() -> NetworkService {
        return URLSessionNetworkService() // Assuming this is your network service implementation
    }
    
    // Factory to create the repository
    public static func makeBrandsRepository() -> BrandDetailsRepositoryProtocol {
        let networkService = makeNetworkService()
        let repositoryFactory = BrandRepositoryFactory(networkService: networkService)
        return repositoryFactory.makeBrandDetailsRepository()
    }
    
    // Factory to create the use case
    public static func makeBrandsUseCase() -> BrandDetailsUseCaseProtocol {
        let brandsRepository = makeBrandsRepository()
        let useCaseFactory = BrandUseCaseFactory()
        return useCaseFactory.makeBrandsUseCase(brandDetailsRepository: brandsRepository)
    }
}
