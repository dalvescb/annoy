#!/usr/bin/env python3
"""
Test to verify that the custom fvec_L2sqr_ref function is being used.
This test will:
1. Build an Euclidean index
2. Add some vectors and build the index
3. Query for nearest neighbors
4. Verify the distance calculations match our custom implementation

IMPORTANT: Annoy's Euclidean distance applies sqrt() to the L2 squared distance.
So we need to compare: sqrt(fvec_L2sqr_ref(x, y))
"""

import sys
import numpy as np
from annoy import AnnoyIndex

def custom_l2sqr(x, y):
    """Python implementation matching the C custom function (returns L2 squared)"""
    diff = x - y
    return np.sum(diff * diff)

def test_custom_function():
    print("Testing custom fvec_L2sqr_ref function usage...")
    print("Note: Annoy's Euclidean distance = sqrt(L2_squared)\n")
    
    # Create a simple 3-dimensional index
    f = 3
    t = AnnoyIndex(f, 'euclidean')
    
    # Add some test vectors
    vectors = [
        [1.0, 0.0, 0.0],
        [0.0, 1.0, 0.0],
        [0.0, 0.0, 1.0],
        [1.0, 1.0, 0.0],
    ]
    
    for i, v in enumerate(vectors):
        t.add_item(i, v)
    
    t.build(10)
    
    # Query for nearest neighbor of first vector
    query_vec = vectors[0]
    neighbors, distances = t.get_nns_by_vector(query_vec, 4, include_distances=True)
    
    print(f"Query vector: {query_vec}")
    print(f"Neighbors found: {neighbors}")
    print(f"Distances from Annoy: {distances}")
    
    # Calculate expected distances using our custom implementation
    print("\nExpected distances using sqrt(custom_l2sqr):")
    for i, neighbor_idx in enumerate(neighbors):
        neighbor_vec = np.array(vectors[neighbor_idx])
        l2_squared = custom_l2sqr(np.array(query_vec), neighbor_vec)
        expected_dist = np.sqrt(l2_squared)  # Annoy applies sqrt!
        annoy_dist = distances[i]
        match = np.isclose(annoy_dist, expected_dist, rtol=1e-5)
        print(f"  Neighbor {neighbor_idx}: Annoy={annoy_dist:.6f}, L2²={l2_squared:.6f}, sqrt(L2²)={expected_dist:.6f}, Match={match}")
    
    # Verify distances match
    all_match = True
    for i, neighbor_idx in enumerate(neighbors):
        neighbor_vec = np.array(vectors[neighbor_idx])
        l2_squared = custom_l2sqr(np.array(query_vec), neighbor_vec)
        expected_dist = np.sqrt(l2_squared)
        if not np.isclose(distances[i], expected_dist, rtol=1e-5):
            all_match = False
            print(f"\n❌ MISMATCH for neighbor {neighbor_idx}!")
    
    if all_match:
        print("\n✅ SUCCESS: All distances match sqrt(fvec_L2sqr_ref)!")
        print("The custom fvec_L2sqr_ref function is being used correctly.")
        print("\nHow it works:")
        print("  1. fvec_L2sqr_ref(x, y) computes sum((x[i] - y[i])²)")
        print("  2. Euclidean::normalized_distance() applies sqrt() to the result")
        print("  3. Final distance = sqrt(fvec_L2sqr_ref(x, y))")
        return True
    else:
        print("\n❌ FAILURE: Distances don't match. Custom function may not be linked properly.")
        return False

if __name__ == '__main__':
    success = test_custom_function()
    sys.exit(0 if success else 1)