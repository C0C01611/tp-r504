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

def test_3():
    assert f.puiss(0, 0) == 1 
    assert f.puiss(0, 5) == 0
    assert f.puiss(0, -5) == float('inf')  # 0^-5 est infini

def test_4():
    assert f.puiss(5, 0) == 1
    assert f.puiss(-5, 0) == 1

def test_5():
    assert f.puiss(10, 6) == 1000000
    assert f.puiss(-10, 6) == 1000000
    assert f.puiss(10, -6) == 1 / 1000000
    assert f.puiss(-10, -6) == 1 / 1000000

def test_6():
    assert f.puiss(9, 0.5) == 3  
    assert f.puiss(2, 0.5) == pytest.approx(1.41421356, rel=1e-8)  # racine carrée de 2

def test_7():
    assert f.puiss(0.5, 2) == 0.25  
    assert f.puiss(-0.5, 2) == 0.25  
    assert f.puiss(0.5, -1) == 2  
    assert f.puiss(-0.5, -1) == -2  


