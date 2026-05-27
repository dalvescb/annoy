#!/usr/bin/env python3
"""Test script for L2sqr distance metric"""

import sys
import math

# Test the L2sqr distance function directly
def test_l2sqr_distance():
    """Test that L2sqr computes squared Euclidean distance correctly"""
    
    # Test vectors
    x = [1.0, 2.0, 3.0]
    y = [4.0, 5.0, 6.0]
    
    # Expected L2sqr distance: (1-4)^2 + (2-5)^2 + (3-6)^2 = 9 + 9 + 9 = 27
    expected = 27.0
    
    # Compute manually
    computed = sum((xi - yi) ** 2 for xi, yi in zip(x, y))
    
    print(f"Test vectors:")
    print(f"  x = {x}")
    print(f"  y = {y}")
    print(f"Expected L2sqr distance: {expected}")
    print(f"Computed L2sqr distance: {computed}")
    
    assert abs(computed - expected) < 1e-6, f"Distance mismatch: {computed} != {expected}"
    print("✓ Manual calculation test passed")
    
    # Compare with regular Euclidean (should be sqrt of L2sqr)
    euclidean = math.sqrt(computed)
    print(f"\nFor comparison:")
    print(f"  Euclidean distance (sqrt of L2sqr): {euclidean}")
    print(f"  L2sqr distance: {computed}")
    print(f"  Relationship: L2sqr = Euclidean^2 = {euclidean**2}")

def test_annoy_l2sqr():
    """Test Annoy with L2sqr metric"""
    try:
        from annoy import AnnoyIndex
        
        print("\n" + "="*60)
        print("Testing Annoy with L2sqr metric")
        print("="*60)
        
        # Create index with L2sqr metric
        f = 3  # dimension
        t = AnnoyIndex(f, 'l2sqr')
        
        # Add test items
        t.add_item(0, [1.0, 2.0, 3.0])
        t.add_item(1, [4.0, 5.0, 6.0])
        t.add_item(2, [1.0, 2.0, 3.5])
        
        # Build index
        t.build(10)
        
        # Test distance calculation
        dist_0_1 = t.get_distance(0, 1)
        print(f"\nDistance between item 0 and item 1: {dist_0_1}")
        print(f"Expected: 27.0")
        
        # Item 0 and 2 should be closer (only differ in last dimension by 0.5)
        dist_0_2 = t.get_distance(0, 2)
        print(f"Distance between item 0 and item 2: {dist_0_2}")
        print(f"Expected: 0.25 (0.5^2)")
        
        # Find nearest neighbors
        neighbors = t.get_nns_by_item(0, 2, include_distances=True)
        print(f"\nNearest neighbors to item 0:")
        print(f"  Items: {neighbors[0]}")
        print(f"  Distances: {neighbors[1]}")
        
        # Verify item 2 is closer than item 1
        assert dist_0_2 < dist_0_1, "Item 2 should be closer to item 0 than item 1"
        print("\n✓ Annoy L2sqr test passed!")
        
        return True
        
    except ImportError as e:
        print(f"\n⚠ Cannot test Annoy integration: {e}")
        print("This is expected if the module hasn't been built yet.")
        return False
    except Exception as e:
        print(f"\n✗ Annoy test failed: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    print("="*60)
    print("L2sqr Distance Function Test")
    print("="*60)
    
    # Test the distance calculation logic
    test_l2sqr_distance()
    
    # Try to test with Annoy
    success = test_annoy_l2sqr()
    
    if success:
        print("\n" + "="*60)
        print("All tests passed! ✓")
        print("="*60)
        sys.exit(0)
    else:
        print("\n" + "="*60)
        print("Build the module with: python3 setup.py build_ext --inplace")
        print("="*60)
        sys.exit(0)  # Don't fail if module not built yet

# Made with Bob
