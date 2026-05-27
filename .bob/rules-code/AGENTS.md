# Project Coding Rules (Non-Obvious Only)

## C++ Header-Only Library
- `src/annoylib.h` is header-only - include directly, no compilation needed
- Custom mmap implementation in `src/mman.h` for Windows compatibility
- Error printer can be overridden via `__ERROR_PRINTER_OVERRIDE__` macro

## Memory & Index Management
- Item IDs MUST be 0-indexed - allocates memory for max(id)+1 items
- Cannot add items after `build()` or `save()` - index becomes read-only
- `on_disk_build()` must be called BEFORE adding any items
- `unbuild()` only works on indexes not loaded from disk

## Distance Metric Implementation Details
- Angular distance uses normalized Euclidean: `sqrt(2(1-cos(u,v)))`
- Hamming distance packs binary vectors into uint64_t (64 bits per element)
- Dot product transforms to cosine space internally (Microsoft Research paper)

## Platform-Specific Compilation
- macOS requires `-mmacosx-version-min=10.12` flag
- Multithreaded build requires `-DANNOYLIB_MULTITHREADED_BUILD` flag
- AVX/AVX512 optimizations via compile-time flags only
- Go and Lua bindings do NOT support multithreaded build

## No Access to MCP and Browser Tools
This mode does not have access to MCP servers or browser automation tools.