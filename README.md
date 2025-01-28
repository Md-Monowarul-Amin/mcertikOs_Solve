# CS422/522 Labs

## Lab 1: Bootloader & Physical Memory Management
In this lab, we dive into the fundamentals of bootloaders and physical memory management. Key topics include:
- Understanding the boot process.
- Setting up a bootloader.
- Managing physical memory allocation.

## Lab 2: Container & Virtual Memory Management
This lab focuses on containerization and virtual memory management. Key topics include:
- Setting up and isolating containers.
- Understanding virtual memory concepts.
- Managing memory mappings and translation.

## Lab 3: Process Management & Trap Handling
Learn about process creation, scheduling, and trap handling mechanisms in this lab. Key topics include:
- Implementing process control.
- Handling system calls and traps.
- Context switching between processes.

## Lab 4: Multicore and Preemption
Explore multicore processing and preemption in this lab. Key topics include:
- Utilizing multiple cores for parallel processing.
- Implementing preemptive multitasking.
- Handling concurrency and race conditions.

## Lab 5: File Systems
The final lab delves into file system design and implementation. Key topics include:
- Creating and managing file systems.
- Implementing file operations (read, write, delete).
- Ensuring data consistency and reliability.


### Official Doccumentation: https://flint.cs.yale.edu/cs422/assignments/index.html
### Official Codebase: https://github.com/yale-cpsc422/mcertikos

Compile: make / make all
Run tests: make clean && make TEST=1
Run in qemu: make qemu / make qemu-nox
Debug with gdb: make qemu-gdb / make qemu-nox-gdb
                (in another terminal) gdb