// Simple command-line kernel monitor useful for
// controlling the kernel and exploring the system interactively.

#include <lib/debug.h>
#include <lib/types.h>
#include <lib/string.h>
#include <lib/x86.h>
#include <lib/monitor.h>
#include <dev/console.h>

#define CMDBUF_SIZE 80  // enough for one VGA text line

struct Command {
    const char *name;
    const char *desc;
    // return -1 to force monitor to exit
    int (*func)(int argc, char **argv, struct Trapframe *tf);
};

static struct Command commands[] = {
    {"help", "Display this list of commands", mon_help},
    {"kerninfo", "Display information about the kernel", mon_kerninfo},
    {"backtrace", "Stack Backtrace", mon_backtrace},
};

#define NCOMMANDS (sizeof(commands) / sizeof(commands[0]))

/***** Implementations of basic kernel monitor commands *****/
int mon_help(int argc, char **argv, struct Trapframe *tf)
{
    int i;

    for (i = 0; i < NCOMMANDS; i++)
        dprintf("%s - %s\n", commands[i].name, commands[i].desc);
    return 0;
}

int mon_kerninfo(int argc, char **argv, struct Trapframe *tf)
{
    extern uint8_t start[], etext[], edata[], end[];

    dprintf("Special kernel symbols:\n");
    dprintf("  start  %08x\n", start);
    dprintf("  etext  %08x\n", etext);
    dprintf("  edata  %08x\n", edata);
    dprintf("  end    %08x\n", end);
    dprintf("Kernel executable memory footprint: %dKB\n",
            ROUNDUP(end - start, 1024) / 1024);
    return 0;
}

int mon_backtrace(int argc, char **argv, struct Trapframe *tf)
{
    // TODO
    uint32_t *curr_ebp = read_ebp();
    uint32_t *curr_eip = *(curr_ebp + 4);
    // uint32_t *curr_eip = *(read_eip()); //TO be Implemented... ... ...

    dprintf("epb %08x eip %08x \n", curr_ebp, curr_eip);
    while( curr_ebp != 0){

        curr_ebp = *curr_ebp;
        curr_eip = *(curr_ebp + 4);
        
        dprintf("epb %08x eip %08x \n", curr_ebp, curr_eip);
    }
    return 0;
}

/***** Kernel monitor command interpreter *****/
#define WHITESPACE "\t\r\n "
#define MAXARGS    16

static int runcmd(char *buf, struct Trapframe *tf)
{
    int argc;
    char *argv[MAXARGS];
    int i;

    // Parse the command buffer into whitespace-separated arguments
    argc = 0;
    argv[argc] = 0;
    while (1) {
        // gobble whitespace
        while (*buf && strchr(WHITESPACE, *buf))
            *buf++ = 0;
        if (*buf == 0)
            break;

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            dprintf("Too many arguments (max %d)\n", MAXARGS);
            return 0;
        }
        argv[argc++] = buf;
        while (*buf && !strchr(WHITESPACE, *buf))
            buf++;
    }
    argv[argc] = 0;

    // Lookup and invoke the command
    if (argc == 0)
        return 0;
    for (i = 0; i < NCOMMANDS; i++) {
        if (strcmp(argv[0], commands[i].name) == 0)
            return commands[i].func(argc, argv, tf);
    }
    dprintf("Unknown command '%s'\n", argv[0]);
    return 0;
}

void monitor(struct Trapframe *tf)
{
    char *buf;

    dprintf("\n****************************************\n\n");
    dprintf("Welcome to the mCertiKOS kernel monitor!\n");
    dprintf("\n****************************************\n\n");
    dprintf("Type 'help' for a list of commands.\n");

    while (1) {
        buf = (char *) readline("$> ");
        if (buf != NULL)
            if (runcmd(buf, tf) < 0)
                break;
    }
}
