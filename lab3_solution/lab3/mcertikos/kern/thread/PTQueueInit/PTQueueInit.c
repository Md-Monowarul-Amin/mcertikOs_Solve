#include "lib/x86.h"

#include "import.h"

/**
 * Initializes all the thread queues with tqueue_init_at_id.
 */
void tqueue_init(unsigned int mbi_addr)
{
    // TODO: define your local variables here.

    tcb_init(mbi_addr);

    // TODO
    for(int id=0; id <= NUM_IDS; id++){
        tqueue_init_at_id(id);
    }
}

/**
 * Insert the TCB #pid into the tail of the thread queue #chid.
 * Recall that the doubly linked list is index based.
 * So you only need to insert the index.
 * Hint: there are multiple cases in this function.
 */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{
    // TODO
    unsigned int tail = tqueue_get_tail(chid);

    if (tail == NUM_IDS){
        tqueue_set_head(chid, pid);
    }
    else{
        tcb_set_next(tail, pid);
    }

    tqueue_set_tail(chid, pid);
    tcb_set_prev(pid, tail);

}

/**
 * Reverse action of tqueue_enqueue, i.e. pops a TCB from the head of the specified queue.
 * It returns the popped thread's id, or NUM_IDS if the queue is empty.
 * Hint: there are multiple cases in this function.
 */
unsigned int tqueue_dequeue(unsigned int chid)
{
    // TODO
    // tqueue_set_tail(chid, NUM_IDS);
    // tqueue_set_head(chid, NUM_IDS);
    unsigned int head_id = tqueue_get_head(chid);

    if (head_id != NUM_IDS){
        unsigned int next_of_head_id = tcb_get_next(head_id);
        unsigned int previous_of_head_id = tcb_get_prev(head_id);
        if (next_of_head_id != NUM_IDS){
            tqueue_set_head(chid, next_of_head_id);
            tcb_set_prev(next_of_head_id, previous_of_head_id);
        }
        else{
            tqueue_set_head(chid, NUM_IDS);
        }
    }
    else{
        tqueue_set_head(chid, NUM_IDS); 
        tqueue_set_tail(chid, NUM_IDS);
    }
    tcb_set_next(head_id, NUM_IDS);
    tcb_set_prev(head_id, NUM_IDS);
    
    return head_id;
}

/**
 * Removes the TCB #pid from the queue #chid.
 * Hint: there are many cases in this function.
 */
void tqueue_remove(unsigned int chid, unsigned int pid)
{
    // TODO
    unsigned int prev_pid = tcb_get_prev(pid);
    unsigned int next_pid = tcb_get_next(pid);

    //Chaning the TCB
    tcb_set_next(prev_pid, next_pid);
    tcb_set_prev(next_pid, prev_pid);

    //Making Null the previous and the next of removed thread
    tcb_set_prev(pid, NUM_IDS);
    tcb_set_next(pid, NUM_IDS);

    //Chaning the tqueue
    // tqueue_set_head(chid, next_pid);
    // tqueue_set_tail(chid, prev_pid);

}
