# -*- coding: utf-8 -*-
"""
Created on Wed Jul  1 14:11:08 2020

@author: Matthias
"""

from functools import total_ordering

@total_ordering
class Protein:
    
    # constructor method of class Protein
    def __init__(self, name, mw, halfLife):
        self.name = name
        self.mw = mw
        self.halfLife = halfLife
    
    # override both __repr__ and __str__
    def __repr__(self):
        return f"Protein<{self.name}, mw={self.mw:.3f}, hl={self.halfLife:.1f}>"
    
    def __eq__(self, other):
        if self is other:
            return True
        if type(other) == str:
            return self.name == other
        if type(other) != Protein:
            return NotImplemented
        # cas homogène
        return self.name == other.name
    
    # ordre intrinsèque, naturel
    def __lt__(self,other):
        if type(other) == str:
            return self.name < other
        if type(other) != Protein:
            return NotImplemented
        # cas homogène
        return self.name < other.name
  
print("Je suis le module protein")    
if __name__ == '__main__':
    print("Mais aussi une application")
    
    
    
    
    
    
    
