
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:

static unsigned addr_6845;
static struct video terminal;

void video_init(void)
{
  100000:	57                   	push   %edi
  100001:	56                   	push   %esi
  100002:	53                   	push   %ebx
  100003:	e8 04 03 00 00       	call   10030c <__x86.get_pc_thunk.bx>
  100008:	81 c3 f8 af 00 00    	add    $0xaff8,%ebx
    uint16_t was;
    unsigned pos;

    /* Get a pointer to the memory-mapped text display buffer. */
    cp = (uint16_t *) CGA_BUF;
    was = *cp;
  10000e:	0f b7 15 00 80 0b 00 	movzwl 0xb8000,%edx
    *cp = (uint16_t) 0xA55A;
  100015:	66 c7 05 00 80 0b 00 	movw   $0xa55a,0xb8000
  10001c:	5a a5 
    if (*cp != 0xA55A) {
  10001e:	0f b7 05 00 80 0b 00 	movzwl 0xb8000,%eax
  100025:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100029:	0f 84 91 00 00 00    	je     1000c0 <video_init+0xc0>
        cp = (uint16_t *) MONO_BUF;
        addr_6845 = MONO_BASE;
  10002f:	c7 83 0c 80 02 00 b4 	movl   $0x3b4,0x2800c(%ebx)
  100036:	03 00 00 
        dprintf("addr_6845:%x\n", addr_6845);
  100039:	83 ec 08             	sub    $0x8,%esp
  10003c:	68 b4 03 00 00       	push   $0x3b4
  100041:	8d 83 00 b0 ff ff    	lea    -0x5000(%ebx),%eax
  100047:	50                   	push   %eax
  100048:	e8 b4 2a 00 00       	call   102b01 <dprintf>
  10004d:	83 c4 10             	add    $0x10,%esp
        cp = (uint16_t *) MONO_BUF;
  100050:	be 00 00 0b 00       	mov    $0xb0000,%esi
        addr_6845 = CGA_BASE;
        dprintf("addr_6845:%x\n", addr_6845);
    }

    /* Extract cursor location */
    outb(addr_6845, 14);
  100055:	83 ec 08             	sub    $0x8,%esp
  100058:	6a 0e                	push   $0xe
  10005a:	ff b3 0c 80 02 00    	push   0x2800c(%ebx)
  100060:	e8 0b 35 00 00       	call   103570 <outb>
    pos = inb(addr_6845 + 1) << 8;
  100065:	8b 83 0c 80 02 00    	mov    0x2800c(%ebx),%eax
  10006b:	83 c0 01             	add    $0x1,%eax
  10006e:	89 04 24             	mov    %eax,(%esp)
  100071:	e8 e2 34 00 00       	call   103558 <inb>
  100076:	0f b6 f8             	movzbl %al,%edi
  100079:	c1 e7 08             	shl    $0x8,%edi
    outb(addr_6845, 15);
  10007c:	83 c4 08             	add    $0x8,%esp
  10007f:	6a 0f                	push   $0xf
  100081:	ff b3 0c 80 02 00    	push   0x2800c(%ebx)
  100087:	e8 e4 34 00 00       	call   103570 <outb>
    pos |= inb(addr_6845 + 1);
  10008c:	8b 83 0c 80 02 00    	mov    0x2800c(%ebx),%eax
  100092:	83 c0 01             	add    $0x1,%eax
  100095:	89 04 24             	mov    %eax,(%esp)
  100098:	e8 bb 34 00 00       	call   103558 <inb>
  10009d:	0f b6 c0             	movzbl %al,%eax
  1000a0:	09 f8                	or     %edi,%eax

    terminal.crt_buf = (uint16_t *) cp;
  1000a2:	89 b3 00 80 02 00    	mov    %esi,0x28000(%ebx)
    terminal.crt_pos = pos;
  1000a8:	66 89 83 04 80 02 00 	mov    %ax,0x28004(%ebx)
    terminal.active_console = 0;
  1000af:	c7 83 08 80 02 00 00 	movl   $0x0,0x28008(%ebx)
  1000b6:	00 00 00 
}
  1000b9:	83 c4 10             	add    $0x10,%esp
  1000bc:	5b                   	pop    %ebx
  1000bd:	5e                   	pop    %esi
  1000be:	5f                   	pop    %edi
  1000bf:	c3                   	ret    
        *cp = was;
  1000c0:	66 89 15 00 80 0b 00 	mov    %dx,0xb8000
        addr_6845 = CGA_BASE;
  1000c7:	c7 83 0c 80 02 00 d4 	movl   $0x3d4,0x2800c(%ebx)
  1000ce:	03 00 00 
        dprintf("addr_6845:%x\n", addr_6845);
  1000d1:	83 ec 08             	sub    $0x8,%esp
  1000d4:	68 d4 03 00 00       	push   $0x3d4
  1000d9:	8d 83 00 b0 ff ff    	lea    -0x5000(%ebx),%eax
  1000df:	50                   	push   %eax
  1000e0:	e8 1c 2a 00 00       	call   102b01 <dprintf>
  1000e5:	83 c4 10             	add    $0x10,%esp
    cp = (uint16_t *) CGA_BUF;
  1000e8:	be 00 80 0b 00       	mov    $0xb8000,%esi
  1000ed:	e9 63 ff ff ff       	jmp    100055 <video_init+0x55>

001000f2 <video_putc>:

void video_putc(int c)
{
  1000f2:	53                   	push   %ebx
  1000f3:	83 ec 08             	sub    $0x8,%esp
  1000f6:	e8 11 02 00 00       	call   10030c <__x86.get_pc_thunk.bx>
  1000fb:	81 c3 05 af 00 00    	add    $0xaf05,%ebx
  100101:	8b 44 24 10          	mov    0x10(%esp),%eax
    // if no attribute given, then use black on white
    if (!(c & ~0xFF))
  100105:	a9 00 ff ff ff       	test   $0xffffff00,%eax
  10010a:	75 03                	jne    10010f <video_putc+0x1d>
        c |= 0x0700;
  10010c:	80 cc 07             	or     $0x7,%ah

    switch (c & 0xff) {
  10010f:	0f b6 d0             	movzbl %al,%edx
  100112:	3c 0a                	cmp    $0xa,%al
  100114:	0f 84 12 01 00 00    	je     10022c <video_putc+0x13a>
  10011a:	83 fa 0a             	cmp    $0xa,%edx
  10011d:	7f 51                	jg     100170 <video_putc+0x7e>
  10011f:	83 fa 08             	cmp    $0x8,%edx
  100122:	0f 84 d6 00 00 00    	je     1001fe <video_putc+0x10c>
  100128:	83 fa 09             	cmp    $0x9,%edx
  10012b:	0f 85 11 01 00 00    	jne    100242 <video_putc+0x150>
        /* fallthru */
    case '\r':
        terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
        break;
    case '\t':
        video_putc(' ');
  100131:	83 ec 0c             	sub    $0xc,%esp
  100134:	6a 20                	push   $0x20
  100136:	e8 b7 ff ff ff       	call   1000f2 <video_putc>
        video_putc(' ');
  10013b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100142:	e8 ab ff ff ff       	call   1000f2 <video_putc>
        video_putc(' ');
  100147:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10014e:	e8 9f ff ff ff       	call   1000f2 <video_putc>
        video_putc(' ');
  100153:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10015a:	e8 93 ff ff ff       	call   1000f2 <video_putc>
        video_putc(' ');
  10015f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100166:	e8 87 ff ff ff       	call   1000f2 <video_putc>
        break;
  10016b:	83 c4 10             	add    $0x10,%esp
  10016e:	eb 26                	jmp    100196 <video_putc+0xa4>
    switch (c & 0xff) {
  100170:	83 fa 0d             	cmp    $0xd,%edx
  100173:	0f 85 c9 00 00 00    	jne    100242 <video_putc+0x150>
        terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
  100179:	0f b7 83 04 80 02 00 	movzwl 0x28004(%ebx),%eax
  100180:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  100186:	c1 e8 16             	shr    $0x16,%eax
  100189:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10018c:	c1 e0 04             	shl    $0x4,%eax
  10018f:	66 89 83 04 80 02 00 	mov    %ax,0x28004(%ebx)
    default:
        terminal.crt_buf[terminal.crt_pos++] = c;  /* write the character */
        break;
    }

    if (terminal.crt_pos >= CRT_SIZE) {
  100196:	66 81 bb 04 80 02 00 	cmpw   $0x7cf,0x28004(%ebx)
  10019d:	cf 07 
  10019f:	0f 87 c1 00 00 00    	ja     100266 <video_putc+0x174>
            terminal.crt_buf[i] = 0x0700 | ' ';
        terminal.crt_pos -= CRT_COLS;
    }

    /* move that little blinky thing */
    outb(addr_6845, 14);
  1001a5:	83 ec 08             	sub    $0x8,%esp
  1001a8:	6a 0e                	push   $0xe
  1001aa:	ff b3 0c 80 02 00    	push   0x2800c(%ebx)
  1001b0:	e8 bb 33 00 00       	call   103570 <outb>
    outb(addr_6845 + 1, terminal.crt_pos >> 8);
  1001b5:	8b 83 0c 80 02 00    	mov    0x2800c(%ebx),%eax
  1001bb:	83 c0 01             	add    $0x1,%eax
  1001be:	83 c4 08             	add    $0x8,%esp
  1001c1:	0f b6 93 05 80 02 00 	movzbl 0x28005(%ebx),%edx
  1001c8:	52                   	push   %edx
  1001c9:	50                   	push   %eax
  1001ca:	e8 a1 33 00 00       	call   103570 <outb>
    outb(addr_6845, 15);
  1001cf:	83 c4 08             	add    $0x8,%esp
  1001d2:	6a 0f                	push   $0xf
  1001d4:	ff b3 0c 80 02 00    	push   0x2800c(%ebx)
  1001da:	e8 91 33 00 00       	call   103570 <outb>
    outb(addr_6845 + 1, terminal.crt_pos);
  1001df:	8b 83 0c 80 02 00    	mov    0x2800c(%ebx),%eax
  1001e5:	83 c0 01             	add    $0x1,%eax
  1001e8:	83 c4 08             	add    $0x8,%esp
  1001eb:	0f b6 93 04 80 02 00 	movzbl 0x28004(%ebx),%edx
  1001f2:	52                   	push   %edx
  1001f3:	50                   	push   %eax
  1001f4:	e8 77 33 00 00       	call   103570 <outb>
}
  1001f9:	83 c4 18             	add    $0x18,%esp
  1001fc:	5b                   	pop    %ebx
  1001fd:	c3                   	ret    
        if (terminal.crt_pos > 0) {
  1001fe:	0f b7 93 04 80 02 00 	movzwl 0x28004(%ebx),%edx
  100205:	66 85 d2             	test   %dx,%dx
  100208:	74 8c                	je     100196 <video_putc+0xa4>
            terminal.crt_pos--;
  10020a:	83 ea 01             	sub    $0x1,%edx
  10020d:	66 89 93 04 80 02 00 	mov    %dx,0x28004(%ebx)
            terminal.crt_buf[terminal.crt_pos] = (c & ~0xff) | ' ';
  100214:	b0 00                	mov    $0x0,%al
  100216:	0f b7 d2             	movzwl %dx,%edx
  100219:	01 d2                	add    %edx,%edx
  10021b:	03 93 00 80 02 00    	add    0x28000(%ebx),%edx
  100221:	83 c8 20             	or     $0x20,%eax
  100224:	66 89 02             	mov    %ax,(%edx)
  100227:	e9 6a ff ff ff       	jmp    100196 <video_putc+0xa4>
        terminal.crt_pos += CRT_COLS;
  10022c:	0f b7 83 04 80 02 00 	movzwl 0x28004(%ebx),%eax
  100233:	83 c0 50             	add    $0x50,%eax
  100236:	66 89 83 04 80 02 00 	mov    %ax,0x28004(%ebx)
  10023d:	e9 37 ff ff ff       	jmp    100179 <video_putc+0x87>
        terminal.crt_buf[terminal.crt_pos++] = c;  /* write the character */
  100242:	0f b7 93 04 80 02 00 	movzwl 0x28004(%ebx),%edx
  100249:	8d 4a 01             	lea    0x1(%edx),%ecx
  10024c:	66 89 8b 04 80 02 00 	mov    %cx,0x28004(%ebx)
  100253:	0f b7 d2             	movzwl %dx,%edx
  100256:	01 d2                	add    %edx,%edx
  100258:	03 93 00 80 02 00    	add    0x28000(%ebx),%edx
  10025e:	66 89 02             	mov    %ax,(%edx)
        break;
  100261:	e9 30 ff ff ff       	jmp    100196 <video_putc+0xa4>
        memmove(terminal.crt_buf, terminal.crt_buf + CRT_COLS,
  100266:	8b 83 00 80 02 00    	mov    0x28000(%ebx),%eax
  10026c:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100272:	83 ec 04             	sub    $0x4,%esp
  100275:	68 00 0f 00 00       	push   $0xf00
  10027a:	52                   	push   %edx
  10027b:	50                   	push   %eax
  10027c:	e8 23 25 00 00       	call   1027a4 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  100281:	83 c4 10             	add    $0x10,%esp
  100284:	b8 80 07 00 00       	mov    $0x780,%eax
  100289:	eb 11                	jmp    10029c <video_putc+0x1aa>
            terminal.crt_buf[i] = 0x0700 | ' ';
  10028b:	8d 14 00             	lea    (%eax,%eax,1),%edx
  10028e:	03 93 00 80 02 00    	add    0x28000(%ebx),%edx
  100294:	66 c7 02 20 07       	movw   $0x720,(%edx)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  100299:	83 c0 01             	add    $0x1,%eax
  10029c:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1002a1:	7e e8                	jle    10028b <video_putc+0x199>
        terminal.crt_pos -= CRT_COLS;
  1002a3:	0f b7 83 04 80 02 00 	movzwl 0x28004(%ebx),%eax
  1002aa:	83 e8 50             	sub    $0x50,%eax
  1002ad:	66 89 83 04 80 02 00 	mov    %ax,0x28004(%ebx)
  1002b4:	e9 ec fe ff ff       	jmp    1001a5 <video_putc+0xb3>

001002b9 <video_set_cursor>:

void video_set_cursor(int x, int y)
{
  1002b9:	e8 4a 00 00 00       	call   100308 <__x86.get_pc_thunk.cx>
  1002be:	81 c1 42 ad 00 00    	add    $0xad42,%ecx
  1002c4:	8b 44 24 04          	mov    0x4(%esp),%eax
    terminal.crt_pos = x * CRT_COLS + y;
  1002c8:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1002cb:	c1 e0 04             	shl    $0x4,%eax
  1002ce:	89 c2                	mov    %eax,%edx
  1002d0:	66 03 54 24 08       	add    0x8(%esp),%dx
  1002d5:	66 89 91 04 80 02 00 	mov    %dx,0x28004(%ecx)
}
  1002dc:	c3                   	ret    

001002dd <video_clear_screen>:

void video_clear_screen()
{
  1002dd:	e8 26 00 00 00       	call   100308 <__x86.get_pc_thunk.cx>
  1002e2:	81 c1 1e ad 00 00    	add    $0xad1e,%ecx
    int i;
    for (i = 0; i < CRT_SIZE; i++) {
  1002e8:	b8 00 00 00 00       	mov    $0x0,%eax
  1002ed:	eb 11                	jmp    100300 <video_clear_screen+0x23>
        terminal.crt_buf[i] = ' ';
  1002ef:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1002f2:	03 91 00 80 02 00    	add    0x28000(%ecx),%edx
  1002f8:	66 c7 02 20 00       	movw   $0x20,(%edx)
    for (i = 0; i < CRT_SIZE; i++) {
  1002fd:	83 c0 01             	add    $0x1,%eax
  100300:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  100305:	7e e8                	jle    1002ef <video_clear_screen+0x12>
    }
}
  100307:	c3                   	ret    

00100308 <__x86.get_pc_thunk.cx>:
  100308:	8b 0c 24             	mov    (%esp),%ecx
  10030b:	c3                   	ret    

0010030c <__x86.get_pc_thunk.bx>:
  10030c:	8b 1c 24             	mov    (%esp),%ebx
  10030f:	c3                   	ret    

00100310 <cons_init>:
    char buf[CONSOLE_BUFFER_SIZE];
    uint32_t rpos, wpos;
} cons;

void cons_init()
{
  100310:	53                   	push   %ebx
  100311:	83 ec 0c             	sub    $0xc,%esp
  100314:	e8 f3 ff ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100319:	81 c3 e7 ac 00 00    	add    $0xace7,%ebx
    memset(&cons, 0x0, sizeof(cons));
  10031f:	68 08 02 00 00       	push   $0x208
  100324:	6a 00                	push   $0x0
  100326:	8d 83 20 80 02 00    	lea    0x28020(%ebx),%eax
  10032c:	50                   	push   %eax
  10032d:	e8 27 24 00 00       	call   102759 <memset>
    serial_init();
  100332:	e8 48 03 00 00       	call   10067f <serial_init>
    video_init();
  100337:	e8 c4 fc ff ff       	call   100000 <video_init>
}
  10033c:	83 c4 18             	add    $0x18,%esp
  10033f:	5b                   	pop    %ebx
  100340:	c3                   	ret    

00100341 <cons_intr>:

void cons_intr(int (*proc)(void))
{
  100341:	56                   	push   %esi
  100342:	53                   	push   %ebx
  100343:	83 ec 04             	sub    $0x4,%esp
  100346:	e8 c1 ff ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10034b:	81 c3 b5 ac 00 00    	add    $0xacb5,%ebx
  100351:	8b 74 24 10          	mov    0x10(%esp),%esi
    int c;

    while ((c = (*proc)()) != -1) {
  100355:	ff d6                	call   *%esi
  100357:	83 f8 ff             	cmp    $0xffffffff,%eax
  10035a:	74 2e                	je     10038a <cons_intr+0x49>
        if (c == 0)
  10035c:	85 c0                	test   %eax,%eax
  10035e:	74 f5                	je     100355 <cons_intr+0x14>
            continue;
        cons.buf[cons.wpos++] = c;
  100360:	8b 8b 24 82 02 00    	mov    0x28224(%ebx),%ecx
  100366:	8d 51 01             	lea    0x1(%ecx),%edx
  100369:	89 93 24 82 02 00    	mov    %edx,0x28224(%ebx)
  10036f:	88 84 0b 20 80 02 00 	mov    %al,0x28020(%ebx,%ecx,1)
        if (cons.wpos == CONSOLE_BUFFER_SIZE)
  100376:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  10037c:	75 d7                	jne    100355 <cons_intr+0x14>
            cons.wpos = 0;
  10037e:	c7 83 24 82 02 00 00 	movl   $0x0,0x28224(%ebx)
  100385:	00 00 00 
  100388:	eb cb                	jmp    100355 <cons_intr+0x14>
    }
}
  10038a:	83 c4 04             	add    $0x4,%esp
  10038d:	5b                   	pop    %ebx
  10038e:	5e                   	pop    %esi
  10038f:	c3                   	ret    

00100390 <cons_getc>:

char cons_getc(void)
{
  100390:	53                   	push   %ebx
  100391:	83 ec 08             	sub    $0x8,%esp
  100394:	e8 73 ff ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100399:	81 c3 67 ac 00 00    	add    $0xac67,%ebx
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10039f:	e8 35 02 00 00       	call   1005d9 <serial_intr>
    keyboard_intr();
  1003a4:	e8 e7 04 00 00       	call   100890 <keyboard_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1003a9:	8b 83 20 82 02 00    	mov    0x28220(%ebx),%eax
  1003af:	3b 83 24 82 02 00    	cmp    0x28224(%ebx),%eax
  1003b5:	74 25                	je     1003dc <cons_getc+0x4c>
        c = cons.buf[cons.rpos++];
  1003b7:	8d 50 01             	lea    0x1(%eax),%edx
  1003ba:	89 93 20 82 02 00    	mov    %edx,0x28220(%ebx)
  1003c0:	0f b6 84 03 20 80 02 	movzbl 0x28020(%ebx,%eax,1),%eax
  1003c7:	00 
        if (cons.rpos == CONSOLE_BUFFER_SIZE)
  1003c8:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  1003ce:	75 11                	jne    1003e1 <cons_getc+0x51>
            cons.rpos = 0;
  1003d0:	c7 83 20 82 02 00 00 	movl   $0x0,0x28220(%ebx)
  1003d7:	00 00 00 
        return c;
  1003da:	eb 05                	jmp    1003e1 <cons_getc+0x51>
    }
    return 0;
  1003dc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1003e1:	83 c4 08             	add    $0x8,%esp
  1003e4:	5b                   	pop    %ebx
  1003e5:	c3                   	ret    

001003e6 <cons_putc>:

void cons_putc(char c)
{
  1003e6:	56                   	push   %esi
  1003e7:	53                   	push   %ebx
  1003e8:	83 ec 10             	sub    $0x10,%esp
  1003eb:	e8 1c ff ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1003f0:	81 c3 10 ac 00 00    	add    $0xac10,%ebx
    serial_putc(c);
  1003f6:	0f be 74 24 1c       	movsbl 0x1c(%esp),%esi
  1003fb:	56                   	push   %esi
  1003fc:	e8 09 02 00 00       	call   10060a <serial_putc>
    video_putc(c);
  100401:	89 34 24             	mov    %esi,(%esp)
  100404:	e8 e9 fc ff ff       	call   1000f2 <video_putc>
}
  100409:	83 c4 14             	add    $0x14,%esp
  10040c:	5b                   	pop    %ebx
  10040d:	5e                   	pop    %esi
  10040e:	c3                   	ret    

0010040f <getchar>:

char getchar(void)
{
  10040f:	83 ec 0c             	sub    $0xc,%esp
    char c;

    while ((c = cons_getc()) == 0)
  100412:	e8 79 ff ff ff       	call   100390 <cons_getc>
  100417:	84 c0                	test   %al,%al
  100419:	74 f7                	je     100412 <getchar+0x3>
        /* do nothing */ ;
    return c;
}
  10041b:	83 c4 0c             	add    $0xc,%esp
  10041e:	c3                   	ret    

0010041f <putchar>:

void putchar(char c)
{
  10041f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100422:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
  100427:	50                   	push   %eax
  100428:	e8 b9 ff ff ff       	call   1003e6 <cons_putc>
}
  10042d:	83 c4 1c             	add    $0x1c,%esp
  100430:	c3                   	ret    

00100431 <readline>:

char *readline(const char *prompt)
{
  100431:	57                   	push   %edi
  100432:	56                   	push   %esi
  100433:	53                   	push   %ebx
  100434:	e8 d9 00 00 00       	call   100512 <__x86.get_pc_thunk.si>
  100439:	81 c6 c7 ab 00 00    	add    $0xabc7,%esi
  10043f:	8b 44 24 10          	mov    0x10(%esp),%eax
    int i;
    char c;

    if (prompt != NULL)
  100443:	85 c0                	test   %eax,%eax
  100445:	74 15                	je     10045c <readline+0x2b>
        dprintf("%s", prompt);
  100447:	83 ec 08             	sub    $0x8,%esp
  10044a:	50                   	push   %eax
  10044b:	8d 86 0e b0 ff ff    	lea    -0x4ff2(%esi),%eax
  100451:	50                   	push   %eax
  100452:	89 f3                	mov    %esi,%ebx
  100454:	e8 a8 26 00 00       	call   102b01 <dprintf>
  100459:	83 c4 10             	add    $0x10,%esp
        } else if ((c == '\b' || c == '\x7f') && i > 0) {
            putchar('\b');
            i--;
        } else if (c >= ' ' && i < BUFLEN - 1) {
            putchar(c);
            linebuf[i++] = c;
  10045c:	bf 00 00 00 00       	mov    $0x0,%edi
  100461:	eb 44                	jmp    1004a7 <readline+0x76>
            dprintf("read error: %e\n", c);
  100463:	83 ec 08             	sub    $0x8,%esp
  100466:	0f be d8             	movsbl %al,%ebx
  100469:	53                   	push   %ebx
  10046a:	8d 86 11 b0 ff ff    	lea    -0x4fef(%esi),%eax
  100470:	50                   	push   %eax
  100471:	89 f3                	mov    %esi,%ebx
  100473:	e8 89 26 00 00       	call   102b01 <dprintf>
            return NULL;
  100478:	83 c4 10             	add    $0x10,%esp
  10047b:	b8 00 00 00 00       	mov    $0x0,%eax
            putchar('\n');
            linebuf[i] = 0;
            return linebuf;
        }
    }
}
  100480:	5b                   	pop    %ebx
  100481:	5e                   	pop    %esi
  100482:	5f                   	pop    %edi
  100483:	c3                   	ret    
        } else if (c >= ' ' && i < BUFLEN - 1) {
  100484:	80 fb 1f             	cmp    $0x1f,%bl
  100487:	0f 9f c2             	setg   %dl
  10048a:	81 ff fe 03 00 00    	cmp    $0x3fe,%edi
  100490:	0f 9e c0             	setle  %al
  100493:	84 c2                	test   %al,%dl
  100495:	75 40                	jne    1004d7 <readline+0xa6>
        } else if (c == '\n' || c == '\r') {
  100497:	80 fb 0a             	cmp    $0xa,%bl
  10049a:	0f 94 c0             	sete   %al
  10049d:	80 fb 0d             	cmp    $0xd,%bl
  1004a0:	0f 94 c2             	sete   %dl
  1004a3:	08 d0                	or     %dl,%al
  1004a5:	75 4b                	jne    1004f2 <readline+0xc1>
        c = getchar();
  1004a7:	e8 63 ff ff ff       	call   10040f <getchar>
  1004ac:	89 c3                	mov    %eax,%ebx
        if (c < 0) {
  1004ae:	84 c0                	test   %al,%al
  1004b0:	78 b1                	js     100463 <readline+0x32>
        } else if ((c == '\b' || c == '\x7f') && i > 0) {
  1004b2:	3c 08                	cmp    $0x8,%al
  1004b4:	0f 94 c0             	sete   %al
  1004b7:	80 fb 7f             	cmp    $0x7f,%bl
  1004ba:	0f 94 c2             	sete   %dl
  1004bd:	08 d0                	or     %dl,%al
  1004bf:	74 c3                	je     100484 <readline+0x53>
  1004c1:	85 ff                	test   %edi,%edi
  1004c3:	7e bf                	jle    100484 <readline+0x53>
            putchar('\b');
  1004c5:	83 ec 0c             	sub    $0xc,%esp
  1004c8:	6a 08                	push   $0x8
  1004ca:	e8 50 ff ff ff       	call   10041f <putchar>
            i--;
  1004cf:	83 ef 01             	sub    $0x1,%edi
  1004d2:	83 c4 10             	add    $0x10,%esp
  1004d5:	eb d0                	jmp    1004a7 <readline+0x76>
            putchar(c);
  1004d7:	83 ec 0c             	sub    $0xc,%esp
  1004da:	0f be c3             	movsbl %bl,%eax
  1004dd:	50                   	push   %eax
  1004de:	e8 3c ff ff ff       	call   10041f <putchar>
            linebuf[i++] = c;
  1004e3:	88 9c 3e 40 82 02 00 	mov    %bl,0x28240(%esi,%edi,1)
  1004ea:	83 c4 10             	add    $0x10,%esp
  1004ed:	8d 7f 01             	lea    0x1(%edi),%edi
  1004f0:	eb b5                	jmp    1004a7 <readline+0x76>
            putchar('\n');
  1004f2:	83 ec 0c             	sub    $0xc,%esp
  1004f5:	6a 0a                	push   $0xa
  1004f7:	e8 23 ff ff ff       	call   10041f <putchar>
            linebuf[i] = 0;
  1004fc:	c6 84 3e 40 82 02 00 	movb   $0x0,0x28240(%esi,%edi,1)
  100503:	00 
            return linebuf;
  100504:	83 c4 10             	add    $0x10,%esp
  100507:	8d 86 40 82 02 00    	lea    0x28240(%esi),%eax
  10050d:	e9 6e ff ff ff       	jmp    100480 <readline+0x4f>

00100512 <__x86.get_pc_thunk.si>:
  100512:	8b 34 24             	mov    (%esp),%esi
  100515:	c3                   	ret    

00100516 <serial_proc_data>:
    inb(0x84);
    inb(0x84);
}

static int serial_proc_data(void)
{
  100516:	53                   	push   %ebx
  100517:	83 ec 14             	sub    $0x14,%esp
  10051a:	e8 ed fd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10051f:	81 c3 e1 aa 00 00    	add    $0xaae1,%ebx
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA))
  100525:	68 fd 03 00 00       	push   $0x3fd
  10052a:	e8 29 30 00 00       	call   103558 <inb>
  10052f:	83 c4 10             	add    $0x10,%esp
  100532:	a8 01                	test   $0x1,%al
  100534:	74 18                	je     10054e <serial_proc_data+0x38>
        return -1;
    return inb(COM1 + COM_RX);
  100536:	83 ec 0c             	sub    $0xc,%esp
  100539:	68 f8 03 00 00       	push   $0x3f8
  10053e:	e8 15 30 00 00       	call   103558 <inb>
  100543:	0f b6 c0             	movzbl %al,%eax
  100546:	83 c4 10             	add    $0x10,%esp
}
  100549:	83 c4 08             	add    $0x8,%esp
  10054c:	5b                   	pop    %ebx
  10054d:	c3                   	ret    
        return -1;
  10054e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100553:	eb f4                	jmp    100549 <serial_proc_data+0x33>

00100555 <delay>:
{
  100555:	53                   	push   %ebx
  100556:	83 ec 14             	sub    $0x14,%esp
  100559:	e8 ae fd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10055e:	81 c3 a2 aa 00 00    	add    $0xaaa2,%ebx
    inb(0x84);
  100564:	68 84 00 00 00       	push   $0x84
  100569:	e8 ea 2f 00 00       	call   103558 <inb>
    inb(0x84);
  10056e:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  100575:	e8 de 2f 00 00       	call   103558 <inb>
    inb(0x84);
  10057a:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  100581:	e8 d2 2f 00 00       	call   103558 <inb>
    inb(0x84);
  100586:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  10058d:	e8 c6 2f 00 00       	call   103558 <inb>
}
  100592:	83 c4 18             	add    $0x18,%esp
  100595:	5b                   	pop    %ebx
  100596:	c3                   	ret    

00100597 <serial_reformatnewline>:
    if (serial_exists)
        cons_intr(serial_proc_data);
}

static int serial_reformatnewline(int c, int p)
{
  100597:	56                   	push   %esi
  100598:	53                   	push   %ebx
  100599:	83 ec 04             	sub    $0x4,%esp
  10059c:	e8 6b fd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1005a1:	81 c3 5f aa 00 00    	add    $0xaa5f,%ebx
    int nl = '\n';
    /* POSIX requires newline on the serial line to
     * be a CR-LF pair. Without this, you get a malformed output
     * with clients like minicom or screen
     */
    if (c == nl) {
  1005a7:	83 f8 0a             	cmp    $0xa,%eax
  1005aa:	74 0b                	je     1005b7 <serial_reformatnewline+0x20>
        outb(p, cr);
        outb(p, nl);
        return 1;
    } else
        return 0;
  1005ac:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1005b1:	83 c4 04             	add    $0x4,%esp
  1005b4:	5b                   	pop    %ebx
  1005b5:	5e                   	pop    %esi
  1005b6:	c3                   	ret    
  1005b7:	89 d6                	mov    %edx,%esi
        outb(p, cr);
  1005b9:	83 ec 08             	sub    $0x8,%esp
  1005bc:	6a 0d                	push   $0xd
  1005be:	52                   	push   %edx
  1005bf:	e8 ac 2f 00 00       	call   103570 <outb>
        outb(p, nl);
  1005c4:	83 c4 08             	add    $0x8,%esp
  1005c7:	6a 0a                	push   $0xa
  1005c9:	56                   	push   %esi
  1005ca:	e8 a1 2f 00 00       	call   103570 <outb>
        return 1;
  1005cf:	83 c4 10             	add    $0x10,%esp
  1005d2:	b8 01 00 00 00       	mov    $0x1,%eax
  1005d7:	eb d8                	jmp    1005b1 <serial_reformatnewline+0x1a>

001005d9 <serial_intr>:
{
  1005d9:	53                   	push   %ebx
  1005da:	83 ec 08             	sub    $0x8,%esp
  1005dd:	e8 2a fd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1005e2:	81 c3 1e aa 00 00    	add    $0xaa1e,%ebx
    if (serial_exists)
  1005e8:	80 bb 40 86 02 00 00 	cmpb   $0x0,0x28640(%ebx)
  1005ef:	75 05                	jne    1005f6 <serial_intr+0x1d>
}
  1005f1:	83 c4 08             	add    $0x8,%esp
  1005f4:	5b                   	pop    %ebx
  1005f5:	c3                   	ret    
        cons_intr(serial_proc_data);
  1005f6:	83 ec 0c             	sub    $0xc,%esp
  1005f9:	8d 83 16 55 ff ff    	lea    -0xaaea(%ebx),%eax
  1005ff:	50                   	push   %eax
  100600:	e8 3c fd ff ff       	call   100341 <cons_intr>
  100605:	83 c4 10             	add    $0x10,%esp
}
  100608:	eb e7                	jmp    1005f1 <serial_intr+0x18>

0010060a <serial_putc>:

void serial_putc(char c)
{
  10060a:	57                   	push   %edi
  10060b:	56                   	push   %esi
  10060c:	53                   	push   %ebx
  10060d:	e8 fa fc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100612:	81 c3 ee a9 00 00    	add    $0xa9ee,%ebx
  100618:	8b 7c 24 10          	mov    0x10(%esp),%edi
    if (!serial_exists)
  10061c:	80 bb 40 86 02 00 00 	cmpb   $0x0,0x28640(%ebx)
  100623:	74 3e                	je     100663 <serial_putc+0x59>
        return;

    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i++)
  100625:	be 00 00 00 00       	mov    $0x0,%esi
  10062a:	eb 08                	jmp    100634 <serial_putc+0x2a>
        delay();
  10062c:	e8 24 ff ff ff       	call   100555 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i++)
  100631:	83 c6 01             	add    $0x1,%esi
  100634:	83 ec 0c             	sub    $0xc,%esp
  100637:	68 fd 03 00 00       	push   $0x3fd
  10063c:	e8 17 2f 00 00       	call   103558 <inb>
  100641:	83 c4 10             	add    $0x10,%esp
  100644:	a8 20                	test   $0x20,%al
  100646:	75 08                	jne    100650 <serial_putc+0x46>
  100648:	81 fe ff 31 00 00    	cmp    $0x31ff,%esi
  10064e:	7e dc                	jle    10062c <serial_putc+0x22>

    if (!serial_reformatnewline(c, COM1 + COM_TX))
  100650:	89 f8                	mov    %edi,%eax
  100652:	0f be c0             	movsbl %al,%eax
  100655:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10065a:	e8 38 ff ff ff       	call   100597 <serial_reformatnewline>
  10065f:	85 c0                	test   %eax,%eax
  100661:	74 04                	je     100667 <serial_putc+0x5d>
        outb(COM1 + COM_TX, c);
}
  100663:	5b                   	pop    %ebx
  100664:	5e                   	pop    %esi
  100665:	5f                   	pop    %edi
  100666:	c3                   	ret    
        outb(COM1 + COM_TX, c);
  100667:	83 ec 08             	sub    $0x8,%esp
  10066a:	89 f8                	mov    %edi,%eax
  10066c:	0f b6 f8             	movzbl %al,%edi
  10066f:	57                   	push   %edi
  100670:	68 f8 03 00 00       	push   $0x3f8
  100675:	e8 f6 2e 00 00       	call   103570 <outb>
  10067a:	83 c4 10             	add    $0x10,%esp
  10067d:	eb e4                	jmp    100663 <serial_putc+0x59>

0010067f <serial_init>:

void serial_init(void)
{
  10067f:	53                   	push   %ebx
  100680:	83 ec 10             	sub    $0x10,%esp
  100683:	e8 84 fc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100688:	81 c3 78 a9 00 00    	add    $0xa978,%ebx
    /* turn off interrupt */
    outb(COM1 + COM_IER, 0);
  10068e:	6a 00                	push   $0x0
  100690:	68 f9 03 00 00       	push   $0x3f9
  100695:	e8 d6 2e 00 00       	call   103570 <outb>

    /* set DLAB */
    outb(COM1 + COM_LCR, COM_LCR_DLAB);
  10069a:	83 c4 08             	add    $0x8,%esp
  10069d:	68 80 00 00 00       	push   $0x80
  1006a2:	68 fb 03 00 00       	push   $0x3fb
  1006a7:	e8 c4 2e 00 00       	call   103570 <outb>

    /* set baud rate */
    outb(COM1 + COM_DLL, 0x0001 & 0xff);
  1006ac:	83 c4 08             	add    $0x8,%esp
  1006af:	6a 01                	push   $0x1
  1006b1:	68 f8 03 00 00       	push   $0x3f8
  1006b6:	e8 b5 2e 00 00       	call   103570 <outb>
    outb(COM1 + COM_DLM, 0x0001 >> 8);
  1006bb:	83 c4 08             	add    $0x8,%esp
  1006be:	6a 00                	push   $0x0
  1006c0:	68 f9 03 00 00       	push   $0x3f9
  1006c5:	e8 a6 2e 00 00       	call   103570 <outb>

    /* Set the line status. */
    outb(COM1 + COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
  1006ca:	83 c4 08             	add    $0x8,%esp
  1006cd:	6a 03                	push   $0x3
  1006cf:	68 fb 03 00 00       	push   $0x3fb
  1006d4:	e8 97 2e 00 00       	call   103570 <outb>

    /* Enable the FIFO. */
    outb(COM1 + COM_FCR, 0xc7);
  1006d9:	83 c4 08             	add    $0x8,%esp
  1006dc:	68 c7 00 00 00       	push   $0xc7
  1006e1:	68 fa 03 00 00       	push   $0x3fa
  1006e6:	e8 85 2e 00 00       	call   103570 <outb>

    /* Turn on DTR, RTS, and OUT2. */
    outb(COM1 + COM_MCR, 0x0b);
  1006eb:	83 c4 08             	add    $0x8,%esp
  1006ee:	6a 0b                	push   $0xb
  1006f0:	68 fc 03 00 00       	push   $0x3fc
  1006f5:	e8 76 2e 00 00       	call   103570 <outb>

    // Clear any preexisting overrun indications and interrupts
    // Serial COM1 doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  1006fa:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
  100701:	e8 52 2e 00 00       	call   103558 <inb>
  100706:	3c ff                	cmp    $0xff,%al
  100708:	0f 95 83 40 86 02 00 	setne  0x28640(%ebx)
    (void) inb(COM1 + COM_IIR);
  10070f:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
  100716:	e8 3d 2e 00 00       	call   103558 <inb>
    (void) inb(COM1 + COM_RX);
  10071b:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
  100722:	e8 31 2e 00 00       	call   103558 <inb>
}
  100727:	83 c4 18             	add    $0x18,%esp
  10072a:	5b                   	pop    %ebx
  10072b:	c3                   	ret    

0010072c <serial_intenable>:

void serial_intenable(void)
{
  10072c:	53                   	push   %ebx
  10072d:	83 ec 08             	sub    $0x8,%esp
  100730:	e8 d7 fb ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100735:	81 c3 cb a8 00 00    	add    $0xa8cb,%ebx
    if (serial_exists) {
  10073b:	80 bb 40 86 02 00 00 	cmpb   $0x0,0x28640(%ebx)
  100742:	75 05                	jne    100749 <serial_intenable+0x1d>
        outb(COM1 + COM_IER, 1);
        serial_intr();
    }
}
  100744:	83 c4 08             	add    $0x8,%esp
  100747:	5b                   	pop    %ebx
  100748:	c3                   	ret    
        outb(COM1 + COM_IER, 1);
  100749:	83 ec 08             	sub    $0x8,%esp
  10074c:	6a 01                	push   $0x1
  10074e:	68 f9 03 00 00       	push   $0x3f9
  100753:	e8 18 2e 00 00       	call   103570 <outb>
        serial_intr();
  100758:	e8 7c fe ff ff       	call   1005d9 <serial_intr>
  10075d:	83 c4 10             	add    $0x10,%esp
}
  100760:	eb e2                	jmp    100744 <serial_intenable+0x18>

00100762 <kbd_proc_data>:
/*
 * Get data from the keyboard. If we finish a character, return it. Else 0.
 * Return -1 if no data.
 */
static int kbd_proc_data(void)
{
  100762:	56                   	push   %esi
  100763:	53                   	push   %ebx
  100764:	83 ec 10             	sub    $0x10,%esp
  100767:	e8 a0 fb ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10076c:	81 c3 94 a8 00 00    	add    $0xa894,%ebx
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0)
  100772:	6a 64                	push   $0x64
  100774:	e8 df 2d 00 00       	call   103558 <inb>
  100779:	83 c4 10             	add    $0x10,%esp
  10077c:	a8 01                	test   $0x1,%al
  10077e:	0f 84 05 01 00 00    	je     100889 <kbd_proc_data+0x127>
        return -1;

    data = inb(KBDATAP);
  100784:	83 ec 0c             	sub    $0xc,%esp
  100787:	6a 60                	push   $0x60
  100789:	e8 ca 2d 00 00       	call   103558 <inb>

    if (data == 0xE0) {
  10078e:	83 c4 10             	add    $0x10,%esp
  100791:	3c e0                	cmp    $0xe0,%al
  100793:	0f 84 82 00 00 00    	je     10081b <kbd_proc_data+0xb9>
        // E0 escape character
        shift |= E0ESC;
        return 0;
    } else if (data & 0x80) {
  100799:	84 c0                	test   %al,%al
  10079b:	0f 88 88 00 00 00    	js     100829 <kbd_proc_data+0xc7>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
        shift &= ~(shiftcode[data] | E0ESC);
        return 0;
    } else if (shift & E0ESC) {
  1007a1:	8b 93 44 86 02 00    	mov    0x28644(%ebx),%edx
  1007a7:	f6 c2 40             	test   $0x40,%dl
  1007aa:	74 0c                	je     1007b8 <kbd_proc_data+0x56>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1007ac:	83 c8 80             	or     $0xffffff80,%eax
        shift &= ~E0ESC;
  1007af:	83 e2 bf             	and    $0xffffffbf,%edx
  1007b2:	89 93 44 86 02 00    	mov    %edx,0x28644(%ebx)
    }

    shift |= shiftcode[data];
  1007b8:	0f b6 c0             	movzbl %al,%eax
  1007bb:	0f b6 94 03 40 b1 ff 	movzbl -0x4ec0(%ebx,%eax,1),%edx
  1007c2:	ff 
  1007c3:	0b 93 44 86 02 00    	or     0x28644(%ebx),%edx
  1007c9:	89 93 44 86 02 00    	mov    %edx,0x28644(%ebx)
    shift ^= togglecode[data];
  1007cf:	0f b6 8c 03 40 b0 ff 	movzbl -0x4fc0(%ebx,%eax,1),%ecx
  1007d6:	ff 
  1007d7:	31 ca                	xor    %ecx,%edx
  1007d9:	89 93 44 86 02 00    	mov    %edx,0x28644(%ebx)

    c = charcode[shift & (CTL | SHIFT)][data];
  1007df:	89 d1                	mov    %edx,%ecx
  1007e1:	83 e1 03             	and    $0x3,%ecx
  1007e4:	8b 8c 8b a0 ff ff ff 	mov    -0x60(%ebx,%ecx,4),%ecx
  1007eb:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
  1007ef:	0f b6 f0             	movzbl %al,%esi
    if (shift & CAPSLOCK) {
  1007f2:	f6 c2 08             	test   $0x8,%dl
  1007f5:	74 0d                	je     100804 <kbd_proc_data+0xa2>
        if ('a' <= c && c <= 'z')
  1007f7:	89 f0                	mov    %esi,%eax
  1007f9:	8d 4e 9f             	lea    -0x61(%esi),%ecx
  1007fc:	83 f9 19             	cmp    $0x19,%ecx
  1007ff:	77 58                	ja     100859 <kbd_proc_data+0xf7>
            c += 'A' - 'a';
  100801:	83 ee 20             	sub    $0x20,%esi
        else if ('A' <= c && c <= 'Z')
            c += 'a' - 'A';
    }
    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  100804:	f7 d2                	not    %edx
  100806:	f6 c2 06             	test   $0x6,%dl
  100809:	75 08                	jne    100813 <kbd_proc_data+0xb1>
  10080b:	81 fe e9 00 00 00    	cmp    $0xe9,%esi
  100811:	74 53                	je     100866 <kbd_proc_data+0x104>
        dprintf("Rebooting!\n");
        outb(0x92, 0x3);  // courtesy of Chris Frost
    }

    return c;
}
  100813:	89 f0                	mov    %esi,%eax
  100815:	83 c4 04             	add    $0x4,%esp
  100818:	5b                   	pop    %ebx
  100819:	5e                   	pop    %esi
  10081a:	c3                   	ret    
        shift |= E0ESC;
  10081b:	83 8b 44 86 02 00 40 	orl    $0x40,0x28644(%ebx)
        return 0;
  100822:	be 00 00 00 00       	mov    $0x0,%esi
  100827:	eb ea                	jmp    100813 <kbd_proc_data+0xb1>
        data = (shift & E0ESC ? data : data & 0x7F);
  100829:	8b 93 44 86 02 00    	mov    0x28644(%ebx),%edx
  10082f:	f6 c2 40             	test   $0x40,%dl
  100832:	75 03                	jne    100837 <kbd_proc_data+0xd5>
  100834:	83 e0 7f             	and    $0x7f,%eax
        shift &= ~(shiftcode[data] | E0ESC);
  100837:	0f b6 c0             	movzbl %al,%eax
  10083a:	0f b6 84 03 40 b1 ff 	movzbl -0x4ec0(%ebx,%eax,1),%eax
  100841:	ff 
  100842:	83 c8 40             	or     $0x40,%eax
  100845:	0f b6 c0             	movzbl %al,%eax
  100848:	f7 d0                	not    %eax
  10084a:	21 c2                	and    %eax,%edx
  10084c:	89 93 44 86 02 00    	mov    %edx,0x28644(%ebx)
        return 0;
  100852:	be 00 00 00 00       	mov    $0x0,%esi
  100857:	eb ba                	jmp    100813 <kbd_proc_data+0xb1>
        else if ('A' <= c && c <= 'Z')
  100859:	83 e8 41             	sub    $0x41,%eax
  10085c:	83 f8 19             	cmp    $0x19,%eax
  10085f:	77 a3                	ja     100804 <kbd_proc_data+0xa2>
            c += 'a' - 'A';
  100861:	83 c6 20             	add    $0x20,%esi
  100864:	eb 9e                	jmp    100804 <kbd_proc_data+0xa2>
        dprintf("Rebooting!\n");
  100866:	83 ec 0c             	sub    $0xc,%esp
  100869:	8d 83 21 b0 ff ff    	lea    -0x4fdf(%ebx),%eax
  10086f:	50                   	push   %eax
  100870:	e8 8c 22 00 00       	call   102b01 <dprintf>
        outb(0x92, 0x3);  // courtesy of Chris Frost
  100875:	83 c4 08             	add    $0x8,%esp
  100878:	6a 03                	push   $0x3
  10087a:	68 92 00 00 00       	push   $0x92
  10087f:	e8 ec 2c 00 00       	call   103570 <outb>
  100884:	83 c4 10             	add    $0x10,%esp
  100887:	eb 8a                	jmp    100813 <kbd_proc_data+0xb1>
        return -1;
  100889:	be ff ff ff ff       	mov    $0xffffffff,%esi
  10088e:	eb 83                	jmp    100813 <kbd_proc_data+0xb1>

00100890 <keyboard_intr>:

void keyboard_intr(void)
{
  100890:	53                   	push   %ebx
  100891:	83 ec 14             	sub    $0x14,%esp
  100894:	e8 73 fa ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100899:	81 c3 67 a7 00 00    	add    $0xa767,%ebx
    cons_intr(kbd_proc_data);
  10089f:	8d 83 62 57 ff ff    	lea    -0xa89e(%ebx),%eax
  1008a5:	50                   	push   %eax
  1008a6:	e8 96 fa ff ff       	call   100341 <cons_intr>
}
  1008ab:	83 c4 18             	add    $0x18,%esp
  1008ae:	5b                   	pop    %ebx
  1008af:	c3                   	ret    

001008b0 <devinit>:
#include "tsc.h"

void intr_init(void);

void devinit(uintptr_t mbi_addr)
{
  1008b0:	57                   	push   %edi
  1008b1:	56                   	push   %esi
  1008b2:	53                   	push   %ebx
  1008b3:	e8 54 fa ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1008b8:	81 c3 48 a7 00 00    	add    $0xa748,%ebx
  1008be:	8b 74 24 10          	mov    0x10(%esp),%esi
    seg_init();
  1008c2:	e8 99 27 00 00       	call   103060 <seg_init>

    enable_sse();
  1008c7:	e8 fc 2b 00 00       	call   1034c8 <enable_sse>

    cons_init();
  1008cc:	e8 3f fa ff ff       	call   100310 <cons_init>
    KERN_DEBUG("cons initialized.\n");
  1008d1:	83 ec 04             	sub    $0x4,%esp
  1008d4:	8d 83 40 b2 ff ff    	lea    -0x4dc0(%ebx),%eax
  1008da:	50                   	push   %eax
  1008db:	6a 14                	push   $0x14
  1008dd:	8d bb 53 b2 ff ff    	lea    -0x4dad(%ebx),%edi
  1008e3:	57                   	push   %edi
  1008e4:	e8 4c 20 00 00       	call   102935 <debug_normal>
    KERN_DEBUG("devinit mbi_addr: %d\n", mbi_addr);
  1008e9:	56                   	push   %esi
  1008ea:	8d 83 66 b2 ff ff    	lea    -0x4d9a(%ebx),%eax
  1008f0:	50                   	push   %eax
  1008f1:	6a 15                	push   $0x15
  1008f3:	57                   	push   %edi
  1008f4:	e8 3c 20 00 00       	call   102935 <debug_normal>

    tsc_init();
  1008f9:	83 c4 20             	add    $0x20,%esp
  1008fc:	e8 80 18 00 00       	call   102181 <tsc_init>
    intr_init();
  100901:	e8 86 13 00 00       	call   101c8c <intr_init>

    /* enable interrupts */
    intr_enable(IRQ_TIMER);
  100906:	83 ec 0c             	sub    $0xc,%esp
  100909:	6a 00                	push   $0x0
  10090b:	e8 ac 13 00 00       	call   101cbc <intr_enable>
    intr_enable(IRQ_KBD);
  100910:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  100917:	e8 a0 13 00 00       	call   101cbc <intr_enable>
    intr_enable(IRQ_SERIAL13);
  10091c:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100923:	e8 94 13 00 00       	call   101cbc <intr_enable>

    pmmap_init(mbi_addr);
  100928:	89 34 24             	mov    %esi,(%esp)
  10092b:	e8 68 02 00 00       	call   100b98 <pmmap_init>
}
  100930:	83 c4 10             	add    $0x10,%esp
  100933:	5b                   	pop    %ebx
  100934:	5e                   	pop    %esi
  100935:	5f                   	pop    %edi
  100936:	c3                   	ret    

00100937 <pmmap_dump>:
    if (last_slot[PMMAP_USABLE] != NULL)
        max_usable_memory = last_slot[PMMAP_USABLE]->end;
}

static void pmmap_dump(void)
{
  100937:	56                   	push   %esi
  100938:	53                   	push   %ebx
  100939:	83 ec 04             	sub    $0x4,%esp
  10093c:	e8 cb f9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100941:	81 c3 bf a6 00 00    	add    $0xa6bf,%ebx
    struct pmmap *slot;
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100947:	8b b3 7c 86 02 00    	mov    0x2867c(%ebx),%esi
  10094d:	eb 35                	jmp    100984 <pmmap_dump+0x4d>
        KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  10094f:	8d 8b 7c b2 ff ff    	lea    -0x4d84(%ebx),%ecx
  100955:	eb 4e                	jmp    1009a5 <pmmap_dump+0x6e>
  100957:	8d 8b 85 b2 ff ff    	lea    -0x4d7b(%ebx),%ecx
  10095d:	eb 46                	jmp    1009a5 <pmmap_dump+0x6e>
  10095f:	8d 8b 8c b2 ff ff    	lea    -0x4d74(%ebx),%ecx
  100965:	eb 3e                	jmp    1009a5 <pmmap_dump+0x6e>
  100967:	8d 8b 9e b2 ff ff    	lea    -0x4d62(%ebx),%ecx
  10096d:	eb 36                	jmp    1009a5 <pmmap_dump+0x6e>
  10096f:	51                   	push   %ecx
  100970:	50                   	push   %eax
  100971:	52                   	push   %edx
  100972:	8d 83 04 b3 ff ff    	lea    -0x4cfc(%ebx),%eax
  100978:	50                   	push   %eax
  100979:	e8 92 1f 00 00       	call   102910 <debug_info>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  10097e:	8b 76 0c             	mov    0xc(%esi),%esi
  100981:	83 c4 10             	add    $0x10,%esp
  100984:	85 f6                	test   %esi,%esi
  100986:	74 30                	je     1009b8 <pmmap_dump+0x81>
        KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  100988:	8b 46 08             	mov    0x8(%esi),%eax
  10098b:	83 f8 01             	cmp    $0x1,%eax
  10098e:	74 c7                	je     100957 <pmmap_dump+0x20>
  100990:	83 f8 03             	cmp    $0x3,%eax
  100993:	74 ca                	je     10095f <pmmap_dump+0x28>
  100995:	83 f8 04             	cmp    $0x4,%eax
  100998:	74 cd                	je     100967 <pmmap_dump+0x30>
  10099a:	83 f8 02             	cmp    $0x2,%eax
  10099d:	74 b0                	je     10094f <pmmap_dump+0x18>
  10099f:	8d 8b 96 b2 ff ff    	lea    -0x4d6a(%ebx),%ecx
  1009a5:	8b 16                	mov    (%esi),%edx
  1009a7:	8b 46 04             	mov    0x4(%esi),%eax
  1009aa:	39 c2                	cmp    %eax,%edx
  1009ac:	74 c1                	je     10096f <pmmap_dump+0x38>
  1009ae:	83 f8 ff             	cmp    $0xffffffff,%eax
  1009b1:	74 bc                	je     10096f <pmmap_dump+0x38>
  1009b3:	83 e8 01             	sub    $0x1,%eax
  1009b6:	eb b7                	jmp    10096f <pmmap_dump+0x38>
                  (slot->type == MEM_RAM) ? "usable" :
                  (slot->type == MEM_RESERVED) ? "reserved" :
                  (slot->type == MEM_ACPI) ? "ACPI data" :
                  (slot->type == MEM_NVS) ? "ACPI NVS" : "unknown");
    }
}
  1009b8:	83 c4 04             	add    $0x4,%esp
  1009bb:	5b                   	pop    %ebx
  1009bc:	5e                   	pop    %esi
  1009bd:	c3                   	ret    

001009be <pmmap_merge>:
{
  1009be:	56                   	push   %esi
  1009bf:	53                   	push   %ebx
  1009c0:	83 ec 14             	sub    $0x14,%esp
  1009c3:	e8 44 f9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1009c8:	81 c3 38 a6 00 00    	add    $0xa638,%ebx
    struct pmmap *last_slot[4] = { NULL, NULL, NULL, NULL };
  1009ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1009d5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1009dc:	00 
  1009dd:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1009e4:	00 
  1009e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1009ec:	00 
    SLIST_FOREACH(slot, &pmmap_list, next) {
  1009ed:	8b b3 7c 86 02 00    	mov    0x2867c(%ebx),%esi
  1009f3:	eb 03                	jmp    1009f8 <pmmap_merge+0x3a>
  1009f5:	8b 76 0c             	mov    0xc(%esi),%esi
  1009f8:	85 f6                	test   %esi,%esi
  1009fa:	74 39                	je     100a35 <pmmap_merge+0x77>
        if ((next_slot = SLIST_NEXT(slot, next)) == NULL)
  1009fc:	8b 46 0c             	mov    0xc(%esi),%eax
  1009ff:	85 c0                	test   %eax,%eax
  100a01:	74 32                	je     100a35 <pmmap_merge+0x77>
        if (slot->start <= next_slot->start &&
  100a03:	8b 10                	mov    (%eax),%edx
  100a05:	39 16                	cmp    %edx,(%esi)
  100a07:	77 ec                	ja     1009f5 <pmmap_merge+0x37>
            slot->end >= next_slot->start &&
  100a09:	8b 4e 04             	mov    0x4(%esi),%ecx
        if (slot->start <= next_slot->start &&
  100a0c:	39 ca                	cmp    %ecx,%edx
  100a0e:	77 e5                	ja     1009f5 <pmmap_merge+0x37>
            slot->end >= next_slot->start &&
  100a10:	8b 50 08             	mov    0x8(%eax),%edx
  100a13:	39 56 08             	cmp    %edx,0x8(%esi)
  100a16:	75 dd                	jne    1009f5 <pmmap_merge+0x37>
            slot->end = max(slot->end, next_slot->end);
  100a18:	83 ec 08             	sub    $0x8,%esp
  100a1b:	ff 70 04             	push   0x4(%eax)
  100a1e:	51                   	push   %ecx
  100a1f:	e8 33 2a 00 00       	call   103457 <max>
  100a24:	89 46 04             	mov    %eax,0x4(%esi)
            SLIST_REMOVE_AFTER(slot, next);
  100a27:	8b 46 0c             	mov    0xc(%esi),%eax
  100a2a:	8b 40 0c             	mov    0xc(%eax),%eax
  100a2d:	89 46 0c             	mov    %eax,0xc(%esi)
  100a30:	83 c4 10             	add    $0x10,%esp
  100a33:	eb c0                	jmp    1009f5 <pmmap_merge+0x37>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100a35:	8b b3 7c 86 02 00    	mov    0x2867c(%ebx),%esi
  100a3b:	eb 1b                	jmp    100a58 <pmmap_merge+0x9a>
        sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100a3d:	b8 00 00 00 00       	mov    $0x0,%eax
        if (last_slot[sublist_nr] != NULL)
  100a42:	8b 14 84             	mov    (%esp,%eax,4),%edx
  100a45:	85 d2                	test   %edx,%edx
  100a47:	74 65                	je     100aae <pmmap_merge+0xf0>
            SLIST_INSERT_AFTER(last_slot[sublist_nr], slot, type_next);
  100a49:	8b 4a 10             	mov    0x10(%edx),%ecx
  100a4c:	89 4e 10             	mov    %ecx,0x10(%esi)
  100a4f:	89 72 10             	mov    %esi,0x10(%edx)
        last_slot[sublist_nr] = slot;
  100a52:	89 34 84             	mov    %esi,(%esp,%eax,4)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100a55:	8b 76 0c             	mov    0xc(%esi),%esi
  100a58:	85 f6                	test   %esi,%esi
  100a5a:	74 63                	je     100abf <pmmap_merge+0x101>
        sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100a5c:	8b 46 08             	mov    0x8(%esi),%eax
  100a5f:	83 f8 01             	cmp    $0x1,%eax
  100a62:	74 d9                	je     100a3d <pmmap_merge+0x7f>
  100a64:	83 f8 03             	cmp    $0x3,%eax
  100a67:	74 30                	je     100a99 <pmmap_merge+0xdb>
  100a69:	83 f8 04             	cmp    $0x4,%eax
  100a6c:	74 32                	je     100aa0 <pmmap_merge+0xe2>
  100a6e:	83 f8 02             	cmp    $0x2,%eax
  100a71:	74 34                	je     100aa7 <pmmap_merge+0xe9>
        KERN_ASSERT(sublist_nr != -1);
  100a73:	8d 83 a7 b2 ff ff    	lea    -0x4d59(%ebx),%eax
  100a79:	50                   	push   %eax
  100a7a:	8d 83 b8 b2 ff ff    	lea    -0x4d48(%ebx),%eax
  100a80:	50                   	push   %eax
  100a81:	6a 6b                	push   $0x6b
  100a83:	8d 83 d5 b2 ff ff    	lea    -0x4d2b(%ebx),%eax
  100a89:	50                   	push   %eax
  100a8a:	e8 df 1e 00 00       	call   10296e <debug_panic>
  100a8f:	83 c4 10             	add    $0x10,%esp
        sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100a92:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a97:	eb a9                	jmp    100a42 <pmmap_merge+0x84>
  100a99:	b8 02 00 00 00       	mov    $0x2,%eax
  100a9e:	eb a2                	jmp    100a42 <pmmap_merge+0x84>
  100aa0:	b8 03 00 00 00       	mov    $0x3,%eax
  100aa5:	eb 9b                	jmp    100a42 <pmmap_merge+0x84>
  100aa7:	b8 01 00 00 00       	mov    $0x1,%eax
  100aac:	eb 94                	jmp    100a42 <pmmap_merge+0x84>
            SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot, type_next);
  100aae:	8d 93 6c 86 02 00    	lea    0x2866c(%ebx),%edx
  100ab4:	8b 0c 82             	mov    (%edx,%eax,4),%ecx
  100ab7:	89 4e 10             	mov    %ecx,0x10(%esi)
  100aba:	89 34 82             	mov    %esi,(%edx,%eax,4)
  100abd:	eb 93                	jmp    100a52 <pmmap_merge+0x94>
    if (last_slot[PMMAP_USABLE] != NULL)
  100abf:	8b 04 24             	mov    (%esp),%eax
  100ac2:	85 c0                	test   %eax,%eax
  100ac4:	74 09                	je     100acf <pmmap_merge+0x111>
        max_usable_memory = last_slot[PMMAP_USABLE]->end;
  100ac6:	8b 40 04             	mov    0x4(%eax),%eax
  100ac9:	89 83 68 86 02 00    	mov    %eax,0x28668(%ebx)
}
  100acf:	83 c4 14             	add    $0x14,%esp
  100ad2:	5b                   	pop    %ebx
  100ad3:	5e                   	pop    %esi
  100ad4:	c3                   	ret    

00100ad5 <pmmap_alloc_slot>:
{
  100ad5:	e8 f2 02 00 00       	call   100dcc <__x86.get_pc_thunk.dx>
  100ada:	81 c2 26 a5 00 00    	add    $0xa526,%edx
    if (unlikely(pmmap_slots_next_free == 128))
  100ae0:	8b 82 80 86 02 00    	mov    0x28680(%edx),%eax
  100ae6:	3d 80 00 00 00       	cmp    $0x80,%eax
  100aeb:	74 1b                	je     100b08 <pmmap_alloc_slot+0x33>
    return &pmmap_slots[pmmap_slots_next_free++];
  100aed:	8d 48 01             	lea    0x1(%eax),%ecx
  100af0:	89 8a 80 86 02 00    	mov    %ecx,0x28680(%edx)
  100af6:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  100af9:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
  100b00:	8d 84 02 a0 86 02 00 	lea    0x286a0(%edx,%eax,1),%eax
  100b07:	c3                   	ret    
        return NULL;
  100b08:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b0d:	c3                   	ret    

00100b0e <pmmap_insert>:
{
  100b0e:	55                   	push   %ebp
  100b0f:	57                   	push   %edi
  100b10:	56                   	push   %esi
  100b11:	53                   	push   %ebx
  100b12:	83 ec 1c             	sub    $0x1c,%esp
  100b15:	e8 f2 f7 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100b1a:	81 c3 e6 a4 00 00    	add    $0xa4e6,%ebx
  100b20:	89 c6                	mov    %eax,%esi
  100b22:	89 d5                	mov    %edx,%ebp
  100b24:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    if ((free_slot = pmmap_alloc_slot()) == NULL)
  100b28:	e8 a8 ff ff ff       	call   100ad5 <pmmap_alloc_slot>
  100b2d:	89 c7                	mov    %eax,%edi
  100b2f:	85 c0                	test   %eax,%eax
  100b31:	74 1b                	je     100b4e <pmmap_insert+0x40>
    free_slot->start = start;
  100b33:	89 37                	mov    %esi,(%edi)
    free_slot->end = end;
  100b35:	89 6f 04             	mov    %ebp,0x4(%edi)
    free_slot->type = type;
  100b38:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100b3c:	89 47 08             	mov    %eax,0x8(%edi)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100b3f:	8b 8b 7c 86 02 00    	mov    0x2867c(%ebx),%ecx
  100b45:	89 c8                	mov    %ecx,%eax
    last_slot = NULL;
  100b47:	ba 00 00 00 00       	mov    $0x0,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100b4c:	eb 22                	jmp    100b70 <pmmap_insert+0x62>
        KERN_PANIC("More than 128 E820 entries.\n");
  100b4e:	83 ec 04             	sub    $0x4,%esp
  100b51:	8d 83 e6 b2 ff ff    	lea    -0x4d1a(%ebx),%eax
  100b57:	50                   	push   %eax
  100b58:	6a 3c                	push   $0x3c
  100b5a:	8d 83 d5 b2 ff ff    	lea    -0x4d2b(%ebx),%eax
  100b60:	50                   	push   %eax
  100b61:	e8 08 1e 00 00       	call   10296e <debug_panic>
  100b66:	83 c4 10             	add    $0x10,%esp
  100b69:	eb c8                	jmp    100b33 <pmmap_insert+0x25>
        last_slot = slot;
  100b6b:	89 c2                	mov    %eax,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100b6d:	8b 40 0c             	mov    0xc(%eax),%eax
  100b70:	85 c0                	test   %eax,%eax
  100b72:	74 04                	je     100b78 <pmmap_insert+0x6a>
        if (start < slot->start)
  100b74:	39 30                	cmp    %esi,(%eax)
  100b76:	76 f3                	jbe    100b6b <pmmap_insert+0x5d>
    if (last_slot == NULL) {
  100b78:	85 d2                	test   %edx,%edx
  100b7a:	74 11                	je     100b8d <pmmap_insert+0x7f>
        SLIST_INSERT_AFTER(last_slot, free_slot, next);
  100b7c:	8b 42 0c             	mov    0xc(%edx),%eax
  100b7f:	89 47 0c             	mov    %eax,0xc(%edi)
  100b82:	89 7a 0c             	mov    %edi,0xc(%edx)
}
  100b85:	83 c4 1c             	add    $0x1c,%esp
  100b88:	5b                   	pop    %ebx
  100b89:	5e                   	pop    %esi
  100b8a:	5f                   	pop    %edi
  100b8b:	5d                   	pop    %ebp
  100b8c:	c3                   	ret    
        SLIST_INSERT_HEAD(&pmmap_list, free_slot, next);
  100b8d:	89 4f 0c             	mov    %ecx,0xc(%edi)
  100b90:	89 bb 7c 86 02 00    	mov    %edi,0x2867c(%ebx)
  100b96:	eb ed                	jmp    100b85 <pmmap_insert+0x77>

00100b98 <pmmap_init>:

void pmmap_init(uintptr_t mbi_addr)
{
  100b98:	55                   	push   %ebp
  100b99:	57                   	push   %edi
  100b9a:	56                   	push   %esi
  100b9b:	53                   	push   %ebx
  100b9c:	83 ec 18             	sub    $0x18,%esp
  100b9f:	e8 68 f7 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100ba4:	81 c3 5c a4 00 00    	add    $0xa45c,%ebx
  100baa:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    KERN_INFO("\n");
  100bae:	8d 83 87 b8 ff ff    	lea    -0x4779(%ebx),%eax
  100bb4:	50                   	push   %eax
  100bb5:	e8 56 1d 00 00       	call   102910 <debug_info>

    mboot_info_t *mbi = (mboot_info_t *) mbi_addr;
    mboot_mmap_t *p = (mboot_mmap_t *) mbi->mmap_addr;
  100bba:	8b 46 30             	mov    0x30(%esi),%eax

    SLIST_INIT(&pmmap_list);
  100bbd:	c7 83 7c 86 02 00 00 	movl   $0x0,0x2867c(%ebx)
  100bc4:	00 00 00 
    SLIST_INIT(&pmmap_sublist[PMMAP_USABLE]);
  100bc7:	c7 83 6c 86 02 00 00 	movl   $0x0,0x2866c(%ebx)
  100bce:	00 00 00 
    SLIST_INIT(&pmmap_sublist[PMMAP_RESV]);
  100bd1:	c7 83 70 86 02 00 00 	movl   $0x0,0x28670(%ebx)
  100bd8:	00 00 00 
    SLIST_INIT(&pmmap_sublist[PMMAP_ACPI]);
  100bdb:	c7 83 74 86 02 00 00 	movl   $0x0,0x28674(%ebx)
  100be2:	00 00 00 
    SLIST_INIT(&pmmap_sublist[PMMAP_NVS]);
  100be5:	c7 83 78 86 02 00 00 	movl   $0x0,0x28678(%ebx)
  100bec:	00 00 00 

    /*
     * Copy memory map information from multiboot information mbi to pmmap.
     */
    while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100bef:	83 c4 10             	add    $0x10,%esp
  100bf2:	eb 12                	jmp    100c06 <pmmap_init+0x6e>
            goto next;
        else
            start = p->base_addr_low;

        if (p->length_high != 0 || p->length_low >= 0xffffffff - start)
            end = 0xffffffff;
  100bf4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        else
            end = start + p->length_low;

        type = p->type;
  100bf9:	8b 48 14             	mov    0x14(%eax),%ecx

        pmmap_insert(start, end, type);
  100bfc:	89 e8                	mov    %ebp,%eax
  100bfe:	e8 0b ff ff ff       	call   100b0e <pmmap_insert>

      next:
        p = (mboot_mmap_t *) (((uint32_t) p) + sizeof(mboot_mmap_t) /* p->size */);
  100c03:	8d 47 18             	lea    0x18(%edi),%eax
    while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100c06:	89 c7                	mov    %eax,%edi
  100c08:	89 c2                	mov    %eax,%edx
  100c0a:	2b 56 30             	sub    0x30(%esi),%edx
  100c0d:	3b 56 2c             	cmp    0x2c(%esi),%edx
  100c10:	73 25                	jae    100c37 <pmmap_init+0x9f>
        if (p->base_addr_high != 0)  /* ignore address above 4G */
  100c12:	83 78 08 00          	cmpl   $0x0,0x8(%eax)
  100c16:	75 eb                	jne    100c03 <pmmap_init+0x6b>
            start = p->base_addr_low;
  100c18:	8b 68 04             	mov    0x4(%eax),%ebp
        if (p->length_high != 0 || p->length_low >= 0xffffffff - start)
  100c1b:	83 78 10 00          	cmpl   $0x0,0x10(%eax)
  100c1f:	75 d3                	jne    100bf4 <pmmap_init+0x5c>
  100c21:	8b 50 0c             	mov    0xc(%eax),%edx
  100c24:	89 e9                	mov    %ebp,%ecx
  100c26:	f7 d1                	not    %ecx
  100c28:	39 ca                	cmp    %ecx,%edx
  100c2a:	73 04                	jae    100c30 <pmmap_init+0x98>
            end = start + p->length_low;
  100c2c:	01 ea                	add    %ebp,%edx
  100c2e:	eb c9                	jmp    100bf9 <pmmap_init+0x61>
            end = 0xffffffff;
  100c30:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c35:	eb c2                	jmp    100bf9 <pmmap_init+0x61>
    }

    /* merge overlapped memory regions */
    pmmap_merge();
  100c37:	e8 82 fd ff ff       	call   1009be <pmmap_merge>
    pmmap_dump();
  100c3c:	e8 f6 fc ff ff       	call   100937 <pmmap_dump>

    /* count the number of pmmap entries */
    struct pmmap *slot;
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100c41:	8b 83 7c 86 02 00    	mov    0x2867c(%ebx),%eax
  100c47:	eb 0a                	jmp    100c53 <pmmap_init+0xbb>
        pmmap_nentries++;
  100c49:	83 83 60 86 02 00 01 	addl   $0x1,0x28660(%ebx)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100c50:	8b 40 0c             	mov    0xc(%eax),%eax
  100c53:	85 c0                	test   %eax,%eax
  100c55:	75 f2                	jne    100c49 <pmmap_init+0xb1>
    }

    /* Calculate the maximum page number */
    mem_npages = rounddown(max_usable_memory, PAGESIZE) / PAGESIZE;
  100c57:	83 ec 08             	sub    $0x8,%esp
  100c5a:	68 00 10 00 00       	push   $0x1000
  100c5f:	ff b3 68 86 02 00    	push   0x28668(%ebx)
  100c65:	e8 09 28 00 00       	call   103473 <rounddown>
  100c6a:	c1 e8 0c             	shr    $0xc,%eax
  100c6d:	89 83 64 86 02 00    	mov    %eax,0x28664(%ebx)
}
  100c73:	83 c4 1c             	add    $0x1c,%esp
  100c76:	5b                   	pop    %ebx
  100c77:	5e                   	pop    %esi
  100c78:	5f                   	pop    %edi
  100c79:	5d                   	pop    %ebp
  100c7a:	c3                   	ret    

00100c7b <get_size>:

int get_size(void)
{
  100c7b:	e8 48 01 00 00       	call   100dc8 <__x86.get_pc_thunk.ax>
  100c80:	05 80 a3 00 00       	add    $0xa380,%eax
    return pmmap_nentries;
  100c85:	8b 80 60 86 02 00    	mov    0x28660(%eax),%eax
}
  100c8b:	c3                   	ret    

00100c8c <get_mms>:

uint32_t get_mms(int idx)
{
  100c8c:	53                   	push   %ebx
  100c8d:	e8 7a f6 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100c92:	81 c3 6e a3 00 00    	add    $0xa36e,%ebx
  100c98:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    int i = 0;
    struct pmmap *slot = NULL;

    SLIST_FOREACH(slot, &pmmap_list, next) {
  100c9c:	8b 83 7c 86 02 00    	mov    0x2867c(%ebx),%eax
    int i = 0;
  100ca2:	ba 00 00 00 00       	mov    $0x0,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100ca7:	eb 06                	jmp    100caf <get_mms+0x23>
        if (i == idx)
            break;
        i++;
  100ca9:	83 c2 01             	add    $0x1,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100cac:	8b 40 0c             	mov    0xc(%eax),%eax
  100caf:	85 c0                	test   %eax,%eax
  100cb1:	74 04                	je     100cb7 <get_mms+0x2b>
        if (i == idx)
  100cb3:	39 ca                	cmp    %ecx,%edx
  100cb5:	75 f2                	jne    100ca9 <get_mms+0x1d>
    }

    if (slot == NULL || i == pmmap_nentries)
  100cb7:	85 c0                	test   %eax,%eax
  100cb9:	74 0c                	je     100cc7 <get_mms+0x3b>
  100cbb:	39 93 60 86 02 00    	cmp    %edx,0x28660(%ebx)
  100cc1:	74 0b                	je     100cce <get_mms+0x42>
        return 0;

    return slot->start;
  100cc3:	8b 00                	mov    (%eax),%eax
}
  100cc5:	5b                   	pop    %ebx
  100cc6:	c3                   	ret    
        return 0;
  100cc7:	b8 00 00 00 00       	mov    $0x0,%eax
  100ccc:	eb f7                	jmp    100cc5 <get_mms+0x39>
  100cce:	b8 00 00 00 00       	mov    $0x0,%eax
  100cd3:	eb f0                	jmp    100cc5 <get_mms+0x39>

00100cd5 <get_mml>:

uint32_t get_mml(int idx)
{
  100cd5:	53                   	push   %ebx
  100cd6:	e8 31 f6 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100cdb:	81 c3 25 a3 00 00    	add    $0xa325,%ebx
  100ce1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    int i = 0;
    struct pmmap *slot = NULL;

    SLIST_FOREACH(slot, &pmmap_list, next) {
  100ce5:	8b 93 7c 86 02 00    	mov    0x2867c(%ebx),%edx
    int i = 0;
  100ceb:	b8 00 00 00 00       	mov    $0x0,%eax
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100cf0:	eb 06                	jmp    100cf8 <get_mml+0x23>
        if (i == idx)
            break;
        i++;
  100cf2:	83 c0 01             	add    $0x1,%eax
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100cf5:	8b 52 0c             	mov    0xc(%edx),%edx
  100cf8:	85 d2                	test   %edx,%edx
  100cfa:	74 04                	je     100d00 <get_mml+0x2b>
        if (i == idx)
  100cfc:	39 c8                	cmp    %ecx,%eax
  100cfe:	75 f2                	jne    100cf2 <get_mml+0x1d>
    }

    if (slot == NULL || i == pmmap_nentries)
  100d00:	85 d2                	test   %edx,%edx
  100d02:	74 0f                	je     100d13 <get_mml+0x3e>
  100d04:	39 83 60 86 02 00    	cmp    %eax,0x28660(%ebx)
  100d0a:	74 0e                	je     100d1a <get_mml+0x45>
        return 0;

    return slot->end - slot->start;
  100d0c:	8b 42 04             	mov    0x4(%edx),%eax
  100d0f:	2b 02                	sub    (%edx),%eax
}
  100d11:	5b                   	pop    %ebx
  100d12:	c3                   	ret    
        return 0;
  100d13:	b8 00 00 00 00       	mov    $0x0,%eax
  100d18:	eb f7                	jmp    100d11 <get_mml+0x3c>
  100d1a:	b8 00 00 00 00       	mov    $0x0,%eax
  100d1f:	eb f0                	jmp    100d11 <get_mml+0x3c>

00100d21 <is_usable>:

int is_usable(int idx)
{
  100d21:	53                   	push   %ebx
  100d22:	e8 e5 f5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100d27:	81 c3 d9 a2 00 00    	add    $0xa2d9,%ebx
  100d2d:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    int i = 0;
    struct pmmap *slot = NULL;

    SLIST_FOREACH(slot, &pmmap_list, next) {
  100d31:	8b 83 7c 86 02 00    	mov    0x2867c(%ebx),%eax
    int i = 0;
  100d37:	ba 00 00 00 00       	mov    $0x0,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100d3c:	eb 06                	jmp    100d44 <is_usable+0x23>
        if (i == idx)
            break;
        i++;
  100d3e:	83 c2 01             	add    $0x1,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100d41:	8b 40 0c             	mov    0xc(%eax),%eax
  100d44:	85 c0                	test   %eax,%eax
  100d46:	74 04                	je     100d4c <is_usable+0x2b>
        if (i == idx)
  100d48:	39 ca                	cmp    %ecx,%edx
  100d4a:	75 f2                	jne    100d3e <is_usable+0x1d>
    }

    if (slot == NULL || i == pmmap_nentries)
  100d4c:	85 c0                	test   %eax,%eax
  100d4e:	74 14                	je     100d64 <is_usable+0x43>
  100d50:	39 93 60 86 02 00    	cmp    %edx,0x28660(%ebx)
  100d56:	74 13                	je     100d6b <is_usable+0x4a>
        return 0;

    return slot->type == MEM_RAM;
  100d58:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  100d5c:	0f 94 c0             	sete   %al
  100d5f:	0f b6 c0             	movzbl %al,%eax
}
  100d62:	5b                   	pop    %ebx
  100d63:	c3                   	ret    
        return 0;
  100d64:	b8 00 00 00 00       	mov    $0x0,%eax
  100d69:	eb f7                	jmp    100d62 <is_usable+0x41>
  100d6b:	b8 00 00 00 00       	mov    $0x0,%eax
  100d70:	eb f0                	jmp    100d62 <is_usable+0x41>

00100d72 <set_cr3>:

void set_cr3(unsigned int **pdir)
{
  100d72:	53                   	push   %ebx
  100d73:	83 ec 14             	sub    $0x14,%esp
  100d76:	e8 91 f5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100d7b:	81 c3 85 a2 00 00    	add    $0xa285,%ebx
    lcr3((uint32_t) pdir);
  100d81:	ff 74 24 1c          	push   0x1c(%esp)
  100d85:	e8 ba 27 00 00       	call   103544 <lcr3>
}
  100d8a:	83 c4 18             	add    $0x18,%esp
  100d8d:	5b                   	pop    %ebx
  100d8e:	c3                   	ret    

00100d8f <enable_paging>:

void enable_paging(void)
{
  100d8f:	53                   	push   %ebx
  100d90:	83 ec 08             	sub    $0x8,%esp
  100d93:	e8 74 f5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  100d98:	81 c3 68 a2 00 00    	add    $0xa268,%ebx
    /* enable global pages (Sec 4.10.2.4, Intel ASDM Vol3) */
    uint32_t cr4 = rcr4();
  100d9e:	e8 b1 27 00 00       	call   103554 <rcr4>
    cr4 |= CR4_PGE;
  100da3:	0c 80                	or     $0x80,%al
    lcr4(cr4);
  100da5:	83 ec 0c             	sub    $0xc,%esp
  100da8:	50                   	push   %eax
  100da9:	e8 9e 27 00 00       	call   10354c <lcr4>

    /* turn on paging */
    uint32_t cr0 = rcr0();
  100dae:	e8 89 27 00 00       	call   10353c <rcr0>
    cr0 |= CR0_PE | CR0_PG | CR0_AM | CR0_WP | CR0_NE | CR0_MP;
    cr0 &= ~(CR0_EM | CR0_TS);
  100db3:	83 e0 f3             	and    $0xfffffff3,%eax
  100db6:	0d 23 00 05 80       	or     $0x80050023,%eax
    lcr0(cr0);
  100dbb:	89 04 24             	mov    %eax,(%esp)
  100dbe:	e8 71 27 00 00       	call   103534 <lcr0>
}
  100dc3:	83 c4 18             	add    $0x18,%esp
  100dc6:	5b                   	pop    %ebx
  100dc7:	c3                   	ret    

00100dc8 <__x86.get_pc_thunk.ax>:
  100dc8:	8b 04 24             	mov    (%esp),%eax
  100dcb:	c3                   	ret    

00100dcc <__x86.get_pc_thunk.dx>:
  100dcc:	8b 14 24             	mov    (%esp),%edx
  100dcf:	c3                   	ret    

00100dd0 <intr_init_idt>:
gatedesc_t idt[256];
pseudodesc_t idt_pd =
    {.pd_lim = sizeof(idt) - 1, .pd_base = (uint32_t) idt};

static void intr_init_idt(void)
{
  100dd0:	55                   	push   %ebp
  100dd1:	57                   	push   %edi
  100dd2:	56                   	push   %esi
  100dd3:	53                   	push   %ebx
  100dd4:	e8 ef ff ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  100dd9:	05 27 a2 00 00       	add    $0xa227,%eax

    /* check that T_IRQ0 is a multiple of 8 */
    KERN_ASSERT((T_IRQ0 & 7) == 0);

    /* install a default handler */
    for (i = 0; i < sizeof(idt) / sizeof(idt[0]); i++)
  100dde:	ba 00 00 00 00       	mov    $0x0,%edx
  100de3:	eb 78                	jmp    100e5d <intr_init_idt+0x8d>
        SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);
  100de5:	c7 c5 6e 25 10 00    	mov    $0x10256e,%ebp
  100deb:	66 89 ac d0 a0 90 02 	mov    %bp,0x290a0(%eax,%edx,8)
  100df2:	00 
  100df3:	8d b4 d0 a0 90 02 00 	lea    0x290a0(%eax,%edx,8),%esi
  100dfa:	66 c7 46 02 08 00    	movw   $0x8,0x2(%esi)
  100e00:	0f b6 8c d0 a4 90 02 	movzbl 0x290a4(%eax,%edx,8),%ecx
  100e07:	00 
  100e08:	83 e1 e0             	and    $0xffffffe0,%ecx
  100e0b:	88 8c d0 a4 90 02 00 	mov    %cl,0x290a4(%eax,%edx,8)
  100e12:	c6 84 d0 a4 90 02 00 	movb   $0x0,0x290a4(%eax,%edx,8)
  100e19:	00 
  100e1a:	0f b6 8c d0 a5 90 02 	movzbl 0x290a5(%eax,%edx,8),%ecx
  100e21:	00 
  100e22:	83 e1 f0             	and    $0xfffffff0,%ecx
  100e25:	83 c9 0e             	or     $0xe,%ecx
  100e28:	88 8c d0 a5 90 02 00 	mov    %cl,0x290a5(%eax,%edx,8)
  100e2f:	89 cf                	mov    %ecx,%edi
  100e31:	83 e7 ef             	and    $0xffffffef,%edi
  100e34:	89 fb                	mov    %edi,%ebx
  100e36:	88 9c d0 a5 90 02 00 	mov    %bl,0x290a5(%eax,%edx,8)
  100e3d:	83 e1 8f             	and    $0xffffff8f,%ecx
  100e40:	88 8c d0 a5 90 02 00 	mov    %cl,0x290a5(%eax,%edx,8)
  100e47:	83 c9 80             	or     $0xffffff80,%ecx
  100e4a:	88 8c d0 a5 90 02 00 	mov    %cl,0x290a5(%eax,%edx,8)
  100e51:	89 eb                	mov    %ebp,%ebx
  100e53:	c1 eb 10             	shr    $0x10,%ebx
  100e56:	66 89 5e 06          	mov    %bx,0x6(%esi)
    for (i = 0; i < sizeof(idt) / sizeof(idt[0]); i++)
  100e5a:	83 c2 01             	add    $0x1,%edx
  100e5d:	81 fa ff 00 00 00    	cmp    $0xff,%edx
  100e63:	76 80                	jbe    100de5 <intr_init_idt+0x15>

    SETGATE(idt[T_DIVIDE],                  0, CPU_GDT_KCODE, &Xdivide,         0);
  100e65:	c7 c1 60 24 10 00    	mov    $0x102460,%ecx
  100e6b:	66 89 88 a0 90 02 00 	mov    %cx,0x290a0(%eax)
  100e72:	66 c7 80 a2 90 02 00 	movw   $0x8,0x290a2(%eax)
  100e79:	08 00 
  100e7b:	0f b6 90 a4 90 02 00 	movzbl 0x290a4(%eax),%edx
  100e82:	83 e2 e0             	and    $0xffffffe0,%edx
  100e85:	88 90 a4 90 02 00    	mov    %dl,0x290a4(%eax)
  100e8b:	c6 80 a4 90 02 00 00 	movb   $0x0,0x290a4(%eax)
  100e92:	0f b6 90 a5 90 02 00 	movzbl 0x290a5(%eax),%edx
  100e99:	83 e2 f0             	and    $0xfffffff0,%edx
  100e9c:	83 ca 0e             	or     $0xe,%edx
  100e9f:	88 90 a5 90 02 00    	mov    %dl,0x290a5(%eax)
  100ea5:	89 d3                	mov    %edx,%ebx
  100ea7:	83 e3 ef             	and    $0xffffffef,%ebx
  100eaa:	88 98 a5 90 02 00    	mov    %bl,0x290a5(%eax)
  100eb0:	83 e2 8f             	and    $0xffffff8f,%edx
  100eb3:	88 90 a5 90 02 00    	mov    %dl,0x290a5(%eax)
  100eb9:	83 ca 80             	or     $0xffffff80,%edx
  100ebc:	88 90 a5 90 02 00    	mov    %dl,0x290a5(%eax)
  100ec2:	c1 e9 10             	shr    $0x10,%ecx
  100ec5:	66 89 88 a6 90 02 00 	mov    %cx,0x290a6(%eax)
    SETGATE(idt[T_DEBUG],                   0, CPU_GDT_KCODE, &Xdebug,          0);
  100ecc:	c7 c1 6a 24 10 00    	mov    $0x10246a,%ecx
  100ed2:	66 89 88 a8 90 02 00 	mov    %cx,0x290a8(%eax)
  100ed9:	66 c7 80 aa 90 02 00 	movw   $0x8,0x290aa(%eax)
  100ee0:	08 00 
  100ee2:	0f b6 90 ac 90 02 00 	movzbl 0x290ac(%eax),%edx
  100ee9:	83 e2 e0             	and    $0xffffffe0,%edx
  100eec:	88 90 ac 90 02 00    	mov    %dl,0x290ac(%eax)
  100ef2:	c6 80 ac 90 02 00 00 	movb   $0x0,0x290ac(%eax)
  100ef9:	0f b6 90 ad 90 02 00 	movzbl 0x290ad(%eax),%edx
  100f00:	83 e2 f0             	and    $0xfffffff0,%edx
  100f03:	83 ca 0e             	or     $0xe,%edx
  100f06:	88 90 ad 90 02 00    	mov    %dl,0x290ad(%eax)
  100f0c:	89 d3                	mov    %edx,%ebx
  100f0e:	83 e3 ef             	and    $0xffffffef,%ebx
  100f11:	88 98 ad 90 02 00    	mov    %bl,0x290ad(%eax)
  100f17:	83 e2 8f             	and    $0xffffff8f,%edx
  100f1a:	88 90 ad 90 02 00    	mov    %dl,0x290ad(%eax)
  100f20:	83 ca 80             	or     $0xffffff80,%edx
  100f23:	88 90 ad 90 02 00    	mov    %dl,0x290ad(%eax)
  100f29:	c1 e9 10             	shr    $0x10,%ecx
  100f2c:	66 89 88 ae 90 02 00 	mov    %cx,0x290ae(%eax)
    SETGATE(idt[T_NMI],                     0, CPU_GDT_KCODE, &Xnmi,            0);
  100f33:	c7 c1 74 24 10 00    	mov    $0x102474,%ecx
  100f39:	66 89 88 b0 90 02 00 	mov    %cx,0x290b0(%eax)
  100f40:	66 c7 80 b2 90 02 00 	movw   $0x8,0x290b2(%eax)
  100f47:	08 00 
  100f49:	0f b6 90 b4 90 02 00 	movzbl 0x290b4(%eax),%edx
  100f50:	83 e2 e0             	and    $0xffffffe0,%edx
  100f53:	88 90 b4 90 02 00    	mov    %dl,0x290b4(%eax)
  100f59:	c6 80 b4 90 02 00 00 	movb   $0x0,0x290b4(%eax)
  100f60:	0f b6 90 b5 90 02 00 	movzbl 0x290b5(%eax),%edx
  100f67:	83 e2 f0             	and    $0xfffffff0,%edx
  100f6a:	83 ca 0e             	or     $0xe,%edx
  100f6d:	88 90 b5 90 02 00    	mov    %dl,0x290b5(%eax)
  100f73:	89 d3                	mov    %edx,%ebx
  100f75:	83 e3 ef             	and    $0xffffffef,%ebx
  100f78:	88 98 b5 90 02 00    	mov    %bl,0x290b5(%eax)
  100f7e:	83 e2 8f             	and    $0xffffff8f,%edx
  100f81:	88 90 b5 90 02 00    	mov    %dl,0x290b5(%eax)
  100f87:	83 ca 80             	or     $0xffffff80,%edx
  100f8a:	88 90 b5 90 02 00    	mov    %dl,0x290b5(%eax)
  100f90:	c1 e9 10             	shr    $0x10,%ecx
  100f93:	66 89 88 b6 90 02 00 	mov    %cx,0x290b6(%eax)
    SETGATE(idt[T_BRKPT],                   0, CPU_GDT_KCODE, &Xbrkpt,          3);
  100f9a:	c7 c1 7e 24 10 00    	mov    $0x10247e,%ecx
  100fa0:	66 89 88 b8 90 02 00 	mov    %cx,0x290b8(%eax)
  100fa7:	66 c7 80 ba 90 02 00 	movw   $0x8,0x290ba(%eax)
  100fae:	08 00 
  100fb0:	0f b6 90 bc 90 02 00 	movzbl 0x290bc(%eax),%edx
  100fb7:	83 e2 e0             	and    $0xffffffe0,%edx
  100fba:	88 90 bc 90 02 00    	mov    %dl,0x290bc(%eax)
  100fc0:	c6 80 bc 90 02 00 00 	movb   $0x0,0x290bc(%eax)
  100fc7:	0f b6 90 bd 90 02 00 	movzbl 0x290bd(%eax),%edx
  100fce:	83 e2 f0             	and    $0xfffffff0,%edx
  100fd1:	83 ca 0e             	or     $0xe,%edx
  100fd4:	88 90 bd 90 02 00    	mov    %dl,0x290bd(%eax)
  100fda:	83 e2 ef             	and    $0xffffffef,%edx
  100fdd:	88 90 bd 90 02 00    	mov    %dl,0x290bd(%eax)
  100fe3:	89 d3                	mov    %edx,%ebx
  100fe5:	83 cb 60             	or     $0x60,%ebx
  100fe8:	88 98 bd 90 02 00    	mov    %bl,0x290bd(%eax)
  100fee:	83 ca e0             	or     $0xffffffe0,%edx
  100ff1:	88 90 bd 90 02 00    	mov    %dl,0x290bd(%eax)
  100ff7:	c1 e9 10             	shr    $0x10,%ecx
  100ffa:	66 89 88 be 90 02 00 	mov    %cx,0x290be(%eax)
    SETGATE(idt[T_OFLOW],                   0, CPU_GDT_KCODE, &Xoflow,          3);
  101001:	c7 c1 88 24 10 00    	mov    $0x102488,%ecx
  101007:	66 89 88 c0 90 02 00 	mov    %cx,0x290c0(%eax)
  10100e:	66 c7 80 c2 90 02 00 	movw   $0x8,0x290c2(%eax)
  101015:	08 00 
  101017:	0f b6 90 c4 90 02 00 	movzbl 0x290c4(%eax),%edx
  10101e:	83 e2 e0             	and    $0xffffffe0,%edx
  101021:	88 90 c4 90 02 00    	mov    %dl,0x290c4(%eax)
  101027:	c6 80 c4 90 02 00 00 	movb   $0x0,0x290c4(%eax)
  10102e:	0f b6 90 c5 90 02 00 	movzbl 0x290c5(%eax),%edx
  101035:	83 e2 f0             	and    $0xfffffff0,%edx
  101038:	83 ca 0e             	or     $0xe,%edx
  10103b:	88 90 c5 90 02 00    	mov    %dl,0x290c5(%eax)
  101041:	83 e2 ef             	and    $0xffffffef,%edx
  101044:	88 90 c5 90 02 00    	mov    %dl,0x290c5(%eax)
  10104a:	89 d3                	mov    %edx,%ebx
  10104c:	83 cb 60             	or     $0x60,%ebx
  10104f:	88 98 c5 90 02 00    	mov    %bl,0x290c5(%eax)
  101055:	83 ca e0             	or     $0xffffffe0,%edx
  101058:	88 90 c5 90 02 00    	mov    %dl,0x290c5(%eax)
  10105e:	c1 e9 10             	shr    $0x10,%ecx
  101061:	66 89 88 c6 90 02 00 	mov    %cx,0x290c6(%eax)
    SETGATE(idt[T_BOUND],                   0, CPU_GDT_KCODE, &Xbound,          0);
  101068:	c7 c1 92 24 10 00    	mov    $0x102492,%ecx
  10106e:	66 89 88 c8 90 02 00 	mov    %cx,0x290c8(%eax)
  101075:	66 c7 80 ca 90 02 00 	movw   $0x8,0x290ca(%eax)
  10107c:	08 00 
  10107e:	0f b6 90 cc 90 02 00 	movzbl 0x290cc(%eax),%edx
  101085:	83 e2 e0             	and    $0xffffffe0,%edx
  101088:	88 90 cc 90 02 00    	mov    %dl,0x290cc(%eax)
  10108e:	c6 80 cc 90 02 00 00 	movb   $0x0,0x290cc(%eax)
  101095:	0f b6 90 cd 90 02 00 	movzbl 0x290cd(%eax),%edx
  10109c:	83 e2 f0             	and    $0xfffffff0,%edx
  10109f:	83 ca 0e             	or     $0xe,%edx
  1010a2:	88 90 cd 90 02 00    	mov    %dl,0x290cd(%eax)
  1010a8:	89 d3                	mov    %edx,%ebx
  1010aa:	83 e3 ef             	and    $0xffffffef,%ebx
  1010ad:	88 98 cd 90 02 00    	mov    %bl,0x290cd(%eax)
  1010b3:	83 e2 8f             	and    $0xffffff8f,%edx
  1010b6:	88 90 cd 90 02 00    	mov    %dl,0x290cd(%eax)
  1010bc:	83 ca 80             	or     $0xffffff80,%edx
  1010bf:	88 90 cd 90 02 00    	mov    %dl,0x290cd(%eax)
  1010c5:	c1 e9 10             	shr    $0x10,%ecx
  1010c8:	66 89 88 ce 90 02 00 	mov    %cx,0x290ce(%eax)
    SETGATE(idt[T_ILLOP],                   0, CPU_GDT_KCODE, &Xillop,          0);
  1010cf:	c7 c1 9c 24 10 00    	mov    $0x10249c,%ecx
  1010d5:	66 89 88 d0 90 02 00 	mov    %cx,0x290d0(%eax)
  1010dc:	66 c7 80 d2 90 02 00 	movw   $0x8,0x290d2(%eax)
  1010e3:	08 00 
  1010e5:	0f b6 90 d4 90 02 00 	movzbl 0x290d4(%eax),%edx
  1010ec:	83 e2 e0             	and    $0xffffffe0,%edx
  1010ef:	88 90 d4 90 02 00    	mov    %dl,0x290d4(%eax)
  1010f5:	c6 80 d4 90 02 00 00 	movb   $0x0,0x290d4(%eax)
  1010fc:	0f b6 90 d5 90 02 00 	movzbl 0x290d5(%eax),%edx
  101103:	83 e2 f0             	and    $0xfffffff0,%edx
  101106:	83 ca 0e             	or     $0xe,%edx
  101109:	88 90 d5 90 02 00    	mov    %dl,0x290d5(%eax)
  10110f:	89 d3                	mov    %edx,%ebx
  101111:	83 e3 ef             	and    $0xffffffef,%ebx
  101114:	88 98 d5 90 02 00    	mov    %bl,0x290d5(%eax)
  10111a:	83 e2 8f             	and    $0xffffff8f,%edx
  10111d:	88 90 d5 90 02 00    	mov    %dl,0x290d5(%eax)
  101123:	83 ca 80             	or     $0xffffff80,%edx
  101126:	88 90 d5 90 02 00    	mov    %dl,0x290d5(%eax)
  10112c:	c1 e9 10             	shr    $0x10,%ecx
  10112f:	66 89 88 d6 90 02 00 	mov    %cx,0x290d6(%eax)
    SETGATE(idt[T_DEVICE],                  0, CPU_GDT_KCODE, &Xdevice,         0);
  101136:	c7 c1 a6 24 10 00    	mov    $0x1024a6,%ecx
  10113c:	66 89 88 d8 90 02 00 	mov    %cx,0x290d8(%eax)
  101143:	66 c7 80 da 90 02 00 	movw   $0x8,0x290da(%eax)
  10114a:	08 00 
  10114c:	0f b6 90 dc 90 02 00 	movzbl 0x290dc(%eax),%edx
  101153:	83 e2 e0             	and    $0xffffffe0,%edx
  101156:	88 90 dc 90 02 00    	mov    %dl,0x290dc(%eax)
  10115c:	c6 80 dc 90 02 00 00 	movb   $0x0,0x290dc(%eax)
  101163:	0f b6 90 dd 90 02 00 	movzbl 0x290dd(%eax),%edx
  10116a:	83 e2 f0             	and    $0xfffffff0,%edx
  10116d:	83 ca 0e             	or     $0xe,%edx
  101170:	88 90 dd 90 02 00    	mov    %dl,0x290dd(%eax)
  101176:	89 d3                	mov    %edx,%ebx
  101178:	83 e3 ef             	and    $0xffffffef,%ebx
  10117b:	88 98 dd 90 02 00    	mov    %bl,0x290dd(%eax)
  101181:	83 e2 8f             	and    $0xffffff8f,%edx
  101184:	88 90 dd 90 02 00    	mov    %dl,0x290dd(%eax)
  10118a:	83 ca 80             	or     $0xffffff80,%edx
  10118d:	88 90 dd 90 02 00    	mov    %dl,0x290dd(%eax)
  101193:	c1 e9 10             	shr    $0x10,%ecx
  101196:	66 89 88 de 90 02 00 	mov    %cx,0x290de(%eax)
    SETGATE(idt[T_DBLFLT],                  0, CPU_GDT_KCODE, &Xdblflt,         0);
  10119d:	c7 c1 b0 24 10 00    	mov    $0x1024b0,%ecx
  1011a3:	66 89 88 e0 90 02 00 	mov    %cx,0x290e0(%eax)
  1011aa:	66 c7 80 e2 90 02 00 	movw   $0x8,0x290e2(%eax)
  1011b1:	08 00 
  1011b3:	0f b6 90 e4 90 02 00 	movzbl 0x290e4(%eax),%edx
  1011ba:	83 e2 e0             	and    $0xffffffe0,%edx
  1011bd:	88 90 e4 90 02 00    	mov    %dl,0x290e4(%eax)
  1011c3:	c6 80 e4 90 02 00 00 	movb   $0x0,0x290e4(%eax)
  1011ca:	0f b6 90 e5 90 02 00 	movzbl 0x290e5(%eax),%edx
  1011d1:	83 e2 f0             	and    $0xfffffff0,%edx
  1011d4:	83 ca 0e             	or     $0xe,%edx
  1011d7:	88 90 e5 90 02 00    	mov    %dl,0x290e5(%eax)
  1011dd:	89 d3                	mov    %edx,%ebx
  1011df:	83 e3 ef             	and    $0xffffffef,%ebx
  1011e2:	88 98 e5 90 02 00    	mov    %bl,0x290e5(%eax)
  1011e8:	83 e2 8f             	and    $0xffffff8f,%edx
  1011eb:	88 90 e5 90 02 00    	mov    %dl,0x290e5(%eax)
  1011f1:	83 ca 80             	or     $0xffffff80,%edx
  1011f4:	88 90 e5 90 02 00    	mov    %dl,0x290e5(%eax)
  1011fa:	c1 e9 10             	shr    $0x10,%ecx
  1011fd:	66 89 88 e6 90 02 00 	mov    %cx,0x290e6(%eax)
    SETGATE(idt[T_TSS],                     0, CPU_GDT_KCODE, &Xtss,            0);
  101204:	c7 c1 c2 24 10 00    	mov    $0x1024c2,%ecx
  10120a:	66 89 88 f0 90 02 00 	mov    %cx,0x290f0(%eax)
  101211:	66 c7 80 f2 90 02 00 	movw   $0x8,0x290f2(%eax)
  101218:	08 00 
  10121a:	0f b6 90 f4 90 02 00 	movzbl 0x290f4(%eax),%edx
  101221:	83 e2 e0             	and    $0xffffffe0,%edx
  101224:	88 90 f4 90 02 00    	mov    %dl,0x290f4(%eax)
  10122a:	c6 80 f4 90 02 00 00 	movb   $0x0,0x290f4(%eax)
  101231:	0f b6 90 f5 90 02 00 	movzbl 0x290f5(%eax),%edx
  101238:	83 e2 f0             	and    $0xfffffff0,%edx
  10123b:	83 ca 0e             	or     $0xe,%edx
  10123e:	88 90 f5 90 02 00    	mov    %dl,0x290f5(%eax)
  101244:	89 d3                	mov    %edx,%ebx
  101246:	83 e3 ef             	and    $0xffffffef,%ebx
  101249:	88 98 f5 90 02 00    	mov    %bl,0x290f5(%eax)
  10124f:	83 e2 8f             	and    $0xffffff8f,%edx
  101252:	88 90 f5 90 02 00    	mov    %dl,0x290f5(%eax)
  101258:	83 ca 80             	or     $0xffffff80,%edx
  10125b:	88 90 f5 90 02 00    	mov    %dl,0x290f5(%eax)
  101261:	c1 e9 10             	shr    $0x10,%ecx
  101264:	66 89 88 f6 90 02 00 	mov    %cx,0x290f6(%eax)
    SETGATE(idt[T_SEGNP],                   0, CPU_GDT_KCODE, &Xsegnp,          0);
  10126b:	c7 c1 ca 24 10 00    	mov    $0x1024ca,%ecx
  101271:	66 89 88 f8 90 02 00 	mov    %cx,0x290f8(%eax)
  101278:	66 c7 80 fa 90 02 00 	movw   $0x8,0x290fa(%eax)
  10127f:	08 00 
  101281:	0f b6 90 fc 90 02 00 	movzbl 0x290fc(%eax),%edx
  101288:	83 e2 e0             	and    $0xffffffe0,%edx
  10128b:	88 90 fc 90 02 00    	mov    %dl,0x290fc(%eax)
  101291:	c6 80 fc 90 02 00 00 	movb   $0x0,0x290fc(%eax)
  101298:	0f b6 90 fd 90 02 00 	movzbl 0x290fd(%eax),%edx
  10129f:	83 e2 f0             	and    $0xfffffff0,%edx
  1012a2:	83 ca 0e             	or     $0xe,%edx
  1012a5:	88 90 fd 90 02 00    	mov    %dl,0x290fd(%eax)
  1012ab:	89 d3                	mov    %edx,%ebx
  1012ad:	83 e3 ef             	and    $0xffffffef,%ebx
  1012b0:	88 98 fd 90 02 00    	mov    %bl,0x290fd(%eax)
  1012b6:	83 e2 8f             	and    $0xffffff8f,%edx
  1012b9:	88 90 fd 90 02 00    	mov    %dl,0x290fd(%eax)
  1012bf:	83 ca 80             	or     $0xffffff80,%edx
  1012c2:	88 90 fd 90 02 00    	mov    %dl,0x290fd(%eax)
  1012c8:	c1 e9 10             	shr    $0x10,%ecx
  1012cb:	66 89 88 fe 90 02 00 	mov    %cx,0x290fe(%eax)
    SETGATE(idt[T_STACK],                   0, CPU_GDT_KCODE, &Xstack,          0);
  1012d2:	c7 c1 d2 24 10 00    	mov    $0x1024d2,%ecx
  1012d8:	66 89 88 00 91 02 00 	mov    %cx,0x29100(%eax)
  1012df:	66 c7 80 02 91 02 00 	movw   $0x8,0x29102(%eax)
  1012e6:	08 00 
  1012e8:	0f b6 90 04 91 02 00 	movzbl 0x29104(%eax),%edx
  1012ef:	83 e2 e0             	and    $0xffffffe0,%edx
  1012f2:	88 90 04 91 02 00    	mov    %dl,0x29104(%eax)
  1012f8:	c6 80 04 91 02 00 00 	movb   $0x0,0x29104(%eax)
  1012ff:	0f b6 90 05 91 02 00 	movzbl 0x29105(%eax),%edx
  101306:	83 e2 f0             	and    $0xfffffff0,%edx
  101309:	83 ca 0e             	or     $0xe,%edx
  10130c:	88 90 05 91 02 00    	mov    %dl,0x29105(%eax)
  101312:	89 d3                	mov    %edx,%ebx
  101314:	83 e3 ef             	and    $0xffffffef,%ebx
  101317:	88 98 05 91 02 00    	mov    %bl,0x29105(%eax)
  10131d:	83 e2 8f             	and    $0xffffff8f,%edx
  101320:	88 90 05 91 02 00    	mov    %dl,0x29105(%eax)
  101326:	83 ca 80             	or     $0xffffff80,%edx
  101329:	88 90 05 91 02 00    	mov    %dl,0x29105(%eax)
  10132f:	c1 e9 10             	shr    $0x10,%ecx
  101332:	66 89 88 06 91 02 00 	mov    %cx,0x29106(%eax)
    SETGATE(idt[T_GPFLT],                   0, CPU_GDT_KCODE, &Xgpflt,          0);
  101339:	c7 c1 da 24 10 00    	mov    $0x1024da,%ecx
  10133f:	66 89 88 08 91 02 00 	mov    %cx,0x29108(%eax)
  101346:	66 c7 80 0a 91 02 00 	movw   $0x8,0x2910a(%eax)
  10134d:	08 00 
  10134f:	0f b6 90 0c 91 02 00 	movzbl 0x2910c(%eax),%edx
  101356:	83 e2 e0             	and    $0xffffffe0,%edx
  101359:	88 90 0c 91 02 00    	mov    %dl,0x2910c(%eax)
  10135f:	c6 80 0c 91 02 00 00 	movb   $0x0,0x2910c(%eax)
  101366:	0f b6 90 0d 91 02 00 	movzbl 0x2910d(%eax),%edx
  10136d:	83 e2 f0             	and    $0xfffffff0,%edx
  101370:	83 ca 0e             	or     $0xe,%edx
  101373:	88 90 0d 91 02 00    	mov    %dl,0x2910d(%eax)
  101379:	89 d3                	mov    %edx,%ebx
  10137b:	83 e3 ef             	and    $0xffffffef,%ebx
  10137e:	88 98 0d 91 02 00    	mov    %bl,0x2910d(%eax)
  101384:	83 e2 8f             	and    $0xffffff8f,%edx
  101387:	88 90 0d 91 02 00    	mov    %dl,0x2910d(%eax)
  10138d:	83 ca 80             	or     $0xffffff80,%edx
  101390:	88 90 0d 91 02 00    	mov    %dl,0x2910d(%eax)
  101396:	c1 e9 10             	shr    $0x10,%ecx
  101399:	66 89 88 0e 91 02 00 	mov    %cx,0x2910e(%eax)
    SETGATE(idt[T_PGFLT],                   0, CPU_GDT_KCODE, &Xpgflt,          0);
  1013a0:	c7 c1 e2 24 10 00    	mov    $0x1024e2,%ecx
  1013a6:	66 89 88 10 91 02 00 	mov    %cx,0x29110(%eax)
  1013ad:	66 c7 80 12 91 02 00 	movw   $0x8,0x29112(%eax)
  1013b4:	08 00 
  1013b6:	0f b6 90 14 91 02 00 	movzbl 0x29114(%eax),%edx
  1013bd:	83 e2 e0             	and    $0xffffffe0,%edx
  1013c0:	88 90 14 91 02 00    	mov    %dl,0x29114(%eax)
  1013c6:	c6 80 14 91 02 00 00 	movb   $0x0,0x29114(%eax)
  1013cd:	0f b6 90 15 91 02 00 	movzbl 0x29115(%eax),%edx
  1013d4:	83 e2 f0             	and    $0xfffffff0,%edx
  1013d7:	83 ca 0e             	or     $0xe,%edx
  1013da:	88 90 15 91 02 00    	mov    %dl,0x29115(%eax)
  1013e0:	89 d3                	mov    %edx,%ebx
  1013e2:	83 e3 ef             	and    $0xffffffef,%ebx
  1013e5:	88 98 15 91 02 00    	mov    %bl,0x29115(%eax)
  1013eb:	83 e2 8f             	and    $0xffffff8f,%edx
  1013ee:	88 90 15 91 02 00    	mov    %dl,0x29115(%eax)
  1013f4:	83 ca 80             	or     $0xffffff80,%edx
  1013f7:	88 90 15 91 02 00    	mov    %dl,0x29115(%eax)
  1013fd:	c1 e9 10             	shr    $0x10,%ecx
  101400:	66 89 88 16 91 02 00 	mov    %cx,0x29116(%eax)
    SETGATE(idt[T_FPERR],                   0, CPU_GDT_KCODE, &Xfperr,          0);
  101407:	c7 c1 f4 24 10 00    	mov    $0x1024f4,%ecx
  10140d:	66 89 88 20 91 02 00 	mov    %cx,0x29120(%eax)
  101414:	66 c7 80 22 91 02 00 	movw   $0x8,0x29122(%eax)
  10141b:	08 00 
  10141d:	0f b6 90 24 91 02 00 	movzbl 0x29124(%eax),%edx
  101424:	83 e2 e0             	and    $0xffffffe0,%edx
  101427:	88 90 24 91 02 00    	mov    %dl,0x29124(%eax)
  10142d:	c6 80 24 91 02 00 00 	movb   $0x0,0x29124(%eax)
  101434:	0f b6 90 25 91 02 00 	movzbl 0x29125(%eax),%edx
  10143b:	83 e2 f0             	and    $0xfffffff0,%edx
  10143e:	83 ca 0e             	or     $0xe,%edx
  101441:	88 90 25 91 02 00    	mov    %dl,0x29125(%eax)
  101447:	89 d3                	mov    %edx,%ebx
  101449:	83 e3 ef             	and    $0xffffffef,%ebx
  10144c:	88 98 25 91 02 00    	mov    %bl,0x29125(%eax)
  101452:	83 e2 8f             	and    $0xffffff8f,%edx
  101455:	88 90 25 91 02 00    	mov    %dl,0x29125(%eax)
  10145b:	83 ca 80             	or     $0xffffff80,%edx
  10145e:	88 90 25 91 02 00    	mov    %dl,0x29125(%eax)
  101464:	c1 e9 10             	shr    $0x10,%ecx
  101467:	66 89 88 26 91 02 00 	mov    %cx,0x29126(%eax)
    SETGATE(idt[T_ALIGN],                   0, CPU_GDT_KCODE, &Xalign,          0);
  10146e:	c7 c1 fe 24 10 00    	mov    $0x1024fe,%ecx
  101474:	66 89 88 28 91 02 00 	mov    %cx,0x29128(%eax)
  10147b:	66 c7 80 2a 91 02 00 	movw   $0x8,0x2912a(%eax)
  101482:	08 00 
  101484:	0f b6 90 2c 91 02 00 	movzbl 0x2912c(%eax),%edx
  10148b:	83 e2 e0             	and    $0xffffffe0,%edx
  10148e:	88 90 2c 91 02 00    	mov    %dl,0x2912c(%eax)
  101494:	c6 80 2c 91 02 00 00 	movb   $0x0,0x2912c(%eax)
  10149b:	0f b6 90 2d 91 02 00 	movzbl 0x2912d(%eax),%edx
  1014a2:	83 e2 f0             	and    $0xfffffff0,%edx
  1014a5:	83 ca 0e             	or     $0xe,%edx
  1014a8:	88 90 2d 91 02 00    	mov    %dl,0x2912d(%eax)
  1014ae:	89 d3                	mov    %edx,%ebx
  1014b0:	83 e3 ef             	and    $0xffffffef,%ebx
  1014b3:	88 98 2d 91 02 00    	mov    %bl,0x2912d(%eax)
  1014b9:	83 e2 8f             	and    $0xffffff8f,%edx
  1014bc:	88 90 2d 91 02 00    	mov    %dl,0x2912d(%eax)
  1014c2:	83 ca 80             	or     $0xffffff80,%edx
  1014c5:	88 90 2d 91 02 00    	mov    %dl,0x2912d(%eax)
  1014cb:	c1 e9 10             	shr    $0x10,%ecx
  1014ce:	66 89 88 2e 91 02 00 	mov    %cx,0x2912e(%eax)
    SETGATE(idt[T_MCHK],                    0, CPU_GDT_KCODE, &Xmchk,           0);
  1014d5:	c7 c1 02 25 10 00    	mov    $0x102502,%ecx
  1014db:	66 89 88 30 91 02 00 	mov    %cx,0x29130(%eax)
  1014e2:	66 c7 80 32 91 02 00 	movw   $0x8,0x29132(%eax)
  1014e9:	08 00 
  1014eb:	0f b6 90 34 91 02 00 	movzbl 0x29134(%eax),%edx
  1014f2:	83 e2 e0             	and    $0xffffffe0,%edx
  1014f5:	88 90 34 91 02 00    	mov    %dl,0x29134(%eax)
  1014fb:	c6 80 34 91 02 00 00 	movb   $0x0,0x29134(%eax)
  101502:	0f b6 90 35 91 02 00 	movzbl 0x29135(%eax),%edx
  101509:	83 e2 f0             	and    $0xfffffff0,%edx
  10150c:	83 ca 0e             	or     $0xe,%edx
  10150f:	88 90 35 91 02 00    	mov    %dl,0x29135(%eax)
  101515:	89 d3                	mov    %edx,%ebx
  101517:	83 e3 ef             	and    $0xffffffef,%ebx
  10151a:	88 98 35 91 02 00    	mov    %bl,0x29135(%eax)
  101520:	83 e2 8f             	and    $0xffffff8f,%edx
  101523:	88 90 35 91 02 00    	mov    %dl,0x29135(%eax)
  101529:	83 ca 80             	or     $0xffffff80,%edx
  10152c:	88 90 35 91 02 00    	mov    %dl,0x29135(%eax)
  101532:	c1 e9 10             	shr    $0x10,%ecx
  101535:	66 89 88 36 91 02 00 	mov    %cx,0x29136(%eax)

    SETGATE(idt[T_IRQ0 + IRQ_TIMER],        0, CPU_GDT_KCODE, &Xirq_timer,      0);
  10153c:	c7 c1 08 25 10 00    	mov    $0x102508,%ecx
  101542:	66 89 88 a0 91 02 00 	mov    %cx,0x291a0(%eax)
  101549:	66 c7 80 a2 91 02 00 	movw   $0x8,0x291a2(%eax)
  101550:	08 00 
  101552:	0f b6 90 a4 91 02 00 	movzbl 0x291a4(%eax),%edx
  101559:	83 e2 e0             	and    $0xffffffe0,%edx
  10155c:	88 90 a4 91 02 00    	mov    %dl,0x291a4(%eax)
  101562:	c6 80 a4 91 02 00 00 	movb   $0x0,0x291a4(%eax)
  101569:	0f b6 90 a5 91 02 00 	movzbl 0x291a5(%eax),%edx
  101570:	83 e2 f0             	and    $0xfffffff0,%edx
  101573:	83 ca 0e             	or     $0xe,%edx
  101576:	88 90 a5 91 02 00    	mov    %dl,0x291a5(%eax)
  10157c:	89 d3                	mov    %edx,%ebx
  10157e:	83 e3 ef             	and    $0xffffffef,%ebx
  101581:	88 98 a5 91 02 00    	mov    %bl,0x291a5(%eax)
  101587:	83 e2 8f             	and    $0xffffff8f,%edx
  10158a:	88 90 a5 91 02 00    	mov    %dl,0x291a5(%eax)
  101590:	83 ca 80             	or     $0xffffff80,%edx
  101593:	88 90 a5 91 02 00    	mov    %dl,0x291a5(%eax)
  101599:	c1 e9 10             	shr    $0x10,%ecx
  10159c:	66 89 88 a6 91 02 00 	mov    %cx,0x291a6(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_KBD],          0, CPU_GDT_KCODE, &Xirq_kbd,        0);
  1015a3:	c7 c1 0e 25 10 00    	mov    $0x10250e,%ecx
  1015a9:	66 89 88 a8 91 02 00 	mov    %cx,0x291a8(%eax)
  1015b0:	66 c7 80 aa 91 02 00 	movw   $0x8,0x291aa(%eax)
  1015b7:	08 00 
  1015b9:	0f b6 90 ac 91 02 00 	movzbl 0x291ac(%eax),%edx
  1015c0:	83 e2 e0             	and    $0xffffffe0,%edx
  1015c3:	88 90 ac 91 02 00    	mov    %dl,0x291ac(%eax)
  1015c9:	c6 80 ac 91 02 00 00 	movb   $0x0,0x291ac(%eax)
  1015d0:	0f b6 90 ad 91 02 00 	movzbl 0x291ad(%eax),%edx
  1015d7:	83 e2 f0             	and    $0xfffffff0,%edx
  1015da:	83 ca 0e             	or     $0xe,%edx
  1015dd:	88 90 ad 91 02 00    	mov    %dl,0x291ad(%eax)
  1015e3:	89 d3                	mov    %edx,%ebx
  1015e5:	83 e3 ef             	and    $0xffffffef,%ebx
  1015e8:	88 98 ad 91 02 00    	mov    %bl,0x291ad(%eax)
  1015ee:	83 e2 8f             	and    $0xffffff8f,%edx
  1015f1:	88 90 ad 91 02 00    	mov    %dl,0x291ad(%eax)
  1015f7:	83 ca 80             	or     $0xffffff80,%edx
  1015fa:	88 90 ad 91 02 00    	mov    %dl,0x291ad(%eax)
  101600:	c1 e9 10             	shr    $0x10,%ecx
  101603:	66 89 88 ae 91 02 00 	mov    %cx,0x291ae(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_SLAVE],        0, CPU_GDT_KCODE, &Xirq_slave,      0);
  10160a:	c7 c1 14 25 10 00    	mov    $0x102514,%ecx
  101610:	66 89 88 b0 91 02 00 	mov    %cx,0x291b0(%eax)
  101617:	66 c7 80 b2 91 02 00 	movw   $0x8,0x291b2(%eax)
  10161e:	08 00 
  101620:	0f b6 90 b4 91 02 00 	movzbl 0x291b4(%eax),%edx
  101627:	83 e2 e0             	and    $0xffffffe0,%edx
  10162a:	88 90 b4 91 02 00    	mov    %dl,0x291b4(%eax)
  101630:	c6 80 b4 91 02 00 00 	movb   $0x0,0x291b4(%eax)
  101637:	0f b6 90 b5 91 02 00 	movzbl 0x291b5(%eax),%edx
  10163e:	83 e2 f0             	and    $0xfffffff0,%edx
  101641:	83 ca 0e             	or     $0xe,%edx
  101644:	88 90 b5 91 02 00    	mov    %dl,0x291b5(%eax)
  10164a:	89 d3                	mov    %edx,%ebx
  10164c:	83 e3 ef             	and    $0xffffffef,%ebx
  10164f:	88 98 b5 91 02 00    	mov    %bl,0x291b5(%eax)
  101655:	83 e2 8f             	and    $0xffffff8f,%edx
  101658:	88 90 b5 91 02 00    	mov    %dl,0x291b5(%eax)
  10165e:	83 ca 80             	or     $0xffffff80,%edx
  101661:	88 90 b5 91 02 00    	mov    %dl,0x291b5(%eax)
  101667:	c1 e9 10             	shr    $0x10,%ecx
  10166a:	66 89 88 b6 91 02 00 	mov    %cx,0x291b6(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL24],     0, CPU_GDT_KCODE, &Xirq_serial2,    0);
  101671:	c7 c1 1a 25 10 00    	mov    $0x10251a,%ecx
  101677:	66 89 88 b8 91 02 00 	mov    %cx,0x291b8(%eax)
  10167e:	66 c7 80 ba 91 02 00 	movw   $0x8,0x291ba(%eax)
  101685:	08 00 
  101687:	0f b6 90 bc 91 02 00 	movzbl 0x291bc(%eax),%edx
  10168e:	83 e2 e0             	and    $0xffffffe0,%edx
  101691:	88 90 bc 91 02 00    	mov    %dl,0x291bc(%eax)
  101697:	c6 80 bc 91 02 00 00 	movb   $0x0,0x291bc(%eax)
  10169e:	0f b6 90 bd 91 02 00 	movzbl 0x291bd(%eax),%edx
  1016a5:	83 e2 f0             	and    $0xfffffff0,%edx
  1016a8:	83 ca 0e             	or     $0xe,%edx
  1016ab:	88 90 bd 91 02 00    	mov    %dl,0x291bd(%eax)
  1016b1:	89 d3                	mov    %edx,%ebx
  1016b3:	83 e3 ef             	and    $0xffffffef,%ebx
  1016b6:	88 98 bd 91 02 00    	mov    %bl,0x291bd(%eax)
  1016bc:	83 e2 8f             	and    $0xffffff8f,%edx
  1016bf:	88 90 bd 91 02 00    	mov    %dl,0x291bd(%eax)
  1016c5:	83 ca 80             	or     $0xffffff80,%edx
  1016c8:	88 90 bd 91 02 00    	mov    %dl,0x291bd(%eax)
  1016ce:	c1 e9 10             	shr    $0x10,%ecx
  1016d1:	66 89 88 be 91 02 00 	mov    %cx,0x291be(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL13],     0, CPU_GDT_KCODE, &Xirq_serial1,    0);
  1016d8:	c7 c1 20 25 10 00    	mov    $0x102520,%ecx
  1016de:	66 89 88 c0 91 02 00 	mov    %cx,0x291c0(%eax)
  1016e5:	66 c7 80 c2 91 02 00 	movw   $0x8,0x291c2(%eax)
  1016ec:	08 00 
  1016ee:	0f b6 90 c4 91 02 00 	movzbl 0x291c4(%eax),%edx
  1016f5:	83 e2 e0             	and    $0xffffffe0,%edx
  1016f8:	88 90 c4 91 02 00    	mov    %dl,0x291c4(%eax)
  1016fe:	c6 80 c4 91 02 00 00 	movb   $0x0,0x291c4(%eax)
  101705:	0f b6 90 c5 91 02 00 	movzbl 0x291c5(%eax),%edx
  10170c:	83 e2 f0             	and    $0xfffffff0,%edx
  10170f:	83 ca 0e             	or     $0xe,%edx
  101712:	88 90 c5 91 02 00    	mov    %dl,0x291c5(%eax)
  101718:	89 d3                	mov    %edx,%ebx
  10171a:	83 e3 ef             	and    $0xffffffef,%ebx
  10171d:	88 98 c5 91 02 00    	mov    %bl,0x291c5(%eax)
  101723:	83 e2 8f             	and    $0xffffff8f,%edx
  101726:	88 90 c5 91 02 00    	mov    %dl,0x291c5(%eax)
  10172c:	83 ca 80             	or     $0xffffff80,%edx
  10172f:	88 90 c5 91 02 00    	mov    %dl,0x291c5(%eax)
  101735:	c1 e9 10             	shr    $0x10,%ecx
  101738:	66 89 88 c6 91 02 00 	mov    %cx,0x291c6(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_LPT2],         0, CPU_GDT_KCODE, &Xirq_lpt,        0);
  10173f:	c7 c1 26 25 10 00    	mov    $0x102526,%ecx
  101745:	66 89 88 c8 91 02 00 	mov    %cx,0x291c8(%eax)
  10174c:	66 c7 80 ca 91 02 00 	movw   $0x8,0x291ca(%eax)
  101753:	08 00 
  101755:	0f b6 90 cc 91 02 00 	movzbl 0x291cc(%eax),%edx
  10175c:	83 e2 e0             	and    $0xffffffe0,%edx
  10175f:	88 90 cc 91 02 00    	mov    %dl,0x291cc(%eax)
  101765:	c6 80 cc 91 02 00 00 	movb   $0x0,0x291cc(%eax)
  10176c:	0f b6 90 cd 91 02 00 	movzbl 0x291cd(%eax),%edx
  101773:	83 e2 f0             	and    $0xfffffff0,%edx
  101776:	83 ca 0e             	or     $0xe,%edx
  101779:	88 90 cd 91 02 00    	mov    %dl,0x291cd(%eax)
  10177f:	89 d3                	mov    %edx,%ebx
  101781:	83 e3 ef             	and    $0xffffffef,%ebx
  101784:	88 98 cd 91 02 00    	mov    %bl,0x291cd(%eax)
  10178a:	83 e2 8f             	and    $0xffffff8f,%edx
  10178d:	88 90 cd 91 02 00    	mov    %dl,0x291cd(%eax)
  101793:	83 ca 80             	or     $0xffffff80,%edx
  101796:	88 90 cd 91 02 00    	mov    %dl,0x291cd(%eax)
  10179c:	c1 e9 10             	shr    $0x10,%ecx
  10179f:	66 89 88 ce 91 02 00 	mov    %cx,0x291ce(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_FLOPPY],       0, CPU_GDT_KCODE, &Xirq_floppy,     0);
  1017a6:	c7 c1 2c 25 10 00    	mov    $0x10252c,%ecx
  1017ac:	66 89 88 d0 91 02 00 	mov    %cx,0x291d0(%eax)
  1017b3:	66 c7 80 d2 91 02 00 	movw   $0x8,0x291d2(%eax)
  1017ba:	08 00 
  1017bc:	0f b6 90 d4 91 02 00 	movzbl 0x291d4(%eax),%edx
  1017c3:	83 e2 e0             	and    $0xffffffe0,%edx
  1017c6:	88 90 d4 91 02 00    	mov    %dl,0x291d4(%eax)
  1017cc:	c6 80 d4 91 02 00 00 	movb   $0x0,0x291d4(%eax)
  1017d3:	0f b6 90 d5 91 02 00 	movzbl 0x291d5(%eax),%edx
  1017da:	83 e2 f0             	and    $0xfffffff0,%edx
  1017dd:	83 ca 0e             	or     $0xe,%edx
  1017e0:	88 90 d5 91 02 00    	mov    %dl,0x291d5(%eax)
  1017e6:	89 d3                	mov    %edx,%ebx
  1017e8:	83 e3 ef             	and    $0xffffffef,%ebx
  1017eb:	88 98 d5 91 02 00    	mov    %bl,0x291d5(%eax)
  1017f1:	83 e2 8f             	and    $0xffffff8f,%edx
  1017f4:	88 90 d5 91 02 00    	mov    %dl,0x291d5(%eax)
  1017fa:	83 ca 80             	or     $0xffffff80,%edx
  1017fd:	88 90 d5 91 02 00    	mov    %dl,0x291d5(%eax)
  101803:	c1 e9 10             	shr    $0x10,%ecx
  101806:	66 89 88 d6 91 02 00 	mov    %cx,0x291d6(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_SPURIOUS],     0, CPU_GDT_KCODE, &Xirq_spurious,   0);
  10180d:	c7 c1 32 25 10 00    	mov    $0x102532,%ecx
  101813:	66 89 88 d8 91 02 00 	mov    %cx,0x291d8(%eax)
  10181a:	66 c7 80 da 91 02 00 	movw   $0x8,0x291da(%eax)
  101821:	08 00 
  101823:	0f b6 90 dc 91 02 00 	movzbl 0x291dc(%eax),%edx
  10182a:	83 e2 e0             	and    $0xffffffe0,%edx
  10182d:	88 90 dc 91 02 00    	mov    %dl,0x291dc(%eax)
  101833:	c6 80 dc 91 02 00 00 	movb   $0x0,0x291dc(%eax)
  10183a:	0f b6 90 dd 91 02 00 	movzbl 0x291dd(%eax),%edx
  101841:	83 e2 f0             	and    $0xfffffff0,%edx
  101844:	83 ca 0e             	or     $0xe,%edx
  101847:	88 90 dd 91 02 00    	mov    %dl,0x291dd(%eax)
  10184d:	89 d3                	mov    %edx,%ebx
  10184f:	83 e3 ef             	and    $0xffffffef,%ebx
  101852:	88 98 dd 91 02 00    	mov    %bl,0x291dd(%eax)
  101858:	83 e2 8f             	and    $0xffffff8f,%edx
  10185b:	88 90 dd 91 02 00    	mov    %dl,0x291dd(%eax)
  101861:	83 ca 80             	or     $0xffffff80,%edx
  101864:	88 90 dd 91 02 00    	mov    %dl,0x291dd(%eax)
  10186a:	c1 e9 10             	shr    $0x10,%ecx
  10186d:	66 89 88 de 91 02 00 	mov    %cx,0x291de(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_RTC],          0, CPU_GDT_KCODE, &Xirq_rtc,        0);
  101874:	c7 c1 38 25 10 00    	mov    $0x102538,%ecx
  10187a:	66 89 88 e0 91 02 00 	mov    %cx,0x291e0(%eax)
  101881:	66 c7 80 e2 91 02 00 	movw   $0x8,0x291e2(%eax)
  101888:	08 00 
  10188a:	0f b6 90 e4 91 02 00 	movzbl 0x291e4(%eax),%edx
  101891:	83 e2 e0             	and    $0xffffffe0,%edx
  101894:	88 90 e4 91 02 00    	mov    %dl,0x291e4(%eax)
  10189a:	c6 80 e4 91 02 00 00 	movb   $0x0,0x291e4(%eax)
  1018a1:	0f b6 90 e5 91 02 00 	movzbl 0x291e5(%eax),%edx
  1018a8:	83 e2 f0             	and    $0xfffffff0,%edx
  1018ab:	83 ca 0e             	or     $0xe,%edx
  1018ae:	88 90 e5 91 02 00    	mov    %dl,0x291e5(%eax)
  1018b4:	89 d3                	mov    %edx,%ebx
  1018b6:	83 e3 ef             	and    $0xffffffef,%ebx
  1018b9:	88 98 e5 91 02 00    	mov    %bl,0x291e5(%eax)
  1018bf:	83 e2 8f             	and    $0xffffff8f,%edx
  1018c2:	88 90 e5 91 02 00    	mov    %dl,0x291e5(%eax)
  1018c8:	83 ca 80             	or     $0xffffff80,%edx
  1018cb:	88 90 e5 91 02 00    	mov    %dl,0x291e5(%eax)
  1018d1:	c1 e9 10             	shr    $0x10,%ecx
  1018d4:	66 89 88 e6 91 02 00 	mov    %cx,0x291e6(%eax)
    SETGATE(idt[T_IRQ0 + 9],                0, CPU_GDT_KCODE, &Xirq9,           0);
  1018db:	c7 c1 3e 25 10 00    	mov    $0x10253e,%ecx
  1018e1:	66 89 88 e8 91 02 00 	mov    %cx,0x291e8(%eax)
  1018e8:	66 c7 80 ea 91 02 00 	movw   $0x8,0x291ea(%eax)
  1018ef:	08 00 
  1018f1:	0f b6 90 ec 91 02 00 	movzbl 0x291ec(%eax),%edx
  1018f8:	83 e2 e0             	and    $0xffffffe0,%edx
  1018fb:	88 90 ec 91 02 00    	mov    %dl,0x291ec(%eax)
  101901:	c6 80 ec 91 02 00 00 	movb   $0x0,0x291ec(%eax)
  101908:	0f b6 90 ed 91 02 00 	movzbl 0x291ed(%eax),%edx
  10190f:	83 e2 f0             	and    $0xfffffff0,%edx
  101912:	83 ca 0e             	or     $0xe,%edx
  101915:	88 90 ed 91 02 00    	mov    %dl,0x291ed(%eax)
  10191b:	89 d3                	mov    %edx,%ebx
  10191d:	83 e3 ef             	and    $0xffffffef,%ebx
  101920:	88 98 ed 91 02 00    	mov    %bl,0x291ed(%eax)
  101926:	83 e2 8f             	and    $0xffffff8f,%edx
  101929:	88 90 ed 91 02 00    	mov    %dl,0x291ed(%eax)
  10192f:	83 ca 80             	or     $0xffffff80,%edx
  101932:	88 90 ed 91 02 00    	mov    %dl,0x291ed(%eax)
  101938:	c1 e9 10             	shr    $0x10,%ecx
  10193b:	66 89 88 ee 91 02 00 	mov    %cx,0x291ee(%eax)
    SETGATE(idt[T_IRQ0 + 10],               0, CPU_GDT_KCODE, &Xirq10,          0);
  101942:	c7 c2 44 25 10 00    	mov    $0x102544,%edx
  101948:	66 89 90 f0 91 02 00 	mov    %dx,0x291f0(%eax)
  10194f:	66 c7 80 f2 91 02 00 	movw   $0x8,0x291f2(%eax)
  101956:	08 00 
  101958:	0f b6 90 f4 91 02 00 	movzbl 0x291f4(%eax),%edx
  10195f:	83 e2 e0             	and    $0xffffffe0,%edx
  101962:	88 90 f4 91 02 00    	mov    %dl,0x291f4(%eax)
  101968:	c6 80 f4 91 02 00 00 	movb   $0x0,0x291f4(%eax)
  10196f:	0f b6 90 f5 91 02 00 	movzbl 0x291f5(%eax),%edx
  101976:	83 e2 f0             	and    $0xfffffff0,%edx
  101979:	83 ca 0e             	or     $0xe,%edx
  10197c:	88 90 f5 91 02 00    	mov    %dl,0x291f5(%eax)
  101982:	89 d1                	mov    %edx,%ecx
  101984:	83 e1 ef             	and    $0xffffffef,%ecx
  101987:	88 88 f5 91 02 00    	mov    %cl,0x291f5(%eax)
  10198d:	83 e2 8f             	and    $0xffffff8f,%edx
  101990:	88 90 f5 91 02 00    	mov    %dl,0x291f5(%eax)
  101996:	83 ca 80             	or     $0xffffff80,%edx
  101999:	88 90 f5 91 02 00    	mov    %dl,0x291f5(%eax)
  10199f:	c7 c2 44 25 10 00    	mov    $0x102544,%edx
  1019a5:	c1 ea 10             	shr    $0x10,%edx
  1019a8:	66 89 90 f6 91 02 00 	mov    %dx,0x291f6(%eax)
    SETGATE(idt[T_IRQ0 + 11],               0, CPU_GDT_KCODE, &Xirq11,          0);
  1019af:	c7 c1 4a 25 10 00    	mov    $0x10254a,%ecx
  1019b5:	66 89 88 f8 91 02 00 	mov    %cx,0x291f8(%eax)
  1019bc:	66 c7 80 fa 91 02 00 	movw   $0x8,0x291fa(%eax)
  1019c3:	08 00 
  1019c5:	0f b6 90 fc 91 02 00 	movzbl 0x291fc(%eax),%edx
  1019cc:	83 e2 e0             	and    $0xffffffe0,%edx
  1019cf:	88 90 fc 91 02 00    	mov    %dl,0x291fc(%eax)
  1019d5:	c6 80 fc 91 02 00 00 	movb   $0x0,0x291fc(%eax)
  1019dc:	0f b6 90 fd 91 02 00 	movzbl 0x291fd(%eax),%edx
  1019e3:	83 e2 f0             	and    $0xfffffff0,%edx
  1019e6:	83 ca 0e             	or     $0xe,%edx
  1019e9:	88 90 fd 91 02 00    	mov    %dl,0x291fd(%eax)
  1019ef:	89 d3                	mov    %edx,%ebx
  1019f1:	83 e3 ef             	and    $0xffffffef,%ebx
  1019f4:	88 98 fd 91 02 00    	mov    %bl,0x291fd(%eax)
  1019fa:	83 e2 8f             	and    $0xffffff8f,%edx
  1019fd:	88 90 fd 91 02 00    	mov    %dl,0x291fd(%eax)
  101a03:	83 ca 80             	or     $0xffffff80,%edx
  101a06:	88 90 fd 91 02 00    	mov    %dl,0x291fd(%eax)
  101a0c:	c1 e9 10             	shr    $0x10,%ecx
  101a0f:	66 89 88 fe 91 02 00 	mov    %cx,0x291fe(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_MOUSE],        0, CPU_GDT_KCODE, &Xirq_mouse,      0);
  101a16:	c7 c1 50 25 10 00    	mov    $0x102550,%ecx
  101a1c:	66 89 88 00 92 02 00 	mov    %cx,0x29200(%eax)
  101a23:	66 c7 80 02 92 02 00 	movw   $0x8,0x29202(%eax)
  101a2a:	08 00 
  101a2c:	0f b6 90 04 92 02 00 	movzbl 0x29204(%eax),%edx
  101a33:	83 e2 e0             	and    $0xffffffe0,%edx
  101a36:	88 90 04 92 02 00    	mov    %dl,0x29204(%eax)
  101a3c:	c6 80 04 92 02 00 00 	movb   $0x0,0x29204(%eax)
  101a43:	0f b6 90 05 92 02 00 	movzbl 0x29205(%eax),%edx
  101a4a:	83 e2 f0             	and    $0xfffffff0,%edx
  101a4d:	83 ca 0e             	or     $0xe,%edx
  101a50:	88 90 05 92 02 00    	mov    %dl,0x29205(%eax)
  101a56:	89 d3                	mov    %edx,%ebx
  101a58:	83 e3 ef             	and    $0xffffffef,%ebx
  101a5b:	88 98 05 92 02 00    	mov    %bl,0x29205(%eax)
  101a61:	83 e2 8f             	and    $0xffffff8f,%edx
  101a64:	88 90 05 92 02 00    	mov    %dl,0x29205(%eax)
  101a6a:	83 ca 80             	or     $0xffffff80,%edx
  101a6d:	88 90 05 92 02 00    	mov    %dl,0x29205(%eax)
  101a73:	c1 e9 10             	shr    $0x10,%ecx
  101a76:	66 89 88 06 92 02 00 	mov    %cx,0x29206(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_COPROCESSOR],  0, CPU_GDT_KCODE, &Xirq_coproc,     0);
  101a7d:	c7 c1 56 25 10 00    	mov    $0x102556,%ecx
  101a83:	66 89 88 08 92 02 00 	mov    %cx,0x29208(%eax)
  101a8a:	66 c7 80 0a 92 02 00 	movw   $0x8,0x2920a(%eax)
  101a91:	08 00 
  101a93:	0f b6 90 0c 92 02 00 	movzbl 0x2920c(%eax),%edx
  101a9a:	83 e2 e0             	and    $0xffffffe0,%edx
  101a9d:	88 90 0c 92 02 00    	mov    %dl,0x2920c(%eax)
  101aa3:	c6 80 0c 92 02 00 00 	movb   $0x0,0x2920c(%eax)
  101aaa:	0f b6 90 0d 92 02 00 	movzbl 0x2920d(%eax),%edx
  101ab1:	83 e2 f0             	and    $0xfffffff0,%edx
  101ab4:	83 ca 0e             	or     $0xe,%edx
  101ab7:	88 90 0d 92 02 00    	mov    %dl,0x2920d(%eax)
  101abd:	89 d3                	mov    %edx,%ebx
  101abf:	83 e3 ef             	and    $0xffffffef,%ebx
  101ac2:	88 98 0d 92 02 00    	mov    %bl,0x2920d(%eax)
  101ac8:	83 e2 8f             	and    $0xffffff8f,%edx
  101acb:	88 90 0d 92 02 00    	mov    %dl,0x2920d(%eax)
  101ad1:	83 ca 80             	or     $0xffffff80,%edx
  101ad4:	88 90 0d 92 02 00    	mov    %dl,0x2920d(%eax)
  101ada:	c1 e9 10             	shr    $0x10,%ecx
  101add:	66 89 88 0e 92 02 00 	mov    %cx,0x2920e(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_IDE1],         0, CPU_GDT_KCODE, &Xirq_ide1,       0);
  101ae4:	c7 c1 5c 25 10 00    	mov    $0x10255c,%ecx
  101aea:	66 89 88 10 92 02 00 	mov    %cx,0x29210(%eax)
  101af1:	66 c7 80 12 92 02 00 	movw   $0x8,0x29212(%eax)
  101af8:	08 00 
  101afa:	0f b6 90 14 92 02 00 	movzbl 0x29214(%eax),%edx
  101b01:	83 e2 e0             	and    $0xffffffe0,%edx
  101b04:	88 90 14 92 02 00    	mov    %dl,0x29214(%eax)
  101b0a:	c6 80 14 92 02 00 00 	movb   $0x0,0x29214(%eax)
  101b11:	0f b6 90 15 92 02 00 	movzbl 0x29215(%eax),%edx
  101b18:	83 e2 f0             	and    $0xfffffff0,%edx
  101b1b:	83 ca 0e             	or     $0xe,%edx
  101b1e:	88 90 15 92 02 00    	mov    %dl,0x29215(%eax)
  101b24:	89 d3                	mov    %edx,%ebx
  101b26:	83 e3 ef             	and    $0xffffffef,%ebx
  101b29:	88 98 15 92 02 00    	mov    %bl,0x29215(%eax)
  101b2f:	83 e2 8f             	and    $0xffffff8f,%edx
  101b32:	88 90 15 92 02 00    	mov    %dl,0x29215(%eax)
  101b38:	83 ca 80             	or     $0xffffff80,%edx
  101b3b:	88 90 15 92 02 00    	mov    %dl,0x29215(%eax)
  101b41:	c1 e9 10             	shr    $0x10,%ecx
  101b44:	66 89 88 16 92 02 00 	mov    %cx,0x29216(%eax)
    SETGATE(idt[T_IRQ0 + IRQ_IDE2],         0, CPU_GDT_KCODE, &Xirq_ide2,       0);
  101b4b:	c7 c1 62 25 10 00    	mov    $0x102562,%ecx
  101b51:	66 89 88 18 92 02 00 	mov    %cx,0x29218(%eax)
  101b58:	66 c7 80 1a 92 02 00 	movw   $0x8,0x2921a(%eax)
  101b5f:	08 00 
  101b61:	0f b6 90 1c 92 02 00 	movzbl 0x2921c(%eax),%edx
  101b68:	83 e2 e0             	and    $0xffffffe0,%edx
  101b6b:	88 90 1c 92 02 00    	mov    %dl,0x2921c(%eax)
  101b71:	c6 80 1c 92 02 00 00 	movb   $0x0,0x2921c(%eax)
  101b78:	0f b6 90 1d 92 02 00 	movzbl 0x2921d(%eax),%edx
  101b7f:	83 e2 f0             	and    $0xfffffff0,%edx
  101b82:	83 ca 0e             	or     $0xe,%edx
  101b85:	88 90 1d 92 02 00    	mov    %dl,0x2921d(%eax)
  101b8b:	89 d3                	mov    %edx,%ebx
  101b8d:	83 e3 ef             	and    $0xffffffef,%ebx
  101b90:	88 98 1d 92 02 00    	mov    %bl,0x2921d(%eax)
  101b96:	83 e2 8f             	and    $0xffffff8f,%edx
  101b99:	88 90 1d 92 02 00    	mov    %dl,0x2921d(%eax)
  101b9f:	83 ca 80             	or     $0xffffff80,%edx
  101ba2:	88 90 1d 92 02 00    	mov    %dl,0x2921d(%eax)
  101ba8:	c1 e9 10             	shr    $0x10,%ecx
  101bab:	66 89 88 1e 92 02 00 	mov    %cx,0x2921e(%eax)

    // Use DPL=3 here because system calls are explicitly invoked
    // by the user process (with "int $T_SYSCALL").
    SETGATE(idt[T_SYSCALL], 0, CPU_GDT_KCODE, &Xsyscall, 3);
  101bb2:	c7 c1 68 25 10 00    	mov    $0x102568,%ecx
  101bb8:	66 89 88 20 92 02 00 	mov    %cx,0x29220(%eax)
  101bbf:	66 c7 80 22 92 02 00 	movw   $0x8,0x29222(%eax)
  101bc6:	08 00 
  101bc8:	0f b6 90 24 92 02 00 	movzbl 0x29224(%eax),%edx
  101bcf:	83 e2 e0             	and    $0xffffffe0,%edx
  101bd2:	88 90 24 92 02 00    	mov    %dl,0x29224(%eax)
  101bd8:	c6 80 24 92 02 00 00 	movb   $0x0,0x29224(%eax)
  101bdf:	0f b6 90 25 92 02 00 	movzbl 0x29225(%eax),%edx
  101be6:	83 e2 f0             	and    $0xfffffff0,%edx
  101be9:	83 ca 0e             	or     $0xe,%edx
  101bec:	88 90 25 92 02 00    	mov    %dl,0x29225(%eax)
  101bf2:	83 e2 ef             	and    $0xffffffef,%edx
  101bf5:	88 90 25 92 02 00    	mov    %dl,0x29225(%eax)
  101bfb:	89 d3                	mov    %edx,%ebx
  101bfd:	83 cb 60             	or     $0x60,%ebx
  101c00:	88 98 25 92 02 00    	mov    %bl,0x29225(%eax)
  101c06:	83 ca e0             	or     $0xffffffe0,%edx
  101c09:	88 90 25 92 02 00    	mov    %dl,0x29225(%eax)
  101c0f:	c1 e9 10             	shr    $0x10,%ecx
  101c12:	66 89 88 26 92 02 00 	mov    %cx,0x29226(%eax)

    /* default */
    SETGATE(idt[T_DEFAULT], 0, CPU_GDT_KCODE, &Xdefault, 0);
  101c19:	c7 c1 6e 25 10 00    	mov    $0x10256e,%ecx
  101c1f:	66 89 88 90 98 02 00 	mov    %cx,0x29890(%eax)
  101c26:	66 c7 80 92 98 02 00 	movw   $0x8,0x29892(%eax)
  101c2d:	08 00 
  101c2f:	0f b6 90 94 98 02 00 	movzbl 0x29894(%eax),%edx
  101c36:	83 e2 e0             	and    $0xffffffe0,%edx
  101c39:	88 90 94 98 02 00    	mov    %dl,0x29894(%eax)
  101c3f:	c6 80 94 98 02 00 00 	movb   $0x0,0x29894(%eax)
  101c46:	0f b6 90 95 98 02 00 	movzbl 0x29895(%eax),%edx
  101c4d:	83 e2 f0             	and    $0xfffffff0,%edx
  101c50:	83 ca 0e             	or     $0xe,%edx
  101c53:	88 90 95 98 02 00    	mov    %dl,0x29895(%eax)
  101c59:	89 d3                	mov    %edx,%ebx
  101c5b:	83 e3 ef             	and    $0xffffffef,%ebx
  101c5e:	88 98 95 98 02 00    	mov    %bl,0x29895(%eax)
  101c64:	83 e2 8f             	and    $0xffffff8f,%edx
  101c67:	88 90 95 98 02 00    	mov    %dl,0x29895(%eax)
  101c6d:	83 ca 80             	or     $0xffffff80,%edx
  101c70:	88 90 95 98 02 00    	mov    %dl,0x29895(%eax)
  101c76:	c1 e9 10             	shr    $0x10,%ecx
  101c79:	66 89 88 96 98 02 00 	mov    %cx,0x29896(%eax)

    asm volatile ("lidt %0" :: "m" (idt_pd));
  101c80:	0f 01 98 20 03 00 00 	lidtl  0x320(%eax)
}
  101c87:	5b                   	pop    %ebx
  101c88:	5e                   	pop    %esi
  101c89:	5f                   	pop    %edi
  101c8a:	5d                   	pop    %ebp
  101c8b:	c3                   	ret    

00101c8c <intr_init>:

void intr_init(void)
{
  101c8c:	53                   	push   %ebx
  101c8d:	83 ec 08             	sub    $0x8,%esp
  101c90:	e8 77 e6 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101c95:	81 c3 6b 93 00 00    	add    $0x936b,%ebx
    if (intr_inited == TRUE)
  101c9b:	0f b6 83 a0 98 02 00 	movzbl 0x298a0(%ebx),%eax
  101ca2:	3c 01                	cmp    $0x1,%al
  101ca4:	74 11                	je     101cb7 <intr_init+0x2b>
        return;

    pic_init();
  101ca6:	e8 89 00 00 00       	call   101d34 <pic_init>
    intr_init_idt();
  101cab:	e8 20 f1 ff ff       	call   100dd0 <intr_init_idt>
    intr_inited = TRUE;
  101cb0:	c6 83 a0 98 02 00 01 	movb   $0x1,0x298a0(%ebx)
}
  101cb7:	83 c4 08             	add    $0x8,%esp
  101cba:	5b                   	pop    %ebx
  101cbb:	c3                   	ret    

00101cbc <intr_enable>:

void intr_enable(uint8_t irq)
{
  101cbc:	53                   	push   %ebx
  101cbd:	83 ec 08             	sub    $0x8,%esp
  101cc0:	e8 47 e6 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101cc5:	81 c3 3b 93 00 00    	add    $0x933b,%ebx
  101ccb:	8b 44 24 10          	mov    0x10(%esp),%eax
    if (irq >= 16)
  101ccf:	3c 0f                	cmp    $0xf,%al
  101cd1:	76 05                	jbe    101cd8 <intr_enable+0x1c>
        return;
    pic_enable(irq);
}
  101cd3:	83 c4 08             	add    $0x8,%esp
  101cd6:	5b                   	pop    %ebx
  101cd7:	c3                   	ret    
    pic_enable(irq);
  101cd8:	83 ec 0c             	sub    $0xc,%esp
  101cdb:	0f b6 c0             	movzbl %al,%eax
  101cde:	50                   	push   %eax
  101cdf:	e8 a0 01 00 00       	call   101e84 <pic_enable>
  101ce4:	83 c4 10             	add    $0x10,%esp
  101ce7:	eb ea                	jmp    101cd3 <intr_enable+0x17>

00101ce9 <intr_eoi>:

void intr_eoi(void)
{
  101ce9:	53                   	push   %ebx
  101cea:	83 ec 08             	sub    $0x8,%esp
  101ced:	e8 1a e6 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101cf2:	81 c3 0e 93 00 00    	add    $0x930e,%ebx
    pic_eoi();
  101cf8:	e8 b6 01 00 00       	call   101eb3 <pic_eoi>
}
  101cfd:	83 c4 08             	add    $0x8,%esp
  101d00:	5b                   	pop    %ebx
  101d01:	c3                   	ret    

00101d02 <intr_local_enable>:

void intr_local_enable(void)
{
  101d02:	53                   	push   %ebx
  101d03:	83 ec 08             	sub    $0x8,%esp
  101d06:	e8 01 e6 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101d0b:	81 c3 f5 92 00 00    	add    $0x92f5,%ebx
    sti();
  101d11:	e8 94 17 00 00       	call   1034aa <sti>
}
  101d16:	83 c4 08             	add    $0x8,%esp
  101d19:	5b                   	pop    %ebx
  101d1a:	c3                   	ret    

00101d1b <intr_local_disable>:

void intr_local_disable(void)
{
  101d1b:	53                   	push   %ebx
  101d1c:	83 ec 08             	sub    $0x8,%esp
  101d1f:	e8 e8 e5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101d24:	81 c3 dc 92 00 00    	add    $0x92dc,%ebx
    cli();
  101d2a:	e8 79 17 00 00       	call   1034a8 <cli>
}
  101d2f:	83 c4 08             	add    $0x8,%esp
  101d32:	5b                   	pop    %ebx
  101d33:	c3                   	ret    

00101d34 <pic_init>:
static uint16_t irqmask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool pic_inited = FALSE;

/* Initialize the 8259A interrupt controllers. */
void pic_init(void)
{
  101d34:	53                   	push   %ebx
  101d35:	83 ec 08             	sub    $0x8,%esp
  101d38:	e8 cf e5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101d3d:	81 c3 c3 92 00 00    	add    $0x92c3,%ebx
    if (pic_inited == TRUE)  // only do once on bootstrap CPU
  101d43:	80 bb a1 98 02 00 01 	cmpb   $0x1,0x298a1(%ebx)
  101d4a:	0f 84 ee 00 00 00    	je     101e3e <pic_init+0x10a>
        return;
    pic_inited = TRUE;
  101d50:	c6 83 a1 98 02 00 01 	movb   $0x1,0x298a1(%ebx)

    /* mask all interrupts */
    outb(IO_PIC1 + 1, 0xff);
  101d57:	83 ec 08             	sub    $0x8,%esp
  101d5a:	68 ff 00 00 00       	push   $0xff
  101d5f:	6a 21                	push   $0x21
  101d61:	e8 0a 18 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, 0xff);
  101d66:	83 c4 08             	add    $0x8,%esp
  101d69:	68 ff 00 00 00       	push   $0xff
  101d6e:	68 a1 00 00 00       	push   $0xa1
  101d73:	e8 f8 17 00 00       	call   103570 <outb>

    // ICW1:  0001g0hi
    //    g:  0 = edge triggering, 1 = level triggering
    //    h:  0 = cascaded PICs, 1 = master only
    //    i:  0 = no ICW4, 1 = ICW4 required
    outb(IO_PIC1, 0x11);
  101d78:	83 c4 08             	add    $0x8,%esp
  101d7b:	6a 11                	push   $0x11
  101d7d:	6a 20                	push   $0x20
  101d7f:	e8 ec 17 00 00       	call   103570 <outb>

    // ICW2:  Vector offset
    outb(IO_PIC1 + 1, T_IRQ0);
  101d84:	83 c4 08             	add    $0x8,%esp
  101d87:	6a 20                	push   $0x20
  101d89:	6a 21                	push   $0x21
  101d8b:	e8 e0 17 00 00       	call   103570 <outb>

    // ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
    //        3-bit No of IR line at which slave connects to master (slave PIC).
    outb(IO_PIC1 + 1, 1 << IRQ_SLAVE);
  101d90:	83 c4 08             	add    $0x8,%esp
  101d93:	6a 04                	push   $0x4
  101d95:	6a 21                	push   $0x21
  101d97:	e8 d4 17 00 00       	call   103570 <outb>
    //    m:  0 = slave PIC, 1 = master PIC
    //        (ignored when b is 0, as the master/slave role
    //        can be hardwired).
    //    a:  1 = Automatic EOI mode
    //    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
    outb(IO_PIC1 + 1, 0x1);
  101d9c:	83 c4 08             	add    $0x8,%esp
  101d9f:	6a 01                	push   $0x1
  101da1:	6a 21                	push   $0x21
  101da3:	e8 c8 17 00 00       	call   103570 <outb>

    // Set up slave (8259A-2)
    outb(IO_PIC2, 0x11);            // ICW1
  101da8:	83 c4 08             	add    $0x8,%esp
  101dab:	6a 11                	push   $0x11
  101dad:	68 a0 00 00 00       	push   $0xa0
  101db2:	e8 b9 17 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, T_IRQ0 + 8);  // ICW2
  101db7:	83 c4 08             	add    $0x8,%esp
  101dba:	6a 28                	push   $0x28
  101dbc:	68 a1 00 00 00       	push   $0xa1
  101dc1:	e8 aa 17 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, IRQ_SLAVE);   // ICW3
  101dc6:	83 c4 08             	add    $0x8,%esp
  101dc9:	6a 02                	push   $0x2
  101dcb:	68 a1 00 00 00       	push   $0xa1
  101dd0:	e8 9b 17 00 00       	call   103570 <outb>
    // NB Automatic EOI mode doesn't tend to work on the slave.
    // Linux source code says it's "to be investigated".
    outb(IO_PIC2 + 1, 0x01);        // ICW4
  101dd5:	83 c4 08             	add    $0x8,%esp
  101dd8:	6a 01                	push   $0x1
  101dda:	68 a1 00 00 00       	push   $0xa1
  101ddf:	e8 8c 17 00 00       	call   103570 <outb>

    // OCW3:  0ef01prs
    //   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
    //    p:  0 = no polling, 1 = polling mode
    //   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
    outb(IO_PIC1, 0x68);  /* clear specific mask */
  101de4:	83 c4 08             	add    $0x8,%esp
  101de7:	6a 68                	push   $0x68
  101de9:	6a 20                	push   $0x20
  101deb:	e8 80 17 00 00       	call   103570 <outb>
    outb(IO_PIC1, 0x0a);  /* read IRR by default */
  101df0:	83 c4 08             	add    $0x8,%esp
  101df3:	6a 0a                	push   $0xa
  101df5:	6a 20                	push   $0x20
  101df7:	e8 74 17 00 00       	call   103570 <outb>

    outb(IO_PIC2, 0x68);  /* OCW3 */
  101dfc:	83 c4 08             	add    $0x8,%esp
  101dff:	6a 68                	push   $0x68
  101e01:	68 a0 00 00 00       	push   $0xa0
  101e06:	e8 65 17 00 00       	call   103570 <outb>
    outb(IO_PIC2, 0x0a);  /* OCW3 */
  101e0b:	83 c4 08             	add    $0x8,%esp
  101e0e:	6a 0a                	push   $0xa
  101e10:	68 a0 00 00 00       	push   $0xa0
  101e15:	e8 56 17 00 00       	call   103570 <outb>

    // mask all interrupts
    outb(IO_PIC1 + 1, 0xFF);
  101e1a:	83 c4 08             	add    $0x8,%esp
  101e1d:	68 ff 00 00 00       	push   $0xff
  101e22:	6a 21                	push   $0x21
  101e24:	e8 47 17 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, 0xFF);
  101e29:	83 c4 08             	add    $0x8,%esp
  101e2c:	68 ff 00 00 00       	push   $0xff
  101e31:	68 a1 00 00 00       	push   $0xa1
  101e36:	e8 35 17 00 00       	call   103570 <outb>
  101e3b:	83 c4 10             	add    $0x10,%esp
}
  101e3e:	83 c4 08             	add    $0x8,%esp
  101e41:	5b                   	pop    %ebx
  101e42:	c3                   	ret    

00101e43 <pic_setmask>:

void pic_setmask(uint16_t mask)
{
  101e43:	56                   	push   %esi
  101e44:	53                   	push   %ebx
  101e45:	83 ec 0c             	sub    $0xc,%esp
  101e48:	e8 bf e4 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101e4d:	81 c3 b3 91 00 00    	add    $0x91b3,%ebx
  101e53:	8b 74 24 18          	mov    0x18(%esp),%esi
    irqmask = mask;
  101e57:	66 89 b3 26 03 00 00 	mov    %si,0x326(%ebx)
    outb(IO_PIC1 + 1, (char) mask);
  101e5e:	89 f0                	mov    %esi,%eax
  101e60:	0f b6 c0             	movzbl %al,%eax
  101e63:	50                   	push   %eax
  101e64:	6a 21                	push   $0x21
  101e66:	e8 05 17 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, (char) (mask >> 8));
  101e6b:	83 c4 08             	add    $0x8,%esp
  101e6e:	89 f0                	mov    %esi,%eax
  101e70:	0f b6 f4             	movzbl %ah,%esi
  101e73:	56                   	push   %esi
  101e74:	68 a1 00 00 00       	push   $0xa1
  101e79:	e8 f2 16 00 00       	call   103570 <outb>
}
  101e7e:	83 c4 14             	add    $0x14,%esp
  101e81:	5b                   	pop    %ebx
  101e82:	5e                   	pop    %esi
  101e83:	c3                   	ret    

00101e84 <pic_enable>:

void pic_enable(int irq)
{
  101e84:	83 ec 18             	sub    $0x18,%esp
  101e87:	e8 40 ef ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  101e8c:	81 c2 74 91 00 00    	add    $0x9174,%edx
    pic_setmask(irqmask & ~(1 << irq));
  101e92:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  101e96:	b8 01 00 00 00       	mov    $0x1,%eax
  101e9b:	d3 e0                	shl    %cl,%eax
  101e9d:	f7 d0                	not    %eax
  101e9f:	66 23 82 26 03 00 00 	and    0x326(%edx),%ax
  101ea6:	0f b7 c0             	movzwl %ax,%eax
  101ea9:	50                   	push   %eax
  101eaa:	e8 94 ff ff ff       	call   101e43 <pic_setmask>
}
  101eaf:	83 c4 1c             	add    $0x1c,%esp
  101eb2:	c3                   	ret    

00101eb3 <pic_eoi>:

void pic_eoi(void)
{
  101eb3:	53                   	push   %ebx
  101eb4:	83 ec 10             	sub    $0x10,%esp
  101eb7:	e8 50 e4 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101ebc:	81 c3 44 91 00 00    	add    $0x9144,%ebx
    // OCW2: rse00xxx
    //   r: rotate
    //   s: specific
    //   e: end-of-interrupt
    // xxx: specific interrupt line
    outb(IO_PIC1, 0x20);
  101ec2:	6a 20                	push   $0x20
  101ec4:	6a 20                	push   $0x20
  101ec6:	e8 a5 16 00 00       	call   103570 <outb>
    outb(IO_PIC2, 0x20);
  101ecb:	83 c4 08             	add    $0x8,%esp
  101ece:	6a 20                	push   $0x20
  101ed0:	68 a0 00 00 00       	push   $0xa0
  101ed5:	e8 96 16 00 00       	call   103570 <outb>
}
  101eda:	83 c4 18             	add    $0x18,%esp
  101edd:	5b                   	pop    %ebx
  101ede:	c3                   	ret    

00101edf <pic_reset>:

void pic_reset(void)
{
  101edf:	53                   	push   %ebx
  101ee0:	83 ec 10             	sub    $0x10,%esp
  101ee3:	e8 24 e4 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101ee8:	81 c3 18 91 00 00    	add    $0x9118,%ebx
    // mask all interrupts
    outb(IO_PIC1 + 1, 0x00);
  101eee:	6a 00                	push   $0x0
  101ef0:	6a 21                	push   $0x21
  101ef2:	e8 79 16 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, 0x00);
  101ef7:	83 c4 08             	add    $0x8,%esp
  101efa:	6a 00                	push   $0x0
  101efc:	68 a1 00 00 00       	push   $0xa1
  101f01:	e8 6a 16 00 00       	call   103570 <outb>

    // ICW1:  0001g0hi
    //    g:  0 = edge triggering, 1 = level triggering
    //    h:  0 = cascaded PICs, 1 = master only
    //    i:  0 = no ICW4, 1 = ICW4 required
    outb(IO_PIC1, 0x11);
  101f06:	83 c4 08             	add    $0x8,%esp
  101f09:	6a 11                	push   $0x11
  101f0b:	6a 20                	push   $0x20
  101f0d:	e8 5e 16 00 00       	call   103570 <outb>

    // ICW2:  Vector offset
    outb(IO_PIC1 + 1, T_IRQ0);
  101f12:	83 c4 08             	add    $0x8,%esp
  101f15:	6a 20                	push   $0x20
  101f17:	6a 21                	push   $0x21
  101f19:	e8 52 16 00 00       	call   103570 <outb>

    // ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
    //        3-bit No of IR line at which slave connects to master(slave PIC).
    outb(IO_PIC1 + 1, 1 << IRQ_SLAVE);
  101f1e:	83 c4 08             	add    $0x8,%esp
  101f21:	6a 04                	push   $0x4
  101f23:	6a 21                	push   $0x21
  101f25:	e8 46 16 00 00       	call   103570 <outb>
    //    m:  0 = slave PIC, 1 = master PIC
    //        (ignored when b is 0, as the master/slave role
    //        can be hardwired).
    //    a:  1 = Automatic EOI mode
    //    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
    outb(IO_PIC1 + 1, 0x3);
  101f2a:	83 c4 08             	add    $0x8,%esp
  101f2d:	6a 03                	push   $0x3
  101f2f:	6a 21                	push   $0x21
  101f31:	e8 3a 16 00 00       	call   103570 <outb>

    // Set up slave (8259A-2)
    outb(IO_PIC2, 0x11);            // ICW1
  101f36:	83 c4 08             	add    $0x8,%esp
  101f39:	6a 11                	push   $0x11
  101f3b:	68 a0 00 00 00       	push   $0xa0
  101f40:	e8 2b 16 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, T_IRQ0 + 8);  // ICW2
  101f45:	83 c4 08             	add    $0x8,%esp
  101f48:	6a 28                	push   $0x28
  101f4a:	68 a1 00 00 00       	push   $0xa1
  101f4f:	e8 1c 16 00 00       	call   103570 <outb>
    outb(IO_PIC2 + 1, IRQ_SLAVE);   // ICW3
  101f54:	83 c4 08             	add    $0x8,%esp
  101f57:	6a 02                	push   $0x2
  101f59:	68 a1 00 00 00       	push   $0xa1
  101f5e:	e8 0d 16 00 00       	call   103570 <outb>
    // NB Automatic EOI mode doesn't tend to work on the slave.
    // Linux source code says it's "to be investigated".
    outb(IO_PIC2 + 1, 0x01);        // ICW4
  101f63:	83 c4 08             	add    $0x8,%esp
  101f66:	6a 01                	push   $0x1
  101f68:	68 a1 00 00 00       	push   $0xa1
  101f6d:	e8 fe 15 00 00       	call   103570 <outb>

    // OCW3:  0ef01prs
    //   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
    //    p:  0 = no polling, 1 = polling mode
    //   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
    outb(IO_PIC1, 0x68);  /* clear specific mask */
  101f72:	83 c4 08             	add    $0x8,%esp
  101f75:	6a 68                	push   $0x68
  101f77:	6a 20                	push   $0x20
  101f79:	e8 f2 15 00 00       	call   103570 <outb>
    outb(IO_PIC1, 0x0a);  /* read IRR by default */
  101f7e:	83 c4 08             	add    $0x8,%esp
  101f81:	6a 0a                	push   $0xa
  101f83:	6a 20                	push   $0x20
  101f85:	e8 e6 15 00 00       	call   103570 <outb>

    outb(IO_PIC2, 0x68);  /* OCW3 */
  101f8a:	83 c4 08             	add    $0x8,%esp
  101f8d:	6a 68                	push   $0x68
  101f8f:	68 a0 00 00 00       	push   $0xa0
  101f94:	e8 d7 15 00 00       	call   103570 <outb>
    outb(IO_PIC2, 0x0a);  /* OCW3 */
  101f99:	83 c4 08             	add    $0x8,%esp
  101f9c:	6a 0a                	push   $0xa
  101f9e:	68 a0 00 00 00       	push   $0xa0
  101fa3:	e8 c8 15 00 00       	call   103570 <outb>
}
  101fa8:	83 c4 18             	add    $0x18,%esp
  101fab:	5b                   	pop    %ebx
  101fac:	c3                   	ret    

00101fad <timer_hw_init>:
#define TIMER_16BIT   0x30  /* r/w counter 16 bits, LSB first */

// Initialize the programmable interval timer.

void timer_hw_init(void)
{
  101fad:	53                   	push   %ebx
  101fae:	83 ec 10             	sub    $0x10,%esp
  101fb1:	e8 56 e3 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  101fb6:	81 c3 4a 90 00 00    	add    $0x904a,%ebx
    outb(PIT_CONTROL, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  101fbc:	6a 34                	push   $0x34
  101fbe:	6a 43                	push   $0x43
  101fc0:	e8 ab 15 00 00       	call   103570 <outb>
    outb(PIT_CHANNEL0, LOW8(LATCH));
  101fc5:	83 c4 08             	add    $0x8,%esp
  101fc8:	68 9c 00 00 00       	push   $0x9c
  101fcd:	6a 40                	push   $0x40
  101fcf:	e8 9c 15 00 00       	call   103570 <outb>
    outb(PIT_CHANNEL0, HIGH8(LATCH));
  101fd4:	83 c4 08             	add    $0x8,%esp
  101fd7:	6a 2e                	push   $0x2e
  101fd9:	6a 40                	push   $0x40
  101fdb:	e8 90 15 00 00       	call   103570 <outb>
}
  101fe0:	83 c4 18             	add    $0x18,%esp
  101fe3:	5b                   	pop    %ebx
  101fe4:	c3                   	ret    

00101fe5 <tsc_calibrate>:

/*
 * XXX: From Linux 3.2.6: arch/x86/kernel/tsc.c: pit_calibrate_tsc()
 */
static uint64_t tsc_calibrate(uint32_t latch, uint32_t ms, int loopmin)
{
  101fe5:	55                   	push   %ebp
  101fe6:	57                   	push   %edi
  101fe7:	56                   	push   %esi
  101fe8:	53                   	push   %ebx
  101fe9:	83 ec 48             	sub    $0x48,%esp
  101fec:	e8 21 e5 ff ff       	call   100512 <__x86.get_pc_thunk.si>
  101ff1:	81 c6 0f 90 00 00    	add    $0x900f,%esi
  101ff7:	89 c7                	mov    %eax,%edi
  101ff9:	89 54 24 38          	mov    %edx,0x38(%esp)
  101ffd:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    uint64_t tsc, t1, t2, delta, tscmin, tscmax;;
    int pitcnt;

    /* Set the Gate high, disable speaker */
    outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  102001:	6a 61                	push   $0x61
  102003:	89 f3                	mov    %esi,%ebx
  102005:	e8 4e 15 00 00       	call   103558 <inb>
  10200a:	83 e0 fc             	and    $0xfffffffc,%eax
  10200d:	83 c8 01             	or     $0x1,%eax
  102010:	83 c4 08             	add    $0x8,%esp
  102013:	0f b6 c0             	movzbl %al,%eax
  102016:	50                   	push   %eax
  102017:	6a 61                	push   $0x61
  102019:	e8 52 15 00 00       	call   103570 <outb>
    /*
     * Setup CTC channel 2 for mode 0, (interrupt on terminal
     * count mode), binary count. Set the latch register to 50ms
     * (LSB then MSB) to begin countdown.
     */
    outb(0x43, 0xb0);
  10201e:	83 c4 08             	add    $0x8,%esp
  102021:	68 b0 00 00 00       	push   $0xb0
  102026:	6a 43                	push   $0x43
  102028:	e8 43 15 00 00       	call   103570 <outb>
    outb(0x42, latch & 0xff);
  10202d:	83 c4 08             	add    $0x8,%esp
  102030:	89 f8                	mov    %edi,%eax
  102032:	0f b6 c0             	movzbl %al,%eax
  102035:	50                   	push   %eax
  102036:	6a 42                	push   $0x42
  102038:	e8 33 15 00 00       	call   103570 <outb>
    outb(0x42, latch >> 8);
  10203d:	83 c4 08             	add    $0x8,%esp
  102040:	89 f8                	mov    %edi,%eax
  102042:	0f b6 fc             	movzbl %ah,%edi
  102045:	57                   	push   %edi
  102046:	6a 42                	push   $0x42
  102048:	e8 23 15 00 00       	call   103570 <outb>

    tsc = t1 = t2 = rdtsc();
  10204d:	e8 73 14 00 00       	call   1034c5 <rdtsc>
  102052:	89 44 24 30          	mov    %eax,0x30(%esp)
  102056:	89 54 24 34          	mov    %edx,0x34(%esp)

    pitcnt = 0;
    tscmax = 0;
    tscmin = ~(uint64_t) 0x0;
    while ((inb(0x61) & 0x20) == 0) {
  10205a:	83 c4 10             	add    $0x10,%esp
    tsc = t1 = t2 = rdtsc();
  10205d:	89 44 24 18          	mov    %eax,0x18(%esp)
  102061:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    pitcnt = 0;
  102065:	bf 00 00 00 00       	mov    $0x0,%edi
    tscmax = 0;
  10206a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  102071:	00 
  102072:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  102079:	00 
    tscmin = ~(uint64_t) 0x0;
  10207a:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
  102081:	ff 
  102082:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  102089:	ff 
    while ((inb(0x61) & 0x20) == 0) {
  10208a:	eb 0b                	jmp    102097 <tsc_calibrate+0xb2>
        tsc = t2;
        if (delta < tscmin)
            tscmin = delta;
        if (delta > tscmax)
            tscmax = delta;
        pitcnt++;
  10208c:	83 c7 01             	add    $0x1,%edi
        tsc = t2;
  10208f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  102093:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    while ((inb(0x61) & 0x20) == 0) {
  102097:	83 ec 0c             	sub    $0xc,%esp
  10209a:	6a 61                	push   $0x61
  10209c:	89 f3                	mov    %esi,%ebx
  10209e:	e8 b5 14 00 00       	call   103558 <inb>
  1020a3:	83 c4 10             	add    $0x10,%esp
  1020a6:	a8 20                	test   $0x20,%al
  1020a8:	75 3d                	jne    1020e7 <tsc_calibrate+0x102>
        t2 = rdtsc();
  1020aa:	89 f3                	mov    %esi,%ebx
  1020ac:	e8 14 14 00 00       	call   1034c5 <rdtsc>
  1020b1:	89 c1                	mov    %eax,%ecx
  1020b3:	89 d3                	mov    %edx,%ebx
        delta = t2 - tsc;
  1020b5:	2b 44 24 18          	sub    0x18(%esp),%eax
  1020b9:	1b 54 24 1c          	sbb    0x1c(%esp),%edx
        if (delta < tscmin)
  1020bd:	3b 44 24 08          	cmp    0x8(%esp),%eax
  1020c1:	89 d5                	mov    %edx,%ebp
  1020c3:	1b 6c 24 0c          	sbb    0xc(%esp),%ebp
  1020c7:	73 08                	jae    1020d1 <tsc_calibrate+0xec>
            tscmin = delta;
  1020c9:	89 44 24 08          	mov    %eax,0x8(%esp)
  1020cd:	89 54 24 0c          	mov    %edx,0xc(%esp)
        if (delta > tscmax)
  1020d1:	39 44 24 10          	cmp    %eax,0x10(%esp)
  1020d5:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  1020d9:	19 d5                	sbb    %edx,%ebp
  1020db:	73 af                	jae    10208c <tsc_calibrate+0xa7>
            tscmax = delta;
  1020dd:	89 44 24 10          	mov    %eax,0x10(%esp)
  1020e1:	89 54 24 14          	mov    %edx,0x14(%esp)
  1020e5:	eb a5                	jmp    10208c <tsc_calibrate+0xa7>
     * times, then we have been hit by a massive SMI
     *
     * If the maximum is 10 times larger than the minimum,
     * then we got hit by an SMI as well.
     */
    KERN_DEBUG("pitcnt=%u, tscmin=%llu, tscmax=%llu\n",
  1020e7:	ff 74 24 14          	push   0x14(%esp)
  1020eb:	ff 74 24 14          	push   0x14(%esp)
  1020ef:	ff 74 24 14          	push   0x14(%esp)
  1020f3:	ff 74 24 14          	push   0x14(%esp)
  1020f7:	57                   	push   %edi
  1020f8:	8d 86 28 b3 ff ff    	lea    -0x4cd8(%esi),%eax
  1020fe:	50                   	push   %eax
  1020ff:	6a 39                	push   $0x39
  102101:	8d 86 71 b3 ff ff    	lea    -0x4c8f(%esi),%eax
  102107:	50                   	push   %eax
  102108:	e8 28 08 00 00       	call   102935 <debug_normal>
               pitcnt, tscmin, tscmax);
    if (pitcnt < loopmin || tscmax > 10 * tscmin)
  10210d:	83 c4 20             	add    $0x20,%esp
  102110:	3b 7c 24 28          	cmp    0x28(%esp),%edi
  102114:	7c 53                	jl     102169 <tsc_calibrate+0x184>
  102116:	8b 7c 24 08          	mov    0x8(%esp),%edi
  10211a:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  10211e:	6b cd 0a             	imul   $0xa,%ebp,%ecx
  102121:	b8 0a 00 00 00       	mov    $0xa,%eax
  102126:	f7 e7                	mul    %edi
  102128:	01 ca                	add    %ecx,%edx
  10212a:	8b 7c 24 10          	mov    0x10(%esp),%edi
  10212e:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  102132:	39 f8                	cmp    %edi,%eax
  102134:	89 d0                	mov    %edx,%eax
  102136:	19 e8                	sbb    %ebp,%eax
  102138:	72 3b                	jb     102175 <tsc_calibrate+0x190>
        return ~(uint64_t) 0x0;

    /* Calculate the PIT value */
    delta = t2 - t1;
  10213a:	8b 44 24 18          	mov    0x18(%esp),%eax
  10213e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  102142:	2b 44 24 20          	sub    0x20(%esp),%eax
  102146:	1b 54 24 24          	sbb    0x24(%esp),%edx
    return delta / ms;
  10214a:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  10214e:	bb 00 00 00 00       	mov    $0x0,%ebx
  102153:	53                   	push   %ebx
  102154:	51                   	push   %ecx
  102155:	52                   	push   %edx
  102156:	50                   	push   %eax
  102157:	89 f3                	mov    %esi,%ebx
  102159:	e8 02 34 00 00       	call   105560 <__udivdi3>
  10215e:	83 c4 10             	add    $0x10,%esp
}
  102161:	83 c4 3c             	add    $0x3c,%esp
  102164:	5b                   	pop    %ebx
  102165:	5e                   	pop    %esi
  102166:	5f                   	pop    %edi
  102167:	5d                   	pop    %ebp
  102168:	c3                   	ret    
        return ~(uint64_t) 0x0;
  102169:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10216e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  102173:	eb ec                	jmp    102161 <tsc_calibrate+0x17c>
  102175:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10217a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  10217f:	eb e0                	jmp    102161 <tsc_calibrate+0x17c>

00102181 <tsc_init>:

int tsc_init(void)
{
  102181:	55                   	push   %ebp
  102182:	57                   	push   %edi
  102183:	56                   	push   %esi
  102184:	53                   	push   %ebx
  102185:	83 ec 1c             	sub    $0x1c,%esp
  102188:	e8 7f e1 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10218d:	81 c3 73 8e 00 00    	add    $0x8e73,%ebx
    uint64_t ret;
    int i;

    timer_hw_init();
  102193:	e8 15 fe ff ff       	call   101fad <timer_hw_init>

    tsc_per_ms = 0;
  102198:	c7 83 a8 98 02 00 00 	movl   $0x0,0x298a8(%ebx)
  10219f:	00 00 00 
  1021a2:	c7 83 ac 98 02 00 00 	movl   $0x0,0x298ac(%ebx)
  1021a9:	00 00 00 

    if (detect_kvm())
  1021ac:	e8 fa 03 00 00       	call   1025ab <detect_kvm>
  1021b1:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1021b5:	85 c0                	test   %eax,%eax
  1021b7:	75 53                	jne    10220c <tsc_init+0x8b>

    /*
     * XXX: If TSC calibration fails frequently, try to increase the
     *      upper bound of loop condition, e.g. alternating 3 to 10.
     */
    for (i = 0; i < 10; i++) {
  1021b9:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1021bd:	83 fd 09             	cmp    $0x9,%ebp
  1021c0:	0f 8f bf 00 00 00    	jg     102285 <tsc_init+0x104>
        ret = tsc_calibrate(CAL_LATCH, CAL_MS, CAL_PIT_LOOPS);
  1021c6:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  1021cb:	ba 0a 00 00 00       	mov    $0xa,%edx
  1021d0:	b8 9b 2e 00 00       	mov    $0x2e9b,%eax
  1021d5:	e8 0b fe ff ff       	call   101fe5 <tsc_calibrate>
  1021da:	89 c6                	mov    %eax,%esi
  1021dc:	89 d7                	mov    %edx,%edi
        if (ret != ~(uint64_t) 0x0)
  1021de:	89 c2                	mov    %eax,%edx
  1021e0:	f7 d2                	not    %edx
  1021e2:	89 f8                	mov    %edi,%eax
  1021e4:	f7 d0                	not    %eax
  1021e6:	09 d0                	or     %edx,%eax
  1021e8:	0f 85 97 00 00 00    	jne    102285 <tsc_init+0x104>
            break;
        KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i + 1);
  1021ee:	83 c5 01             	add    $0x1,%ebp
  1021f1:	55                   	push   %ebp
  1021f2:	8d 83 80 b3 ff ff    	lea    -0x4c80(%ebx),%eax
  1021f8:	50                   	push   %eax
  1021f9:	6a 5c                	push   $0x5c
  1021fb:	8d 83 71 b3 ff ff    	lea    -0x4c8f(%ebx),%eax
  102201:	50                   	push   %eax
  102202:	e8 2e 07 00 00       	call   102935 <debug_normal>
  102207:	83 c4 10             	add    $0x10,%esp
  10220a:	eb b1                	jmp    1021bd <tsc_init+0x3c>
		tsc_per_ms = kvm_get_tsc_hz() / 1000llu;
  10220c:	e8 b4 04 00 00       	call   1026c5 <kvm_get_tsc_hz>
  102211:	6a 00                	push   $0x0
  102213:	68 e8 03 00 00       	push   $0x3e8
  102218:	52                   	push   %edx
  102219:	50                   	push   %eax
  10221a:	e8 41 33 00 00       	call   105560 <__udivdi3>
  10221f:	89 83 a8 98 02 00    	mov    %eax,0x298a8(%ebx)
  102225:	89 93 ac 98 02 00    	mov    %edx,0x298ac(%ebx)
		KERN_INFO ("TSC read from KVM: %u.%03u MHz.\n",
  10222b:	8b 83 a8 98 02 00    	mov    0x298a8(%ebx),%eax
  102231:	8b 93 ac 98 02 00    	mov    0x298ac(%ebx),%edx
  102237:	8b b3 a8 98 02 00    	mov    0x298a8(%ebx),%esi
  10223d:	8b bb ac 98 02 00    	mov    0x298ac(%ebx),%edi
  102243:	6a 00                	push   $0x0
  102245:	68 e8 03 00 00       	push   $0x3e8
  10224a:	52                   	push   %edx
  10224b:	50                   	push   %eax
  10224c:	e8 2f 34 00 00       	call   105680 <__umoddi3>
  102251:	83 c4 14             	add    $0x14,%esp
  102254:	52                   	push   %edx
  102255:	50                   	push   %eax
  102256:	83 ec 0c             	sub    $0xc,%esp
  102259:	6a 00                	push   $0x0
  10225b:	68 e8 03 00 00       	push   $0x3e8
  102260:	57                   	push   %edi
  102261:	56                   	push   %esi
  102262:	e8 f9 32 00 00       	call   105560 <__udivdi3>
  102267:	83 c4 1c             	add    $0x1c,%esp
  10226a:	52                   	push   %edx
  10226b:	50                   	push   %eax
  10226c:	8d 83 50 b3 ff ff    	lea    -0x4cb0(%ebx),%eax
  102272:	50                   	push   %eax
  102273:	e8 98 06 00 00       	call   102910 <debug_info>
		return (0);
  102278:	83 c4 20             	add    $0x20,%esp
  10227b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102282:	00 
  102283:	eb 79                	jmp    1022fe <tsc_init+0x17d>
    }

    if (ret == ~(uint64_t) 0x0) {
  102285:	89 fa                	mov    %edi,%edx
  102287:	f7 d2                	not    %edx
  102289:	89 f0                	mov    %esi,%eax
  10228b:	f7 d0                	not    %eax
  10228d:	09 c2                	or     %eax,%edx
  10228f:	74 79                	je     10230a <tsc_init+0x189>
        tsc_per_ms = 1000000;

        timer_hw_init();
        return 1;
    } else {
        tsc_per_ms = ret;
  102291:	89 b3 a8 98 02 00    	mov    %esi,0x298a8(%ebx)
  102297:	89 bb ac 98 02 00    	mov    %edi,0x298ac(%ebx)
        KERN_DEBUG("TSC freq = %u.%03u MHz.\n",tsc_per_ms / 1000, tsc_per_ms % 1000);
  10229d:	8b 83 a8 98 02 00    	mov    0x298a8(%ebx),%eax
  1022a3:	8b 93 ac 98 02 00    	mov    0x298ac(%ebx),%edx
  1022a9:	8b b3 a8 98 02 00    	mov    0x298a8(%ebx),%esi
  1022af:	8b bb ac 98 02 00    	mov    0x298ac(%ebx),%edi
  1022b5:	83 ec 10             	sub    $0x10,%esp
  1022b8:	6a 00                	push   $0x0
  1022ba:	68 e8 03 00 00       	push   $0x3e8
  1022bf:	52                   	push   %edx
  1022c0:	50                   	push   %eax
  1022c1:	e8 ba 33 00 00       	call   105680 <__umoddi3>
  1022c6:	83 c4 1c             	add    $0x1c,%esp
  1022c9:	52                   	push   %edx
  1022ca:	50                   	push   %eax
  1022cb:	83 ec 04             	sub    $0x4,%esp
  1022ce:	6a 00                	push   $0x0
  1022d0:	68 e8 03 00 00       	push   $0x3e8
  1022d5:	57                   	push   %edi
  1022d6:	56                   	push   %esi
  1022d7:	e8 84 32 00 00       	call   105560 <__udivdi3>
  1022dc:	83 c4 14             	add    $0x14,%esp
  1022df:	52                   	push   %edx
  1022e0:	50                   	push   %eax
  1022e1:	8d 83 d1 b3 ff ff    	lea    -0x4c2f(%ebx),%eax
  1022e7:	50                   	push   %eax
  1022e8:	6a 68                	push   $0x68
  1022ea:	8d 83 71 b3 ff ff    	lea    -0x4c8f(%ebx),%eax
  1022f0:	50                   	push   %eax
  1022f1:	e8 3f 06 00 00       	call   102935 <debug_normal>

        timer_hw_init();
  1022f6:	83 c4 20             	add    $0x20,%esp
  1022f9:	e8 af fc ff ff       	call   101fad <timer_hw_init>
        return 0;
    }
}
  1022fe:	8b 44 24 0c          	mov    0xc(%esp),%eax
  102302:	83 c4 1c             	add    $0x1c,%esp
  102305:	5b                   	pop    %ebx
  102306:	5e                   	pop    %esi
  102307:	5f                   	pop    %edi
  102308:	5d                   	pop    %ebp
  102309:	c3                   	ret    
        KERN_DEBUG("TSC calibration failed.\n");
  10230a:	83 ec 04             	sub    $0x4,%esp
  10230d:	8d 83 9e b3 ff ff    	lea    -0x4c62(%ebx),%eax
  102313:	50                   	push   %eax
  102314:	6a 60                	push   $0x60
  102316:	8d b3 71 b3 ff ff    	lea    -0x4c8f(%ebx),%esi
  10231c:	56                   	push   %esi
  10231d:	e8 13 06 00 00       	call   102935 <debug_normal>
        KERN_DEBUG("Assume TSC freq = 1 GHz.\n");
  102322:	83 c4 0c             	add    $0xc,%esp
  102325:	8d 83 b7 b3 ff ff    	lea    -0x4c49(%ebx),%eax
  10232b:	50                   	push   %eax
  10232c:	6a 61                	push   $0x61
  10232e:	56                   	push   %esi
  10232f:	e8 01 06 00 00       	call   102935 <debug_normal>
        tsc_per_ms = 1000000;
  102334:	c7 83 a8 98 02 00 40 	movl   $0xf4240,0x298a8(%ebx)
  10233b:	42 0f 00 
  10233e:	c7 83 ac 98 02 00 00 	movl   $0x0,0x298ac(%ebx)
  102345:	00 00 00 
        timer_hw_init();
  102348:	e8 60 fc ff ff       	call   101fad <timer_hw_init>
        return 1;
  10234d:	83 c4 10             	add    $0x10,%esp
  102350:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
  102357:	00 
  102358:	eb a4                	jmp    1022fe <tsc_init+0x17d>

0010235a <delay>:

/*
 * Wait for ms millisecond.
 */
void delay(uint32_t ms)
{
  10235a:	55                   	push   %ebp
  10235b:	57                   	push   %edi
  10235c:	56                   	push   %esi
  10235d:	53                   	push   %ebx
  10235e:	83 ec 1c             	sub    $0x1c,%esp
  102361:	e8 e7 00 00 00       	call   10244d <__x86.get_pc_thunk.bp>
  102366:	81 c5 9a 8c 00 00    	add    $0x8c9a,%ebp
  10236c:	8b 44 24 30          	mov    0x30(%esp),%eax
    volatile uint64_t ticks = tsc_per_ms * ms;
  102370:	8b b5 a8 98 02 00    	mov    0x298a8(%ebp),%esi
  102376:	8b bd ac 98 02 00    	mov    0x298ac(%ebp),%edi
  10237c:	89 f9                	mov    %edi,%ecx
  10237e:	0f af c8             	imul   %eax,%ecx
  102381:	f7 e6                	mul    %esi
  102383:	01 ca                	add    %ecx,%edx
  102385:	89 44 24 08          	mov    %eax,0x8(%esp)
  102389:	89 54 24 0c          	mov    %edx,0xc(%esp)
    volatile uint64_t start = rdtsc();
  10238d:	89 eb                	mov    %ebp,%ebx
  10238f:	e8 31 11 00 00       	call   1034c5 <rdtsc>
  102394:	89 04 24             	mov    %eax,(%esp)
  102397:	89 54 24 04          	mov    %edx,0x4(%esp)
    while (rdtsc() < start + ticks);
  10239b:	89 eb                	mov    %ebp,%ebx
  10239d:	e8 23 11 00 00       	call   1034c5 <rdtsc>
  1023a2:	89 c3                	mov    %eax,%ebx
  1023a4:	89 d1                	mov    %edx,%ecx
  1023a6:	8b 04 24             	mov    (%esp),%eax
  1023a9:	8b 54 24 04          	mov    0x4(%esp),%edx
  1023ad:	8b 74 24 08          	mov    0x8(%esp),%esi
  1023b1:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  1023b5:	01 f0                	add    %esi,%eax
  1023b7:	11 fa                	adc    %edi,%edx
  1023b9:	39 c3                	cmp    %eax,%ebx
  1023bb:	19 d1                	sbb    %edx,%ecx
  1023bd:	72 dc                	jb     10239b <delay+0x41>
}
  1023bf:	83 c4 1c             	add    $0x1c,%esp
  1023c2:	5b                   	pop    %ebx
  1023c3:	5e                   	pop    %esi
  1023c4:	5f                   	pop    %edi
  1023c5:	5d                   	pop    %ebp
  1023c6:	c3                   	ret    

001023c7 <udelay>:

/*
 * Wait for us microsecond.
 */
void udelay(uint32_t us)
{
  1023c7:	55                   	push   %ebp
  1023c8:	57                   	push   %edi
  1023c9:	56                   	push   %esi
  1023ca:	53                   	push   %ebx
  1023cb:	83 ec 1c             	sub    $0x1c,%esp
  1023ce:	e8 7a 00 00 00       	call   10244d <__x86.get_pc_thunk.bp>
  1023d3:	81 c5 2d 8c 00 00    	add    $0x8c2d,%ebp
  1023d9:	8b 74 24 30          	mov    0x30(%esp),%esi
    volatile uint64_t ticks = tsc_per_ms / 1000 * us;
  1023dd:	8b 85 a8 98 02 00    	mov    0x298a8(%ebp),%eax
  1023e3:	8b 95 ac 98 02 00    	mov    0x298ac(%ebp),%edx
  1023e9:	6a 00                	push   $0x0
  1023eb:	68 e8 03 00 00       	push   $0x3e8
  1023f0:	52                   	push   %edx
  1023f1:	50                   	push   %eax
  1023f2:	89 eb                	mov    %ebp,%ebx
  1023f4:	e8 67 31 00 00       	call   105560 <__udivdi3>
  1023f9:	83 c4 10             	add    $0x10,%esp
  1023fc:	89 d3                	mov    %edx,%ebx
  1023fe:	89 c2                	mov    %eax,%edx
  102400:	89 d9                	mov    %ebx,%ecx
  102402:	0f af ce             	imul   %esi,%ecx
  102405:	89 f0                	mov    %esi,%eax
  102407:	f7 e2                	mul    %edx
  102409:	01 ca                	add    %ecx,%edx
  10240b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10240f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    volatile uint64_t start = rdtsc();
  102413:	89 eb                	mov    %ebp,%ebx
  102415:	e8 ab 10 00 00       	call   1034c5 <rdtsc>
  10241a:	89 04 24             	mov    %eax,(%esp)
  10241d:	89 54 24 04          	mov    %edx,0x4(%esp)
    while (rdtsc() < start + ticks);
  102421:	89 eb                	mov    %ebp,%ebx
  102423:	e8 9d 10 00 00       	call   1034c5 <rdtsc>
  102428:	89 c3                	mov    %eax,%ebx
  10242a:	89 d1                	mov    %edx,%ecx
  10242c:	8b 04 24             	mov    (%esp),%eax
  10242f:	8b 54 24 04          	mov    0x4(%esp),%edx
  102433:	8b 74 24 08          	mov    0x8(%esp),%esi
  102437:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  10243b:	01 f0                	add    %esi,%eax
  10243d:	11 fa                	adc    %edi,%edx
  10243f:	39 c3                	cmp    %eax,%ebx
  102441:	19 d1                	sbb    %edx,%ecx
  102443:	72 dc                	jb     102421 <udelay+0x5a>
}
  102445:	83 c4 1c             	add    $0x1c,%esp
  102448:	5b                   	pop    %ebx
  102449:	5e                   	pop    %esi
  10244a:	5f                   	pop    %edi
  10244b:	5d                   	pop    %ebp
  10244c:	c3                   	ret    

0010244d <__x86.get_pc_thunk.bp>:
  10244d:	8b 2c 24             	mov    (%esp),%ebp
  102450:	c3                   	ret    
  102451:	66 90                	xchg   %ax,%ax
  102453:	66 90                	xchg   %ax,%ax
  102455:	66 90                	xchg   %ax,%ax
  102457:	66 90                	xchg   %ax,%ax
  102459:	66 90                	xchg   %ax,%ax
  10245b:	66 90                	xchg   %ax,%ax
  10245d:	66 90                	xchg   %ax,%ax
  10245f:	90                   	nop

00102460 <Xdivide>:
	jmp	_alltraps

.text

/* exceptions  */
TRAPHANDLER_NOEC(Xdivide,	T_DIVIDE)
  102460:	6a 00                	push   $0x0
  102462:	6a 00                	push   $0x0
  102464:	e9 17 01 00 00       	jmp    102580 <_alltraps>
  102469:	90                   	nop

0010246a <Xdebug>:
TRAPHANDLER_NOEC(Xdebug,	T_DEBUG)
  10246a:	6a 00                	push   $0x0
  10246c:	6a 01                	push   $0x1
  10246e:	e9 0d 01 00 00       	jmp    102580 <_alltraps>
  102473:	90                   	nop

00102474 <Xnmi>:
TRAPHANDLER_NOEC(Xnmi,		T_NMI)
  102474:	6a 00                	push   $0x0
  102476:	6a 02                	push   $0x2
  102478:	e9 03 01 00 00       	jmp    102580 <_alltraps>
  10247d:	90                   	nop

0010247e <Xbrkpt>:
TRAPHANDLER_NOEC(Xbrkpt,	T_BRKPT)
  10247e:	6a 00                	push   $0x0
  102480:	6a 03                	push   $0x3
  102482:	e9 f9 00 00 00       	jmp    102580 <_alltraps>
  102487:	90                   	nop

00102488 <Xoflow>:
TRAPHANDLER_NOEC(Xoflow,	T_OFLOW)
  102488:	6a 00                	push   $0x0
  10248a:	6a 04                	push   $0x4
  10248c:	e9 ef 00 00 00       	jmp    102580 <_alltraps>
  102491:	90                   	nop

00102492 <Xbound>:
TRAPHANDLER_NOEC(Xbound,	T_BOUND)
  102492:	6a 00                	push   $0x0
  102494:	6a 05                	push   $0x5
  102496:	e9 e5 00 00 00       	jmp    102580 <_alltraps>
  10249b:	90                   	nop

0010249c <Xillop>:
TRAPHANDLER_NOEC(Xillop,	T_ILLOP)
  10249c:	6a 00                	push   $0x0
  10249e:	6a 06                	push   $0x6
  1024a0:	e9 db 00 00 00       	jmp    102580 <_alltraps>
  1024a5:	90                   	nop

001024a6 <Xdevice>:
TRAPHANDLER_NOEC(Xdevice,	T_DEVICE)
  1024a6:	6a 00                	push   $0x0
  1024a8:	6a 07                	push   $0x7
  1024aa:	e9 d1 00 00 00       	jmp    102580 <_alltraps>
  1024af:	90                   	nop

001024b0 <Xdblflt>:
TRAPHANDLER     (Xdblflt,	T_DBLFLT)
  1024b0:	6a 08                	push   $0x8
  1024b2:	e9 c9 00 00 00       	jmp    102580 <_alltraps>
  1024b7:	90                   	nop

001024b8 <Xcoproc>:
TRAPHANDLER_NOEC(Xcoproc,	T_COPROC)
  1024b8:	6a 00                	push   $0x0
  1024ba:	6a 09                	push   $0x9
  1024bc:	e9 bf 00 00 00       	jmp    102580 <_alltraps>
  1024c1:	90                   	nop

001024c2 <Xtss>:
TRAPHANDLER     (Xtss,		T_TSS)
  1024c2:	6a 0a                	push   $0xa
  1024c4:	e9 b7 00 00 00       	jmp    102580 <_alltraps>
  1024c9:	90                   	nop

001024ca <Xsegnp>:
TRAPHANDLER     (Xsegnp,	T_SEGNP)
  1024ca:	6a 0b                	push   $0xb
  1024cc:	e9 af 00 00 00       	jmp    102580 <_alltraps>
  1024d1:	90                   	nop

001024d2 <Xstack>:
TRAPHANDLER     (Xstack,	T_STACK)
  1024d2:	6a 0c                	push   $0xc
  1024d4:	e9 a7 00 00 00       	jmp    102580 <_alltraps>
  1024d9:	90                   	nop

001024da <Xgpflt>:
TRAPHANDLER     (Xgpflt,	T_GPFLT)
  1024da:	6a 0d                	push   $0xd
  1024dc:	e9 9f 00 00 00       	jmp    102580 <_alltraps>
  1024e1:	90                   	nop

001024e2 <Xpgflt>:
TRAPHANDLER     (Xpgflt,	T_PGFLT)
  1024e2:	6a 0e                	push   $0xe
  1024e4:	e9 97 00 00 00       	jmp    102580 <_alltraps>
  1024e9:	90                   	nop

001024ea <Xres>:
TRAPHANDLER_NOEC(Xres,		T_RES)
  1024ea:	6a 00                	push   $0x0
  1024ec:	6a 0f                	push   $0xf
  1024ee:	e9 8d 00 00 00       	jmp    102580 <_alltraps>
  1024f3:	90                   	nop

001024f4 <Xfperr>:
TRAPHANDLER_NOEC(Xfperr,	T_FPERR)
  1024f4:	6a 00                	push   $0x0
  1024f6:	6a 10                	push   $0x10
  1024f8:	e9 83 00 00 00       	jmp    102580 <_alltraps>
  1024fd:	90                   	nop

001024fe <Xalign>:
TRAPHANDLER     (Xalign,	T_ALIGN)
  1024fe:	6a 11                	push   $0x11
  102500:	eb 7e                	jmp    102580 <_alltraps>

00102502 <Xmchk>:
TRAPHANDLER_NOEC(Xmchk,		T_MCHK)
  102502:	6a 00                	push   $0x0
  102504:	6a 12                	push   $0x12
  102506:	eb 78                	jmp    102580 <_alltraps>

00102508 <Xirq_timer>:

/* ISA interrupts  */
TRAPHANDLER_NOEC(Xirq_timer,	T_IRQ0 + IRQ_TIMER)
  102508:	6a 00                	push   $0x0
  10250a:	6a 20                	push   $0x20
  10250c:	eb 72                	jmp    102580 <_alltraps>

0010250e <Xirq_kbd>:
TRAPHANDLER_NOEC(Xirq_kbd,	T_IRQ0 + IRQ_KBD)
  10250e:	6a 00                	push   $0x0
  102510:	6a 21                	push   $0x21
  102512:	eb 6c                	jmp    102580 <_alltraps>

00102514 <Xirq_slave>:
TRAPHANDLER_NOEC(Xirq_slave,	T_IRQ0 + IRQ_SLAVE)
  102514:	6a 00                	push   $0x0
  102516:	6a 22                	push   $0x22
  102518:	eb 66                	jmp    102580 <_alltraps>

0010251a <Xirq_serial2>:
TRAPHANDLER_NOEC(Xirq_serial2,	T_IRQ0 + IRQ_SERIAL24)
  10251a:	6a 00                	push   $0x0
  10251c:	6a 23                	push   $0x23
  10251e:	eb 60                	jmp    102580 <_alltraps>

00102520 <Xirq_serial1>:
TRAPHANDLER_NOEC(Xirq_serial1,	T_IRQ0 + IRQ_SERIAL13)
  102520:	6a 00                	push   $0x0
  102522:	6a 24                	push   $0x24
  102524:	eb 5a                	jmp    102580 <_alltraps>

00102526 <Xirq_lpt>:
TRAPHANDLER_NOEC(Xirq_lpt,	T_IRQ0 + IRQ_LPT2)
  102526:	6a 00                	push   $0x0
  102528:	6a 25                	push   $0x25
  10252a:	eb 54                	jmp    102580 <_alltraps>

0010252c <Xirq_floppy>:
TRAPHANDLER_NOEC(Xirq_floppy,	T_IRQ0 + IRQ_FLOPPY)
  10252c:	6a 00                	push   $0x0
  10252e:	6a 26                	push   $0x26
  102530:	eb 4e                	jmp    102580 <_alltraps>

00102532 <Xirq_spurious>:
TRAPHANDLER_NOEC(Xirq_spurious,	T_IRQ0 + IRQ_SPURIOUS)
  102532:	6a 00                	push   $0x0
  102534:	6a 27                	push   $0x27
  102536:	eb 48                	jmp    102580 <_alltraps>

00102538 <Xirq_rtc>:
TRAPHANDLER_NOEC(Xirq_rtc,	T_IRQ0 + IRQ_RTC)
  102538:	6a 00                	push   $0x0
  10253a:	6a 28                	push   $0x28
  10253c:	eb 42                	jmp    102580 <_alltraps>

0010253e <Xirq9>:
TRAPHANDLER_NOEC(Xirq9,		T_IRQ0 + 9)
  10253e:	6a 00                	push   $0x0
  102540:	6a 29                	push   $0x29
  102542:	eb 3c                	jmp    102580 <_alltraps>

00102544 <Xirq10>:
TRAPHANDLER_NOEC(Xirq10,	T_IRQ0 + 10)
  102544:	6a 00                	push   $0x0
  102546:	6a 2a                	push   $0x2a
  102548:	eb 36                	jmp    102580 <_alltraps>

0010254a <Xirq11>:
TRAPHANDLER_NOEC(Xirq11,	T_IRQ0 + 11)
  10254a:	6a 00                	push   $0x0
  10254c:	6a 2b                	push   $0x2b
  10254e:	eb 30                	jmp    102580 <_alltraps>

00102550 <Xirq_mouse>:
TRAPHANDLER_NOEC(Xirq_mouse,	T_IRQ0 + IRQ_MOUSE)
  102550:	6a 00                	push   $0x0
  102552:	6a 2c                	push   $0x2c
  102554:	eb 2a                	jmp    102580 <_alltraps>

00102556 <Xirq_coproc>:
TRAPHANDLER_NOEC(Xirq_coproc,	T_IRQ0 + IRQ_COPROCESSOR)
  102556:	6a 00                	push   $0x0
  102558:	6a 2d                	push   $0x2d
  10255a:	eb 24                	jmp    102580 <_alltraps>

0010255c <Xirq_ide1>:
TRAPHANDLER_NOEC(Xirq_ide1,	T_IRQ0 + IRQ_IDE1)
  10255c:	6a 00                	push   $0x0
  10255e:	6a 2e                	push   $0x2e
  102560:	eb 1e                	jmp    102580 <_alltraps>

00102562 <Xirq_ide2>:
TRAPHANDLER_NOEC(Xirq_ide2,	T_IRQ0 + IRQ_IDE2)
  102562:	6a 00                	push   $0x0
  102564:	6a 2f                	push   $0x2f
  102566:	eb 18                	jmp    102580 <_alltraps>

00102568 <Xsyscall>:

/* syscall */
TRAPHANDLER_NOEC(Xsyscall,	T_SYSCALL)
  102568:	6a 00                	push   $0x0
  10256a:	6a 30                	push   $0x30
  10256c:	eb 12                	jmp    102580 <_alltraps>

0010256e <Xdefault>:

/* default ? */
TRAPHANDLER     (Xdefault,	T_DEFAULT)
  10256e:	68 fe 00 00 00       	push   $0xfe
  102573:	eb 0b                	jmp    102580 <_alltraps>
  102575:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10257c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00102580 <_alltraps>:

	.globl _alltraps
	.type _alltraps, @function
	.p2align 4, 0x90	/* 16-byte alignment, nop filled */
_alltraps:
	cli			# make sure there is no nested trap
  102580:	fa                   	cli    
	cld
  102581:	fc                   	cld    

	pushl	%ds		# build context
  102582:	1e                   	push   %ds
	pushl	%es
  102583:	06                   	push   %es
	pushal
  102584:	60                   	pusha  

	movl	$CPU_GDT_KDATA, %eax	# load kernel's data segment
  102585:	b8 10 00 00 00       	mov    $0x10,%eax
	movw	%ax, %ds
  10258a:	8e d8                	mov    %eax,%ds
	movw	%ax, %es
  10258c:	8e c0                	mov    %eax,%es

	pushl	%esp		# pass pointer to this trapframe
  10258e:	54                   	push   %esp

	call	trap		# and call trap (does not return)
  10258f:	e8 6c 2f 00 00       	call   105500 <trap>

1:	hlt			# should never get here; just spin...
  102594:	f4                   	hlt    
  102595:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10259c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001025a0 <trap_return>:
//
	.globl trap_return
	.type trap_return, @function
	.p2align 4, 0x90	/* 16-byte alignment, nop filled */
trap_return:
	movl	4(%esp), %esp	// reset stack pointer to point to trap frame
  1025a0:	8b 64 24 04          	mov    0x4(%esp),%esp
	popal			// restore general-purpose registers except esp
  1025a4:	61                   	popa   
	popl	%es		// restore data segment registers
  1025a5:	07                   	pop    %es
	popl	%ds
  1025a6:	1f                   	pop    %ds
	addl	$8, %esp	// skip tf_trapno and tf_errcode
  1025a7:	83 c4 08             	add    $0x8,%esp
	iret			// return from trap handler
  1025aa:	cf                   	iret   

001025ab <detect_kvm>:
}

#define CPUID_FEATURE_HYPERVISOR	(1<<31) /* Running on a hypervisor */

int detect_kvm(void)
{
  1025ab:	57                   	push   %edi
  1025ac:	56                   	push   %esi
  1025ad:	53                   	push   %ebx
  1025ae:	83 ec 10             	sub    $0x10,%esp
  1025b1:	e8 5c df ff ff       	call   100512 <__x86.get_pc_thunk.si>
  1025b6:	81 c6 4a 8a 00 00    	add    $0x8a4a,%esi
	__asm __volatile("cpuid"
  1025bc:	b8 01 00 00 00       	mov    $0x1,%eax
  1025c1:	b9 00 00 00 00       	mov    $0x0,%ecx
  1025c6:	0f a2                	cpuid  
	uint32_t eax;

	if (cpu_has (CPUID_FEATURE_HYPERVISOR))
  1025c8:	89 d0                	mov    %edx,%eax
  1025ca:	83 e0 01             	and    $0x1,%eax
  1025cd:	75 07                	jne    1025d6 <detect_kvm+0x2b>
		{
			return 1;
		}
	}
	return 0;
}
  1025cf:	83 c4 10             	add    $0x10,%esp
  1025d2:	5b                   	pop    %ebx
  1025d3:	5e                   	pop    %esi
  1025d4:	5f                   	pop    %edi
  1025d5:	c3                   	ret    
		cpuid (CPUID_KVM_SIGNATURE, &eax, &hyper_vendor_id[0],
  1025d6:	83 ec 0c             	sub    $0xc,%esp
  1025d9:	8d 7c 24 0c          	lea    0xc(%esp),%edi
  1025dd:	8d 44 24 14          	lea    0x14(%esp),%eax
  1025e1:	50                   	push   %eax
  1025e2:	8d 44 24 14          	lea    0x14(%esp),%eax
  1025e6:	50                   	push   %eax
  1025e7:	57                   	push   %edi
  1025e8:	8d 44 24 24          	lea    0x24(%esp),%eax
  1025ec:	50                   	push   %eax
  1025ed:	68 00 00 00 40       	push   $0x40000000
  1025f2:	89 f3                	mov    %esi,%ebx
  1025f4:	e8 e2 0e 00 00       	call   1034db <cpuid>
		if (!strncmp ("KVMKVMKVM", (const char *) hyper_vendor_id, 9))
  1025f9:	83 c4 1c             	add    $0x1c,%esp
  1025fc:	6a 09                	push   $0x9
  1025fe:	57                   	push   %edi
  1025ff:	8d 86 ea b3 ff ff    	lea    -0x4c16(%esi),%eax
  102605:	50                   	push   %eax
  102606:	e8 19 02 00 00       	call   102824 <strncmp>
  10260b:	89 fc                	mov    %edi,%esp
  10260d:	85 c0                	test   %eax,%eax
  10260f:	74 07                	je     102618 <detect_kvm+0x6d>
	return 0;
  102611:	b8 00 00 00 00       	mov    $0x0,%eax
  102616:	eb b7                	jmp    1025cf <detect_kvm+0x24>
			return 1;
  102618:	b8 01 00 00 00       	mov    $0x1,%eax
  10261d:	eb b0                	jmp    1025cf <detect_kvm+0x24>

0010261f <kvm_has_feature>:

int
kvm_has_feature(uint32_t feature)
{
  10261f:	53                   	push   %ebx
  102620:	83 ec 24             	sub    $0x24,%esp
  102623:	e8 e4 dc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  102628:	81 c3 d8 89 00 00    	add    $0x89d8,%ebx
	uint32_t eax, ebx, ecx, edx;
	eax = 0; edx = 0;
  10262e:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  102635:	00 
  102636:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  10263d:	00 
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  10263e:	8d 44 24 0c          	lea    0xc(%esp),%eax
  102642:	50                   	push   %eax
  102643:	8d 44 24 14          	lea    0x14(%esp),%eax
  102647:	50                   	push   %eax
  102648:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  10264c:	50                   	push   %eax
  10264d:	8d 44 24 24          	lea    0x24(%esp),%eax
  102651:	50                   	push   %eax
  102652:	68 01 00 00 40       	push   $0x40000001
  102657:	e8 7f 0e 00 00       	call   1034db <cpuid>

	return ((eax & feature) != 0 ? 1 : 0);
  10265c:	8b 44 24 40          	mov    0x40(%esp),%eax
  102660:	23 44 24 2c          	and    0x2c(%esp),%eax
  102664:	85 c0                	test   %eax,%eax
  102666:	0f 95 c0             	setne  %al
  102669:	0f b6 c0             	movzbl %al,%eax
}
  10266c:	83 c4 38             	add    $0x38,%esp
  10266f:	5b                   	pop    %ebx
  102670:	c3                   	ret    

00102671 <kvm_enable_feature>:

int
kvm_enable_feature(uint32_t feature)
{
  102671:	53                   	push   %ebx
  102672:	83 ec 24             	sub    $0x24,%esp
  102675:	e8 92 dc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10267a:	81 c3 86 89 00 00    	add    $0x8986,%ebx
	uint32_t eax, ebx, ecx, edx;
	eax = 1 << feature; edx = 0;
  102680:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  102684:	b8 01 00 00 00       	mov    $0x1,%eax
  102689:	d3 e0                	shl    %cl,%eax
  10268b:	89 44 24 18          	mov    %eax,0x18(%esp)
  10268f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102696:	00 
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  102697:	8d 44 24 0c          	lea    0xc(%esp),%eax
  10269b:	50                   	push   %eax
  10269c:	8d 44 24 14          	lea    0x14(%esp),%eax
  1026a0:	50                   	push   %eax
  1026a1:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  1026a5:	50                   	push   %eax
  1026a6:	8d 44 24 24          	lea    0x24(%esp),%eax
  1026aa:	50                   	push   %eax
  1026ab:	68 01 00 00 40       	push   $0x40000001
  1026b0:	e8 26 0e 00 00       	call   1034db <cpuid>

	return (ebx == 0 ? 1 : 0);
  1026b5:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
  1026ba:	0f 94 c0             	sete   %al
  1026bd:	0f b6 c0             	movzbl %al,%eax
}
  1026c0:	83 c4 38             	add    $0x38,%esp
  1026c3:	5b                   	pop    %ebx
  1026c4:	c3                   	ret    

001026c5 <kvm_get_tsc_hz>:

uint64_t
kvm_get_tsc_hz(void)
{
  1026c5:	55                   	push   %ebp
  1026c6:	57                   	push   %edi
  1026c7:	56                   	push   %esi
  1026c8:	53                   	push   %ebx
  1026c9:	83 ec 28             	sub    $0x28,%esp
  1026cc:	e8 3b dc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1026d1:	81 c3 2f 89 00 00    	add    $0x892f,%ebx
	uint64_t tsc_hz = 0llu;
	uint32_t msr_sys_time;

	if (kvm_has_feature(KVM_FEATURE_CLOCKSOURCE2))
  1026d7:	6a 03                	push   $0x3
  1026d9:	e8 41 ff ff ff       	call   10261f <kvm_has_feature>
  1026de:	83 c4 10             	add    $0x10,%esp
  1026e1:	85 c0                	test   %eax,%eax
  1026e3:	75 18                	jne    1026fd <kvm_get_tsc_hz+0x38>
	{
		msr_sys_time = MSR_KVM_SYSTEM_TIME_NEW;
	}
	else if (kvm_has_feature(KVM_FEATURE_CLOCKSOURCE))
  1026e5:	83 ec 0c             	sub    $0xc,%esp
  1026e8:	6a 00                	push   $0x0
  1026ea:	e8 30 ff ff ff       	call   10261f <kvm_has_feature>
  1026ef:	83 c4 10             	add    $0x10,%esp
  1026f2:	85 c0                	test   %eax,%eax
  1026f4:	74 57                	je     10274d <kvm_get_tsc_hz+0x88>
	{
		msr_sys_time = MSR_KVM_SYSTEM_TIME;
  1026f6:	bd 12 00 00 00       	mov    $0x12,%ebp
  1026fb:	eb 05                	jmp    102702 <kvm_get_tsc_hz+0x3d>
		msr_sys_time = MSR_KVM_SYSTEM_TIME_NEW;
  1026fd:	bd 01 4d 56 4b       	mov    $0x4b564d01,%ebp
	{
		return (0llu);
	}

	/* bit0 == 1 means enable, kvm will update this memory periodically */
	wrmsr(msr_sys_time, (uint64_t) ((uint32_t) &pvclock) | 0x1llu);
  102702:	8d 83 c0 98 02 00    	lea    0x298c0(%ebx),%eax
  102708:	83 ec 04             	sub    $0x4,%esp
  10270b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10270f:	83 c8 01             	or     $0x1,%eax
  102712:	ba 00 00 00 00       	mov    $0x0,%edx
  102717:	52                   	push   %edx
  102718:	50                   	push   %eax
  102719:	55                   	push   %ebp
  10271a:	e8 95 0d 00 00       	call   1034b4 <wrmsr>

	tsc_hz = (uint64_t) pvclock.tsc_to_system_mul;
  10271f:	8b b3 d8 98 02 00    	mov    0x298d8(%ebx),%esi
  102725:	bf 00 00 00 00       	mov    $0x0,%edi

	/* disable update */
	wrmsr(msr_sys_time, (uint64_t) ((uint32_t) &pvclock));
  10272a:	83 c4 0c             	add    $0xc,%esp
  10272d:	8b 44 24 10          	mov    0x10(%esp),%eax
  102731:	ba 00 00 00 00       	mov    $0x0,%edx
  102736:	52                   	push   %edx
  102737:	50                   	push   %eax
  102738:	55                   	push   %ebp
  102739:	e8 76 0d 00 00       	call   1034b4 <wrmsr>

	return tsc_hz;
  10273e:	83 c4 10             	add    $0x10,%esp
}
  102741:	89 f0                	mov    %esi,%eax
  102743:	89 fa                	mov    %edi,%edx
  102745:	83 c4 1c             	add    $0x1c,%esp
  102748:	5b                   	pop    %ebx
  102749:	5e                   	pop    %esi
  10274a:	5f                   	pop    %edi
  10274b:	5d                   	pop    %ebp
  10274c:	c3                   	ret    
		return (0llu);
  10274d:	be 00 00 00 00       	mov    $0x0,%esi
  102752:	bf 00 00 00 00       	mov    $0x0,%edi
  102757:	eb e8                	jmp    102741 <kvm_get_tsc_hz+0x7c>

00102759 <memset>:
#include "string.h"
#include "types.h"

void *memset(void *v, int c, size_t n)
{
  102759:	57                   	push   %edi
  10275a:	53                   	push   %ebx
  10275b:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  10275f:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    if (n == 0)
  102763:	85 c9                	test   %ecx,%ecx
  102765:	74 38                	je     10279f <memset+0x46>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
  102767:	f7 c7 03 00 00 00    	test   $0x3,%edi
  10276d:	75 29                	jne    102798 <memset+0x3f>
  10276f:	f6 c1 03             	test   $0x3,%cl
  102772:	75 24                	jne    102798 <memset+0x3f>
        c &= 0xFF;
  102774:	0f b6 54 24 10       	movzbl 0x10(%esp),%edx
        c = (c << 24) | (c << 16) | (c << 8) | c;
  102779:	8b 44 24 10          	mov    0x10(%esp),%eax
  10277d:	c1 e0 18             	shl    $0x18,%eax
  102780:	89 d3                	mov    %edx,%ebx
  102782:	c1 e3 10             	shl    $0x10,%ebx
  102785:	09 d8                	or     %ebx,%eax
  102787:	89 d3                	mov    %edx,%ebx
  102789:	c1 e3 08             	shl    $0x8,%ebx
  10278c:	09 d8                	or     %ebx,%eax
  10278e:	09 d0                	or     %edx,%eax
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
  102790:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
  102793:	fc                   	cld    
  102794:	f3 ab                	rep stos %eax,%es:(%edi)
  102796:	eb 07                	jmp    10279f <memset+0x46>
                      : "cc", "memory");
    } else
        asm volatile ("cld; rep stosb\n"
  102798:	8b 44 24 10          	mov    0x10(%esp),%eax
  10279c:	fc                   	cld    
  10279d:	f3 aa                	rep stos %al,%es:(%edi)
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
  10279f:	89 f8                	mov    %edi,%eax
  1027a1:	5b                   	pop    %ebx
  1027a2:	5f                   	pop    %edi
  1027a3:	c3                   	ret    

001027a4 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
  1027a4:	57                   	push   %edi
  1027a5:	56                   	push   %esi
  1027a6:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1027aa:	8b 74 24 10          	mov    0x10(%esp),%esi
  1027ae:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
  1027b2:	39 c6                	cmp    %eax,%esi
  1027b4:	73 36                	jae    1027ec <memmove+0x48>
  1027b6:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  1027b9:	39 c2                	cmp    %eax,%edx
  1027bb:	76 2f                	jbe    1027ec <memmove+0x48>
        s += n;
        d += n;
  1027bd:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
  1027c0:	f6 c2 03             	test   $0x3,%dl
  1027c3:	75 1b                	jne    1027e0 <memmove+0x3c>
  1027c5:	f7 c7 03 00 00 00    	test   $0x3,%edi
  1027cb:	75 13                	jne    1027e0 <memmove+0x3c>
  1027cd:	f6 c1 03             	test   $0x3,%cl
  1027d0:	75 0e                	jne    1027e0 <memmove+0x3c>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
  1027d2:	83 ef 04             	sub    $0x4,%edi
  1027d5:	8d 72 fc             	lea    -0x4(%edx),%esi
  1027d8:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
  1027db:	fd                   	std    
  1027dc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1027de:	eb 09                	jmp    1027e9 <memmove+0x45>
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
  1027e0:	83 ef 01             	sub    $0x1,%edi
  1027e3:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
  1027e6:	fd                   	std    
  1027e7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
  1027e9:	fc                   	cld    
  1027ea:	eb 20                	jmp    10280c <memmove+0x68>
    } else {
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
  1027ec:	f7 c6 03 00 00 00    	test   $0x3,%esi
  1027f2:	75 13                	jne    102807 <memmove+0x63>
  1027f4:	a8 03                	test   $0x3,%al
  1027f6:	75 0f                	jne    102807 <memmove+0x63>
  1027f8:	f6 c1 03             	test   $0x3,%cl
  1027fb:	75 0a                	jne    102807 <memmove+0x63>
            asm volatile ("cld; rep movsl\n"
                          :: "D" (d), "S" (s), "c" (n / 4)
  1027fd:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
  102800:	89 c7                	mov    %eax,%edi
  102802:	fc                   	cld    
  102803:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102805:	eb 05                	jmp    10280c <memmove+0x68>
                          : "cc", "memory");
        else
            asm volatile ("cld; rep movsb\n"
  102807:	89 c7                	mov    %eax,%edi
  102809:	fc                   	cld    
  10280a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
  10280c:	5e                   	pop    %esi
  10280d:	5f                   	pop    %edi
  10280e:	c3                   	ret    

0010280f <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
  10280f:	ff 74 24 0c          	push   0xc(%esp)
  102813:	ff 74 24 0c          	push   0xc(%esp)
  102817:	ff 74 24 0c          	push   0xc(%esp)
  10281b:	e8 84 ff ff ff       	call   1027a4 <memmove>
  102820:	83 c4 0c             	add    $0xc,%esp
}
  102823:	c3                   	ret    

00102824 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
  102824:	53                   	push   %ebx
  102825:	8b 54 24 08          	mov    0x8(%esp),%edx
  102829:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  10282d:	8b 44 24 10          	mov    0x10(%esp),%eax
    while (n > 0 && *p && *p == *q)
  102831:	eb 09                	jmp    10283c <strncmp+0x18>
        n--, p++, q++;
  102833:	83 e8 01             	sub    $0x1,%eax
  102836:	83 c2 01             	add    $0x1,%edx
  102839:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
  10283c:	85 c0                	test   %eax,%eax
  10283e:	74 0b                	je     10284b <strncmp+0x27>
  102840:	0f b6 1a             	movzbl (%edx),%ebx
  102843:	84 db                	test   %bl,%bl
  102845:	74 04                	je     10284b <strncmp+0x27>
  102847:	3a 19                	cmp    (%ecx),%bl
  102849:	74 e8                	je     102833 <strncmp+0xf>
    if (n == 0)
  10284b:	85 c0                	test   %eax,%eax
  10284d:	74 0a                	je     102859 <strncmp+0x35>
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
  10284f:	0f b6 02             	movzbl (%edx),%eax
  102852:	0f b6 11             	movzbl (%ecx),%edx
  102855:	29 d0                	sub    %edx,%eax
}
  102857:	5b                   	pop    %ebx
  102858:	c3                   	ret    
        return 0;
  102859:	b8 00 00 00 00       	mov    $0x0,%eax
  10285e:	eb f7                	jmp    102857 <strncmp+0x33>

00102860 <strnlen>:

int strnlen(const char *s, size_t size)
{
  102860:	8b 54 24 04          	mov    0x4(%esp),%edx
  102864:	8b 44 24 08          	mov    0x8(%esp),%eax
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
  102868:	b9 00 00 00 00       	mov    $0x0,%ecx
  10286d:	eb 09                	jmp    102878 <strnlen+0x18>
        n++;
  10286f:	83 c1 01             	add    $0x1,%ecx
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
  102872:	83 c2 01             	add    $0x1,%edx
  102875:	83 e8 01             	sub    $0x1,%eax
  102878:	85 c0                	test   %eax,%eax
  10287a:	74 05                	je     102881 <strnlen+0x21>
  10287c:	80 3a 00             	cmpb   $0x0,(%edx)
  10287f:	75 ee                	jne    10286f <strnlen+0xf>
    return n;
}
  102881:	89 c8                	mov    %ecx,%eax
  102883:	c3                   	ret    

00102884 <strcmp>:

int strcmp(const char *p, const char *q)
{
  102884:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  102888:	8b 54 24 08          	mov    0x8(%esp),%edx
    while (*p && *p == *q)
  10288c:	eb 06                	jmp    102894 <strcmp+0x10>
        p++, q++;
  10288e:	83 c1 01             	add    $0x1,%ecx
  102891:	83 c2 01             	add    $0x1,%edx
    while (*p && *p == *q)
  102894:	0f b6 01             	movzbl (%ecx),%eax
  102897:	84 c0                	test   %al,%al
  102899:	74 04                	je     10289f <strcmp+0x1b>
  10289b:	3a 02                	cmp    (%edx),%al
  10289d:	74 ef                	je     10288e <strcmp+0xa>
    return (int) ((unsigned char) *p - (unsigned char) *q);
  10289f:	0f b6 c0             	movzbl %al,%eax
  1028a2:	0f b6 12             	movzbl (%edx),%edx
  1028a5:	29 d0                	sub    %edx,%eax
}
  1028a7:	c3                   	ret    

001028a8 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *strchr(const char *s, char c)
{
  1028a8:	8b 44 24 04          	mov    0x4(%esp),%eax
  1028ac:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
  1028b1:	eb 03                	jmp    1028b6 <strchr+0xe>
  1028b3:	83 c0 01             	add    $0x1,%eax
  1028b6:	0f b6 10             	movzbl (%eax),%edx
  1028b9:	84 d2                	test   %dl,%dl
  1028bb:	74 06                	je     1028c3 <strchr+0x1b>
        if (*s == c)
  1028bd:	38 ca                	cmp    %cl,%dl
  1028bf:	75 f2                	jne    1028b3 <strchr+0xb>
  1028c1:	eb 05                	jmp    1028c8 <strchr+0x20>
            return (char *) s;
    return 0;
  1028c3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1028c8:	c3                   	ret    

001028c9 <memzero>:

void *memzero(void *v, size_t n)
{
    return memset(v, 0, n);
  1028c9:	ff 74 24 08          	push   0x8(%esp)
  1028cd:	6a 00                	push   $0x0
  1028cf:	ff 74 24 0c          	push   0xc(%esp)
  1028d3:	e8 81 fe ff ff       	call   102759 <memset>
  1028d8:	83 c4 0c             	add    $0xc,%esp
}
  1028db:	c3                   	ret    

001028dc <debug_trace>:
}

#define DEBUG_TRACEFRAMES 10

static void debug_trace(uintptr_t ebp, uintptr_t *eips)
{
  1028dc:	53                   	push   %ebx
    int i;
    uintptr_t *frame = (uintptr_t *) ebp;

    for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  1028dd:	b9 00 00 00 00       	mov    $0x0,%ecx
  1028e2:	eb 0b                	jmp    1028ef <debug_trace+0x13>
        eips[i] = frame[1];              /* saved %eip */
  1028e4:	8b 58 04             	mov    0x4(%eax),%ebx
  1028e7:	89 1c 8a             	mov    %ebx,(%edx,%ecx,4)
        frame = (uintptr_t *) frame[0];  /* saved %ebp */
  1028ea:	8b 00                	mov    (%eax),%eax
    for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  1028ec:	83 c1 01             	add    $0x1,%ecx
  1028ef:	83 f9 09             	cmp    $0x9,%ecx
  1028f2:	0f 9e c3             	setle  %bl
  1028f5:	85 c0                	test   %eax,%eax
  1028f7:	74 10                	je     102909 <debug_trace+0x2d>
  1028f9:	84 db                	test   %bl,%bl
  1028fb:	75 e7                	jne    1028e4 <debug_trace+0x8>
  1028fd:	eb 0a                	jmp    102909 <debug_trace+0x2d>
    }
    for (; i < DEBUG_TRACEFRAMES; i++)
        eips[i] = 0;
  1028ff:	c7 04 8a 00 00 00 00 	movl   $0x0,(%edx,%ecx,4)
    for (; i < DEBUG_TRACEFRAMES; i++)
  102906:	83 c1 01             	add    $0x1,%ecx
  102909:	83 f9 09             	cmp    $0x9,%ecx
  10290c:	7e f1                	jle    1028ff <debug_trace+0x23>
}
  10290e:	5b                   	pop    %ebx
  10290f:	c3                   	ret    

00102910 <debug_info>:
{
  102910:	53                   	push   %ebx
  102911:	83 ec 08             	sub    $0x8,%esp
  102914:	e8 f3 d9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  102919:	81 c3 e7 86 00 00    	add    $0x86e7,%ebx
    va_start(ap, fmt);
  10291f:	8d 44 24 14          	lea    0x14(%esp),%eax
    vdprintf(fmt, ap);
  102923:	83 ec 08             	sub    $0x8,%esp
  102926:	50                   	push   %eax
  102927:	ff 74 24 1c          	push   0x1c(%esp)
  10292b:	e8 72 01 00 00       	call   102aa2 <vdprintf>
}
  102930:	83 c4 18             	add    $0x18,%esp
  102933:	5b                   	pop    %ebx
  102934:	c3                   	ret    

00102935 <debug_normal>:
{
  102935:	53                   	push   %ebx
  102936:	83 ec 0c             	sub    $0xc,%esp
  102939:	e8 ce d9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10293e:	81 c3 c2 86 00 00    	add    $0x86c2,%ebx
    dprintf("[D] %s:%d: ", file, line);
  102944:	ff 74 24 18          	push   0x18(%esp)
  102948:	ff 74 24 18          	push   0x18(%esp)
  10294c:	8d 83 f4 b3 ff ff    	lea    -0x4c0c(%ebx),%eax
  102952:	50                   	push   %eax
  102953:	e8 a9 01 00 00       	call   102b01 <dprintf>
    va_start(ap, fmt);
  102958:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    vdprintf(fmt, ap);
  10295c:	83 c4 08             	add    $0x8,%esp
  10295f:	50                   	push   %eax
  102960:	ff 74 24 24          	push   0x24(%esp)
  102964:	e8 39 01 00 00       	call   102aa2 <vdprintf>
}
  102969:	83 c4 18             	add    $0x18,%esp
  10296c:	5b                   	pop    %ebx
  10296d:	c3                   	ret    

0010296e <debug_panic>:

gcc_noinline void debug_panic(const char *file, int line, const char *fmt, ...)
{
  10296e:	56                   	push   %esi
  10296f:	53                   	push   %ebx
  102970:	83 ec 38             	sub    $0x38,%esp
  102973:	e8 94 d9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  102978:	81 c3 88 86 00 00    	add    $0x8688,%ebx
    int i;
    uintptr_t eips[DEBUG_TRACEFRAMES];
    va_list ap;

    dprintf("[P] %s:%d: ", file, line);
  10297e:	ff 74 24 48          	push   0x48(%esp)
  102982:	ff 74 24 48          	push   0x48(%esp)
  102986:	8d 83 00 b4 ff ff    	lea    -0x4c00(%ebx),%eax
  10298c:	50                   	push   %eax
  10298d:	e8 6f 01 00 00       	call   102b01 <dprintf>

    va_start(ap, fmt);
  102992:	8d 44 24 5c          	lea    0x5c(%esp),%eax
    vdprintf(fmt, ap);
  102996:	83 c4 08             	add    $0x8,%esp
  102999:	50                   	push   %eax
  10299a:	ff 74 24 54          	push   0x54(%esp)
  10299e:	e8 ff 00 00 00       	call   102aa2 <vdprintf>
#define MAX_CHILDREN 3

static inline uint32_t __attribute__ ((always_inline)) read_ebp(void)
{
    uint32_t ebp;
    __asm __volatile ("movl %%ebp,%0" : "=rm" (ebp));
  1029a3:	89 e8                	mov    %ebp,%eax
    va_end(ap);

    debug_trace(read_ebp(), eips);
  1029a5:	8d 54 24 18          	lea    0x18(%esp),%edx
  1029a9:	e8 2e ff ff ff       	call   1028dc <debug_trace>
    for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1029ae:	83 c4 10             	add    $0x10,%esp
  1029b1:	be 00 00 00 00       	mov    $0x0,%esi
  1029b6:	83 fe 09             	cmp    $0x9,%esi
  1029b9:	7f 20                	jg     1029db <debug_panic+0x6d>
  1029bb:	8b 44 b4 08          	mov    0x8(%esp,%esi,4),%eax
  1029bf:	85 c0                	test   %eax,%eax
  1029c1:	74 18                	je     1029db <debug_panic+0x6d>
        dprintf("\tfrom 0x%08x\n", eips[i]);
  1029c3:	83 ec 08             	sub    $0x8,%esp
  1029c6:	50                   	push   %eax
  1029c7:	8d 83 0c b4 ff ff    	lea    -0x4bf4(%ebx),%eax
  1029cd:	50                   	push   %eax
  1029ce:	e8 2e 01 00 00       	call   102b01 <dprintf>
    for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1029d3:	83 c6 01             	add    $0x1,%esi
  1029d6:	83 c4 10             	add    $0x10,%esp
  1029d9:	eb db                	jmp    1029b6 <debug_panic+0x48>

    dprintf("Kernel Panic !!!\n");
  1029db:	83 ec 0c             	sub    $0xc,%esp
  1029de:	8d 83 1a b4 ff ff    	lea    -0x4be6(%ebx),%eax
  1029e4:	50                   	push   %eax
  1029e5:	e8 17 01 00 00       	call   102b01 <dprintf>

    halt();
  1029ea:	e8 d4 0a 00 00       	call   1034c3 <halt>
}
  1029ef:	83 c4 44             	add    $0x44,%esp
  1029f2:	5b                   	pop    %ebx
  1029f3:	5e                   	pop    %esi
  1029f4:	c3                   	ret    

001029f5 <debug_warn>:

void debug_warn(const char *file, int line, const char *fmt, ...)
{
  1029f5:	53                   	push   %ebx
  1029f6:	83 ec 0c             	sub    $0xc,%esp
  1029f9:	e8 0e d9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1029fe:	81 c3 02 86 00 00    	add    $0x8602,%ebx
    dprintf("[W] %s:%d: ", file, line);
  102a04:	ff 74 24 18          	push   0x18(%esp)
  102a08:	ff 74 24 18          	push   0x18(%esp)
  102a0c:	8d 83 2c b4 ff ff    	lea    -0x4bd4(%ebx),%eax
  102a12:	50                   	push   %eax
  102a13:	e8 e9 00 00 00       	call   102b01 <dprintf>

    va_list ap;
    va_start(ap, fmt);
  102a18:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    vdprintf(fmt, ap);
  102a1c:	83 c4 08             	add    $0x8,%esp
  102a1f:	50                   	push   %eax
  102a20:	ff 74 24 24          	push   0x24(%esp)
  102a24:	e8 79 00 00 00       	call   102aa2 <vdprintf>
    va_end(ap);
}
  102a29:	83 c4 18             	add    $0x18,%esp
  102a2c:	5b                   	pop    %ebx
  102a2d:	c3                   	ret    

00102a2e <cputs>:
    int cnt;  /* total bytes printed so far */
    char buf[CONSOLE_BUFFER_SIZE];
};

static void cputs(const char *str)
{
  102a2e:	56                   	push   %esi
  102a2f:	53                   	push   %ebx
  102a30:	83 ec 04             	sub    $0x4,%esp
  102a33:	e8 d4 d8 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  102a38:	81 c3 c8 85 00 00    	add    $0x85c8,%ebx
  102a3e:	89 c6                	mov    %eax,%esi
    while (*str) {
  102a40:	eb 12                	jmp    102a54 <cputs+0x26>
        cons_putc(*str);
  102a42:	83 ec 0c             	sub    $0xc,%esp
  102a45:	0f be c0             	movsbl %al,%eax
  102a48:	50                   	push   %eax
  102a49:	e8 98 d9 ff ff       	call   1003e6 <cons_putc>
        str += 1;
  102a4e:	83 c6 01             	add    $0x1,%esi
  102a51:	83 c4 10             	add    $0x10,%esp
    while (*str) {
  102a54:	0f b6 06             	movzbl (%esi),%eax
  102a57:	84 c0                	test   %al,%al
  102a59:	75 e7                	jne    102a42 <cputs+0x14>
    }
}
  102a5b:	83 c4 04             	add    $0x4,%esp
  102a5e:	5b                   	pop    %ebx
  102a5f:	5e                   	pop    %esi
  102a60:	c3                   	ret    

00102a61 <putch>:

static void putch(int ch, struct dprintbuf *b)
{
  102a61:	53                   	push   %ebx
  102a62:	83 ec 08             	sub    $0x8,%esp
  102a65:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    b->buf[b->idx++] = ch;
  102a69:	8b 13                	mov    (%ebx),%edx
  102a6b:	8d 42 01             	lea    0x1(%edx),%eax
  102a6e:	89 03                	mov    %eax,(%ebx)
  102a70:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102a74:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
    if (b->idx == CONSOLE_BUFFER_SIZE - 1) {
  102a78:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  102a7d:	74 0e                	je     102a8d <putch+0x2c>
        b->buf[b->idx] = 0;
        cputs(b->buf);
        b->idx = 0;
    }
    b->cnt++;
  102a7f:	8b 43 04             	mov    0x4(%ebx),%eax
  102a82:	83 c0 01             	add    $0x1,%eax
  102a85:	89 43 04             	mov    %eax,0x4(%ebx)
}
  102a88:	83 c4 08             	add    $0x8,%esp
  102a8b:	5b                   	pop    %ebx
  102a8c:	c3                   	ret    
        b->buf[b->idx] = 0;
  102a8d:	c6 44 13 09 00       	movb   $0x0,0x9(%ebx,%edx,1)
        cputs(b->buf);
  102a92:	8d 43 08             	lea    0x8(%ebx),%eax
  102a95:	e8 94 ff ff ff       	call   102a2e <cputs>
        b->idx = 0;
  102a9a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  102aa0:	eb dd                	jmp    102a7f <putch+0x1e>

00102aa2 <vdprintf>:

int vdprintf(const char *fmt, va_list ap)
{
  102aa2:	53                   	push   %ebx
  102aa3:	81 ec 18 02 00 00    	sub    $0x218,%esp
  102aa9:	e8 5e d8 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  102aae:	81 c3 52 85 00 00    	add    $0x8552,%ebx
    struct dprintbuf b;

    b.idx = 0;
  102ab4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  102abb:	00 
    b.cnt = 0;
  102abc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102ac3:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
  102ac4:	ff b4 24 24 02 00 00 	push   0x224(%esp)
  102acb:	ff b4 24 24 02 00 00 	push   0x224(%esp)
  102ad2:	8d 44 24 10          	lea    0x10(%esp),%eax
  102ad6:	50                   	push   %eax
  102ad7:	8d 83 61 7a ff ff    	lea    -0x859f(%ebx),%eax
  102add:	50                   	push   %eax
  102ade:	e8 5d 01 00 00       	call   102c40 <vprintfmt>

    b.buf[b.idx] = 0;
  102ae3:	8b 44 24 18          	mov    0x18(%esp),%eax
  102ae7:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
    cputs(b.buf);
  102aec:	8d 44 24 20          	lea    0x20(%esp),%eax
  102af0:	e8 39 ff ff ff       	call   102a2e <cputs>

    return b.cnt;
}
  102af5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  102af9:	81 c4 28 02 00 00    	add    $0x228,%esp
  102aff:	5b                   	pop    %ebx
  102b00:	c3                   	ret    

00102b01 <dprintf>:

int dprintf(const char *fmt, ...)
{
  102b01:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
  102b04:	8d 44 24 14          	lea    0x14(%esp),%eax
    cnt = vdprintf(fmt, ap);
  102b08:	83 ec 08             	sub    $0x8,%esp
  102b0b:	50                   	push   %eax
  102b0c:	ff 74 24 1c          	push   0x1c(%esp)
  102b10:	e8 8d ff ff ff       	call   102aa2 <vdprintf>
    va_end(ap);

    return cnt;
}
  102b15:	83 c4 1c             	add    $0x1c,%esp
  102b18:	c3                   	ret    

00102b19 <printnum>:
 * Print a number (base <= 16) in reverse order,
 * using specified putch function and associated pointer putdat.
 */
static void printnum(putch_t putch, void *putdat, unsigned long long num,
                     unsigned base, int width, int padc)
{
  102b19:	55                   	push   %ebp
  102b1a:	57                   	push   %edi
  102b1b:	56                   	push   %esi
  102b1c:	53                   	push   %ebx
  102b1d:	83 ec 2c             	sub    $0x2c,%esp
  102b20:	e8 e3 d7 ff ff       	call   100308 <__x86.get_pc_thunk.cx>
  102b25:	81 c1 db 84 00 00    	add    $0x84db,%ecx
  102b2b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  102b2f:	89 c6                	mov    %eax,%esi
  102b31:	89 d7                	mov    %edx,%edi
  102b33:	8b 44 24 40          	mov    0x40(%esp),%eax
  102b37:	8b 54 24 44          	mov    0x44(%esp),%edx
  102b3b:	89 d1                	mov    %edx,%ecx
  102b3d:	89 c2                	mov    %eax,%edx
  102b3f:	89 44 24 18          	mov    %eax,0x18(%esp)
  102b43:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
  102b47:	8b 44 24 48          	mov    0x48(%esp),%eax
  102b4b:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
  102b4f:	8b 6c 24 50          	mov    0x50(%esp),%ebp
    /* first recursively print all preceding (more significant) digits */
    if (num >= base) {
  102b53:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b57:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102b5e:	00 
  102b5f:	39 c2                	cmp    %eax,%edx
  102b61:	1b 4c 24 0c          	sbb    0xc(%esp),%ecx
  102b65:	72 42                	jb     102ba9 <printnum+0x90>
        printnum(putch, putdat, num / base, base, width - 1, padc);
  102b67:	83 ec 0c             	sub    $0xc,%esp
  102b6a:	55                   	push   %ebp
  102b6b:	83 eb 01             	sub    $0x1,%ebx
  102b6e:	53                   	push   %ebx
  102b6f:	50                   	push   %eax
  102b70:	83 ec 08             	sub    $0x8,%esp
  102b73:	ff 74 24 2c          	push   0x2c(%esp)
  102b77:	ff 74 24 2c          	push   0x2c(%esp)
  102b7b:	ff 74 24 44          	push   0x44(%esp)
  102b7f:	ff 74 24 44          	push   0x44(%esp)
  102b83:	8b 5c 24 44          	mov    0x44(%esp),%ebx
  102b87:	e8 d4 29 00 00       	call   105560 <__udivdi3>
  102b8c:	83 c4 18             	add    $0x18,%esp
  102b8f:	52                   	push   %edx
  102b90:	50                   	push   %eax
  102b91:	89 fa                	mov    %edi,%edx
  102b93:	89 f0                	mov    %esi,%eax
  102b95:	e8 7f ff ff ff       	call   102b19 <printnum>
  102b9a:	83 c4 20             	add    $0x20,%esp
  102b9d:	eb 11                	jmp    102bb0 <printnum+0x97>
    } else {
        /* print any needed pad characters before first digit */
        while (--width > 0)
            putch(padc, putdat);
  102b9f:	83 ec 08             	sub    $0x8,%esp
  102ba2:	57                   	push   %edi
  102ba3:	55                   	push   %ebp
  102ba4:	ff d6                	call   *%esi
  102ba6:	83 c4 10             	add    $0x10,%esp
        while (--width > 0)
  102ba9:	83 eb 01             	sub    $0x1,%ebx
  102bac:	85 db                	test   %ebx,%ebx
  102bae:	7f ef                	jg     102b9f <printnum+0x86>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
  102bb0:	ff 74 24 0c          	push   0xc(%esp)
  102bb4:	ff 74 24 0c          	push   0xc(%esp)
  102bb8:	ff 74 24 24          	push   0x24(%esp)
  102bbc:	ff 74 24 24          	push   0x24(%esp)
  102bc0:	8b 5c 24 24          	mov    0x24(%esp),%ebx
  102bc4:	e8 b7 2a 00 00       	call   105680 <__umoddi3>
  102bc9:	83 c4 08             	add    $0x8,%esp
  102bcc:	57                   	push   %edi
  102bcd:	0f be 84 03 38 b4 ff 	movsbl -0x4bc8(%ebx,%eax,1),%eax
  102bd4:	ff 
  102bd5:	50                   	push   %eax
  102bd6:	ff d6                	call   *%esi
}
  102bd8:	83 c4 3c             	add    $0x3c,%esp
  102bdb:	5b                   	pop    %ebx
  102bdc:	5e                   	pop    %esi
  102bdd:	5f                   	pop    %edi
  102bde:	5d                   	pop    %ebp
  102bdf:	c3                   	ret    

00102be0 <getuint>:
 * Get an unsigned int of various possible sizes from a varargs list,
 * depending on the lflag parameter.
 */
static unsigned long long getuint(va_list *ap, int lflag)
{
    if (lflag >= 2)
  102be0:	83 fa 01             	cmp    $0x1,%edx
  102be3:	7f 13                	jg     102bf8 <getuint+0x18>
        return va_arg(*ap, unsigned long long);
    else if (lflag)
  102be5:	85 d2                	test   %edx,%edx
  102be7:	74 1c                	je     102c05 <getuint+0x25>
        return va_arg(*ap, unsigned long);
  102be9:	8b 10                	mov    (%eax),%edx
  102beb:	8d 4a 04             	lea    0x4(%edx),%ecx
  102bee:	89 08                	mov    %ecx,(%eax)
  102bf0:	8b 02                	mov    (%edx),%eax
  102bf2:	ba 00 00 00 00       	mov    $0x0,%edx
  102bf7:	c3                   	ret    
        return va_arg(*ap, unsigned long long);
  102bf8:	8b 10                	mov    (%eax),%edx
  102bfa:	8d 4a 08             	lea    0x8(%edx),%ecx
  102bfd:	89 08                	mov    %ecx,(%eax)
  102bff:	8b 02                	mov    (%edx),%eax
  102c01:	8b 52 04             	mov    0x4(%edx),%edx
  102c04:	c3                   	ret    
    else
        return va_arg(*ap, unsigned int);
  102c05:	8b 10                	mov    (%eax),%edx
  102c07:	8d 4a 04             	lea    0x4(%edx),%ecx
  102c0a:	89 08                	mov    %ecx,(%eax)
  102c0c:	8b 02                	mov    (%edx),%eax
  102c0e:	ba 00 00 00 00       	mov    $0x0,%edx
}
  102c13:	c3                   	ret    

00102c14 <getint>:
 * Same as getuint but signed - can't use getuint
 * because of sign extension
 */
static long long getint(va_list *ap, int lflag)
{
    if (lflag >= 2)
  102c14:	83 fa 01             	cmp    $0x1,%edx
  102c17:	7f 0f                	jg     102c28 <getint+0x14>
        return va_arg(*ap, long long);
    else if (lflag)
  102c19:	85 d2                	test   %edx,%edx
  102c1b:	74 18                	je     102c35 <getint+0x21>
        return va_arg(*ap, long);
  102c1d:	8b 10                	mov    (%eax),%edx
  102c1f:	8d 4a 04             	lea    0x4(%edx),%ecx
  102c22:	89 08                	mov    %ecx,(%eax)
  102c24:	8b 02                	mov    (%edx),%eax
  102c26:	99                   	cltd   
  102c27:	c3                   	ret    
        return va_arg(*ap, long long);
  102c28:	8b 10                	mov    (%eax),%edx
  102c2a:	8d 4a 08             	lea    0x8(%edx),%ecx
  102c2d:	89 08                	mov    %ecx,(%eax)
  102c2f:	8b 02                	mov    (%edx),%eax
  102c31:	8b 52 04             	mov    0x4(%edx),%edx
  102c34:	c3                   	ret    
    else
        return va_arg(*ap, int);
  102c35:	8b 10                	mov    (%eax),%edx
  102c37:	8d 4a 04             	lea    0x4(%edx),%ecx
  102c3a:	89 08                	mov    %ecx,(%eax)
  102c3c:	8b 02                	mov    (%edx),%eax
  102c3e:	99                   	cltd   
}
  102c3f:	c3                   	ret    

00102c40 <vprintfmt>:

void vprintfmt(putch_t putch, void *putdat, const char *fmt, va_list ap)
{
  102c40:	55                   	push   %ebp
  102c41:	57                   	push   %edi
  102c42:	56                   	push   %esi
  102c43:	53                   	push   %ebx
  102c44:	83 ec 2c             	sub    $0x2c,%esp
  102c47:	e8 7c e1 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  102c4c:	05 b4 83 00 00       	add    $0x83b4,%eax
  102c51:	89 44 24 10          	mov    %eax,0x10(%esp)
  102c55:	8b 74 24 40          	mov    0x40(%esp),%esi
  102c59:	8b 7c 24 44          	mov    0x44(%esp),%edi
  102c5d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  102c61:	eb 0c                	jmp    102c6f <vprintfmt+0x2f>

    while (1) {
        while ((ch = *(unsigned char *) fmt++) != '%') {
            if (ch == '\0')
                return;
            putch(ch, putdat);
  102c63:	83 ec 08             	sub    $0x8,%esp
  102c66:	57                   	push   %edi
  102c67:	50                   	push   %eax
  102c68:	ff d6                	call   *%esi
  102c6a:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
  102c6d:	89 dd                	mov    %ebx,%ebp
  102c6f:	8d 5d 01             	lea    0x1(%ebp),%ebx
  102c72:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
  102c76:	83 f8 25             	cmp    $0x25,%eax
  102c79:	74 0c                	je     102c87 <vprintfmt+0x47>
            if (ch == '\0')
  102c7b:	85 c0                	test   %eax,%eax
  102c7d:	75 e4                	jne    102c63 <vprintfmt+0x23>
            for (fmt--; fmt[-1] != '%'; fmt--)
                /* do nothing */ ;
            break;
        }
    }
}
  102c7f:	83 c4 2c             	add    $0x2c,%esp
  102c82:	5b                   	pop    %ebx
  102c83:	5e                   	pop    %esi
  102c84:	5f                   	pop    %edi
  102c85:	5d                   	pop    %ebp
  102c86:	c3                   	ret    
        padc = ' ';
  102c87:	c6 44 24 1b 20       	movb   $0x20,0x1b(%esp)
        altflag = 0;
  102c8c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        precision = -1;
  102c93:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  102c9a:	ff 
        width = -1;
  102c9b:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  102ca2:	ff 
        lflag = 0;
  102ca3:	b9 00 00 00 00       	mov    $0x0,%ecx
  102ca8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
        switch (ch = *(unsigned char *) fmt++) {
  102cac:	8d 6b 01             	lea    0x1(%ebx),%ebp
  102caf:	0f b6 03             	movzbl (%ebx),%eax
  102cb2:	0f b6 c8             	movzbl %al,%ecx
  102cb5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  102cb9:	83 e8 23             	sub    $0x23,%eax
  102cbc:	3c 55                	cmp    $0x55,%al
  102cbe:	0f 87 b2 02 00 00    	ja     102f76 <.L25>
  102cc4:	0f b6 c0             	movzbl %al,%eax
  102cc7:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102ccb:	89 ca                	mov    %ecx,%edx
  102ccd:	03 94 81 50 b4 ff ff 	add    -0x4bb0(%ecx,%eax,4),%edx
  102cd4:	ff e2                	jmp    *%edx

00102cd6 <.L23>:
  102cd6:	89 eb                	mov    %ebp,%ebx
  102cd8:	c6 44 24 1b 2d       	movb   $0x2d,0x1b(%esp)
  102cdd:	eb cd                	jmp    102cac <vprintfmt+0x6c>

00102cdf <.L59>:
  102cdf:	89 eb                	mov    %ebp,%ebx
            padc = '0';
  102ce1:	c6 44 24 1b 30       	movb   $0x30,0x1b(%esp)
  102ce6:	eb c4                	jmp    102cac <vprintfmt+0x6c>

00102ce8 <.L60>:
        switch (ch = *(unsigned char *) fmt++) {
  102ce8:	b8 00 00 00 00       	mov    $0x0,%eax
  102ced:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  102cf1:	8b 54 24 08          	mov    0x8(%esp),%edx
                precision = precision * 10 + ch - '0';
  102cf5:	8d 04 80             	lea    (%eax,%eax,4),%eax
  102cf8:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
                ch = *fmt;
  102cfc:	0f be 55 00          	movsbl 0x0(%ebp),%edx
                if (ch < '0' || ch > '9')
  102d00:	8d 5a d0             	lea    -0x30(%edx),%ebx
  102d03:	83 fb 09             	cmp    $0x9,%ebx
  102d06:	77 5a                	ja     102d62 <.L38+0xe>
            for (precision = 0;; ++fmt) {
  102d08:	83 c5 01             	add    $0x1,%ebp
                precision = precision * 10 + ch - '0';
  102d0b:	eb e8                	jmp    102cf5 <.L60+0xd>

00102d0d <.L36>:
            precision = va_arg(ap, int);
  102d0d:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  102d11:	8d 50 04             	lea    0x4(%eax),%edx
  102d14:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  102d18:	8b 00                	mov    (%eax),%eax
  102d1a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        switch (ch = *(unsigned char *) fmt++) {
  102d1e:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
  102d20:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  102d25:	79 85                	jns    102cac <vprintfmt+0x6c>
                width = precision, precision = -1;
  102d27:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  102d2b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d2f:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  102d36:	ff 
            goto reswitch;
  102d37:	e9 70 ff ff ff       	jmp    102cac <vprintfmt+0x6c>

00102d3c <.L35>:
            if (width < 0)
  102d3c:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  102d41:	78 07                	js     102d4a <.L35+0xe>
        switch (ch = *(unsigned char *) fmt++) {
  102d43:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
  102d45:	e9 62 ff ff ff       	jmp    102cac <vprintfmt+0x6c>
                width = 0;
  102d4a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102d51:	00 
  102d52:	eb ef                	jmp    102d43 <.L35+0x7>

00102d54 <.L38>:
        switch (ch = *(unsigned char *) fmt++) {
  102d54:	89 eb                	mov    %ebp,%ebx
            altflag = 1;
  102d56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
            goto reswitch;
  102d5d:	e9 4a ff ff ff       	jmp    102cac <vprintfmt+0x6c>
  102d62:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  102d66:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  102d6a:	89 eb                	mov    %ebp,%ebx
  102d6c:	eb b2                	jmp    102d20 <.L36+0x13>

00102d6e <.L31>:
            lflag++;
  102d6e:	83 44 24 14 01       	addl   $0x1,0x14(%esp)
        switch (ch = *(unsigned char *) fmt++) {
  102d73:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
  102d75:	e9 32 ff ff ff       	jmp    102cac <vprintfmt+0x6c>

00102d7a <.L33>:
            putch(va_arg(ap, int), putdat);
  102d7a:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  102d7e:	8d 50 04             	lea    0x4(%eax),%edx
  102d81:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  102d85:	83 ec 08             	sub    $0x8,%esp
  102d88:	57                   	push   %edi
  102d89:	ff 30                	push   (%eax)
  102d8b:	ff d6                	call   *%esi
            break;
  102d8d:	83 c4 10             	add    $0x10,%esp
  102d90:	e9 da fe ff ff       	jmp    102c6f <vprintfmt+0x2f>

00102d95 <.L29>:
            if ((p = va_arg(ap, char *)) == NULL)
  102d95:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  102d99:	8d 50 04             	lea    0x4(%eax),%edx
  102d9c:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  102da0:	8b 00                	mov    (%eax),%eax
  102da2:	89 44 24 08          	mov    %eax,0x8(%esp)
  102da6:	85 c0                	test   %eax,%eax
  102da8:	74 2a                	je     102dd4 <.L29+0x3f>
            if (width > 0 && padc != '-')
  102daa:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  102daf:	0f 9f c2             	setg   %dl
  102db2:	80 7c 24 1b 2d       	cmpb   $0x2d,0x1b(%esp)
  102db7:	0f 95 c0             	setne  %al
  102dba:	84 c2                	test   %al,%dl
  102dbc:	75 26                	jne    102de4 <.L29+0x4f>
  102dbe:	8b 44 24 08          	mov    0x8(%esp),%eax
  102dc2:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  102dc6:	89 74 24 40          	mov    %esi,0x40(%esp)
  102dca:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  102dce:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  102dd2:	eb 70                	jmp    102e44 <.L29+0xaf>
                p = "(null)";
  102dd4:	8b 44 24 10          	mov    0x10(%esp),%eax
  102dd8:	8d 80 49 b4 ff ff    	lea    -0x4bb7(%eax),%eax
  102dde:	89 44 24 08          	mov    %eax,0x8(%esp)
  102de2:	eb c6                	jmp    102daa <.L29+0x15>
                for (width -= strnlen(p, precision); width > 0; width--)
  102de4:	83 ec 08             	sub    $0x8,%esp
  102de7:	ff 74 24 24          	push   0x24(%esp)
  102deb:	ff 74 24 14          	push   0x14(%esp)
  102def:	8b 5c 24 20          	mov    0x20(%esp),%ebx
  102df3:	e8 68 fa ff ff       	call   102860 <strnlen>
  102df8:	29 44 24 1c          	sub    %eax,0x1c(%esp)
  102dfc:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  102e00:	83 c4 10             	add    $0x10,%esp
  102e03:	89 d3                	mov    %edx,%ebx
  102e05:	eb 12                	jmp    102e19 <.L29+0x84>
                    putch(padc, putdat);
  102e07:	83 ec 08             	sub    $0x8,%esp
  102e0a:	57                   	push   %edi
  102e0b:	0f be 44 24 27       	movsbl 0x27(%esp),%eax
  102e10:	50                   	push   %eax
  102e11:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
  102e13:	83 eb 01             	sub    $0x1,%ebx
  102e16:	83 c4 10             	add    $0x10,%esp
  102e19:	85 db                	test   %ebx,%ebx
  102e1b:	7f ea                	jg     102e07 <.L29+0x72>
  102e1d:	89 da                	mov    %ebx,%edx
  102e1f:	8b 44 24 08          	mov    0x8(%esp),%eax
  102e23:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  102e27:	89 74 24 40          	mov    %esi,0x40(%esp)
  102e2b:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  102e2f:	89 d5                	mov    %edx,%ebp
  102e31:	eb 11                	jmp    102e44 <.L29+0xaf>
                    putch(ch, putdat);
  102e33:	83 ec 08             	sub    $0x8,%esp
  102e36:	57                   	push   %edi
  102e37:	52                   	push   %edx
  102e38:	ff 54 24 50          	call   *0x50(%esp)
  102e3c:	83 c4 10             	add    $0x10,%esp
                 width--)
  102e3f:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  102e42:	89 f0                	mov    %esi,%eax
  102e44:	8d 70 01             	lea    0x1(%eax),%esi
  102e47:	0f b6 00             	movzbl (%eax),%eax
  102e4a:	0f be d0             	movsbl %al,%edx
  102e4d:	85 d2                	test   %edx,%edx
  102e4f:	74 4c                	je     102e9d <.L29+0x108>
  102e51:	85 db                	test   %ebx,%ebx
  102e53:	78 05                	js     102e5a <.L29+0xc5>
  102e55:	83 eb 01             	sub    $0x1,%ebx
  102e58:	78 20                	js     102e7a <.L29+0xe5>
                if (altflag && (ch < ' ' || ch > '~'))
  102e5a:	83 3c 24 00          	cmpl   $0x0,(%esp)
  102e5e:	74 d3                	je     102e33 <.L29+0x9e>
  102e60:	0f be c0             	movsbl %al,%eax
  102e63:	83 e8 20             	sub    $0x20,%eax
  102e66:	83 f8 5e             	cmp    $0x5e,%eax
  102e69:	76 c8                	jbe    102e33 <.L29+0x9e>
                    putch('?', putdat);
  102e6b:	83 ec 08             	sub    $0x8,%esp
  102e6e:	57                   	push   %edi
  102e6f:	6a 3f                	push   $0x3f
  102e71:	ff 54 24 50          	call   *0x50(%esp)
  102e75:	83 c4 10             	add    $0x10,%esp
  102e78:	eb c5                	jmp    102e3f <.L29+0xaa>
  102e7a:	89 eb                	mov    %ebp,%ebx
  102e7c:	8b 74 24 40          	mov    0x40(%esp),%esi
  102e80:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  102e84:	eb 0e                	jmp    102e94 <.L29+0xff>
                putch(' ', putdat);
  102e86:	83 ec 08             	sub    $0x8,%esp
  102e89:	57                   	push   %edi
  102e8a:	6a 20                	push   $0x20
  102e8c:	ff d6                	call   *%esi
            for (; width > 0; width--)
  102e8e:	83 eb 01             	sub    $0x1,%ebx
  102e91:	83 c4 10             	add    $0x10,%esp
  102e94:	85 db                	test   %ebx,%ebx
  102e96:	7f ee                	jg     102e86 <.L29+0xf1>
  102e98:	e9 d2 fd ff ff       	jmp    102c6f <vprintfmt+0x2f>
  102e9d:	89 eb                	mov    %ebp,%ebx
  102e9f:	8b 74 24 40          	mov    0x40(%esp),%esi
  102ea3:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  102ea7:	eb eb                	jmp    102e94 <.L29+0xff>

00102ea9 <.L32>:
            num = getint(&ap, lflag);
  102ea9:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  102ead:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  102eb1:	89 ca                	mov    %ecx,%edx
  102eb3:	e8 5c fd ff ff       	call   102c14 <getint>
            if ((long long) num < 0) {
  102eb8:	89 04 24             	mov    %eax,(%esp)
  102ebb:	89 54 24 04          	mov    %edx,0x4(%esp)
  102ebf:	83 7c 24 04 00       	cmpl   $0x0,0x4(%esp)
  102ec4:	78 26                	js     102eec <.L32+0x43>
            base = 10;
  102ec6:	bb 0a 00 00 00       	mov    $0xa,%ebx
            printnum(putch, putdat, num, base, width, padc);
  102ecb:	83 ec 0c             	sub    $0xc,%esp
  102ece:	0f be 4c 24 27       	movsbl 0x27(%esp),%ecx
  102ed3:	51                   	push   %ecx
  102ed4:	ff 74 24 1c          	push   0x1c(%esp)
  102ed8:	53                   	push   %ebx
  102ed9:	52                   	push   %edx
  102eda:	50                   	push   %eax
  102edb:	89 fa                	mov    %edi,%edx
  102edd:	89 f0                	mov    %esi,%eax
  102edf:	e8 35 fc ff ff       	call   102b19 <printnum>
            break;
  102ee4:	83 c4 20             	add    $0x20,%esp
  102ee7:	e9 83 fd ff ff       	jmp    102c6f <vprintfmt+0x2f>
                putch('-', putdat);
  102eec:	83 ec 08             	sub    $0x8,%esp
  102eef:	57                   	push   %edi
  102ef0:	6a 2d                	push   $0x2d
  102ef2:	ff d6                	call   *%esi
                num = -(long long) num;
  102ef4:	8b 44 24 10          	mov    0x10(%esp),%eax
  102ef8:	8b 54 24 14          	mov    0x14(%esp),%edx
  102efc:	f7 d8                	neg    %eax
  102efe:	83 d2 00             	adc    $0x0,%edx
  102f01:	f7 da                	neg    %edx
  102f03:	83 c4 10             	add    $0x10,%esp
  102f06:	eb be                	jmp    102ec6 <.L32+0x1d>

00102f08 <.L28>:
            num = getuint(&ap, lflag);
  102f08:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  102f0c:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  102f10:	89 ca                	mov    %ecx,%edx
  102f12:	e8 c9 fc ff ff       	call   102be0 <getuint>
            base = 10;
  102f17:	bb 0a 00 00 00       	mov    $0xa,%ebx
            goto number;
  102f1c:	eb ad                	jmp    102ecb <.L32+0x22>

00102f1e <.L30>:
            putch('0', putdat);
  102f1e:	83 ec 08             	sub    $0x8,%esp
  102f21:	57                   	push   %edi
  102f22:	6a 30                	push   $0x30
  102f24:	ff d6                	call   *%esi
            putch('x', putdat);
  102f26:	83 c4 08             	add    $0x8,%esp
  102f29:	57                   	push   %edi
  102f2a:	6a 78                	push   $0x78
  102f2c:	ff d6                	call   *%esi
            num = (unsigned long long) (uintptr_t) va_arg(ap, void *);
  102f2e:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  102f32:	8d 50 04             	lea    0x4(%eax),%edx
  102f35:	89 54 24 5c          	mov    %edx,0x5c(%esp)
  102f39:	8b 00                	mov    (%eax),%eax
  102f3b:	ba 00 00 00 00       	mov    $0x0,%edx
            goto number;
  102f40:	83 c4 10             	add    $0x10,%esp
            base = 16;
  102f43:	bb 10 00 00 00       	mov    $0x10,%ebx
            goto number;
  102f48:	eb 81                	jmp    102ecb <.L32+0x22>

00102f4a <.L26>:
            num = getuint(&ap, lflag);
  102f4a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  102f4e:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  102f52:	89 ca                	mov    %ecx,%edx
  102f54:	e8 87 fc ff ff       	call   102be0 <getuint>
            base = 16;
  102f59:	bb 10 00 00 00       	mov    $0x10,%ebx
  102f5e:	e9 68 ff ff ff       	jmp    102ecb <.L32+0x22>

00102f63 <.L37>:
            putch(ch, putdat);
  102f63:	8b 54 24 08          	mov    0x8(%esp),%edx
  102f67:	83 ec 08             	sub    $0x8,%esp
  102f6a:	57                   	push   %edi
  102f6b:	52                   	push   %edx
  102f6c:	ff d6                	call   *%esi
            break;
  102f6e:	83 c4 10             	add    $0x10,%esp
  102f71:	e9 f9 fc ff ff       	jmp    102c6f <vprintfmt+0x2f>

00102f76 <.L25>:
            putch('%', putdat);
  102f76:	83 ec 08             	sub    $0x8,%esp
  102f79:	57                   	push   %edi
  102f7a:	6a 25                	push   $0x25
  102f7c:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
  102f7e:	83 c4 10             	add    $0x10,%esp
  102f81:	89 dd                	mov    %ebx,%ebp
  102f83:	eb 03                	jmp    102f88 <.L25+0x12>
  102f85:	83 ed 01             	sub    $0x1,%ebp
  102f88:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
  102f8c:	75 f7                	jne    102f85 <.L25+0xf>
  102f8e:	e9 dc fc ff ff       	jmp    102c6f <vprintfmt+0x2f>

00102f93 <tss_switch>:

segdesc_t gdt_LOC[CPU_GDT_NDESC];
tss_t tss_LOC[64];

void tss_switch(uint32_t pid)
{
  102f93:	57                   	push   %edi
  102f94:	56                   	push   %esi
  102f95:	53                   	push   %ebx
  102f96:	e8 71 d3 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  102f9b:	81 c3 65 80 00 00    	add    $0x8065,%ebx
    gdt_LOC[CPU_GDT_TSS >> 3] =
        SEGDESC16(STS_T32A, (uint32_t) (&tss_LOC[pid]), sizeof(tss_t) - 1, 0);
  102fa1:	69 44 24 10 ec 00 00 	imul   $0xec,0x10(%esp),%eax
  102fa8:	00 
  102fa9:	8d 84 03 00 a0 02 00 	lea    0x2a000(%ebx,%eax,1),%eax
  102fb0:	89 c2                	mov    %eax,%edx
  102fb2:	c1 ea 10             	shr    $0x10,%edx
  102fb5:	89 c1                	mov    %eax,%ecx
  102fb7:	c1 e9 18             	shr    $0x18,%ecx
  102fba:	89 cf                	mov    %ecx,%edi
    gdt_LOC[CPU_GDT_TSS >> 3] =
  102fbc:	66 c7 83 28 db 02 00 	movw   $0xeb,0x2db28(%ebx)
  102fc3:	eb 00 
  102fc5:	66 89 83 2a db 02 00 	mov    %ax,0x2db2a(%ebx)
  102fcc:	88 93 2c db 02 00    	mov    %dl,0x2db2c(%ebx)
  102fd2:	0f b6 83 2d db 02 00 	movzbl 0x2db2d(%ebx),%eax
  102fd9:	83 e0 f0             	and    $0xfffffff0,%eax
  102fdc:	89 c2                	mov    %eax,%edx
  102fde:	83 ca 09             	or     $0x9,%edx
  102fe1:	88 93 2d db 02 00    	mov    %dl,0x2db2d(%ebx)
  102fe7:	83 c8 19             	or     $0x19,%eax
  102fea:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)
  102ff0:	83 e0 9f             	and    $0xffffff9f,%eax
  102ff3:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)
  102ff9:	83 c8 80             	or     $0xffffff80,%eax
  102ffc:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)
  103002:	0f b6 93 2e db 02 00 	movzbl 0x2db2e(%ebx),%edx
  103009:	89 d6                	mov    %edx,%esi
  10300b:	83 e6 f0             	and    $0xfffffff0,%esi
  10300e:	89 f1                	mov    %esi,%ecx
  103010:	88 8b 2e db 02 00    	mov    %cl,0x2db2e(%ebx)
  103016:	89 d6                	mov    %edx,%esi
  103018:	83 e6 e0             	and    $0xffffffe0,%esi
  10301b:	89 f1                	mov    %esi,%ecx
  10301d:	88 8b 2e db 02 00    	mov    %cl,0x2db2e(%ebx)
  103023:	83 e2 c0             	and    $0xffffffc0,%edx
  103026:	88 93 2e db 02 00    	mov    %dl,0x2db2e(%ebx)
  10302c:	83 ca 40             	or     $0x40,%edx
  10302f:	88 93 2e db 02 00    	mov    %dl,0x2db2e(%ebx)
  103035:	83 e2 7f             	and    $0x7f,%edx
  103038:	88 93 2e db 02 00    	mov    %dl,0x2db2e(%ebx)
  10303e:	89 f9                	mov    %edi,%ecx
  103040:	88 8b 2f db 02 00    	mov    %cl,0x2db2f(%ebx)
    gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  103046:	83 e0 ef             	and    $0xffffffef,%eax
  103049:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)
    ltr(CPU_GDT_TSS);
  10304f:	83 ec 0c             	sub    $0xc,%esp
  103052:	6a 28                	push   $0x28
  103054:	e8 d2 04 00 00       	call   10352b <ltr>
}
  103059:	83 c4 10             	add    $0x10,%esp
  10305c:	5b                   	pop    %ebx
  10305d:	5e                   	pop    %esi
  10305e:	5f                   	pop    %edi
  10305f:	c3                   	ret    

00103060 <seg_init>:

void seg_init(void)
{
  103060:	57                   	push   %edi
  103061:	56                   	push   %esi
  103062:	53                   	push   %ebx
  103063:	83 ec 18             	sub    $0x18,%esp
  103066:	e8 a1 d2 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10306b:	81 c3 95 7f 00 00    	add    $0x7f95,%ebx
    /* clear BSS */
    extern uint8_t end[], edata[];
    memzero(edata, bsp_kstack - edata);
  103071:	8d b3 00 e0 06 00    	lea    0x6e000(%ebx),%esi
  103077:	c7 c0 74 27 13 00    	mov    $0x132774,%eax
  10307d:	89 f2                	mov    %esi,%edx
  10307f:	29 c2                	sub    %eax,%edx
  103081:	52                   	push   %edx
  103082:	50                   	push   %eax
  103083:	e8 41 f8 ff ff       	call   1028c9 <memzero>
    memzero(bsp_kstack + 4096, end - bsp_kstack - 4096);
  103088:	c7 c0 20 cc df 00    	mov    $0xdfcc20,%eax
  10308e:	29 f0                	sub    %esi,%eax
  103090:	2d 00 10 00 00       	sub    $0x1000,%eax
  103095:	83 c4 08             	add    $0x8,%esp
  103098:	50                   	push   %eax
  103099:	8d b6 00 10 00 00    	lea    0x1000(%esi),%esi
  10309f:	56                   	push   %esi
  1030a0:	e8 24 f8 ff ff       	call   1028c9 <memzero>

    /* setup GDT */
    gdt_LOC[0] = SEGDESC_NULL;
  1030a5:	c7 83 00 db 02 00 00 	movl   $0x0,0x2db00(%ebx)
  1030ac:	00 00 00 
  1030af:	c7 83 04 db 02 00 00 	movl   $0x0,0x2db04(%ebx)
  1030b6:	00 00 00 
    /* 0x08: kernel code */
    gdt_LOC[CPU_GDT_KCODE >> 3] =
  1030b9:	66 c7 83 08 db 02 00 	movw   $0xffff,0x2db08(%ebx)
  1030c0:	ff ff 
  1030c2:	66 c7 83 0a db 02 00 	movw   $0x0,0x2db0a(%ebx)
  1030c9:	00 00 
  1030cb:	c6 83 0c db 02 00 00 	movb   $0x0,0x2db0c(%ebx)
  1030d2:	0f b6 83 0d db 02 00 	movzbl 0x2db0d(%ebx),%eax
  1030d9:	83 e0 f0             	and    $0xfffffff0,%eax
  1030dc:	89 c2                	mov    %eax,%edx
  1030de:	83 ca 0a             	or     $0xa,%edx
  1030e1:	88 93 0d db 02 00    	mov    %dl,0x2db0d(%ebx)
  1030e7:	83 c8 1a             	or     $0x1a,%eax
  1030ea:	88 83 0d db 02 00    	mov    %al,0x2db0d(%ebx)
  1030f0:	83 e0 9f             	and    $0xffffff9f,%eax
  1030f3:	88 83 0d db 02 00    	mov    %al,0x2db0d(%ebx)
  1030f9:	83 c8 80             	or     $0xffffff80,%eax
  1030fc:	88 83 0d db 02 00    	mov    %al,0x2db0d(%ebx)
  103102:	0f b6 83 0e db 02 00 	movzbl 0x2db0e(%ebx),%eax
  103109:	83 c8 0f             	or     $0xf,%eax
  10310c:	88 83 0e db 02 00    	mov    %al,0x2db0e(%ebx)
  103112:	89 c2                	mov    %eax,%edx
  103114:	83 e2 ef             	and    $0xffffffef,%edx
  103117:	88 93 0e db 02 00    	mov    %dl,0x2db0e(%ebx)
  10311d:	83 e0 cf             	and    $0xffffffcf,%eax
  103120:	88 83 0e db 02 00    	mov    %al,0x2db0e(%ebx)
  103126:	89 c2                	mov    %eax,%edx
  103128:	83 ca 40             	or     $0x40,%edx
  10312b:	88 93 0e db 02 00    	mov    %dl,0x2db0e(%ebx)
  103131:	83 c8 c0             	or     $0xffffffc0,%eax
  103134:	88 83 0e db 02 00    	mov    %al,0x2db0e(%ebx)
  10313a:	c6 83 0f db 02 00 00 	movb   $0x0,0x2db0f(%ebx)
        SEGDESC32(STA_X | STA_R, 0x0, 0xffffffff, 0);
    /* 0x10: kernel data */
    gdt_LOC[CPU_GDT_KDATA >> 3] = SEGDESC32(STA_W, 0x0, 0xffffffff, 0);
  103141:	66 c7 83 10 db 02 00 	movw   $0xffff,0x2db10(%ebx)
  103148:	ff ff 
  10314a:	66 c7 83 12 db 02 00 	movw   $0x0,0x2db12(%ebx)
  103151:	00 00 
  103153:	c6 83 14 db 02 00 00 	movb   $0x0,0x2db14(%ebx)
  10315a:	0f b6 83 15 db 02 00 	movzbl 0x2db15(%ebx),%eax
  103161:	83 e0 f0             	and    $0xfffffff0,%eax
  103164:	89 c2                	mov    %eax,%edx
  103166:	83 ca 02             	or     $0x2,%edx
  103169:	88 93 15 db 02 00    	mov    %dl,0x2db15(%ebx)
  10316f:	83 c8 12             	or     $0x12,%eax
  103172:	88 83 15 db 02 00    	mov    %al,0x2db15(%ebx)
  103178:	83 e0 9f             	and    $0xffffff9f,%eax
  10317b:	88 83 15 db 02 00    	mov    %al,0x2db15(%ebx)
  103181:	83 c8 80             	or     $0xffffff80,%eax
  103184:	88 83 15 db 02 00    	mov    %al,0x2db15(%ebx)
  10318a:	0f b6 83 16 db 02 00 	movzbl 0x2db16(%ebx),%eax
  103191:	83 c8 0f             	or     $0xf,%eax
  103194:	88 83 16 db 02 00    	mov    %al,0x2db16(%ebx)
  10319a:	89 c2                	mov    %eax,%edx
  10319c:	83 e2 ef             	and    $0xffffffef,%edx
  10319f:	88 93 16 db 02 00    	mov    %dl,0x2db16(%ebx)
  1031a5:	83 e0 cf             	and    $0xffffffcf,%eax
  1031a8:	88 83 16 db 02 00    	mov    %al,0x2db16(%ebx)
  1031ae:	89 c2                	mov    %eax,%edx
  1031b0:	83 ca 40             	or     $0x40,%edx
  1031b3:	88 93 16 db 02 00    	mov    %dl,0x2db16(%ebx)
  1031b9:	83 c8 c0             	or     $0xffffffc0,%eax
  1031bc:	88 83 16 db 02 00    	mov    %al,0x2db16(%ebx)
  1031c2:	c6 83 17 db 02 00 00 	movb   $0x0,0x2db17(%ebx)
    /* 0x18: user code */
    gdt_LOC[CPU_GDT_UCODE >> 3] =
  1031c9:	66 c7 83 18 db 02 00 	movw   $0xffff,0x2db18(%ebx)
  1031d0:	ff ff 
  1031d2:	66 c7 83 1a db 02 00 	movw   $0x0,0x2db1a(%ebx)
  1031d9:	00 00 
  1031db:	c6 83 1c db 02 00 00 	movb   $0x0,0x2db1c(%ebx)
  1031e2:	0f b6 83 1d db 02 00 	movzbl 0x2db1d(%ebx),%eax
  1031e9:	83 e0 f0             	and    $0xfffffff0,%eax
  1031ec:	89 c2                	mov    %eax,%edx
  1031ee:	83 ca 0a             	or     $0xa,%edx
  1031f1:	88 93 1d db 02 00    	mov    %dl,0x2db1d(%ebx)
  1031f7:	89 c2                	mov    %eax,%edx
  1031f9:	83 ca 1a             	or     $0x1a,%edx
  1031fc:	88 93 1d db 02 00    	mov    %dl,0x2db1d(%ebx)
  103202:	83 c8 7a             	or     $0x7a,%eax
  103205:	88 83 1d db 02 00    	mov    %al,0x2db1d(%ebx)
  10320b:	c6 83 1d db 02 00 fa 	movb   $0xfa,0x2db1d(%ebx)
  103212:	0f b6 83 1e db 02 00 	movzbl 0x2db1e(%ebx),%eax
  103219:	83 c8 0f             	or     $0xf,%eax
  10321c:	88 83 1e db 02 00    	mov    %al,0x2db1e(%ebx)
  103222:	89 c2                	mov    %eax,%edx
  103224:	83 e2 ef             	and    $0xffffffef,%edx
  103227:	88 93 1e db 02 00    	mov    %dl,0x2db1e(%ebx)
  10322d:	83 e0 cf             	and    $0xffffffcf,%eax
  103230:	88 83 1e db 02 00    	mov    %al,0x2db1e(%ebx)
  103236:	89 c2                	mov    %eax,%edx
  103238:	83 ca 40             	or     $0x40,%edx
  10323b:	88 93 1e db 02 00    	mov    %dl,0x2db1e(%ebx)
  103241:	83 c8 c0             	or     $0xffffffc0,%eax
  103244:	88 83 1e db 02 00    	mov    %al,0x2db1e(%ebx)
  10324a:	c6 83 1f db 02 00 00 	movb   $0x0,0x2db1f(%ebx)
        SEGDESC32(STA_X | STA_R, 0x00000000, 0xffffffff, 3);
    /* 0x20: user data */
    gdt_LOC[CPU_GDT_UDATA >> 3] =
  103251:	66 c7 83 20 db 02 00 	movw   $0xffff,0x2db20(%ebx)
  103258:	ff ff 
  10325a:	66 c7 83 22 db 02 00 	movw   $0x0,0x2db22(%ebx)
  103261:	00 00 
  103263:	c6 83 24 db 02 00 00 	movb   $0x0,0x2db24(%ebx)
  10326a:	0f b6 83 25 db 02 00 	movzbl 0x2db25(%ebx),%eax
  103271:	83 e0 f0             	and    $0xfffffff0,%eax
  103274:	89 c2                	mov    %eax,%edx
  103276:	83 ca 02             	or     $0x2,%edx
  103279:	88 93 25 db 02 00    	mov    %dl,0x2db25(%ebx)
  10327f:	89 c2                	mov    %eax,%edx
  103281:	83 ca 12             	or     $0x12,%edx
  103284:	88 93 25 db 02 00    	mov    %dl,0x2db25(%ebx)
  10328a:	83 c8 72             	or     $0x72,%eax
  10328d:	88 83 25 db 02 00    	mov    %al,0x2db25(%ebx)
  103293:	c6 83 25 db 02 00 f2 	movb   $0xf2,0x2db25(%ebx)
  10329a:	0f b6 83 26 db 02 00 	movzbl 0x2db26(%ebx),%eax
  1032a1:	83 c8 0f             	or     $0xf,%eax
  1032a4:	88 83 26 db 02 00    	mov    %al,0x2db26(%ebx)
  1032aa:	89 c2                	mov    %eax,%edx
  1032ac:	83 e2 ef             	and    $0xffffffef,%edx
  1032af:	88 93 26 db 02 00    	mov    %dl,0x2db26(%ebx)
  1032b5:	83 e0 cf             	and    $0xffffffcf,%eax
  1032b8:	88 83 26 db 02 00    	mov    %al,0x2db26(%ebx)
  1032be:	89 c2                	mov    %eax,%edx
  1032c0:	83 ca 40             	or     $0x40,%edx
  1032c3:	88 93 26 db 02 00    	mov    %dl,0x2db26(%ebx)
  1032c9:	83 c8 c0             	or     $0xffffffc0,%eax
  1032cc:	88 83 26 db 02 00    	mov    %al,0x2db26(%ebx)
  1032d2:	c6 83 27 db 02 00 00 	movb   $0x0,0x2db27(%ebx)
        SEGDESC32(STA_W, 0x00000000, 0xffffffff, 3);

    /* setup TSS */
    tss0.ts_esp0 = (uint32_t) bsp_kstack + 4096;
  1032d9:	89 b3 04 f0 06 00    	mov    %esi,0x6f004(%ebx)
    tss0.ts_ss0 = CPU_GDT_KDATA;
  1032df:	66 c7 83 08 f0 06 00 	movw   $0x10,0x6f008(%ebx)
  1032e6:	10 00 
    gdt_LOC[CPU_GDT_TSS >> 3] =
  1032e8:	66 c7 83 28 db 02 00 	movw   $0xeb,0x2db28(%ebx)
  1032ef:	eb 00 
  1032f1:	8d 8b 00 f0 06 00    	lea    0x6f000(%ebx),%ecx
  1032f7:	66 89 8b 2a db 02 00 	mov    %cx,0x2db2a(%ebx)
        SEGDESC16(STS_T32A, (uint32_t) (&tss0), sizeof(tss_t) - 1, 0);
  1032fe:	89 c8                	mov    %ecx,%eax
  103300:	c1 e8 10             	shr    $0x10,%eax
    gdt_LOC[CPU_GDT_TSS >> 3] =
  103303:	88 83 2c db 02 00    	mov    %al,0x2db2c(%ebx)
  103309:	0f b6 83 2d db 02 00 	movzbl 0x2db2d(%ebx),%eax
  103310:	83 e0 f0             	and    $0xfffffff0,%eax
  103313:	89 c2                	mov    %eax,%edx
  103315:	83 ca 09             	or     $0x9,%edx
  103318:	88 93 2d db 02 00    	mov    %dl,0x2db2d(%ebx)
  10331e:	83 c8 19             	or     $0x19,%eax
  103321:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)
  103327:	83 e0 9f             	and    $0xffffff9f,%eax
  10332a:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)
  103330:	83 c8 80             	or     $0xffffff80,%eax
  103333:	89 c7                	mov    %eax,%edi
  103335:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)
  10333b:	0f b6 93 2e db 02 00 	movzbl 0x2db2e(%ebx),%edx
  103342:	89 d6                	mov    %edx,%esi
  103344:	83 e6 f0             	and    $0xfffffff0,%esi
  103347:	89 f0                	mov    %esi,%eax
  103349:	88 83 2e db 02 00    	mov    %al,0x2db2e(%ebx)
  10334f:	89 d6                	mov    %edx,%esi
  103351:	83 e6 e0             	and    $0xffffffe0,%esi
  103354:	89 f0                	mov    %esi,%eax
  103356:	88 83 2e db 02 00    	mov    %al,0x2db2e(%ebx)
  10335c:	83 e2 c0             	and    $0xffffffc0,%edx
  10335f:	88 93 2e db 02 00    	mov    %dl,0x2db2e(%ebx)
  103365:	83 ca 40             	or     $0x40,%edx
  103368:	88 93 2e db 02 00    	mov    %dl,0x2db2e(%ebx)
  10336e:	83 e2 7f             	and    $0x7f,%edx
  103371:	88 93 2e db 02 00    	mov    %dl,0x2db2e(%ebx)
        SEGDESC16(STS_T32A, (uint32_t) (&tss0), sizeof(tss_t) - 1, 0);
  103377:	c1 e9 18             	shr    $0x18,%ecx
    gdt_LOC[CPU_GDT_TSS >> 3] =
  10337a:	88 8b 2f db 02 00    	mov    %cl,0x2db2f(%ebx)
    gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  103380:	89 f8                	mov    %edi,%eax
  103382:	83 e0 ef             	and    $0xffffffef,%eax
  103385:	88 83 2d db 02 00    	mov    %al,0x2db2d(%ebx)

    pseudodesc_t gdt_desc = {
  10338b:	66 c7 44 24 1a 2f 00 	movw   $0x2f,0x1a(%esp)
        .pd_lim = sizeof(gdt_LOC) - 1,
        .pd_base = (uint32_t) gdt_LOC
  103392:	8d 83 00 db 02 00    	lea    0x2db00(%ebx),%eax
    pseudodesc_t gdt_desc = {
  103398:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    };
    asm volatile ("lgdt %0" :: "m" (gdt_desc));
  10339c:	0f 01 54 24 1a       	lgdtl  0x1a(%esp)
    asm volatile ("movw %%ax,%%gs" :: "a" (CPU_GDT_KDATA));
  1033a1:	b8 10 00 00 00       	mov    $0x10,%eax
  1033a6:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax,%%fs" :: "a" (CPU_GDT_KDATA));
  1033a8:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax,%%es" :: "a" (CPU_GDT_KDATA));
  1033aa:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax,%%ds" :: "a" (CPU_GDT_KDATA));
  1033ac:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax,%%ss" :: "a" (CPU_GDT_KDATA));
  1033ae:	8e d0                	mov    %eax,%ss
    /* reload %cs */
    asm volatile ("ljmp %0,$1f\n 1:\n" :: "i" (CPU_GDT_KCODE));
  1033b0:	ea b7 33 10 00 08 00 	ljmp   $0x8,$0x1033b7

    /*
     * Load a null LDT.
     */
    lldt(0);
  1033b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1033be:	e8 dc 00 00 00       	call   10349f <lldt>

    /*
     * Load the bootstrap TSS.
     */
    ltr(CPU_GDT_TSS);
  1033c3:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
  1033ca:	e8 5c 01 00 00       	call   10352b <ltr>

    /*
     * Initialize all TSS structures for processes.
     */
    unsigned int pid;
    memzero(tss_LOC, sizeof(tss_t) * 64);
  1033cf:	83 c4 08             	add    $0x8,%esp
  1033d2:	68 00 3b 00 00       	push   $0x3b00
  1033d7:	8d 83 00 a0 02 00    	lea    0x2a000(%ebx),%eax
  1033dd:	50                   	push   %eax
  1033de:	e8 e6 f4 ff ff       	call   1028c9 <memzero>
    memzero(STACK_LOC, sizeof(char) * 64 * 4096);
  1033e3:	83 c4 08             	add    $0x8,%esp
  1033e6:	68 00 00 04 00       	push   $0x40000
  1033eb:	8d 83 00 e0 02 00    	lea    0x2e000(%ebx),%eax
  1033f1:	50                   	push   %eax
  1033f2:	e8 d2 f4 ff ff       	call   1028c9 <memzero>
    for (pid = 0; pid < 64; pid++) {
  1033f7:	83 c4 10             	add    $0x10,%esp
  1033fa:	be 00 00 00 00       	mov    $0x0,%esi
  1033ff:	eb 4a                	jmp    10344b <seg_init+0x3eb>
        tss_LOC[pid].ts_esp0 = (uint32_t) STACK_LOC[pid] + 4096;
  103401:	89 f0                	mov    %esi,%eax
  103403:	c1 e0 0c             	shl    $0xc,%eax
  103406:	8d 94 03 00 f0 02 00 	lea    0x2f000(%ebx,%eax,1),%edx
  10340d:	69 c6 ec 00 00 00    	imul   $0xec,%esi,%eax
  103413:	8d bc 03 00 a0 02 00 	lea    0x2a000(%ebx,%eax,1),%edi
  10341a:	89 57 04             	mov    %edx,0x4(%edi)
        tss_LOC[pid].ts_ss0 = CPU_GDT_KDATA;
  10341d:	66 c7 47 08 10 00    	movw   $0x10,0x8(%edi)
        tss_LOC[pid].ts_iomb = offsetof(tss_t, ts_iopm);
  103423:	66 c7 47 66 68 00    	movw   $0x68,0x66(%edi)
        memzero(tss_LOC[pid].ts_iopm, sizeof(uint8_t) * 128);
  103429:	8d 84 03 68 a0 02 00 	lea    0x2a068(%ebx,%eax,1),%eax
  103430:	83 ec 08             	sub    $0x8,%esp
  103433:	68 80 00 00 00       	push   $0x80
  103438:	50                   	push   %eax
  103439:	e8 8b f4 ff ff       	call   1028c9 <memzero>
        tss_LOC[pid].ts_iopm[128] = 0xff;
  10343e:	c6 87 e8 00 00 00 ff 	movb   $0xff,0xe8(%edi)
    for (pid = 0; pid < 64; pid++) {
  103445:	83 c6 01             	add    $0x1,%esi
  103448:	83 c4 10             	add    $0x10,%esp
  10344b:	83 fe 3f             	cmp    $0x3f,%esi
  10344e:	76 b1                	jbe    103401 <seg_init+0x3a1>
    }
}
  103450:	83 c4 10             	add    $0x10,%esp
  103453:	5b                   	pop    %ebx
  103454:	5e                   	pop    %esi
  103455:	5f                   	pop    %edi
  103456:	c3                   	ret    

00103457 <max>:
#include "types.h"

uint32_t max(uint32_t a, uint32_t b)
{
  103457:	8b 44 24 08          	mov    0x8(%esp),%eax
    return (a > b) ? a : b;
  10345b:	8b 54 24 04          	mov    0x4(%esp),%edx
  10345f:	39 d0                	cmp    %edx,%eax
  103461:	0f 42 c2             	cmovb  %edx,%eax
}
  103464:	c3                   	ret    

00103465 <min>:

uint32_t min(uint32_t a, uint32_t b)
{
  103465:	8b 44 24 08          	mov    0x8(%esp),%eax
    return (a < b) ? a : b;
  103469:	8b 54 24 04          	mov    0x4(%esp),%edx
  10346d:	39 d0                	cmp    %edx,%eax
  10346f:	0f 47 c2             	cmova  %edx,%eax
}
  103472:	c3                   	ret    

00103473 <rounddown>:

uint32_t rounddown(uint32_t a, uint32_t n)
{
  103473:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    return a - a % n;
  103477:	89 c8                	mov    %ecx,%eax
  103479:	ba 00 00 00 00       	mov    $0x0,%edx
  10347e:	f7 74 24 08          	divl   0x8(%esp)
  103482:	89 c8                	mov    %ecx,%eax
  103484:	29 d0                	sub    %edx,%eax
}
  103486:	c3                   	ret    

00103487 <roundup>:

uint32_t roundup(uint32_t a, uint32_t n)
{
  103487:	8b 54 24 08          	mov    0x8(%esp),%edx
    return rounddown(a + n - 1, n);
  10348b:	89 d0                	mov    %edx,%eax
  10348d:	03 44 24 04          	add    0x4(%esp),%eax
  103491:	52                   	push   %edx
  103492:	83 e8 01             	sub    $0x1,%eax
  103495:	50                   	push   %eax
  103496:	e8 d8 ff ff ff       	call   103473 <rounddown>
  10349b:	83 c4 08             	add    $0x8,%esp
}
  10349e:	c3                   	ret    

0010349f <lldt>:
#include <lib/string.h>
#include "x86.h"

gcc_inline void lldt(uint16_t sel)
{
    __asm __volatile ("lldt %0" :: "r" (sel));
  10349f:	0f b7 44 24 04       	movzwl 0x4(%esp),%eax
  1034a4:	0f 00 d0             	lldt   %ax
}
  1034a7:	c3                   	ret    

001034a8 <cli>:

gcc_inline void cli(void)
{
    __asm __volatile ("cli" ::: "memory");
  1034a8:	fa                   	cli    
}
  1034a9:	c3                   	ret    

001034aa <sti>:

gcc_inline void sti(void)
{
    __asm __volatile ("sti; nop");
  1034aa:	fb                   	sti    
  1034ab:	90                   	nop
}
  1034ac:	c3                   	ret    

001034ad <rdmsr>:

gcc_inline uint64_t rdmsr(uint32_t msr)
{
    uint64_t rv;
    __asm __volatile ("rdmsr"
  1034ad:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1034b1:	0f 32                	rdmsr  
                      : "=A" (rv)
                      : "c" (msr));
    return rv;
}
  1034b3:	c3                   	ret    

001034b4 <wrmsr>:

gcc_inline void wrmsr(uint32_t msr, uint64_t newval)
{
    __asm __volatile ("wrmsr" :: "A" (newval), "c" (msr));
  1034b4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1034b8:	8b 44 24 08          	mov    0x8(%esp),%eax
  1034bc:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1034c0:	0f 30                	wrmsr  
}
  1034c2:	c3                   	ret    

001034c3 <halt>:

gcc_inline void halt(void)
{
    __asm __volatile ("hlt");
  1034c3:	f4                   	hlt    
}
  1034c4:	c3                   	ret    

001034c5 <rdtsc>:

gcc_inline uint64_t rdtsc(void)
{
    uint64_t rv;

    __asm __volatile ("rdtsc" : "=A" (rv));
  1034c5:	0f 31                	rdtsc  
    return (rv);
}
  1034c7:	c3                   	ret    

001034c8 <enable_sse>:
}

gcc_inline uint32_t rcr4(void)
{
    uint32_t cr4;
    __asm __volatile ("movl %%cr4,%0" : "=r" (cr4));
  1034c8:	0f 20 e0             	mov    %cr4,%eax
    cr4 = rcr4() | CR4_OSFXSR | CR4_OSXMMEXCPT;
  1034cb:	80 cc 06             	or     $0x6,%ah
    FENCE();
  1034ce:	0f ae f0             	mfence 
    __asm __volatile ("movl %0,%%cr4" :: "r" (val));
  1034d1:	0f 22 e0             	mov    %eax,%cr4
    __asm __volatile ("movl %%cr0,%0" : "=r" (val));
  1034d4:	0f 20 c0             	mov    %cr0,%eax
    FENCE();
  1034d7:	0f ae f0             	mfence 
}
  1034da:	c3                   	ret    

001034db <cpuid>:
{
  1034db:	55                   	push   %ebp
  1034dc:	57                   	push   %edi
  1034dd:	56                   	push   %esi
  1034de:	53                   	push   %ebx
  1034df:	8b 44 24 14          	mov    0x14(%esp),%eax
  1034e3:	8b 74 24 18          	mov    0x18(%esp),%esi
  1034e7:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
  1034eb:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    __asm __volatile ("cpuid"
  1034ef:	0f a2                	cpuid  
    if (eaxp)
  1034f1:	85 f6                	test   %esi,%esi
  1034f3:	74 02                	je     1034f7 <cpuid+0x1c>
        *eaxp = eax;
  1034f5:	89 06                	mov    %eax,(%esi)
    if (ebxp)
  1034f7:	85 ff                	test   %edi,%edi
  1034f9:	74 02                	je     1034fd <cpuid+0x22>
        *ebxp = ebx;
  1034fb:	89 1f                	mov    %ebx,(%edi)
    if (ecxp)
  1034fd:	85 ed                	test   %ebp,%ebp
  1034ff:	74 03                	je     103504 <cpuid+0x29>
        *ecxp = ecx;
  103501:	89 4d 00             	mov    %ecx,0x0(%ebp)
    if (edxp)
  103504:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  103509:	74 06                	je     103511 <cpuid+0x36>
        *edxp = edx;
  10350b:	8b 44 24 24          	mov    0x24(%esp),%eax
  10350f:	89 10                	mov    %edx,(%eax)
}
  103511:	5b                   	pop    %ebx
  103512:	5e                   	pop    %esi
  103513:	5f                   	pop    %edi
  103514:	5d                   	pop    %ebp
  103515:	c3                   	ret    

00103516 <rcr3>:
    __asm __volatile ("movl %%cr3,%0" : "=r" (val));
  103516:	0f 20 d8             	mov    %cr3,%eax
}
  103519:	c3                   	ret    

0010351a <outl>:
    __asm __volatile ("outl %0,%w1" :: "a" (data), "d" (port));
  10351a:	8b 54 24 04          	mov    0x4(%esp),%edx
  10351e:	8b 44 24 08          	mov    0x8(%esp),%eax
  103522:	ef                   	out    %eax,(%dx)
}
  103523:	c3                   	ret    

00103524 <inl>:
    __asm __volatile ("inl %w1,%0" : "=a" (data) : "d" (port));
  103524:	8b 54 24 04          	mov    0x4(%esp),%edx
  103528:	ed                   	in     (%dx),%eax
}
  103529:	c3                   	ret    

0010352a <smp_wmb>:
}
  10352a:	c3                   	ret    

0010352b <ltr>:
    __asm __volatile ("ltr %0" :: "r" (sel));
  10352b:	0f b7 44 24 04       	movzwl 0x4(%esp),%eax
  103530:	0f 00 d8             	ltr    %ax
}
  103533:	c3                   	ret    

00103534 <lcr0>:
    __asm __volatile ("movl %0,%%cr0" :: "r" (val));
  103534:	8b 44 24 04          	mov    0x4(%esp),%eax
  103538:	0f 22 c0             	mov    %eax,%cr0
}
  10353b:	c3                   	ret    

0010353c <rcr0>:
    __asm __volatile ("movl %%cr0,%0" : "=r" (val));
  10353c:	0f 20 c0             	mov    %cr0,%eax
}
  10353f:	c3                   	ret    

00103540 <rcr2>:
    __asm __volatile ("movl %%cr2,%0" : "=r" (val));
  103540:	0f 20 d0             	mov    %cr2,%eax
}
  103543:	c3                   	ret    

00103544 <lcr3>:
    __asm __volatile ("movl %0,%%cr3" :: "r" (val));
  103544:	8b 44 24 04          	mov    0x4(%esp),%eax
  103548:	0f 22 d8             	mov    %eax,%cr3
}
  10354b:	c3                   	ret    

0010354c <lcr4>:
    __asm __volatile ("movl %0,%%cr4" :: "r" (val));
  10354c:	8b 44 24 04          	mov    0x4(%esp),%eax
  103550:	0f 22 e0             	mov    %eax,%cr4
}
  103553:	c3                   	ret    

00103554 <rcr4>:
    __asm __volatile ("movl %%cr4,%0" : "=r" (cr4));
  103554:	0f 20 e0             	mov    %cr4,%eax
    return cr4;
}
  103557:	c3                   	ret    

00103558 <inb>:

gcc_inline uint8_t inb(int port)
{
    uint8_t data;
    __asm __volatile ("inb %w1,%0"
  103558:	8b 54 24 04          	mov    0x4(%esp),%edx
  10355c:	ec                   	in     (%dx),%al
                      : "=a" (data)
                      : "d" (port));
    return data;
}
  10355d:	c3                   	ret    

0010355e <insl>:

gcc_inline void insl(int port, void *addr, int cnt)
{
  10355e:	57                   	push   %edi
    __asm __volatile ("cld\n\trepne\n\tinsl"
  10355f:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  103563:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  103567:	8b 54 24 08          	mov    0x8(%esp),%edx
  10356b:	fc                   	cld    
  10356c:	f2 6d                	repnz insl (%dx),%es:(%edi)
                      : "=D" (addr), "=c" (cnt)
                      : "d" (port), "0" (addr), "1" (cnt)
                      : "memory", "cc");
}
  10356e:	5f                   	pop    %edi
  10356f:	c3                   	ret    

00103570 <outb>:

gcc_inline void outb(int port, uint8_t data)
{
    __asm __volatile ("outb %0,%w1" :: "a" (data), "d" (port));
  103570:	8b 54 24 04          	mov    0x4(%esp),%edx
  103574:	0f b6 44 24 08       	movzbl 0x8(%esp),%eax
  103579:	ee                   	out    %al,(%dx)
}
  10357a:	c3                   	ret    

0010357b <outsw>:

gcc_inline void outsw(int port, const void *addr, int cnt)
{
  10357b:	56                   	push   %esi
    __asm __volatile ("cld\n\trepne\n\toutsw"
  10357c:	8b 74 24 0c          	mov    0xc(%esp),%esi
  103580:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  103584:	8b 54 24 08          	mov    0x8(%esp),%edx
  103588:	fc                   	cld    
  103589:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
                      : "=S" (addr), "=c" (cnt)
                      : "d" (port), "0" (addr), "1" (cnt)
                      : "cc");
}
  10358c:	5e                   	pop    %esi
  10358d:	c3                   	ret    

0010358e <mon_help>:
extern void set_curid(unsigned int curid);
extern void kctx_switch(unsigned int from_pid, unsigned int to_pid);

/***** Implementations of basic kernel monitor commands *****/
int mon_help(int argc, char **argv, struct Trapframe *tf)
{
  10358e:	56                   	push   %esi
  10358f:	53                   	push   %ebx
  103590:	83 ec 04             	sub    $0x4,%esp
  103593:	e8 74 cd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  103598:	81 c3 68 7a 00 00    	add    $0x7a68,%ebx
    int i;

    for (i = 0; i < NCOMMANDS; i++)
  10359e:	be 00 00 00 00       	mov    $0x0,%esi
  1035a3:	eb 30                	jmp    1035d5 <mon_help+0x47>
        dprintf("%s - %s\n", commands[i].name, commands[i].desc);
  1035a5:	83 ec 04             	sub    $0x4,%esp
  1035a8:	8d 04 36             	lea    (%esi,%esi,1),%eax
  1035ab:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
  1035ae:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  1035b5:	ff b4 13 c4 ff ff ff 	push   -0x3c(%ebx,%edx,1)
  1035bc:	ff b4 13 c0 ff ff ff 	push   -0x40(%ebx,%edx,1)
  1035c3:	8d 83 a8 b5 ff ff    	lea    -0x4a58(%ebx),%eax
  1035c9:	50                   	push   %eax
  1035ca:	e8 32 f5 ff ff       	call   102b01 <dprintf>
    for (i = 0; i < NCOMMANDS; i++)
  1035cf:	83 c6 01             	add    $0x1,%esi
  1035d2:	83 c4 10             	add    $0x10,%esp
  1035d5:	83 fe 02             	cmp    $0x2,%esi
  1035d8:	76 cb                	jbe    1035a5 <mon_help+0x17>
    return 0;
}
  1035da:	b8 00 00 00 00       	mov    $0x0,%eax
  1035df:	83 c4 04             	add    $0x4,%esp
  1035e2:	5b                   	pop    %ebx
  1035e3:	5e                   	pop    %esi
  1035e4:	c3                   	ret    

001035e5 <mon_kerninfo>:

int mon_kerninfo(int argc, char **argv, struct Trapframe *tf)
{
  1035e5:	57                   	push   %edi
  1035e6:	56                   	push   %esi
  1035e7:	53                   	push   %ebx
  1035e8:	e8 1f cd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1035ed:	81 c3 13 7a 00 00    	add    $0x7a13,%ebx
    extern uint8_t start[], etext[], edata[], end[];

    dprintf("Special kernel symbols:\n");
  1035f3:	83 ec 0c             	sub    $0xc,%esp
  1035f6:	8d 83 b1 b5 ff ff    	lea    -0x4a4f(%ebx),%eax
  1035fc:	50                   	push   %eax
  1035fd:	e8 ff f4 ff ff       	call   102b01 <dprintf>
    dprintf("  start  %08x\n", start);
  103602:	83 c4 08             	add    $0x8,%esp
  103605:	c7 c7 d4 3d 10 00    	mov    $0x103dd4,%edi
  10360b:	57                   	push   %edi
  10360c:	8d 83 ca b5 ff ff    	lea    -0x4a36(%ebx),%eax
  103612:	50                   	push   %eax
  103613:	e8 e9 f4 ff ff       	call   102b01 <dprintf>
    dprintf("  etext  %08x\n", etext);
  103618:	83 c4 08             	add    $0x8,%esp
  10361b:	ff b3 ec ff ff ff    	push   -0x14(%ebx)
  103621:	8d 83 d9 b5 ff ff    	lea    -0x4a27(%ebx),%eax
  103627:	50                   	push   %eax
  103628:	e8 d4 f4 ff ff       	call   102b01 <dprintf>
    dprintf("  edata  %08x\n", edata);
  10362d:	83 c4 08             	add    $0x8,%esp
  103630:	ff b3 e8 ff ff ff    	push   -0x18(%ebx)
  103636:	8d 83 e8 b5 ff ff    	lea    -0x4a18(%ebx),%eax
  10363c:	50                   	push   %eax
  10363d:	e8 bf f4 ff ff       	call   102b01 <dprintf>
    dprintf("  end    %08x\n", end);
  103642:	83 c4 08             	add    $0x8,%esp
  103645:	c7 c6 20 cc df 00    	mov    $0xdfcc20,%esi
  10364b:	56                   	push   %esi
  10364c:	8d 83 f7 b5 ff ff    	lea    -0x4a09(%ebx),%eax
  103652:	50                   	push   %eax
  103653:	e8 a9 f4 ff ff       	call   102b01 <dprintf>
    dprintf("Kernel executable memory footprint: %dKB\n",
            ROUNDUP(end - start, 1024) / 1024);
  103658:	29 fe                	sub    %edi,%esi
  10365a:	8d 86 ff 03 00 00    	lea    0x3ff(%esi),%eax
  103660:	89 c1                	mov    %eax,%ecx
  103662:	c1 f9 1f             	sar    $0x1f,%ecx
  103665:	c1 e9 16             	shr    $0x16,%ecx
  103668:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  10366b:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  103671:	29 ca                	sub    %ecx,%edx
  103673:	29 d0                	sub    %edx,%eax
    dprintf("Kernel executable memory footprint: %dKB\n",
  103675:	83 c4 08             	add    $0x8,%esp
  103678:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10367e:	85 c0                	test   %eax,%eax
  103680:	0f 49 d0             	cmovns %eax,%edx
  103683:	c1 fa 0a             	sar    $0xa,%edx
  103686:	52                   	push   %edx
  103687:	8d 83 dc b6 ff ff    	lea    -0x4924(%ebx),%eax
  10368d:	50                   	push   %eax
  10368e:	e8 6e f4 ff ff       	call   102b01 <dprintf>
    return 0;
  103693:	83 c4 10             	add    $0x10,%esp
}
  103696:	b8 00 00 00 00       	mov    $0x0,%eax
  10369b:	5b                   	pop    %ebx
  10369c:	5e                   	pop    %esi
  10369d:	5f                   	pop    %edi
  10369e:	c3                   	ret    

0010369f <mon_start_user>:
    // TODO
    return 0;
}

int mon_start_user(int argc, char **argv, struct Trapframe *tf)
{
  10369f:	57                   	push   %edi
  1036a0:	56                   	push   %esi
  1036a1:	53                   	push   %ebx
  1036a2:	e8 65 cc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1036a7:	81 c3 59 79 00 00    	add    $0x7959,%ebx
    unsigned int idle_pid;
    idle_pid = proc_create(_binary___obj_user_idle_idle_start, 10000);
  1036ad:	83 ec 08             	sub    $0x8,%esp
  1036b0:	68 10 27 00 00       	push   $0x2710
  1036b5:	ff b3 e4 ff ff ff    	push   -0x1c(%ebx)
  1036bb:	e8 b0 17 00 00       	call   104e70 <proc_create>
  1036c0:	89 c6                	mov    %eax,%esi
    KERN_DEBUG("process idle %d is created.\n", idle_pid);
  1036c2:	50                   	push   %eax
  1036c3:	8d 83 06 b6 ff ff    	lea    -0x49fa(%ebx),%eax
  1036c9:	50                   	push   %eax
  1036ca:	6a 4a                	push   $0x4a
  1036cc:	8d bb 23 b6 ff ff    	lea    -0x49dd(%ebx),%edi
  1036d2:	57                   	push   %edi
  1036d3:	e8 5d f2 ff ff       	call   102935 <debug_normal>

    KERN_INFO("Start user-space ... \n");
  1036d8:	83 c4 14             	add    $0x14,%esp
  1036db:	8d 83 36 b6 ff ff    	lea    -0x49ca(%ebx),%eax
  1036e1:	50                   	push   %eax
  1036e2:	e8 29 f2 ff ff       	call   102910 <debug_info>

    tqueue_remove(NUM_IDS, idle_pid);
  1036e7:	83 c4 08             	add    $0x8,%esp
  1036ea:	56                   	push   %esi
  1036eb:	6a 40                	push   $0x40
  1036ed:	e8 8e 16 00 00       	call   104d80 <tqueue_remove>
    tcb_set_state(idle_pid, TSTATE_RUN);
  1036f2:	83 c4 08             	add    $0x8,%esp
  1036f5:	6a 01                	push   $0x1
  1036f7:	56                   	push   %esi
  1036f8:	e8 93 14 00 00       	call   104b90 <tcb_set_state>
    set_curid(idle_pid);
  1036fd:	89 34 24             	mov    %esi,(%esp)
  103700:	e8 ab 16 00 00       	call   104db0 <set_curid>
    kctx_switch(0, idle_pid);
  103705:	83 c4 08             	add    $0x8,%esp
  103708:	56                   	push   %esi
  103709:	6a 00                	push   $0x0
  10370b:	e8 10 14 00 00       	call   104b20 <kctx_switch>

    KERN_PANIC("mon_start_user() should never reach here.\n");
  103710:	83 c4 0c             	add    $0xc,%esp
  103713:	8d 83 08 b7 ff ff    	lea    -0x48f8(%ebx),%eax
  103719:	50                   	push   %eax
  10371a:	6a 53                	push   $0x53
  10371c:	57                   	push   %edi
  10371d:	e8 4c f2 ff ff       	call   10296e <debug_panic>
    return 0;
  103722:	83 c4 10             	add    $0x10,%esp
}
  103725:	b8 00 00 00 00       	mov    $0x0,%eax
  10372a:	5b                   	pop    %ebx
  10372b:	5e                   	pop    %esi
  10372c:	5f                   	pop    %edi
  10372d:	c3                   	ret    

0010372e <runcmd>:
/***** Kernel monitor command interpreter *****/
#define WHITESPACE "\t\r\n "
#define MAXARGS    16

static int runcmd(char *buf, struct Trapframe *tf)
{
  10372e:	55                   	push   %ebp
  10372f:	57                   	push   %edi
  103730:	56                   	push   %esi
  103731:	53                   	push   %ebx
  103732:	83 ec 5c             	sub    $0x5c,%esp
  103735:	e8 d2 cb ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10373a:	81 c3 c6 78 00 00    	add    $0x78c6,%ebx
  103740:	89 c6                	mov    %eax,%esi
  103742:	89 54 24 0c          	mov    %edx,0xc(%esp)
    char *argv[MAXARGS];
    int i;

    // Parse the command buffer into whitespace-separated arguments
    argc = 0;
    argv[argc] = 0;
  103746:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  10374d:	00 
    argc = 0;
  10374e:	bf 00 00 00 00       	mov    $0x0,%edi
  103753:	eb 6d                	jmp    1037c2 <runcmd+0x94>
    while (1) {
        // gobble whitespace
        while (*buf && strchr(WHITESPACE, *buf))
  103755:	83 ec 08             	sub    $0x8,%esp
  103758:	0f be c0             	movsbl %al,%eax
  10375b:	50                   	push   %eax
  10375c:	8d 83 4d b6 ff ff    	lea    -0x49b3(%ebx),%eax
  103762:	50                   	push   %eax
  103763:	e8 40 f1 ff ff       	call   1028a8 <strchr>
  103768:	83 c4 10             	add    $0x10,%esp
  10376b:	85 c0                	test   %eax,%eax
  10376d:	74 5a                	je     1037c9 <runcmd+0x9b>
            *buf++ = 0;
  10376f:	c6 06 00             	movb   $0x0,(%esi)
  103772:	89 fd                	mov    %edi,%ebp
  103774:	8d 76 01             	lea    0x1(%esi),%esi
  103777:	eb 47                	jmp    1037c0 <runcmd+0x92>
        if (*buf == 0)
            break;

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            dprintf("Too many arguments (max %d)\n", MAXARGS);
  103779:	83 ec 08             	sub    $0x8,%esp
  10377c:	6a 10                	push   $0x10
  10377e:	8d 83 52 b6 ff ff    	lea    -0x49ae(%ebx),%eax
  103784:	50                   	push   %eax
  103785:	e8 77 f3 ff ff       	call   102b01 <dprintf>
            return 0;
  10378a:	83 c4 10             	add    $0x10,%esp
  10378d:	bf 00 00 00 00       	mov    $0x0,%edi
        if (strcmp(argv[0], commands[i].name) == 0)
            return commands[i].func(argc, argv, tf);
    }
    dprintf("Unknown command '%s'\n", argv[0]);
    return 0;
}
  103792:	89 f8                	mov    %edi,%eax
  103794:	83 c4 5c             	add    $0x5c,%esp
  103797:	5b                   	pop    %ebx
  103798:	5e                   	pop    %esi
  103799:	5f                   	pop    %edi
  10379a:	5d                   	pop    %ebp
  10379b:	c3                   	ret    
            buf++;
  10379c:	83 c6 01             	add    $0x1,%esi
        while (*buf && !strchr(WHITESPACE, *buf))
  10379f:	0f b6 06             	movzbl (%esi),%eax
  1037a2:	84 c0                	test   %al,%al
  1037a4:	74 1a                	je     1037c0 <runcmd+0x92>
  1037a6:	83 ec 08             	sub    $0x8,%esp
  1037a9:	0f be c0             	movsbl %al,%eax
  1037ac:	50                   	push   %eax
  1037ad:	8d 83 4d b6 ff ff    	lea    -0x49b3(%ebx),%eax
  1037b3:	50                   	push   %eax
  1037b4:	e8 ef f0 ff ff       	call   1028a8 <strchr>
  1037b9:	83 c4 10             	add    $0x10,%esp
  1037bc:	85 c0                	test   %eax,%eax
  1037be:	74 dc                	je     10379c <runcmd+0x6e>
            *buf++ = 0;
  1037c0:	89 ef                	mov    %ebp,%edi
        while (*buf && strchr(WHITESPACE, *buf))
  1037c2:	0f b6 06             	movzbl (%esi),%eax
  1037c5:	84 c0                	test   %al,%al
  1037c7:	75 8c                	jne    103755 <runcmd+0x27>
        if (*buf == 0)
  1037c9:	80 3e 00             	cmpb   $0x0,(%esi)
  1037cc:	74 0e                	je     1037dc <runcmd+0xae>
        if (argc == MAXARGS - 1) {
  1037ce:	83 ff 0f             	cmp    $0xf,%edi
  1037d1:	74 a6                	je     103779 <runcmd+0x4b>
        argv[argc++] = buf;
  1037d3:	8d 6f 01             	lea    0x1(%edi),%ebp
  1037d6:	89 74 bc 10          	mov    %esi,0x10(%esp,%edi,4)
        while (*buf && !strchr(WHITESPACE, *buf))
  1037da:	eb c3                	jmp    10379f <runcmd+0x71>
    argv[argc] = 0;
  1037dc:	c7 44 bc 10 00 00 00 	movl   $0x0,0x10(%esp,%edi,4)
  1037e3:	00 
    if (argc == 0)
  1037e4:	85 ff                	test   %edi,%edi
  1037e6:	74 aa                	je     103792 <runcmd+0x64>
    for (i = 0; i < NCOMMANDS; i++) {
  1037e8:	be 00 00 00 00       	mov    $0x0,%esi
  1037ed:	83 fe 02             	cmp    $0x2,%esi
  1037f0:	77 43                	ja     103835 <runcmd+0x107>
        if (strcmp(argv[0], commands[i].name) == 0)
  1037f2:	83 ec 08             	sub    $0x8,%esp
  1037f5:	8d 04 76             	lea    (%esi,%esi,2),%eax
  1037f8:	ff b4 83 c0 ff ff ff 	push   -0x40(%ebx,%eax,4)
  1037ff:	ff 74 24 1c          	push   0x1c(%esp)
  103803:	e8 7c f0 ff ff       	call   102884 <strcmp>
  103808:	83 c4 10             	add    $0x10,%esp
  10380b:	85 c0                	test   %eax,%eax
  10380d:	74 05                	je     103814 <runcmd+0xe6>
    for (i = 0; i < NCOMMANDS; i++) {
  10380f:	83 c6 01             	add    $0x1,%esi
  103812:	eb d9                	jmp    1037ed <runcmd+0xbf>
            return commands[i].func(argc, argv, tf);
  103814:	8d 04 76             	lea    (%esi,%esi,2),%eax
  103817:	83 ec 04             	sub    $0x4,%esp
  10381a:	ff 74 24 10          	push   0x10(%esp)
  10381e:	8d 54 24 18          	lea    0x18(%esp),%edx
  103822:	52                   	push   %edx
  103823:	57                   	push   %edi
  103824:	ff 94 83 c8 ff ff ff 	call   *-0x38(%ebx,%eax,4)
  10382b:	89 c7                	mov    %eax,%edi
  10382d:	83 c4 10             	add    $0x10,%esp
  103830:	e9 5d ff ff ff       	jmp    103792 <runcmd+0x64>
    dprintf("Unknown command '%s'\n", argv[0]);
  103835:	83 ec 08             	sub    $0x8,%esp
  103838:	ff 74 24 18          	push   0x18(%esp)
  10383c:	8d 83 6f b6 ff ff    	lea    -0x4991(%ebx),%eax
  103842:	50                   	push   %eax
  103843:	e8 b9 f2 ff ff       	call   102b01 <dprintf>
    return 0;
  103848:	83 c4 10             	add    $0x10,%esp
  10384b:	bf 00 00 00 00       	mov    $0x0,%edi
  103850:	e9 3d ff ff ff       	jmp    103792 <runcmd+0x64>

00103855 <mon_backtrace>:
}
  103855:	b8 00 00 00 00       	mov    $0x0,%eax
  10385a:	c3                   	ret    

0010385b <monitor>:

void monitor(struct Trapframe *tf)
{
  10385b:	57                   	push   %edi
  10385c:	56                   	push   %esi
  10385d:	53                   	push   %ebx
  10385e:	e8 a9 ca ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  103863:	81 c3 9d 77 00 00    	add    $0x779d,%ebx
  103869:	8b 74 24 10          	mov    0x10(%esp),%esi
    char *buf;

    dprintf("\n****************************************\n\n");
  10386d:	83 ec 0c             	sub    $0xc,%esp
  103870:	8d bb 34 b7 ff ff    	lea    -0x48cc(%ebx),%edi
  103876:	57                   	push   %edi
  103877:	e8 85 f2 ff ff       	call   102b01 <dprintf>
    dprintf("Welcome to the mCertiKOS kernel monitor!\n");
  10387c:	8d 83 60 b7 ff ff    	lea    -0x48a0(%ebx),%eax
  103882:	89 04 24             	mov    %eax,(%esp)
  103885:	e8 77 f2 ff ff       	call   102b01 <dprintf>
    dprintf("\n****************************************\n\n");
  10388a:	89 3c 24             	mov    %edi,(%esp)
  10388d:	e8 6f f2 ff ff       	call   102b01 <dprintf>
    dprintf("Type 'help' for a list of commands.\n");
  103892:	8d 83 8c b7 ff ff    	lea    -0x4874(%ebx),%eax
  103898:	89 04 24             	mov    %eax,(%esp)
  10389b:	e8 61 f2 ff ff       	call   102b01 <dprintf>
  1038a0:	83 c4 10             	add    $0x10,%esp

    while (1) {
        buf = (char *) readline("$> ");
  1038a3:	83 ec 0c             	sub    $0xc,%esp
  1038a6:	8d 83 85 b6 ff ff    	lea    -0x497b(%ebx),%eax
  1038ac:	50                   	push   %eax
  1038ad:	e8 7f cb ff ff       	call   100431 <readline>
        if (buf != NULL)
  1038b2:	83 c4 10             	add    $0x10,%esp
  1038b5:	85 c0                	test   %eax,%eax
  1038b7:	74 ea                	je     1038a3 <monitor+0x48>
            if (runcmd(buf, tf) < 0)
  1038b9:	89 f2                	mov    %esi,%edx
  1038bb:	e8 6e fe ff ff       	call   10372e <runcmd>
  1038c0:	85 c0                	test   %eax,%eax
  1038c2:	79 df                	jns    1038a3 <monitor+0x48>
                break;
    }
}
  1038c4:	5b                   	pop    %ebx
  1038c5:	5e                   	pop    %esi
  1038c6:	5f                   	pop    %edi
  1038c7:	c3                   	ret    

001038c8 <pt_copyin>:
                       unsigned int perm);
extern unsigned int get_ptbl_entry_by_va(unsigned int pid,
                                         unsigned int vaddr);

size_t pt_copyin(uint32_t pmap_id, uintptr_t uva, void *kva, size_t len)
{
  1038c8:	55                   	push   %ebp
  1038c9:	57                   	push   %edi
  1038ca:	56                   	push   %esi
  1038cb:	53                   	push   %ebx
  1038cc:	83 ec 1c             	sub    $0x1c,%esp
  1038cf:	e8 38 ca ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1038d4:	81 c3 2c 77 00 00    	add    $0x772c,%ebx
  1038da:	8b 6c 24 34          	mov    0x34(%esp),%ebp
  1038de:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  1038e2:	81 fd ff ff ff 3f    	cmp    $0x3fffffff,%ebp
  1038e8:	0f 86 9b 00 00 00    	jbe    103989 <pt_copyin+0xc1>
  1038ee:	8d 44 3d 00          	lea    0x0(%ebp,%edi,1),%eax
  1038f2:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1038f7:	0f 87 a0 00 00 00    	ja     10399d <pt_copyin+0xd5>
        return 0;

    if ((uintptr_t) kva + len > VM_USERHI)
  1038fd:	89 f8                	mov    %edi,%eax
  1038ff:	03 44 24 38          	add    0x38(%esp),%eax
  103903:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  103908:	0f 87 99 00 00 00    	ja     1039a7 <pt_copyin+0xdf>
        return 0;

    size_t copied = 0;
  10390e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  103915:	00 
  103916:	eb 38                	jmp    103950 <pt_copyin+0x88>
        if ((uva_pa & PTE_P) == 0) {
            alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
        }

        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  103918:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  10391d:	89 ea                	mov    %ebp,%edx
  10391f:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  103925:	09 d0                	or     %edx,%eax

        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  103927:	be 00 10 00 00       	mov    $0x1000,%esi
  10392c:	29 d6                	sub    %edx,%esi
  10392e:	39 fe                	cmp    %edi,%esi
  103930:	0f 47 f7             	cmova  %edi,%esi
            len : PAGESIZE - uva_pa % PAGESIZE;

        memcpy(kva, (void *) uva_pa, size);
  103933:	83 ec 04             	sub    $0x4,%esp
  103936:	56                   	push   %esi
  103937:	50                   	push   %eax
  103938:	ff 74 24 44          	push   0x44(%esp)
  10393c:	e8 ce ee ff ff       	call   10280f <memcpy>

        len -= size;
  103941:	29 f7                	sub    %esi,%edi
        uva += size;
  103943:	01 f5                	add    %esi,%ebp
        kva += size;
  103945:	01 74 24 48          	add    %esi,0x48(%esp)
        copied += size;
  103949:	01 74 24 1c          	add    %esi,0x1c(%esp)
  10394d:	83 c4 10             	add    $0x10,%esp
    while (len) {
  103950:	85 ff                	test   %edi,%edi
  103952:	74 3d                	je     103991 <pt_copyin+0xc9>
        uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  103954:	83 ec 08             	sub    $0x8,%esp
  103957:	55                   	push   %ebp
  103958:	ff 74 24 3c          	push   0x3c(%esp)
  10395c:	e8 6f 0c 00 00       	call   1045d0 <get_ptbl_entry_by_va>
        if ((uva_pa & PTE_P) == 0) {
  103961:	83 c4 10             	add    $0x10,%esp
  103964:	a8 01                	test   $0x1,%al
  103966:	75 b0                	jne    103918 <pt_copyin+0x50>
            alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  103968:	83 ec 04             	sub    $0x4,%esp
  10396b:	6a 07                	push   $0x7
  10396d:	55                   	push   %ebp
  10396e:	ff 74 24 3c          	push   0x3c(%esp)
  103972:	e8 e9 10 00 00       	call   104a60 <alloc_page>
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  103977:	83 c4 08             	add    $0x8,%esp
  10397a:	55                   	push   %ebp
  10397b:	ff 74 24 3c          	push   0x3c(%esp)
  10397f:	e8 4c 0c 00 00       	call   1045d0 <get_ptbl_entry_by_va>
  103984:	83 c4 10             	add    $0x10,%esp
  103987:	eb 8f                	jmp    103918 <pt_copyin+0x50>
        return 0;
  103989:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  103990:	00 
    }

    return copied;
}
  103991:	8b 44 24 0c          	mov    0xc(%esp),%eax
  103995:	83 c4 1c             	add    $0x1c,%esp
  103998:	5b                   	pop    %ebx
  103999:	5e                   	pop    %esi
  10399a:	5f                   	pop    %edi
  10399b:	5d                   	pop    %ebp
  10399c:	c3                   	ret    
        return 0;
  10399d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1039a4:	00 
  1039a5:	eb ea                	jmp    103991 <pt_copyin+0xc9>
        return 0;
  1039a7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1039ae:	00 
  1039af:	eb e0                	jmp    103991 <pt_copyin+0xc9>

001039b1 <pt_copyout>:

size_t pt_copyout(void *kva, uint32_t pmap_id, uintptr_t uva, size_t len)
{
  1039b1:	55                   	push   %ebp
  1039b2:	57                   	push   %edi
  1039b3:	56                   	push   %esi
  1039b4:	53                   	push   %ebx
  1039b5:	83 ec 1c             	sub    $0x1c,%esp
  1039b8:	e8 4f c9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1039bd:	81 c3 43 76 00 00    	add    $0x7643,%ebx
  1039c3:	8b 6c 24 38          	mov    0x38(%esp),%ebp
  1039c7:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  1039cb:	81 fd ff ff ff 3f    	cmp    $0x3fffffff,%ebp
  1039d1:	0f 86 9b 00 00 00    	jbe    103a72 <pt_copyout+0xc1>
  1039d7:	8d 44 3d 00          	lea    0x0(%ebp,%edi,1),%eax
  1039db:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1039e0:	0f 87 a0 00 00 00    	ja     103a86 <pt_copyout+0xd5>
        return 0;

    if ((uintptr_t) kva + len > VM_USERHI)
  1039e6:	89 f8                	mov    %edi,%eax
  1039e8:	03 44 24 30          	add    0x30(%esp),%eax
  1039ec:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1039f1:	0f 87 99 00 00 00    	ja     103a90 <pt_copyout+0xdf>
        return 0;

    size_t copied = 0;
  1039f7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1039fe:	00 
  1039ff:	eb 38                	jmp    103a39 <pt_copyout+0x88>
        if ((uva_pa & PTE_P) == 0) {
            alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
        }

        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  103a01:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  103a06:	89 ea                	mov    %ebp,%edx
  103a08:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  103a0e:	09 d0                	or     %edx,%eax

        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  103a10:	be 00 10 00 00       	mov    $0x1000,%esi
  103a15:	29 d6                	sub    %edx,%esi
  103a17:	39 fe                	cmp    %edi,%esi
  103a19:	0f 47 f7             	cmova  %edi,%esi
            len : PAGESIZE - uva_pa % PAGESIZE;

        memcpy((void *) uva_pa, kva, size);
  103a1c:	83 ec 04             	sub    $0x4,%esp
  103a1f:	56                   	push   %esi
  103a20:	ff 74 24 38          	push   0x38(%esp)
  103a24:	50                   	push   %eax
  103a25:	e8 e5 ed ff ff       	call   10280f <memcpy>

        len -= size;
  103a2a:	29 f7                	sub    %esi,%edi
        uva += size;
  103a2c:	01 f5                	add    %esi,%ebp
        kva += size;
  103a2e:	01 74 24 40          	add    %esi,0x40(%esp)
        copied += size;
  103a32:	01 74 24 1c          	add    %esi,0x1c(%esp)
  103a36:	83 c4 10             	add    $0x10,%esp
    while (len) {
  103a39:	85 ff                	test   %edi,%edi
  103a3b:	74 3d                	je     103a7a <pt_copyout+0xc9>
        uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  103a3d:	83 ec 08             	sub    $0x8,%esp
  103a40:	55                   	push   %ebp
  103a41:	ff 74 24 40          	push   0x40(%esp)
  103a45:	e8 86 0b 00 00       	call   1045d0 <get_ptbl_entry_by_va>
        if ((uva_pa & PTE_P) == 0) {
  103a4a:	83 c4 10             	add    $0x10,%esp
  103a4d:	a8 01                	test   $0x1,%al
  103a4f:	75 b0                	jne    103a01 <pt_copyout+0x50>
            alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  103a51:	83 ec 04             	sub    $0x4,%esp
  103a54:	6a 07                	push   $0x7
  103a56:	55                   	push   %ebp
  103a57:	ff 74 24 40          	push   0x40(%esp)
  103a5b:	e8 00 10 00 00       	call   104a60 <alloc_page>
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  103a60:	83 c4 08             	add    $0x8,%esp
  103a63:	55                   	push   %ebp
  103a64:	ff 74 24 40          	push   0x40(%esp)
  103a68:	e8 63 0b 00 00       	call   1045d0 <get_ptbl_entry_by_va>
  103a6d:	83 c4 10             	add    $0x10,%esp
  103a70:	eb 8f                	jmp    103a01 <pt_copyout+0x50>
        return 0;
  103a72:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  103a79:	00 
    }

    return copied;
}
  103a7a:	8b 44 24 0c          	mov    0xc(%esp),%eax
  103a7e:	83 c4 1c             	add    $0x1c,%esp
  103a81:	5b                   	pop    %ebx
  103a82:	5e                   	pop    %esi
  103a83:	5f                   	pop    %edi
  103a84:	5d                   	pop    %ebp
  103a85:	c3                   	ret    
        return 0;
  103a86:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  103a8d:	00 
  103a8e:	eb ea                	jmp    103a7a <pt_copyout+0xc9>
        return 0;
  103a90:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  103a97:	00 
  103a98:	eb e0                	jmp    103a7a <pt_copyout+0xc9>

00103a9a <pt_memset>:

size_t pt_memset(uint32_t pmap_id, uintptr_t va, char c, size_t len)
{
  103a9a:	55                   	push   %ebp
  103a9b:	57                   	push   %edi
  103a9c:	56                   	push   %esi
  103a9d:	53                   	push   %ebx
  103a9e:	83 ec 1c             	sub    $0x1c,%esp
  103aa1:	e8 66 c8 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  103aa6:	81 c3 5a 75 00 00    	add    $0x755a,%ebx
  103aac:	8b 6c 24 34          	mov    0x34(%esp),%ebp
  103ab0:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
  103ab4:	0f b6 44 24 38       	movzbl 0x38(%esp),%eax
  103ab9:	88 44 24 0f          	mov    %al,0xf(%esp)
    size_t set = 0;
  103abd:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  103ac4:	00 

    while (len) {
  103ac5:	eb 36                	jmp    103afd <pt_memset+0x63>
        if ((pa & PTE_P) == 0) {
            alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
            pa = get_ptbl_entry_by_va(pmap_id, va);
        }

        pa = (pa & 0xfffff000) + (va % PAGESIZE);
  103ac7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  103acc:	89 ea                	mov    %ebp,%edx
  103ace:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  103ad4:	09 d0                	or     %edx,%eax

        size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  103ad6:	be 00 10 00 00       	mov    $0x1000,%esi
  103adb:	29 d6                	sub    %edx,%esi
  103add:	39 fe                	cmp    %edi,%esi
  103adf:	0f 47 f7             	cmova  %edi,%esi
            len : PAGESIZE - pa % PAGESIZE;

        memset((void *) pa, c, size);
  103ae2:	83 ec 04             	sub    $0x4,%esp
  103ae5:	56                   	push   %esi
  103ae6:	0f be 54 24 17       	movsbl 0x17(%esp),%edx
  103aeb:	52                   	push   %edx
  103aec:	50                   	push   %eax
  103aed:	e8 67 ec ff ff       	call   102759 <memset>

        len -= size;
  103af2:	29 f7                	sub    %esi,%edi
        va += size;
  103af4:	01 f5                	add    %esi,%ebp
        set += size;
  103af6:	01 74 24 18          	add    %esi,0x18(%esp)
  103afa:	83 c4 10             	add    $0x10,%esp
    while (len) {
  103afd:	85 ff                	test   %edi,%edi
  103aff:	74 35                	je     103b36 <pt_memset+0x9c>
        uintptr_t pa = get_ptbl_entry_by_va(pmap_id, va);
  103b01:	83 ec 08             	sub    $0x8,%esp
  103b04:	55                   	push   %ebp
  103b05:	ff 74 24 3c          	push   0x3c(%esp)
  103b09:	e8 c2 0a 00 00       	call   1045d0 <get_ptbl_entry_by_va>
        if ((pa & PTE_P) == 0) {
  103b0e:	83 c4 10             	add    $0x10,%esp
  103b11:	a8 01                	test   $0x1,%al
  103b13:	75 b2                	jne    103ac7 <pt_memset+0x2d>
            alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
  103b15:	83 ec 04             	sub    $0x4,%esp
  103b18:	6a 07                	push   $0x7
  103b1a:	55                   	push   %ebp
  103b1b:	ff 74 24 3c          	push   0x3c(%esp)
  103b1f:	e8 3c 0f 00 00       	call   104a60 <alloc_page>
            pa = get_ptbl_entry_by_va(pmap_id, va);
  103b24:	83 c4 08             	add    $0x8,%esp
  103b27:	55                   	push   %ebp
  103b28:	ff 74 24 3c          	push   0x3c(%esp)
  103b2c:	e8 9f 0a 00 00       	call   1045d0 <get_ptbl_entry_by_va>
  103b31:	83 c4 10             	add    $0x10,%esp
  103b34:	eb 91                	jmp    103ac7 <pt_memset+0x2d>
    }

    return set;
}
  103b36:	8b 44 24 08          	mov    0x8(%esp),%eax
  103b3a:	83 c4 1c             	add    $0x1c,%esp
  103b3d:	5b                   	pop    %ebx
  103b3e:	5e                   	pop    %esi
  103b3f:	5f                   	pop    %edi
  103b40:	5d                   	pop    %ebp
  103b41:	c3                   	ret    

00103b42 <elf_load>:

/*
 * Load elf execution file exe to the virtual address space pmap.
 */
void elf_load(void *exe_ptr, int pid)
{
  103b42:	55                   	push   %ebp
  103b43:	57                   	push   %edi
  103b44:	56                   	push   %esi
  103b45:	53                   	push   %ebx
  103b46:	83 ec 2c             	sub    $0x2c,%esp
  103b49:	e8 be c7 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  103b4e:	81 c3 b2 74 00 00    	add    $0x74b2,%ebx
    char *strtab __attribute__((unused));
    uintptr_t exe = (uintptr_t) exe_ptr;

    eh = (elfhdr *) exe;

    KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  103b54:	8b 44 24 40          	mov    0x40(%esp),%eax
  103b58:	81 38 7f 45 4c 46    	cmpl   $0x464c457f,(%eax)
  103b5e:	75 3f                	jne    103b9f <elf_load+0x5d>
    KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  103b60:	8b 44 24 40          	mov    0x40(%esp),%eax
  103b64:	66 83 78 32 00       	cmpw   $0x0,0x32(%eax)
  103b69:	74 55                	je     103bc0 <elf_load+0x7e>

    sh = (sechdr *) ((uintptr_t) eh + eh->e_shoff);
  103b6b:	8b 44 24 40          	mov    0x40(%esp),%eax
  103b6f:	89 c2                	mov    %eax,%edx
  103b71:	03 50 20             	add    0x20(%eax),%edx
    esh = sh + eh->e_shnum;

    strtab = (char *) (exe + sh[eh->e_shstrndx].sh_offset);
  103b74:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  103b78:	8d 04 80             	lea    (%eax,%eax,4),%eax
    KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);
  103b7b:	83 7c c2 04 03       	cmpl   $0x3,0x4(%edx,%eax,8)
  103b80:	75 5f                	jne    103be1 <elf_load+0x9f>

    ph = (proghdr *) ((uintptr_t) eh + eh->e_phoff);
  103b82:	8b 44 24 40          	mov    0x40(%esp),%eax
  103b86:	89 c2                	mov    %eax,%edx
  103b88:	03 50 1c             	add    0x1c(%eax),%edx
  103b8b:	89 d5                	mov    %edx,%ebp
    eph = ph + eh->e_phnum;
  103b8d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  103b91:	c1 e0 05             	shl    $0x5,%eax
  103b94:	01 d0                	add    %edx,%eax
  103b96:	89 44 24 18          	mov    %eax,0x18(%esp)

    for (; ph < eph; ph++) {
  103b9a:	e9 09 01 00 00       	jmp    103ca8 <elf_load+0x166>
    KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  103b9f:	8d 83 d9 b7 ff ff    	lea    -0x4827(%ebx),%eax
  103ba5:	50                   	push   %eax
  103ba6:	8d 83 b8 b2 ff ff    	lea    -0x4d48(%ebx),%eax
  103bac:	50                   	push   %eax
  103bad:	6a 1e                	push   $0x1e
  103baf:	8d 83 f2 b7 ff ff    	lea    -0x480e(%ebx),%eax
  103bb5:	50                   	push   %eax
  103bb6:	e8 b3 ed ff ff       	call   10296e <debug_panic>
  103bbb:	83 c4 10             	add    $0x10,%esp
  103bbe:	eb a0                	jmp    103b60 <elf_load+0x1e>
    KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  103bc0:	8d 83 04 b8 ff ff    	lea    -0x47fc(%ebx),%eax
  103bc6:	50                   	push   %eax
  103bc7:	8d 83 b8 b2 ff ff    	lea    -0x4d48(%ebx),%eax
  103bcd:	50                   	push   %eax
  103bce:	6a 1f                	push   $0x1f
  103bd0:	8d 83 f2 b7 ff ff    	lea    -0x480e(%ebx),%eax
  103bd6:	50                   	push   %eax
  103bd7:	e8 92 ed ff ff       	call   10296e <debug_panic>
  103bdc:	83 c4 10             	add    $0x10,%esp
  103bdf:	eb 8a                	jmp    103b6b <elf_load+0x29>
    KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);
  103be1:	8d 83 24 b8 ff ff    	lea    -0x47dc(%ebx),%eax
  103be7:	50                   	push   %eax
  103be8:	8d 83 b8 b2 ff ff    	lea    -0x4d48(%ebx),%eax
  103bee:	50                   	push   %eax
  103bef:	6a 25                	push   $0x25
  103bf1:	8d 83 f2 b7 ff ff    	lea    -0x480e(%ebx),%eax
  103bf7:	50                   	push   %eax
  103bf8:	e8 71 ed ff ff       	call   10296e <debug_panic>
  103bfd:	83 c4 10             	add    $0x10,%esp
  103c00:	eb 80                	jmp    103b82 <elf_load+0x40>
        for (; va < eva; va += PAGESIZE, fa += PAGESIZE) {
            alloc_page(pid, va, perm);

            if (va < rounddown(zva, PAGESIZE)) {
                /* copy a complete page */
                pt_copyout((void *) fa, pid, va, PAGESIZE);
  103c02:	68 00 10 00 00       	push   $0x1000
  103c07:	56                   	push   %esi
  103c08:	55                   	push   %ebp
  103c09:	57                   	push   %edi
  103c0a:	e8 a2 fd ff ff       	call   1039b1 <pt_copyout>
  103c0f:	83 c4 10             	add    $0x10,%esp
  103c12:	eb 11                	jmp    103c25 <elf_load+0xe3>
                /* copy a partial page */
                pt_memset(pid, va, 0, PAGESIZE);
                pt_copyout((void *) fa, pid, va, zva - va);
            } else {
                /* zero a page */
                pt_memset(pid, va, 0, PAGESIZE);
  103c14:	68 00 10 00 00       	push   $0x1000
  103c19:	6a 00                	push   $0x0
  103c1b:	56                   	push   %esi
  103c1c:	55                   	push   %ebp
  103c1d:	e8 78 fe ff ff       	call   103a9a <pt_memset>
  103c22:	83 c4 10             	add    $0x10,%esp
        for (; va < eva; va += PAGESIZE, fa += PAGESIZE) {
  103c25:	81 c6 00 10 00 00    	add    $0x1000,%esi
  103c2b:	81 c7 00 10 00 00    	add    $0x1000,%edi
  103c31:	3b 74 24 10          	cmp    0x10(%esp),%esi
  103c35:	73 6a                	jae    103ca1 <elf_load+0x15f>
            alloc_page(pid, va, perm);
  103c37:	83 ec 04             	sub    $0x4,%esp
  103c3a:	ff 74 24 18          	push   0x18(%esp)
  103c3e:	56                   	push   %esi
  103c3f:	55                   	push   %ebp
  103c40:	e8 1b 0e 00 00       	call   104a60 <alloc_page>
            if (va < rounddown(zva, PAGESIZE)) {
  103c45:	83 c4 08             	add    $0x8,%esp
  103c48:	68 00 10 00 00       	push   $0x1000
  103c4d:	ff 74 24 18          	push   0x18(%esp)
  103c51:	e8 1d f8 ff ff       	call   103473 <rounddown>
  103c56:	83 c4 10             	add    $0x10,%esp
  103c59:	39 f0                	cmp    %esi,%eax
  103c5b:	77 a5                	ja     103c02 <elf_load+0xc0>
            } else if (va < zva && ph->p_filesz) {
  103c5d:	3b 74 24 0c          	cmp    0xc(%esp),%esi
  103c61:	73 b1                	jae    103c14 <elf_load+0xd2>
  103c63:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  103c67:	83 78 10 00          	cmpl   $0x0,0x10(%eax)
  103c6b:	74 a7                	je     103c14 <elf_load+0xd2>
                pt_memset(pid, va, 0, PAGESIZE);
  103c6d:	68 00 10 00 00       	push   $0x1000
  103c72:	6a 00                	push   $0x0
  103c74:	56                   	push   %esi
  103c75:	55                   	push   %ebp
  103c76:	e8 1f fe ff ff       	call   103a9a <pt_memset>
                pt_copyout((void *) fa, pid, va, zva - va);
  103c7b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  103c7f:	29 f0                	sub    %esi,%eax
  103c81:	50                   	push   %eax
  103c82:	56                   	push   %esi
  103c83:	55                   	push   %ebp
  103c84:	57                   	push   %edi
  103c85:	e8 27 fd ff ff       	call   1039b1 <pt_copyout>
  103c8a:	83 c4 20             	add    $0x20,%esp
  103c8d:	eb 96                	jmp    103c25 <elf_load+0xe3>
            perm |= PTE_W;
  103c8f:	c7 44 24 14 07 00 00 	movl   $0x7,0x14(%esp)
  103c96:	00 
  103c97:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
  103c9b:	8b 6c 24 44          	mov    0x44(%esp),%ebp
  103c9f:	eb 90                	jmp    103c31 <elf_load+0xef>
  103ca1:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    for (; ph < eph; ph++) {
  103ca5:	83 c5 20             	add    $0x20,%ebp
  103ca8:	3b 6c 24 18          	cmp    0x18(%esp),%ebp
  103cac:	73 6d                	jae    103d1b <elf_load+0x1d9>
        if (ph->p_type != ELF_PROG_LOAD)
  103cae:	83 7d 00 01          	cmpl   $0x1,0x0(%ebp)
  103cb2:	75 f1                	jne    103ca5 <elf_load+0x163>
        fa = (uintptr_t) eh + rounddown(ph->p_offset, PAGESIZE);
  103cb4:	83 ec 08             	sub    $0x8,%esp
  103cb7:	68 00 10 00 00       	push   $0x1000
  103cbc:	ff 75 04             	push   0x4(%ebp)
  103cbf:	e8 af f7 ff ff       	call   103473 <rounddown>
  103cc4:	03 44 24 50          	add    0x50(%esp),%eax
  103cc8:	89 c7                	mov    %eax,%edi
        va = rounddown(ph->p_va, PAGESIZE);
  103cca:	83 c4 08             	add    $0x8,%esp
  103ccd:	68 00 10 00 00       	push   $0x1000
  103cd2:	ff 75 08             	push   0x8(%ebp)
  103cd5:	e8 99 f7 ff ff       	call   103473 <rounddown>
  103cda:	89 c6                	mov    %eax,%esi
        zva = ph->p_va + ph->p_filesz;
  103cdc:	8b 45 08             	mov    0x8(%ebp),%eax
  103cdf:	89 c1                	mov    %eax,%ecx
  103ce1:	03 4d 10             	add    0x10(%ebp),%ecx
  103ce4:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
        eva = roundup(ph->p_va + ph->p_memsz, PAGESIZE);
  103ce8:	83 c4 08             	add    $0x8,%esp
  103ceb:	68 00 10 00 00       	push   $0x1000
  103cf0:	03 45 14             	add    0x14(%ebp),%eax
  103cf3:	50                   	push   %eax
  103cf4:	e8 8e f7 ff ff       	call   103487 <roundup>
  103cf9:	89 44 24 20          	mov    %eax,0x20(%esp)
        if (ph->p_flags & ELF_PROG_FLAG_WRITE)
  103cfd:	83 c4 10             	add    $0x10,%esp
  103d00:	f6 45 18 02          	testb  $0x2,0x18(%ebp)
  103d04:	75 89                	jne    103c8f <elf_load+0x14d>
        perm = PTE_U | PTE_P;
  103d06:	c7 44 24 14 05 00 00 	movl   $0x5,0x14(%esp)
  103d0d:	00 
  103d0e:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
  103d12:	8b 6c 24 44          	mov    0x44(%esp),%ebp
  103d16:	e9 16 ff ff ff       	jmp    103c31 <elf_load+0xef>
            }
        }
    }
}
  103d1b:	83 c4 2c             	add    $0x2c,%esp
  103d1e:	5b                   	pop    %ebx
  103d1f:	5e                   	pop    %esi
  103d20:	5f                   	pop    %edi
  103d21:	5d                   	pop    %ebp
  103d22:	c3                   	ret    

00103d23 <elf_entry>:

uintptr_t elf_entry(void *exe_ptr)
{
  103d23:	56                   	push   %esi
  103d24:	53                   	push   %ebx
  103d25:	83 ec 04             	sub    $0x4,%esp
  103d28:	e8 df c5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  103d2d:	81 c3 d3 72 00 00    	add    $0x72d3,%ebx
  103d33:	8b 74 24 10          	mov    0x10(%esp),%esi
    uintptr_t exe = (uintptr_t) exe_ptr;
    elfhdr *eh = (elfhdr *) exe;
    KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  103d37:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  103d3d:	75 09                	jne    103d48 <elf_entry+0x25>
    return (uintptr_t) eh->e_entry;
  103d3f:	8b 46 18             	mov    0x18(%esi),%eax
}
  103d42:	83 c4 04             	add    $0x4,%esp
  103d45:	5b                   	pop    %ebx
  103d46:	5e                   	pop    %esi
  103d47:	c3                   	ret    
    KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  103d48:	8d 83 d9 b7 ff ff    	lea    -0x4827(%ebx),%eax
  103d4e:	50                   	push   %eax
  103d4f:	8d 83 b8 b2 ff ff    	lea    -0x4d48(%ebx),%eax
  103d55:	50                   	push   %eax
  103d56:	6a 50                	push   $0x50
  103d58:	8d 83 f2 b7 ff ff    	lea    -0x480e(%ebx),%eax
  103d5e:	50                   	push   %eax
  103d5f:	e8 0a ec ff ff       	call   10296e <debug_panic>
  103d64:	83 c4 10             	add    $0x10,%esp
  103d67:	eb d6                	jmp    103d3f <elf_entry+0x1c>
  103d69:	66 90                	xchg   %ax,%ax
  103d6b:	66 90                	xchg   %ax,%ax
  103d6d:	66 90                	xchg   %ax,%ax
  103d6f:	90                   	nop

00103d70 <kern_init>:
    monitor(NULL);
#endif
}

void kern_init(uintptr_t mbi_addr)
{
  103d70:	56                   	push   %esi
  103d71:	53                   	push   %ebx
  103d72:	e8 95 c5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  103d77:	81 c3 89 72 00 00    	add    $0x7289,%ebx
  103d7d:	83 ec 10             	sub    $0x10,%esp
    thread_init(mbi_addr);
  103d80:	ff 74 24 1c          	push   0x1c(%esp)
  103d84:	e8 47 10 00 00       	call   104dd0 <thread_init>

    KERN_DEBUG("Kernel initialized.\n");
  103d89:	8d b3 66 b8 ff ff    	lea    -0x479a(%ebx),%esi
  103d8f:	83 c4 0c             	add    $0xc,%esp
  103d92:	8d 83 51 b8 ff ff    	lea    -0x47af(%ebx),%eax
  103d98:	50                   	push   %eax
  103d99:	6a 3b                	push   $0x3b
  103d9b:	56                   	push   %esi
  103d9c:	e8 94 eb ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  103da1:	83 c4 0c             	add    $0xc,%esp
  103da4:	8d 83 77 b8 ff ff    	lea    -0x4789(%ebx),%eax
  103daa:	50                   	push   %eax
  103dab:	6a 0f                	push   $0xf
  103dad:	56                   	push   %esi
  103dae:	e8 82 eb ff ff       	call   102935 <debug_normal>
    monitor(NULL);
  103db3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  103dba:	e8 9c fa ff ff       	call   10385b <monitor>

    kern_main();
}
  103dbf:	83 c4 14             	add    $0x14,%esp
  103dc2:	5b                   	pop    %ebx
  103dc3:	5e                   	pop    %esi
  103dc4:	c3                   	ret    
  103dc5:	66 90                	xchg   %ax,%ax
  103dc7:	90                   	nop
  103dc8:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  103dce:	00 00                	add    %al,(%eax)
  103dd0:	fb                   	sti    
  103dd1:	4f                   	dec    %edi
  103dd2:	52                   	push   %edx
  103dd3:	e4                   	.byte 0xe4

00103dd4 <start>:
	.long CHECKSUM

	/* this is the entry of the kernel */
	.globl start
start:
	cli
  103dd4:	fa                   	cli    

	/* check whether the bootloader provide multiboot information */
	cmpl	$MULTIBOOT_BOOTLOADER_MAGIC, %eax
  103dd5:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
	jne	spin
  103dda:	75 27                	jne    103e03 <spin>
	movl	%ebx, multiboot_ptr
  103ddc:	89 1d 04 3e 10 00    	mov    %ebx,0x103e04

	/* tell BIOS to warmboot next time */
	movw	$0x1234, 0x472
  103de2:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  103de9:	34 12 

	/* clear EFLAGS */
	pushl	$0x2
  103deb:	6a 02                	push   $0x2
	popfl
  103ded:	9d                   	popf   

	/* prepare the kernel stack */
	movl	$0x0, %ebp
  103dee:	bd 00 00 00 00       	mov    $0x0,%ebp
	movl	$(bsp_kstack + 4096), %esp
  103df3:	bc 00 a0 17 00       	mov    $0x17a000,%esp

	/* jump to the C code */
	push	multiboot_ptr
  103df8:	ff 35 04 3e 10 00    	push   0x103e04
	call	kern_init
  103dfe:	e8 6d ff ff ff       	call   103d70 <kern_init>

00103e03 <spin>:

	/* should not be here */
spin:
	hlt
  103e03:	f4                   	hlt    

00103e04 <multiboot_ptr>:
  103e04:	00 00                	add    %al,(%eax)
  103e06:	00 00                	add    %al,(%eax)
  103e08:	66 90                	xchg   %ax,%ax
  103e0a:	66 90                	xchg   %ax,%ax
  103e0c:	66 90                	xchg   %ax,%ax
  103e0e:	66 90                	xchg   %ax,%ax

00103e10 <get_nps>:
static struct ATStruct AT[1 << 20];

// The getter function for NUM_PAGES.
unsigned int get_nps(void)
{
    return NUM_PAGES;
  103e10:	e8 b3 cf ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  103e15:	05 eb 71 00 00       	add    $0x71eb,%eax
  103e1a:	8b 80 00 f1 86 00    	mov    0x86f100(%eax),%eax
}
  103e20:	c3                   	ret    
  103e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103e28:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103e2f:	90                   	nop

00103e30 <set_nps>:

// The setter function for NUM_PAGES.
void set_nps(unsigned int nps)
{
    NUM_PAGES = nps;
  103e30:	e8 93 cf ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  103e35:	05 cb 71 00 00       	add    $0x71cb,%eax
  103e3a:	8b 54 24 04          	mov    0x4(%esp),%edx
  103e3e:	89 90 00 f1 86 00    	mov    %edx,0x86f100(%eax)
}
  103e44:	c3                   	ret    
  103e45:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103e50 <at_is_norm>:
        perm = 1;
    } else {
        perm = 0;
    }

    return perm;
  103e50:	e8 73 cf ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  103e55:	05 ab 71 00 00       	add    $0x71ab,%eax
    if (perm > 1) {
  103e5a:	8b 54 24 04          	mov    0x4(%esp),%edx
  103e5e:	83 bc d0 00 f1 06 00 	cmpl   $0x1,0x6f100(%eax,%edx,8)
  103e65:	01 
  103e66:	0f 97 c0             	seta   %al
  103e69:	0f b6 c0             	movzbl %al,%eax
}
  103e6c:	c3                   	ret    
  103e6d:	8d 76 00             	lea    0x0(%esi),%esi

00103e70 <at_set_perm>:
 * Sets the permission of the page with given index.
 * It also marks the page as unallocated.
 */
void at_set_perm(unsigned int page_index, unsigned int perm)
{
    AT[page_index].perm = perm;
  103e70:	e8 53 cf ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  103e75:	05 8b 71 00 00       	add    $0x718b,%eax
{
  103e7a:	8b 54 24 04          	mov    0x4(%esp),%edx
    AT[page_index].perm = perm;
  103e7e:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    AT[page_index].allocated = 0;
  103e82:	c7 84 d0 04 f1 06 00 	movl   $0x0,0x6f104(%eax,%edx,8)
  103e89:	00 00 00 00 
    AT[page_index].perm = perm;
  103e8d:	89 8c d0 00 f1 06 00 	mov    %ecx,0x6f100(%eax,%edx,8)
}
  103e94:	c3                   	ret    
  103e95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  103e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103ea0 <at_is_allocated>:
    allocated = AT[page_index].allocated;
    if (allocated > 0) {
        allocated = 1;
    }

    return allocated;
  103ea0:	e8 23 cf ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  103ea5:	05 5b 71 00 00       	add    $0x715b,%eax
    if (allocated > 0) {
  103eaa:	8b 54 24 04          	mov    0x4(%esp),%edx
  103eae:	8b 84 d0 04 f1 06 00 	mov    0x6f104(%eax,%edx,8),%eax
  103eb5:	85 c0                	test   %eax,%eax
  103eb7:	0f 95 c0             	setne  %al
  103eba:	0f b6 c0             	movzbl %al,%eax
}
  103ebd:	c3                   	ret    
  103ebe:	66 90                	xchg   %ax,%ax

00103ec0 <at_set_allocated>:
 * The setter function for the physical page allocation flag.
 * Set the flag of the page with given index to the given value.
 */
void at_set_allocated(unsigned int page_index, unsigned int allocated)
{
    AT[page_index].allocated = allocated;
  103ec0:	e8 03 cf ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  103ec5:	05 3b 71 00 00       	add    $0x713b,%eax
  103eca:	8b 54 24 04          	mov    0x4(%esp),%edx
  103ece:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  103ed2:	89 8c d0 04 f1 06 00 	mov    %ecx,0x6f104(%eax,%edx,8)
}
  103ed9:	c3                   	ret    
  103eda:	66 90                	xchg   %ax,%ax
  103edc:	66 90                	xchg   %ax,%ax
  103ede:	66 90                	xchg   %ax,%ax

00103ee0 <pmem_init>:
 *    based on the information available in the physical memory map table.
 *    Review import.h in the current directory for the list of available
 *    getter and setter functions.
 */
void pmem_init(unsigned int mbi_addr)
{
  103ee0:	55                   	push   %ebp
  103ee1:	57                   	push   %edi
  103ee2:	56                   	push   %esi
  103ee3:	53                   	push   %ebx
  103ee4:	e8 23 c4 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  103ee9:	81 c3 17 71 00 00    	add    $0x7117,%ebx
  103eef:	83 ec 38             	sub    $0x38,%esp
    unsigned int pg_idx, pmmap_size, cur_addr, highest_addr;
    unsigned int entry_idx, flag, isnorm, start, len;

    // Calls the lower layer initialization primitive.
    // The parameter mbi_addr should not be used in the further code.
    devinit(mbi_addr);
  103ef2:	ff 74 24 4c          	push   0x4c(%esp)
  103ef6:	e8 b5 c9 ff ff       	call   1008b0 <devinit>
     * Hint: Think of it as the highest address in the ranges of the memory map table,
     *       divided by the page size.
     */
    nps = 0;
    entry_idx = 0;
    pmmap_size = get_size();
  103efb:	e8 7b cd ff ff       	call   100c7b <get_size>
  103f00:	89 44 24 18          	mov    %eax,0x18(%esp)
    while (entry_idx < pmmap_size) {
  103f04:	83 c4 10             	add    $0x10,%esp
  103f07:	85 c0                	test   %eax,%eax
  103f09:	0f 84 57 01 00 00    	je     104066 <pmem_init+0x186>
    entry_idx = 0;
  103f0f:	31 ff                	xor    %edi,%edi
    nps = 0;
  103f11:	31 f6                	xor    %esi,%esi
  103f13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103f17:	90                   	nop
        cur_addr = get_mms(entry_idx) + get_mml(entry_idx);
  103f18:	83 ec 0c             	sub    $0xc,%esp
  103f1b:	57                   	push   %edi
  103f1c:	e8 6b cd ff ff       	call   100c8c <get_mms>
  103f21:	89 3c 24             	mov    %edi,(%esp)
  103f24:	89 c5                	mov    %eax,%ebp
  103f26:	e8 aa cd ff ff       	call   100cd5 <get_mml>
  103f2b:	01 e8                	add    %ebp,%eax
  103f2d:	39 c6                	cmp    %eax,%esi
  103f2f:	0f 42 f0             	cmovb  %eax,%esi
    while (entry_idx < pmmap_size) {
  103f32:	83 c4 10             	add    $0x10,%esp
        if (nps < cur_addr) {
            nps = cur_addr;
        }
        entry_idx++;
  103f35:	83 c7 01             	add    $0x1,%edi
    while (entry_idx < pmmap_size) {
  103f38:	39 7c 24 08          	cmp    %edi,0x8(%esp)
  103f3c:	75 da                	jne    103f18 <pmem_init+0x38>
    }

    nps = ROUNDDOWN(nps, PAGESIZE) / PAGESIZE;
  103f3e:	89 f5                	mov    %esi,%ebp
    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  103f40:	83 ec 0c             	sub    $0xc,%esp
    nps = ROUNDDOWN(nps, PAGESIZE) / PAGESIZE;
  103f43:	c1 ed 0c             	shr    $0xc,%ebp
  103f46:	89 6c 24 28          	mov    %ebp,0x28(%esp)
    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  103f4a:	55                   	push   %ebp
  103f4b:	e8 e0 fe ff ff       	call   103e30 <set_nps>
     *    not aligned by pages, so it may be possible that for some pages, only some of
     *    the addresses are in a usable range. Currently, we do not utilize partial pages,
     *    so in that case, you should consider those pages as unavailable.
     */
    pg_idx = 0;
    while (pg_idx < nps) {
  103f50:	83 c4 10             	add    $0x10,%esp
  103f53:	85 ed                	test   %ebp,%ebp
  103f55:	0f 84 ea 00 00 00    	je     104045 <pmem_init+0x165>
  103f5b:	31 c0                	xor    %eax,%eax
    pg_idx = 0;
  103f5d:	89 7c 24 10          	mov    %edi,0x10(%esp)
  103f61:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  103f68:	00 
  103f69:	89 c7                	mov    %eax,%edi
  103f6b:	eb 25                	jmp    103f92 <pmem_init+0xb2>
  103f6d:	8d 76 00             	lea    0x0(%esi),%esi
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
            at_set_perm(pg_idx, 1);
  103f70:	83 ec 08             	sub    $0x8,%esp
  103f73:	6a 01                	push   $0x1
  103f75:	51                   	push   %ecx
  103f76:	e8 f5 fe ff ff       	call   103e70 <at_set_perm>
  103f7b:	83 c4 10             	add    $0x10,%esp
    while (pg_idx < nps) {
  103f7e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  103f82:	81 c7 00 10 00 00    	add    $0x1000,%edi
  103f88:	39 54 24 08          	cmp    %edx,0x8(%esp)
  103f8c:	0f 84 b3 00 00 00    	je     104045 <pmem_init+0x165>
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
  103f92:	8b 44 24 08          	mov    0x8(%esp),%eax
  103f96:	89 c1                	mov    %eax,%ecx
  103f98:	89 44 24 18          	mov    %eax,0x18(%esp)
            isnorm = 0;
            while (entry_idx < pmmap_size && !flag) {
                isnorm = is_usable(entry_idx);
                start = get_mms(entry_idx);
                len = get_mml(entry_idx);
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  103f9c:	83 c0 01             	add    $0x1,%eax
  103f9f:	89 44 24 08          	mov    %eax,0x8(%esp)
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
  103fa3:	8d 81 00 00 fc ff    	lea    -0x40000(%ecx),%eax
  103fa9:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  103fae:	77 c0                	ja     103f70 <pmem_init+0x90>
            while (entry_idx < pmmap_size && !flag) {
  103fb0:	8b 44 24 08          	mov    0x8(%esp),%eax
            entry_idx = 0;
  103fb4:	31 f6                	xor    %esi,%esi
  103fb6:	c1 e0 0c             	shl    $0xc,%eax
  103fb9:	89 44 24 14          	mov    %eax,0x14(%esp)
  103fbd:	eb 1f                	jmp    103fde <pmem_init+0xfe>
  103fbf:	90                   	nop
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  103fc0:	8d 54 05 00          	lea    0x0(%ebp,%eax,1),%edx
  103fc4:	3b 54 24 14          	cmp    0x14(%esp),%edx
  103fc8:	0f 93 c2             	setae  %dl
  103fcb:	0f 92 c0             	setb   %al
                    flag = 1;
                }
                entry_idx++;
  103fce:	83 c6 01             	add    $0x1,%esi
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  103fd1:	0f b6 d2             	movzbl %dl,%edx
            while (entry_idx < pmmap_size && !flag) {
  103fd4:	3b 74 24 10          	cmp    0x10(%esp),%esi
  103fd8:	73 3a                	jae    104014 <pmem_init+0x134>
  103fda:	84 c0                	test   %al,%al
  103fdc:	74 36                	je     104014 <pmem_init+0x134>
                isnorm = is_usable(entry_idx);
  103fde:	83 ec 0c             	sub    $0xc,%esp
  103fe1:	56                   	push   %esi
  103fe2:	e8 3a cd ff ff       	call   100d21 <is_usable>
                start = get_mms(entry_idx);
  103fe7:	89 34 24             	mov    %esi,(%esp)
                isnorm = is_usable(entry_idx);
  103fea:	89 44 24 1c          	mov    %eax,0x1c(%esp)
                start = get_mms(entry_idx);
  103fee:	e8 99 cc ff ff       	call   100c8c <get_mms>
                len = get_mml(entry_idx);
  103ff3:	89 34 24             	mov    %esi,(%esp)
                start = get_mms(entry_idx);
  103ff6:	89 c5                	mov    %eax,%ebp
                len = get_mml(entry_idx);
  103ff8:	e8 d8 cc ff ff       	call   100cd5 <get_mml>
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  103ffd:	83 c4 10             	add    $0x10,%esp
  104000:	39 ef                	cmp    %ebp,%edi
  104002:	73 bc                	jae    103fc0 <pmem_init+0xe0>
  104004:	b8 01 00 00 00       	mov    $0x1,%eax
  104009:	31 d2                	xor    %edx,%edx
                entry_idx++;
  10400b:	83 c6 01             	add    $0x1,%esi
            while (entry_idx < pmmap_size && !flag) {
  10400e:	3b 74 24 10          	cmp    0x10(%esp),%esi
  104012:	72 c6                	jb     103fda <pmem_init+0xfa>
            }

            if (flag && isnorm) {
  104014:	8b 44 24 0c          	mov    0xc(%esp),%eax
  104018:	85 c0                	test   %eax,%eax
  10401a:	74 34                	je     104050 <pmem_init+0x170>
  10401c:	85 d2                	test   %edx,%edx
  10401e:	74 30                	je     104050 <pmem_init+0x170>
                at_set_perm(pg_idx, 2);
  104020:	83 ec 08             	sub    $0x8,%esp
    while (pg_idx < nps) {
  104023:	81 c7 00 10 00 00    	add    $0x1000,%edi
                at_set_perm(pg_idx, 2);
  104029:	6a 02                	push   $0x2
  10402b:	ff 74 24 24          	push   0x24(%esp)
  10402f:	e8 3c fe ff ff       	call   103e70 <at_set_perm>
  104034:	83 c4 10             	add    $0x10,%esp
    while (pg_idx < nps) {
  104037:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  10403b:	39 54 24 08          	cmp    %edx,0x8(%esp)
  10403f:	0f 85 4d ff ff ff    	jne    103f92 <pmem_init+0xb2>
                at_set_perm(pg_idx, 0);
            }
        }
        pg_idx++;
    }
}
  104045:	83 c4 2c             	add    $0x2c,%esp
  104048:	5b                   	pop    %ebx
  104049:	5e                   	pop    %esi
  10404a:	5f                   	pop    %edi
  10404b:	5d                   	pop    %ebp
  10404c:	c3                   	ret    
  10404d:	8d 76 00             	lea    0x0(%esi),%esi
                at_set_perm(pg_idx, 0);
  104050:	83 ec 08             	sub    $0x8,%esp
  104053:	6a 00                	push   $0x0
  104055:	ff 74 24 24          	push   0x24(%esp)
  104059:	e8 12 fe ff ff       	call   103e70 <at_set_perm>
  10405e:	83 c4 10             	add    $0x10,%esp
  104061:	e9 18 ff ff ff       	jmp    103f7e <pmem_init+0x9e>
    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  104066:	83 ec 0c             	sub    $0xc,%esp
  104069:	6a 00                	push   $0x0
  10406b:	e8 c0 fd ff ff       	call   103e30 <set_nps>
  104070:	83 c4 10             	add    $0x10,%esp
}
  104073:	83 c4 2c             	add    $0x2c,%esp
  104076:	5b                   	pop    %ebx
  104077:	5e                   	pop    %esi
  104078:	5f                   	pop    %edi
  104079:	5d                   	pop    %ebp
  10407a:	c3                   	ret    
  10407b:	66 90                	xchg   %ax,%ax
  10407d:	66 90                	xchg   %ax,%ax
  10407f:	90                   	nop

00104080 <palloc>:
 *    return 0.
 * 2. Optimize the code using memoization so that you do not have to
 *    scan the allocation table from scratch every time.
 */
unsigned int palloc()
{
  104080:	55                   	push   %ebp
  104081:	57                   	push   %edi
  104082:	56                   	push   %esi
  104083:	53                   	push   %ebx
  104084:	e8 83 c2 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104089:	81 c3 77 6f 00 00    	add    $0x6f77,%ebx
  10408f:	83 ec 0c             	sub    $0xc,%esp
    unsigned int nps;
    unsigned int palloc_index;
    unsigned int palloc_free_index;
    bool first;

    nps = get_nps();
  104092:	e8 79 fd ff ff       	call   103e10 <get_nps>
    palloc_index = last_palloc_index;
  104097:	8b b3 28 03 00 00    	mov    0x328(%ebx),%esi
    nps = get_nps();
  10409d:	89 c7                	mov    %eax,%edi
    palloc_free_index = nps;
    first = TRUE;

    while ((palloc_index != last_palloc_index || first) && palloc_free_index == nps) {
  10409f:	eb 17                	jmp    1040b8 <palloc+0x38>
  1040a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1040a8:	3d 00 00 04 00       	cmp    $0x40000,%eax
  1040ad:	74 30                	je     1040df <palloc+0x5f>
  1040af:	be 00 00 04 00       	mov    $0x40000,%esi
  1040b4:	39 fd                	cmp    %edi,%ebp
  1040b6:	75 60                	jne    104118 <palloc+0x98>
        first = FALSE;
        if (at_is_norm(palloc_index) && !at_is_allocated(palloc_index)) {
  1040b8:	83 ec 0c             	sub    $0xc,%esp
  1040bb:	89 fd                	mov    %edi,%ebp
  1040bd:	56                   	push   %esi
  1040be:	e8 8d fd ff ff       	call   103e50 <at_is_norm>
  1040c3:	83 c4 10             	add    $0x10,%esp
  1040c6:	85 c0                	test   %eax,%eax
  1040c8:	75 36                	jne    104100 <palloc+0x80>
            palloc_free_index = palloc_index;
        }
        palloc_index++;
  1040ca:	83 c6 01             	add    $0x1,%esi
    while ((palloc_index != last_palloc_index || first) && palloc_free_index == nps) {
  1040cd:	8b 83 28 03 00 00    	mov    0x328(%ebx),%eax
        if (palloc_index >= VM_USERHI_PI) {
  1040d3:	81 fe ff ff 0e 00    	cmp    $0xeffff,%esi
  1040d9:	77 cd                	ja     1040a8 <palloc+0x28>
    while ((palloc_index != last_palloc_index || first) && palloc_free_index == nps) {
  1040db:	39 c6                	cmp    %eax,%esi
  1040dd:	75 d5                	jne    1040b4 <palloc+0x34>
            palloc_index = VM_USERLO_PI;
        }
    }

    if (palloc_free_index == nps) {
  1040df:	39 fd                	cmp    %edi,%ebp
  1040e1:	75 35                	jne    104118 <palloc+0x98>
  1040e3:	b8 00 00 04 00       	mov    $0x40000,%eax
        palloc_free_index = 0;
  1040e8:	31 ed                	xor    %ebp,%ebp
        last_palloc_index = VM_USERLO_PI;
  1040ea:	89 83 28 03 00 00    	mov    %eax,0x328(%ebx)
        at_set_allocated(palloc_free_index, 1);
        last_palloc_index = palloc_free_index;
    }

    return palloc_free_index;
}
  1040f0:	83 c4 0c             	add    $0xc,%esp
  1040f3:	89 e8                	mov    %ebp,%eax
  1040f5:	5b                   	pop    %ebx
  1040f6:	5e                   	pop    %esi
  1040f7:	5f                   	pop    %edi
  1040f8:	5d                   	pop    %ebp
  1040f9:	c3                   	ret    
  1040fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if (at_is_norm(palloc_index) && !at_is_allocated(palloc_index)) {
  104100:	83 ec 0c             	sub    $0xc,%esp
  104103:	89 f5                	mov    %esi,%ebp
  104105:	56                   	push   %esi
  104106:	e8 95 fd ff ff       	call   103ea0 <at_is_allocated>
  10410b:	83 c4 10             	add    $0x10,%esp
  10410e:	85 c0                	test   %eax,%eax
  104110:	0f 45 ef             	cmovne %edi,%ebp
  104113:	eb b5                	jmp    1040ca <palloc+0x4a>
  104115:	8d 76 00             	lea    0x0(%esi),%esi
        at_set_allocated(palloc_free_index, 1);
  104118:	83 ec 08             	sub    $0x8,%esp
  10411b:	6a 01                	push   $0x1
  10411d:	55                   	push   %ebp
  10411e:	e8 9d fd ff ff       	call   103ec0 <at_set_allocated>
  104123:	89 e8                	mov    %ebp,%eax
  104125:	83 c4 10             	add    $0x10,%esp
        last_palloc_index = VM_USERLO_PI;
  104128:	89 83 28 03 00 00    	mov    %eax,0x328(%ebx)
}
  10412e:	83 c4 0c             	add    $0xc,%esp
  104131:	89 e8                	mov    %ebp,%eax
  104133:	5b                   	pop    %ebx
  104134:	5e                   	pop    %esi
  104135:	5f                   	pop    %edi
  104136:	5d                   	pop    %ebp
  104137:	c3                   	ret    
  104138:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10413f:	90                   	nop

00104140 <pfree>:
 * in the allocation table.
 *
 * Hint: Simple.
 */
void pfree(unsigned int pfree_index)
{
  104140:	53                   	push   %ebx
  104141:	e8 c6 c1 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104146:	81 c3 ba 6e 00 00    	add    $0x6eba,%ebx
  10414c:	83 ec 10             	sub    $0x10,%esp
    at_set_allocated(pfree_index, 0);
  10414f:	6a 00                	push   $0x0
  104151:	ff 74 24 1c          	push   0x1c(%esp)
  104155:	e8 66 fd ff ff       	call   103ec0 <at_set_allocated>
}
  10415a:	83 c4 18             	add    $0x18,%esp
  10415d:	5b                   	pop    %ebx
  10415e:	c3                   	ret    
  10415f:	90                   	nop

00104160 <container_init>:
/**
 * Initializes the container data for the root process (the one with index 0).
 * The root process is the one that gets spawned first by the kernel.
 */
void container_init(unsigned int mbi_addr)
{
  104160:	55                   	push   %ebp
  104161:	57                   	push   %edi
  104162:	56                   	push   %esi
  104163:	53                   	push   %ebx
  104164:	e8 a3 c1 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104169:	81 c3 97 6e 00 00    	add    $0x6e97,%ebx
  10416f:	83 ec 18             	sub    $0x18,%esp
    unsigned int real_quota;
    unsigned int nps, idx;

    pmem_init(mbi_addr);
  104172:	ff 74 24 2c          	push   0x2c(%esp)
  104176:	e8 65 fd ff ff       	call   103ee0 <pmem_init>
    /**
     * Compute the available quota and store it into the variable real_quota.
     * It should be the number of the unallocated pages with the normal permission
     * in the physical memory allocation table.
     */
    nps = get_nps();
  10417b:	e8 90 fc ff ff       	call   103e10 <get_nps>
    idx = 1;
    while (idx < nps) {
  104180:	83 c4 10             	add    $0x10,%esp
  104183:	83 f8 01             	cmp    $0x1,%eax
  104186:	0f 86 94 00 00 00    	jbe    104220 <container_init+0xc0>
  10418c:	89 c7                	mov    %eax,%edi
    idx = 1;
  10418e:	be 01 00 00 00       	mov    $0x1,%esi
    real_quota = 0;
  104193:	31 ed                	xor    %ebp,%ebp
  104195:	eb 10                	jmp    1041a7 <container_init+0x47>
  104197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10419e:	66 90                	xchg   %ax,%ax
        if (at_is_norm(idx) && !at_is_allocated(idx)) {
            real_quota++;
        }
        idx++;
  1041a0:	83 c6 01             	add    $0x1,%esi
    while (idx < nps) {
  1041a3:	39 f7                	cmp    %esi,%edi
  1041a5:	74 29                	je     1041d0 <container_init+0x70>
        if (at_is_norm(idx) && !at_is_allocated(idx)) {
  1041a7:	83 ec 0c             	sub    $0xc,%esp
  1041aa:	56                   	push   %esi
  1041ab:	e8 a0 fc ff ff       	call   103e50 <at_is_norm>
  1041b0:	83 c4 10             	add    $0x10,%esp
  1041b3:	85 c0                	test   %eax,%eax
  1041b5:	74 e9                	je     1041a0 <container_init+0x40>
  1041b7:	83 ec 0c             	sub    $0xc,%esp
  1041ba:	56                   	push   %esi
  1041bb:	e8 e0 fc ff ff       	call   103ea0 <at_is_allocated>
  1041c0:	83 c4 10             	add    $0x10,%esp
            real_quota++;
  1041c3:	83 f8 01             	cmp    $0x1,%eax
  1041c6:	83 d5 00             	adc    $0x0,%ebp
        idx++;
  1041c9:	83 c6 01             	add    $0x1,%esi
    while (idx < nps) {
  1041cc:	39 f7                	cmp    %esi,%edi
  1041ce:	75 d7                	jne    1041a7 <container_init+0x47>
    }

    KERN_DEBUG("\nreal quota: %d\n\n", real_quota);

    CONTAINER[0].quota = real_quota;
  1041d0:	89 ee                	mov    %ebp,%esi
    KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  1041d2:	8d 83 89 b8 ff ff    	lea    -0x4777(%ebx),%eax
  1041d8:	55                   	push   %ebp
  1041d9:	50                   	push   %eax
  1041da:	8d 83 9c b8 ff ff    	lea    -0x4764(%ebx),%eax
  1041e0:	6a 2a                	push   $0x2a
  1041e2:	50                   	push   %eax
  1041e3:	e8 4d e7 ff ff       	call   102935 <debug_normal>
    CONTAINER[0].quota = real_quota;
  1041e8:	89 b3 20 f1 86 00    	mov    %esi,0x86f120(%ebx)
    CONTAINER[0].usage = 0;
  1041ee:	c7 83 24 f1 86 00 00 	movl   $0x0,0x86f124(%ebx)
  1041f5:	00 00 00 
    CONTAINER[0].parent = 0;
  1041f8:	c7 83 28 f1 86 00 00 	movl   $0x0,0x86f128(%ebx)
  1041ff:	00 00 00 
    CONTAINER[0].nchildren = 0;
  104202:	c7 83 2c f1 86 00 00 	movl   $0x0,0x86f12c(%ebx)
  104209:	00 00 00 
    CONTAINER[0].used = 1;
  10420c:	c7 83 30 f1 86 00 01 	movl   $0x1,0x86f130(%ebx)
  104213:	00 00 00 
}
  104216:	83 c4 1c             	add    $0x1c,%esp
  104219:	5b                   	pop    %ebx
  10421a:	5e                   	pop    %esi
  10421b:	5f                   	pop    %edi
  10421c:	5d                   	pop    %ebp
  10421d:	c3                   	ret    
  10421e:	66 90                	xchg   %ax,%ax
    while (idx < nps) {
  104220:	31 f6                	xor    %esi,%esi
    real_quota = 0;
  104222:	31 ed                	xor    %ebp,%ebp
  104224:	eb ac                	jmp    1041d2 <container_init+0x72>
  104226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10422d:	8d 76 00             	lea    0x0(%esi),%esi

00104230 <container_get_parent>:

// Get the id of parent process of process # [id].
unsigned int container_get_parent(unsigned int id)
{
    return CONTAINER[id].parent;
  104230:	e8 97 cb ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104235:	81 c2 cb 6d 00 00    	add    $0x6dcb,%edx
{
  10423b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].parent;
  10423f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  104242:	8b 84 82 28 f1 86 00 	mov    0x86f128(%edx,%eax,4),%eax
}
  104249:	c3                   	ret    
  10424a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104250 <container_get_nchildren>:

// Get the number of children of process # [id].
unsigned int container_get_nchildren(unsigned int id)
{
    return CONTAINER[id].nchildren;
  104250:	e8 77 cb ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104255:	81 c2 ab 6d 00 00    	add    $0x6dab,%edx
{
  10425b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].nchildren;
  10425f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  104262:	8b 84 82 2c f1 86 00 	mov    0x86f12c(%edx,%eax,4),%eax
}
  104269:	c3                   	ret    
  10426a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104270 <container_get_quota>:

// Get the maximum memory quota of process # [id].
unsigned int container_get_quota(unsigned int id)
{
    return CONTAINER[id].quota;
  104270:	e8 57 cb ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104275:	81 c2 8b 6d 00 00    	add    $0x6d8b,%edx
{
  10427b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].quota;
  10427f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  104282:	8b 84 82 20 f1 86 00 	mov    0x86f120(%edx,%eax,4),%eax
}
  104289:	c3                   	ret    
  10428a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104290 <container_get_usage>:

// Get the current memory usage of process # [id].
unsigned int container_get_usage(unsigned int id)
{
    return CONTAINER[id].usage;
  104290:	e8 37 cb ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104295:	81 c2 6b 6d 00 00    	add    $0x6d6b,%edx
{
  10429b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].usage;
  10429f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1042a2:	8b 84 82 24 f1 86 00 	mov    0x86f124(%edx,%eax,4),%eax
}
  1042a9:	c3                   	ret    
  1042aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001042b0 <container_can_consume>:

// Determines whether the process # [id] can consume an extra
// [n] pages of memory. If so, returns 1, otherwise, returns 0.
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
    return CONTAINER[id].usage + n <= CONTAINER[id].quota;
  1042b0:	e8 53 c0 ff ff       	call   100308 <__x86.get_pc_thunk.cx>
  1042b5:	81 c1 4b 6d 00 00    	add    $0x6d4b,%ecx
{
  1042bb:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].usage + n <= CONTAINER[id].quota;
  1042bf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1042c2:	c1 e0 02             	shl    $0x2,%eax
  1042c5:	8b 94 01 24 f1 86 00 	mov    0x86f124(%ecx,%eax,1),%edx
  1042cc:	03 54 24 08          	add    0x8(%esp),%edx
  1042d0:	3b 94 01 20 f1 86 00 	cmp    0x86f120(%ecx,%eax,1),%edx
  1042d7:	0f 96 c0             	setbe  %al
  1042da:	0f b6 c0             	movzbl %al,%eax
}
  1042dd:	c3                   	ret    
  1042de:	66 90                	xchg   %ax,%ax

001042e0 <container_split>:
 * You can assume it is safe to allocate [quota] pages
 * (the check is already done outside before calling this function).
 * Returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  1042e0:	55                   	push   %ebp
  1042e1:	57                   	push   %edi
  1042e2:	e8 26 01 00 00       	call   10440d <__x86.get_pc_thunk.di>
  1042e7:	81 c7 19 6d 00 00    	add    $0x6d19,%edi
  1042ed:	56                   	push   %esi
  1042ee:	53                   	push   %ebx
  1042ef:	8b 54 24 14          	mov    0x14(%esp),%edx
  1042f3:	8b 74 24 18          	mov    0x18(%esp),%esi
    unsigned int child, nc;

    nc = CONTAINER[id].nchildren;
  1042f7:	8d 0c 92             	lea    (%edx,%edx,4),%ecx
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  1042fa:	8d 44 52 01          	lea    0x1(%edx,%edx,2),%eax
    nc = CONTAINER[id].nchildren;
  1042fe:	8d 9c 8f 20 f1 86 00 	lea    0x86f120(%edi,%ecx,4),%ebx
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  104305:	03 43 0c             	add    0xc(%ebx),%eax

    if (NUM_IDS <= child) {
  104308:	83 f8 3f             	cmp    $0x3f,%eax
  10430b:	77 3b                	ja     104348 <container_split+0x68>
    }

    /**
     * Update the container structure of both parent and child process appropriately.
     */
    CONTAINER[child].used = 1;
  10430d:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  104310:	c1 e1 02             	shl    $0x2,%ecx
  104313:	8d ac 0f 20 f1 86 00 	lea    0x86f120(%edi,%ecx,1),%ebp
    CONTAINER[child].quota = quota;
  10431a:	89 75 00             	mov    %esi,0x0(%ebp)
    CONTAINER[child].usage = 0;
  10431d:	c7 45 04 00 00 00 00 	movl   $0x0,0x4(%ebp)
    CONTAINER[child].parent = id;
    CONTAINER[child].nchildren = 0;
  104324:	c7 45 0c 00 00 00 00 	movl   $0x0,0xc(%ebp)

    CONTAINER[id].usage += quota;
  10432b:	01 73 04             	add    %esi,0x4(%ebx)
    CONTAINER[id].nchildren++;
  10432e:	83 43 0c 01          	addl   $0x1,0xc(%ebx)

    return child;
}
  104332:	5b                   	pop    %ebx
    CONTAINER[child].used = 1;
  104333:	c7 45 10 01 00 00 00 	movl   $0x1,0x10(%ebp)
}
  10433a:	5e                   	pop    %esi
    CONTAINER[child].parent = id;
  10433b:	89 55 08             	mov    %edx,0x8(%ebp)
}
  10433e:	5f                   	pop    %edi
  10433f:	5d                   	pop    %ebp
  104340:	c3                   	ret    
  104341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104348:	5b                   	pop    %ebx
        return NUM_IDS;
  104349:	b8 40 00 00 00       	mov    $0x40,%eax
}
  10434e:	5e                   	pop    %esi
  10434f:	5f                   	pop    %edi
  104350:	5d                   	pop    %ebp
  104351:	c3                   	ret    
  104352:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104360 <container_alloc>:
 * Allocates one more page for process # [id], given that this will not exceed the quota.
 * The container structure should be updated accordingly after the allocation.
 * Returns the page index of the allocated page, or 0 in the case of failure.
 */
unsigned int container_alloc(unsigned int id)
{
  104360:	56                   	push   %esi
  104361:	53                   	push   %ebx
  104362:	e8 a5 bf ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104367:	81 c3 99 6c 00 00    	add    $0x6c99,%ebx
  10436d:	83 ec 04             	sub    $0x4,%esp
  104370:	8b 44 24 10          	mov    0x10(%esp),%eax
    if (CONTAINER[id].usage + 1 <= CONTAINER[id].quota) {
  104374:	8d 14 80             	lea    (%eax,%eax,4),%edx
  104377:	31 c0                	xor    %eax,%eax
  104379:	c1 e2 02             	shl    $0x2,%edx
  10437c:	8d b4 13 20 f1 86 00 	lea    0x86f120(%ebx,%edx,1),%esi
  104383:	8b 4e 04             	mov    0x4(%esi),%ecx
  104386:	3b 8c 13 20 f1 86 00 	cmp    0x86f120(%ebx,%edx,1),%ecx
  10438d:	7c 09                	jl     104398 <container_alloc+0x38>
        CONTAINER[id].usage++;
        return palloc();
    } else {
        return 0;
    }
}
  10438f:	83 c4 04             	add    $0x4,%esp
  104392:	5b                   	pop    %ebx
  104393:	5e                   	pop    %esi
  104394:	c3                   	ret    
  104395:	8d 76 00             	lea    0x0(%esi),%esi
        CONTAINER[id].usage++;
  104398:	83 c1 01             	add    $0x1,%ecx
  10439b:	89 4e 04             	mov    %ecx,0x4(%esi)
        return palloc();
  10439e:	e8 dd fc ff ff       	call   104080 <palloc>
}
  1043a3:	83 c4 04             	add    $0x4,%esp
  1043a6:	5b                   	pop    %ebx
  1043a7:	5e                   	pop    %esi
  1043a8:	c3                   	ret    
  1043a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001043b0 <container_free>:

// Frees the physical page and reduces the usage by 1.
void container_free(unsigned int id, unsigned int page_index)
{
  1043b0:	56                   	push   %esi
  1043b1:	53                   	push   %ebx
  1043b2:	e8 55 bf ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1043b7:	81 c3 49 6c 00 00    	add    $0x6c49,%ebx
  1043bd:	83 ec 10             	sub    $0x10,%esp
  1043c0:	8b 74 24 20          	mov    0x20(%esp),%esi
    if (at_is_allocated(page_index)) {
  1043c4:	56                   	push   %esi
  1043c5:	e8 d6 fa ff ff       	call   103ea0 <at_is_allocated>
  1043ca:	83 c4 10             	add    $0x10,%esp
  1043cd:	85 c0                	test   %eax,%eax
  1043cf:	75 0f                	jne    1043e0 <container_free+0x30>
        pfree(page_index);
        if (CONTAINER[id].usage > 0) {
            CONTAINER[id].usage--;
        }
    }
}
  1043d1:	83 c4 04             	add    $0x4,%esp
  1043d4:	5b                   	pop    %ebx
  1043d5:	5e                   	pop    %esi
  1043d6:	c3                   	ret    
  1043d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1043de:	66 90                	xchg   %ax,%ax
        pfree(page_index);
  1043e0:	83 ec 0c             	sub    $0xc,%esp
  1043e3:	56                   	push   %esi
  1043e4:	e8 57 fd ff ff       	call   104140 <pfree>
        if (CONTAINER[id].usage > 0) {
  1043e9:	8b 44 24 20          	mov    0x20(%esp),%eax
  1043ed:	83 c4 10             	add    $0x10,%esp
  1043f0:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1043f3:	8d 94 83 20 f1 86 00 	lea    0x86f120(%ebx,%eax,4),%edx
  1043fa:	8b 42 04             	mov    0x4(%edx),%eax
  1043fd:	85 c0                	test   %eax,%eax
  1043ff:	7e d0                	jle    1043d1 <container_free+0x21>
            CONTAINER[id].usage--;
  104401:	83 e8 01             	sub    $0x1,%eax
  104404:	89 42 04             	mov    %eax,0x4(%edx)
}
  104407:	83 c4 04             	add    $0x4,%esp
  10440a:	5b                   	pop    %ebx
  10440b:	5e                   	pop    %esi
  10440c:	c3                   	ret    

0010440d <__x86.get_pc_thunk.di>:
  10440d:	8b 3c 24             	mov    (%esp),%edi
  104410:	c3                   	ret    
  104411:	66 90                	xchg   %ax,%ax
  104413:	66 90                	xchg   %ax,%ax
  104415:	66 90                	xchg   %ax,%ax
  104417:	66 90                	xchg   %ax,%ax
  104419:	66 90                	xchg   %ax,%ax
  10441b:	66 90                	xchg   %ax,%ax
  10441d:	66 90                	xchg   %ax,%ax
  10441f:	90                   	nop

00104420 <set_pdir_base>:
 */
unsigned int IDPTbl[1024][1024] gcc_aligned(PAGESIZE);

// Sets the CR3 register with the start address of the page structure for process # [index].
void set_pdir_base(unsigned int index)
{
  104420:	53                   	push   %ebx
  104421:	e8 e6 be ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104426:	81 c3 da 6b 00 00    	add    $0x6bda,%ebx
  10442c:	83 ec 14             	sub    $0x14,%esp
    set_cr3(PDirPool[index]);
  10442f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  104433:	c1 e0 0c             	shl    $0xc,%eax
  104436:	8d 84 03 00 00 c7 00 	lea    0xc70000(%ebx,%eax,1),%eax
  10443d:	50                   	push   %eax
  10443e:	e8 2f c9 ff ff       	call   100d72 <set_cr3>
}
  104443:	83 c4 18             	add    $0x18,%esp
  104446:	5b                   	pop    %ebx
  104447:	c3                   	ret    
  104448:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10444f:	90                   	nop

00104450 <get_pdir_entry>:

// Returns the page directory entry # [pde_index] of the process # [proc_index].
// This can be used to test whether the page directory entry is mapped.
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    return (unsigned int) PDirPool[proc_index][pde_index];
  104450:	e8 77 c9 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104455:	81 c2 ab 6b 00 00    	add    $0x6bab,%edx
  10445b:	8b 44 24 04          	mov    0x4(%esp),%eax
  10445f:	c1 e0 0a             	shl    $0xa,%eax
  104462:	03 44 24 08          	add    0x8(%esp),%eax
  104466:	8b 84 82 00 00 c7 00 	mov    0xc70000(%edx,%eax,4),%eax
}
  10446d:	c3                   	ret    
  10446e:	66 90                	xchg   %ax,%ax

00104470 <set_pdir_entry>:
// You should also set the permissions PTE_P, PTE_W, and PTE_U.
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int page_index)
{
    unsigned int addr = page_index << 12;
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  104470:	e8 93 be ff ff       	call   100308 <__x86.get_pc_thunk.cx>
  104475:	81 c1 8b 6b 00 00    	add    $0x6b8b,%ecx
    unsigned int addr = page_index << 12;
  10447b:	8b 54 24 0c          	mov    0xc(%esp),%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  10447f:	8b 44 24 04          	mov    0x4(%esp),%eax
    unsigned int addr = page_index << 12;
  104483:	c1 e2 0c             	shl    $0xc,%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  104486:	c1 e0 0a             	shl    $0xa,%eax
  104489:	03 44 24 08          	add    0x8(%esp),%eax
  10448d:	83 ca 07             	or     $0x7,%edx
  104490:	89 94 81 00 00 c7 00 	mov    %edx,0xc70000(%ecx,%eax,4)
}
  104497:	c3                   	ret    
  104498:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10449f:	90                   	nop

001044a0 <set_pdir_entry_identity>:
// with the initial address of page directory # [pde_index] in IDPTbl.
// You should also set the permissions PTE_P, PTE_W, and PTE_U.
// This will be used to map a page directory entry to an identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{
    unsigned int addr = (unsigned int) IDPTbl[pde_index];
  1044a0:	e8 63 be ff ff       	call   100308 <__x86.get_pc_thunk.cx>
  1044a5:	81 c1 5b 6b 00 00    	add    $0x6b5b,%ecx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1044ab:	8b 44 24 04          	mov    0x4(%esp),%eax
{
  1044af:	8b 54 24 08          	mov    0x8(%esp),%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1044b3:	c1 e0 0a             	shl    $0xa,%eax
  1044b6:	01 d0                	add    %edx,%eax
    unsigned int addr = (unsigned int) IDPTbl[pde_index];
  1044b8:	c1 e2 0c             	shl    $0xc,%edx
  1044bb:	8d 94 11 00 00 87 00 	lea    0x870000(%ecx,%edx,1),%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1044c2:	83 ca 07             	or     $0x7,%edx
  1044c5:	89 94 81 00 00 c7 00 	mov    %edx,0xc70000(%ecx,%eax,4)
}
  1044cc:	c3                   	ret    
  1044cd:	8d 76 00             	lea    0x0(%esi),%esi

001044d0 <rmv_pdir_entry>:

// Removes the specified page directory entry (sets the page directory entry to 0).
// Don't forget to cast the value to (unsigned int *).
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    PDirPool[proc_index][pde_index] = (unsigned int *) 0;
  1044d0:	e8 f7 c8 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  1044d5:	81 c2 2b 6b 00 00    	add    $0x6b2b,%edx
  1044db:	8b 44 24 04          	mov    0x4(%esp),%eax
  1044df:	c1 e0 0a             	shl    $0xa,%eax
  1044e2:	03 44 24 08          	add    0x8(%esp),%eax
  1044e6:	c7 84 82 00 00 c7 00 	movl   $0x0,0xc70000(%edx,%eax,4)
  1044ed:	00 00 00 00 
}
  1044f1:	c3                   	ret    
  1044f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1044f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104500 <get_ptbl_entry>:
// Do not forget that the permission info is also stored in the page directory entries.
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                            unsigned int pte_index)
{
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
    return pt[pte_index];
  104500:	e8 c7 c8 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104505:	81 c2 fb 6a 00 00    	add    $0x6afb,%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  10450b:	8b 44 24 04          	mov    0x4(%esp),%eax
  10450f:	c1 e0 0a             	shl    $0xa,%eax
  104512:	03 44 24 08          	add    0x8(%esp),%eax
  104516:	8b 84 82 00 00 c7 00 	mov    0xc70000(%edx,%eax,4),%eax
    return pt[pte_index];
  10451d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  104521:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    return pt[pte_index];
  104526:	8b 04 90             	mov    (%eax,%edx,4),%eax
}
  104529:	c3                   	ret    
  10452a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104530 <set_ptbl_entry>:
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int pte_index, unsigned int page_index,
                    unsigned int perm)
{
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
    pt[pte_index] = (page_index << 12) | perm;
  104530:	e8 97 c8 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104535:	81 c2 cb 6a 00 00    	add    $0x6acb,%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  10453b:	8b 44 24 04          	mov    0x4(%esp),%eax
    pt[pte_index] = (page_index << 12) | perm;
  10453f:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  104543:	c1 e0 0a             	shl    $0xa,%eax
  104546:	03 44 24 08          	add    0x8(%esp),%eax
  10454a:	8b 94 82 00 00 c7 00 	mov    0xc70000(%edx,%eax,4),%edx
    pt[pte_index] = (page_index << 12) | perm;
  104551:	8b 44 24 10          	mov    0x10(%esp),%eax
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  104555:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    pt[pte_index] = (page_index << 12) | perm;
  10455b:	c1 e0 0c             	shl    $0xc,%eax
  10455e:	0b 44 24 14          	or     0x14(%esp),%eax
  104562:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
}
  104565:	c3                   	ret    
  104566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10456d:	8d 76 00             	lea    0x0(%esi),%esi

00104570 <set_ptbl_entry_identity>:

// Sets up the specified page table entry in IDPTbl as the identity map.
// You should also set the given permission.
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index,
                             unsigned int perm)
{
  104570:	53                   	push   %ebx
  104571:	8b 54 24 08          	mov    0x8(%esp),%edx
  104575:	e8 92 bd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10457a:	81 c3 86 6a 00 00    	add    $0x6a86,%ebx
  104580:	8b 44 24 0c          	mov    0xc(%esp),%eax
    unsigned int addr = (pde_index << 22) | (pte_index << 12);
    IDPTbl[pde_index][pte_index] = addr | perm;
  104584:	89 d1                	mov    %edx,%ecx
    unsigned int addr = (pde_index << 22) | (pte_index << 12);
  104586:	c1 e2 16             	shl    $0x16,%edx
    IDPTbl[pde_index][pte_index] = addr | perm;
  104589:	c1 e1 0a             	shl    $0xa,%ecx
  10458c:	01 c1                	add    %eax,%ecx
    unsigned int addr = (pde_index << 22) | (pte_index << 12);
  10458e:	c1 e0 0c             	shl    $0xc,%eax
    IDPTbl[pde_index][pte_index] = addr | perm;
  104591:	0b 44 24 10          	or     0x10(%esp),%eax
  104595:	09 d0                	or     %edx,%eax
  104597:	89 84 8b 00 00 87 00 	mov    %eax,0x870000(%ebx,%ecx,4)
}
  10459e:	5b                   	pop    %ebx
  10459f:	c3                   	ret    

001045a0 <rmv_ptbl_entry>:
// Sets the specified page table entry to 0.
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int pte_index)
{
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
    pt[pte_index] = 0;
  1045a0:	e8 27 c8 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  1045a5:	81 c2 5b 6a 00 00    	add    $0x6a5b,%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  1045ab:	8b 44 24 04          	mov    0x4(%esp),%eax
  1045af:	c1 e0 0a             	shl    $0xa,%eax
  1045b2:	03 44 24 08          	add    0x8(%esp),%eax
  1045b6:	8b 84 82 00 00 c7 00 	mov    0xc70000(%edx,%eax,4),%eax
    pt[pte_index] = 0;
  1045bd:	8b 54 24 0c          	mov    0xc(%esp),%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  1045c1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    pt[pte_index] = 0;
  1045c6:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
}
  1045cd:	c3                   	ret    
  1045ce:	66 90                	xchg   %ax,%ax

001045d0 <get_ptbl_entry_by_va>:
 * Returns the page table entry corresponding to the virtual address,
 * according to the page structure of process # [proc_index].
 * Returns 0 if the mapping does not exist.
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1045d0:	55                   	push   %ebp
  1045d1:	57                   	push   %edi
  1045d2:	56                   	push   %esi
  1045d3:	53                   	push   %ebx
  1045d4:	e8 33 bd ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1045d9:	81 c3 27 6a 00 00    	add    $0x6a27,%ebx
  1045df:	83 ec 14             	sub    $0x14,%esp
  1045e2:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  1045e6:	8b 7c 24 28          	mov    0x28(%esp),%edi
    unsigned int pde_index = PDE_ADDR(vaddr);
  1045ea:	89 f5                	mov    %esi,%ebp
  1045ec:	c1 ed 16             	shr    $0x16,%ebp
    if (get_pdir_entry(proc_index, pde_index) != 0) {
  1045ef:	55                   	push   %ebp
  1045f0:	57                   	push   %edi
  1045f1:	e8 5a fe ff ff       	call   104450 <get_pdir_entry>
  1045f6:	83 c4 10             	add    $0x10,%esp
  1045f9:	85 c0                	test   %eax,%eax
  1045fb:	75 0b                	jne    104608 <get_ptbl_entry_by_va+0x38>
        return get_ptbl_entry(proc_index, pde_index, PTE_ADDR(vaddr));
    } else {
        return 0;
    }
}
  1045fd:	83 c4 0c             	add    $0xc,%esp
  104600:	5b                   	pop    %ebx
  104601:	5e                   	pop    %esi
  104602:	5f                   	pop    %edi
  104603:	5d                   	pop    %ebp
  104604:	c3                   	ret    
  104605:	8d 76 00             	lea    0x0(%esi),%esi
        return get_ptbl_entry(proc_index, pde_index, PTE_ADDR(vaddr));
  104608:	c1 ee 0c             	shr    $0xc,%esi
  10460b:	83 ec 04             	sub    $0x4,%esp
  10460e:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
  104614:	56                   	push   %esi
  104615:	55                   	push   %ebp
  104616:	57                   	push   %edi
  104617:	e8 e4 fe ff ff       	call   104500 <get_ptbl_entry>
  10461c:	83 c4 10             	add    $0x10,%esp
}
  10461f:	83 c4 0c             	add    $0xc,%esp
  104622:	5b                   	pop    %ebx
  104623:	5e                   	pop    %esi
  104624:	5f                   	pop    %edi
  104625:	5d                   	pop    %ebp
  104626:	c3                   	ret    
  104627:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10462e:	66 90                	xchg   %ax,%ax

00104630 <get_pdir_entry_by_va>:

// Returns the page directory entry corresponding to the given virtual address.
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  104630:	53                   	push   %ebx
  104631:	e8 d6 bc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104636:	81 c3 ca 69 00 00    	add    $0x69ca,%ebx
  10463c:	83 ec 10             	sub    $0x10,%esp
    return get_pdir_entry(proc_index, PDE_ADDR(vaddr));
  10463f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  104643:	c1 e8 16             	shr    $0x16,%eax
  104646:	50                   	push   %eax
  104647:	ff 74 24 1c          	push   0x1c(%esp)
  10464b:	e8 00 fe ff ff       	call   104450 <get_pdir_entry>
}
  104650:	83 c4 18             	add    $0x18,%esp
  104653:	5b                   	pop    %ebx
  104654:	c3                   	ret    
  104655:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10465c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104660 <rmv_ptbl_entry_by_va>:

// Removes the page table entry for the given virtual address.
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  104660:	55                   	push   %ebp
  104661:	57                   	push   %edi
  104662:	56                   	push   %esi
  104663:	53                   	push   %ebx
  104664:	e8 a3 bc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104669:	81 c3 97 69 00 00    	add    $0x6997,%ebx
  10466f:	83 ec 14             	sub    $0x14,%esp
  104672:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  104676:	8b 7c 24 28          	mov    0x28(%esp),%edi
    unsigned int pde_index = PDE_ADDR(vaddr);
  10467a:	89 f5                	mov    %esi,%ebp
  10467c:	c1 ed 16             	shr    $0x16,%ebp
    if (get_pdir_entry(proc_index, pde_index) != 0) {
  10467f:	55                   	push   %ebp
  104680:	57                   	push   %edi
  104681:	e8 ca fd ff ff       	call   104450 <get_pdir_entry>
  104686:	83 c4 10             	add    $0x10,%esp
  104689:	85 c0                	test   %eax,%eax
  10468b:	75 0b                	jne    104698 <rmv_ptbl_entry_by_va+0x38>
        rmv_ptbl_entry(proc_index, pde_index, PTE_ADDR(vaddr));
    }
}
  10468d:	83 c4 0c             	add    $0xc,%esp
  104690:	5b                   	pop    %ebx
  104691:	5e                   	pop    %esi
  104692:	5f                   	pop    %edi
  104693:	5d                   	pop    %ebp
  104694:	c3                   	ret    
  104695:	8d 76 00             	lea    0x0(%esi),%esi
        rmv_ptbl_entry(proc_index, pde_index, PTE_ADDR(vaddr));
  104698:	c1 ee 0c             	shr    $0xc,%esi
  10469b:	83 ec 04             	sub    $0x4,%esp
  10469e:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
  1046a4:	56                   	push   %esi
  1046a5:	55                   	push   %ebp
  1046a6:	57                   	push   %edi
  1046a7:	e8 f4 fe ff ff       	call   1045a0 <rmv_ptbl_entry>
  1046ac:	83 c4 10             	add    $0x10,%esp
}
  1046af:	83 c4 0c             	add    $0xc,%esp
  1046b2:	5b                   	pop    %ebx
  1046b3:	5e                   	pop    %esi
  1046b4:	5f                   	pop    %edi
  1046b5:	5d                   	pop    %ebp
  1046b6:	c3                   	ret    
  1046b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1046be:	66 90                	xchg   %ax,%ax

001046c0 <rmv_pdir_entry_by_va>:

// Removes the page directory entry for the given virtual address.
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1046c0:	53                   	push   %ebx
  1046c1:	e8 46 bc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1046c6:	81 c3 3a 69 00 00    	add    $0x693a,%ebx
  1046cc:	83 ec 10             	sub    $0x10,%esp
    rmv_pdir_entry(proc_index, PDE_ADDR(vaddr));
  1046cf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1046d3:	c1 e8 16             	shr    $0x16,%eax
  1046d6:	50                   	push   %eax
  1046d7:	ff 74 24 1c          	push   0x1c(%esp)
  1046db:	e8 f0 fd ff ff       	call   1044d0 <rmv_pdir_entry>
}
  1046e0:	83 c4 18             	add    $0x18,%esp
  1046e3:	5b                   	pop    %ebx
  1046e4:	c3                   	ret    
  1046e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1046ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001046f0 <set_ptbl_entry_by_va>:

// Maps the virtual address [vaddr] to the physical page # [page_index] with permission [perm].
// You do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index, unsigned int perm)
{
  1046f0:	53                   	push   %ebx
  1046f1:	e8 16 bc ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1046f6:	81 c3 0a 69 00 00    	add    $0x690a,%ebx
  1046fc:	83 ec 14             	sub    $0x14,%esp
  1046ff:	8b 44 24 20          	mov    0x20(%esp),%eax
    set_ptbl_entry(proc_index, PDE_ADDR(vaddr), PTE_ADDR(vaddr), page_index, perm);
  104703:	ff 74 24 28          	push   0x28(%esp)
  104707:	ff 74 24 28          	push   0x28(%esp)
  10470b:	89 c2                	mov    %eax,%edx
  10470d:	c1 e8 16             	shr    $0x16,%eax
  104710:	c1 ea 0c             	shr    $0xc,%edx
  104713:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  104719:	52                   	push   %edx
  10471a:	50                   	push   %eax
  10471b:	ff 74 24 2c          	push   0x2c(%esp)
  10471f:	e8 0c fe ff ff       	call   104530 <set_ptbl_entry>
}
  104724:	83 c4 28             	add    $0x28,%esp
  104727:	5b                   	pop    %ebx
  104728:	c3                   	ret    
  104729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104730 <set_pdir_entry_by_va>:

// Registers the mapping from [vaddr] to physical page # [page_index] in the page directory.
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index)
{
  104730:	53                   	push   %ebx
  104731:	e8 d6 bb ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104736:	81 c3 ca 68 00 00    	add    $0x68ca,%ebx
  10473c:	83 ec 0c             	sub    $0xc,%esp
    set_pdir_entry(proc_index, PDE_ADDR(vaddr), page_index);
  10473f:	ff 74 24 1c          	push   0x1c(%esp)
  104743:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  104747:	c1 e8 16             	shr    $0x16,%eax
  10474a:	50                   	push   %eax
  10474b:	ff 74 24 1c          	push   0x1c(%esp)
  10474f:	e8 1c fd ff ff       	call   104470 <set_pdir_entry>
}
  104754:	83 c4 18             	add    $0x18,%esp
  104757:	5b                   	pop    %ebx
  104758:	c3                   	ret    
  104759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104760 <idptbl_init>:

// Initializes the identity page table.
// The permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// While the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_addr)
{
  104760:	55                   	push   %ebp
    unsigned int pde_index, pte_index, perm;
    container_init(mbi_addr);

    // Set up IDPTbl
    for (pde_index = 0; pde_index < 1024; pde_index++) {
  104761:	31 ed                	xor    %ebp,%ebp
{
  104763:	57                   	push   %edi
  104764:	56                   	push   %esi
  104765:	53                   	push   %ebx
  104766:	e8 a1 bb ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10476b:	81 c3 95 68 00 00    	add    $0x6895,%ebx
  104771:	83 ec 18             	sub    $0x18,%esp
    container_init(mbi_addr);
  104774:	ff 74 24 2c          	push   0x2c(%esp)
  104778:	e8 e3 f9 ff ff       	call   104160 <container_init>
  10477d:	83 c4 10             	add    $0x10,%esp
        if ((pde_index < VM_USERLO_PDE) || (VM_USERHI_PDE <= pde_index)) {
  104780:	8d 85 00 ff ff ff    	lea    -0x100(%ebp),%eax
            // kernel mapping
            perm = PTE_P | PTE_W | PTE_G;
        } else {
            // normal memory
            perm = PTE_P | PTE_W;
  104786:	3d c0 02 00 00       	cmp    $0x2c0,%eax
  10478b:	19 ff                	sbb    %edi,%edi
        }

        for (pte_index = 0; pte_index < 1024; pte_index++) {
  10478d:	31 f6                	xor    %esi,%esi
            perm = PTE_P | PTE_W;
  10478f:	81 e7 00 ff ff ff    	and    $0xffffff00,%edi
  104795:	81 c7 03 01 00 00    	add    $0x103,%edi
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  10479b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  10479f:	90                   	nop
            set_ptbl_entry_identity(pde_index, pte_index, perm);
  1047a0:	83 ec 04             	sub    $0x4,%esp
  1047a3:	57                   	push   %edi
  1047a4:	56                   	push   %esi
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  1047a5:	83 c6 01             	add    $0x1,%esi
            set_ptbl_entry_identity(pde_index, pte_index, perm);
  1047a8:	55                   	push   %ebp
  1047a9:	e8 c2 fd ff ff       	call   104570 <set_ptbl_entry_identity>
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  1047ae:	83 c4 10             	add    $0x10,%esp
  1047b1:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  1047b7:	75 e7                	jne    1047a0 <idptbl_init+0x40>
    for (pde_index = 0; pde_index < 1024; pde_index++) {
  1047b9:	83 c5 01             	add    $0x1,%ebp
  1047bc:	81 fd 00 04 00 00    	cmp    $0x400,%ebp
  1047c2:	75 bc                	jne    104780 <idptbl_init+0x20>
        }
    }
}
  1047c4:	83 c4 0c             	add    $0xc,%esp
  1047c7:	5b                   	pop    %ebx
  1047c8:	5e                   	pop    %esi
  1047c9:	5f                   	pop    %edi
  1047ca:	5d                   	pop    %ebp
  1047cb:	c3                   	ret    
  1047cc:	66 90                	xchg   %ax,%ax
  1047ce:	66 90                	xchg   %ax,%ax

001047d0 <pdir_init>:
 * For each process from id 0 to NUM_IDS - 1,
 * set up the page directory entries so that the kernel portion of the map is
 * the identity map, and the rest of the page directories are unmapped.
 */
void pdir_init(unsigned int mbi_addr)
{
  1047d0:	57                   	push   %edi
    unsigned int proc_index, pde_index;
    idptbl_init(mbi_addr);

    for (proc_index = 0; proc_index < NUM_IDS; proc_index++) {
  1047d1:	31 ff                	xor    %edi,%edi
{
  1047d3:	56                   	push   %esi
  1047d4:	53                   	push   %ebx
  1047d5:	e8 32 bb ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1047da:	81 c3 26 68 00 00    	add    $0x6826,%ebx
    idptbl_init(mbi_addr);
  1047e0:	83 ec 0c             	sub    $0xc,%esp
  1047e3:	ff 74 24 1c          	push   0x1c(%esp)
  1047e7:	e8 74 ff ff ff       	call   104760 <idptbl_init>
  1047ec:	83 c4 10             	add    $0x10,%esp
        for (pde_index = 0; pde_index < 1024; pde_index++) {
  1047ef:	31 c0                	xor    %eax,%eax
  1047f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            if ((pde_index < VM_USERLO_PDE) || (VM_USERHI_PDE <= pde_index)) {
  1047f8:	8d 90 00 ff ff ff    	lea    -0x100(%eax),%edx
        for (pde_index = 0; pde_index < 1024; pde_index++) {
  1047fe:	8d 70 01             	lea    0x1(%eax),%esi
            if ((pde_index < VM_USERLO_PDE) || (VM_USERHI_PDE <= pde_index)) {
  104801:	81 fa bf 02 00 00    	cmp    $0x2bf,%edx
  104807:	77 11                	ja     10481a <pdir_init+0x4a>
                set_pdir_entry_identity(proc_index, pde_index);
            } else {
                rmv_pdir_entry(proc_index, pde_index);
  104809:	83 ec 08             	sub    $0x8,%esp
  10480c:	50                   	push   %eax
  10480d:	57                   	push   %edi
  10480e:	e8 bd fc ff ff       	call   1044d0 <rmv_pdir_entry>
  104813:	83 c4 10             	add    $0x10,%esp
        for (pde_index = 0; pde_index < 1024; pde_index++) {
  104816:	89 f0                	mov    %esi,%eax
  104818:	eb de                	jmp    1047f8 <pdir_init+0x28>
                set_pdir_entry_identity(proc_index, pde_index);
  10481a:	83 ec 08             	sub    $0x8,%esp
  10481d:	50                   	push   %eax
  10481e:	57                   	push   %edi
  10481f:	e8 7c fc ff ff       	call   1044a0 <set_pdir_entry_identity>
        for (pde_index = 0; pde_index < 1024; pde_index++) {
  104824:	83 c4 10             	add    $0x10,%esp
  104827:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  10482d:	75 e7                	jne    104816 <pdir_init+0x46>
    for (proc_index = 0; proc_index < NUM_IDS; proc_index++) {
  10482f:	83 c7 01             	add    $0x1,%edi
  104832:	83 ff 40             	cmp    $0x40,%edi
  104835:	75 b8                	jne    1047ef <pdir_init+0x1f>
            }
        }
    }
}
  104837:	5b                   	pop    %ebx
  104838:	5e                   	pop    %esi
  104839:	5f                   	pop    %edi
  10483a:	c3                   	ret    
  10483b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  10483f:	90                   	nop

00104840 <alloc_ptbl>:
 * and clears (set to 0) all page table entries for this newly mapped page table.
 * It returns the page index of the newly allocated physical page.
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  104840:	55                   	push   %ebp
  104841:	57                   	push   %edi
  104842:	56                   	push   %esi
  104843:	53                   	push   %ebx
  104844:	e8 c3 ba ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104849:	81 c3 b7 67 00 00    	add    $0x67b7,%ebx
  10484f:	83 ec 28             	sub    $0x28,%esp
  104852:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    unsigned int page_index = container_alloc(proc_index);
  104856:	56                   	push   %esi
  104857:	e8 04 fb ff ff       	call   104360 <container_alloc>
  10485c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    unsigned int pde_index = PDE_ADDR(vaddr);
    unsigned int pte_index;

    if (page_index == 0) {
  104860:	83 c4 10             	add    $0x10,%esp
  104863:	85 c0                	test   %eax,%eax
  104865:	75 0c                	jne    104873 <alloc_ptbl+0x33>
            rmv_ptbl_entry(proc_index, pde_index, pte_index);
        }

        return page_index;
    }
}
  104867:	8b 44 24 0c          	mov    0xc(%esp),%eax
  10486b:	83 c4 1c             	add    $0x1c,%esp
  10486e:	5b                   	pop    %ebx
  10486f:	5e                   	pop    %esi
  104870:	5f                   	pop    %edi
  104871:	5d                   	pop    %ebp
  104872:	c3                   	ret    
    unsigned int pde_index = PDE_ADDR(vaddr);
  104873:	8b 7c 24 34          	mov    0x34(%esp),%edi
        set_pdir_entry_by_va(proc_index, vaddr, page_index);
  104877:	83 ec 04             	sub    $0x4,%esp
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  10487a:	31 ed                	xor    %ebp,%ebp
        set_pdir_entry_by_va(proc_index, vaddr, page_index);
  10487c:	50                   	push   %eax
  10487d:	ff 74 24 3c          	push   0x3c(%esp)
    unsigned int pde_index = PDE_ADDR(vaddr);
  104881:	c1 ef 16             	shr    $0x16,%edi
        set_pdir_entry_by_va(proc_index, vaddr, page_index);
  104884:	56                   	push   %esi
  104885:	e8 a6 fe ff ff       	call   104730 <set_pdir_entry_by_va>
  10488a:	83 c4 10             	add    $0x10,%esp
  10488d:	8d 76 00             	lea    0x0(%esi),%esi
            rmv_ptbl_entry(proc_index, pde_index, pte_index);
  104890:	83 ec 04             	sub    $0x4,%esp
  104893:	55                   	push   %ebp
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  104894:	83 c5 01             	add    $0x1,%ebp
            rmv_ptbl_entry(proc_index, pde_index, pte_index);
  104897:	57                   	push   %edi
  104898:	56                   	push   %esi
  104899:	e8 02 fd ff ff       	call   1045a0 <rmv_ptbl_entry>
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  10489e:	83 c4 10             	add    $0x10,%esp
  1048a1:	81 fd 00 04 00 00    	cmp    $0x400,%ebp
  1048a7:	75 e7                	jne    104890 <alloc_ptbl+0x50>
}
  1048a9:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1048ad:	83 c4 1c             	add    $0x1c,%esp
  1048b0:	5b                   	pop    %ebx
  1048b1:	5e                   	pop    %esi
  1048b2:	5f                   	pop    %edi
  1048b3:	5d                   	pop    %ebp
  1048b4:	c3                   	ret    
  1048b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1048bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001048c0 <free_ptbl>:

// Reverse operation of alloc_ptbl.
// Removes corresponding the page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  1048c0:	55                   	push   %ebp
  1048c1:	57                   	push   %edi
  1048c2:	56                   	push   %esi
  1048c3:	53                   	push   %ebx
  1048c4:	e8 43 ba ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1048c9:	81 c3 37 67 00 00    	add    $0x6737,%ebx
  1048cf:	83 ec 14             	sub    $0x14,%esp
  1048d2:	8b 6c 24 28          	mov    0x28(%esp),%ebp
  1048d6:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    unsigned int page_index = get_pdir_entry_by_va(proc_index, vaddr) >> 12;
  1048da:	57                   	push   %edi

    rmv_pdir_entry(proc_index, PDE_ADDR(vaddr));
  1048db:	c1 ef 16             	shr    $0x16,%edi
    unsigned int page_index = get_pdir_entry_by_va(proc_index, vaddr) >> 12;
  1048de:	55                   	push   %ebp
  1048df:	e8 4c fd ff ff       	call   104630 <get_pdir_entry_by_va>
  1048e4:	89 c6                	mov    %eax,%esi
    rmv_pdir_entry(proc_index, PDE_ADDR(vaddr));
  1048e6:	58                   	pop    %eax
  1048e7:	5a                   	pop    %edx
  1048e8:	57                   	push   %edi
  1048e9:	55                   	push   %ebp
    unsigned int page_index = get_pdir_entry_by_va(proc_index, vaddr) >> 12;
  1048ea:	c1 ee 0c             	shr    $0xc,%esi
    rmv_pdir_entry(proc_index, PDE_ADDR(vaddr));
  1048ed:	e8 de fb ff ff       	call   1044d0 <rmv_pdir_entry>
    container_free(proc_index, page_index);
  1048f2:	59                   	pop    %ecx
  1048f3:	5f                   	pop    %edi
  1048f4:	56                   	push   %esi
  1048f5:	55                   	push   %ebp
  1048f6:	e8 b5 fa ff ff       	call   1043b0 <container_free>
}
  1048fb:	83 c4 1c             	add    $0x1c,%esp
  1048fe:	5b                   	pop    %ebx
  1048ff:	5e                   	pop    %esi
  104900:	5f                   	pop    %edi
  104901:	5d                   	pop    %ebp
  104902:	c3                   	ret    
  104903:	66 90                	xchg   %ax,%ax
  104905:	66 90                	xchg   %ax,%ax
  104907:	66 90                	xchg   %ax,%ax
  104909:	66 90                	xchg   %ax,%ax
  10490b:	66 90                	xchg   %ax,%ax
  10490d:	66 90                	xchg   %ax,%ax
  10490f:	90                   	nop

00104910 <pdir_init_kern>:
/**
 * Sets the entire page map for process 0 as the identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_addr)
{
  104910:	56                   	push   %esi
    unsigned int pde_index;

    pdir_init(mbi_addr);

    // Set identity map for user PDEs
    for (pde_index = VM_USERLO_PDE; pde_index < VM_USERHI_PDE; pde_index++) {
  104911:	be 00 01 00 00       	mov    $0x100,%esi
{
  104916:	53                   	push   %ebx
  104917:	e8 f0 b9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  10491c:	81 c3 e4 66 00 00    	add    $0x66e4,%ebx
  104922:	83 ec 10             	sub    $0x10,%esp
    pdir_init(mbi_addr);
  104925:	ff 74 24 1c          	push   0x1c(%esp)
  104929:	e8 a2 fe ff ff       	call   1047d0 <pdir_init>
  10492e:	83 c4 10             	add    $0x10,%esp
  104931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        set_pdir_entry_identity(0, pde_index);
  104938:	83 ec 08             	sub    $0x8,%esp
  10493b:	56                   	push   %esi
    for (pde_index = VM_USERLO_PDE; pde_index < VM_USERHI_PDE; pde_index++) {
  10493c:	83 c6 01             	add    $0x1,%esi
        set_pdir_entry_identity(0, pde_index);
  10493f:	6a 00                	push   $0x0
  104941:	e8 5a fb ff ff       	call   1044a0 <set_pdir_entry_identity>
    for (pde_index = VM_USERLO_PDE; pde_index < VM_USERHI_PDE; pde_index++) {
  104946:	83 c4 10             	add    $0x10,%esp
  104949:	81 fe c0 03 00 00    	cmp    $0x3c0,%esi
  10494f:	75 e7                	jne    104938 <pdir_init_kern+0x28>
    }
}
  104951:	83 c4 04             	add    $0x4,%esp
  104954:	5b                   	pop    %ebx
  104955:	5e                   	pop    %esi
  104956:	c3                   	ret    
  104957:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10495e:	66 90                	xchg   %ax,%ax

00104960 <map_page>:
 * otherwise, it returns the physical page index registered in the page directory,
 * (the return value of get_pdir_entry_by_va or alloc_ptbl).
 */
unsigned int map_page(unsigned int proc_index, unsigned int vaddr,
                      unsigned int page_index, unsigned int perm)
{
  104960:	55                   	push   %ebp
  104961:	57                   	push   %edi
  104962:	56                   	push   %esi
  104963:	53                   	push   %ebx
  104964:	e8 a3 b9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104969:	81 c3 97 66 00 00    	add    $0x6697,%ebx
  10496f:	83 ec 14             	sub    $0x14,%esp
  104972:	8b 7c 24 28          	mov    0x28(%esp),%edi
  104976:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
    unsigned int pde_entry = get_pdir_entry_by_va(proc_index, vaddr);
  10497a:	55                   	push   %ebp
  10497b:	57                   	push   %edi
  10497c:	e8 af fc ff ff       	call   104630 <get_pdir_entry_by_va>
    unsigned int pde_page_index = pde_entry >> 12;

    if (pde_entry == 0) {
  104981:	83 c4 10             	add    $0x10,%esp
  104984:	85 c0                	test   %eax,%eax
  104986:	74 28                	je     1049b0 <map_page+0x50>
    unsigned int pde_page_index = pde_entry >> 12;
  104988:	c1 e8 0c             	shr    $0xc,%eax
  10498b:	89 c6                	mov    %eax,%esi
        if (pde_page_index == 0) {
            return MagicNumber;
        }
    }

    set_ptbl_entry_by_va(proc_index, vaddr, page_index, perm);
  10498d:	ff 74 24 2c          	push   0x2c(%esp)
  104991:	ff 74 24 2c          	push   0x2c(%esp)
  104995:	55                   	push   %ebp
  104996:	57                   	push   %edi
  104997:	e8 54 fd ff ff       	call   1046f0 <set_ptbl_entry_by_va>
    return pde_page_index;
  10499c:	83 c4 10             	add    $0x10,%esp
}
  10499f:	89 f0                	mov    %esi,%eax
  1049a1:	83 c4 0c             	add    $0xc,%esp
  1049a4:	5b                   	pop    %ebx
  1049a5:	5e                   	pop    %esi
  1049a6:	5f                   	pop    %edi
  1049a7:	5d                   	pop    %ebp
  1049a8:	c3                   	ret    
  1049a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        pde_page_index = alloc_ptbl(proc_index, vaddr);
  1049b0:	83 ec 08             	sub    $0x8,%esp
  1049b3:	55                   	push   %ebp
  1049b4:	57                   	push   %edi
  1049b5:	e8 86 fe ff ff       	call   104840 <alloc_ptbl>
        if (pde_page_index == 0) {
  1049ba:	83 c4 10             	add    $0x10,%esp
        pde_page_index = alloc_ptbl(proc_index, vaddr);
  1049bd:	89 c6                	mov    %eax,%esi
        if (pde_page_index == 0) {
  1049bf:	85 c0                	test   %eax,%eax
  1049c1:	75 ca                	jne    10498d <map_page+0x2d>
}
  1049c3:	83 c4 0c             	add    $0xc,%esp
            return MagicNumber;
  1049c6:	be 01 00 10 00       	mov    $0x100001,%esi
}
  1049cb:	5b                   	pop    %ebx
  1049cc:	89 f0                	mov    %esi,%eax
  1049ce:	5e                   	pop    %esi
  1049cf:	5f                   	pop    %edi
  1049d0:	5d                   	pop    %ebp
  1049d1:	c3                   	ret    
  1049d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1049d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001049e0 <unmap_page>:
 * Nothing should be done if the mapping no longer exists.
 * You do not need to unmap the page table from the page directory.
 * It should return the corresponding page table entry.
 */
unsigned int unmap_page(unsigned int proc_index, unsigned int vaddr)
{
  1049e0:	57                   	push   %edi
  1049e1:	56                   	push   %esi
  1049e2:	53                   	push   %ebx
  1049e3:	e8 24 b9 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1049e8:	81 c3 18 66 00 00    	add    $0x6618,%ebx
  1049ee:	83 ec 18             	sub    $0x18,%esp
  1049f1:	8b 74 24 28          	mov    0x28(%esp),%esi
  1049f5:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    unsigned int pte_entry = get_ptbl_entry_by_va(proc_index, vaddr);
  1049f9:	57                   	push   %edi
  1049fa:	56                   	push   %esi
  1049fb:	e8 d0 fb ff ff       	call   1045d0 <get_ptbl_entry_by_va>
    if (pte_entry != 0) {
  104a00:	83 c4 10             	add    $0x10,%esp
  104a03:	85 c0                	test   %eax,%eax
  104a05:	75 09                	jne    104a10 <unmap_page+0x30>
        rmv_ptbl_entry_by_va(proc_index, vaddr);
    }
    return pte_entry;
}
  104a07:	83 c4 10             	add    $0x10,%esp
  104a0a:	5b                   	pop    %ebx
  104a0b:	5e                   	pop    %esi
  104a0c:	5f                   	pop    %edi
  104a0d:	c3                   	ret    
  104a0e:	66 90                	xchg   %ax,%ax
  104a10:	89 44 24 0c          	mov    %eax,0xc(%esp)
        rmv_ptbl_entry_by_va(proc_index, vaddr);
  104a14:	83 ec 08             	sub    $0x8,%esp
  104a17:	57                   	push   %edi
  104a18:	56                   	push   %esi
  104a19:	e8 42 fc ff ff       	call   104660 <rmv_ptbl_entry_by_va>
  104a1e:	83 c4 10             	add    $0x10,%esp
  104a21:	8b 44 24 0c          	mov    0xc(%esp),%eax
}
  104a25:	83 c4 10             	add    $0x10,%esp
  104a28:	5b                   	pop    %ebx
  104a29:	5e                   	pop    %esi
  104a2a:	5f                   	pop    %edi
  104a2b:	c3                   	ret    
  104a2c:	66 90                	xchg   %ax,%ax
  104a2e:	66 90                	xchg   %ax,%ax

00104a30 <paging_init>:
/**
 * Initializes the page structures, moves to the kernel page structure (0),
 * and turns on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  104a30:	53                   	push   %ebx
  104a31:	e8 d6 b8 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104a36:	81 c3 ca 65 00 00    	add    $0x65ca,%ebx
  104a3c:	83 ec 14             	sub    $0x14,%esp
    pdir_init_kern(mbi_addr);
  104a3f:	ff 74 24 1c          	push   0x1c(%esp)
  104a43:	e8 c8 fe ff ff       	call   104910 <pdir_init_kern>
    set_pdir_base(0);
  104a48:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104a4f:	e8 cc f9 ff ff       	call   104420 <set_pdir_base>
    enable_paging();
  104a54:	e8 36 c3 ff ff       	call   100d8f <enable_paging>
}
  104a59:	83 c4 18             	add    $0x18,%esp
  104a5c:	5b                   	pop    %ebx
  104a5d:	c3                   	ret    
  104a5e:	66 90                	xchg   %ax,%ax

00104a60 <alloc_page>:
 * return value from map_page.
 * In the case of error, it should return the constant MagicNumber.
 */
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr,
                        unsigned int perm)
{
  104a60:	56                   	push   %esi
  104a61:	53                   	push   %ebx
  104a62:	e8 a5 b8 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104a67:	81 c3 99 65 00 00    	add    $0x6599,%ebx
  104a6d:	83 ec 10             	sub    $0x10,%esp
  104a70:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    unsigned int page_index = container_alloc(proc_index);
  104a74:	56                   	push   %esi
  104a75:	e8 e6 f8 ff ff       	call   104360 <container_alloc>
    if (page_index != 0) {
  104a7a:	83 c4 10             	add    $0x10,%esp
  104a7d:	ba 01 00 10 00       	mov    $0x100001,%edx
  104a82:	85 c0                	test   %eax,%eax
  104a84:	74 14                	je     104a9a <alloc_page+0x3a>
        return map_page(proc_index, vaddr, page_index, perm);
  104a86:	ff 74 24 18          	push   0x18(%esp)
  104a8a:	50                   	push   %eax
  104a8b:	ff 74 24 1c          	push   0x1c(%esp)
  104a8f:	56                   	push   %esi
  104a90:	e8 cb fe ff ff       	call   104960 <map_page>
  104a95:	83 c4 10             	add    $0x10,%esp
  104a98:	89 c2                	mov    %eax,%edx
    } else {
        return MagicNumber;
    }
}
  104a9a:	83 c4 04             	add    $0x4,%esp
  104a9d:	89 d0                	mov    %edx,%eax
  104a9f:	5b                   	pop    %ebx
  104aa0:	5e                   	pop    %esi
  104aa1:	c3                   	ret    
  104aa2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104ab0 <alloc_mem_quota>:

/**
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota)
{
  104ab0:	53                   	push   %ebx
  104ab1:	e8 56 b8 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104ab6:	81 c3 4a 65 00 00    	add    $0x654a,%ebx
  104abc:	83 ec 10             	sub    $0x10,%esp
    unsigned int child;
    child = container_split(id, quota);
  104abf:	ff 74 24 1c          	push   0x1c(%esp)
  104ac3:	ff 74 24 1c          	push   0x1c(%esp)
  104ac7:	e8 14 f8 ff ff       	call   1042e0 <container_split>
    return child;
}
  104acc:	83 c4 18             	add    $0x18,%esp
  104acf:	5b                   	pop    %ebx
  104ad0:	c3                   	ret    
  104ad1:	66 90                	xchg   %ax,%ax
  104ad3:	66 90                	xchg   %ax,%ax
  104ad5:	66 90                	xchg   %ax,%ax
  104ad7:	66 90                	xchg   %ax,%ax
  104ad9:	66 90                	xchg   %ax,%ax
  104adb:	66 90                	xchg   %ax,%ax
  104add:	66 90                	xchg   %ax,%ax
  104adf:	90                   	nop

00104ae0 <kctx_set_esp>:
// Memory to save the NUM_IDS kernel thread states.
struct kctx kctx_pool[NUM_IDS];

void kctx_set_esp(unsigned int pid, void *esp)
{
    kctx_pool[pid].esp = esp;
  104ae0:	e8 e7 c2 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104ae5:	81 c2 1b 65 00 00    	add    $0x651b,%edx
{
  104aeb:	8b 44 24 04          	mov    0x4(%esp),%eax
    kctx_pool[pid].esp = esp;
  104aef:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104af3:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104af6:	89 8c c2 00 00 cb 00 	mov    %ecx,0xcb0000(%edx,%eax,8)
}
  104afd:	c3                   	ret    
  104afe:	66 90                	xchg   %ax,%ax

00104b00 <kctx_set_eip>:

void kctx_set_eip(unsigned int pid, void *eip)
{
    kctx_pool[pid].eip = eip;
  104b00:	e8 c7 c2 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104b05:	81 c2 fb 64 00 00    	add    $0x64fb,%edx
{
  104b0b:	8b 44 24 04          	mov    0x4(%esp),%eax
    kctx_pool[pid].eip = eip;
  104b0f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104b13:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104b16:	89 8c c2 14 00 cb 00 	mov    %ecx,0xcb0014(%edx,%eax,8)
}
  104b1d:	c3                   	ret    
  104b1e:	66 90                	xchg   %ax,%ax

00104b20 <kctx_switch>:
/**
 * Saves the states for thread # [from_pid] and restores the states
 * for thread # [to_pid].
 */
void kctx_switch(unsigned int from_pid, unsigned int to_pid)
{
  104b20:	53                   	push   %ebx
  104b21:	e8 e6 b7 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104b26:	81 c3 da 64 00 00    	add    $0x64da,%ebx
  104b2c:	83 ec 10             	sub    $0x10,%esp
  104b2f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  104b33:	8b 54 24 18          	mov    0x18(%esp),%edx
    cswitch(&kctx_pool[from_pid], &kctx_pool[to_pid]);
  104b37:	8d 0c 40             	lea    (%eax,%eax,2),%ecx
  104b3a:	8d 14 52             	lea    (%edx,%edx,2),%edx
  104b3d:	8d 83 00 00 cb 00    	lea    0xcb0000(%ebx),%eax
  104b43:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  104b46:	8d 04 d0             	lea    (%eax,%edx,8),%eax
  104b49:	51                   	push   %ecx
  104b4a:	50                   	push   %eax
  104b4b:	e8 05 00 00 00       	call   104b55 <cswitch>
}
  104b50:	83 c4 18             	add    $0x18,%esp
  104b53:	5b                   	pop    %ebx
  104b54:	c3                   	ret    

00104b55 <cswitch>:
/*
 * void cswitch(struct kctx *from, struct kctx *to);
 */
	.globl cswitch
cswitch:
	movl	4(%esp), %eax	/* %eax <- from */
  104b55:	8b 44 24 04          	mov    0x4(%esp),%eax
	movl	8(%esp), %edx	/* %edx <- to */
  104b59:	8b 54 24 08          	mov    0x8(%esp),%edx

	/* TODO: save the old kernel context */

	/* TODO: load the new kernel context */

	xor	%eax, %eax
  104b5d:	31 c0                	xor    %eax,%eax
	ret
  104b5f:	c3                   	ret    

00104b60 <kctx_new>:
 */
unsigned int kctx_new(void *entry, unsigned int id, unsigned int quota)
{
    // TODO
    return 0;
}
  104b60:	31 c0                	xor    %eax,%eax
  104b62:	c3                   	ret    
  104b63:	66 90                	xchg   %ax,%ax
  104b65:	66 90                	xchg   %ax,%ax
  104b67:	66 90                	xchg   %ax,%ax
  104b69:	66 90                	xchg   %ax,%ax
  104b6b:	66 90                	xchg   %ax,%ax
  104b6d:	66 90                	xchg   %ax,%ax
  104b6f:	90                   	nop

00104b70 <tcb_get_state>:

struct TCB TCBPool[NUM_IDS];

unsigned int tcb_get_state(unsigned int pid)
{
    return TCBPool[pid].state;
  104b70:	e8 57 c2 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104b75:	81 c2 8b 64 00 00    	add    $0x648b,%edx
{
  104b7b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return TCBPool[pid].state;
  104b7f:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104b82:	8b 84 82 00 06 cb 00 	mov    0xcb0600(%edx,%eax,4),%eax
}
  104b89:	c3                   	ret    
  104b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104b90 <tcb_set_state>:

void tcb_set_state(unsigned int pid, unsigned int state)
{
    TCBPool[pid].state = state;
  104b90:	e8 37 c2 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104b95:	81 c2 6b 64 00 00    	add    $0x646b,%edx
{
  104b9b:	8b 44 24 04          	mov    0x4(%esp),%eax
    TCBPool[pid].state = state;
  104b9f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104ba3:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104ba6:	89 8c 82 00 06 cb 00 	mov    %ecx,0xcb0600(%edx,%eax,4)
}
  104bad:	c3                   	ret    
  104bae:	66 90                	xchg   %ax,%ax

00104bb0 <tcb_get_prev>:

unsigned int tcb_get_prev(unsigned int pid)
{
    return TCBPool[pid].prev;
  104bb0:	e8 17 c2 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104bb5:	81 c2 4b 64 00 00    	add    $0x644b,%edx
{
  104bbb:	8b 44 24 04          	mov    0x4(%esp),%eax
    return TCBPool[pid].prev;
  104bbf:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104bc2:	8b 84 82 04 06 cb 00 	mov    0xcb0604(%edx,%eax,4),%eax
}
  104bc9:	c3                   	ret    
  104bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104bd0 <tcb_set_prev>:

void tcb_set_prev(unsigned int pid, unsigned int prev_pid)
{
    TCBPool[pid].prev = prev_pid;
  104bd0:	e8 f7 c1 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104bd5:	81 c2 2b 64 00 00    	add    $0x642b,%edx
{
  104bdb:	8b 44 24 04          	mov    0x4(%esp),%eax
    TCBPool[pid].prev = prev_pid;
  104bdf:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104be3:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104be6:	89 8c 82 04 06 cb 00 	mov    %ecx,0xcb0604(%edx,%eax,4)
}
  104bed:	c3                   	ret    
  104bee:	66 90                	xchg   %ax,%ax

00104bf0 <tcb_get_next>:

unsigned int tcb_get_next(unsigned int pid)
{
    return TCBPool[pid].next;
  104bf0:	e8 d7 c1 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104bf5:	81 c2 0b 64 00 00    	add    $0x640b,%edx
{
  104bfb:	8b 44 24 04          	mov    0x4(%esp),%eax
    return TCBPool[pid].next;
  104bff:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104c02:	8b 84 82 08 06 cb 00 	mov    0xcb0608(%edx,%eax,4),%eax
}
  104c09:	c3                   	ret    
  104c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104c10 <tcb_set_next>:

void tcb_set_next(unsigned int pid, unsigned int next_pid)
{
    TCBPool[pid].next = next_pid;
  104c10:	e8 b7 c1 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104c15:	81 c2 eb 63 00 00    	add    $0x63eb,%edx
{
  104c1b:	8b 44 24 04          	mov    0x4(%esp),%eax
    TCBPool[pid].next = next_pid;
  104c1f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104c23:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104c26:	89 8c 82 08 06 cb 00 	mov    %ecx,0xcb0608(%edx,%eax,4)
}
  104c2d:	c3                   	ret    
  104c2e:	66 90                	xchg   %ax,%ax

00104c30 <tcb_init_at_id>:

void tcb_init_at_id(unsigned int pid)
{
    TCBPool[pid].state = TSTATE_DEAD;
  104c30:	e8 97 c1 ff ff       	call   100dcc <__x86.get_pc_thunk.dx>
  104c35:	81 c2 cb 63 00 00    	add    $0x63cb,%edx
{
  104c3b:	8b 44 24 04          	mov    0x4(%esp),%eax
    TCBPool[pid].state = TSTATE_DEAD;
  104c3f:	8d 04 40             	lea    (%eax,%eax,2),%eax
  104c42:	c1 e0 02             	shl    $0x2,%eax
  104c45:	c7 84 02 00 06 cb 00 	movl   $0x3,0xcb0600(%edx,%eax,1)
  104c4c:	03 00 00 00 
    TCBPool[pid].prev = NUM_IDS;
  104c50:	8d 84 02 00 06 cb 00 	lea    0xcb0600(%edx,%eax,1),%eax
  104c57:	c7 40 04 40 00 00 00 	movl   $0x40,0x4(%eax)
    TCBPool[pid].next = NUM_IDS;
  104c5e:	c7 40 08 40 00 00 00 	movl   $0x40,0x8(%eax)
}
  104c65:	c3                   	ret    
  104c66:	66 90                	xchg   %ax,%ax
  104c68:	66 90                	xchg   %ax,%ax
  104c6a:	66 90                	xchg   %ax,%ax
  104c6c:	66 90                	xchg   %ax,%ax
  104c6e:	66 90                	xchg   %ax,%ax

00104c70 <tcb_init>:
/**
 * Initializes the TCB for all NUM_IDS threads with the state TSTATE_DEAD,
 * and with two indices being NUM_IDS (which represents NULL).
 */
void tcb_init(unsigned int mbi_addr)
{
  104c70:	53                   	push   %ebx
  104c71:	e8 96 b6 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104c76:	81 c3 8a 63 00 00    	add    $0x638a,%ebx
  104c7c:	83 ec 14             	sub    $0x14,%esp
    // TODO: define your local variables here.

    paging_init(mbi_addr);
  104c7f:	ff 74 24 1c          	push   0x1c(%esp)
  104c83:	e8 a8 fd ff ff       	call   104a30 <paging_init>

    // TODO
}
  104c88:	83 c4 18             	add    $0x18,%esp
  104c8b:	5b                   	pop    %ebx
  104c8c:	c3                   	ret    
  104c8d:	66 90                	xchg   %ax,%ax
  104c8f:	90                   	nop

00104c90 <tqueue_get_head>:
 */
struct TQueue TQueuePool[NUM_IDS + 1];

unsigned int tqueue_get_head(unsigned int chid)
{
    return TQueuePool[chid].head;
  104c90:	e8 33 c1 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  104c95:	05 6b 63 00 00       	add    $0x636b,%eax
  104c9a:	8b 54 24 04          	mov    0x4(%esp),%edx
  104c9e:	8b 84 d0 00 09 cb 00 	mov    0xcb0900(%eax,%edx,8),%eax
}
  104ca5:	c3                   	ret    
  104ca6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104cad:	8d 76 00             	lea    0x0(%esi),%esi

00104cb0 <tqueue_set_head>:

void tqueue_set_head(unsigned int chid, unsigned int head)
{
    TQueuePool[chid].head = head;
  104cb0:	e8 13 c1 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  104cb5:	05 4b 63 00 00       	add    $0x634b,%eax
  104cba:	8b 54 24 04          	mov    0x4(%esp),%edx
  104cbe:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104cc2:	89 8c d0 00 09 cb 00 	mov    %ecx,0xcb0900(%eax,%edx,8)
}
  104cc9:	c3                   	ret    
  104cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104cd0 <tqueue_get_tail>:

unsigned int tqueue_get_tail(unsigned int chid)
{
    return TQueuePool[chid].tail;
  104cd0:	e8 f3 c0 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  104cd5:	05 2b 63 00 00       	add    $0x632b,%eax
  104cda:	8b 54 24 04          	mov    0x4(%esp),%edx
  104cde:	8b 84 d0 04 09 cb 00 	mov    0xcb0904(%eax,%edx,8),%eax
}
  104ce5:	c3                   	ret    
  104ce6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104ced:	8d 76 00             	lea    0x0(%esi),%esi

00104cf0 <tqueue_set_tail>:

void tqueue_set_tail(unsigned int chid, unsigned int tail)
{
    TQueuePool[chid].tail = tail;
  104cf0:	e8 d3 c0 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  104cf5:	05 0b 63 00 00       	add    $0x630b,%eax
  104cfa:	8b 54 24 04          	mov    0x4(%esp),%edx
  104cfe:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104d02:	89 8c d0 04 09 cb 00 	mov    %ecx,0xcb0904(%eax,%edx,8)
}
  104d09:	c3                   	ret    
  104d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104d10 <tqueue_init_at_id>:

void tqueue_init_at_id(unsigned int chid)
{
    TQueuePool[chid].head = NUM_IDS;
  104d10:	e8 b3 c0 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  104d15:	05 eb 62 00 00       	add    $0x62eb,%eax
{
  104d1a:	8b 54 24 04          	mov    0x4(%esp),%edx
    TQueuePool[chid].head = NUM_IDS;
  104d1e:	c7 84 d0 00 09 cb 00 	movl   $0x40,0xcb0900(%eax,%edx,8)
  104d25:	40 00 00 00 
    TQueuePool[chid].tail = NUM_IDS;
  104d29:	c7 84 d0 04 09 cb 00 	movl   $0x40,0xcb0904(%eax,%edx,8)
  104d30:	40 00 00 00 
}
  104d34:	c3                   	ret    
  104d35:	66 90                	xchg   %ax,%ax
  104d37:	66 90                	xchg   %ax,%ax
  104d39:	66 90                	xchg   %ax,%ax
  104d3b:	66 90                	xchg   %ax,%ax
  104d3d:	66 90                	xchg   %ax,%ax
  104d3f:	90                   	nop

00104d40 <tqueue_init>:

/**
 * Initializes all the thread queues with tqueue_init_at_id.
 */
void tqueue_init(unsigned int mbi_addr)
{
  104d40:	53                   	push   %ebx
  104d41:	e8 c6 b5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104d46:	81 c3 ba 62 00 00    	add    $0x62ba,%ebx
  104d4c:	83 ec 14             	sub    $0x14,%esp
    // TODO: define your local variables here.

    tcb_init(mbi_addr);
  104d4f:	ff 74 24 1c          	push   0x1c(%esp)
  104d53:	e8 18 ff ff ff       	call   104c70 <tcb_init>

    // TODO
}
  104d58:	83 c4 18             	add    $0x18,%esp
  104d5b:	5b                   	pop    %ebx
  104d5c:	c3                   	ret    
  104d5d:	8d 76 00             	lea    0x0(%esi),%esi

00104d60 <tqueue_enqueue>:
 * Hint: there are multiple cases in this function.
 */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{
    // TODO
}
  104d60:	c3                   	ret    
  104d61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104d68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104d6f:	90                   	nop

00104d70 <tqueue_dequeue>:
 */
unsigned int tqueue_dequeue(unsigned int chid)
{
    // TODO
    return 0;
}
  104d70:	31 c0                	xor    %eax,%eax
  104d72:	c3                   	ret    
  104d73:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104d80 <tqueue_remove>:
  104d80:	c3                   	ret    
  104d81:	66 90                	xchg   %ax,%ax
  104d83:	66 90                	xchg   %ax,%ax
  104d85:	66 90                	xchg   %ax,%ax
  104d87:	66 90                	xchg   %ax,%ax
  104d89:	66 90                	xchg   %ax,%ax
  104d8b:	66 90                	xchg   %ax,%ax
  104d8d:	66 90                	xchg   %ax,%ax
  104d8f:	90                   	nop

00104d90 <get_curid>:
unsigned int CURID;

unsigned int get_curid(void)
{
    return CURID;
  104d90:	e8 33 c0 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  104d95:	05 6b 62 00 00       	add    $0x626b,%eax
  104d9a:	8b 80 08 0b cb 00    	mov    0xcb0b08(%eax),%eax
}
  104da0:	c3                   	ret    
  104da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104da8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104daf:	90                   	nop

00104db0 <set_curid>:

void set_curid(unsigned int curid)
{
    CURID = curid;
  104db0:	e8 13 c0 ff ff       	call   100dc8 <__x86.get_pc_thunk.ax>
  104db5:	05 4b 62 00 00       	add    $0x624b,%eax
  104dba:	8b 54 24 04          	mov    0x4(%esp),%edx
  104dbe:	89 90 08 0b cb 00    	mov    %edx,0xcb0b08(%eax)
}
  104dc4:	c3                   	ret    
  104dc5:	66 90                	xchg   %ax,%ax
  104dc7:	66 90                	xchg   %ax,%ax
  104dc9:	66 90                	xchg   %ax,%ax
  104dcb:	66 90                	xchg   %ax,%ax
  104dcd:	66 90                	xchg   %ax,%ax
  104dcf:	90                   	nop

00104dd0 <thread_init>:
#include <lib/thread.h>

#include "import.h"

void thread_init(unsigned int mbi_addr)
{
  104dd0:	53                   	push   %ebx
  104dd1:	e8 36 b5 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104dd6:	81 c3 2a 62 00 00    	add    $0x622a,%ebx
  104ddc:	83 ec 14             	sub    $0x14,%esp
    tqueue_init(mbi_addr);
  104ddf:	ff 74 24 1c          	push   0x1c(%esp)
  104de3:	e8 58 ff ff ff       	call   104d40 <tqueue_init>
    set_curid(0);
  104de8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104def:	e8 bc ff ff ff       	call   104db0 <set_curid>
    tcb_set_state(0, TSTATE_RUN);
  104df4:	58                   	pop    %eax
  104df5:	5a                   	pop    %edx
  104df6:	6a 01                	push   $0x1
  104df8:	6a 00                	push   $0x0
  104dfa:	e8 91 fd ff ff       	call   104b90 <tcb_set_state>
}
  104dff:	83 c4 18             	add    $0x18,%esp
  104e02:	5b                   	pop    %ebx
  104e03:	c3                   	ret    
  104e04:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104e0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104e0f:	90                   	nop

00104e10 <thread_spawn>:
 */
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota)
{
    // TODO
    return 0;
}
  104e10:	31 c0                	xor    %eax,%eax
  104e12:	c3                   	ret    
  104e13:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104e1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104e20 <thread_yield>:
 * do you need to switch to yourself?
 */
void thread_yield(void)
{
    // TODO
}
  104e20:	c3                   	ret    
  104e21:	66 90                	xchg   %ax,%ax
  104e23:	66 90                	xchg   %ax,%ax
  104e25:	66 90                	xchg   %ax,%ax
  104e27:	66 90                	xchg   %ax,%ax
  104e29:	66 90                	xchg   %ax,%ax
  104e2b:	66 90                	xchg   %ax,%ax
  104e2d:	66 90                	xchg   %ax,%ax
  104e2f:	90                   	nop

00104e30 <proc_start_user>:

extern tf_t uctx_pool[NUM_IDS];
extern char STACK_LOC[NUM_IDS][PAGESIZE];

void proc_start_user(void)
{
  104e30:	56                   	push   %esi
  104e31:	53                   	push   %ebx
  104e32:	e8 d5 b4 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104e37:	81 c3 c9 61 00 00    	add    $0x61c9,%ebx
  104e3d:	83 ec 04             	sub    $0x4,%esp
    unsigned int cur_pid = get_curid();
  104e40:	e8 4b ff ff ff       	call   104d90 <get_curid>
    tss_switch(cur_pid);
  104e45:	83 ec 0c             	sub    $0xc,%esp
  104e48:	50                   	push   %eax
    unsigned int cur_pid = get_curid();
  104e49:	89 c6                	mov    %eax,%esi
    tss_switch(cur_pid);
  104e4b:	e8 43 e1 ff ff       	call   102f93 <tss_switch>
    set_pdir_base(cur_pid);
  104e50:	89 34 24             	mov    %esi,(%esp)

    trap_return((void *) &uctx_pool[cur_pid]);
  104e53:	6b f6 44             	imul   $0x44,%esi,%esi
    set_pdir_base(cur_pid);
  104e56:	e8 c5 f5 ff ff       	call   104420 <set_pdir_base>
    trap_return((void *) &uctx_pool[cur_pid]);
  104e5b:	81 c6 20 bb db 00    	add    $0xdbbb20,%esi
  104e61:	89 34 24             	mov    %esi,(%esp)
  104e64:	e8 37 d7 ff ff       	call   1025a0 <trap_return>
}
  104e69:	83 c4 14             	add    $0x14,%esp
  104e6c:	5b                   	pop    %ebx
  104e6d:	5e                   	pop    %esi
  104e6e:	c3                   	ret    
  104e6f:	90                   	nop

00104e70 <proc_create>:

unsigned int proc_create(void *elf_addr, unsigned int quota)
{
  104e70:	57                   	push   %edi
  104e71:	56                   	push   %esi
  104e72:	53                   	push   %ebx
  104e73:	e8 94 b4 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104e78:	81 c3 88 61 00 00    	add    $0x6188,%ebx
    unsigned int pid, id;

    id = get_curid();
  104e7e:	e8 0d ff ff ff       	call   104d90 <get_curid>
    pid = thread_spawn((void *) proc_start_user, id, quota);
  104e83:	83 ec 04             	sub    $0x4,%esp
  104e86:	ff 74 24 18          	push   0x18(%esp)
  104e8a:	50                   	push   %eax
  104e8b:	8d 83 30 9e ff ff    	lea    -0x61d0(%ebx),%eax
  104e91:	50                   	push   %eax
  104e92:	e8 79 ff ff ff       	call   104e10 <thread_spawn>

    if (pid != NUM_IDS) {
  104e97:	83 c4 10             	add    $0x10,%esp
    pid = thread_spawn((void *) proc_start_user, id, quota);
  104e9a:	89 c6                	mov    %eax,%esi
    if (pid != NUM_IDS) {
  104e9c:	83 f8 40             	cmp    $0x40,%eax
  104e9f:	74 58                	je     104ef9 <proc_create+0x89>
        elf_load(elf_addr, pid);
  104ea1:	83 ec 08             	sub    $0x8,%esp

        uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  104ea4:	6b fe 44             	imul   $0x44,%esi,%edi
        elf_load(elf_addr, pid);
  104ea7:	50                   	push   %eax
  104ea8:	ff 74 24 1c          	push   0x1c(%esp)
  104eac:	e8 91 ec ff ff       	call   103b42 <elf_load>
        uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  104eb1:	81 c7 20 bb db 00    	add    $0xdbbb20,%edi
  104eb7:	b8 23 00 00 00       	mov    $0x23,%eax
        uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  104ebc:	ba 23 00 00 00       	mov    $0x23,%edx
        uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  104ec1:	66 89 47 20          	mov    %ax,0x20(%edi)
        uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  104ec5:	b9 1b 00 00 00       	mov    $0x1b,%ecx
        uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  104eca:	b8 23 00 00 00       	mov    $0x23,%eax
        uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  104ecf:	66 89 57 24          	mov    %dx,0x24(%edi)
        uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  104ed3:	66 89 4f 34          	mov    %cx,0x34(%edi)
        uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  104ed7:	66 89 47 40          	mov    %ax,0x40(%edi)
        uctx_pool[pid].esp = VM_USERHI;
  104edb:	c7 47 3c 00 00 00 f0 	movl   $0xf0000000,0x3c(%edi)
        uctx_pool[pid].eflags = FL_IF;
  104ee2:	c7 47 38 00 02 00 00 	movl   $0x200,0x38(%edi)
        uctx_pool[pid].eip = elf_entry(elf_addr);
  104ee9:	58                   	pop    %eax
  104eea:	ff 74 24 1c          	push   0x1c(%esp)
  104eee:	e8 30 ee ff ff       	call   103d23 <elf_entry>
  104ef3:	83 c4 10             	add    $0x10,%esp
  104ef6:	89 47 30             	mov    %eax,0x30(%edi)
    }

    return pid;
}
  104ef9:	89 f0                	mov    %esi,%eax
  104efb:	5b                   	pop    %ebx
  104efc:	5e                   	pop    %esi
  104efd:	5f                   	pop    %edi
  104efe:	c3                   	ret    
  104eff:	90                   	nop

00104f00 <syscall_get_arg1>:
 */
unsigned int syscall_get_arg1(void)
{
    // TODO
    return 0;
}
  104f00:	31 c0                	xor    %eax,%eax
  104f02:	c3                   	ret    
  104f03:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104f10 <syscall_get_arg2>:
  104f10:	31 c0                	xor    %eax,%eax
  104f12:	c3                   	ret    
  104f13:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104f20 <syscall_get_arg3>:
  104f20:	31 c0                	xor    %eax,%eax
  104f22:	c3                   	ret    
  104f23:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104f30 <syscall_get_arg4>:
  104f30:	31 c0                	xor    %eax,%eax
  104f32:	c3                   	ret    
  104f33:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104f40 <syscall_get_arg5>:
  104f40:	31 c0                	xor    %eax,%eax
  104f42:	c3                   	ret    
  104f43:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104f50 <syscall_get_arg6>:
  104f50:	31 c0                	xor    %eax,%eax
  104f52:	c3                   	ret    
  104f53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104f60 <syscall_set_errno>:
 * to the current running process when we return to it.
 */
void syscall_set_errno(unsigned int errno)
{
    // TODO
}
  104f60:	c3                   	ret    
  104f61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f6f:	90                   	nop

00104f70 <syscall_set_retval1>:
  104f70:	c3                   	ret    
  104f71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f78:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f7f:	90                   	nop

00104f80 <syscall_set_retval2>:
  104f80:	c3                   	ret    
  104f81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f8f:	90                   	nop

00104f90 <syscall_set_retval3>:
  104f90:	c3                   	ret    
  104f91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104f9f:	90                   	nop

00104fa0 <syscall_set_retval4>:
  104fa0:	c3                   	ret    
  104fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104fa8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104faf:	90                   	nop

00104fb0 <syscall_set_retval5>:
  104fb0:	c3                   	ret    
  104fb1:	66 90                	xchg   %ax,%ax
  104fb3:	66 90                	xchg   %ax,%ax
  104fb5:	66 90                	xchg   %ax,%ax
  104fb7:	66 90                	xchg   %ax,%ax
  104fb9:	66 90                	xchg   %ax,%ax
  104fbb:	66 90                	xchg   %ax,%ax
  104fbd:	66 90                	xchg   %ax,%ax
  104fbf:	90                   	nop

00104fc0 <sys_puts>:
/**
 * Copies a string from user into buffer and prints it to the screen.
 * This is called by the user level "printf" library as a system call.
 */
void sys_puts(void)
{
  104fc0:	55                   	push   %ebp
  104fc1:	57                   	push   %edi
  104fc2:	56                   	push   %esi
  104fc3:	53                   	push   %ebx
  104fc4:	e8 43 b3 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  104fc9:	81 c3 37 60 00 00    	add    $0x6037,%ebx
  104fcf:	83 ec 1c             	sub    $0x1c,%esp
    unsigned int cur_pid;
    unsigned int str_uva, str_len;
    unsigned int remain, cur_pos, nbytes;

    cur_pid = get_curid();
  104fd2:	e8 b9 fd ff ff       	call   104d90 <get_curid>
  104fd7:	89 44 24 08          	mov    %eax,0x8(%esp)
    str_uva = syscall_get_arg2();
  104fdb:	e8 30 ff ff ff       	call   104f10 <syscall_get_arg2>
  104fe0:	89 c7                	mov    %eax,%edi
    str_len = syscall_get_arg3();
  104fe2:	e8 39 ff ff ff       	call   104f20 <syscall_get_arg3>

    if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
  104fe7:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  104fed:	0f 86 dd 00 00 00    	jbe    1050d0 <sys_puts+0x110>
  104ff3:	01 c7                	add    %eax,%edi
  104ff5:	89 c5                	mov    %eax,%ebp
  104ff7:	81 ff 00 00 00 f0    	cmp    $0xf0000000,%edi
  104ffd:	0f 87 cd 00 00 00    	ja     1050d0 <sys_puts+0x110>
    }

    remain = str_len;
    cur_pos = str_uva;

    while (remain) {
  105003:	85 c0                	test   %eax,%eax
  105005:	0f 84 a9 00 00 00    	je     1050b4 <sys_puts+0xf4>
        if (remain < PAGESIZE - 1)
            nbytes = remain;
        else
            nbytes = PAGESIZE - 1;

        if (pt_copyin(cur_pid, cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
  10500b:	8b 74 24 08          	mov    0x8(%esp),%esi
  10500f:	8d 83 20 1c cb 00    	lea    0xcb1c20(%ebx),%eax
  105015:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105019:	c1 e6 0c             	shl    $0xc,%esi
  10501c:	01 c6                	add    %eax,%esi
  10501e:	eb 3c                	jmp    10505c <sys_puts+0x9c>
  105020:	68 ff 0f 00 00       	push   $0xfff
  105025:	56                   	push   %esi
  105026:	50                   	push   %eax
  105027:	ff 74 24 14          	push   0x14(%esp)
  10502b:	e8 98 e8 ff ff       	call   1038c8 <pt_copyin>
  105030:	83 c4 10             	add    $0x10,%esp
  105033:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  105038:	75 41                	jne    10507b <sys_puts+0xbb>
            syscall_set_errno(E_MEM);
            return;
        }

        sys_buf[cur_pid][nbytes] = '\0';
        KERN_INFO("%s", sys_buf[cur_pid]);
  10503a:	83 ec 08             	sub    $0x8,%esp
  10503d:	8d 83 0e b0 ff ff    	lea    -0x4ff2(%ebx),%eax
        sys_buf[cur_pid][nbytes] = '\0';
  105043:	c6 86 ff 0f 00 00 00 	movb   $0x0,0xfff(%esi)
        KERN_INFO("%s", sys_buf[cur_pid]);
  10504a:	56                   	push   %esi
  10504b:	50                   	push   %eax
  10504c:	e8 bf d8 ff ff       	call   102910 <debug_info>
    while (remain) {
  105051:	83 c4 10             	add    $0x10,%esp
  105054:	81 ed ff 0f 00 00    	sub    $0xfff,%ebp
  10505a:	74 58                	je     1050b4 <sys_puts+0xf4>
  10505c:	89 f8                	mov    %edi,%eax
  10505e:	29 e8                	sub    %ebp,%eax
        if (remain < PAGESIZE - 1)
  105060:	81 fd fe 0f 00 00    	cmp    $0xffe,%ebp
  105066:	77 b8                	ja     105020 <sys_puts+0x60>
        if (pt_copyin(cur_pid, cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
  105068:	55                   	push   %ebp
  105069:	56                   	push   %esi
  10506a:	50                   	push   %eax
  10506b:	ff 74 24 14          	push   0x14(%esp)
  10506f:	e8 54 e8 ff ff       	call   1038c8 <pt_copyin>
  105074:	83 c4 10             	add    $0x10,%esp
  105077:	39 c5                	cmp    %eax,%ebp
  105079:	74 15                	je     105090 <sys_puts+0xd0>
            syscall_set_errno(E_MEM);
  10507b:	83 ec 0c             	sub    $0xc,%esp
  10507e:	6a 01                	push   $0x1
  105080:	e8 db fe ff ff       	call   104f60 <syscall_set_errno>
            return;
  105085:	83 c4 10             	add    $0x10,%esp
        remain -= nbytes;
        cur_pos += nbytes;
    }

    syscall_set_errno(E_SUCC);
}
  105088:	83 c4 1c             	add    $0x1c,%esp
  10508b:	5b                   	pop    %ebx
  10508c:	5e                   	pop    %esi
  10508d:	5f                   	pop    %edi
  10508e:	5d                   	pop    %ebp
  10508f:	c3                   	ret    
        sys_buf[cur_pid][nbytes] = '\0';
  105090:	8b 44 24 08          	mov    0x8(%esp),%eax
        KERN_INFO("%s", sys_buf[cur_pid]);
  105094:	83 ec 08             	sub    $0x8,%esp
        sys_buf[cur_pid][nbytes] = '\0';
  105097:	c1 e0 0c             	shl    $0xc,%eax
  10509a:	01 c5                	add    %eax,%ebp
  10509c:	8b 44 24 14          	mov    0x14(%esp),%eax
  1050a0:	c6 04 28 00          	movb   $0x0,(%eax,%ebp,1)
        KERN_INFO("%s", sys_buf[cur_pid]);
  1050a4:	8d 83 0e b0 ff ff    	lea    -0x4ff2(%ebx),%eax
  1050aa:	56                   	push   %esi
  1050ab:	50                   	push   %eax
  1050ac:	e8 5f d8 ff ff       	call   102910 <debug_info>
  1050b1:	83 c4 10             	add    $0x10,%esp
    syscall_set_errno(E_SUCC);
  1050b4:	83 ec 0c             	sub    $0xc,%esp
  1050b7:	6a 00                	push   $0x0
  1050b9:	e8 a2 fe ff ff       	call   104f60 <syscall_set_errno>
  1050be:	83 c4 10             	add    $0x10,%esp
}
  1050c1:	83 c4 1c             	add    $0x1c,%esp
  1050c4:	5b                   	pop    %ebx
  1050c5:	5e                   	pop    %esi
  1050c6:	5f                   	pop    %edi
  1050c7:	5d                   	pop    %ebp
  1050c8:	c3                   	ret    
  1050c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        syscall_set_errno(E_INVAL_ADDR);
  1050d0:	83 ec 0c             	sub    $0xc,%esp
  1050d3:	6a 04                	push   $0x4
  1050d5:	e8 86 fe ff ff       	call   104f60 <syscall_set_errno>
        return;
  1050da:	83 c4 10             	add    $0x10,%esp
}
  1050dd:	83 c4 1c             	add    $0x1c,%esp
  1050e0:	5b                   	pop    %ebx
  1050e1:	5e                   	pop    %esi
  1050e2:	5f                   	pop    %edi
  1050e3:	5d                   	pop    %ebp
  1050e4:	c3                   	ret    
  1050e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1050ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001050f0 <sys_spawn>:
 * Otherwise, you should mark it as successful, and return the new child process id.
 */
void sys_spawn(void)
{
    // TODO
}
  1050f0:	c3                   	ret    
  1050f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1050f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1050ff:	90                   	nop

00105100 <sys_yield>:
  105100:	c3                   	ret    
  105101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105108:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10510f:	90                   	nop

00105110 <sys_fork>:

// Your implementation of fork
void sys_fork()
{
    // TODO
}
  105110:	c3                   	ret    
  105111:	66 90                	xchg   %ax,%ax
  105113:	66 90                	xchg   %ax,%ax
  105115:	66 90                	xchg   %ax,%ax
  105117:	66 90                	xchg   %ax,%ax
  105119:	66 90                	xchg   %ax,%ax
  10511b:	66 90                	xchg   %ax,%ax
  10511d:	66 90                	xchg   %ax,%ax
  10511f:	90                   	nop

00105120 <syscall_dispatch>:
#include <lib/syscall.h>

#include "import.h"

void syscall_dispatch(void)
{
  105120:	53                   	push   %ebx
  105121:	e8 e6 b1 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  105126:	81 c3 da 5e 00 00    	add    $0x5eda,%ebx
  10512c:	83 ec 08             	sub    $0x8,%esp
    unsigned int nr;

    nr = syscall_get_arg1();
  10512f:	e8 cc fd ff ff       	call   104f00 <syscall_get_arg1>

    switch (nr) {
  105134:	83 f8 02             	cmp    $0x2,%eax
  105137:	74 27                	je     105160 <syscall_dispatch+0x40>
  105139:	77 15                	ja     105150 <syscall_dispatch+0x30>
  10513b:	85 c0                	test   %eax,%eax
  10513d:	74 49                	je     105188 <syscall_dispatch+0x68>
         *   the process ID of the process
         *
         * Error:
         *   E_INVAL_PID
         */
        sys_spawn();
  10513f:	e8 ac ff ff ff       	call   1050f0 <sys_spawn>
        sys_fork();
        break;
    default:
        syscall_set_errno(E_INVAL_CALLNR);
    }
}
  105144:	83 c4 08             	add    $0x8,%esp
  105147:	5b                   	pop    %ebx
  105148:	c3                   	ret    
  105149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    switch (nr) {
  105150:	83 f8 03             	cmp    $0x3,%eax
  105153:	75 1b                	jne    105170 <syscall_dispatch+0x50>
        sys_fork();
  105155:	e8 b6 ff ff ff       	call   105110 <sys_fork>
}
  10515a:	83 c4 08             	add    $0x8,%esp
  10515d:	5b                   	pop    %ebx
  10515e:	c3                   	ret    
  10515f:	90                   	nop
        sys_yield();
  105160:	e8 9b ff ff ff       	call   105100 <sys_yield>
}
  105165:	83 c4 08             	add    $0x8,%esp
  105168:	5b                   	pop    %ebx
  105169:	c3                   	ret    
  10516a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        syscall_set_errno(E_INVAL_CALLNR);
  105170:	83 ec 0c             	sub    $0xc,%esp
  105173:	6a 03                	push   $0x3
  105175:	e8 e6 fd ff ff       	call   104f60 <syscall_set_errno>
  10517a:	83 c4 10             	add    $0x10,%esp
}
  10517d:	83 c4 08             	add    $0x8,%esp
  105180:	5b                   	pop    %ebx
  105181:	c3                   	ret    
  105182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        sys_puts();
  105188:	e8 33 fe ff ff       	call   104fc0 <sys_puts>
}
  10518d:	83 c4 08             	add    $0x8,%esp
  105190:	5b                   	pop    %ebx
  105191:	c3                   	ret    
  105192:	66 90                	xchg   %ax,%ax
  105194:	66 90                	xchg   %ax,%ax
  105196:	66 90                	xchg   %ax,%ax
  105198:	66 90                	xchg   %ax,%ax
  10519a:	66 90                	xchg   %ax,%ax
  10519c:	66 90                	xchg   %ax,%ax
  10519e:	66 90                	xchg   %ax,%ax

001051a0 <default_exception_handler>:
    KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
    KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
}

void default_exception_handler(void)
{
  1051a0:	55                   	push   %ebp
  1051a1:	57                   	push   %edi
  1051a2:	56                   	push   %esi
  1051a3:	53                   	push   %ebx
  1051a4:	e8 63 b1 ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  1051a9:	81 c3 57 5e 00 00    	add    $0x5e57,%ebx
  1051af:	83 ec 1c             	sub    $0x1c,%esp
    unsigned int cur_pid;

    cur_pid = get_curid();
  1051b2:	e8 d9 fb ff ff       	call   104d90 <get_curid>
    KERN_DEBUG("trapframe at %x\n", base);
  1051b7:	8d bb 44 ba ff ff    	lea    -0x45bc(%ebx),%edi
  1051bd:	6b e8 44             	imul   $0x44,%eax,%ebp
    trap_dump(&uctx_pool[cur_pid]);
  1051c0:	c7 c0 20 bb db 00    	mov    $0xdbbb20,%eax
  1051c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1051ca:	8d 74 05 00          	lea    0x0(%ebp,%eax,1),%esi
    KERN_DEBUG("trapframe at %x\n", base);
  1051ce:	8d 83 bd b8 ff ff    	lea    -0x4743(%ebx),%eax
  1051d4:	56                   	push   %esi
  1051d5:	50                   	push   %eax
  1051d6:	6a 15                	push   $0x15
  1051d8:	57                   	push   %edi
  1051d9:	e8 57 d7 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tedi:   \t\t%08x\n", &tf->regs.edi, tf->regs.edi);
  1051de:	58                   	pop    %eax
  1051df:	8d 83 ce b8 ff ff    	lea    -0x4732(%ebx),%eax
  1051e5:	ff 36                	push   (%esi)
  1051e7:	56                   	push   %esi
  1051e8:	50                   	push   %eax
  1051e9:	6a 16                	push   $0x16
  1051eb:	57                   	push   %edi
  1051ec:	e8 44 d7 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tesi:   \t\t%08x\n", &tf->regs.esi, tf->regs.esi);
  1051f1:	83 c4 14             	add    $0x14,%esp
  1051f4:	ff 76 04             	push   0x4(%esi)
  1051f7:	8b 44 24 18          	mov    0x18(%esp),%eax
  1051fb:	8d 44 05 04          	lea    0x4(%ebp,%eax,1),%eax
  1051ff:	50                   	push   %eax
  105200:	8d 83 e4 b8 ff ff    	lea    -0x471c(%ebx),%eax
  105206:	50                   	push   %eax
  105207:	6a 17                	push   $0x17
  105209:	57                   	push   %edi
  10520a:	e8 26 d7 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tebp:   \t\t%08x\n", &tf->regs.ebp, tf->regs.ebp);
  10520f:	83 c4 14             	add    $0x14,%esp
  105212:	ff 76 08             	push   0x8(%esi)
  105215:	8b 44 24 18          	mov    0x18(%esp),%eax
  105219:	8d 44 05 08          	lea    0x8(%ebp,%eax,1),%eax
  10521d:	50                   	push   %eax
  10521e:	8d 83 fa b8 ff ff    	lea    -0x4706(%ebx),%eax
  105224:	50                   	push   %eax
  105225:	6a 18                	push   $0x18
  105227:	57                   	push   %edi
  105228:	e8 08 d7 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->regs.oesp, tf->regs.oesp);
  10522d:	83 c4 14             	add    $0x14,%esp
  105230:	ff 76 0c             	push   0xc(%esi)
  105233:	8b 44 24 18          	mov    0x18(%esp),%eax
  105237:	8d 44 05 0c          	lea    0xc(%ebp,%eax,1),%eax
  10523b:	50                   	push   %eax
  10523c:	8d 83 10 b9 ff ff    	lea    -0x46f0(%ebx),%eax
  105242:	50                   	push   %eax
  105243:	89 44 24 24          	mov    %eax,0x24(%esp)
  105247:	6a 19                	push   $0x19
  105249:	57                   	push   %edi
  10524a:	e8 e6 d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tebx:   \t\t%08x\n", &tf->regs.ebx, tf->regs.ebx);
  10524f:	83 c4 14             	add    $0x14,%esp
  105252:	ff 76 10             	push   0x10(%esi)
  105255:	8b 44 24 18          	mov    0x18(%esp),%eax
  105259:	8d 54 05 10          	lea    0x10(%ebp,%eax,1),%edx
  10525d:	52                   	push   %edx
  10525e:	8d 93 26 b9 ff ff    	lea    -0x46da(%ebx),%edx
  105264:	52                   	push   %edx
  105265:	6a 1a                	push   $0x1a
  105267:	57                   	push   %edi
  105268:	e8 c8 d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tedx:   \t\t%08x\n", &tf->regs.edx, tf->regs.edx);
  10526d:	83 c4 14             	add    $0x14,%esp
  105270:	ff 76 14             	push   0x14(%esi)
  105273:	8b 44 24 18          	mov    0x18(%esp),%eax
  105277:	8d 54 05 14          	lea    0x14(%ebp,%eax,1),%edx
  10527b:	52                   	push   %edx
  10527c:	8d 93 3c b9 ff ff    	lea    -0x46c4(%ebx),%edx
  105282:	52                   	push   %edx
  105283:	6a 1b                	push   $0x1b
  105285:	57                   	push   %edi
  105286:	e8 aa d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tecx:   \t\t%08x\n", &tf->regs.ecx, tf->regs.ecx);
  10528b:	83 c4 14             	add    $0x14,%esp
  10528e:	ff 76 18             	push   0x18(%esi)
  105291:	8b 44 24 18          	mov    0x18(%esp),%eax
  105295:	8d 54 05 18          	lea    0x18(%ebp,%eax,1),%edx
  105299:	52                   	push   %edx
  10529a:	8d 93 52 b9 ff ff    	lea    -0x46ae(%ebx),%edx
  1052a0:	52                   	push   %edx
  1052a1:	6a 1c                	push   $0x1c
  1052a3:	57                   	push   %edi
  1052a4:	e8 8c d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\teax:   \t\t%08x\n", &tf->regs.eax, tf->regs.eax);
  1052a9:	83 c4 14             	add    $0x14,%esp
  1052ac:	ff 76 1c             	push   0x1c(%esi)
  1052af:	8b 44 24 18          	mov    0x18(%esp),%eax
  1052b3:	8d 54 05 1c          	lea    0x1c(%ebp,%eax,1),%edx
  1052b7:	52                   	push   %edx
  1052b8:	8d 93 68 b9 ff ff    	lea    -0x4698(%ebx),%edx
  1052be:	52                   	push   %edx
  1052bf:	6a 1d                	push   $0x1d
  1052c1:	57                   	push   %edi
  1052c2:	e8 6e d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tes:    \t\t%08x\n", &tf->es, tf->es);
  1052c7:	0f b7 56 20          	movzwl 0x20(%esi),%edx
  1052cb:	83 c4 14             	add    $0x14,%esp
  1052ce:	52                   	push   %edx
  1052cf:	8b 44 24 18          	mov    0x18(%esp),%eax
  1052d3:	8d 54 05 20          	lea    0x20(%ebp,%eax,1),%edx
  1052d7:	52                   	push   %edx
  1052d8:	8d 93 7e b9 ff ff    	lea    -0x4682(%ebx),%edx
  1052de:	52                   	push   %edx
  1052df:	6a 1e                	push   $0x1e
  1052e1:	57                   	push   %edi
  1052e2:	e8 4e d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tds:    \t\t%08x\n", &tf->ds, tf->ds);
  1052e7:	0f b7 56 24          	movzwl 0x24(%esi),%edx
  1052eb:	83 c4 14             	add    $0x14,%esp
  1052ee:	52                   	push   %edx
  1052ef:	8b 44 24 18          	mov    0x18(%esp),%eax
  1052f3:	8d 54 05 24          	lea    0x24(%ebp,%eax,1),%edx
  1052f7:	52                   	push   %edx
  1052f8:	8d 93 94 b9 ff ff    	lea    -0x466c(%ebx),%edx
  1052fe:	52                   	push   %edx
  1052ff:	6a 1f                	push   $0x1f
  105301:	57                   	push   %edi
  105302:	e8 2e d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\ttrapno:\t\t%08x\n", &tf->trapno, tf->trapno);
  105307:	83 c4 14             	add    $0x14,%esp
  10530a:	ff 76 28             	push   0x28(%esi)
  10530d:	8b 44 24 18          	mov    0x18(%esp),%eax
  105311:	8d 54 05 28          	lea    0x28(%ebp,%eax,1),%edx
  105315:	52                   	push   %edx
  105316:	8d 93 aa b9 ff ff    	lea    -0x4656(%ebx),%edx
  10531c:	52                   	push   %edx
  10531d:	6a 20                	push   $0x20
  10531f:	57                   	push   %edi
  105320:	e8 10 d6 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\terr:   \t\t%08x\n", &tf->err, tf->err);
  105325:	83 c4 14             	add    $0x14,%esp
  105328:	ff 76 2c             	push   0x2c(%esi)
  10532b:	8b 44 24 18          	mov    0x18(%esp),%eax
  10532f:	8d 54 05 2c          	lea    0x2c(%ebp,%eax,1),%edx
  105333:	52                   	push   %edx
  105334:	8d 93 c0 b9 ff ff    	lea    -0x4640(%ebx),%edx
  10533a:	52                   	push   %edx
  10533b:	6a 21                	push   $0x21
  10533d:	57                   	push   %edi
  10533e:	e8 f2 d5 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\teip:   \t\t%08x\n", &tf->eip, tf->eip);
  105343:	83 c4 14             	add    $0x14,%esp
  105346:	ff 76 30             	push   0x30(%esi)
  105349:	8b 44 24 18          	mov    0x18(%esp),%eax
  10534d:	8d 54 05 30          	lea    0x30(%ebp,%eax,1),%edx
  105351:	52                   	push   %edx
  105352:	8d 93 d6 b9 ff ff    	lea    -0x462a(%ebx),%edx
  105358:	52                   	push   %edx
  105359:	6a 22                	push   $0x22
  10535b:	57                   	push   %edi
  10535c:	e8 d4 d5 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tcs:    \t\t%08x\n", &tf->cs, tf->cs);
  105361:	0f b7 56 34          	movzwl 0x34(%esi),%edx
  105365:	83 c4 14             	add    $0x14,%esp
  105368:	52                   	push   %edx
  105369:	8b 44 24 18          	mov    0x18(%esp),%eax
  10536d:	8d 54 05 34          	lea    0x34(%ebp,%eax,1),%edx
  105371:	52                   	push   %edx
  105372:	8d 93 ec b9 ff ff    	lea    -0x4614(%ebx),%edx
  105378:	52                   	push   %edx
  105379:	6a 23                	push   $0x23
  10537b:	57                   	push   %edi
  10537c:	e8 b4 d5 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\teflags:\t\t%08x\n", &tf->eflags, tf->eflags);
  105381:	83 c4 14             	add    $0x14,%esp
  105384:	ff 76 38             	push   0x38(%esi)
  105387:	8b 44 24 18          	mov    0x18(%esp),%eax
  10538b:	8d 54 05 38          	lea    0x38(%ebp,%eax,1),%edx
  10538f:	52                   	push   %edx
  105390:	8d 93 02 ba ff ff    	lea    -0x45fe(%ebx),%edx
  105396:	52                   	push   %edx
  105397:	6a 24                	push   $0x24
  105399:	57                   	push   %edi
  10539a:	e8 96 d5 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
  10539f:	83 c4 14             	add    $0x14,%esp
  1053a2:	ff 76 3c             	push   0x3c(%esi)
  1053a5:	8b 44 24 18          	mov    0x18(%esp),%eax
  1053a9:	8d 54 05 3c          	lea    0x3c(%ebp,%eax,1),%edx
  1053ad:	52                   	push   %edx
  1053ae:	8b 44 24 20          	mov    0x20(%esp),%eax
  1053b2:	50                   	push   %eax
  1053b3:	6a 25                	push   $0x25
  1053b5:	57                   	push   %edi
  1053b6:	e8 7a d5 ff ff       	call   102935 <debug_normal>
    KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
  1053bb:	0f b7 46 40          	movzwl 0x40(%esi),%eax
  1053bf:	83 c4 14             	add    $0x14,%esp
  1053c2:	50                   	push   %eax
  1053c3:	8b 44 24 18          	mov    0x18(%esp),%eax
  1053c7:	8d 44 05 40          	lea    0x40(%ebp,%eax,1),%eax
  1053cb:	50                   	push   %eax
  1053cc:	8d 83 18 ba ff ff    	lea    -0x45e8(%ebx),%eax
  1053d2:	50                   	push   %eax
  1053d3:	6a 26                	push   $0x26
  1053d5:	57                   	push   %edi
  1053d6:	e8 5a d5 ff ff       	call   102935 <debug_normal>

    KERN_PANIC("Trap %d @ 0x%08x.\n", uctx_pool[cur_pid].trapno,
  1053db:	83 c4 14             	add    $0x14,%esp
  1053de:	8d 83 2e ba ff ff    	lea    -0x45d2(%ebx),%eax
  1053e4:	ff 76 30             	push   0x30(%esi)
  1053e7:	ff 76 28             	push   0x28(%esi)
  1053ea:	50                   	push   %eax
  1053eb:	6a 30                	push   $0x30
  1053ed:	57                   	push   %edi
  1053ee:	e8 7b d5 ff ff       	call   10296e <debug_panic>
               uctx_pool[cur_pid].eip);
}
  1053f3:	83 c4 3c             	add    $0x3c,%esp
  1053f6:	5b                   	pop    %ebx
  1053f7:	5e                   	pop    %esi
  1053f8:	5f                   	pop    %edi
  1053f9:	5d                   	pop    %ebp
  1053fa:	c3                   	ret    
  1053fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1053ff:	90                   	nop

00105400 <pgflt_handler>:

void pgflt_handler(void)
{
  105400:	55                   	push   %ebp
  105401:	57                   	push   %edi
  105402:	56                   	push   %esi
  105403:	53                   	push   %ebx
  105404:	e8 03 af ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  105409:	81 c3 f7 5b 00 00    	add    $0x5bf7,%ebx
  10540f:	83 ec 0c             	sub    $0xc,%esp
    unsigned int cur_pid;
    unsigned int errno;
    unsigned int fault_va;
    unsigned int pte_entry;

    cur_pid = get_curid();
  105412:	e8 79 f9 ff ff       	call   104d90 <get_curid>
  105417:	89 c6                	mov    %eax,%esi
    errno = uctx_pool[cur_pid].err;
  105419:	6b c0 44             	imul   $0x44,%eax,%eax
  10541c:	81 c0 20 bb db 00    	add    $0xdbbb20,%eax
  105422:	8b 78 2c             	mov    0x2c(%eax),%edi
    fault_va = rcr2();
  105425:	e8 16 e1 ff ff       	call   103540 <rcr2>
  10542a:	89 c5                	mov    %eax,%ebp

    if ((errno & 0x3) == 0x3) {
  10542c:	89 f8                	mov    %edi,%eax
  10542e:	83 e0 03             	and    $0x3,%eax
  105431:	83 f8 03             	cmp    $0x3,%eax
  105434:	74 52                	je     105488 <pgflt_handler+0x88>

    // Uncomment this line to see information about the page fault
    // KERN_DEBUG("Page fault: VA 0x%08x, errno 0x%08x, process %d, EIP 0x%08x.\n",
    //            fault_va, errno, cur_pid, uctx_pool[cur_pid].eip);

    if (errno & PFE_PR) {
  105436:	f7 c7 01 00 00 00    	test   $0x1,%edi
  10543c:	75 22                	jne    105460 <pgflt_handler+0x60>
        KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n",
                   fault_va, errno);
        return;
    }

    if (alloc_page(cur_pid, fault_va, PTE_W | PTE_U | PTE_P) == MagicNumber) {
  10543e:	83 ec 04             	sub    $0x4,%esp
  105441:	6a 07                	push   $0x7
  105443:	55                   	push   %ebp
  105444:	56                   	push   %esi
  105445:	e8 16 f6 ff ff       	call   104a60 <alloc_page>
  10544a:	83 c4 10             	add    $0x10,%esp
  10544d:	3d 01 00 10 00       	cmp    $0x100001,%eax
  105452:	74 64                	je     1054b8 <pgflt_handler+0xb8>
        KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n",
                   fault_va, errno);
    }
}
  105454:	83 c4 0c             	add    $0xc,%esp
  105457:	5b                   	pop    %ebx
  105458:	5e                   	pop    %esi
  105459:	5f                   	pop    %edi
  10545a:	5d                   	pop    %ebp
  10545b:	c3                   	ret    
  10545c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n",
  105460:	83 ec 0c             	sub    $0xc,%esp
  105463:	8d 83 90 ba ff ff    	lea    -0x4570(%ebx),%eax
  105469:	57                   	push   %edi
  10546a:	55                   	push   %ebp
  10546b:	50                   	push   %eax
  10546c:	8d 83 44 ba ff ff    	lea    -0x45bc(%ebx),%eax
  105472:	6a 50                	push   $0x50
  105474:	50                   	push   %eax
  105475:	e8 f4 d4 ff ff       	call   10296e <debug_panic>
        return;
  10547a:	83 c4 20             	add    $0x20,%esp
}
  10547d:	83 c4 0c             	add    $0xc,%esp
  105480:	5b                   	pop    %ebx
  105481:	5e                   	pop    %esi
  105482:	5f                   	pop    %edi
  105483:	5d                   	pop    %ebp
  105484:	c3                   	ret    
  105485:	8d 76 00             	lea    0x0(%esi),%esi
        pte_entry = get_ptbl_entry_by_va(cur_pid, fault_va);
  105488:	83 ec 08             	sub    $0x8,%esp
  10548b:	55                   	push   %ebp
  10548c:	56                   	push   %esi
  10548d:	e8 3e f1 ff ff       	call   1045d0 <get_ptbl_entry_by_va>
        if (pte_entry & PTE_COW) {
  105492:	83 c4 10             	add    $0x10,%esp
  105495:	f6 c4 08             	test   $0x8,%ah
  105498:	75 9c                	jne    105436 <pgflt_handler+0x36>
            KERN_PANIC("Writing to read-only page: va = %p\n", fault_va);
  10549a:	8d 83 6c ba ff ff    	lea    -0x4594(%ebx),%eax
  1054a0:	55                   	push   %ebp
  1054a1:	50                   	push   %eax
  1054a2:	8d 83 44 ba ff ff    	lea    -0x45bc(%ebx),%eax
  1054a8:	6a 47                	push   $0x47
  1054aa:	50                   	push   %eax
  1054ab:	e8 be d4 ff ff       	call   10296e <debug_panic>
  1054b0:	83 c4 10             	add    $0x10,%esp
  1054b3:	eb 81                	jmp    105436 <pgflt_handler+0x36>
  1054b5:	8d 76 00             	lea    0x0(%esi),%esi
        KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n",
  1054b8:	83 ec 0c             	sub    $0xc,%esp
  1054bb:	8d 83 c4 ba ff ff    	lea    -0x453c(%ebx),%eax
  1054c1:	57                   	push   %edi
  1054c2:	55                   	push   %ebp
  1054c3:	50                   	push   %eax
  1054c4:	8d 83 44 ba ff ff    	lea    -0x45bc(%ebx),%eax
  1054ca:	6a 56                	push   $0x56
  1054cc:	50                   	push   %eax
  1054cd:	e8 9c d4 ff ff       	call   10296e <debug_panic>
  1054d2:	83 c4 20             	add    $0x20,%esp
}
  1054d5:	83 c4 0c             	add    $0xc,%esp
  1054d8:	5b                   	pop    %ebx
  1054d9:	5e                   	pop    %esi
  1054da:	5f                   	pop    %edi
  1054db:	5d                   	pop    %ebp
  1054dc:	c3                   	ret    
  1054dd:	8d 76 00             	lea    0x0(%esi),%esi

001054e0 <exception_handler>:
 * All other exceptions should be routed to the default exception handler.
 */
void exception_handler(void)
{
    // TODO
}
  1054e0:	c3                   	ret    
  1054e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1054e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1054ef:	90                   	nop

001054f0 <interrupt_handler>:
  1054f0:	c3                   	ret    
  1054f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1054f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1054ff:	90                   	nop

00105500 <trap>:
{
    // TODO
}

void trap(tf_t *tf)
{
  105500:	55                   	push   %ebp
  105501:	57                   	push   %edi
  105502:	56                   	push   %esi
  105503:	53                   	push   %ebx
  105504:	e8 03 ae ff ff       	call   10030c <__x86.get_pc_thunk.bx>
  105509:	81 c3 f7 5a 00 00    	add    $0x5af7,%ebx
  10550f:	83 ec 0c             	sub    $0xc,%esp
  105512:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    unsigned int cur_pid;

    cur_pid = get_curid();
    uctx_pool[cur_pid] = *tf;  // save the current user context (trap frame)
  105516:	89 ee                	mov    %ebp,%esi
    cur_pid = get_curid();
  105518:	e8 73 f8 ff ff       	call   104d90 <get_curid>
    uctx_pool[cur_pid] = *tf;  // save the current user context (trap frame)
  10551d:	b9 11 00 00 00       	mov    $0x11,%ecx
    set_pdir_base(0);          // switch to the kernel's page table
  105522:	83 ec 0c             	sub    $0xc,%esp
    uctx_pool[cur_pid] = *tf;  // save the current user context (trap frame)
  105525:	6b c0 44             	imul   $0x44,%eax,%eax
  105528:	81 c0 20 bb db 00    	add    $0xdbbb20,%eax
  10552e:	89 c7                	mov    %eax,%edi
  105530:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    set_pdir_base(0);          // switch to the kernel's page table
  105532:	6a 00                	push   $0x0
  105534:	e8 e7 ee ff ff       	call   104420 <set_pdir_base>

    if (T_DIVIDE <= tf->trapno && tf->trapno <= T_SECEV)
  105539:	83 c4 10             	add    $0x10,%esp
  10553c:	83 7d 28 30          	cmpl   $0x30,0x28(%ebp)
  105540:	75 05                	jne    105547 <trap+0x47>
        exception_handler();
    else if (T_IRQ0 + IRQ_TIMER <= tf->trapno
             && tf->trapno <= T_IRQ0 + IRQ_IDE2)
        interrupt_handler();
    else if (tf->trapno == T_SYSCALL)
        syscall_dispatch();
  105542:	e8 d9 fb ff ff       	call   105120 <syscall_dispatch>

    // Trap handled. Jump back to the user.
    // This is where you switch the TSS and page structure back.
    proc_start_user();
  105547:	e8 e4 f8 ff ff       	call   104e30 <proc_start_user>
}
  10554c:	83 c4 0c             	add    $0xc,%esp
  10554f:	5b                   	pop    %ebx
  105550:	5e                   	pop    %esi
  105551:	5f                   	pop    %edi
  105552:	5d                   	pop    %ebp
  105553:	c3                   	ret    
  105554:	66 90                	xchg   %ax,%ax
  105556:	66 90                	xchg   %ax,%ax
  105558:	66 90                	xchg   %ax,%ax
  10555a:	66 90                	xchg   %ax,%ax
  10555c:	66 90                	xchg   %ax,%ax
  10555e:	66 90                	xchg   %ax,%ax

00105560 <__udivdi3>:
  105560:	f3 0f 1e fb          	endbr32 
  105564:	55                   	push   %ebp
  105565:	57                   	push   %edi
  105566:	56                   	push   %esi
  105567:	53                   	push   %ebx
  105568:	83 ec 1c             	sub    $0x1c,%esp
  10556b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  10556f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  105573:	8b 74 24 34          	mov    0x34(%esp),%esi
  105577:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  10557b:	85 c0                	test   %eax,%eax
  10557d:	75 19                	jne    105598 <__udivdi3+0x38>
  10557f:	39 f3                	cmp    %esi,%ebx
  105581:	76 4d                	jbe    1055d0 <__udivdi3+0x70>
  105583:	31 ff                	xor    %edi,%edi
  105585:	89 e8                	mov    %ebp,%eax
  105587:	89 f2                	mov    %esi,%edx
  105589:	f7 f3                	div    %ebx
  10558b:	89 fa                	mov    %edi,%edx
  10558d:	83 c4 1c             	add    $0x1c,%esp
  105590:	5b                   	pop    %ebx
  105591:	5e                   	pop    %esi
  105592:	5f                   	pop    %edi
  105593:	5d                   	pop    %ebp
  105594:	c3                   	ret    
  105595:	8d 76 00             	lea    0x0(%esi),%esi
  105598:	39 f0                	cmp    %esi,%eax
  10559a:	76 14                	jbe    1055b0 <__udivdi3+0x50>
  10559c:	31 ff                	xor    %edi,%edi
  10559e:	31 c0                	xor    %eax,%eax
  1055a0:	89 fa                	mov    %edi,%edx
  1055a2:	83 c4 1c             	add    $0x1c,%esp
  1055a5:	5b                   	pop    %ebx
  1055a6:	5e                   	pop    %esi
  1055a7:	5f                   	pop    %edi
  1055a8:	5d                   	pop    %ebp
  1055a9:	c3                   	ret    
  1055aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1055b0:	0f bd f8             	bsr    %eax,%edi
  1055b3:	83 f7 1f             	xor    $0x1f,%edi
  1055b6:	75 48                	jne    105600 <__udivdi3+0xa0>
  1055b8:	39 f0                	cmp    %esi,%eax
  1055ba:	72 06                	jb     1055c2 <__udivdi3+0x62>
  1055bc:	31 c0                	xor    %eax,%eax
  1055be:	39 eb                	cmp    %ebp,%ebx
  1055c0:	77 de                	ja     1055a0 <__udivdi3+0x40>
  1055c2:	b8 01 00 00 00       	mov    $0x1,%eax
  1055c7:	eb d7                	jmp    1055a0 <__udivdi3+0x40>
  1055c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1055d0:	89 d9                	mov    %ebx,%ecx
  1055d2:	85 db                	test   %ebx,%ebx
  1055d4:	75 0b                	jne    1055e1 <__udivdi3+0x81>
  1055d6:	b8 01 00 00 00       	mov    $0x1,%eax
  1055db:	31 d2                	xor    %edx,%edx
  1055dd:	f7 f3                	div    %ebx
  1055df:	89 c1                	mov    %eax,%ecx
  1055e1:	31 d2                	xor    %edx,%edx
  1055e3:	89 f0                	mov    %esi,%eax
  1055e5:	f7 f1                	div    %ecx
  1055e7:	89 c6                	mov    %eax,%esi
  1055e9:	89 e8                	mov    %ebp,%eax
  1055eb:	89 f7                	mov    %esi,%edi
  1055ed:	f7 f1                	div    %ecx
  1055ef:	89 fa                	mov    %edi,%edx
  1055f1:	83 c4 1c             	add    $0x1c,%esp
  1055f4:	5b                   	pop    %ebx
  1055f5:	5e                   	pop    %esi
  1055f6:	5f                   	pop    %edi
  1055f7:	5d                   	pop    %ebp
  1055f8:	c3                   	ret    
  1055f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105600:	89 f9                	mov    %edi,%ecx
  105602:	ba 20 00 00 00       	mov    $0x20,%edx
  105607:	29 fa                	sub    %edi,%edx
  105609:	d3 e0                	shl    %cl,%eax
  10560b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10560f:	89 d1                	mov    %edx,%ecx
  105611:	89 d8                	mov    %ebx,%eax
  105613:	d3 e8                	shr    %cl,%eax
  105615:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105619:	09 c1                	or     %eax,%ecx
  10561b:	89 f0                	mov    %esi,%eax
  10561d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  105621:	89 f9                	mov    %edi,%ecx
  105623:	d3 e3                	shl    %cl,%ebx
  105625:	89 d1                	mov    %edx,%ecx
  105627:	d3 e8                	shr    %cl,%eax
  105629:	89 f9                	mov    %edi,%ecx
  10562b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  10562f:	89 eb                	mov    %ebp,%ebx
  105631:	d3 e6                	shl    %cl,%esi
  105633:	89 d1                	mov    %edx,%ecx
  105635:	d3 eb                	shr    %cl,%ebx
  105637:	09 f3                	or     %esi,%ebx
  105639:	89 c6                	mov    %eax,%esi
  10563b:	89 f2                	mov    %esi,%edx
  10563d:	89 d8                	mov    %ebx,%eax
  10563f:	f7 74 24 08          	divl   0x8(%esp)
  105643:	89 d6                	mov    %edx,%esi
  105645:	89 c3                	mov    %eax,%ebx
  105647:	f7 64 24 0c          	mull   0xc(%esp)
  10564b:	39 d6                	cmp    %edx,%esi
  10564d:	72 19                	jb     105668 <__udivdi3+0x108>
  10564f:	89 f9                	mov    %edi,%ecx
  105651:	d3 e5                	shl    %cl,%ebp
  105653:	39 c5                	cmp    %eax,%ebp
  105655:	73 04                	jae    10565b <__udivdi3+0xfb>
  105657:	39 d6                	cmp    %edx,%esi
  105659:	74 0d                	je     105668 <__udivdi3+0x108>
  10565b:	89 d8                	mov    %ebx,%eax
  10565d:	31 ff                	xor    %edi,%edi
  10565f:	e9 3c ff ff ff       	jmp    1055a0 <__udivdi3+0x40>
  105664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105668:	8d 43 ff             	lea    -0x1(%ebx),%eax
  10566b:	31 ff                	xor    %edi,%edi
  10566d:	e9 2e ff ff ff       	jmp    1055a0 <__udivdi3+0x40>
  105672:	66 90                	xchg   %ax,%ax
  105674:	66 90                	xchg   %ax,%ax
  105676:	66 90                	xchg   %ax,%ax
  105678:	66 90                	xchg   %ax,%ax
  10567a:	66 90                	xchg   %ax,%ax
  10567c:	66 90                	xchg   %ax,%ax
  10567e:	66 90                	xchg   %ax,%ax

00105680 <__umoddi3>:
  105680:	f3 0f 1e fb          	endbr32 
  105684:	55                   	push   %ebp
  105685:	57                   	push   %edi
  105686:	56                   	push   %esi
  105687:	53                   	push   %ebx
  105688:	83 ec 1c             	sub    $0x1c,%esp
  10568b:	8b 74 24 30          	mov    0x30(%esp),%esi
  10568f:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  105693:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
  105697:	8b 6c 24 38          	mov    0x38(%esp),%ebp
  10569b:	89 f0                	mov    %esi,%eax
  10569d:	89 da                	mov    %ebx,%edx
  10569f:	85 ff                	test   %edi,%edi
  1056a1:	75 15                	jne    1056b8 <__umoddi3+0x38>
  1056a3:	39 dd                	cmp    %ebx,%ebp
  1056a5:	76 39                	jbe    1056e0 <__umoddi3+0x60>
  1056a7:	f7 f5                	div    %ebp
  1056a9:	89 d0                	mov    %edx,%eax
  1056ab:	31 d2                	xor    %edx,%edx
  1056ad:	83 c4 1c             	add    $0x1c,%esp
  1056b0:	5b                   	pop    %ebx
  1056b1:	5e                   	pop    %esi
  1056b2:	5f                   	pop    %edi
  1056b3:	5d                   	pop    %ebp
  1056b4:	c3                   	ret    
  1056b5:	8d 76 00             	lea    0x0(%esi),%esi
  1056b8:	39 df                	cmp    %ebx,%edi
  1056ba:	77 f1                	ja     1056ad <__umoddi3+0x2d>
  1056bc:	0f bd cf             	bsr    %edi,%ecx
  1056bf:	83 f1 1f             	xor    $0x1f,%ecx
  1056c2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  1056c6:	75 40                	jne    105708 <__umoddi3+0x88>
  1056c8:	39 df                	cmp    %ebx,%edi
  1056ca:	72 04                	jb     1056d0 <__umoddi3+0x50>
  1056cc:	39 f5                	cmp    %esi,%ebp
  1056ce:	77 dd                	ja     1056ad <__umoddi3+0x2d>
  1056d0:	89 da                	mov    %ebx,%edx
  1056d2:	89 f0                	mov    %esi,%eax
  1056d4:	29 e8                	sub    %ebp,%eax
  1056d6:	19 fa                	sbb    %edi,%edx
  1056d8:	eb d3                	jmp    1056ad <__umoddi3+0x2d>
  1056da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1056e0:	89 e9                	mov    %ebp,%ecx
  1056e2:	85 ed                	test   %ebp,%ebp
  1056e4:	75 0b                	jne    1056f1 <__umoddi3+0x71>
  1056e6:	b8 01 00 00 00       	mov    $0x1,%eax
  1056eb:	31 d2                	xor    %edx,%edx
  1056ed:	f7 f5                	div    %ebp
  1056ef:	89 c1                	mov    %eax,%ecx
  1056f1:	89 d8                	mov    %ebx,%eax
  1056f3:	31 d2                	xor    %edx,%edx
  1056f5:	f7 f1                	div    %ecx
  1056f7:	89 f0                	mov    %esi,%eax
  1056f9:	f7 f1                	div    %ecx
  1056fb:	89 d0                	mov    %edx,%eax
  1056fd:	31 d2                	xor    %edx,%edx
  1056ff:	eb ac                	jmp    1056ad <__umoddi3+0x2d>
  105701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105708:	8b 44 24 04          	mov    0x4(%esp),%eax
  10570c:	ba 20 00 00 00       	mov    $0x20,%edx
  105711:	29 c2                	sub    %eax,%edx
  105713:	89 c1                	mov    %eax,%ecx
  105715:	89 e8                	mov    %ebp,%eax
  105717:	d3 e7                	shl    %cl,%edi
  105719:	89 d1                	mov    %edx,%ecx
  10571b:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10571f:	d3 e8                	shr    %cl,%eax
  105721:	89 c1                	mov    %eax,%ecx
  105723:	8b 44 24 04          	mov    0x4(%esp),%eax
  105727:	09 f9                	or     %edi,%ecx
  105729:	89 df                	mov    %ebx,%edi
  10572b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  10572f:	89 c1                	mov    %eax,%ecx
  105731:	d3 e5                	shl    %cl,%ebp
  105733:	89 d1                	mov    %edx,%ecx
  105735:	d3 ef                	shr    %cl,%edi
  105737:	89 c1                	mov    %eax,%ecx
  105739:	89 f0                	mov    %esi,%eax
  10573b:	d3 e3                	shl    %cl,%ebx
  10573d:	89 d1                	mov    %edx,%ecx
  10573f:	89 fa                	mov    %edi,%edx
  105741:	d3 e8                	shr    %cl,%eax
  105743:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  105748:	09 d8                	or     %ebx,%eax
  10574a:	f7 74 24 08          	divl   0x8(%esp)
  10574e:	89 d3                	mov    %edx,%ebx
  105750:	d3 e6                	shl    %cl,%esi
  105752:	f7 e5                	mul    %ebp
  105754:	89 c7                	mov    %eax,%edi
  105756:	89 d1                	mov    %edx,%ecx
  105758:	39 d3                	cmp    %edx,%ebx
  10575a:	72 06                	jb     105762 <__umoddi3+0xe2>
  10575c:	75 0e                	jne    10576c <__umoddi3+0xec>
  10575e:	39 c6                	cmp    %eax,%esi
  105760:	73 0a                	jae    10576c <__umoddi3+0xec>
  105762:	29 e8                	sub    %ebp,%eax
  105764:	1b 54 24 08          	sbb    0x8(%esp),%edx
  105768:	89 d1                	mov    %edx,%ecx
  10576a:	89 c7                	mov    %eax,%edi
  10576c:	89 f5                	mov    %esi,%ebp
  10576e:	8b 74 24 04          	mov    0x4(%esp),%esi
  105772:	29 fd                	sub    %edi,%ebp
  105774:	19 cb                	sbb    %ecx,%ebx
  105776:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
  10577b:	89 d8                	mov    %ebx,%eax
  10577d:	d3 e0                	shl    %cl,%eax
  10577f:	89 f1                	mov    %esi,%ecx
  105781:	d3 ed                	shr    %cl,%ebp
  105783:	d3 eb                	shr    %cl,%ebx
  105785:	09 e8                	or     %ebp,%eax
  105787:	89 da                	mov    %ebx,%edx
  105789:	83 c4 1c             	add    $0x1c,%esp
  10578c:	5b                   	pop    %ebx
  10578d:	5e                   	pop    %esi
  10578e:	5f                   	pop    %edi
  10578f:	5d                   	pop    %ebp
  105790:	c3                   	ret    
