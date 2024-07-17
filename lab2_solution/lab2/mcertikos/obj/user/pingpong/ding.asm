
obj/user/pingpong/ding:     file format elf32-i386


Disassembly of section .text:

40000000 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
40000000:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
40000006:	75 04                	jne    4000000c <args_exist>

40000008 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
40000008:	6a 00                	push   $0x0
	pushl	$0
4000000a:	6a 00                	push   $0x0

4000000c <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
4000000c:	e8 ac 0b 00 00       	call   40000bbd <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
40000011:	50                   	push   %eax

40000012 <spin>:
spin:
	/*
	 * TODO: replace yield with exit
	 */
	call	yield
40000012:	e8 cc 07 00 00       	call   400007e3 <yield>
	jmp	spin
40000017:	eb f9                	jmp    40000012 <spin>

40000019 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
40000019:	53                   	push   %ebx
4000001a:	83 ec 0c             	sub    $0xc,%esp
4000001d:	e8 a7 00 00 00       	call   400000c9 <__x86.get_pc_thunk.bx>
40000022:	81 c3 de 2f 00 00    	add    $0x2fde,%ebx
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
40000028:	ff 74 24 18          	push   0x18(%esp)
4000002c:	ff 74 24 18          	push   0x18(%esp)
40000030:	8d 83 00 e0 ff ff    	lea    -0x2000(%ebx),%eax
40000036:	50                   	push   %eax
40000037:	e8 b0 01 00 00       	call   400001ec <printf>
    vcprintf(fmt, ap);
4000003c:	83 c4 08             	add    $0x8,%esp
4000003f:	8d 44 24 24          	lea    0x24(%esp),%eax
40000043:	50                   	push   %eax
40000044:	ff 74 24 24          	push   0x24(%esp)
40000048:	e8 3e 01 00 00       	call   4000018b <vcprintf>
    va_end(ap);
}
4000004d:	83 c4 18             	add    $0x18,%esp
40000050:	5b                   	pop    %ebx
40000051:	c3                   	ret    

40000052 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000052:	53                   	push   %ebx
40000053:	83 ec 0c             	sub    $0xc,%esp
40000056:	e8 6e 00 00 00       	call   400000c9 <__x86.get_pc_thunk.bx>
4000005b:	81 c3 a5 2f 00 00    	add    $0x2fa5,%ebx
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
40000061:	ff 74 24 18          	push   0x18(%esp)
40000065:	ff 74 24 18          	push   0x18(%esp)
40000069:	8d 83 0c e0 ff ff    	lea    -0x1ff4(%ebx),%eax
4000006f:	50                   	push   %eax
40000070:	e8 77 01 00 00       	call   400001ec <printf>
    vcprintf(fmt, ap);
40000075:	83 c4 08             	add    $0x8,%esp
40000078:	8d 44 24 24          	lea    0x24(%esp),%eax
4000007c:	50                   	push   %eax
4000007d:	ff 74 24 24          	push   0x24(%esp)
40000081:	e8 05 01 00 00       	call   4000018b <vcprintf>
    va_end(ap);
}
40000086:	83 c4 18             	add    $0x18,%esp
40000089:	5b                   	pop    %ebx
4000008a:	c3                   	ret    

4000008b <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
4000008b:	53                   	push   %ebx
4000008c:	83 ec 0c             	sub    $0xc,%esp
4000008f:	e8 35 00 00 00       	call   400000c9 <__x86.get_pc_thunk.bx>
40000094:	81 c3 6c 2f 00 00    	add    $0x2f6c,%ebx
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000009a:	ff 74 24 18          	push   0x18(%esp)
4000009e:	ff 74 24 18          	push   0x18(%esp)
400000a2:	8d 83 18 e0 ff ff    	lea    -0x1fe8(%ebx),%eax
400000a8:	50                   	push   %eax
400000a9:	e8 3e 01 00 00       	call   400001ec <printf>
    vcprintf(fmt, ap);
400000ae:	83 c4 08             	add    $0x8,%esp
400000b1:	8d 44 24 24          	lea    0x24(%esp),%eax
400000b5:	50                   	push   %eax
400000b6:	ff 74 24 24          	push   0x24(%esp)
400000ba:	e8 cc 00 00 00       	call   4000018b <vcprintf>
400000bf:	83 c4 10             	add    $0x10,%esp
    va_end(ap);

    while (1)
        yield();
400000c2:	e8 1c 07 00 00       	call   400007e3 <yield>
    while (1)
400000c7:	eb f9                	jmp    400000c2 <panic+0x37>

400000c9 <__x86.get_pc_thunk.bx>:
400000c9:	8b 1c 24             	mov    (%esp),%ebx
400000cc:	c3                   	ret    

400000cd <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
400000cd:	55                   	push   %ebp
400000ce:	57                   	push   %edi
400000cf:	56                   	push   %esi
400000d0:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
400000d1:	8b 44 24 14          	mov    0x14(%esp),%eax
400000d5:	0f b6 00             	movzbl (%eax),%eax
400000d8:	3c 2b                	cmp    $0x2b,%al
400000da:	74 17                	je     400000f3 <atoi+0x26>
        loc++;
    else if (buf[loc] == '-') {
400000dc:	3c 2d                	cmp    $0x2d,%al
400000de:	74 1f                	je     400000ff <atoi+0x32>
    int negative = 0;
400000e0:	bf 00 00 00 00       	mov    $0x0,%edi
    int loc = 0;
400000e5:	be 00 00 00 00       	mov    $0x0,%esi
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400000ea:	89 f2                	mov    %esi,%edx
    int acc = 0;
400000ec:	b9 00 00 00 00       	mov    $0x0,%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400000f1:	eb 29                	jmp    4000011c <atoi+0x4f>
    int negative = 0;
400000f3:	bf 00 00 00 00       	mov    $0x0,%edi
        loc++;
400000f8:	be 01 00 00 00       	mov    $0x1,%esi
400000fd:	eb eb                	jmp    400000ea <atoi+0x1d>
        negative = 1;
400000ff:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000104:	be 01 00 00 00       	mov    $0x1,%esi
40000109:	eb df                	jmp    400000ea <atoi+0x1d>
        acc = acc * 10 + (buf[loc] - '0');
4000010b:	8d 2c 89             	lea    (%ecx,%ecx,4),%ebp
4000010e:	8d 4c 2d 00          	lea    0x0(%ebp,%ebp,1),%ecx
40000112:	0f be c0             	movsbl %al,%eax
40000115:	8d 4c 08 d0          	lea    -0x30(%eax,%ecx,1),%ecx
        loc++;
40000119:	83 c2 01             	add    $0x1,%edx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000011c:	8b 44 24 14          	mov    0x14(%esp),%eax
40000120:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
40000124:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000127:	89 eb                	mov    %ebp,%ebx
40000129:	80 fb 09             	cmp    $0x9,%bl
4000012c:	76 dd                	jbe    4000010b <atoi+0x3e>
    }
    if (numstart == loc) {
4000012e:	39 d6                	cmp    %edx,%esi
40000130:	74 13                	je     40000145 <atoi+0x78>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
40000132:	85 ff                	test   %edi,%edi
40000134:	74 02                	je     40000138 <atoi+0x6b>
        acc = -acc;
40000136:	f7 d9                	neg    %ecx
    *i = acc;
40000138:	8b 44 24 18          	mov    0x18(%esp),%eax
4000013c:	89 08                	mov    %ecx,(%eax)
    return loc;
}
4000013e:	89 d0                	mov    %edx,%eax
40000140:	5b                   	pop    %ebx
40000141:	5e                   	pop    %esi
40000142:	5f                   	pop    %edi
40000143:	5d                   	pop    %ebp
40000144:	c3                   	ret    
        return 0;
40000145:	ba 00 00 00 00       	mov    $0x0,%edx
4000014a:	eb f2                	jmp    4000013e <atoi+0x71>

4000014c <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
4000014c:	53                   	push   %ebx
4000014d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000151:	8b 02                	mov    (%edx),%eax
40000153:	8d 48 01             	lea    0x1(%eax),%ecx
40000156:	89 0a                	mov    %ecx,(%edx)
40000158:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000015d:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000161:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
40000167:	74 0b                	je     40000174 <putch+0x28>
        b->buf[b->idx] = 0;
        puts(b->buf, b->idx);
        b->idx = 0;
    }
    b->cnt++;
40000169:	8b 42 04             	mov    0x4(%edx),%eax
4000016c:	83 c0 01             	add    $0x1,%eax
4000016f:	89 42 04             	mov    %eax,0x4(%edx)
}
40000172:	5b                   	pop    %ebx
40000173:	c3                   	ret    
        b->buf[b->idx] = 0;
40000174:	c6 44 02 09 00       	movb   $0x0,0x9(%edx,%eax,1)
        puts(b->buf, b->idx);
40000179:	8d 5a 08             	lea    0x8(%edx),%ebx
#include <types.h>
#include <x86.h>

static gcc_inline void sys_puts(const char *s, size_t len)
{
    asm volatile ("int %0"
4000017c:	b8 00 00 00 00       	mov    $0x0,%eax
40000181:	cd 30                	int    $0x30
        b->idx = 0;
40000183:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
40000189:	eb de                	jmp    40000169 <putch+0x1d>

4000018b <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
4000018b:	53                   	push   %ebx
4000018c:	81 ec 18 02 00 00    	sub    $0x218,%esp
40000192:	e8 32 ff ff ff       	call   400000c9 <__x86.get_pc_thunk.bx>
40000197:	81 c3 69 2e 00 00    	add    $0x2e69,%ebx
    struct printbuf b;

    b.idx = 0;
4000019d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
400001a4:	00 
    b.cnt = 0;
400001a5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400001ac:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
400001ad:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400001b4:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400001bb:	8d 44 24 10          	lea    0x10(%esp),%eax
400001bf:	50                   	push   %eax
400001c0:	8d 83 4c d1 ff ff    	lea    -0x2eb4(%ebx),%eax
400001c6:	50                   	push   %eax
400001c7:	e8 7c 01 00 00       	call   40000348 <vprintfmt>

    b.buf[b.idx] = 0;
400001cc:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400001d0:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400001d5:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400001d9:	b8 00 00 00 00       	mov    $0x0,%eax
400001de:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
400001e0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400001e4:	81 c4 28 02 00 00    	add    $0x228,%esp
400001ea:	5b                   	pop    %ebx
400001eb:	c3                   	ret    

400001ec <printf>:

int printf(const char *fmt, ...)
{
400001ec:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
400001ef:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400001f3:	50                   	push   %eax
400001f4:	ff 74 24 1c          	push   0x1c(%esp)
400001f8:	e8 8e ff ff ff       	call   4000018b <vcprintf>
    va_end(ap);

    return cnt;
}
400001fd:	83 c4 1c             	add    $0x1c,%esp
40000200:	c3                   	ret    

40000201 <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
40000201:	55                   	push   %ebp
40000202:	57                   	push   %edi
40000203:	56                   	push   %esi
40000204:	53                   	push   %ebx
40000205:	83 ec 2c             	sub    $0x2c,%esp
40000208:	e8 b3 05 00 00       	call   400007c0 <__x86.get_pc_thunk.cx>
4000020d:	81 c1 f3 2d 00 00    	add    $0x2df3,%ecx
40000213:	89 4c 24 14          	mov    %ecx,0x14(%esp)
40000217:	89 c6                	mov    %eax,%esi
40000219:	89 d7                	mov    %edx,%edi
4000021b:	8b 44 24 40          	mov    0x40(%esp),%eax
4000021f:	8b 54 24 44          	mov    0x44(%esp),%edx
40000223:	89 d1                	mov    %edx,%ecx
40000225:	89 c2                	mov    %eax,%edx
40000227:	89 44 24 18          	mov    %eax,0x18(%esp)
4000022b:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
4000022f:	8b 44 24 48          	mov    0x48(%esp),%eax
40000233:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
40000237:	8b 6c 24 50          	mov    0x50(%esp),%ebp
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
4000023b:	89 44 24 08          	mov    %eax,0x8(%esp)
4000023f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000246:	00 
40000247:	39 c2                	cmp    %eax,%edx
40000249:	1b 4c 24 0c          	sbb    0xc(%esp),%ecx
4000024d:	72 42                	jb     40000291 <printnum+0x90>
        printnum(putch, putdat, num / base, base, width - 1, padc);
4000024f:	83 ec 0c             	sub    $0xc,%esp
40000252:	55                   	push   %ebp
40000253:	83 eb 01             	sub    $0x1,%ebx
40000256:	53                   	push   %ebx
40000257:	50                   	push   %eax
40000258:	83 ec 08             	sub    $0x8,%esp
4000025b:	ff 74 24 2c          	push   0x2c(%esp)
4000025f:	ff 74 24 2c          	push   0x2c(%esp)
40000263:	ff 74 24 44          	push   0x44(%esp)
40000267:	ff 74 24 44          	push   0x44(%esp)
4000026b:	8b 5c 24 44          	mov    0x44(%esp),%ebx
4000026f:	e8 ec 09 00 00       	call   40000c60 <__udivdi3>
40000274:	83 c4 18             	add    $0x18,%esp
40000277:	52                   	push   %edx
40000278:	50                   	push   %eax
40000279:	89 fa                	mov    %edi,%edx
4000027b:	89 f0                	mov    %esi,%eax
4000027d:	e8 7f ff ff ff       	call   40000201 <printnum>
40000282:	83 c4 20             	add    $0x20,%esp
40000285:	eb 11                	jmp    40000298 <printnum+0x97>
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
            putch(padc, putdat);
40000287:	83 ec 08             	sub    $0x8,%esp
4000028a:	57                   	push   %edi
4000028b:	55                   	push   %ebp
4000028c:	ff d6                	call   *%esi
4000028e:	83 c4 10             	add    $0x10,%esp
        while (--width > 0)
40000291:	83 eb 01             	sub    $0x1,%ebx
40000294:	85 db                	test   %ebx,%ebx
40000296:	7f ef                	jg     40000287 <printnum+0x86>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
40000298:	ff 74 24 0c          	push   0xc(%esp)
4000029c:	ff 74 24 0c          	push   0xc(%esp)
400002a0:	ff 74 24 24          	push   0x24(%esp)
400002a4:	ff 74 24 24          	push   0x24(%esp)
400002a8:	8b 5c 24 24          	mov    0x24(%esp),%ebx
400002ac:	e8 cf 0a 00 00       	call   40000d80 <__umoddi3>
400002b1:	83 c4 08             	add    $0x8,%esp
400002b4:	57                   	push   %edi
400002b5:	0f be 84 03 24 e0 ff 	movsbl -0x1fdc(%ebx,%eax,1),%eax
400002bc:	ff 
400002bd:	50                   	push   %eax
400002be:	ff d6                	call   *%esi
}
400002c0:	83 c4 3c             	add    $0x3c,%esp
400002c3:	5b                   	pop    %ebx
400002c4:	5e                   	pop    %esi
400002c5:	5f                   	pop    %edi
400002c6:	5d                   	pop    %ebp
400002c7:	c3                   	ret    

400002c8 <getuint>:

// Get an unsigned int of various possible sizes from a varargs list,
// depending on the lflag parameter.
static unsigned long long getuint(va_list * ap, int lflag)
{
    if (lflag >= 2)
400002c8:	83 fa 01             	cmp    $0x1,%edx
400002cb:	7f 13                	jg     400002e0 <getuint+0x18>
        return va_arg(*ap, unsigned long long);
    else if (lflag)
400002cd:	85 d2                	test   %edx,%edx
400002cf:	74 1c                	je     400002ed <getuint+0x25>
        return va_arg(*ap, unsigned long);
400002d1:	8b 08                	mov    (%eax),%ecx
400002d3:	8d 51 04             	lea    0x4(%ecx),%edx
400002d6:	89 10                	mov    %edx,(%eax)
400002d8:	8b 01                	mov    (%ecx),%eax
400002da:	ba 00 00 00 00       	mov    $0x0,%edx
400002df:	c3                   	ret    
        return va_arg(*ap, unsigned long long);
400002e0:	8b 08                	mov    (%eax),%ecx
400002e2:	8d 51 08             	lea    0x8(%ecx),%edx
400002e5:	89 10                	mov    %edx,(%eax)
400002e7:	8b 01                	mov    (%ecx),%eax
400002e9:	8b 51 04             	mov    0x4(%ecx),%edx
400002ec:	c3                   	ret    
    else
        return va_arg(*ap, unsigned int);
400002ed:	8b 08                	mov    (%eax),%ecx
400002ef:	8d 51 04             	lea    0x4(%ecx),%edx
400002f2:	89 10                	mov    %edx,(%eax)
400002f4:	8b 01                	mov    (%ecx),%eax
400002f6:	ba 00 00 00 00       	mov    $0x0,%edx
}
400002fb:	c3                   	ret    

400002fc <getint>:

// Same as getuint but signed - can't use getuint
// because of sign extension
static long long getint(va_list * ap, int lflag)
{
    if (lflag >= 2)
400002fc:	83 fa 01             	cmp    $0x1,%edx
400002ff:	7f 0f                	jg     40000310 <getint+0x14>
        return va_arg(*ap, long long);
    else if (lflag)
40000301:	85 d2                	test   %edx,%edx
40000303:	74 18                	je     4000031d <getint+0x21>
        return va_arg(*ap, long);
40000305:	8b 08                	mov    (%eax),%ecx
40000307:	8d 51 04             	lea    0x4(%ecx),%edx
4000030a:	89 10                	mov    %edx,(%eax)
4000030c:	8b 01                	mov    (%ecx),%eax
4000030e:	99                   	cltd   
4000030f:	c3                   	ret    
        return va_arg(*ap, long long);
40000310:	8b 08                	mov    (%eax),%ecx
40000312:	8d 51 08             	lea    0x8(%ecx),%edx
40000315:	89 10                	mov    %edx,(%eax)
40000317:	8b 01                	mov    (%ecx),%eax
40000319:	8b 51 04             	mov    0x4(%ecx),%edx
4000031c:	c3                   	ret    
    else
        return va_arg(*ap, int);
4000031d:	8b 08                	mov    (%eax),%ecx
4000031f:	8d 51 04             	lea    0x4(%ecx),%edx
40000322:	89 10                	mov    %edx,(%eax)
40000324:	8b 01                	mov    (%ecx),%eax
40000326:	99                   	cltd   
}
40000327:	c3                   	ret    

40000328 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
40000328:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
4000032c:	8b 48 08             	mov    0x8(%eax),%ecx
4000032f:	8d 51 01             	lea    0x1(%ecx),%edx
40000332:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf)
40000335:	8b 10                	mov    (%eax),%edx
40000337:	3b 50 04             	cmp    0x4(%eax),%edx
4000033a:	73 0b                	jae    40000347 <sprintputch+0x1f>
        *b->buf++ = ch;
4000033c:	8d 4a 01             	lea    0x1(%edx),%ecx
4000033f:	89 08                	mov    %ecx,(%eax)
40000341:	8b 44 24 04          	mov    0x4(%esp),%eax
40000345:	88 02                	mov    %al,(%edx)
}
40000347:	c3                   	ret    

40000348 <vprintfmt>:
{
40000348:	55                   	push   %ebp
40000349:	57                   	push   %edi
4000034a:	56                   	push   %esi
4000034b:	53                   	push   %ebx
4000034c:	83 ec 2c             	sub    $0x2c,%esp
4000034f:	e8 64 04 00 00       	call   400007b8 <__x86.get_pc_thunk.ax>
40000354:	05 ac 2c 00 00       	add    $0x2cac,%eax
40000359:	89 44 24 10          	mov    %eax,0x10(%esp)
4000035d:	8b 74 24 40          	mov    0x40(%esp),%esi
40000361:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000365:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000369:	8d 5d 01             	lea    0x1(%ebp),%ebx
4000036c:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000370:	83 f8 25             	cmp    $0x25,%eax
40000373:	74 16                	je     4000038b <vprintfmt+0x43>
            if (ch == '\0')
40000375:	85 c0                	test   %eax,%eax
40000377:	0f 84 41 03 00 00    	je     400006be <.L27+0x1d>
            putch(ch, putdat);
4000037d:	83 ec 08             	sub    $0x8,%esp
40000380:	57                   	push   %edi
40000381:	50                   	push   %eax
40000382:	ff d6                	call   *%esi
40000384:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000387:	89 dd                	mov    %ebx,%ebp
40000389:	eb de                	jmp    40000369 <vprintfmt+0x21>
        padc = ' ';
4000038b:	c6 44 24 1b 20       	movb   $0x20,0x1b(%esp)
        altflag = 0;
40000390:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        precision = -1;
40000397:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
4000039e:	ff 
        width = -1;
4000039f:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
400003a6:	ff 
        lflag = 0;
400003a7:	b9 00 00 00 00       	mov    $0x0,%ecx
400003ac:	89 4c 24 14          	mov    %ecx,0x14(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400003b0:	8d 6b 01             	lea    0x1(%ebx),%ebp
400003b3:	0f b6 03             	movzbl (%ebx),%eax
400003b6:	0f b6 c8             	movzbl %al,%ecx
400003b9:	89 4c 24 08          	mov    %ecx,0x8(%esp)
400003bd:	83 e8 23             	sub    $0x23,%eax
400003c0:	3c 55                	cmp    $0x55,%al
400003c2:	0f 87 d9 02 00 00    	ja     400006a1 <.L27>
400003c8:	0f b6 c0             	movzbl %al,%eax
400003cb:	8b 4c 24 10          	mov    0x10(%esp),%ecx
400003cf:	89 ca                	mov    %ecx,%edx
400003d1:	03 94 81 3c e0 ff ff 	add    -0x1fc4(%ecx,%eax,4),%edx
400003d8:	ff e2                	jmp    *%edx

400003da <.L25>:
400003da:	89 eb                	mov    %ebp,%ebx
400003dc:	c6 44 24 1b 2d       	movb   $0x2d,0x1b(%esp)
400003e1:	eb cd                	jmp    400003b0 <vprintfmt+0x68>

400003e3 <.L62>:
400003e3:	89 eb                	mov    %ebp,%ebx
            padc = '0';
400003e5:	c6 44 24 1b 30       	movb   $0x30,0x1b(%esp)
400003ea:	eb c4                	jmp    400003b0 <vprintfmt+0x68>

400003ec <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
400003ec:	b8 00 00 00 00       	mov    $0x0,%eax
400003f1:	8b 4c 24 14          	mov    0x14(%esp),%ecx
400003f5:	8b 54 24 08          	mov    0x8(%esp),%edx
                precision = precision * 10 + ch - '0';
400003f9:	8d 04 80             	lea    (%eax,%eax,4),%eax
400003fc:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
                ch = *fmt;
40000400:	0f be 55 00          	movsbl 0x0(%ebp),%edx
                if (ch < '0' || ch > '9')
40000404:	8d 5a d0             	lea    -0x30(%edx),%ebx
40000407:	83 fb 09             	cmp    $0x9,%ebx
4000040a:	77 5b                	ja     40000467 <.L41+0xe>
            for (precision = 0;; ++fmt) {
4000040c:	83 c5 01             	add    $0x1,%ebp
                precision = precision * 10 + ch - '0';
4000040f:	eb e8                	jmp    400003f9 <.L63+0xd>

40000411 <.L39>:
            precision = va_arg(ap, int);
40000411:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000415:	83 c0 04             	add    $0x4,%eax
40000418:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000041c:	8b 40 fc             	mov    -0x4(%eax),%eax
4000041f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000423:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000425:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
4000042a:	79 84                	jns    400003b0 <vprintfmt+0x68>
                width = precision, precision = -1;
4000042c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000430:	89 44 24 0c          	mov    %eax,0xc(%esp)
40000434:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
4000043b:	ff 
            goto reswitch;
4000043c:	e9 6f ff ff ff       	jmp    400003b0 <vprintfmt+0x68>

40000441 <.L38>:
            if (width < 0)
40000441:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
40000446:	78 07                	js     4000044f <.L38+0xe>
        switch (ch = *(unsigned char *) fmt++) {
40000448:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
4000044a:	e9 61 ff ff ff       	jmp    400003b0 <vprintfmt+0x68>
                width = 0;
4000044f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000456:	00 
40000457:	eb ef                	jmp    40000448 <.L38+0x7>

40000459 <.L41>:
        switch (ch = *(unsigned char *) fmt++) {
40000459:	89 eb                	mov    %ebp,%ebx
            altflag = 1;
4000045b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
            goto reswitch;
40000462:	e9 49 ff ff ff       	jmp    400003b0 <vprintfmt+0x68>
40000467:	89 4c 24 14          	mov    %ecx,0x14(%esp)
4000046b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
4000046f:	89 eb                	mov    %ebp,%ebx
40000471:	eb b2                	jmp    40000425 <.L39+0x14>

40000473 <.L34>:
            lflag++;
40000473:	83 44 24 14 01       	addl   $0x1,0x14(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000478:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
4000047a:	e9 31 ff ff ff       	jmp    400003b0 <vprintfmt+0x68>

4000047f <.L36>:
            putch(va_arg(ap, int), putdat);
4000047f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000483:	83 c0 04             	add    $0x4,%eax
40000486:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000048a:	83 ec 08             	sub    $0x8,%esp
4000048d:	57                   	push   %edi
4000048e:	ff 70 fc             	push   -0x4(%eax)
40000491:	ff d6                	call   *%esi
            break;
40000493:	83 c4 10             	add    $0x10,%esp
40000496:	e9 ce fe ff ff       	jmp    40000369 <vprintfmt+0x21>

4000049b <.L31>:
            if ((p = va_arg(ap, char *)) == NULL)
4000049b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000049f:	83 c0 04             	add    $0x4,%eax
400004a2:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400004a6:	8b 40 fc             	mov    -0x4(%eax),%eax
400004a9:	89 44 24 08          	mov    %eax,0x8(%esp)
400004ad:	85 c0                	test   %eax,%eax
400004af:	74 2a                	je     400004db <.L31+0x40>
            if (width > 0 && padc != '-')
400004b1:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
400004b6:	0f 9f c2             	setg   %dl
400004b9:	80 7c 24 1b 2d       	cmpb   $0x2d,0x1b(%esp)
400004be:	0f 95 c0             	setne  %al
400004c1:	84 c2                	test   %al,%dl
400004c3:	75 26                	jne    400004eb <.L31+0x50>
400004c5:	8b 44 24 08          	mov    0x8(%esp),%eax
400004c9:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400004cd:	89 74 24 40          	mov    %esi,0x40(%esp)
400004d1:	8b 74 24 0c          	mov    0xc(%esp),%esi
400004d5:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400004d9:	eb 70                	jmp    4000054b <.L31+0xb0>
                p = "(null)";
400004db:	8b 44 24 10          	mov    0x10(%esp),%eax
400004df:	8d 80 35 e0 ff ff    	lea    -0x1fcb(%eax),%eax
400004e5:	89 44 24 08          	mov    %eax,0x8(%esp)
400004e9:	eb c6                	jmp    400004b1 <.L31+0x16>
                for (width -= strnlen(p, precision); width > 0; width--)
400004eb:	83 ec 08             	sub    $0x8,%esp
400004ee:	ff 74 24 24          	push   0x24(%esp)
400004f2:	ff 74 24 14          	push   0x14(%esp)
400004f6:	8b 5c 24 20          	mov    0x20(%esp),%ebx
400004fa:	e8 48 03 00 00       	call   40000847 <strnlen>
400004ff:	29 44 24 1c          	sub    %eax,0x1c(%esp)
40000503:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000507:	83 c4 10             	add    $0x10,%esp
4000050a:	89 d3                	mov    %edx,%ebx
4000050c:	eb 12                	jmp    40000520 <.L31+0x85>
                    putch(padc, putdat);
4000050e:	83 ec 08             	sub    $0x8,%esp
40000511:	57                   	push   %edi
40000512:	0f be 44 24 27       	movsbl 0x27(%esp),%eax
40000517:	50                   	push   %eax
40000518:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
4000051a:	83 eb 01             	sub    $0x1,%ebx
4000051d:	83 c4 10             	add    $0x10,%esp
40000520:	85 db                	test   %ebx,%ebx
40000522:	7f ea                	jg     4000050e <.L31+0x73>
40000524:	89 da                	mov    %ebx,%edx
40000526:	8b 44 24 08          	mov    0x8(%esp),%eax
4000052a:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
4000052e:	89 74 24 40          	mov    %esi,0x40(%esp)
40000532:	89 d6                	mov    %edx,%esi
40000534:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000538:	eb 11                	jmp    4000054b <.L31+0xb0>
                    putch(ch, putdat);
4000053a:	83 ec 08             	sub    $0x8,%esp
4000053d:	57                   	push   %edi
4000053e:	52                   	push   %edx
4000053f:	ff 54 24 50          	call   *0x50(%esp)
40000543:	83 c4 10             	add    $0x10,%esp
                                         || --precision >= 0); width--)
40000546:	83 ee 01             	sub    $0x1,%esi
                 (ch = *p++) != '\0' && (precision < 0
40000549:	89 e8                	mov    %ebp,%eax
4000054b:	8d 68 01             	lea    0x1(%eax),%ebp
4000054e:	0f b6 00             	movzbl (%eax),%eax
40000551:	0f be d0             	movsbl %al,%edx
40000554:	85 d2                	test   %edx,%edx
40000556:	74 4c                	je     400005a4 <.L31+0x109>
40000558:	85 db                	test   %ebx,%ebx
4000055a:	78 05                	js     40000561 <.L31+0xc6>
                                         || --precision >= 0); width--)
4000055c:	83 eb 01             	sub    $0x1,%ebx
4000055f:	78 20                	js     40000581 <.L31+0xe6>
                if (altflag && (ch < ' ' || ch > '~'))
40000561:	83 3c 24 00          	cmpl   $0x0,(%esp)
40000565:	74 d3                	je     4000053a <.L31+0x9f>
40000567:	0f be c0             	movsbl %al,%eax
4000056a:	83 e8 20             	sub    $0x20,%eax
4000056d:	83 f8 5e             	cmp    $0x5e,%eax
40000570:	76 c8                	jbe    4000053a <.L31+0x9f>
                    putch('?', putdat);
40000572:	83 ec 08             	sub    $0x8,%esp
40000575:	57                   	push   %edi
40000576:	6a 3f                	push   $0x3f
40000578:	ff 54 24 50          	call   *0x50(%esp)
4000057c:	83 c4 10             	add    $0x10,%esp
4000057f:	eb c5                	jmp    40000546 <.L31+0xab>
40000581:	89 f3                	mov    %esi,%ebx
40000583:	8b 74 24 40          	mov    0x40(%esp),%esi
40000587:	8b 6c 24 48          	mov    0x48(%esp),%ebp
4000058b:	eb 0e                	jmp    4000059b <.L31+0x100>
                putch(' ', putdat);
4000058d:	83 ec 08             	sub    $0x8,%esp
40000590:	57                   	push   %edi
40000591:	6a 20                	push   $0x20
40000593:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000595:	83 eb 01             	sub    $0x1,%ebx
40000598:	83 c4 10             	add    $0x10,%esp
4000059b:	85 db                	test   %ebx,%ebx
4000059d:	7f ee                	jg     4000058d <.L31+0xf2>
4000059f:	e9 c5 fd ff ff       	jmp    40000369 <vprintfmt+0x21>
400005a4:	89 f3                	mov    %esi,%ebx
400005a6:	8b 74 24 40          	mov    0x40(%esp),%esi
400005aa:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400005ae:	eb eb                	jmp    4000059b <.L31+0x100>

400005b0 <.L35>:
            num = getint(&ap, lflag);
400005b0:	8b 4c 24 14          	mov    0x14(%esp),%ecx
400005b4:	8d 44 24 4c          	lea    0x4c(%esp),%eax
400005b8:	89 ca                	mov    %ecx,%edx
400005ba:	e8 3d fd ff ff       	call   400002fc <getint>
            if ((long long) num < 0) {
400005bf:	89 04 24             	mov    %eax,(%esp)
400005c2:	89 54 24 04          	mov    %edx,0x4(%esp)
400005c6:	83 7c 24 04 00       	cmpl   $0x0,0x4(%esp)
400005cb:	78 26                	js     400005f3 <.L35+0x43>
            base = 10;
400005cd:	bb 0a 00 00 00       	mov    $0xa,%ebx
            printnum(putch, putdat, num, base, width, padc);
400005d2:	83 ec 0c             	sub    $0xc,%esp
400005d5:	0f be 4c 24 27       	movsbl 0x27(%esp),%ecx
400005da:	51                   	push   %ecx
400005db:	ff 74 24 1c          	push   0x1c(%esp)
400005df:	53                   	push   %ebx
400005e0:	52                   	push   %edx
400005e1:	50                   	push   %eax
400005e2:	89 fa                	mov    %edi,%edx
400005e4:	89 f0                	mov    %esi,%eax
400005e6:	e8 16 fc ff ff       	call   40000201 <printnum>
            break;
400005eb:	83 c4 20             	add    $0x20,%esp
400005ee:	e9 76 fd ff ff       	jmp    40000369 <vprintfmt+0x21>
                putch('-', putdat);
400005f3:	83 ec 08             	sub    $0x8,%esp
400005f6:	57                   	push   %edi
400005f7:	6a 2d                	push   $0x2d
400005f9:	ff d6                	call   *%esi
                num = -(long long) num;
400005fb:	8b 44 24 10          	mov    0x10(%esp),%eax
400005ff:	8b 54 24 14          	mov    0x14(%esp),%edx
40000603:	f7 d8                	neg    %eax
40000605:	83 d2 00             	adc    $0x0,%edx
40000608:	f7 da                	neg    %edx
4000060a:	83 c4 10             	add    $0x10,%esp
4000060d:	eb be                	jmp    400005cd <.L35+0x1d>

4000060f <.L30>:
            num = getuint(&ap, lflag);
4000060f:	8b 4c 24 14          	mov    0x14(%esp),%ecx
40000613:	8d 44 24 4c          	lea    0x4c(%esp),%eax
40000617:	89 ca                	mov    %ecx,%edx
40000619:	e8 aa fc ff ff       	call   400002c8 <getuint>
            base = 10;
4000061e:	bb 0a 00 00 00       	mov    $0xa,%ebx
            goto number;
40000623:	eb ad                	jmp    400005d2 <.L35+0x22>

40000625 <.L33>:
            putch('X', putdat);
40000625:	83 ec 08             	sub    $0x8,%esp
40000628:	57                   	push   %edi
40000629:	6a 58                	push   $0x58
4000062b:	ff d6                	call   *%esi
            putch('X', putdat);
4000062d:	83 c4 08             	add    $0x8,%esp
40000630:	57                   	push   %edi
40000631:	6a 58                	push   $0x58
40000633:	ff d6                	call   *%esi
            putch('X', putdat);
40000635:	83 c4 08             	add    $0x8,%esp
40000638:	57                   	push   %edi
40000639:	6a 58                	push   $0x58
4000063b:	ff d6                	call   *%esi
            break;
4000063d:	83 c4 10             	add    $0x10,%esp
40000640:	e9 24 fd ff ff       	jmp    40000369 <vprintfmt+0x21>

40000645 <.L32>:
            putch('0', putdat);
40000645:	83 ec 08             	sub    $0x8,%esp
40000648:	57                   	push   %edi
40000649:	6a 30                	push   $0x30
4000064b:	ff d6                	call   *%esi
            putch('x', putdat);
4000064d:	83 c4 08             	add    $0x8,%esp
40000650:	57                   	push   %edi
40000651:	6a 78                	push   $0x78
40000653:	ff d6                	call   *%esi
                (uintptr_t) va_arg(ap, void *);
40000655:	8b 44 24 5c          	mov    0x5c(%esp),%eax
40000659:	83 c0 04             	add    $0x4,%eax
4000065c:	89 44 24 5c          	mov    %eax,0x5c(%esp)
            num = (unsigned long long)
40000660:	8b 40 fc             	mov    -0x4(%eax),%eax
40000663:	ba 00 00 00 00       	mov    $0x0,%edx
            goto number;
40000668:	83 c4 10             	add    $0x10,%esp
            base = 16;
4000066b:	bb 10 00 00 00       	mov    $0x10,%ebx
            goto number;
40000670:	e9 5d ff ff ff       	jmp    400005d2 <.L35+0x22>

40000675 <.L28>:
            num = getuint(&ap, lflag);
40000675:	8b 4c 24 14          	mov    0x14(%esp),%ecx
40000679:	8d 44 24 4c          	lea    0x4c(%esp),%eax
4000067d:	89 ca                	mov    %ecx,%edx
4000067f:	e8 44 fc ff ff       	call   400002c8 <getuint>
            base = 16;
40000684:	bb 10 00 00 00       	mov    $0x10,%ebx
40000689:	e9 44 ff ff ff       	jmp    400005d2 <.L35+0x22>

4000068e <.L40>:
            putch(ch, putdat);
4000068e:	8b 54 24 08          	mov    0x8(%esp),%edx
40000692:	83 ec 08             	sub    $0x8,%esp
40000695:	57                   	push   %edi
40000696:	52                   	push   %edx
40000697:	ff d6                	call   *%esi
            break;
40000699:	83 c4 10             	add    $0x10,%esp
4000069c:	e9 c8 fc ff ff       	jmp    40000369 <vprintfmt+0x21>

400006a1 <.L27>:
            putch('%', putdat);
400006a1:	83 ec 08             	sub    $0x8,%esp
400006a4:	57                   	push   %edi
400006a5:	6a 25                	push   $0x25
400006a7:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
400006a9:	83 c4 10             	add    $0x10,%esp
400006ac:	89 dd                	mov    %ebx,%ebp
400006ae:	eb 03                	jmp    400006b3 <.L27+0x12>
400006b0:	83 ed 01             	sub    $0x1,%ebp
400006b3:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400006b7:	75 f7                	jne    400006b0 <.L27+0xf>
400006b9:	e9 ab fc ff ff       	jmp    40000369 <vprintfmt+0x21>
}
400006be:	83 c4 2c             	add    $0x2c,%esp
400006c1:	5b                   	pop    %ebx
400006c2:	5e                   	pop    %esi
400006c3:	5f                   	pop    %edi
400006c4:	5d                   	pop    %ebp
400006c5:	c3                   	ret    

400006c6 <printfmt>:
{
400006c6:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
400006c9:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400006cd:	50                   	push   %eax
400006ce:	ff 74 24 1c          	push   0x1c(%esp)
400006d2:	ff 74 24 1c          	push   0x1c(%esp)
400006d6:	ff 74 24 1c          	push   0x1c(%esp)
400006da:	e8 69 fc ff ff       	call   40000348 <vprintfmt>
}
400006df:	83 c4 1c             	add    $0x1c,%esp
400006e2:	c3                   	ret    

400006e3 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
400006e3:	83 ec 1c             	sub    $0x1c,%esp
400006e6:	e8 cd 00 00 00       	call   400007b8 <__x86.get_pc_thunk.ax>
400006eb:	05 15 29 00 00       	add    $0x2915,%eax
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400006f0:	8b 54 24 20          	mov    0x20(%esp),%edx
400006f4:	89 54 24 04          	mov    %edx,0x4(%esp)
400006f8:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400006ff:	ff 
40000700:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000707:	00 

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000708:	ff 74 24 28          	push   0x28(%esp)
4000070c:	ff 74 24 28          	push   0x28(%esp)
40000710:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000714:	52                   	push   %edx
40000715:	8d 80 28 d3 ff ff    	lea    -0x2cd8(%eax),%eax
4000071b:	50                   	push   %eax
4000071c:	e8 27 fc ff ff       	call   40000348 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000721:	8b 44 24 14          	mov    0x14(%esp),%eax
40000725:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000728:	8b 44 24 1c          	mov    0x1c(%esp),%eax
4000072c:	83 c4 2c             	add    $0x2c,%esp
4000072f:	c3                   	ret    

40000730 <sprintf>:

int sprintf(char *buf, const char *fmt, ...)
{
40000730:	83 ec 10             	sub    $0x10,%esp
    va_list ap;
    int rc;

    va_start(ap, fmt);
    rc = vsprintf(buf, fmt, ap);
40000733:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000737:	50                   	push   %eax
40000738:	ff 74 24 1c          	push   0x1c(%esp)
4000073c:	ff 74 24 1c          	push   0x1c(%esp)
40000740:	e8 9e ff ff ff       	call   400006e3 <vsprintf>
    va_end(ap);

    return rc;
}
40000745:	83 c4 1c             	add    $0x1c,%esp
40000748:	c3                   	ret    

40000749 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
40000749:	83 ec 1c             	sub    $0x1c,%esp
4000074c:	e8 6b 00 00 00       	call   400007bc <__x86.get_pc_thunk.dx>
40000751:	81 c2 af 28 00 00    	add    $0x28af,%edx
40000757:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
4000075b:	89 44 24 04          	mov    %eax,0x4(%esp)
4000075f:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000763:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000767:	89 44 24 08          	mov    %eax,0x8(%esp)
4000076b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000772:	00 

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000773:	ff 74 24 2c          	push   0x2c(%esp)
40000777:	ff 74 24 2c          	push   0x2c(%esp)
4000077b:	8d 44 24 0c          	lea    0xc(%esp),%eax
4000077f:	50                   	push   %eax
40000780:	8d 82 28 d3 ff ff    	lea    -0x2cd8(%edx),%eax
40000786:	50                   	push   %eax
40000787:	e8 bc fb ff ff       	call   40000348 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
4000078c:	8b 44 24 14          	mov    0x14(%esp),%eax
40000790:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000793:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000797:	83 c4 2c             	add    $0x2c,%esp
4000079a:	c3                   	ret    

4000079b <snprintf>:

int snprintf(char *buf, int n, const char *fmt, ...)
{
4000079b:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    int rc;

    va_start(ap, fmt);
    rc = vsnprintf(buf, n, fmt, ap);
4000079e:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400007a2:	50                   	push   %eax
400007a3:	ff 74 24 1c          	push   0x1c(%esp)
400007a7:	ff 74 24 1c          	push   0x1c(%esp)
400007ab:	ff 74 24 1c          	push   0x1c(%esp)
400007af:	e8 95 ff ff ff       	call   40000749 <vsnprintf>
    va_end(ap);

    return rc;
}
400007b4:	83 c4 1c             	add    $0x1c,%esp
400007b7:	c3                   	ret    

400007b8 <__x86.get_pc_thunk.ax>:
400007b8:	8b 04 24             	mov    (%esp),%eax
400007bb:	c3                   	ret    

400007bc <__x86.get_pc_thunk.dx>:
400007bc:	8b 14 24             	mov    (%esp),%edx
400007bf:	c3                   	ret    

400007c0 <__x86.get_pc_thunk.cx>:
400007c0:	8b 0c 24             	mov    (%esp),%ecx
400007c3:	c3                   	ret    

400007c4 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
400007c4:	53                   	push   %ebx
static gcc_inline pid_t sys_spawn(unsigned int elf_id, unsigned int quota)
{
    int errno;
    pid_t pid;

    asm volatile ("int %2"
400007c5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
400007c9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400007cd:	b8 01 00 00 00       	mov    $0x1,%eax
400007d2:	cd 30                	int    $0x30
                    "a" (SYS_spawn),
                    "b" (elf_id),
                    "c" (quota)
                  : "cc", "memory");

    return errno ? -1 : pid;
400007d4:	85 c0                	test   %eax,%eax
400007d6:	75 04                	jne    400007dc <spawn+0x18>
    return sys_spawn(exec, quota);
}
400007d8:	89 d8                	mov    %ebx,%eax
400007da:	5b                   	pop    %ebx
400007db:	c3                   	ret    
400007dc:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    return sys_spawn(exec, quota);
400007e1:	eb f5                	jmp    400007d8 <spawn+0x14>

400007e3 <yield>:
}

static gcc_inline void sys_yield(void)
{
    asm volatile ("int %0"
400007e3:	b8 02 00 00 00       	mov    $0x2,%eax
400007e8:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
400007ea:	c3                   	ret    

400007eb <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
400007eb:	8b 44 24 04          	mov    0x4(%esp),%eax
400007ef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
400007f5:	c3                   	ret    

400007f6 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
400007f6:	8b 54 24 04          	mov    0x4(%esp),%edx
    while (xchg(lk, 1) != 0)
400007fa:	eb 02                	jmp    400007fe <spinlock_acquire+0x8>
        asm volatile ("pause");
400007fc:	f3 90                	pause  
    asm volatile ("lock; xchgl %0, %1"
400007fe:	b8 01 00 00 00       	mov    $0x1,%eax
40000803:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000806:	85 c0                	test   %eax,%eax
40000808:	75 f2                	jne    400007fc <spinlock_acquire+0x6>
}
4000080a:	c3                   	ret    

4000080b <spinlock_holding>:
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
4000080b:	8b 44 24 04          	mov    0x4(%esp),%eax
4000080f:	8b 00                	mov    (%eax),%eax
}
40000811:	c3                   	ret    

40000812 <spinlock_release>:
{
40000812:	53                   	push   %ebx
40000813:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    if (spinlock_holding(lk) == FALSE)
40000817:	53                   	push   %ebx
40000818:	e8 ee ff ff ff       	call   4000080b <spinlock_holding>
4000081d:	83 c4 04             	add    $0x4,%esp
40000820:	84 c0                	test   %al,%al
40000822:	74 08                	je     4000082c <spinlock_release+0x1a>
    asm volatile ("lock; xchgl %0, %1"
40000824:	b8 00 00 00 00       	mov    $0x0,%eax
40000829:	f0 87 03             	lock xchg %eax,(%ebx)
}
4000082c:	5b                   	pop    %ebx
4000082d:	c3                   	ret    

4000082e <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
4000082e:	8b 44 24 04          	mov    0x4(%esp),%eax
    int n;

    for (n = 0; *s != '\0'; s++)
40000832:	ba 00 00 00 00       	mov    $0x0,%edx
40000837:	eb 06                	jmp    4000083f <strlen+0x11>
        n++;
40000839:	83 c2 01             	add    $0x1,%edx
    for (n = 0; *s != '\0'; s++)
4000083c:	83 c0 01             	add    $0x1,%eax
4000083f:	80 38 00             	cmpb   $0x0,(%eax)
40000842:	75 f5                	jne    40000839 <strlen+0xb>
    return n;
}
40000844:	89 d0                	mov    %edx,%eax
40000846:	c3                   	ret    

40000847 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000847:	8b 54 24 04          	mov    0x4(%esp),%edx
4000084b:	8b 44 24 08          	mov    0x8(%esp),%eax
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
4000084f:	b9 00 00 00 00       	mov    $0x0,%ecx
40000854:	eb 09                	jmp    4000085f <strnlen+0x18>
        n++;
40000856:	83 c1 01             	add    $0x1,%ecx
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000859:	83 c2 01             	add    $0x1,%edx
4000085c:	83 e8 01             	sub    $0x1,%eax
4000085f:	85 c0                	test   %eax,%eax
40000861:	74 05                	je     40000868 <strnlen+0x21>
40000863:	80 3a 00             	cmpb   $0x0,(%edx)
40000866:	75 ee                	jne    40000856 <strnlen+0xf>
    return n;
}
40000868:	89 c8                	mov    %ecx,%eax
4000086a:	c3                   	ret    

4000086b <strcpy>:

char *strcpy(char *dst, const char *src)
{
4000086b:	56                   	push   %esi
4000086c:	53                   	push   %ebx
4000086d:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000871:	8b 54 24 10          	mov    0x10(%esp),%edx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000875:	89 f0                	mov    %esi,%eax
40000877:	89 d1                	mov    %edx,%ecx
40000879:	83 c2 01             	add    $0x1,%edx
4000087c:	89 c3                	mov    %eax,%ebx
4000087e:	83 c0 01             	add    $0x1,%eax
40000881:	0f b6 09             	movzbl (%ecx),%ecx
40000884:	88 0b                	mov    %cl,(%ebx)
40000886:	84 c9                	test   %cl,%cl
40000888:	75 ed                	jne    40000877 <strcpy+0xc>
        /* do nothing */ ;
    return ret;
}
4000088a:	89 f0                	mov    %esi,%eax
4000088c:	5b                   	pop    %ebx
4000088d:	5e                   	pop    %esi
4000088e:	c3                   	ret    

4000088f <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
4000088f:	55                   	push   %ebp
40000890:	57                   	push   %edi
40000891:	56                   	push   %esi
40000892:	53                   	push   %ebx
40000893:	8b 6c 24 14          	mov    0x14(%esp),%ebp
40000897:	8b 5c 24 18          	mov    0x18(%esp),%ebx
4000089b:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
4000089f:	89 ea                	mov    %ebp,%edx
400008a1:	b8 00 00 00 00       	mov    $0x0,%eax
400008a6:	eb 05                	jmp    400008ad <strncpy+0x1e>
400008a8:	83 c0 01             	add    $0x1,%eax
        *dst++ = *src;
400008ab:	89 f2                	mov    %esi,%edx
    for (i = 0; i < size; i++) {
400008ad:	39 f8                	cmp    %edi,%eax
400008af:	73 11                	jae    400008c2 <strncpy+0x33>
        *dst++ = *src;
400008b1:	8d 72 01             	lea    0x1(%edx),%esi
400008b4:	0f b6 0b             	movzbl (%ebx),%ecx
400008b7:	88 0a                	mov    %cl,(%edx)
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
400008b9:	84 c9                	test   %cl,%cl
400008bb:	74 eb                	je     400008a8 <strncpy+0x19>
            src++;
400008bd:	83 c3 01             	add    $0x1,%ebx
400008c0:	eb e6                	jmp    400008a8 <strncpy+0x19>
    }
    return ret;
}
400008c2:	89 e8                	mov    %ebp,%eax
400008c4:	5b                   	pop    %ebx
400008c5:	5e                   	pop    %esi
400008c6:	5f                   	pop    %edi
400008c7:	5d                   	pop    %ebp
400008c8:	c3                   	ret    

400008c9 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
400008c9:	53                   	push   %ebx
400008ca:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400008ce:	8b 54 24 10          	mov    0x10(%esp),%edx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
400008d2:	85 d2                	test   %edx,%edx
400008d4:	75 23                	jne    400008f9 <strlcpy+0x30>
400008d6:	8b 44 24 08          	mov    0x8(%esp),%eax
400008da:	eb 17                	jmp    400008f3 <strlcpy+0x2a>
        while (--size > 0 && *src != '\0')
            *dst++ = *src++;
400008dc:	83 c1 01             	add    $0x1,%ecx
400008df:	88 18                	mov    %bl,(%eax)
400008e1:	8d 40 01             	lea    0x1(%eax),%eax
        while (--size > 0 && *src != '\0')
400008e4:	83 ea 01             	sub    $0x1,%edx
400008e7:	74 07                	je     400008f0 <strlcpy+0x27>
400008e9:	0f b6 19             	movzbl (%ecx),%ebx
400008ec:	84 db                	test   %bl,%bl
400008ee:	75 ec                	jne    400008dc <strlcpy+0x13>
        *dst = '\0';
400008f0:	c6 00 00             	movb   $0x0,(%eax)
    }
    return dst - dst_in;
400008f3:	2b 44 24 08          	sub    0x8(%esp),%eax
}
400008f7:	5b                   	pop    %ebx
400008f8:	c3                   	ret    
400008f9:	8b 44 24 08          	mov    0x8(%esp),%eax
400008fd:	eb e5                	jmp    400008e4 <strlcpy+0x1b>

400008ff <strcmp>:

int strcmp(const char *p, const char *q)
{
400008ff:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000903:	8b 54 24 08          	mov    0x8(%esp),%edx
    while (*p && *p == *q)
40000907:	eb 06                	jmp    4000090f <strcmp+0x10>
        p++, q++;
40000909:	83 c1 01             	add    $0x1,%ecx
4000090c:	83 c2 01             	add    $0x1,%edx
    while (*p && *p == *q)
4000090f:	0f b6 01             	movzbl (%ecx),%eax
40000912:	84 c0                	test   %al,%al
40000914:	74 04                	je     4000091a <strcmp+0x1b>
40000916:	3a 02                	cmp    (%edx),%al
40000918:	74 ef                	je     40000909 <strcmp+0xa>
    return (int) ((unsigned char) *p - (unsigned char) *q);
4000091a:	0f b6 c0             	movzbl %al,%eax
4000091d:	0f b6 12             	movzbl (%edx),%edx
40000920:	29 d0                	sub    %edx,%eax
}
40000922:	c3                   	ret    

40000923 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000923:	53                   	push   %ebx
40000924:	8b 54 24 08          	mov    0x8(%esp),%edx
40000928:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
4000092c:	8b 44 24 10          	mov    0x10(%esp),%eax
    while (n > 0 && *p && *p == *q)
40000930:	eb 09                	jmp    4000093b <strncmp+0x18>
        n--, p++, q++;
40000932:	83 e8 01             	sub    $0x1,%eax
40000935:	83 c2 01             	add    $0x1,%edx
40000938:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
4000093b:	85 c0                	test   %eax,%eax
4000093d:	74 0b                	je     4000094a <strncmp+0x27>
4000093f:	0f b6 1a             	movzbl (%edx),%ebx
40000942:	84 db                	test   %bl,%bl
40000944:	74 04                	je     4000094a <strncmp+0x27>
40000946:	3a 19                	cmp    (%ecx),%bl
40000948:	74 e8                	je     40000932 <strncmp+0xf>
    if (n == 0)
4000094a:	85 c0                	test   %eax,%eax
4000094c:	74 0a                	je     40000958 <strncmp+0x35>
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
4000094e:	0f b6 02             	movzbl (%edx),%eax
40000951:	0f b6 11             	movzbl (%ecx),%edx
40000954:	29 d0                	sub    %edx,%eax
}
40000956:	5b                   	pop    %ebx
40000957:	c3                   	ret    
        return 0;
40000958:	b8 00 00 00 00       	mov    $0x0,%eax
4000095d:	eb f7                	jmp    40000956 <strncmp+0x33>

4000095f <strchr>:

char *strchr(const char *s, char c)
{
4000095f:	8b 44 24 04          	mov    0x4(%esp),%eax
40000963:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000968:	eb 03                	jmp    4000096d <strchr+0xe>
4000096a:	83 c0 01             	add    $0x1,%eax
4000096d:	0f b6 10             	movzbl (%eax),%edx
40000970:	84 d2                	test   %dl,%dl
40000972:	74 06                	je     4000097a <strchr+0x1b>
        if (*s == c)
40000974:	38 ca                	cmp    %cl,%dl
40000976:	75 f2                	jne    4000096a <strchr+0xb>
40000978:	eb 05                	jmp    4000097f <strchr+0x20>
            return (char *) s;
    return 0;
4000097a:	b8 00 00 00 00       	mov    $0x0,%eax
}
4000097f:	c3                   	ret    

40000980 <strfind>:

char *strfind(const char *s, char c)
{
40000980:	8b 44 24 04          	mov    0x4(%esp),%eax
40000984:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000989:	eb 03                	jmp    4000098e <strfind+0xe>
4000098b:	83 c0 01             	add    $0x1,%eax
4000098e:	0f b6 10             	movzbl (%eax),%edx
40000991:	84 d2                	test   %dl,%dl
40000993:	74 04                	je     40000999 <strfind+0x19>
        if (*s == c)
40000995:	38 ca                	cmp    %cl,%dl
40000997:	75 f2                	jne    4000098b <strfind+0xb>
            break;
    return (char *) s;
}
40000999:	c3                   	ret    

4000099a <strtol>:

long strtol(const char *s, char **endptr, int base)
{
4000099a:	55                   	push   %ebp
4000099b:	57                   	push   %edi
4000099c:	56                   	push   %esi
4000099d:	53                   	push   %ebx
4000099e:	83 ec 04             	sub    $0x4,%esp
400009a1:	8b 54 24 18          	mov    0x18(%esp),%edx
400009a5:	8b 74 24 1c          	mov    0x1c(%esp),%esi
400009a9:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
400009ad:	eb 03                	jmp    400009b2 <strtol+0x18>
        s++;
400009af:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
400009b2:	0f b6 02             	movzbl (%edx),%eax
400009b5:	3c 20                	cmp    $0x20,%al
400009b7:	74 f6                	je     400009af <strtol+0x15>
400009b9:	3c 09                	cmp    $0x9,%al
400009bb:	74 f2                	je     400009af <strtol+0x15>

    // plus/minus sign
    if (*s == '+')
400009bd:	3c 2b                	cmp    $0x2b,%al
400009bf:	74 38                	je     400009f9 <strtol+0x5f>
        s++;
    else if (*s == '-')
400009c1:	3c 2d                	cmp    $0x2d,%al
400009c3:	74 3e                	je     40000a03 <strtol+0x69>
    int neg = 0;
400009c5:	bf 00 00 00 00       	mov    $0x0,%edi
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
400009ca:	85 db                	test   %ebx,%ebx
400009cc:	0f 94 c0             	sete   %al
400009cf:	83 fb 10             	cmp    $0x10,%ebx
400009d2:	0f 94 c1             	sete   %cl
400009d5:	08 c8                	or     %cl,%al
400009d7:	74 05                	je     400009de <strtol+0x44>
400009d9:	80 3a 30             	cmpb   $0x30,(%edx)
400009dc:	74 2f                	je     40000a0d <strtol+0x73>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
400009de:	85 db                	test   %ebx,%ebx
400009e0:	75 05                	jne    400009e7 <strtol+0x4d>
400009e2:	80 3a 30             	cmpb   $0x30,(%edx)
400009e5:	74 36                	je     40000a1d <strtol+0x83>
        s++, base = 8;
    else if (base == 0)
400009e7:	85 db                	test   %ebx,%ebx
400009e9:	75 05                	jne    400009f0 <strtol+0x56>
        base = 10;
400009eb:	bb 0a 00 00 00       	mov    $0xa,%ebx
400009f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
400009f7:	eb 46                	jmp    40000a3f <strtol+0xa5>
        s++;
400009f9:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
400009fc:	bf 00 00 00 00       	mov    $0x0,%edi
40000a01:	eb c7                	jmp    400009ca <strtol+0x30>
        s++, neg = 1;
40000a03:	83 c2 01             	add    $0x1,%edx
40000a06:	bf 01 00 00 00       	mov    $0x1,%edi
40000a0b:	eb bd                	jmp    400009ca <strtol+0x30>
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000a0d:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000a11:	75 cb                	jne    400009de <strtol+0x44>
        s += 2, base = 16;
40000a13:	83 c2 02             	add    $0x2,%edx
40000a16:	bb 10 00 00 00       	mov    $0x10,%ebx
40000a1b:	eb d3                	jmp    400009f0 <strtol+0x56>
        s++, base = 8;
40000a1d:	83 c2 01             	add    $0x1,%edx
40000a20:	bb 08 00 00 00       	mov    $0x8,%ebx
40000a25:	eb c9                	jmp    400009f0 <strtol+0x56>
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000a27:	0f be c0             	movsbl %al,%eax
40000a2a:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000a2d:	39 d8                	cmp    %ebx,%eax
40000a2f:	7d 3f                	jge    40000a70 <strtol+0xd6>
            break;
        s++, val = (val * base) + dig;
40000a31:	83 c2 01             	add    $0x1,%edx
40000a34:	8b 0c 24             	mov    (%esp),%ecx
40000a37:	0f af cb             	imul   %ebx,%ecx
40000a3a:	01 c8                	add    %ecx,%eax
40000a3c:	89 04 24             	mov    %eax,(%esp)
        if (*s >= '0' && *s <= '9')
40000a3f:	0f b6 02             	movzbl (%edx),%eax
40000a42:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000a45:	89 e9                	mov    %ebp,%ecx
40000a47:	80 f9 09             	cmp    $0x9,%cl
40000a4a:	76 db                	jbe    40000a27 <strtol+0x8d>
        else if (*s >= 'a' && *s <= 'z')
40000a4c:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000a4f:	89 e9                	mov    %ebp,%ecx
40000a51:	80 f9 19             	cmp    $0x19,%cl
40000a54:	77 08                	ja     40000a5e <strtol+0xc4>
            dig = *s - 'a' + 10;
40000a56:	0f be c0             	movsbl %al,%eax
40000a59:	83 e8 57             	sub    $0x57,%eax
40000a5c:	eb cf                	jmp    40000a2d <strtol+0x93>
        else if (*s >= 'A' && *s <= 'Z')
40000a5e:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000a61:	89 e9                	mov    %ebp,%ecx
40000a63:	80 f9 19             	cmp    $0x19,%cl
40000a66:	77 08                	ja     40000a70 <strtol+0xd6>
            dig = *s - 'A' + 10;
40000a68:	0f be c0             	movsbl %al,%eax
40000a6b:	83 e8 37             	sub    $0x37,%eax
40000a6e:	eb bd                	jmp    40000a2d <strtol+0x93>
        // we don't properly detect overflow!
    }

    if (endptr)
40000a70:	85 f6                	test   %esi,%esi
40000a72:	74 02                	je     40000a76 <strtol+0xdc>
        *endptr = (char *) s;
40000a74:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000a76:	85 ff                	test   %edi,%edi
40000a78:	74 03                	je     40000a7d <strtol+0xe3>
40000a7a:	f7 1c 24             	negl   (%esp)
}
40000a7d:	8b 04 24             	mov    (%esp),%eax
40000a80:	83 c4 04             	add    $0x4,%esp
40000a83:	5b                   	pop    %ebx
40000a84:	5e                   	pop    %esi
40000a85:	5f                   	pop    %edi
40000a86:	5d                   	pop    %ebp
40000a87:	c3                   	ret    

40000a88 <memset>:

void *memset(void *v, int c, size_t n)
{
40000a88:	57                   	push   %edi
40000a89:	53                   	push   %ebx
40000a8a:	8b 7c 24 0c          	mov    0xc(%esp),%edi
40000a8e:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    if (n == 0)
40000a92:	85 c9                	test   %ecx,%ecx
40000a94:	74 38                	je     40000ace <memset+0x46>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000a96:	f7 c7 03 00 00 00    	test   $0x3,%edi
40000a9c:	75 29                	jne    40000ac7 <memset+0x3f>
40000a9e:	f6 c1 03             	test   $0x3,%cl
40000aa1:	75 24                	jne    40000ac7 <memset+0x3f>
        c &= 0xFF;
40000aa3:	0f b6 54 24 10       	movzbl 0x10(%esp),%edx
        c = (c << 24) | (c << 16) | (c << 8) | c;
40000aa8:	8b 44 24 10          	mov    0x10(%esp),%eax
40000aac:	c1 e0 18             	shl    $0x18,%eax
40000aaf:	89 d3                	mov    %edx,%ebx
40000ab1:	c1 e3 10             	shl    $0x10,%ebx
40000ab4:	09 d8                	or     %ebx,%eax
40000ab6:	89 d3                	mov    %edx,%ebx
40000ab8:	c1 e3 08             	shl    $0x8,%ebx
40000abb:	09 d8                	or     %ebx,%eax
40000abd:	09 d0                	or     %edx,%eax
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000abf:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40000ac2:	fc                   	cld    
40000ac3:	f3 ab                	rep stos %eax,%es:(%edi)
40000ac5:	eb 07                	jmp    40000ace <memset+0x46>
                      : "cc", "memory");
    } else
        asm volatile ("cld; rep stosb\n"
40000ac7:	8b 44 24 10          	mov    0x10(%esp),%eax
40000acb:	fc                   	cld    
40000acc:	f3 aa                	rep stos %al,%es:(%edi)
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000ace:	89 f8                	mov    %edi,%eax
40000ad0:	5b                   	pop    %ebx
40000ad1:	5f                   	pop    %edi
40000ad2:	c3                   	ret    

40000ad3 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000ad3:	57                   	push   %edi
40000ad4:	56                   	push   %esi
40000ad5:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ad9:	8b 74 24 10          	mov    0x10(%esp),%esi
40000add:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000ae1:	39 c6                	cmp    %eax,%esi
40000ae3:	73 36                	jae    40000b1b <memmove+0x48>
40000ae5:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000ae8:	39 c2                	cmp    %eax,%edx
40000aea:	76 2f                	jbe    40000b1b <memmove+0x48>
        s += n;
        d += n;
40000aec:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000aef:	f6 c2 03             	test   $0x3,%dl
40000af2:	75 1b                	jne    40000b0f <memmove+0x3c>
40000af4:	f7 c7 03 00 00 00    	test   $0x3,%edi
40000afa:	75 13                	jne    40000b0f <memmove+0x3c>
40000afc:	f6 c1 03             	test   $0x3,%cl
40000aff:	75 0e                	jne    40000b0f <memmove+0x3c>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40000b01:	83 ef 04             	sub    $0x4,%edi
40000b04:	8d 72 fc             	lea    -0x4(%edx),%esi
40000b07:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40000b0a:	fd                   	std    
40000b0b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000b0d:	eb 09                	jmp    40000b18 <memmove+0x45>
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000b0f:	83 ef 01             	sub    $0x1,%edi
40000b12:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000b15:	fd                   	std    
40000b16:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000b18:	fc                   	cld    
40000b19:	eb 20                	jmp    40000b3b <memmove+0x68>
    } else {
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000b1b:	f7 c6 03 00 00 00    	test   $0x3,%esi
40000b21:	75 13                	jne    40000b36 <memmove+0x63>
40000b23:	a8 03                	test   $0x3,%al
40000b25:	75 0f                	jne    40000b36 <memmove+0x63>
40000b27:	f6 c1 03             	test   $0x3,%cl
40000b2a:	75 0a                	jne    40000b36 <memmove+0x63>
            asm volatile ("cld; rep movsl\n"
                          :: "D" (d), "S" (s), "c" (n / 4)
40000b2c:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40000b2f:	89 c7                	mov    %eax,%edi
40000b31:	fc                   	cld    
40000b32:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000b34:	eb 05                	jmp    40000b3b <memmove+0x68>
                          : "cc", "memory");
        else
            asm volatile ("cld; rep movsb\n"
40000b36:	89 c7                	mov    %eax,%edi
40000b38:	fc                   	cld    
40000b39:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000b3b:	5e                   	pop    %esi
40000b3c:	5f                   	pop    %edi
40000b3d:	c3                   	ret    

40000b3e <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40000b3e:	ff 74 24 0c          	push   0xc(%esp)
40000b42:	ff 74 24 0c          	push   0xc(%esp)
40000b46:	ff 74 24 0c          	push   0xc(%esp)
40000b4a:	e8 84 ff ff ff       	call   40000ad3 <memmove>
40000b4f:	83 c4 0c             	add    $0xc,%esp
}
40000b52:	c3                   	ret    

40000b53 <memcmp>:

int memcmp(const void *v1, const void *v2, size_t n)
{
40000b53:	56                   	push   %esi
40000b54:	53                   	push   %ebx
40000b55:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000b59:	8b 54 24 10          	mov    0x10(%esp),%edx
40000b5d:	8b 44 24 14          	mov    0x14(%esp),%eax
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
40000b61:	eb 08                	jmp    40000b6b <memcmp+0x18>
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40000b63:	83 c1 01             	add    $0x1,%ecx
40000b66:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40000b69:	89 f0                	mov    %esi,%eax
40000b6b:	8d 70 ff             	lea    -0x1(%eax),%esi
40000b6e:	85 c0                	test   %eax,%eax
40000b70:	74 12                	je     40000b84 <memcmp+0x31>
        if (*s1 != *s2)
40000b72:	0f b6 01             	movzbl (%ecx),%eax
40000b75:	0f b6 1a             	movzbl (%edx),%ebx
40000b78:	38 d8                	cmp    %bl,%al
40000b7a:	74 e7                	je     40000b63 <memcmp+0x10>
            return (int) *s1 - (int) *s2;
40000b7c:	0f b6 c0             	movzbl %al,%eax
40000b7f:	0f b6 db             	movzbl %bl,%ebx
40000b82:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40000b84:	5b                   	pop    %ebx
40000b85:	5e                   	pop    %esi
40000b86:	c3                   	ret    

40000b87 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40000b87:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b8b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    const void *ends = (const char *) s + n;
40000b8f:	89 c2                	mov    %eax,%edx
40000b91:	03 54 24 0c          	add    0xc(%esp),%edx
    for (; s < ends; s++)
40000b95:	eb 03                	jmp    40000b9a <memchr+0x13>
40000b97:	83 c0 01             	add    $0x1,%eax
40000b9a:	39 d0                	cmp    %edx,%eax
40000b9c:	73 06                	jae    40000ba4 <memchr+0x1d>
        if (*(const unsigned char *) s == (unsigned char) c)
40000b9e:	38 08                	cmp    %cl,(%eax)
40000ba0:	75 f5                	jne    40000b97 <memchr+0x10>
40000ba2:	eb 05                	jmp    40000ba9 <memchr+0x22>
            return (void *) s;
    return NULL;
40000ba4:	b8 00 00 00 00       	mov    $0x0,%eax
}
40000ba9:	c3                   	ret    

40000baa <memzero>:

void *memzero(void *v, size_t n)
{
    return memset(v, 0, n);
40000baa:	ff 74 24 08          	push   0x8(%esp)
40000bae:	6a 00                	push   $0x0
40000bb0:	ff 74 24 0c          	push   0xc(%esp)
40000bb4:	e8 cf fe ff ff       	call   40000a88 <memset>
40000bb9:	83 c4 0c             	add    $0xc,%esp
}
40000bbc:	c3                   	ret    

40000bbd <main>:
#include <proc.h>
#include <stdio.h>
#include <syscall.h>

int main(int argc, char **argv)
{
40000bbd:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000bc1:	83 e4 f0             	and    $0xfffffff0,%esp
40000bc4:	ff 71 fc             	push   -0x4(%ecx)
40000bc7:	55                   	push   %ebp
40000bc8:	89 e5                	mov    %esp,%ebp
40000bca:	53                   	push   %ebx
40000bcb:	51                   	push   %ecx
40000bcc:	e8 f8 f4 ff ff       	call   400000c9 <__x86.get_pc_thunk.bx>
40000bd1:	81 c3 2f 24 00 00    	add    $0x242f,%ebx
    unsigned int val = 300;
    unsigned int *addr = (unsigned int *) 0xe0000000;

    printf("ding started.\n");
40000bd7:	83 ec 0c             	sub    $0xc,%esp
40000bda:	8d 83 94 e1 ff ff    	lea    -0x1e6c(%ebx),%eax
40000be0:	50                   	push   %eax
40000be1:	e8 06 f6 ff ff       	call   400001ec <printf>
    printf("ding: the value at address %x: %d\n", addr, *addr);
40000be6:	83 c4 0c             	add    $0xc,%esp
40000be9:	ff 35 00 00 00 e0    	push   0xe0000000
40000bef:	68 00 00 00 e0       	push   $0xe0000000
40000bf4:	8d 83 a4 e1 ff ff    	lea    -0x1e5c(%ebx),%eax
40000bfa:	50                   	push   %eax
40000bfb:	e8 ec f5 ff ff       	call   400001ec <printf>
    printf("ding: writing the value %d to the address %x\n", val, addr);
40000c00:	83 c4 0c             	add    $0xc,%esp
40000c03:	68 00 00 00 e0       	push   $0xe0000000
40000c08:	68 2c 01 00 00       	push   $0x12c
40000c0d:	8d 83 c8 e1 ff ff    	lea    -0x1e38(%ebx),%eax
40000c13:	50                   	push   %eax
40000c14:	e8 d3 f5 ff ff       	call   400001ec <printf>
    *addr = val;
40000c19:	c7 05 00 00 00 e0 2c 	movl   $0x12c,0xe0000000
40000c20:	01 00 00 
    yield();
40000c23:	e8 bb fb ff ff       	call   400007e3 <yield>
    printf("ding: the new value at address %x: %d\n", addr, *addr);
40000c28:	83 c4 0c             	add    $0xc,%esp
40000c2b:	ff 35 00 00 00 e0    	push   0xe0000000
40000c31:	68 00 00 00 e0       	push   $0xe0000000
40000c36:	8d 83 f8 e1 ff ff    	lea    -0x1e08(%ebx),%eax
40000c3c:	50                   	push   %eax
40000c3d:	e8 aa f5 ff ff       	call   400001ec <printf>

    return 0;
}
40000c42:	83 c4 10             	add    $0x10,%esp
40000c45:	b8 00 00 00 00       	mov    $0x0,%eax
40000c4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
40000c4d:	59                   	pop    %ecx
40000c4e:	5b                   	pop    %ebx
40000c4f:	5d                   	pop    %ebp
40000c50:	8d 61 fc             	lea    -0x4(%ecx),%esp
40000c53:	c3                   	ret    
40000c54:	66 90                	xchg   %ax,%ax
40000c56:	66 90                	xchg   %ax,%ax
40000c58:	66 90                	xchg   %ax,%ax
40000c5a:	66 90                	xchg   %ax,%ax
40000c5c:	66 90                	xchg   %ax,%ax
40000c5e:	66 90                	xchg   %ax,%ax

40000c60 <__udivdi3>:
40000c60:	f3 0f 1e fb          	endbr32 
40000c64:	55                   	push   %ebp
40000c65:	57                   	push   %edi
40000c66:	56                   	push   %esi
40000c67:	53                   	push   %ebx
40000c68:	83 ec 1c             	sub    $0x1c,%esp
40000c6b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
40000c6f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
40000c73:	8b 74 24 34          	mov    0x34(%esp),%esi
40000c77:	8b 5c 24 38          	mov    0x38(%esp),%ebx
40000c7b:	85 c0                	test   %eax,%eax
40000c7d:	75 19                	jne    40000c98 <__udivdi3+0x38>
40000c7f:	39 f3                	cmp    %esi,%ebx
40000c81:	76 4d                	jbe    40000cd0 <__udivdi3+0x70>
40000c83:	31 ff                	xor    %edi,%edi
40000c85:	89 e8                	mov    %ebp,%eax
40000c87:	89 f2                	mov    %esi,%edx
40000c89:	f7 f3                	div    %ebx
40000c8b:	89 fa                	mov    %edi,%edx
40000c8d:	83 c4 1c             	add    $0x1c,%esp
40000c90:	5b                   	pop    %ebx
40000c91:	5e                   	pop    %esi
40000c92:	5f                   	pop    %edi
40000c93:	5d                   	pop    %ebp
40000c94:	c3                   	ret    
40000c95:	8d 76 00             	lea    0x0(%esi),%esi
40000c98:	39 f0                	cmp    %esi,%eax
40000c9a:	76 14                	jbe    40000cb0 <__udivdi3+0x50>
40000c9c:	31 ff                	xor    %edi,%edi
40000c9e:	31 c0                	xor    %eax,%eax
40000ca0:	89 fa                	mov    %edi,%edx
40000ca2:	83 c4 1c             	add    $0x1c,%esp
40000ca5:	5b                   	pop    %ebx
40000ca6:	5e                   	pop    %esi
40000ca7:	5f                   	pop    %edi
40000ca8:	5d                   	pop    %ebp
40000ca9:	c3                   	ret    
40000caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000cb0:	0f bd f8             	bsr    %eax,%edi
40000cb3:	83 f7 1f             	xor    $0x1f,%edi
40000cb6:	75 48                	jne    40000d00 <__udivdi3+0xa0>
40000cb8:	39 f0                	cmp    %esi,%eax
40000cba:	72 06                	jb     40000cc2 <__udivdi3+0x62>
40000cbc:	31 c0                	xor    %eax,%eax
40000cbe:	39 eb                	cmp    %ebp,%ebx
40000cc0:	77 de                	ja     40000ca0 <__udivdi3+0x40>
40000cc2:	b8 01 00 00 00       	mov    $0x1,%eax
40000cc7:	eb d7                	jmp    40000ca0 <__udivdi3+0x40>
40000cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000cd0:	89 d9                	mov    %ebx,%ecx
40000cd2:	85 db                	test   %ebx,%ebx
40000cd4:	75 0b                	jne    40000ce1 <__udivdi3+0x81>
40000cd6:	b8 01 00 00 00       	mov    $0x1,%eax
40000cdb:	31 d2                	xor    %edx,%edx
40000cdd:	f7 f3                	div    %ebx
40000cdf:	89 c1                	mov    %eax,%ecx
40000ce1:	31 d2                	xor    %edx,%edx
40000ce3:	89 f0                	mov    %esi,%eax
40000ce5:	f7 f1                	div    %ecx
40000ce7:	89 c6                	mov    %eax,%esi
40000ce9:	89 e8                	mov    %ebp,%eax
40000ceb:	89 f7                	mov    %esi,%edi
40000ced:	f7 f1                	div    %ecx
40000cef:	89 fa                	mov    %edi,%edx
40000cf1:	83 c4 1c             	add    $0x1c,%esp
40000cf4:	5b                   	pop    %ebx
40000cf5:	5e                   	pop    %esi
40000cf6:	5f                   	pop    %edi
40000cf7:	5d                   	pop    %ebp
40000cf8:	c3                   	ret    
40000cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000d00:	89 f9                	mov    %edi,%ecx
40000d02:	ba 20 00 00 00       	mov    $0x20,%edx
40000d07:	29 fa                	sub    %edi,%edx
40000d09:	d3 e0                	shl    %cl,%eax
40000d0b:	89 44 24 08          	mov    %eax,0x8(%esp)
40000d0f:	89 d1                	mov    %edx,%ecx
40000d11:	89 d8                	mov    %ebx,%eax
40000d13:	d3 e8                	shr    %cl,%eax
40000d15:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40000d19:	09 c1                	or     %eax,%ecx
40000d1b:	89 f0                	mov    %esi,%eax
40000d1d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40000d21:	89 f9                	mov    %edi,%ecx
40000d23:	d3 e3                	shl    %cl,%ebx
40000d25:	89 d1                	mov    %edx,%ecx
40000d27:	d3 e8                	shr    %cl,%eax
40000d29:	89 f9                	mov    %edi,%ecx
40000d2b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40000d2f:	89 eb                	mov    %ebp,%ebx
40000d31:	d3 e6                	shl    %cl,%esi
40000d33:	89 d1                	mov    %edx,%ecx
40000d35:	d3 eb                	shr    %cl,%ebx
40000d37:	09 f3                	or     %esi,%ebx
40000d39:	89 c6                	mov    %eax,%esi
40000d3b:	89 f2                	mov    %esi,%edx
40000d3d:	89 d8                	mov    %ebx,%eax
40000d3f:	f7 74 24 08          	divl   0x8(%esp)
40000d43:	89 d6                	mov    %edx,%esi
40000d45:	89 c3                	mov    %eax,%ebx
40000d47:	f7 64 24 0c          	mull   0xc(%esp)
40000d4b:	39 d6                	cmp    %edx,%esi
40000d4d:	72 19                	jb     40000d68 <__udivdi3+0x108>
40000d4f:	89 f9                	mov    %edi,%ecx
40000d51:	d3 e5                	shl    %cl,%ebp
40000d53:	39 c5                	cmp    %eax,%ebp
40000d55:	73 04                	jae    40000d5b <__udivdi3+0xfb>
40000d57:	39 d6                	cmp    %edx,%esi
40000d59:	74 0d                	je     40000d68 <__udivdi3+0x108>
40000d5b:	89 d8                	mov    %ebx,%eax
40000d5d:	31 ff                	xor    %edi,%edi
40000d5f:	e9 3c ff ff ff       	jmp    40000ca0 <__udivdi3+0x40>
40000d64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d68:	8d 43 ff             	lea    -0x1(%ebx),%eax
40000d6b:	31 ff                	xor    %edi,%edi
40000d6d:	e9 2e ff ff ff       	jmp    40000ca0 <__udivdi3+0x40>
40000d72:	66 90                	xchg   %ax,%ax
40000d74:	66 90                	xchg   %ax,%ax
40000d76:	66 90                	xchg   %ax,%ax
40000d78:	66 90                	xchg   %ax,%ax
40000d7a:	66 90                	xchg   %ax,%ax
40000d7c:	66 90                	xchg   %ax,%ax
40000d7e:	66 90                	xchg   %ax,%ax

40000d80 <__umoddi3>:
40000d80:	f3 0f 1e fb          	endbr32 
40000d84:	55                   	push   %ebp
40000d85:	57                   	push   %edi
40000d86:	56                   	push   %esi
40000d87:	53                   	push   %ebx
40000d88:	83 ec 1c             	sub    $0x1c,%esp
40000d8b:	8b 74 24 30          	mov    0x30(%esp),%esi
40000d8f:	8b 5c 24 34          	mov    0x34(%esp),%ebx
40000d93:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
40000d97:	8b 6c 24 38          	mov    0x38(%esp),%ebp
40000d9b:	89 f0                	mov    %esi,%eax
40000d9d:	89 da                	mov    %ebx,%edx
40000d9f:	85 ff                	test   %edi,%edi
40000da1:	75 15                	jne    40000db8 <__umoddi3+0x38>
40000da3:	39 dd                	cmp    %ebx,%ebp
40000da5:	76 39                	jbe    40000de0 <__umoddi3+0x60>
40000da7:	f7 f5                	div    %ebp
40000da9:	89 d0                	mov    %edx,%eax
40000dab:	31 d2                	xor    %edx,%edx
40000dad:	83 c4 1c             	add    $0x1c,%esp
40000db0:	5b                   	pop    %ebx
40000db1:	5e                   	pop    %esi
40000db2:	5f                   	pop    %edi
40000db3:	5d                   	pop    %ebp
40000db4:	c3                   	ret    
40000db5:	8d 76 00             	lea    0x0(%esi),%esi
40000db8:	39 df                	cmp    %ebx,%edi
40000dba:	77 f1                	ja     40000dad <__umoddi3+0x2d>
40000dbc:	0f bd cf             	bsr    %edi,%ecx
40000dbf:	83 f1 1f             	xor    $0x1f,%ecx
40000dc2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40000dc6:	75 40                	jne    40000e08 <__umoddi3+0x88>
40000dc8:	39 df                	cmp    %ebx,%edi
40000dca:	72 04                	jb     40000dd0 <__umoddi3+0x50>
40000dcc:	39 f5                	cmp    %esi,%ebp
40000dce:	77 dd                	ja     40000dad <__umoddi3+0x2d>
40000dd0:	89 da                	mov    %ebx,%edx
40000dd2:	89 f0                	mov    %esi,%eax
40000dd4:	29 e8                	sub    %ebp,%eax
40000dd6:	19 fa                	sbb    %edi,%edx
40000dd8:	eb d3                	jmp    40000dad <__umoddi3+0x2d>
40000dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000de0:	89 e9                	mov    %ebp,%ecx
40000de2:	85 ed                	test   %ebp,%ebp
40000de4:	75 0b                	jne    40000df1 <__umoddi3+0x71>
40000de6:	b8 01 00 00 00       	mov    $0x1,%eax
40000deb:	31 d2                	xor    %edx,%edx
40000ded:	f7 f5                	div    %ebp
40000def:	89 c1                	mov    %eax,%ecx
40000df1:	89 d8                	mov    %ebx,%eax
40000df3:	31 d2                	xor    %edx,%edx
40000df5:	f7 f1                	div    %ecx
40000df7:	89 f0                	mov    %esi,%eax
40000df9:	f7 f1                	div    %ecx
40000dfb:	89 d0                	mov    %edx,%eax
40000dfd:	31 d2                	xor    %edx,%edx
40000dff:	eb ac                	jmp    40000dad <__umoddi3+0x2d>
40000e01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000e08:	8b 44 24 04          	mov    0x4(%esp),%eax
40000e0c:	ba 20 00 00 00       	mov    $0x20,%edx
40000e11:	29 c2                	sub    %eax,%edx
40000e13:	89 c1                	mov    %eax,%ecx
40000e15:	89 e8                	mov    %ebp,%eax
40000e17:	d3 e7                	shl    %cl,%edi
40000e19:	89 d1                	mov    %edx,%ecx
40000e1b:	89 54 24 0c          	mov    %edx,0xc(%esp)
40000e1f:	d3 e8                	shr    %cl,%eax
40000e21:	89 c1                	mov    %eax,%ecx
40000e23:	8b 44 24 04          	mov    0x4(%esp),%eax
40000e27:	09 f9                	or     %edi,%ecx
40000e29:	89 df                	mov    %ebx,%edi
40000e2b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40000e2f:	89 c1                	mov    %eax,%ecx
40000e31:	d3 e5                	shl    %cl,%ebp
40000e33:	89 d1                	mov    %edx,%ecx
40000e35:	d3 ef                	shr    %cl,%edi
40000e37:	89 c1                	mov    %eax,%ecx
40000e39:	89 f0                	mov    %esi,%eax
40000e3b:	d3 e3                	shl    %cl,%ebx
40000e3d:	89 d1                	mov    %edx,%ecx
40000e3f:	89 fa                	mov    %edi,%edx
40000e41:	d3 e8                	shr    %cl,%eax
40000e43:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
40000e48:	09 d8                	or     %ebx,%eax
40000e4a:	f7 74 24 08          	divl   0x8(%esp)
40000e4e:	89 d3                	mov    %edx,%ebx
40000e50:	d3 e6                	shl    %cl,%esi
40000e52:	f7 e5                	mul    %ebp
40000e54:	89 c7                	mov    %eax,%edi
40000e56:	89 d1                	mov    %edx,%ecx
40000e58:	39 d3                	cmp    %edx,%ebx
40000e5a:	72 06                	jb     40000e62 <__umoddi3+0xe2>
40000e5c:	75 0e                	jne    40000e6c <__umoddi3+0xec>
40000e5e:	39 c6                	cmp    %eax,%esi
40000e60:	73 0a                	jae    40000e6c <__umoddi3+0xec>
40000e62:	29 e8                	sub    %ebp,%eax
40000e64:	1b 54 24 08          	sbb    0x8(%esp),%edx
40000e68:	89 d1                	mov    %edx,%ecx
40000e6a:	89 c7                	mov    %eax,%edi
40000e6c:	89 f5                	mov    %esi,%ebp
40000e6e:	8b 74 24 04          	mov    0x4(%esp),%esi
40000e72:	29 fd                	sub    %edi,%ebp
40000e74:	19 cb                	sbb    %ecx,%ebx
40000e76:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
40000e7b:	89 d8                	mov    %ebx,%eax
40000e7d:	d3 e0                	shl    %cl,%eax
40000e7f:	89 f1                	mov    %esi,%ecx
40000e81:	d3 ed                	shr    %cl,%ebp
40000e83:	d3 eb                	shr    %cl,%ebx
40000e85:	09 e8                	or     %ebp,%eax
40000e87:	89 da                	mov    %ebx,%edx
40000e89:	83 c4 1c             	add    $0x1c,%esp
40000e8c:	5b                   	pop    %ebx
40000e8d:	5e                   	pop    %esi
40000e8e:	5f                   	pop    %edi
40000e8f:	5d                   	pop    %ebp
40000e90:	c3                   	ret    
