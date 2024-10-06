#include <lib/x86.h>

#include "import.h"
#define GET_DIR_FROM_VA(x) ((unsigned int) x >> 22)
#define GET_PT_FROM_VA(x) (((unsigned int) x & 0x3ff000) >> 12) // Fix 12-21 bit as it is; make rest 0


/**
 * For each process from id 0 to NUM_IDS - 1,
 * set up the page directory entries so that the kernel portion of the map is
 * the identity map, and the rest of the page directories are unmapped.
 */
void pdir_init(unsigned int mbi_addr)
{
    // TODO: Define your local variables here.

    idptbl_init(mbi_addr);

    // TODO
    for(int proc_id = 0; proc_id < NUM_IDS - 1; proc_id ++ ){
        for(int pde_index = 0; pde_index < 1024; pde_index++){
            set_pdir_entry_identity(proc_id, pde_index);
        }
    }
}

/**
 * Allocates a page (with container_alloc) for the page table,
 * and registers it in the page directory for the given virtual address,
 * and clears (set to 0) all page table entries for this newly mapped page table.
 * It returns the page index of the newly allocated physical page.
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int allocated_page_index = container_alloc(proc_index);
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);
    unsigned int pte_index = GET_PT_FROM_VA(vaddr);

    if(allocated_page_index != 0){
        set_pdir_entry_by_va(proc_index, vaddr, allocated_page_index);
        return allocated_page_index;
    }

    return 0;
}

// Reverse operation of alloc_ptbl.
// Removes corresponding the page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vaddr)
{
    // TODO
    unsigned int pd_entry = get_pdir_entry_by_va(proc_index, vaddr);
    unsigned int pd_index = GET_DIR_FROM_VA(vaddr);
    unsigned int pt_index = GET_PT_FROM_VA(vaddr);
    
    unsigned int page_index = pd_index | pt_index;
    rmv_pdir_entry_by_va(proc_index, vaddr);
    container_free(proc_index, page_index);
}
