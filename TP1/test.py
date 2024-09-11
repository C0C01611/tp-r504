import pytest
import fonctions as f
def test_1():
	assert f.puiss(2,3) == 8
	assert f.puiss(2,2) == 4

def test_2():
    assert f.puiss(-2, 3) == -8   
    assert f.puiss(-2, 2) == 4    
    assert f.puiss(2, -3) == 0.125 
    assert f.puiss(-2, -2) == 0.25 
