# Project Architecture Rules (Non-Obvious Only)

## Core Architecture Constraints
- Header-only C++ library design - no separate compilation or linking required
- Memory-mapped index files enable zero-copy sharing between processes
- Index is immutable after `build()` or `save()` - no incremental updates possible

## Memory Allocation Strategy
- Item IDs MUST be 0-indexed and contiguous
- Allocates memory for max(item_id)+1 items (not actual item count)
- Sparse item IDs waste memory - use external mapping if IDs are non-contiguous

## Index Build Lifecycle
- Three mutually exclusive states: building, built, loaded-from-disk
- `on_disk_build()` changes build location but must be called BEFORE adding items
- `unbuild()` only works on in-memory built indexes (not loaded ones)
- Cannot transition from built/loaded back to building state

## Distance Metric Transformations
- Angular distance internally uses normalized Euclidean (not raw cosine)
- Dot product transformed to cosine space using Microsoft Research method
- Hamming distance uses bit-packing optimization (64 bits per uint64_t)

## Platform-Specific Constraints
- Windows requires custom mmap implementation (not POSIX mmap)
- macOS has minimum version requirement (10.12) for C++ stdlib compatibility
- AVX/AVX512 optimizations are compile-time decisions (no runtime detection)

## Binding Architecture
- Python binding supports multithreading (with flag)
- Go and Lua bindings are single-threaded only (architectural limitation)
- All bindings share same C++ core via different wrapper mechanisms