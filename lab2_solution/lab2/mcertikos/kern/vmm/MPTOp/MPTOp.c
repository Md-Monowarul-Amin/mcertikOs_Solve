#include <lib/x86.h>

#include "import.h"

#define GET_DIR_FROM_VA(x) ((unsigned int) x >> 22)
#define GET_PT_FROM_VA(x) (((unsigned int) x & 0x3ff00) >> 12) // Fix 12-21 bit as it is; make rest 0

#define PAGESIZE      4096
#define PDIRSIZE      (PAGESIZE * 1024)
#define VM_USERLO     0x40000000
#define VM_USERHI     0xF0000000
#define VM_USERLO_PDE (VM_USERLO / PDIRSIZE)
#define VM_USERHI_PDE (VM_USERHI / PDIRSIZE)

/**
 * Returns the page table entry corresponding to the virtual address,
 * according to the page structure of process # [proc_index].
 * Returns 0 if the mapping does not exist.
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int directory_entry_index = GET_DIR_FROM_VA(vaddr);
    unsigned int page_table_entry_index = GET_PT_FROM_VA(vaddr);

    if(get_pdir_entry(proc_index, directory_entry_index) !=0 && PTE_P != 0){
        unsigned int page_table_entry = get_ptbl_entry(proc_index, directory_entry_index, page_table_entry_index);
        if(page_table_entry != 0 && PTE_P != 0){
            return page_table_entry;
        } 
    }
    else{
        return 0;
    }
}

// Returns the page directory entry corresponding to the given virtual address.
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int directory_entry_index = GET_DIR_FROM_VA(vaddr);

    return get_pdir_entry(proc_index, directory_entry_index); 

}

// Removes the page table entry for the given virtual address.
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    rmv_ptbl_entry(proc_index, GET_DIR_FROM_VA(vaddr), GET_PT_FROM_VA(vaddr));

}

// Removes the page directory entry for the given virtual address.
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    rmv_pdir_entry(proc_index, GET_DIR_FROM_VA(vaddr));
}

// Maps the virtual address [vaddr] to the physical page # [page_index] with permission [perm].
// You do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index, unsigned int perm)
{
    // TODO
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);
    unsigned int pte_index = GET_PT_FROM_VA(vaddr);

    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);

}

// Registers the mapping from [vaddr] to physical page # [page_index] in the page directory.
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index)
{
    // TODO
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);

    set_pdir_entry(proc_index, pde_index, page_index);
}

// Initializes the identity page table.
// The permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// While the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_addr)
{
    // TODO: Define your local variables here.
    unsigned int pde_index, pte_index, perm;

    container_init(mbi_addr);

    // Set up IDPTbl
    for (pde_index = 0; pde_index < 1024; pde_index++) {
        if ((pde_index < VM_USERLO_PDE) || (VM_USERHI_PDE <= pde_index)) {
            // kernel mapping
            perm = PTE_P | PTE_W | PTE_G;
        } else {
            // normal memory
            perm = PTE_P | PTE_W;
        }

        for (pte_index = 0; pte_index < 1024; pte_index++) {
            set_ptbl_entry_identity(pde_index, pte_index, perm);
        }
    }

}
