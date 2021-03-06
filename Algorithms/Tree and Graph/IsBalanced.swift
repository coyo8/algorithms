//
//  IsBalanced.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/1/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// A tree is balanced if the difference of height between left and 
// right subtree is no more than one
func isBalanced(root: BSTNode<Int>?) -> Bool {
    
  guard let n = root else { return true }
        
  let leftSubtreeHeight = heightOfTree(root: n.left)
  let rightSubtreeHeight = heightOfTree(root: n.right)

  // left subtree is balanced
  // right subtree is balanced
  // height of left and right subtree not be greater than one
  if abs(leftSubtreeHeight - rightSubtreeHeight) <= 1
      && isBalanced(root: n.left) && isBalanced(root: n.right) {
      return true
  }
  return false
}



func isBalancedTest() {
  let bst = BST<Int>()

  // Add the root node
  bst.root = BSTNode(data: 3)
  bst.insert(root: bst.root, key: BSTNode(data: 5))
  bst.insert(root: bst.root, key: BSTNode(data: 2))
  bst.insert(root: bst.root?.left, key: BSTNode(data: 4))
  bst.insert(root: bst.root, key: BSTNode(data: 1))

  print(isBalanced(root: bst.root))
}
