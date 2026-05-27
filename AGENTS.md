# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Build & Test Commands

**Python (primary language):**
- Build: `python3 setup.py build_ext --inplace`
- Install: `pip install .` or `pip install --user annoy`
- Test all: `python3 setup.py nosetests` (uses nose, configured in setup.cfg)
- Test single file: `python3 -m pytest test/index_test.py` (pytest is used, not nose)
- Test single test: `python3 -m pytest test/index_test.py::test_not_found_tree`
- Note: Tests require `numpy` and `h5py` dependencies

**C++ (header-only library):**
- Include `src/annoylib.h` directly - no build needed
- CMake available for installation: `cmake . && make install`

**Go bindings:**
- Requires SWIG 4.2.1+
- Build: `swig -go -intgosize 64 -cgo -c++ src/annoygomodule.i`
- Test: Copy files to GOPATH and run `go test` (see README_GO.rst)
- Go binding does NOT support multithreaded build

**Lua bindings:**
- Build: `luarocks make`
- Test: `busted test/annoy_test.lua`
- Lua binding does NOT support multithreaded build

## Non-Obvious Project Specifics

**Test Configuration:**
- `setup.cfg` excludes slow tests by default with `attr=!slow`
- Accuracy tests download large datasets from http://ann-benchmarks.com/ on first run
- Binary compatibility test uses pre-built `test/test.tree` file
- Tests use pytest despite setup.py referencing nosetests

**Platform-Specific Build:**
- Windows uses custom mmap implementation in `src/mman.h`
- macOS requires `-mmacosx-version-min=10.12` flag
- AVX/AVX512 optimizations controlled by compile-time flags
- Multithreaded build requires `-DANNOYLIB_MULTITHREADED_BUILD` flag

**Memory Management:**
- Index files are memory-mapped (mmap) for zero-copy sharing between processes
- `prefault=True` pre-reads entire file into memory (MAP_POPULATE)
- `prefault=False` loads pages on-demand (better for low memory systems)
- Item IDs must be 0-indexed: allocates memory for max(id)+1 items

**Distance Metrics:**
- Angular distance uses normalized Euclidean: `sqrt(2(1-cos(u,v)))`
- Hamming distance packs binary vectors into uint64_t (64 bits per element)
- Dot product internally transforms to cosine space (see Microsoft Research paper)

**Index Lifecycle:**
- Cannot add items after `build()` or `save()` is called
- `unbuild()` only works on indexes not loaded from disk
- `on_disk_build()` must be called BEFORE adding items (builds directly to file)

**Error Handling:**
- No bounds checking on vector values - caller must validate
- Custom error printer can be overridden via `__ERROR_PRINTER_OVERRIDE__` macro