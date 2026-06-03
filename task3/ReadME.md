# Process Memory Layout Analysis

### Identified Memory Regions

* **Text Segment (Program Code)**
  - **Address Range:** `5d92b2c60000 - 5d92b2c61000`
  - **How Identified:** Identified by searching for the executable memory allocation mapping to the program's binary (`/memory_layout`). It is explicitly calculated from the line matching the execution permission flag **`r-xp`**, which denotes where the CPU is allowed to fetch and run machine instructions.
  - **Explanation:** Stores the compiled machine code instructions of the program. It is kept read-only and executable to prevent the process from modifying its own instructions during execution.

* **Heap**
  - **Address Range:** `5d92c6550000 - 5d92c6571000`
  - **How Identified:** Identified explicitly by looking for the row explicitly labeled with the **`[heap]`** tag at the end of the memory map block.
  - **Explanation:** Used for dynamic memory allocation during runtime (e.g., when `malloc()` is called). This region grows upwards toward higher memory addresses as more space is requested by the program.

* **Shared Libraries (`libc`)**
  - **Address Range:** `7dd18e600000 - 7dd18e812000`
  - **How Identified:** Identified by tracking the continuous address mappings belonging to the standard C library file path (`/usr/lib/x86_64-linux-gnu/libc.so.6`). The total range encompasses all its loaded regions, from its initial read-only header segment down to its variables segment.
  - **Explanation:** Holds standard system functions (such as `printf` and `sleep`). The operating system maps this library into the process's virtual memory space dynamically so that the standard code does not need to be compiled directly into the binary file.

* **Stack**
  - **Address Range:** `7ffe3c2e9000 - 7ffe3c30a000`
  - **How Identified:** Identified explicitly by locating the memory mapping row explicitly labeled with the **`[stack]`** tag at the end of the memory map block.
  - **Explanation:** Tracks active function execution, storing runtime data such as local variables, function arguments, and execution return addresses. It grows downwards dynamically toward lower memory addresses as functions are called and shrinks back as they return.
