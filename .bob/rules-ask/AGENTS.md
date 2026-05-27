# Project Documentation Rules (Non-Obvious Only)

## Project Structure
- `src/annoylib.h` is the main C++ header-only library (no separate compilation)
- `src/annoymodule.cc` is Python binding implementation
- `src/annoygomodule.i` and `src/annoyluamodule.cc` are Go/Lua bindings
- `test/test.tree` is pre-built binary for compatibility testing

## Test Organization
- Tests use pytest framework despite setup.py mentioning nosetests
- `setup.cfg` excludes slow tests by default (`attr=!slow`)
- Accuracy tests download datasets from http://ann-benchmarks.com/ on first run
- Test files are named `*_test.py` (not `test_*.py`)

## Distance Metrics Implementation
- Angular distance is NOT cosine distance - uses `sqrt(2(1-cos(u,v)))`
- Hamming distance internally uses uint64_t packing (64 bits per element)
- Dot product uses Microsoft Research transformation to cosine space

## Platform Differences
- Windows uses custom mmap in `src/mman.h` (not system mmap)
- macOS build requires specific version flag: `-mmacosx-version-min=10.12`
- AVX/AVX512 optimizations are compile-time only (not runtime detection)

## Binding Limitations
- Go binding requires SWIG 4.2.1+ and does NOT support multithreaded build
- Lua binding does NOT support multithreaded build
- Python binding supports multithreaded build on Python 3 and non-Windows Python 2