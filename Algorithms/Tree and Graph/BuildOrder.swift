//
//  BuildOrder.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/3/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func buildOrder(graph: AdjancencyListGraph<String>,
                order: inout [Vertex<String>]) {
  
    guard !graph.adjacencyDict.isEmpty else {
      return
    }
    
    // Append the vertex which is not connected to
    // anyone
    for(vertex, edge) in graph.adjacencyDict {
      if edge.isEmpty {
        order.append(vertex)
      }
    }
    
    for vertex in order {
      graph.adjacencyDict.removeValue(forKey: vertex)
    }
    
    // Find the vertex which doesn't have any incoming
    // edges
    for (vertex, edges) in graph.adjacencyDict {
      var edgeList = [Edge<String>]()
      
      // Check if edge destination is already in order
      // list then remove it as it is no longer a
      // required dependecy
      for edge in edges {
        if !order.contains(edge.destination) {
          edgeList.append(edge)
        }
      }
      graph.adjacencyDict[vertex] = edgeList
    }
    
    return buildOrder(graph: graph, order: &order)
}

func createGraph(projects: [String],
                 dependencies: [(String, String)]) -> AdjancencyListGraph<String> {
    
  let graph = AdjancencyListGraph<String>()
  
  projects.forEach {
    graph.createVertex(data: $0)
  }
  
  for (independent, dependent) in dependencies {
    graph.add(.directed,
              from: Vertex(data: dependent),
              to: Vertex(data: independent), weight: nil)
  }
  
  return graph
}

func buildOrderTest() {
    
  let projects = ["a", "b", "c", "d", "e", "f"]
  let dependencies = [("a", "d"), ("f", "b"), ("b", "d"), ("f", "a"), ("d", "c")]
  
  let graph = createGraph(projects: projects,
                          dependencies: dependencies)
  var order = [Vertex<String>]()
  buildOrder(graph: graph, order: &order)
  print(order)
}
