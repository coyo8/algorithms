#!/usr/bin/python

import sys

class StackNode:
	
	def __init__(self, data):
		self.data = data
		self.next = None


class Stack:
	def __init__(self):
		self.root = None
	
	def isEmpty(self):
		return True if self.root is None else False
	
	def push(self, data):
		newNode = StackNode(data)
		newNode.next = self.root
		self.root = newNode
	
	def pop(self):
		if self.isEmpty():
			return "No Element"
		
		temp = self.root
		self.root = self.root.next
		popped = temp.data
		return popped
	
	def peek(self):
		if self.isEmpty():
			return float("-inf")
		return self.root.data
		

def sortInsert(s, elem):
	
	
	if s.isEmpty() or s.peek < elem:
		s.push(elem)
	else:
		temp = s.pop()
		sortInsert(s, elem)
		s.push(temp)
		

def sortStack(s):
	if not s.isEmpty():
		temp = s.pop()
		sortStack(s)
		sortInsert(s, temp)
		