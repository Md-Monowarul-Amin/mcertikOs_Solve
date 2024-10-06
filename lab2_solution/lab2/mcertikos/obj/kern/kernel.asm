
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	e8 b1 03 00 00       	call   1003bd <__x86.get_pc_thunk.bx>
  10000c:	81 c3 f4 8f 00 00    	add    $0x8ff4,%ebx
  100012:	c7 45 f4 00 80 0b 00 	movl   $0xb8000,-0xc(%ebp)
  100019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10001c:	0f b7 00             	movzwl (%eax),%eax
  10001f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100023:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100026:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
  10002b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10002e:	0f b7 00             	movzwl (%eax),%eax
  100031:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100035:	74 2c                	je     100063 <video_init+0x63>
  100037:	c7 45 f4 00 00 0b 00 	movl   $0xb0000,-0xc(%ebp)
  10003e:	c7 83 00 70 00 00 b4 	movl   $0x3b4,0x7000(%ebx)
  100045:	03 00 00 
  100048:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  10004e:	83 ec 08             	sub    $0x8,%esp
  100051:	50                   	push   %eax
  100052:	8d 83 00 d0 ff ff    	lea    -0x3000(%ebx),%eax
  100058:	50                   	push   %eax
  100059:	e8 fe 2c 00 00       	call   102d5c <dprintf>
  10005e:	83 c4 10             	add    $0x10,%esp
  100061:	eb 2d                	jmp    100090 <video_init+0x90>
  100063:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100066:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10006a:	66 89 10             	mov    %dx,(%eax)
  10006d:	c7 83 00 70 00 00 d4 	movl   $0x3d4,0x7000(%ebx)
  100074:	03 00 00 
  100077:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  10007d:	83 ec 08             	sub    $0x8,%esp
  100080:	50                   	push   %eax
  100081:	8d 83 00 d0 ff ff    	lea    -0x3000(%ebx),%eax
  100087:	50                   	push   %eax
  100088:	e8 cf 2c 00 00       	call   102d5c <dprintf>
  10008d:	83 c4 10             	add    $0x10,%esp
  100090:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  100096:	83 ec 08             	sub    $0x8,%esp
  100099:	6a 0e                	push   $0xe
  10009b:	50                   	push   %eax
  10009c:	e8 5b 3a 00 00       	call   103afc <outb>
  1000a1:	83 c4 10             	add    $0x10,%esp
  1000a4:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  1000aa:	83 c0 01             	add    $0x1,%eax
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	50                   	push   %eax
  1000b1:	e8 f7 39 00 00       	call   103aad <inb>
  1000b6:	83 c4 10             	add    $0x10,%esp
  1000b9:	0f b6 c0             	movzbl %al,%eax
  1000bc:	c1 e0 08             	shl    $0x8,%eax
  1000bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1000c2:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  1000c8:	83 ec 08             	sub    $0x8,%esp
  1000cb:	6a 0f                	push   $0xf
  1000cd:	50                   	push   %eax
  1000ce:	e8 29 3a 00 00       	call   103afc <outb>
  1000d3:	83 c4 10             	add    $0x10,%esp
  1000d6:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  1000dc:	83 c0 01             	add    $0x1,%eax
  1000df:	83 ec 0c             	sub    $0xc,%esp
  1000e2:	50                   	push   %eax
  1000e3:	e8 c5 39 00 00       	call   103aad <inb>
  1000e8:	83 c4 10             	add    $0x10,%esp
  1000eb:	0f b6 c0             	movzbl %al,%eax
  1000ee:	09 45 ec             	or     %eax,-0x14(%ebp)
  1000f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1000f4:	89 83 04 70 00 00    	mov    %eax,0x7004(%ebx)
  1000fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1000fd:	66 89 83 08 70 00 00 	mov    %ax,0x7008(%ebx)
  100104:	c7 83 0c 70 00 00 00 	movl   $0x0,0x700c(%ebx)
  10010b:	00 00 00 
  10010e:	90                   	nop
  10010f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <video_putc>:
  100114:	55                   	push   %ebp
  100115:	89 e5                	mov    %esp,%ebp
  100117:	56                   	push   %esi
  100118:	53                   	push   %ebx
  100119:	83 ec 10             	sub    $0x10,%esp
  10011c:	e8 9c 02 00 00       	call   1003bd <__x86.get_pc_thunk.bx>
  100121:	81 c3 df 8e 00 00    	add    $0x8edf,%ebx
  100127:	8b 45 08             	mov    0x8(%ebp),%eax
  10012a:	b0 00                	mov    $0x0,%al
  10012c:	85 c0                	test   %eax,%eax
  10012e:	75 07                	jne    100137 <video_putc+0x23>
  100130:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
  100137:	8b 45 08             	mov    0x8(%ebp),%eax
  10013a:	0f b6 c0             	movzbl %al,%eax
  10013d:	83 f8 0d             	cmp    $0xd,%eax
  100140:	0f 84 82 00 00 00    	je     1001c8 <video_putc+0xb4>
  100146:	83 f8 0d             	cmp    $0xd,%eax
  100149:	0f 8f f7 00 00 00    	jg     100246 <video_putc+0x132>
  10014f:	83 f8 0a             	cmp    $0xa,%eax
  100152:	74 63                	je     1001b7 <video_putc+0xa3>
  100154:	83 f8 0a             	cmp    $0xa,%eax
  100157:	0f 8f e9 00 00 00    	jg     100246 <video_putc+0x132>
  10015d:	83 f8 08             	cmp    $0x8,%eax
  100160:	74 0e                	je     100170 <video_putc+0x5c>
  100162:	83 f8 09             	cmp    $0x9,%eax
  100165:	0f 84 98 00 00 00    	je     100203 <video_putc+0xef>
  10016b:	e9 d6 00 00 00       	jmp    100246 <video_putc+0x132>
  100170:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  100177:	66 85 c0             	test   %ax,%ax
  10017a:	0f 84 ec 00 00 00    	je     10026c <video_putc+0x158>
  100180:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  100187:	83 e8 01             	sub    $0x1,%eax
  10018a:	66 89 83 08 70 00 00 	mov    %ax,0x7008(%ebx)
  100191:	8b 45 08             	mov    0x8(%ebp),%eax
  100194:	b0 00                	mov    $0x0,%al
  100196:	83 c8 20             	or     $0x20,%eax
  100199:	89 c2                	mov    %eax,%edx
  10019b:	8b 8b 04 70 00 00    	mov    0x7004(%ebx),%ecx
  1001a1:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  1001a8:	0f b7 c0             	movzwl %ax,%eax
  1001ab:	01 c0                	add    %eax,%eax
  1001ad:	01 c8                	add    %ecx,%eax
  1001af:	66 89 10             	mov    %dx,(%eax)
  1001b2:	e9 b5 00 00 00       	jmp    10026c <video_putc+0x158>
  1001b7:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  1001be:	83 c0 50             	add    $0x50,%eax
  1001c1:	66 89 83 08 70 00 00 	mov    %ax,0x7008(%ebx)
  1001c8:	0f b7 b3 08 70 00 00 	movzwl 0x7008(%ebx),%esi
  1001cf:	0f b7 8b 08 70 00 00 	movzwl 0x7008(%ebx),%ecx
  1001d6:	0f b7 c1             	movzwl %cx,%eax
  1001d9:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1001df:	c1 e8 10             	shr    $0x10,%eax
  1001e2:	89 c2                	mov    %eax,%edx
  1001e4:	66 c1 ea 06          	shr    $0x6,%dx
  1001e8:	89 d0                	mov    %edx,%eax
  1001ea:	c1 e0 02             	shl    $0x2,%eax
  1001ed:	01 d0                	add    %edx,%eax
  1001ef:	c1 e0 04             	shl    $0x4,%eax
  1001f2:	29 c1                	sub    %eax,%ecx
  1001f4:	89 ca                	mov    %ecx,%edx
  1001f6:	89 f0                	mov    %esi,%eax
  1001f8:	29 d0                	sub    %edx,%eax
  1001fa:	66 89 83 08 70 00 00 	mov    %ax,0x7008(%ebx)
  100201:	eb 6a                	jmp    10026d <video_putc+0x159>
  100203:	83 ec 0c             	sub    $0xc,%esp
  100206:	6a 20                	push   $0x20
  100208:	e8 07 ff ff ff       	call   100114 <video_putc>
  10020d:	83 c4 10             	add    $0x10,%esp
  100210:	83 ec 0c             	sub    $0xc,%esp
  100213:	6a 20                	push   $0x20
  100215:	e8 fa fe ff ff       	call   100114 <video_putc>
  10021a:	83 c4 10             	add    $0x10,%esp
  10021d:	83 ec 0c             	sub    $0xc,%esp
  100220:	6a 20                	push   $0x20
  100222:	e8 ed fe ff ff       	call   100114 <video_putc>
  100227:	83 c4 10             	add    $0x10,%esp
  10022a:	83 ec 0c             	sub    $0xc,%esp
  10022d:	6a 20                	push   $0x20
  10022f:	e8 e0 fe ff ff       	call   100114 <video_putc>
  100234:	83 c4 10             	add    $0x10,%esp
  100237:	83 ec 0c             	sub    $0xc,%esp
  10023a:	6a 20                	push   $0x20
  10023c:	e8 d3 fe ff ff       	call   100114 <video_putc>
  100241:	83 c4 10             	add    $0x10,%esp
  100244:	eb 27                	jmp    10026d <video_putc+0x159>
  100246:	8b 8b 04 70 00 00    	mov    0x7004(%ebx),%ecx
  10024c:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  100253:	8d 50 01             	lea    0x1(%eax),%edx
  100256:	66 89 93 08 70 00 00 	mov    %dx,0x7008(%ebx)
  10025d:	0f b7 c0             	movzwl %ax,%eax
  100260:	01 c0                	add    %eax,%eax
  100262:	01 c8                	add    %ecx,%eax
  100264:	8b 55 08             	mov    0x8(%ebp),%edx
  100267:	66 89 10             	mov    %dx,(%eax)
  10026a:	eb 01                	jmp    10026d <video_putc+0x159>
  10026c:	90                   	nop
  10026d:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  100274:	66 3d cf 07          	cmp    $0x7cf,%ax
  100278:	76 5d                	jbe    1002d7 <video_putc+0x1c3>
  10027a:	8b 83 04 70 00 00    	mov    0x7004(%ebx),%eax
  100280:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100286:	8b 83 04 70 00 00    	mov    0x7004(%ebx),%eax
  10028c:	83 ec 04             	sub    $0x4,%esp
  10028f:	68 00 0f 00 00       	push   $0xf00
  100294:	52                   	push   %edx
  100295:	50                   	push   %eax
  100296:	e8 7a 25 00 00       	call   102815 <memmove>
  10029b:	83 c4 10             	add    $0x10,%esp
  10029e:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1002a5:	eb 16                	jmp    1002bd <video_putc+0x1a9>
  1002a7:	8b 93 04 70 00 00    	mov    0x7004(%ebx),%edx
  1002ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002b0:	01 c0                	add    %eax,%eax
  1002b2:	01 d0                	add    %edx,%eax
  1002b4:	66 c7 00 20 07       	movw   $0x720,(%eax)
  1002b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1002bd:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1002c4:	7e e1                	jle    1002a7 <video_putc+0x193>
  1002c6:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  1002cd:	83 e8 50             	sub    $0x50,%eax
  1002d0:	66 89 83 08 70 00 00 	mov    %ax,0x7008(%ebx)
  1002d7:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  1002dd:	83 ec 08             	sub    $0x8,%esp
  1002e0:	6a 0e                	push   $0xe
  1002e2:	50                   	push   %eax
  1002e3:	e8 14 38 00 00       	call   103afc <outb>
  1002e8:	83 c4 10             	add    $0x10,%esp
  1002eb:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  1002f2:	66 c1 e8 08          	shr    $0x8,%ax
  1002f6:	0f b6 c0             	movzbl %al,%eax
  1002f9:	8b 93 00 70 00 00    	mov    0x7000(%ebx),%edx
  1002ff:	83 c2 01             	add    $0x1,%edx
  100302:	83 ec 08             	sub    $0x8,%esp
  100305:	50                   	push   %eax
  100306:	52                   	push   %edx
  100307:	e8 f0 37 00 00       	call   103afc <outb>
  10030c:	83 c4 10             	add    $0x10,%esp
  10030f:	8b 83 00 70 00 00    	mov    0x7000(%ebx),%eax
  100315:	83 ec 08             	sub    $0x8,%esp
  100318:	6a 0f                	push   $0xf
  10031a:	50                   	push   %eax
  10031b:	e8 dc 37 00 00       	call   103afc <outb>
  100320:	83 c4 10             	add    $0x10,%esp
  100323:	0f b7 83 08 70 00 00 	movzwl 0x7008(%ebx),%eax
  10032a:	0f b6 c0             	movzbl %al,%eax
  10032d:	8b 93 00 70 00 00    	mov    0x7000(%ebx),%edx
  100333:	83 c2 01             	add    $0x1,%edx
  100336:	83 ec 08             	sub    $0x8,%esp
  100339:	50                   	push   %eax
  10033a:	52                   	push   %edx
  10033b:	e8 bc 37 00 00       	call   103afc <outb>
  100340:	83 c4 10             	add    $0x10,%esp
  100343:	90                   	nop
  100344:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100347:	5b                   	pop    %ebx
  100348:	5e                   	pop    %esi
  100349:	5d                   	pop    %ebp
  10034a:	c3                   	ret    

0010034b <video_set_cursor>:
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	e8 66 00 00 00       	call   1003b9 <__x86.get_pc_thunk.dx>
  100353:	81 c2 ad 8c 00 00    	add    $0x8cad,%edx
  100359:	8b 45 08             	mov    0x8(%ebp),%eax
  10035c:	89 c1                	mov    %eax,%ecx
  10035e:	89 c8                	mov    %ecx,%eax
  100360:	c1 e0 02             	shl    $0x2,%eax
  100363:	01 c8                	add    %ecx,%eax
  100365:	c1 e0 04             	shl    $0x4,%eax
  100368:	89 c1                	mov    %eax,%ecx
  10036a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10036d:	01 c8                	add    %ecx,%eax
  10036f:	66 89 82 08 70 00 00 	mov    %ax,0x7008(%edx)
  100376:	90                   	nop
  100377:	5d                   	pop    %ebp
  100378:	c3                   	ret    

00100379 <video_clear_screen>:
  100379:	55                   	push   %ebp
  10037a:	89 e5                	mov    %esp,%ebp
  10037c:	83 ec 10             	sub    $0x10,%esp
  10037f:	e8 31 00 00 00       	call   1003b5 <__x86.get_pc_thunk.ax>
  100384:	05 7c 8c 00 00       	add    $0x8c7c,%eax
  100389:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100390:	eb 16                	jmp    1003a8 <video_clear_screen+0x2f>
  100392:	8b 88 04 70 00 00    	mov    0x7004(%eax),%ecx
  100398:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10039b:	01 d2                	add    %edx,%edx
  10039d:	01 ca                	add    %ecx,%edx
  10039f:	66 c7 02 20 00       	movw   $0x20,(%edx)
  1003a4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1003a8:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%ebp)
  1003af:	7e e1                	jle    100392 <video_clear_screen+0x19>
  1003b1:	90                   	nop
  1003b2:	90                   	nop
  1003b3:	c9                   	leave  
  1003b4:	c3                   	ret    

001003b5 <__x86.get_pc_thunk.ax>:
  1003b5:	8b 04 24             	mov    (%esp),%eax
  1003b8:	c3                   	ret    

001003b9 <__x86.get_pc_thunk.dx>:
  1003b9:	8b 14 24             	mov    (%esp),%edx
  1003bc:	c3                   	ret    

001003bd <__x86.get_pc_thunk.bx>:
  1003bd:	8b 1c 24             	mov    (%esp),%ebx
  1003c0:	c3                   	ret    

001003c1 <cons_init>:
  1003c1:	55                   	push   %ebp
  1003c2:	89 e5                	mov    %esp,%ebp
  1003c4:	53                   	push   %ebx
  1003c5:	83 ec 04             	sub    $0x4,%esp
  1003c8:	e8 f0 ff ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1003cd:	81 c3 33 8c 00 00    	add    $0x8c33,%ebx
  1003d3:	83 ec 04             	sub    $0x4,%esp
  1003d6:	68 08 02 00 00       	push   $0x208
  1003db:	6a 00                	push   $0x0
  1003dd:	8d 83 20 70 00 00    	lea    0x7020(%ebx),%eax
  1003e3:	50                   	push   %eax
  1003e4:	e8 b2 23 00 00       	call   10279b <memset>
  1003e9:	83 c4 10             	add    $0x10,%esp
  1003ec:	e8 2e 04 00 00       	call   10081f <serial_init>
  1003f1:	e8 0a fc ff ff       	call   100000 <video_init>
  1003f6:	90                   	nop
  1003f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1003fa:	c9                   	leave  
  1003fb:	c3                   	ret    

001003fc <cons_intr>:
  1003fc:	55                   	push   %ebp
  1003fd:	89 e5                	mov    %esp,%ebp
  1003ff:	53                   	push   %ebx
  100400:	83 ec 14             	sub    $0x14,%esp
  100403:	e8 b5 ff ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100408:	81 c3 f8 8b 00 00    	add    $0x8bf8,%ebx
  10040e:	eb 38                	jmp    100448 <cons_intr+0x4c>
  100410:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100414:	75 02                	jne    100418 <cons_intr+0x1c>
  100416:	eb 30                	jmp    100448 <cons_intr+0x4c>
  100418:	8b 83 24 72 00 00    	mov    0x7224(%ebx),%eax
  10041e:	8d 50 01             	lea    0x1(%eax),%edx
  100421:	89 93 24 72 00 00    	mov    %edx,0x7224(%ebx)
  100427:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10042a:	88 94 03 20 70 00 00 	mov    %dl,0x7020(%ebx,%eax,1)
  100431:	8b 83 24 72 00 00    	mov    0x7224(%ebx),%eax
  100437:	3d 00 02 00 00       	cmp    $0x200,%eax
  10043c:	75 0a                	jne    100448 <cons_intr+0x4c>
  10043e:	c7 83 24 72 00 00 00 	movl   $0x0,0x7224(%ebx)
  100445:	00 00 00 
  100448:	8b 45 08             	mov    0x8(%ebp),%eax
  10044b:	ff d0                	call   *%eax
  10044d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100450:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  100454:	75 ba                	jne    100410 <cons_intr+0x14>
  100456:	90                   	nop
  100457:	90                   	nop
  100458:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10045b:	c9                   	leave  
  10045c:	c3                   	ret    

0010045d <cons_getc>:
  10045d:	55                   	push   %ebp
  10045e:	89 e5                	mov    %esp,%ebp
  100460:	53                   	push   %ebx
  100461:	83 ec 14             	sub    $0x14,%esp
  100464:	e8 54 ff ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100469:	81 c3 97 8b 00 00    	add    $0x8b97,%ebx
  10046f:	e8 81 02 00 00       	call   1006f5 <serial_intr>
  100474:	e8 59 06 00 00       	call   100ad2 <keyboard_intr>
  100479:	8b 93 20 72 00 00    	mov    0x7220(%ebx),%edx
  10047f:	8b 83 24 72 00 00    	mov    0x7224(%ebx),%eax
  100485:	39 c2                	cmp    %eax,%edx
  100487:	74 39                	je     1004c2 <cons_getc+0x65>
  100489:	8b 83 20 72 00 00    	mov    0x7220(%ebx),%eax
  10048f:	8d 50 01             	lea    0x1(%eax),%edx
  100492:	89 93 20 72 00 00    	mov    %edx,0x7220(%ebx)
  100498:	0f b6 84 03 20 70 00 	movzbl 0x7020(%ebx,%eax,1),%eax
  10049f:	00 
  1004a0:	0f be c0             	movsbl %al,%eax
  1004a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1004a6:	8b 83 20 72 00 00    	mov    0x7220(%ebx),%eax
  1004ac:	3d 00 02 00 00       	cmp    $0x200,%eax
  1004b1:	75 0a                	jne    1004bd <cons_getc+0x60>
  1004b3:	c7 83 20 72 00 00 00 	movl   $0x0,0x7220(%ebx)
  1004ba:	00 00 00 
  1004bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004c0:	eb 05                	jmp    1004c7 <cons_getc+0x6a>
  1004c2:	b8 00 00 00 00       	mov    $0x0,%eax
  1004c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004ca:	c9                   	leave  
  1004cb:	c3                   	ret    

001004cc <cons_putc>:
  1004cc:	55                   	push   %ebp
  1004cd:	89 e5                	mov    %esp,%ebp
  1004cf:	53                   	push   %ebx
  1004d0:	83 ec 14             	sub    $0x14,%esp
  1004d3:	e8 e5 fe ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1004d8:	81 c3 28 8b 00 00    	add    $0x8b28,%ebx
  1004de:	8b 45 08             	mov    0x8(%ebp),%eax
  1004e1:	88 45 f4             	mov    %al,-0xc(%ebp)
  1004e4:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  1004e8:	83 ec 0c             	sub    $0xc,%esp
  1004eb:	50                   	push   %eax
  1004ec:	e8 9d 02 00 00       	call   10078e <serial_putc>
  1004f1:	83 c4 10             	add    $0x10,%esp
  1004f4:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  1004f8:	83 ec 0c             	sub    $0xc,%esp
  1004fb:	50                   	push   %eax
  1004fc:	e8 13 fc ff ff       	call   100114 <video_putc>
  100501:	83 c4 10             	add    $0x10,%esp
  100504:	90                   	nop
  100505:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100508:	c9                   	leave  
  100509:	c3                   	ret    

0010050a <getchar>:
  10050a:	55                   	push   %ebp
  10050b:	89 e5                	mov    %esp,%ebp
  10050d:	83 ec 18             	sub    $0x18,%esp
  100510:	e8 a0 fe ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  100515:	05 eb 8a 00 00       	add    $0x8aeb,%eax
  10051a:	90                   	nop
  10051b:	e8 3d ff ff ff       	call   10045d <cons_getc>
  100520:	88 45 f7             	mov    %al,-0x9(%ebp)
  100523:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100527:	74 f2                	je     10051b <getchar+0x11>
  100529:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10052d:	c9                   	leave  
  10052e:	c3                   	ret    

0010052f <putchar>:
  10052f:	55                   	push   %ebp
  100530:	89 e5                	mov    %esp,%ebp
  100532:	83 ec 18             	sub    $0x18,%esp
  100535:	e8 7b fe ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  10053a:	05 c6 8a 00 00       	add    $0x8ac6,%eax
  10053f:	8b 45 08             	mov    0x8(%ebp),%eax
  100542:	88 45 f4             	mov    %al,-0xc(%ebp)
  100545:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  100549:	83 ec 0c             	sub    $0xc,%esp
  10054c:	50                   	push   %eax
  10054d:	e8 7a ff ff ff       	call   1004cc <cons_putc>
  100552:	83 c4 10             	add    $0x10,%esp
  100555:	90                   	nop
  100556:	c9                   	leave  
  100557:	c3                   	ret    

00100558 <readline>:
  100558:	55                   	push   %ebp
  100559:	89 e5                	mov    %esp,%ebp
  10055b:	53                   	push   %ebx
  10055c:	83 ec 14             	sub    $0x14,%esp
  10055f:	e8 59 fe ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100564:	81 c3 9c 8a 00 00    	add    $0x8a9c,%ebx
  10056a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10056e:	74 15                	je     100585 <readline+0x2d>
  100570:	83 ec 08             	sub    $0x8,%esp
  100573:	ff 75 08             	push   0x8(%ebp)
  100576:	8d 83 0e d0 ff ff    	lea    -0x2ff2(%ebx),%eax
  10057c:	50                   	push   %eax
  10057d:	e8 da 27 00 00       	call   102d5c <dprintf>
  100582:	83 c4 10             	add    $0x10,%esp
  100585:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10058c:	e8 79 ff ff ff       	call   10050a <getchar>
  100591:	88 45 f3             	mov    %al,-0xd(%ebp)
  100594:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  100598:	79 21                	jns    1005bb <readline+0x63>
  10059a:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  10059e:	83 ec 08             	sub    $0x8,%esp
  1005a1:	50                   	push   %eax
  1005a2:	8d 83 11 d0 ff ff    	lea    -0x2fef(%ebx),%eax
  1005a8:	50                   	push   %eax
  1005a9:	e8 ae 27 00 00       	call   102d5c <dprintf>
  1005ae:	83 c4 10             	add    $0x10,%esp
  1005b1:	b8 00 00 00 00       	mov    $0x0,%eax
  1005b6:	e9 92 00 00 00       	jmp    10064d <readline+0xf5>
  1005bb:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
  1005bf:	74 06                	je     1005c7 <readline+0x6f>
  1005c1:	80 7d f3 7f          	cmpb   $0x7f,-0xd(%ebp)
  1005c5:	75 19                	jne    1005e0 <readline+0x88>
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	7e 13                	jle    1005e0 <readline+0x88>
  1005cd:	83 ec 0c             	sub    $0xc,%esp
  1005d0:	6a 08                	push   $0x8
  1005d2:	e8 58 ff ff ff       	call   10052f <putchar>
  1005d7:	83 c4 10             	add    $0x10,%esp
  1005da:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1005de:	eb 68                	jmp    100648 <readline+0xf0>
  1005e0:	80 7d f3 1f          	cmpb   $0x1f,-0xd(%ebp)
  1005e4:	7e 2f                	jle    100615 <readline+0xbd>
  1005e6:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  1005ed:	7f 26                	jg     100615 <readline+0xbd>
  1005ef:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  1005f3:	83 ec 0c             	sub    $0xc,%esp
  1005f6:	50                   	push   %eax
  1005f7:	e8 33 ff ff ff       	call   10052f <putchar>
  1005fc:	83 c4 10             	add    $0x10,%esp
  1005ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100602:	8d 50 01             	lea    0x1(%eax),%edx
  100605:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100608:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  10060c:	88 94 03 40 72 00 00 	mov    %dl,0x7240(%ebx,%eax,1)
  100613:	eb 33                	jmp    100648 <readline+0xf0>
  100615:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
  100619:	74 0a                	je     100625 <readline+0xcd>
  10061b:	80 7d f3 0d          	cmpb   $0xd,-0xd(%ebp)
  10061f:	0f 85 67 ff ff ff    	jne    10058c <readline+0x34>
  100625:	83 ec 0c             	sub    $0xc,%esp
  100628:	6a 0a                	push   $0xa
  10062a:	e8 00 ff ff ff       	call   10052f <putchar>
  10062f:	83 c4 10             	add    $0x10,%esp
  100632:	8d 93 40 72 00 00    	lea    0x7240(%ebx),%edx
  100638:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10063b:	01 d0                	add    %edx,%eax
  10063d:	c6 00 00             	movb   $0x0,(%eax)
  100640:	8d 83 40 72 00 00    	lea    0x7240(%ebx),%eax
  100646:	eb 05                	jmp    10064d <readline+0xf5>
  100648:	e9 3f ff ff ff       	jmp    10058c <readline+0x34>
  10064d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100650:	c9                   	leave  
  100651:	c3                   	ret    

00100652 <delay>:
  100652:	55                   	push   %ebp
  100653:	89 e5                	mov    %esp,%ebp
  100655:	53                   	push   %ebx
  100656:	83 ec 04             	sub    $0x4,%esp
  100659:	e8 5f fd ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  10065e:	81 c3 a2 89 00 00    	add    $0x89a2,%ebx
  100664:	83 ec 0c             	sub    $0xc,%esp
  100667:	68 84 00 00 00       	push   $0x84
  10066c:	e8 3c 34 00 00       	call   103aad <inb>
  100671:	83 c4 10             	add    $0x10,%esp
  100674:	83 ec 0c             	sub    $0xc,%esp
  100677:	68 84 00 00 00       	push   $0x84
  10067c:	e8 2c 34 00 00       	call   103aad <inb>
  100681:	83 c4 10             	add    $0x10,%esp
  100684:	83 ec 0c             	sub    $0xc,%esp
  100687:	68 84 00 00 00       	push   $0x84
  10068c:	e8 1c 34 00 00       	call   103aad <inb>
  100691:	83 c4 10             	add    $0x10,%esp
  100694:	83 ec 0c             	sub    $0xc,%esp
  100697:	68 84 00 00 00       	push   $0x84
  10069c:	e8 0c 34 00 00       	call   103aad <inb>
  1006a1:	83 c4 10             	add    $0x10,%esp
  1006a4:	90                   	nop
  1006a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006a8:	c9                   	leave  
  1006a9:	c3                   	ret    

001006aa <serial_proc_data>:
  1006aa:	55                   	push   %ebp
  1006ab:	89 e5                	mov    %esp,%ebp
  1006ad:	53                   	push   %ebx
  1006ae:	83 ec 04             	sub    $0x4,%esp
  1006b1:	e8 07 fd ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1006b6:	81 c3 4a 89 00 00    	add    $0x894a,%ebx
  1006bc:	83 ec 0c             	sub    $0xc,%esp
  1006bf:	68 fd 03 00 00       	push   $0x3fd
  1006c4:	e8 e4 33 00 00       	call   103aad <inb>
  1006c9:	83 c4 10             	add    $0x10,%esp
  1006cc:	0f b6 c0             	movzbl %al,%eax
  1006cf:	83 e0 01             	and    $0x1,%eax
  1006d2:	85 c0                	test   %eax,%eax
  1006d4:	75 07                	jne    1006dd <serial_proc_data+0x33>
  1006d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006db:	eb 13                	jmp    1006f0 <serial_proc_data+0x46>
  1006dd:	83 ec 0c             	sub    $0xc,%esp
  1006e0:	68 f8 03 00 00       	push   $0x3f8
  1006e5:	e8 c3 33 00 00       	call   103aad <inb>
  1006ea:	83 c4 10             	add    $0x10,%esp
  1006ed:	0f b6 c0             	movzbl %al,%eax
  1006f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006f3:	c9                   	leave  
  1006f4:	c3                   	ret    

001006f5 <serial_intr>:
  1006f5:	55                   	push   %ebp
  1006f6:	89 e5                	mov    %esp,%ebp
  1006f8:	53                   	push   %ebx
  1006f9:	83 ec 04             	sub    $0x4,%esp
  1006fc:	e8 b4 fc ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  100701:	05 ff 88 00 00       	add    $0x88ff,%eax
  100706:	0f b6 90 40 76 00 00 	movzbl 0x7640(%eax),%edx
  10070d:	84 d2                	test   %dl,%dl
  10070f:	74 14                	je     100725 <serial_intr+0x30>
  100711:	83 ec 0c             	sub    $0xc,%esp
  100714:	8d 90 aa 76 ff ff    	lea    -0x8956(%eax),%edx
  10071a:	52                   	push   %edx
  10071b:	89 c3                	mov    %eax,%ebx
  10071d:	e8 da fc ff ff       	call   1003fc <cons_intr>
  100722:	83 c4 10             	add    $0x10,%esp
  100725:	90                   	nop
  100726:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100729:	c9                   	leave  
  10072a:	c3                   	ret    

0010072b <serial_reformatnewline>:
  10072b:	55                   	push   %ebp
  10072c:	89 e5                	mov    %esp,%ebp
  10072e:	53                   	push   %ebx
  10072f:	83 ec 14             	sub    $0x14,%esp
  100732:	e8 86 fc ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100737:	81 c3 c9 88 00 00    	add    $0x88c9,%ebx
  10073d:	c7 45 f4 0d 00 00 00 	movl   $0xd,-0xc(%ebp)
  100744:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  10074b:	8b 45 08             	mov    0x8(%ebp),%eax
  10074e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  100751:	75 31                	jne    100784 <serial_reformatnewline+0x59>
  100753:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100756:	0f b6 c0             	movzbl %al,%eax
  100759:	83 ec 08             	sub    $0x8,%esp
  10075c:	50                   	push   %eax
  10075d:	ff 75 0c             	push   0xc(%ebp)
  100760:	e8 97 33 00 00       	call   103afc <outb>
  100765:	83 c4 10             	add    $0x10,%esp
  100768:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10076b:	0f b6 c0             	movzbl %al,%eax
  10076e:	83 ec 08             	sub    $0x8,%esp
  100771:	50                   	push   %eax
  100772:	ff 75 0c             	push   0xc(%ebp)
  100775:	e8 82 33 00 00       	call   103afc <outb>
  10077a:	83 c4 10             	add    $0x10,%esp
  10077d:	b8 01 00 00 00       	mov    $0x1,%eax
  100782:	eb 05                	jmp    100789 <serial_reformatnewline+0x5e>
  100784:	b8 00 00 00 00       	mov    $0x0,%eax
  100789:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10078c:	c9                   	leave  
  10078d:	c3                   	ret    

0010078e <serial_putc>:
  10078e:	55                   	push   %ebp
  10078f:	89 e5                	mov    %esp,%ebp
  100791:	53                   	push   %ebx
  100792:	83 ec 24             	sub    $0x24,%esp
  100795:	e8 23 fc ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  10079a:	81 c3 66 88 00 00    	add    $0x8866,%ebx
  1007a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a3:	88 45 e4             	mov    %al,-0x1c(%ebp)
  1007a6:	0f b6 83 40 76 00 00 	movzbl 0x7640(%ebx),%eax
  1007ad:	84 c0                	test   %al,%al
  1007af:	74 68                	je     100819 <serial_putc+0x8b>
  1007b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1007b8:	eb 09                	jmp    1007c3 <serial_putc+0x35>
  1007ba:	e8 93 fe ff ff       	call   100652 <delay>
  1007bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1007c3:	83 ec 0c             	sub    $0xc,%esp
  1007c6:	68 fd 03 00 00       	push   $0x3fd
  1007cb:	e8 dd 32 00 00       	call   103aad <inb>
  1007d0:	83 c4 10             	add    $0x10,%esp
  1007d3:	0f b6 c0             	movzbl %al,%eax
  1007d6:	83 e0 20             	and    $0x20,%eax
  1007d9:	85 c0                	test   %eax,%eax
  1007db:	75 09                	jne    1007e6 <serial_putc+0x58>
  1007dd:	81 7d f4 ff 31 00 00 	cmpl   $0x31ff,-0xc(%ebp)
  1007e4:	7e d4                	jle    1007ba <serial_putc+0x2c>
  1007e6:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
  1007ea:	83 ec 08             	sub    $0x8,%esp
  1007ed:	68 f8 03 00 00       	push   $0x3f8
  1007f2:	50                   	push   %eax
  1007f3:	e8 33 ff ff ff       	call   10072b <serial_reformatnewline>
  1007f8:	83 c4 10             	add    $0x10,%esp
  1007fb:	85 c0                	test   %eax,%eax
  1007fd:	75 1b                	jne    10081a <serial_putc+0x8c>
  1007ff:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  100803:	0f b6 c0             	movzbl %al,%eax
  100806:	83 ec 08             	sub    $0x8,%esp
  100809:	50                   	push   %eax
  10080a:	68 f8 03 00 00       	push   $0x3f8
  10080f:	e8 e8 32 00 00       	call   103afc <outb>
  100814:	83 c4 10             	add    $0x10,%esp
  100817:	eb 01                	jmp    10081a <serial_putc+0x8c>
  100819:	90                   	nop
  10081a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10081d:	c9                   	leave  
  10081e:	c3                   	ret    

0010081f <serial_init>:
  10081f:	55                   	push   %ebp
  100820:	89 e5                	mov    %esp,%ebp
  100822:	53                   	push   %ebx
  100823:	83 ec 04             	sub    $0x4,%esp
  100826:	e8 92 fb ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  10082b:	81 c3 d5 87 00 00    	add    $0x87d5,%ebx
  100831:	83 ec 08             	sub    $0x8,%esp
  100834:	6a 00                	push   $0x0
  100836:	68 f9 03 00 00       	push   $0x3f9
  10083b:	e8 bc 32 00 00       	call   103afc <outb>
  100840:	83 c4 10             	add    $0x10,%esp
  100843:	83 ec 08             	sub    $0x8,%esp
  100846:	68 80 00 00 00       	push   $0x80
  10084b:	68 fb 03 00 00       	push   $0x3fb
  100850:	e8 a7 32 00 00       	call   103afc <outb>
  100855:	83 c4 10             	add    $0x10,%esp
  100858:	83 ec 08             	sub    $0x8,%esp
  10085b:	6a 01                	push   $0x1
  10085d:	68 f8 03 00 00       	push   $0x3f8
  100862:	e8 95 32 00 00       	call   103afc <outb>
  100867:	83 c4 10             	add    $0x10,%esp
  10086a:	83 ec 08             	sub    $0x8,%esp
  10086d:	6a 00                	push   $0x0
  10086f:	68 f9 03 00 00       	push   $0x3f9
  100874:	e8 83 32 00 00       	call   103afc <outb>
  100879:	83 c4 10             	add    $0x10,%esp
  10087c:	83 ec 08             	sub    $0x8,%esp
  10087f:	6a 03                	push   $0x3
  100881:	68 fb 03 00 00       	push   $0x3fb
  100886:	e8 71 32 00 00       	call   103afc <outb>
  10088b:	83 c4 10             	add    $0x10,%esp
  10088e:	83 ec 08             	sub    $0x8,%esp
  100891:	68 c7 00 00 00       	push   $0xc7
  100896:	68 fa 03 00 00       	push   $0x3fa
  10089b:	e8 5c 32 00 00       	call   103afc <outb>
  1008a0:	83 c4 10             	add    $0x10,%esp
  1008a3:	83 ec 08             	sub    $0x8,%esp
  1008a6:	6a 0b                	push   $0xb
  1008a8:	68 fc 03 00 00       	push   $0x3fc
  1008ad:	e8 4a 32 00 00       	call   103afc <outb>
  1008b2:	83 c4 10             	add    $0x10,%esp
  1008b5:	83 ec 0c             	sub    $0xc,%esp
  1008b8:	68 fd 03 00 00       	push   $0x3fd
  1008bd:	e8 eb 31 00 00       	call   103aad <inb>
  1008c2:	83 c4 10             	add    $0x10,%esp
  1008c5:	3c ff                	cmp    $0xff,%al
  1008c7:	0f 95 c0             	setne  %al
  1008ca:	88 83 40 76 00 00    	mov    %al,0x7640(%ebx)
  1008d0:	83 ec 0c             	sub    $0xc,%esp
  1008d3:	68 fa 03 00 00       	push   $0x3fa
  1008d8:	e8 d0 31 00 00       	call   103aad <inb>
  1008dd:	83 c4 10             	add    $0x10,%esp
  1008e0:	83 ec 0c             	sub    $0xc,%esp
  1008e3:	68 f8 03 00 00       	push   $0x3f8
  1008e8:	e8 c0 31 00 00       	call   103aad <inb>
  1008ed:	83 c4 10             	add    $0x10,%esp
  1008f0:	90                   	nop
  1008f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008f4:	c9                   	leave  
  1008f5:	c3                   	ret    

001008f6 <serial_intenable>:
  1008f6:	55                   	push   %ebp
  1008f7:	89 e5                	mov    %esp,%ebp
  1008f9:	53                   	push   %ebx
  1008fa:	83 ec 04             	sub    $0x4,%esp
  1008fd:	e8 b3 fa ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  100902:	05 fe 86 00 00       	add    $0x86fe,%eax
  100907:	0f b6 90 40 76 00 00 	movzbl 0x7640(%eax),%edx
  10090e:	84 d2                	test   %dl,%dl
  100910:	74 19                	je     10092b <serial_intenable+0x35>
  100912:	83 ec 08             	sub    $0x8,%esp
  100915:	6a 01                	push   $0x1
  100917:	68 f9 03 00 00       	push   $0x3f9
  10091c:	89 c3                	mov    %eax,%ebx
  10091e:	e8 d9 31 00 00       	call   103afc <outb>
  100923:	83 c4 10             	add    $0x10,%esp
  100926:	e8 ca fd ff ff       	call   1006f5 <serial_intr>
  10092b:	90                   	nop
  10092c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10092f:	c9                   	leave  
  100930:	c3                   	ret    

00100931 <kbd_proc_data>:
  100931:	55                   	push   %ebp
  100932:	89 e5                	mov    %esp,%ebp
  100934:	53                   	push   %ebx
  100935:	83 ec 14             	sub    $0x14,%esp
  100938:	e8 80 fa ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  10093d:	81 c3 c3 86 00 00    	add    $0x86c3,%ebx
  100943:	83 ec 0c             	sub    $0xc,%esp
  100946:	6a 64                	push   $0x64
  100948:	e8 60 31 00 00       	call   103aad <inb>
  10094d:	83 c4 10             	add    $0x10,%esp
  100950:	0f b6 c0             	movzbl %al,%eax
  100953:	83 e0 01             	and    $0x1,%eax
  100956:	85 c0                	test   %eax,%eax
  100958:	75 0a                	jne    100964 <kbd_proc_data+0x33>
  10095a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10095f:	e9 69 01 00 00       	jmp    100acd <kbd_proc_data+0x19c>
  100964:	83 ec 0c             	sub    $0xc,%esp
  100967:	6a 60                	push   $0x60
  100969:	e8 3f 31 00 00       	call   103aad <inb>
  10096e:	83 c4 10             	add    $0x10,%esp
  100971:	88 45 f3             	mov    %al,-0xd(%ebp)
  100974:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  100978:	75 19                	jne    100993 <kbd_proc_data+0x62>
  10097a:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  100980:	83 c8 40             	or     $0x40,%eax
  100983:	89 83 44 76 00 00    	mov    %eax,0x7644(%ebx)
  100989:	b8 00 00 00 00       	mov    $0x0,%eax
  10098e:	e9 3a 01 00 00       	jmp    100acd <kbd_proc_data+0x19c>
  100993:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100997:	84 c0                	test   %al,%al
  100999:	79 4b                	jns    1009e6 <kbd_proc_data+0xb5>
  10099b:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  1009a1:	83 e0 40             	and    $0x40,%eax
  1009a4:	85 c0                	test   %eax,%eax
  1009a6:	75 09                	jne    1009b1 <kbd_proc_data+0x80>
  1009a8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1009ac:	83 e0 7f             	and    $0x7f,%eax
  1009af:	eb 04                	jmp    1009b5 <kbd_proc_data+0x84>
  1009b1:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1009b5:	88 45 f3             	mov    %al,-0xd(%ebp)
  1009b8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1009bc:	0f b6 84 03 00 10 00 	movzbl 0x1000(%ebx,%eax,1),%eax
  1009c3:	00 
  1009c4:	83 c8 40             	or     $0x40,%eax
  1009c7:	0f b6 c0             	movzbl %al,%eax
  1009ca:	f7 d0                	not    %eax
  1009cc:	89 c2                	mov    %eax,%edx
  1009ce:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  1009d4:	21 d0                	and    %edx,%eax
  1009d6:	89 83 44 76 00 00    	mov    %eax,0x7644(%ebx)
  1009dc:	b8 00 00 00 00       	mov    $0x0,%eax
  1009e1:	e9 e7 00 00 00       	jmp    100acd <kbd_proc_data+0x19c>
  1009e6:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  1009ec:	83 e0 40             	and    $0x40,%eax
  1009ef:	85 c0                	test   %eax,%eax
  1009f1:	74 13                	je     100a06 <kbd_proc_data+0xd5>
  1009f3:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
  1009f7:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  1009fd:	83 e0 bf             	and    $0xffffffbf,%eax
  100a00:	89 83 44 76 00 00    	mov    %eax,0x7644(%ebx)
  100a06:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a0a:	0f b6 84 03 00 10 00 	movzbl 0x1000(%ebx,%eax,1),%eax
  100a11:	00 
  100a12:	0f b6 d0             	movzbl %al,%edx
  100a15:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  100a1b:	09 d0                	or     %edx,%eax
  100a1d:	89 83 44 76 00 00    	mov    %eax,0x7644(%ebx)
  100a23:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a27:	0f b6 84 03 00 11 00 	movzbl 0x1100(%ebx,%eax,1),%eax
  100a2e:	00 
  100a2f:	0f b6 d0             	movzbl %al,%edx
  100a32:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  100a38:	31 d0                	xor    %edx,%eax
  100a3a:	89 83 44 76 00 00    	mov    %eax,0x7644(%ebx)
  100a40:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  100a46:	83 e0 03             	and    $0x3,%eax
  100a49:	8b 94 83 00 15 00 00 	mov    0x1500(%ebx,%eax,4),%edx
  100a50:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a54:	01 d0                	add    %edx,%eax
  100a56:	0f b6 00             	movzbl (%eax),%eax
  100a59:	0f b6 c0             	movzbl %al,%eax
  100a5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a5f:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  100a65:	83 e0 08             	and    $0x8,%eax
  100a68:	85 c0                	test   %eax,%eax
  100a6a:	74 22                	je     100a8e <kbd_proc_data+0x15d>
  100a6c:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  100a70:	7e 0c                	jle    100a7e <kbd_proc_data+0x14d>
  100a72:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  100a76:	7f 06                	jg     100a7e <kbd_proc_data+0x14d>
  100a78:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  100a7c:	eb 10                	jmp    100a8e <kbd_proc_data+0x15d>
  100a7e:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  100a82:	7e 0a                	jle    100a8e <kbd_proc_data+0x15d>
  100a84:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  100a88:	7f 04                	jg     100a8e <kbd_proc_data+0x15d>
  100a8a:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  100a8e:	8b 83 44 76 00 00    	mov    0x7644(%ebx),%eax
  100a94:	f7 d0                	not    %eax
  100a96:	83 e0 06             	and    $0x6,%eax
  100a99:	85 c0                	test   %eax,%eax
  100a9b:	75 2d                	jne    100aca <kbd_proc_data+0x199>
  100a9d:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  100aa4:	75 24                	jne    100aca <kbd_proc_data+0x199>
  100aa6:	83 ec 0c             	sub    $0xc,%esp
  100aa9:	8d 83 21 d0 ff ff    	lea    -0x2fdf(%ebx),%eax
  100aaf:	50                   	push   %eax
  100ab0:	e8 a7 22 00 00       	call   102d5c <dprintf>
  100ab5:	83 c4 10             	add    $0x10,%esp
  100ab8:	83 ec 08             	sub    $0x8,%esp
  100abb:	6a 03                	push   $0x3
  100abd:	68 92 00 00 00       	push   $0x92
  100ac2:	e8 35 30 00 00       	call   103afc <outb>
  100ac7:	83 c4 10             	add    $0x10,%esp
  100aca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100acd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ad0:	c9                   	leave  
  100ad1:	c3                   	ret    

00100ad2 <keyboard_intr>:
  100ad2:	55                   	push   %ebp
  100ad3:	89 e5                	mov    %esp,%ebp
  100ad5:	53                   	push   %ebx
  100ad6:	83 ec 04             	sub    $0x4,%esp
  100ad9:	e8 d7 f8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  100ade:	05 22 85 00 00       	add    $0x8522,%eax
  100ae3:	83 ec 0c             	sub    $0xc,%esp
  100ae6:	8d 90 31 79 ff ff    	lea    -0x86cf(%eax),%edx
  100aec:	52                   	push   %edx
  100aed:	89 c3                	mov    %eax,%ebx
  100aef:	e8 08 f9 ff ff       	call   1003fc <cons_intr>
  100af4:	83 c4 10             	add    $0x10,%esp
  100af7:	90                   	nop
  100af8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100afb:	c9                   	leave  
  100afc:	c3                   	ret    

00100afd <devinit>:
  100afd:	55                   	push   %ebp
  100afe:	89 e5                	mov    %esp,%ebp
  100b00:	53                   	push   %ebx
  100b01:	83 ec 04             	sub    $0x4,%esp
  100b04:	e8 b4 f8 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100b09:	81 c3 f7 84 00 00    	add    $0x84f7,%ebx
  100b0f:	e8 36 27 00 00       	call   10324a <seg_init>
  100b14:	e8 d8 2d 00 00       	call   1038f1 <enable_sse>
  100b19:	e8 a3 f8 ff ff       	call   1003c1 <cons_init>
  100b1e:	83 ec 04             	sub    $0x4,%esp
  100b21:	8d 83 2d d0 ff ff    	lea    -0x2fd3(%ebx),%eax
  100b27:	50                   	push   %eax
  100b28:	6a 12                	push   $0x12
  100b2a:	8d 83 40 d0 ff ff    	lea    -0x2fc0(%ebx),%eax
  100b30:	50                   	push   %eax
  100b31:	e8 53 1f 00 00       	call   102a89 <debug_normal>
  100b36:	83 c4 10             	add    $0x10,%esp
  100b39:	ff 75 08             	push   0x8(%ebp)
  100b3c:	8d 83 53 d0 ff ff    	lea    -0x2fad(%ebx),%eax
  100b42:	50                   	push   %eax
  100b43:	6a 13                	push   $0x13
  100b45:	8d 83 40 d0 ff ff    	lea    -0x2fc0(%ebx),%eax
  100b4b:	50                   	push   %eax
  100b4c:	e8 38 1f 00 00       	call   102a89 <debug_normal>
  100b51:	83 c4 10             	add    $0x10,%esp
  100b54:	e8 76 1a 00 00       	call   1025cf <intr_init>
  100b59:	83 ec 0c             	sub    $0xc,%esp
  100b5c:	ff 75 08             	push   0x8(%ebp)
  100b5f:	e8 a2 03 00 00       	call   100f06 <pmmap_init>
  100b64:	83 c4 10             	add    $0x10,%esp
  100b67:	90                   	nop
  100b68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b6b:	c9                   	leave  
  100b6c:	c3                   	ret    

00100b6d <pmmap_alloc_slot>:
  100b6d:	55                   	push   %ebp
  100b6e:	89 e5                	mov    %esp,%ebp
  100b70:	e8 44 f8 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  100b75:	81 c2 8b 84 00 00    	add    $0x848b,%edx
  100b7b:	8b 82 60 80 00 00    	mov    0x8060(%edx),%eax
  100b81:	3d 80 00 00 00       	cmp    $0x80,%eax
  100b86:	0f 94 c0             	sete   %al
  100b89:	0f b6 c0             	movzbl %al,%eax
  100b8c:	85 c0                	test   %eax,%eax
  100b8e:	74 07                	je     100b97 <pmmap_alloc_slot+0x2a>
  100b90:	b8 00 00 00 00       	mov    $0x0,%eax
  100b95:	eb 21                	jmp    100bb8 <pmmap_alloc_slot+0x4b>
  100b97:	8b 8a 60 80 00 00    	mov    0x8060(%edx),%ecx
  100b9d:	8d 41 01             	lea    0x1(%ecx),%eax
  100ba0:	89 82 60 80 00 00    	mov    %eax,0x8060(%edx)
  100ba6:	89 c8                	mov    %ecx,%eax
  100ba8:	c1 e0 02             	shl    $0x2,%eax
  100bab:	01 c8                	add    %ecx,%eax
  100bad:	c1 e0 02             	shl    $0x2,%eax
  100bb0:	8d 92 60 76 00 00    	lea    0x7660(%edx),%edx
  100bb6:	01 d0                	add    %edx,%eax
  100bb8:	5d                   	pop    %ebp
  100bb9:	c3                   	ret    

00100bba <pmmap_insert>:
  100bba:	55                   	push   %ebp
  100bbb:	89 e5                	mov    %esp,%ebp
  100bbd:	53                   	push   %ebx
  100bbe:	83 ec 14             	sub    $0x14,%esp
  100bc1:	e8 f7 f7 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100bc6:	81 c3 3a 84 00 00    	add    $0x843a,%ebx
  100bcc:	e8 9c ff ff ff       	call   100b6d <pmmap_alloc_slot>
  100bd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100bd4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100bd8:	75 1b                	jne    100bf5 <pmmap_insert+0x3b>
  100bda:	83 ec 04             	sub    $0x4,%esp
  100bdd:	8d 83 6c d0 ff ff    	lea    -0x2f94(%ebx),%eax
  100be3:	50                   	push   %eax
  100be4:	6a 3c                	push   $0x3c
  100be6:	8d 83 89 d0 ff ff    	lea    -0x2f77(%ebx),%eax
  100bec:	50                   	push   %eax
  100bed:	e8 52 1f 00 00       	call   102b44 <debug_panic>
  100bf2:	83 c4 10             	add    $0x10,%esp
  100bf5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bf8:	8b 55 08             	mov    0x8(%ebp),%edx
  100bfb:	89 10                	mov    %edx,(%eax)
  100bfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c00:	8b 55 0c             	mov    0xc(%ebp),%edx
  100c03:	89 50 04             	mov    %edx,0x4(%eax)
  100c06:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c09:	8b 55 10             	mov    0x10(%ebp),%edx
  100c0c:	89 50 08             	mov    %edx,0x8(%eax)
  100c0f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  100c16:	8b 83 64 80 00 00    	mov    0x8064(%ebx),%eax
  100c1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c1f:	eb 19                	jmp    100c3a <pmmap_insert+0x80>
  100c21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c24:	8b 00                	mov    (%eax),%eax
  100c26:	39 45 08             	cmp    %eax,0x8(%ebp)
  100c29:	72 17                	jb     100c42 <pmmap_insert+0x88>
  100c2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100c31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c34:	8b 40 0c             	mov    0xc(%eax),%eax
  100c37:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c3a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c3e:	75 e1                	jne    100c21 <pmmap_insert+0x67>
  100c40:	eb 01                	jmp    100c43 <pmmap_insert+0x89>
  100c42:	90                   	nop
  100c43:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c47:	75 17                	jne    100c60 <pmmap_insert+0xa6>
  100c49:	8b 93 64 80 00 00    	mov    0x8064(%ebx),%edx
  100c4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c52:	89 50 0c             	mov    %edx,0xc(%eax)
  100c55:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c58:	89 83 64 80 00 00    	mov    %eax,0x8064(%ebx)
  100c5e:	eb 15                	jmp    100c75 <pmmap_insert+0xbb>
  100c60:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c63:	8b 50 0c             	mov    0xc(%eax),%edx
  100c66:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c69:	89 50 0c             	mov    %edx,0xc(%eax)
  100c6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c6f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100c72:	89 50 0c             	mov    %edx,0xc(%eax)
  100c75:	90                   	nop
  100c76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c79:	c9                   	leave  
  100c7a:	c3                   	ret    

00100c7b <pmmap_merge>:
  100c7b:	55                   	push   %ebp
  100c7c:	89 e5                	mov    %esp,%ebp
  100c7e:	53                   	push   %ebx
  100c7f:	83 ec 24             	sub    $0x24,%esp
  100c82:	e8 36 f7 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100c87:	81 c3 79 83 00 00    	add    $0x8379,%ebx
  100c8d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100c94:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100c9b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100ca2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100ca9:	8b 83 64 80 00 00    	mov    0x8064(%ebx),%eax
  100caf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cb2:	eb 73                	jmp    100d27 <pmmap_merge+0xac>
  100cb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cb7:	8b 40 0c             	mov    0xc(%eax),%eax
  100cba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100cbd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100cc1:	74 6c                	je     100d2f <pmmap_merge+0xb4>
  100cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc6:	8b 10                	mov    (%eax),%edx
  100cc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ccb:	8b 00                	mov    (%eax),%eax
  100ccd:	39 c2                	cmp    %eax,%edx
  100ccf:	77 4d                	ja     100d1e <pmmap_merge+0xa3>
  100cd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd4:	8b 50 04             	mov    0x4(%eax),%edx
  100cd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100cda:	8b 00                	mov    (%eax),%eax
  100cdc:	39 c2                	cmp    %eax,%edx
  100cde:	72 3e                	jb     100d1e <pmmap_merge+0xa3>
  100ce0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce3:	8b 50 08             	mov    0x8(%eax),%edx
  100ce6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ce9:	8b 40 08             	mov    0x8(%eax),%eax
  100cec:	39 c2                	cmp    %eax,%edx
  100cee:	75 2e                	jne    100d1e <pmmap_merge+0xa3>
  100cf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100cf3:	8b 50 04             	mov    0x4(%eax),%edx
  100cf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf9:	8b 40 04             	mov    0x4(%eax),%eax
  100cfc:	83 ec 08             	sub    $0x8,%esp
  100cff:	52                   	push   %edx
  100d00:	50                   	push   %eax
  100d01:	e8 ae 2a 00 00       	call   1037b4 <max>
  100d06:	83 c4 10             	add    $0x10,%esp
  100d09:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d0c:	89 42 04             	mov    %eax,0x4(%edx)
  100d0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d12:	8b 40 0c             	mov    0xc(%eax),%eax
  100d15:	8b 50 0c             	mov    0xc(%eax),%edx
  100d18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d1b:	89 50 0c             	mov    %edx,0xc(%eax)
  100d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d21:	8b 40 0c             	mov    0xc(%eax),%eax
  100d24:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d27:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d2b:	75 87                	jne    100cb4 <pmmap_merge+0x39>
  100d2d:	eb 01                	jmp    100d30 <pmmap_merge+0xb5>
  100d2f:	90                   	nop
  100d30:	8b 83 64 80 00 00    	mov    0x8064(%ebx),%eax
  100d36:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d39:	e9 cf 00 00 00       	jmp    100e0d <pmmap_merge+0x192>
  100d3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d41:	8b 40 08             	mov    0x8(%eax),%eax
  100d44:	83 f8 01             	cmp    $0x1,%eax
  100d47:	74 3d                	je     100d86 <pmmap_merge+0x10b>
  100d49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d4c:	8b 40 08             	mov    0x8(%eax),%eax
  100d4f:	83 f8 02             	cmp    $0x2,%eax
  100d52:	74 2b                	je     100d7f <pmmap_merge+0x104>
  100d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d57:	8b 40 08             	mov    0x8(%eax),%eax
  100d5a:	83 f8 03             	cmp    $0x3,%eax
  100d5d:	74 19                	je     100d78 <pmmap_merge+0xfd>
  100d5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d62:	8b 40 08             	mov    0x8(%eax),%eax
  100d65:	83 f8 04             	cmp    $0x4,%eax
  100d68:	75 07                	jne    100d71 <pmmap_merge+0xf6>
  100d6a:	b8 03 00 00 00       	mov    $0x3,%eax
  100d6f:	eb 1a                	jmp    100d8b <pmmap_merge+0x110>
  100d71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100d76:	eb 13                	jmp    100d8b <pmmap_merge+0x110>
  100d78:	b8 02 00 00 00       	mov    $0x2,%eax
  100d7d:	eb 0c                	jmp    100d8b <pmmap_merge+0x110>
  100d7f:	b8 01 00 00 00       	mov    $0x1,%eax
  100d84:	eb 05                	jmp    100d8b <pmmap_merge+0x110>
  100d86:	b8 00 00 00 00       	mov    $0x0,%eax
  100d8b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100d8e:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  100d92:	75 1f                	jne    100db3 <pmmap_merge+0x138>
  100d94:	8d 83 9a d0 ff ff    	lea    -0x2f66(%ebx),%eax
  100d9a:	50                   	push   %eax
  100d9b:	8d 83 ab d0 ff ff    	lea    -0x2f55(%ebx),%eax
  100da1:	50                   	push   %eax
  100da2:	6a 6b                	push   $0x6b
  100da4:	8d 83 89 d0 ff ff    	lea    -0x2f77(%ebx),%eax
  100daa:	50                   	push   %eax
  100dab:	e8 94 1d 00 00       	call   102b44 <debug_panic>
  100db0:	83 c4 10             	add    $0x10,%esp
  100db3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100db6:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100dba:	85 c0                	test   %eax,%eax
  100dbc:	74 1f                	je     100ddd <pmmap_merge+0x162>
  100dbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100dc1:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100dc5:	8b 50 10             	mov    0x10(%eax),%edx
  100dc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dcb:	89 50 10             	mov    %edx,0x10(%eax)
  100dce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100dd1:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100dd5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100dd8:	89 50 10             	mov    %edx,0x10(%eax)
  100ddb:	eb 1d                	jmp    100dfa <pmmap_merge+0x17f>
  100ddd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100de0:	8b 94 83 68 80 00 00 	mov    0x8068(%ebx,%eax,4),%edx
  100de7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dea:	89 50 10             	mov    %edx,0x10(%eax)
  100ded:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100df0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100df3:	89 94 83 68 80 00 00 	mov    %edx,0x8068(%ebx,%eax,4)
  100dfa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100dfd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e00:	89 54 85 dc          	mov    %edx,-0x24(%ebp,%eax,4)
  100e04:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e07:	8b 40 0c             	mov    0xc(%eax),%eax
  100e0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100e0d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100e11:	0f 85 27 ff ff ff    	jne    100d3e <pmmap_merge+0xc3>
  100e17:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100e1a:	85 c0                	test   %eax,%eax
  100e1c:	74 0c                	je     100e2a <pmmap_merge+0x1af>
  100e1e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100e21:	8b 40 04             	mov    0x4(%eax),%eax
  100e24:	89 83 78 80 00 00    	mov    %eax,0x8078(%ebx)
  100e2a:	90                   	nop
  100e2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100e2e:	c9                   	leave  
  100e2f:	c3                   	ret    

00100e30 <pmmap_dump>:
  100e30:	55                   	push   %ebp
  100e31:	89 e5                	mov    %esp,%ebp
  100e33:	53                   	push   %ebx
  100e34:	83 ec 14             	sub    $0x14,%esp
  100e37:	e8 81 f5 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100e3c:	81 c3 c4 81 00 00    	add    $0x81c4,%ebx
  100e42:	8b 83 64 80 00 00    	mov    0x8064(%ebx),%eax
  100e48:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100e4b:	e9 a5 00 00 00       	jmp    100ef5 <pmmap_dump+0xc5>
  100e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e53:	8b 40 08             	mov    0x8(%eax),%eax
  100e56:	83 f8 01             	cmp    $0x1,%eax
  100e59:	74 41                	je     100e9c <pmmap_dump+0x6c>
  100e5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e5e:	8b 40 08             	mov    0x8(%eax),%eax
  100e61:	83 f8 02             	cmp    $0x2,%eax
  100e64:	74 2e                	je     100e94 <pmmap_dump+0x64>
  100e66:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e69:	8b 40 08             	mov    0x8(%eax),%eax
  100e6c:	83 f8 03             	cmp    $0x3,%eax
  100e6f:	74 1b                	je     100e8c <pmmap_dump+0x5c>
  100e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e74:	8b 40 08             	mov    0x8(%eax),%eax
  100e77:	83 f8 04             	cmp    $0x4,%eax
  100e7a:	75 08                	jne    100e84 <pmmap_dump+0x54>
  100e7c:	8d 83 c8 d0 ff ff    	lea    -0x2f38(%ebx),%eax
  100e82:	eb 1e                	jmp    100ea2 <pmmap_dump+0x72>
  100e84:	8d 83 d1 d0 ff ff    	lea    -0x2f2f(%ebx),%eax
  100e8a:	eb 16                	jmp    100ea2 <pmmap_dump+0x72>
  100e8c:	8d 83 d9 d0 ff ff    	lea    -0x2f27(%ebx),%eax
  100e92:	eb 0e                	jmp    100ea2 <pmmap_dump+0x72>
  100e94:	8d 83 e3 d0 ff ff    	lea    -0x2f1d(%ebx),%eax
  100e9a:	eb 06                	jmp    100ea2 <pmmap_dump+0x72>
  100e9c:	8d 83 ec d0 ff ff    	lea    -0x2f14(%ebx),%eax
  100ea2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ea5:	8b 0a                	mov    (%edx),%ecx
  100ea7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100eaa:	8b 52 04             	mov    0x4(%edx),%edx
  100ead:	39 d1                	cmp    %edx,%ecx
  100eaf:	75 08                	jne    100eb9 <pmmap_dump+0x89>
  100eb1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100eb4:	8b 52 04             	mov    0x4(%edx),%edx
  100eb7:	eb 1c                	jmp    100ed5 <pmmap_dump+0xa5>
  100eb9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ebc:	8b 52 04             	mov    0x4(%edx),%edx
  100ebf:	83 fa ff             	cmp    $0xffffffff,%edx
  100ec2:	75 08                	jne    100ecc <pmmap_dump+0x9c>
  100ec4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ec7:	8b 52 04             	mov    0x4(%edx),%edx
  100eca:	eb 09                	jmp    100ed5 <pmmap_dump+0xa5>
  100ecc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ecf:	8b 52 04             	mov    0x4(%edx),%edx
  100ed2:	83 ea 01             	sub    $0x1,%edx
  100ed5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100ed8:	8b 09                	mov    (%ecx),%ecx
  100eda:	50                   	push   %eax
  100edb:	52                   	push   %edx
  100edc:	51                   	push   %ecx
  100edd:	8d 83 f4 d0 ff ff    	lea    -0x2f0c(%ebx),%eax
  100ee3:	50                   	push   %eax
  100ee4:	e8 6f 1b 00 00       	call   102a58 <debug_info>
  100ee9:	83 c4 10             	add    $0x10,%esp
  100eec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eef:	8b 40 0c             	mov    0xc(%eax),%eax
  100ef2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ef5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ef9:	0f 85 51 ff ff ff    	jne    100e50 <pmmap_dump+0x20>
  100eff:	90                   	nop
  100f00:	90                   	nop
  100f01:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f04:	c9                   	leave  
  100f05:	c3                   	ret    

00100f06 <pmmap_init>:
  100f06:	55                   	push   %ebp
  100f07:	89 e5                	mov    %esp,%ebp
  100f09:	53                   	push   %ebx
  100f0a:	83 ec 24             	sub    $0x24,%esp
  100f0d:	e8 ab f4 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  100f12:	81 c3 ee 80 00 00    	add    $0x80ee,%ebx
  100f18:	83 ec 0c             	sub    $0xc,%esp
  100f1b:	8d 83 15 d1 ff ff    	lea    -0x2eeb(%ebx),%eax
  100f21:	50                   	push   %eax
  100f22:	e8 31 1b 00 00       	call   102a58 <debug_info>
  100f27:	83 c4 10             	add    $0x10,%esp
  100f2a:	8b 45 08             	mov    0x8(%ebp),%eax
  100f2d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100f30:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100f33:	8b 40 30             	mov    0x30(%eax),%eax
  100f36:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100f39:	c7 83 64 80 00 00 00 	movl   $0x0,0x8064(%ebx)
  100f40:	00 00 00 
  100f43:	c7 83 68 80 00 00 00 	movl   $0x0,0x8068(%ebx)
  100f4a:	00 00 00 
  100f4d:	c7 83 6c 80 00 00 00 	movl   $0x0,0x806c(%ebx)
  100f54:	00 00 00 
  100f57:	c7 83 70 80 00 00 00 	movl   $0x0,0x8070(%ebx)
  100f5e:	00 00 00 
  100f61:	c7 83 74 80 00 00 00 	movl   $0x0,0x8074(%ebx)
  100f68:	00 00 00 
  100f6b:	eb 6c                	jmp    100fd9 <pmmap_init+0xd3>
  100f6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f70:	8b 40 08             	mov    0x8(%eax),%eax
  100f73:	85 c0                	test   %eax,%eax
  100f75:	75 58                	jne    100fcf <pmmap_init+0xc9>
  100f77:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f7a:	8b 40 04             	mov    0x4(%eax),%eax
  100f7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  100f80:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f83:	8b 40 10             	mov    0x10(%eax),%eax
  100f86:	85 c0                	test   %eax,%eax
  100f88:	75 0f                	jne    100f99 <pmmap_init+0x93>
  100f8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f8d:	8b 40 0c             	mov    0xc(%eax),%eax
  100f90:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100f93:	f7 d2                	not    %edx
  100f95:	39 d0                	cmp    %edx,%eax
  100f97:	72 09                	jb     100fa2 <pmmap_init+0x9c>
  100f99:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  100fa0:	eb 0e                	jmp    100fb0 <pmmap_init+0xaa>
  100fa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fa5:	8b 50 0c             	mov    0xc(%eax),%edx
  100fa8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100fab:	01 d0                	add    %edx,%eax
  100fad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100fb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fb3:	8b 40 14             	mov    0x14(%eax),%eax
  100fb6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  100fb9:	83 ec 04             	sub    $0x4,%esp
  100fbc:	ff 75 e0             	push   -0x20(%ebp)
  100fbf:	ff 75 f0             	push   -0x10(%ebp)
  100fc2:	ff 75 e4             	push   -0x1c(%ebp)
  100fc5:	e8 f0 fb ff ff       	call   100bba <pmmap_insert>
  100fca:	83 c4 10             	add    $0x10,%esp
  100fcd:	eb 01                	jmp    100fd0 <pmmap_init+0xca>
  100fcf:	90                   	nop
  100fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fd3:	83 c0 18             	add    $0x18,%eax
  100fd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100fd9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100fdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100fdf:	8b 40 30             	mov    0x30(%eax),%eax
  100fe2:	29 c2                	sub    %eax,%edx
  100fe4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100fe7:	8b 40 2c             	mov    0x2c(%eax),%eax
  100fea:	39 c2                	cmp    %eax,%edx
  100fec:	0f 82 7b ff ff ff    	jb     100f6d <pmmap_init+0x67>
  100ff2:	e8 84 fc ff ff       	call   100c7b <pmmap_merge>
  100ff7:	e8 34 fe ff ff       	call   100e30 <pmmap_dump>
  100ffc:	8b 83 64 80 00 00    	mov    0x8064(%ebx),%eax
  101002:	89 45 ec             	mov    %eax,-0x14(%ebp)
  101005:	eb 18                	jmp    10101f <pmmap_init+0x119>
  101007:	8b 83 80 80 00 00    	mov    0x8080(%ebx),%eax
  10100d:	83 c0 01             	add    $0x1,%eax
  101010:	89 83 80 80 00 00    	mov    %eax,0x8080(%ebx)
  101016:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101019:	8b 40 0c             	mov    0xc(%eax),%eax
  10101c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10101f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  101023:	75 e2                	jne    101007 <pmmap_init+0x101>
  101025:	8b 83 78 80 00 00    	mov    0x8078(%ebx),%eax
  10102b:	83 ec 08             	sub    $0x8,%esp
  10102e:	68 00 10 00 00       	push   $0x1000
  101033:	50                   	push   %eax
  101034:	e8 af 27 00 00       	call   1037e8 <rounddown>
  101039:	83 c4 10             	add    $0x10,%esp
  10103c:	c1 e8 0c             	shr    $0xc,%eax
  10103f:	89 83 7c 80 00 00    	mov    %eax,0x807c(%ebx)
  101045:	90                   	nop
  101046:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101049:	c9                   	leave  
  10104a:	c3                   	ret    

0010104b <get_size>:
  10104b:	55                   	push   %ebp
  10104c:	89 e5                	mov    %esp,%ebp
  10104e:	e8 62 f3 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  101053:	05 ad 7f 00 00       	add    $0x7fad,%eax
  101058:	8b 80 80 80 00 00    	mov    0x8080(%eax),%eax
  10105e:	5d                   	pop    %ebp
  10105f:	c3                   	ret    

00101060 <get_mms>:
  101060:	55                   	push   %ebp
  101061:	89 e5                	mov    %esp,%ebp
  101063:	83 ec 10             	sub    $0x10,%esp
  101066:	e8 4a f3 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  10106b:	05 95 7f 00 00       	add    $0x7f95,%eax
  101070:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101077:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10107e:	8b 90 64 80 00 00    	mov    0x8064(%eax),%edx
  101084:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101087:	eb 15                	jmp    10109e <get_mms+0x3e>
  101089:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10108c:	3b 55 08             	cmp    0x8(%ebp),%edx
  10108f:	74 15                	je     1010a6 <get_mms+0x46>
  101091:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101095:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101098:	8b 52 0c             	mov    0xc(%edx),%edx
  10109b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10109e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1010a2:	75 e5                	jne    101089 <get_mms+0x29>
  1010a4:	eb 01                	jmp    1010a7 <get_mms+0x47>
  1010a6:	90                   	nop
  1010a7:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1010ab:	74 0b                	je     1010b8 <get_mms+0x58>
  1010ad:	8b 80 80 80 00 00    	mov    0x8080(%eax),%eax
  1010b3:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1010b6:	75 07                	jne    1010bf <get_mms+0x5f>
  1010b8:	b8 00 00 00 00       	mov    $0x0,%eax
  1010bd:	eb 05                	jmp    1010c4 <get_mms+0x64>
  1010bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1010c2:	8b 00                	mov    (%eax),%eax
  1010c4:	c9                   	leave  
  1010c5:	c3                   	ret    

001010c6 <get_mml>:
  1010c6:	55                   	push   %ebp
  1010c7:	89 e5                	mov    %esp,%ebp
  1010c9:	83 ec 10             	sub    $0x10,%esp
  1010cc:	e8 e4 f2 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1010d1:	05 2f 7f 00 00       	add    $0x7f2f,%eax
  1010d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1010dd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1010e4:	8b 90 64 80 00 00    	mov    0x8064(%eax),%edx
  1010ea:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1010ed:	eb 15                	jmp    101104 <get_mml+0x3e>
  1010ef:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1010f2:	3b 55 08             	cmp    0x8(%ebp),%edx
  1010f5:	74 15                	je     10110c <get_mml+0x46>
  1010f7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1010fb:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1010fe:	8b 52 0c             	mov    0xc(%edx),%edx
  101101:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101104:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101108:	75 e5                	jne    1010ef <get_mml+0x29>
  10110a:	eb 01                	jmp    10110d <get_mml+0x47>
  10110c:	90                   	nop
  10110d:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101111:	74 0b                	je     10111e <get_mml+0x58>
  101113:	8b 80 80 80 00 00    	mov    0x8080(%eax),%eax
  101119:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  10111c:	75 07                	jne    101125 <get_mml+0x5f>
  10111e:	b8 00 00 00 00       	mov    $0x0,%eax
  101123:	eb 0f                	jmp    101134 <get_mml+0x6e>
  101125:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101128:	8b 50 04             	mov    0x4(%eax),%edx
  10112b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10112e:	8b 08                	mov    (%eax),%ecx
  101130:	89 d0                	mov    %edx,%eax
  101132:	29 c8                	sub    %ecx,%eax
  101134:	c9                   	leave  
  101135:	c3                   	ret    

00101136 <is_usable>:
  101136:	55                   	push   %ebp
  101137:	89 e5                	mov    %esp,%ebp
  101139:	83 ec 10             	sub    $0x10,%esp
  10113c:	e8 74 f2 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  101141:	05 bf 7e 00 00       	add    $0x7ebf,%eax
  101146:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10114d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101154:	8b 90 64 80 00 00    	mov    0x8064(%eax),%edx
  10115a:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10115d:	eb 15                	jmp    101174 <is_usable+0x3e>
  10115f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101162:	3b 55 08             	cmp    0x8(%ebp),%edx
  101165:	74 15                	je     10117c <is_usable+0x46>
  101167:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10116b:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10116e:	8b 52 0c             	mov    0xc(%edx),%edx
  101171:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101174:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101178:	75 e5                	jne    10115f <is_usable+0x29>
  10117a:	eb 01                	jmp    10117d <is_usable+0x47>
  10117c:	90                   	nop
  10117d:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101181:	74 0b                	je     10118e <is_usable+0x58>
  101183:	8b 80 80 80 00 00    	mov    0x8080(%eax),%eax
  101189:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  10118c:	75 07                	jne    101195 <is_usable+0x5f>
  10118e:	b8 00 00 00 00       	mov    $0x0,%eax
  101193:	eb 0f                	jmp    1011a4 <is_usable+0x6e>
  101195:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101198:	8b 40 08             	mov    0x8(%eax),%eax
  10119b:	83 f8 01             	cmp    $0x1,%eax
  10119e:	0f 94 c0             	sete   %al
  1011a1:	0f b6 c0             	movzbl %al,%eax
  1011a4:	c9                   	leave  
  1011a5:	c3                   	ret    

001011a6 <set_cr3>:
  1011a6:	55                   	push   %ebp
  1011a7:	89 e5                	mov    %esp,%ebp
  1011a9:	53                   	push   %ebx
  1011aa:	83 ec 04             	sub    $0x4,%esp
  1011ad:	e8 03 f2 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1011b2:	05 4e 7e 00 00       	add    $0x7e4e,%eax
  1011b7:	8b 55 08             	mov    0x8(%ebp),%edx
  1011ba:	83 ec 0c             	sub    $0xc,%esp
  1011bd:	52                   	push   %edx
  1011be:	89 c3                	mov    %eax,%ebx
  1011c0:	e8 a1 28 00 00       	call   103a66 <lcr3>
  1011c5:	83 c4 10             	add    $0x10,%esp
  1011c8:	90                   	nop
  1011c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1011cc:	c9                   	leave  
  1011cd:	c3                   	ret    

001011ce <enable_paging>:
  1011ce:	55                   	push   %ebp
  1011cf:	89 e5                	mov    %esp,%ebp
  1011d1:	53                   	push   %ebx
  1011d2:	83 ec 14             	sub    $0x14,%esp
  1011d5:	e8 e3 f1 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1011da:	81 c3 26 7e 00 00    	add    $0x7e26,%ebx
  1011e0:	e8 ad 28 00 00       	call   103a92 <rcr4>
  1011e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1011e8:	81 4d f4 80 00 00 00 	orl    $0x80,-0xc(%ebp)
  1011ef:	83 ec 0c             	sub    $0xc,%esp
  1011f2:	ff 75 f4             	push   -0xc(%ebp)
  1011f5:	e8 82 28 00 00       	call   103a7c <lcr4>
  1011fa:	83 c4 10             	add    $0x10,%esp
  1011fd:	e8 2e 28 00 00       	call   103a30 <rcr0>
  101202:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101205:	81 4d f0 23 00 05 80 	orl    $0x80050023,-0x10(%ebp)
  10120c:	83 65 f0 f3          	andl   $0xfffffff3,-0x10(%ebp)
  101210:	83 ec 0c             	sub    $0xc,%esp
  101213:	ff 75 f0             	push   -0x10(%ebp)
  101216:	e8 ff 27 00 00       	call   103a1a <lcr0>
  10121b:	83 c4 10             	add    $0x10,%esp
  10121e:	90                   	nop
  10121f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101222:	c9                   	leave  
  101223:	c3                   	ret    

00101224 <intr_init_idt>:
  101224:	55                   	push   %ebp
  101225:	89 e5                	mov    %esp,%ebp
  101227:	83 ec 10             	sub    $0x10,%esp
  10122a:	e8 86 f1 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  10122f:	05 d1 7d 00 00       	add    $0x7dd1,%eax
  101234:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10123b:	e9 bb 00 00 00       	jmp    1012fb <intr_init_idt+0xd7>
  101240:	c7 c2 5e 27 10 00    	mov    $0x10275e,%edx
  101246:	89 d1                	mov    %edx,%ecx
  101248:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10124b:	66 89 8c d0 a0 80 00 	mov    %cx,0x80a0(%eax,%edx,8)
  101252:	00 
  101253:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101256:	66 c7 84 d0 a2 80 00 	movw   $0x8,0x80a2(%eax,%edx,8)
  10125d:	00 08 00 
  101260:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101263:	0f b6 8c d0 a4 80 00 	movzbl 0x80a4(%eax,%edx,8),%ecx
  10126a:	00 
  10126b:	83 e1 e0             	and    $0xffffffe0,%ecx
  10126e:	88 8c d0 a4 80 00 00 	mov    %cl,0x80a4(%eax,%edx,8)
  101275:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101278:	0f b6 8c d0 a4 80 00 	movzbl 0x80a4(%eax,%edx,8),%ecx
  10127f:	00 
  101280:	83 e1 1f             	and    $0x1f,%ecx
  101283:	88 8c d0 a4 80 00 00 	mov    %cl,0x80a4(%eax,%edx,8)
  10128a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10128d:	0f b6 8c d0 a5 80 00 	movzbl 0x80a5(%eax,%edx,8),%ecx
  101294:	00 
  101295:	83 e1 f0             	and    $0xfffffff0,%ecx
  101298:	83 c9 0e             	or     $0xe,%ecx
  10129b:	88 8c d0 a5 80 00 00 	mov    %cl,0x80a5(%eax,%edx,8)
  1012a2:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012a5:	0f b6 8c d0 a5 80 00 	movzbl 0x80a5(%eax,%edx,8),%ecx
  1012ac:	00 
  1012ad:	83 e1 ef             	and    $0xffffffef,%ecx
  1012b0:	88 8c d0 a5 80 00 00 	mov    %cl,0x80a5(%eax,%edx,8)
  1012b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012ba:	0f b6 8c d0 a5 80 00 	movzbl 0x80a5(%eax,%edx,8),%ecx
  1012c1:	00 
  1012c2:	83 e1 9f             	and    $0xffffff9f,%ecx
  1012c5:	88 8c d0 a5 80 00 00 	mov    %cl,0x80a5(%eax,%edx,8)
  1012cc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012cf:	0f b6 8c d0 a5 80 00 	movzbl 0x80a5(%eax,%edx,8),%ecx
  1012d6:	00 
  1012d7:	83 c9 80             	or     $0xffffff80,%ecx
  1012da:	88 8c d0 a5 80 00 00 	mov    %cl,0x80a5(%eax,%edx,8)
  1012e1:	c7 c2 5e 27 10 00    	mov    $0x10275e,%edx
  1012e7:	c1 ea 10             	shr    $0x10,%edx
  1012ea:	89 d1                	mov    %edx,%ecx
  1012ec:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012ef:	66 89 8c d0 a6 80 00 	mov    %cx,0x80a6(%eax,%edx,8)
  1012f6:	00 
  1012f7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1012fb:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1012fe:	81 fa ff 00 00 00    	cmp    $0xff,%edx
  101304:	0f 86 36 ff ff ff    	jbe    101240 <intr_init_idt+0x1c>
  10130a:	c7 c2 00 26 10 00    	mov    $0x102600,%edx
  101310:	66 89 90 a0 80 00 00 	mov    %dx,0x80a0(%eax)
  101317:	66 c7 80 a2 80 00 00 	movw   $0x8,0x80a2(%eax)
  10131e:	08 00 
  101320:	0f b6 90 a4 80 00 00 	movzbl 0x80a4(%eax),%edx
  101327:	83 e2 e0             	and    $0xffffffe0,%edx
  10132a:	88 90 a4 80 00 00    	mov    %dl,0x80a4(%eax)
  101330:	0f b6 90 a4 80 00 00 	movzbl 0x80a4(%eax),%edx
  101337:	83 e2 1f             	and    $0x1f,%edx
  10133a:	88 90 a4 80 00 00    	mov    %dl,0x80a4(%eax)
  101340:	0f b6 90 a5 80 00 00 	movzbl 0x80a5(%eax),%edx
  101347:	83 e2 f0             	and    $0xfffffff0,%edx
  10134a:	83 ca 0e             	or     $0xe,%edx
  10134d:	88 90 a5 80 00 00    	mov    %dl,0x80a5(%eax)
  101353:	0f b6 90 a5 80 00 00 	movzbl 0x80a5(%eax),%edx
  10135a:	83 e2 ef             	and    $0xffffffef,%edx
  10135d:	88 90 a5 80 00 00    	mov    %dl,0x80a5(%eax)
  101363:	0f b6 90 a5 80 00 00 	movzbl 0x80a5(%eax),%edx
  10136a:	83 e2 9f             	and    $0xffffff9f,%edx
  10136d:	88 90 a5 80 00 00    	mov    %dl,0x80a5(%eax)
  101373:	0f b6 90 a5 80 00 00 	movzbl 0x80a5(%eax),%edx
  10137a:	83 ca 80             	or     $0xffffff80,%edx
  10137d:	88 90 a5 80 00 00    	mov    %dl,0x80a5(%eax)
  101383:	c7 c2 00 26 10 00    	mov    $0x102600,%edx
  101389:	c1 ea 10             	shr    $0x10,%edx
  10138c:	66 89 90 a6 80 00 00 	mov    %dx,0x80a6(%eax)
  101393:	c7 c2 0a 26 10 00    	mov    $0x10260a,%edx
  101399:	66 89 90 a8 80 00 00 	mov    %dx,0x80a8(%eax)
  1013a0:	66 c7 80 aa 80 00 00 	movw   $0x8,0x80aa(%eax)
  1013a7:	08 00 
  1013a9:	0f b6 90 ac 80 00 00 	movzbl 0x80ac(%eax),%edx
  1013b0:	83 e2 e0             	and    $0xffffffe0,%edx
  1013b3:	88 90 ac 80 00 00    	mov    %dl,0x80ac(%eax)
  1013b9:	0f b6 90 ac 80 00 00 	movzbl 0x80ac(%eax),%edx
  1013c0:	83 e2 1f             	and    $0x1f,%edx
  1013c3:	88 90 ac 80 00 00    	mov    %dl,0x80ac(%eax)
  1013c9:	0f b6 90 ad 80 00 00 	movzbl 0x80ad(%eax),%edx
  1013d0:	83 e2 f0             	and    $0xfffffff0,%edx
  1013d3:	83 ca 0e             	or     $0xe,%edx
  1013d6:	88 90 ad 80 00 00    	mov    %dl,0x80ad(%eax)
  1013dc:	0f b6 90 ad 80 00 00 	movzbl 0x80ad(%eax),%edx
  1013e3:	83 e2 ef             	and    $0xffffffef,%edx
  1013e6:	88 90 ad 80 00 00    	mov    %dl,0x80ad(%eax)
  1013ec:	0f b6 90 ad 80 00 00 	movzbl 0x80ad(%eax),%edx
  1013f3:	83 e2 9f             	and    $0xffffff9f,%edx
  1013f6:	88 90 ad 80 00 00    	mov    %dl,0x80ad(%eax)
  1013fc:	0f b6 90 ad 80 00 00 	movzbl 0x80ad(%eax),%edx
  101403:	83 ca 80             	or     $0xffffff80,%edx
  101406:	88 90 ad 80 00 00    	mov    %dl,0x80ad(%eax)
  10140c:	c7 c2 0a 26 10 00    	mov    $0x10260a,%edx
  101412:	c1 ea 10             	shr    $0x10,%edx
  101415:	66 89 90 ae 80 00 00 	mov    %dx,0x80ae(%eax)
  10141c:	c7 c2 14 26 10 00    	mov    $0x102614,%edx
  101422:	66 89 90 b0 80 00 00 	mov    %dx,0x80b0(%eax)
  101429:	66 c7 80 b2 80 00 00 	movw   $0x8,0x80b2(%eax)
  101430:	08 00 
  101432:	0f b6 90 b4 80 00 00 	movzbl 0x80b4(%eax),%edx
  101439:	83 e2 e0             	and    $0xffffffe0,%edx
  10143c:	88 90 b4 80 00 00    	mov    %dl,0x80b4(%eax)
  101442:	0f b6 90 b4 80 00 00 	movzbl 0x80b4(%eax),%edx
  101449:	83 e2 1f             	and    $0x1f,%edx
  10144c:	88 90 b4 80 00 00    	mov    %dl,0x80b4(%eax)
  101452:	0f b6 90 b5 80 00 00 	movzbl 0x80b5(%eax),%edx
  101459:	83 e2 f0             	and    $0xfffffff0,%edx
  10145c:	83 ca 0e             	or     $0xe,%edx
  10145f:	88 90 b5 80 00 00    	mov    %dl,0x80b5(%eax)
  101465:	0f b6 90 b5 80 00 00 	movzbl 0x80b5(%eax),%edx
  10146c:	83 e2 ef             	and    $0xffffffef,%edx
  10146f:	88 90 b5 80 00 00    	mov    %dl,0x80b5(%eax)
  101475:	0f b6 90 b5 80 00 00 	movzbl 0x80b5(%eax),%edx
  10147c:	83 e2 9f             	and    $0xffffff9f,%edx
  10147f:	88 90 b5 80 00 00    	mov    %dl,0x80b5(%eax)
  101485:	0f b6 90 b5 80 00 00 	movzbl 0x80b5(%eax),%edx
  10148c:	83 ca 80             	or     $0xffffff80,%edx
  10148f:	88 90 b5 80 00 00    	mov    %dl,0x80b5(%eax)
  101495:	c7 c2 14 26 10 00    	mov    $0x102614,%edx
  10149b:	c1 ea 10             	shr    $0x10,%edx
  10149e:	66 89 90 b6 80 00 00 	mov    %dx,0x80b6(%eax)
  1014a5:	c7 c2 1e 26 10 00    	mov    $0x10261e,%edx
  1014ab:	66 89 90 b8 80 00 00 	mov    %dx,0x80b8(%eax)
  1014b2:	66 c7 80 ba 80 00 00 	movw   $0x8,0x80ba(%eax)
  1014b9:	08 00 
  1014bb:	0f b6 90 bc 80 00 00 	movzbl 0x80bc(%eax),%edx
  1014c2:	83 e2 e0             	and    $0xffffffe0,%edx
  1014c5:	88 90 bc 80 00 00    	mov    %dl,0x80bc(%eax)
  1014cb:	0f b6 90 bc 80 00 00 	movzbl 0x80bc(%eax),%edx
  1014d2:	83 e2 1f             	and    $0x1f,%edx
  1014d5:	88 90 bc 80 00 00    	mov    %dl,0x80bc(%eax)
  1014db:	0f b6 90 bd 80 00 00 	movzbl 0x80bd(%eax),%edx
  1014e2:	83 e2 f0             	and    $0xfffffff0,%edx
  1014e5:	83 ca 0e             	or     $0xe,%edx
  1014e8:	88 90 bd 80 00 00    	mov    %dl,0x80bd(%eax)
  1014ee:	0f b6 90 bd 80 00 00 	movzbl 0x80bd(%eax),%edx
  1014f5:	83 e2 ef             	and    $0xffffffef,%edx
  1014f8:	88 90 bd 80 00 00    	mov    %dl,0x80bd(%eax)
  1014fe:	0f b6 90 bd 80 00 00 	movzbl 0x80bd(%eax),%edx
  101505:	83 ca 60             	or     $0x60,%edx
  101508:	88 90 bd 80 00 00    	mov    %dl,0x80bd(%eax)
  10150e:	0f b6 90 bd 80 00 00 	movzbl 0x80bd(%eax),%edx
  101515:	83 ca 80             	or     $0xffffff80,%edx
  101518:	88 90 bd 80 00 00    	mov    %dl,0x80bd(%eax)
  10151e:	c7 c2 1e 26 10 00    	mov    $0x10261e,%edx
  101524:	c1 ea 10             	shr    $0x10,%edx
  101527:	66 89 90 be 80 00 00 	mov    %dx,0x80be(%eax)
  10152e:	c7 c2 28 26 10 00    	mov    $0x102628,%edx
  101534:	66 89 90 c0 80 00 00 	mov    %dx,0x80c0(%eax)
  10153b:	66 c7 80 c2 80 00 00 	movw   $0x8,0x80c2(%eax)
  101542:	08 00 
  101544:	0f b6 90 c4 80 00 00 	movzbl 0x80c4(%eax),%edx
  10154b:	83 e2 e0             	and    $0xffffffe0,%edx
  10154e:	88 90 c4 80 00 00    	mov    %dl,0x80c4(%eax)
  101554:	0f b6 90 c4 80 00 00 	movzbl 0x80c4(%eax),%edx
  10155b:	83 e2 1f             	and    $0x1f,%edx
  10155e:	88 90 c4 80 00 00    	mov    %dl,0x80c4(%eax)
  101564:	0f b6 90 c5 80 00 00 	movzbl 0x80c5(%eax),%edx
  10156b:	83 e2 f0             	and    $0xfffffff0,%edx
  10156e:	83 ca 0e             	or     $0xe,%edx
  101571:	88 90 c5 80 00 00    	mov    %dl,0x80c5(%eax)
  101577:	0f b6 90 c5 80 00 00 	movzbl 0x80c5(%eax),%edx
  10157e:	83 e2 ef             	and    $0xffffffef,%edx
  101581:	88 90 c5 80 00 00    	mov    %dl,0x80c5(%eax)
  101587:	0f b6 90 c5 80 00 00 	movzbl 0x80c5(%eax),%edx
  10158e:	83 ca 60             	or     $0x60,%edx
  101591:	88 90 c5 80 00 00    	mov    %dl,0x80c5(%eax)
  101597:	0f b6 90 c5 80 00 00 	movzbl 0x80c5(%eax),%edx
  10159e:	83 ca 80             	or     $0xffffff80,%edx
  1015a1:	88 90 c5 80 00 00    	mov    %dl,0x80c5(%eax)
  1015a7:	c7 c2 28 26 10 00    	mov    $0x102628,%edx
  1015ad:	c1 ea 10             	shr    $0x10,%edx
  1015b0:	66 89 90 c6 80 00 00 	mov    %dx,0x80c6(%eax)
  1015b7:	c7 c2 32 26 10 00    	mov    $0x102632,%edx
  1015bd:	66 89 90 c8 80 00 00 	mov    %dx,0x80c8(%eax)
  1015c4:	66 c7 80 ca 80 00 00 	movw   $0x8,0x80ca(%eax)
  1015cb:	08 00 
  1015cd:	0f b6 90 cc 80 00 00 	movzbl 0x80cc(%eax),%edx
  1015d4:	83 e2 e0             	and    $0xffffffe0,%edx
  1015d7:	88 90 cc 80 00 00    	mov    %dl,0x80cc(%eax)
  1015dd:	0f b6 90 cc 80 00 00 	movzbl 0x80cc(%eax),%edx
  1015e4:	83 e2 1f             	and    $0x1f,%edx
  1015e7:	88 90 cc 80 00 00    	mov    %dl,0x80cc(%eax)
  1015ed:	0f b6 90 cd 80 00 00 	movzbl 0x80cd(%eax),%edx
  1015f4:	83 e2 f0             	and    $0xfffffff0,%edx
  1015f7:	83 ca 0e             	or     $0xe,%edx
  1015fa:	88 90 cd 80 00 00    	mov    %dl,0x80cd(%eax)
  101600:	0f b6 90 cd 80 00 00 	movzbl 0x80cd(%eax),%edx
  101607:	83 e2 ef             	and    $0xffffffef,%edx
  10160a:	88 90 cd 80 00 00    	mov    %dl,0x80cd(%eax)
  101610:	0f b6 90 cd 80 00 00 	movzbl 0x80cd(%eax),%edx
  101617:	83 e2 9f             	and    $0xffffff9f,%edx
  10161a:	88 90 cd 80 00 00    	mov    %dl,0x80cd(%eax)
  101620:	0f b6 90 cd 80 00 00 	movzbl 0x80cd(%eax),%edx
  101627:	83 ca 80             	or     $0xffffff80,%edx
  10162a:	88 90 cd 80 00 00    	mov    %dl,0x80cd(%eax)
  101630:	c7 c2 32 26 10 00    	mov    $0x102632,%edx
  101636:	c1 ea 10             	shr    $0x10,%edx
  101639:	66 89 90 ce 80 00 00 	mov    %dx,0x80ce(%eax)
  101640:	c7 c2 3c 26 10 00    	mov    $0x10263c,%edx
  101646:	66 89 90 d0 80 00 00 	mov    %dx,0x80d0(%eax)
  10164d:	66 c7 80 d2 80 00 00 	movw   $0x8,0x80d2(%eax)
  101654:	08 00 
  101656:	0f b6 90 d4 80 00 00 	movzbl 0x80d4(%eax),%edx
  10165d:	83 e2 e0             	and    $0xffffffe0,%edx
  101660:	88 90 d4 80 00 00    	mov    %dl,0x80d4(%eax)
  101666:	0f b6 90 d4 80 00 00 	movzbl 0x80d4(%eax),%edx
  10166d:	83 e2 1f             	and    $0x1f,%edx
  101670:	88 90 d4 80 00 00    	mov    %dl,0x80d4(%eax)
  101676:	0f b6 90 d5 80 00 00 	movzbl 0x80d5(%eax),%edx
  10167d:	83 e2 f0             	and    $0xfffffff0,%edx
  101680:	83 ca 0e             	or     $0xe,%edx
  101683:	88 90 d5 80 00 00    	mov    %dl,0x80d5(%eax)
  101689:	0f b6 90 d5 80 00 00 	movzbl 0x80d5(%eax),%edx
  101690:	83 e2 ef             	and    $0xffffffef,%edx
  101693:	88 90 d5 80 00 00    	mov    %dl,0x80d5(%eax)
  101699:	0f b6 90 d5 80 00 00 	movzbl 0x80d5(%eax),%edx
  1016a0:	83 e2 9f             	and    $0xffffff9f,%edx
  1016a3:	88 90 d5 80 00 00    	mov    %dl,0x80d5(%eax)
  1016a9:	0f b6 90 d5 80 00 00 	movzbl 0x80d5(%eax),%edx
  1016b0:	83 ca 80             	or     $0xffffff80,%edx
  1016b3:	88 90 d5 80 00 00    	mov    %dl,0x80d5(%eax)
  1016b9:	c7 c2 3c 26 10 00    	mov    $0x10263c,%edx
  1016bf:	c1 ea 10             	shr    $0x10,%edx
  1016c2:	66 89 90 d6 80 00 00 	mov    %dx,0x80d6(%eax)
  1016c9:	c7 c2 46 26 10 00    	mov    $0x102646,%edx
  1016cf:	66 89 90 d8 80 00 00 	mov    %dx,0x80d8(%eax)
  1016d6:	66 c7 80 da 80 00 00 	movw   $0x8,0x80da(%eax)
  1016dd:	08 00 
  1016df:	0f b6 90 dc 80 00 00 	movzbl 0x80dc(%eax),%edx
  1016e6:	83 e2 e0             	and    $0xffffffe0,%edx
  1016e9:	88 90 dc 80 00 00    	mov    %dl,0x80dc(%eax)
  1016ef:	0f b6 90 dc 80 00 00 	movzbl 0x80dc(%eax),%edx
  1016f6:	83 e2 1f             	and    $0x1f,%edx
  1016f9:	88 90 dc 80 00 00    	mov    %dl,0x80dc(%eax)
  1016ff:	0f b6 90 dd 80 00 00 	movzbl 0x80dd(%eax),%edx
  101706:	83 e2 f0             	and    $0xfffffff0,%edx
  101709:	83 ca 0e             	or     $0xe,%edx
  10170c:	88 90 dd 80 00 00    	mov    %dl,0x80dd(%eax)
  101712:	0f b6 90 dd 80 00 00 	movzbl 0x80dd(%eax),%edx
  101719:	83 e2 ef             	and    $0xffffffef,%edx
  10171c:	88 90 dd 80 00 00    	mov    %dl,0x80dd(%eax)
  101722:	0f b6 90 dd 80 00 00 	movzbl 0x80dd(%eax),%edx
  101729:	83 e2 9f             	and    $0xffffff9f,%edx
  10172c:	88 90 dd 80 00 00    	mov    %dl,0x80dd(%eax)
  101732:	0f b6 90 dd 80 00 00 	movzbl 0x80dd(%eax),%edx
  101739:	83 ca 80             	or     $0xffffff80,%edx
  10173c:	88 90 dd 80 00 00    	mov    %dl,0x80dd(%eax)
  101742:	c7 c2 46 26 10 00    	mov    $0x102646,%edx
  101748:	c1 ea 10             	shr    $0x10,%edx
  10174b:	66 89 90 de 80 00 00 	mov    %dx,0x80de(%eax)
  101752:	c7 c2 50 26 10 00    	mov    $0x102650,%edx
  101758:	66 89 90 e0 80 00 00 	mov    %dx,0x80e0(%eax)
  10175f:	66 c7 80 e2 80 00 00 	movw   $0x8,0x80e2(%eax)
  101766:	08 00 
  101768:	0f b6 90 e4 80 00 00 	movzbl 0x80e4(%eax),%edx
  10176f:	83 e2 e0             	and    $0xffffffe0,%edx
  101772:	88 90 e4 80 00 00    	mov    %dl,0x80e4(%eax)
  101778:	0f b6 90 e4 80 00 00 	movzbl 0x80e4(%eax),%edx
  10177f:	83 e2 1f             	and    $0x1f,%edx
  101782:	88 90 e4 80 00 00    	mov    %dl,0x80e4(%eax)
  101788:	0f b6 90 e5 80 00 00 	movzbl 0x80e5(%eax),%edx
  10178f:	83 e2 f0             	and    $0xfffffff0,%edx
  101792:	83 ca 0e             	or     $0xe,%edx
  101795:	88 90 e5 80 00 00    	mov    %dl,0x80e5(%eax)
  10179b:	0f b6 90 e5 80 00 00 	movzbl 0x80e5(%eax),%edx
  1017a2:	83 e2 ef             	and    $0xffffffef,%edx
  1017a5:	88 90 e5 80 00 00    	mov    %dl,0x80e5(%eax)
  1017ab:	0f b6 90 e5 80 00 00 	movzbl 0x80e5(%eax),%edx
  1017b2:	83 e2 9f             	and    $0xffffff9f,%edx
  1017b5:	88 90 e5 80 00 00    	mov    %dl,0x80e5(%eax)
  1017bb:	0f b6 90 e5 80 00 00 	movzbl 0x80e5(%eax),%edx
  1017c2:	83 ca 80             	or     $0xffffff80,%edx
  1017c5:	88 90 e5 80 00 00    	mov    %dl,0x80e5(%eax)
  1017cb:	c7 c2 50 26 10 00    	mov    $0x102650,%edx
  1017d1:	c1 ea 10             	shr    $0x10,%edx
  1017d4:	66 89 90 e6 80 00 00 	mov    %dx,0x80e6(%eax)
  1017db:	c7 c2 62 26 10 00    	mov    $0x102662,%edx
  1017e1:	66 89 90 f0 80 00 00 	mov    %dx,0x80f0(%eax)
  1017e8:	66 c7 80 f2 80 00 00 	movw   $0x8,0x80f2(%eax)
  1017ef:	08 00 
  1017f1:	0f b6 90 f4 80 00 00 	movzbl 0x80f4(%eax),%edx
  1017f8:	83 e2 e0             	and    $0xffffffe0,%edx
  1017fb:	88 90 f4 80 00 00    	mov    %dl,0x80f4(%eax)
  101801:	0f b6 90 f4 80 00 00 	movzbl 0x80f4(%eax),%edx
  101808:	83 e2 1f             	and    $0x1f,%edx
  10180b:	88 90 f4 80 00 00    	mov    %dl,0x80f4(%eax)
  101811:	0f b6 90 f5 80 00 00 	movzbl 0x80f5(%eax),%edx
  101818:	83 e2 f0             	and    $0xfffffff0,%edx
  10181b:	83 ca 0e             	or     $0xe,%edx
  10181e:	88 90 f5 80 00 00    	mov    %dl,0x80f5(%eax)
  101824:	0f b6 90 f5 80 00 00 	movzbl 0x80f5(%eax),%edx
  10182b:	83 e2 ef             	and    $0xffffffef,%edx
  10182e:	88 90 f5 80 00 00    	mov    %dl,0x80f5(%eax)
  101834:	0f b6 90 f5 80 00 00 	movzbl 0x80f5(%eax),%edx
  10183b:	83 e2 9f             	and    $0xffffff9f,%edx
  10183e:	88 90 f5 80 00 00    	mov    %dl,0x80f5(%eax)
  101844:	0f b6 90 f5 80 00 00 	movzbl 0x80f5(%eax),%edx
  10184b:	83 ca 80             	or     $0xffffff80,%edx
  10184e:	88 90 f5 80 00 00    	mov    %dl,0x80f5(%eax)
  101854:	c7 c2 62 26 10 00    	mov    $0x102662,%edx
  10185a:	c1 ea 10             	shr    $0x10,%edx
  10185d:	66 89 90 f6 80 00 00 	mov    %dx,0x80f6(%eax)
  101864:	c7 c2 6a 26 10 00    	mov    $0x10266a,%edx
  10186a:	66 89 90 f8 80 00 00 	mov    %dx,0x80f8(%eax)
  101871:	66 c7 80 fa 80 00 00 	movw   $0x8,0x80fa(%eax)
  101878:	08 00 
  10187a:	0f b6 90 fc 80 00 00 	movzbl 0x80fc(%eax),%edx
  101881:	83 e2 e0             	and    $0xffffffe0,%edx
  101884:	88 90 fc 80 00 00    	mov    %dl,0x80fc(%eax)
  10188a:	0f b6 90 fc 80 00 00 	movzbl 0x80fc(%eax),%edx
  101891:	83 e2 1f             	and    $0x1f,%edx
  101894:	88 90 fc 80 00 00    	mov    %dl,0x80fc(%eax)
  10189a:	0f b6 90 fd 80 00 00 	movzbl 0x80fd(%eax),%edx
  1018a1:	83 e2 f0             	and    $0xfffffff0,%edx
  1018a4:	83 ca 0e             	or     $0xe,%edx
  1018a7:	88 90 fd 80 00 00    	mov    %dl,0x80fd(%eax)
  1018ad:	0f b6 90 fd 80 00 00 	movzbl 0x80fd(%eax),%edx
  1018b4:	83 e2 ef             	and    $0xffffffef,%edx
  1018b7:	88 90 fd 80 00 00    	mov    %dl,0x80fd(%eax)
  1018bd:	0f b6 90 fd 80 00 00 	movzbl 0x80fd(%eax),%edx
  1018c4:	83 e2 9f             	and    $0xffffff9f,%edx
  1018c7:	88 90 fd 80 00 00    	mov    %dl,0x80fd(%eax)
  1018cd:	0f b6 90 fd 80 00 00 	movzbl 0x80fd(%eax),%edx
  1018d4:	83 ca 80             	or     $0xffffff80,%edx
  1018d7:	88 90 fd 80 00 00    	mov    %dl,0x80fd(%eax)
  1018dd:	c7 c2 6a 26 10 00    	mov    $0x10266a,%edx
  1018e3:	c1 ea 10             	shr    $0x10,%edx
  1018e6:	66 89 90 fe 80 00 00 	mov    %dx,0x80fe(%eax)
  1018ed:	c7 c2 72 26 10 00    	mov    $0x102672,%edx
  1018f3:	66 89 90 00 81 00 00 	mov    %dx,0x8100(%eax)
  1018fa:	66 c7 80 02 81 00 00 	movw   $0x8,0x8102(%eax)
  101901:	08 00 
  101903:	0f b6 90 04 81 00 00 	movzbl 0x8104(%eax),%edx
  10190a:	83 e2 e0             	and    $0xffffffe0,%edx
  10190d:	88 90 04 81 00 00    	mov    %dl,0x8104(%eax)
  101913:	0f b6 90 04 81 00 00 	movzbl 0x8104(%eax),%edx
  10191a:	83 e2 1f             	and    $0x1f,%edx
  10191d:	88 90 04 81 00 00    	mov    %dl,0x8104(%eax)
  101923:	0f b6 90 05 81 00 00 	movzbl 0x8105(%eax),%edx
  10192a:	83 e2 f0             	and    $0xfffffff0,%edx
  10192d:	83 ca 0e             	or     $0xe,%edx
  101930:	88 90 05 81 00 00    	mov    %dl,0x8105(%eax)
  101936:	0f b6 90 05 81 00 00 	movzbl 0x8105(%eax),%edx
  10193d:	83 e2 ef             	and    $0xffffffef,%edx
  101940:	88 90 05 81 00 00    	mov    %dl,0x8105(%eax)
  101946:	0f b6 90 05 81 00 00 	movzbl 0x8105(%eax),%edx
  10194d:	83 e2 9f             	and    $0xffffff9f,%edx
  101950:	88 90 05 81 00 00    	mov    %dl,0x8105(%eax)
  101956:	0f b6 90 05 81 00 00 	movzbl 0x8105(%eax),%edx
  10195d:	83 ca 80             	or     $0xffffff80,%edx
  101960:	88 90 05 81 00 00    	mov    %dl,0x8105(%eax)
  101966:	c7 c2 72 26 10 00    	mov    $0x102672,%edx
  10196c:	c1 ea 10             	shr    $0x10,%edx
  10196f:	66 89 90 06 81 00 00 	mov    %dx,0x8106(%eax)
  101976:	c7 c2 7a 26 10 00    	mov    $0x10267a,%edx
  10197c:	66 89 90 08 81 00 00 	mov    %dx,0x8108(%eax)
  101983:	66 c7 80 0a 81 00 00 	movw   $0x8,0x810a(%eax)
  10198a:	08 00 
  10198c:	0f b6 90 0c 81 00 00 	movzbl 0x810c(%eax),%edx
  101993:	83 e2 e0             	and    $0xffffffe0,%edx
  101996:	88 90 0c 81 00 00    	mov    %dl,0x810c(%eax)
  10199c:	0f b6 90 0c 81 00 00 	movzbl 0x810c(%eax),%edx
  1019a3:	83 e2 1f             	and    $0x1f,%edx
  1019a6:	88 90 0c 81 00 00    	mov    %dl,0x810c(%eax)
  1019ac:	0f b6 90 0d 81 00 00 	movzbl 0x810d(%eax),%edx
  1019b3:	83 e2 f0             	and    $0xfffffff0,%edx
  1019b6:	83 ca 0e             	or     $0xe,%edx
  1019b9:	88 90 0d 81 00 00    	mov    %dl,0x810d(%eax)
  1019bf:	0f b6 90 0d 81 00 00 	movzbl 0x810d(%eax),%edx
  1019c6:	83 e2 ef             	and    $0xffffffef,%edx
  1019c9:	88 90 0d 81 00 00    	mov    %dl,0x810d(%eax)
  1019cf:	0f b6 90 0d 81 00 00 	movzbl 0x810d(%eax),%edx
  1019d6:	83 e2 9f             	and    $0xffffff9f,%edx
  1019d9:	88 90 0d 81 00 00    	mov    %dl,0x810d(%eax)
  1019df:	0f b6 90 0d 81 00 00 	movzbl 0x810d(%eax),%edx
  1019e6:	83 ca 80             	or     $0xffffff80,%edx
  1019e9:	88 90 0d 81 00 00    	mov    %dl,0x810d(%eax)
  1019ef:	c7 c2 7a 26 10 00    	mov    $0x10267a,%edx
  1019f5:	c1 ea 10             	shr    $0x10,%edx
  1019f8:	66 89 90 0e 81 00 00 	mov    %dx,0x810e(%eax)
  1019ff:	c7 c2 82 26 10 00    	mov    $0x102682,%edx
  101a05:	66 89 90 10 81 00 00 	mov    %dx,0x8110(%eax)
  101a0c:	66 c7 80 12 81 00 00 	movw   $0x8,0x8112(%eax)
  101a13:	08 00 
  101a15:	0f b6 90 14 81 00 00 	movzbl 0x8114(%eax),%edx
  101a1c:	83 e2 e0             	and    $0xffffffe0,%edx
  101a1f:	88 90 14 81 00 00    	mov    %dl,0x8114(%eax)
  101a25:	0f b6 90 14 81 00 00 	movzbl 0x8114(%eax),%edx
  101a2c:	83 e2 1f             	and    $0x1f,%edx
  101a2f:	88 90 14 81 00 00    	mov    %dl,0x8114(%eax)
  101a35:	0f b6 90 15 81 00 00 	movzbl 0x8115(%eax),%edx
  101a3c:	83 e2 f0             	and    $0xfffffff0,%edx
  101a3f:	83 ca 0e             	or     $0xe,%edx
  101a42:	88 90 15 81 00 00    	mov    %dl,0x8115(%eax)
  101a48:	0f b6 90 15 81 00 00 	movzbl 0x8115(%eax),%edx
  101a4f:	83 e2 ef             	and    $0xffffffef,%edx
  101a52:	88 90 15 81 00 00    	mov    %dl,0x8115(%eax)
  101a58:	0f b6 90 15 81 00 00 	movzbl 0x8115(%eax),%edx
  101a5f:	83 e2 9f             	and    $0xffffff9f,%edx
  101a62:	88 90 15 81 00 00    	mov    %dl,0x8115(%eax)
  101a68:	0f b6 90 15 81 00 00 	movzbl 0x8115(%eax),%edx
  101a6f:	83 ca 80             	or     $0xffffff80,%edx
  101a72:	88 90 15 81 00 00    	mov    %dl,0x8115(%eax)
  101a78:	c7 c2 82 26 10 00    	mov    $0x102682,%edx
  101a7e:	c1 ea 10             	shr    $0x10,%edx
  101a81:	66 89 90 16 81 00 00 	mov    %dx,0x8116(%eax)
  101a88:	c7 c2 94 26 10 00    	mov    $0x102694,%edx
  101a8e:	66 89 90 20 81 00 00 	mov    %dx,0x8120(%eax)
  101a95:	66 c7 80 22 81 00 00 	movw   $0x8,0x8122(%eax)
  101a9c:	08 00 
  101a9e:	0f b6 90 24 81 00 00 	movzbl 0x8124(%eax),%edx
  101aa5:	83 e2 e0             	and    $0xffffffe0,%edx
  101aa8:	88 90 24 81 00 00    	mov    %dl,0x8124(%eax)
  101aae:	0f b6 90 24 81 00 00 	movzbl 0x8124(%eax),%edx
  101ab5:	83 e2 1f             	and    $0x1f,%edx
  101ab8:	88 90 24 81 00 00    	mov    %dl,0x8124(%eax)
  101abe:	0f b6 90 25 81 00 00 	movzbl 0x8125(%eax),%edx
  101ac5:	83 e2 f0             	and    $0xfffffff0,%edx
  101ac8:	83 ca 0e             	or     $0xe,%edx
  101acb:	88 90 25 81 00 00    	mov    %dl,0x8125(%eax)
  101ad1:	0f b6 90 25 81 00 00 	movzbl 0x8125(%eax),%edx
  101ad8:	83 e2 ef             	and    $0xffffffef,%edx
  101adb:	88 90 25 81 00 00    	mov    %dl,0x8125(%eax)
  101ae1:	0f b6 90 25 81 00 00 	movzbl 0x8125(%eax),%edx
  101ae8:	83 e2 9f             	and    $0xffffff9f,%edx
  101aeb:	88 90 25 81 00 00    	mov    %dl,0x8125(%eax)
  101af1:	0f b6 90 25 81 00 00 	movzbl 0x8125(%eax),%edx
  101af8:	83 ca 80             	or     $0xffffff80,%edx
  101afb:	88 90 25 81 00 00    	mov    %dl,0x8125(%eax)
  101b01:	c7 c2 94 26 10 00    	mov    $0x102694,%edx
  101b07:	c1 ea 10             	shr    $0x10,%edx
  101b0a:	66 89 90 26 81 00 00 	mov    %dx,0x8126(%eax)
  101b11:	c7 c2 9e 26 10 00    	mov    $0x10269e,%edx
  101b17:	66 89 90 28 81 00 00 	mov    %dx,0x8128(%eax)
  101b1e:	66 c7 80 2a 81 00 00 	movw   $0x8,0x812a(%eax)
  101b25:	08 00 
  101b27:	0f b6 90 2c 81 00 00 	movzbl 0x812c(%eax),%edx
  101b2e:	83 e2 e0             	and    $0xffffffe0,%edx
  101b31:	88 90 2c 81 00 00    	mov    %dl,0x812c(%eax)
  101b37:	0f b6 90 2c 81 00 00 	movzbl 0x812c(%eax),%edx
  101b3e:	83 e2 1f             	and    $0x1f,%edx
  101b41:	88 90 2c 81 00 00    	mov    %dl,0x812c(%eax)
  101b47:	0f b6 90 2d 81 00 00 	movzbl 0x812d(%eax),%edx
  101b4e:	83 e2 f0             	and    $0xfffffff0,%edx
  101b51:	83 ca 0e             	or     $0xe,%edx
  101b54:	88 90 2d 81 00 00    	mov    %dl,0x812d(%eax)
  101b5a:	0f b6 90 2d 81 00 00 	movzbl 0x812d(%eax),%edx
  101b61:	83 e2 ef             	and    $0xffffffef,%edx
  101b64:	88 90 2d 81 00 00    	mov    %dl,0x812d(%eax)
  101b6a:	0f b6 90 2d 81 00 00 	movzbl 0x812d(%eax),%edx
  101b71:	83 e2 9f             	and    $0xffffff9f,%edx
  101b74:	88 90 2d 81 00 00    	mov    %dl,0x812d(%eax)
  101b7a:	0f b6 90 2d 81 00 00 	movzbl 0x812d(%eax),%edx
  101b81:	83 ca 80             	or     $0xffffff80,%edx
  101b84:	88 90 2d 81 00 00    	mov    %dl,0x812d(%eax)
  101b8a:	c7 c2 9e 26 10 00    	mov    $0x10269e,%edx
  101b90:	c1 ea 10             	shr    $0x10,%edx
  101b93:	66 89 90 2e 81 00 00 	mov    %dx,0x812e(%eax)
  101b9a:	c7 c2 a6 26 10 00    	mov    $0x1026a6,%edx
  101ba0:	66 89 90 30 81 00 00 	mov    %dx,0x8130(%eax)
  101ba7:	66 c7 80 32 81 00 00 	movw   $0x8,0x8132(%eax)
  101bae:	08 00 
  101bb0:	0f b6 90 34 81 00 00 	movzbl 0x8134(%eax),%edx
  101bb7:	83 e2 e0             	and    $0xffffffe0,%edx
  101bba:	88 90 34 81 00 00    	mov    %dl,0x8134(%eax)
  101bc0:	0f b6 90 34 81 00 00 	movzbl 0x8134(%eax),%edx
  101bc7:	83 e2 1f             	and    $0x1f,%edx
  101bca:	88 90 34 81 00 00    	mov    %dl,0x8134(%eax)
  101bd0:	0f b6 90 35 81 00 00 	movzbl 0x8135(%eax),%edx
  101bd7:	83 e2 f0             	and    $0xfffffff0,%edx
  101bda:	83 ca 0e             	or     $0xe,%edx
  101bdd:	88 90 35 81 00 00    	mov    %dl,0x8135(%eax)
  101be3:	0f b6 90 35 81 00 00 	movzbl 0x8135(%eax),%edx
  101bea:	83 e2 ef             	and    $0xffffffef,%edx
  101bed:	88 90 35 81 00 00    	mov    %dl,0x8135(%eax)
  101bf3:	0f b6 90 35 81 00 00 	movzbl 0x8135(%eax),%edx
  101bfa:	83 e2 9f             	and    $0xffffff9f,%edx
  101bfd:	88 90 35 81 00 00    	mov    %dl,0x8135(%eax)
  101c03:	0f b6 90 35 81 00 00 	movzbl 0x8135(%eax),%edx
  101c0a:	83 ca 80             	or     $0xffffff80,%edx
  101c0d:	88 90 35 81 00 00    	mov    %dl,0x8135(%eax)
  101c13:	c7 c2 a6 26 10 00    	mov    $0x1026a6,%edx
  101c19:	c1 ea 10             	shr    $0x10,%edx
  101c1c:	66 89 90 36 81 00 00 	mov    %dx,0x8136(%eax)
  101c23:	c7 c2 b0 26 10 00    	mov    $0x1026b0,%edx
  101c29:	66 89 90 a0 81 00 00 	mov    %dx,0x81a0(%eax)
  101c30:	66 c7 80 a2 81 00 00 	movw   $0x8,0x81a2(%eax)
  101c37:	08 00 
  101c39:	0f b6 90 a4 81 00 00 	movzbl 0x81a4(%eax),%edx
  101c40:	83 e2 e0             	and    $0xffffffe0,%edx
  101c43:	88 90 a4 81 00 00    	mov    %dl,0x81a4(%eax)
  101c49:	0f b6 90 a4 81 00 00 	movzbl 0x81a4(%eax),%edx
  101c50:	83 e2 1f             	and    $0x1f,%edx
  101c53:	88 90 a4 81 00 00    	mov    %dl,0x81a4(%eax)
  101c59:	0f b6 90 a5 81 00 00 	movzbl 0x81a5(%eax),%edx
  101c60:	83 e2 f0             	and    $0xfffffff0,%edx
  101c63:	83 ca 0e             	or     $0xe,%edx
  101c66:	88 90 a5 81 00 00    	mov    %dl,0x81a5(%eax)
  101c6c:	0f b6 90 a5 81 00 00 	movzbl 0x81a5(%eax),%edx
  101c73:	83 e2 ef             	and    $0xffffffef,%edx
  101c76:	88 90 a5 81 00 00    	mov    %dl,0x81a5(%eax)
  101c7c:	0f b6 90 a5 81 00 00 	movzbl 0x81a5(%eax),%edx
  101c83:	83 e2 9f             	and    $0xffffff9f,%edx
  101c86:	88 90 a5 81 00 00    	mov    %dl,0x81a5(%eax)
  101c8c:	0f b6 90 a5 81 00 00 	movzbl 0x81a5(%eax),%edx
  101c93:	83 ca 80             	or     $0xffffff80,%edx
  101c96:	88 90 a5 81 00 00    	mov    %dl,0x81a5(%eax)
  101c9c:	c7 c2 b0 26 10 00    	mov    $0x1026b0,%edx
  101ca2:	c1 ea 10             	shr    $0x10,%edx
  101ca5:	66 89 90 a6 81 00 00 	mov    %dx,0x81a6(%eax)
  101cac:	c7 c2 ba 26 10 00    	mov    $0x1026ba,%edx
  101cb2:	66 89 90 a8 81 00 00 	mov    %dx,0x81a8(%eax)
  101cb9:	66 c7 80 aa 81 00 00 	movw   $0x8,0x81aa(%eax)
  101cc0:	08 00 
  101cc2:	0f b6 90 ac 81 00 00 	movzbl 0x81ac(%eax),%edx
  101cc9:	83 e2 e0             	and    $0xffffffe0,%edx
  101ccc:	88 90 ac 81 00 00    	mov    %dl,0x81ac(%eax)
  101cd2:	0f b6 90 ac 81 00 00 	movzbl 0x81ac(%eax),%edx
  101cd9:	83 e2 1f             	and    $0x1f,%edx
  101cdc:	88 90 ac 81 00 00    	mov    %dl,0x81ac(%eax)
  101ce2:	0f b6 90 ad 81 00 00 	movzbl 0x81ad(%eax),%edx
  101ce9:	83 e2 f0             	and    $0xfffffff0,%edx
  101cec:	83 ca 0e             	or     $0xe,%edx
  101cef:	88 90 ad 81 00 00    	mov    %dl,0x81ad(%eax)
  101cf5:	0f b6 90 ad 81 00 00 	movzbl 0x81ad(%eax),%edx
  101cfc:	83 e2 ef             	and    $0xffffffef,%edx
  101cff:	88 90 ad 81 00 00    	mov    %dl,0x81ad(%eax)
  101d05:	0f b6 90 ad 81 00 00 	movzbl 0x81ad(%eax),%edx
  101d0c:	83 e2 9f             	and    $0xffffff9f,%edx
  101d0f:	88 90 ad 81 00 00    	mov    %dl,0x81ad(%eax)
  101d15:	0f b6 90 ad 81 00 00 	movzbl 0x81ad(%eax),%edx
  101d1c:	83 ca 80             	or     $0xffffff80,%edx
  101d1f:	88 90 ad 81 00 00    	mov    %dl,0x81ad(%eax)
  101d25:	c7 c2 ba 26 10 00    	mov    $0x1026ba,%edx
  101d2b:	c1 ea 10             	shr    $0x10,%edx
  101d2e:	66 89 90 ae 81 00 00 	mov    %dx,0x81ae(%eax)
  101d35:	c7 c2 c4 26 10 00    	mov    $0x1026c4,%edx
  101d3b:	66 89 90 b0 81 00 00 	mov    %dx,0x81b0(%eax)
  101d42:	66 c7 80 b2 81 00 00 	movw   $0x8,0x81b2(%eax)
  101d49:	08 00 
  101d4b:	0f b6 90 b4 81 00 00 	movzbl 0x81b4(%eax),%edx
  101d52:	83 e2 e0             	and    $0xffffffe0,%edx
  101d55:	88 90 b4 81 00 00    	mov    %dl,0x81b4(%eax)
  101d5b:	0f b6 90 b4 81 00 00 	movzbl 0x81b4(%eax),%edx
  101d62:	83 e2 1f             	and    $0x1f,%edx
  101d65:	88 90 b4 81 00 00    	mov    %dl,0x81b4(%eax)
  101d6b:	0f b6 90 b5 81 00 00 	movzbl 0x81b5(%eax),%edx
  101d72:	83 e2 f0             	and    $0xfffffff0,%edx
  101d75:	83 ca 0e             	or     $0xe,%edx
  101d78:	88 90 b5 81 00 00    	mov    %dl,0x81b5(%eax)
  101d7e:	0f b6 90 b5 81 00 00 	movzbl 0x81b5(%eax),%edx
  101d85:	83 e2 ef             	and    $0xffffffef,%edx
  101d88:	88 90 b5 81 00 00    	mov    %dl,0x81b5(%eax)
  101d8e:	0f b6 90 b5 81 00 00 	movzbl 0x81b5(%eax),%edx
  101d95:	83 e2 9f             	and    $0xffffff9f,%edx
  101d98:	88 90 b5 81 00 00    	mov    %dl,0x81b5(%eax)
  101d9e:	0f b6 90 b5 81 00 00 	movzbl 0x81b5(%eax),%edx
  101da5:	83 ca 80             	or     $0xffffff80,%edx
  101da8:	88 90 b5 81 00 00    	mov    %dl,0x81b5(%eax)
  101dae:	c7 c2 c4 26 10 00    	mov    $0x1026c4,%edx
  101db4:	c1 ea 10             	shr    $0x10,%edx
  101db7:	66 89 90 b6 81 00 00 	mov    %dx,0x81b6(%eax)
  101dbe:	c7 c2 ce 26 10 00    	mov    $0x1026ce,%edx
  101dc4:	66 89 90 b8 81 00 00 	mov    %dx,0x81b8(%eax)
  101dcb:	66 c7 80 ba 81 00 00 	movw   $0x8,0x81ba(%eax)
  101dd2:	08 00 
  101dd4:	0f b6 90 bc 81 00 00 	movzbl 0x81bc(%eax),%edx
  101ddb:	83 e2 e0             	and    $0xffffffe0,%edx
  101dde:	88 90 bc 81 00 00    	mov    %dl,0x81bc(%eax)
  101de4:	0f b6 90 bc 81 00 00 	movzbl 0x81bc(%eax),%edx
  101deb:	83 e2 1f             	and    $0x1f,%edx
  101dee:	88 90 bc 81 00 00    	mov    %dl,0x81bc(%eax)
  101df4:	0f b6 90 bd 81 00 00 	movzbl 0x81bd(%eax),%edx
  101dfb:	83 e2 f0             	and    $0xfffffff0,%edx
  101dfe:	83 ca 0e             	or     $0xe,%edx
  101e01:	88 90 bd 81 00 00    	mov    %dl,0x81bd(%eax)
  101e07:	0f b6 90 bd 81 00 00 	movzbl 0x81bd(%eax),%edx
  101e0e:	83 e2 ef             	and    $0xffffffef,%edx
  101e11:	88 90 bd 81 00 00    	mov    %dl,0x81bd(%eax)
  101e17:	0f b6 90 bd 81 00 00 	movzbl 0x81bd(%eax),%edx
  101e1e:	83 e2 9f             	and    $0xffffff9f,%edx
  101e21:	88 90 bd 81 00 00    	mov    %dl,0x81bd(%eax)
  101e27:	0f b6 90 bd 81 00 00 	movzbl 0x81bd(%eax),%edx
  101e2e:	83 ca 80             	or     $0xffffff80,%edx
  101e31:	88 90 bd 81 00 00    	mov    %dl,0x81bd(%eax)
  101e37:	c7 c2 ce 26 10 00    	mov    $0x1026ce,%edx
  101e3d:	c1 ea 10             	shr    $0x10,%edx
  101e40:	66 89 90 be 81 00 00 	mov    %dx,0x81be(%eax)
  101e47:	c7 c2 d8 26 10 00    	mov    $0x1026d8,%edx
  101e4d:	66 89 90 c0 81 00 00 	mov    %dx,0x81c0(%eax)
  101e54:	66 c7 80 c2 81 00 00 	movw   $0x8,0x81c2(%eax)
  101e5b:	08 00 
  101e5d:	0f b6 90 c4 81 00 00 	movzbl 0x81c4(%eax),%edx
  101e64:	83 e2 e0             	and    $0xffffffe0,%edx
  101e67:	88 90 c4 81 00 00    	mov    %dl,0x81c4(%eax)
  101e6d:	0f b6 90 c4 81 00 00 	movzbl 0x81c4(%eax),%edx
  101e74:	83 e2 1f             	and    $0x1f,%edx
  101e77:	88 90 c4 81 00 00    	mov    %dl,0x81c4(%eax)
  101e7d:	0f b6 90 c5 81 00 00 	movzbl 0x81c5(%eax),%edx
  101e84:	83 e2 f0             	and    $0xfffffff0,%edx
  101e87:	83 ca 0e             	or     $0xe,%edx
  101e8a:	88 90 c5 81 00 00    	mov    %dl,0x81c5(%eax)
  101e90:	0f b6 90 c5 81 00 00 	movzbl 0x81c5(%eax),%edx
  101e97:	83 e2 ef             	and    $0xffffffef,%edx
  101e9a:	88 90 c5 81 00 00    	mov    %dl,0x81c5(%eax)
  101ea0:	0f b6 90 c5 81 00 00 	movzbl 0x81c5(%eax),%edx
  101ea7:	83 e2 9f             	and    $0xffffff9f,%edx
  101eaa:	88 90 c5 81 00 00    	mov    %dl,0x81c5(%eax)
  101eb0:	0f b6 90 c5 81 00 00 	movzbl 0x81c5(%eax),%edx
  101eb7:	83 ca 80             	or     $0xffffff80,%edx
  101eba:	88 90 c5 81 00 00    	mov    %dl,0x81c5(%eax)
  101ec0:	c7 c2 d8 26 10 00    	mov    $0x1026d8,%edx
  101ec6:	c1 ea 10             	shr    $0x10,%edx
  101ec9:	66 89 90 c6 81 00 00 	mov    %dx,0x81c6(%eax)
  101ed0:	c7 c2 e2 26 10 00    	mov    $0x1026e2,%edx
  101ed6:	66 89 90 c8 81 00 00 	mov    %dx,0x81c8(%eax)
  101edd:	66 c7 80 ca 81 00 00 	movw   $0x8,0x81ca(%eax)
  101ee4:	08 00 
  101ee6:	0f b6 90 cc 81 00 00 	movzbl 0x81cc(%eax),%edx
  101eed:	83 e2 e0             	and    $0xffffffe0,%edx
  101ef0:	88 90 cc 81 00 00    	mov    %dl,0x81cc(%eax)
  101ef6:	0f b6 90 cc 81 00 00 	movzbl 0x81cc(%eax),%edx
  101efd:	83 e2 1f             	and    $0x1f,%edx
  101f00:	88 90 cc 81 00 00    	mov    %dl,0x81cc(%eax)
  101f06:	0f b6 90 cd 81 00 00 	movzbl 0x81cd(%eax),%edx
  101f0d:	83 e2 f0             	and    $0xfffffff0,%edx
  101f10:	83 ca 0e             	or     $0xe,%edx
  101f13:	88 90 cd 81 00 00    	mov    %dl,0x81cd(%eax)
  101f19:	0f b6 90 cd 81 00 00 	movzbl 0x81cd(%eax),%edx
  101f20:	83 e2 ef             	and    $0xffffffef,%edx
  101f23:	88 90 cd 81 00 00    	mov    %dl,0x81cd(%eax)
  101f29:	0f b6 90 cd 81 00 00 	movzbl 0x81cd(%eax),%edx
  101f30:	83 e2 9f             	and    $0xffffff9f,%edx
  101f33:	88 90 cd 81 00 00    	mov    %dl,0x81cd(%eax)
  101f39:	0f b6 90 cd 81 00 00 	movzbl 0x81cd(%eax),%edx
  101f40:	83 ca 80             	or     $0xffffff80,%edx
  101f43:	88 90 cd 81 00 00    	mov    %dl,0x81cd(%eax)
  101f49:	c7 c2 e2 26 10 00    	mov    $0x1026e2,%edx
  101f4f:	c1 ea 10             	shr    $0x10,%edx
  101f52:	66 89 90 ce 81 00 00 	mov    %dx,0x81ce(%eax)
  101f59:	c7 c2 ec 26 10 00    	mov    $0x1026ec,%edx
  101f5f:	66 89 90 d0 81 00 00 	mov    %dx,0x81d0(%eax)
  101f66:	66 c7 80 d2 81 00 00 	movw   $0x8,0x81d2(%eax)
  101f6d:	08 00 
  101f6f:	0f b6 90 d4 81 00 00 	movzbl 0x81d4(%eax),%edx
  101f76:	83 e2 e0             	and    $0xffffffe0,%edx
  101f79:	88 90 d4 81 00 00    	mov    %dl,0x81d4(%eax)
  101f7f:	0f b6 90 d4 81 00 00 	movzbl 0x81d4(%eax),%edx
  101f86:	83 e2 1f             	and    $0x1f,%edx
  101f89:	88 90 d4 81 00 00    	mov    %dl,0x81d4(%eax)
  101f8f:	0f b6 90 d5 81 00 00 	movzbl 0x81d5(%eax),%edx
  101f96:	83 e2 f0             	and    $0xfffffff0,%edx
  101f99:	83 ca 0e             	or     $0xe,%edx
  101f9c:	88 90 d5 81 00 00    	mov    %dl,0x81d5(%eax)
  101fa2:	0f b6 90 d5 81 00 00 	movzbl 0x81d5(%eax),%edx
  101fa9:	83 e2 ef             	and    $0xffffffef,%edx
  101fac:	88 90 d5 81 00 00    	mov    %dl,0x81d5(%eax)
  101fb2:	0f b6 90 d5 81 00 00 	movzbl 0x81d5(%eax),%edx
  101fb9:	83 e2 9f             	and    $0xffffff9f,%edx
  101fbc:	88 90 d5 81 00 00    	mov    %dl,0x81d5(%eax)
  101fc2:	0f b6 90 d5 81 00 00 	movzbl 0x81d5(%eax),%edx
  101fc9:	83 ca 80             	or     $0xffffff80,%edx
  101fcc:	88 90 d5 81 00 00    	mov    %dl,0x81d5(%eax)
  101fd2:	c7 c2 ec 26 10 00    	mov    $0x1026ec,%edx
  101fd8:	c1 ea 10             	shr    $0x10,%edx
  101fdb:	66 89 90 d6 81 00 00 	mov    %dx,0x81d6(%eax)
  101fe2:	c7 c2 f2 26 10 00    	mov    $0x1026f2,%edx
  101fe8:	66 89 90 d8 81 00 00 	mov    %dx,0x81d8(%eax)
  101fef:	66 c7 80 da 81 00 00 	movw   $0x8,0x81da(%eax)
  101ff6:	08 00 
  101ff8:	0f b6 90 dc 81 00 00 	movzbl 0x81dc(%eax),%edx
  101fff:	83 e2 e0             	and    $0xffffffe0,%edx
  102002:	88 90 dc 81 00 00    	mov    %dl,0x81dc(%eax)
  102008:	0f b6 90 dc 81 00 00 	movzbl 0x81dc(%eax),%edx
  10200f:	83 e2 1f             	and    $0x1f,%edx
  102012:	88 90 dc 81 00 00    	mov    %dl,0x81dc(%eax)
  102018:	0f b6 90 dd 81 00 00 	movzbl 0x81dd(%eax),%edx
  10201f:	83 e2 f0             	and    $0xfffffff0,%edx
  102022:	83 ca 0e             	or     $0xe,%edx
  102025:	88 90 dd 81 00 00    	mov    %dl,0x81dd(%eax)
  10202b:	0f b6 90 dd 81 00 00 	movzbl 0x81dd(%eax),%edx
  102032:	83 e2 ef             	and    $0xffffffef,%edx
  102035:	88 90 dd 81 00 00    	mov    %dl,0x81dd(%eax)
  10203b:	0f b6 90 dd 81 00 00 	movzbl 0x81dd(%eax),%edx
  102042:	83 e2 9f             	and    $0xffffff9f,%edx
  102045:	88 90 dd 81 00 00    	mov    %dl,0x81dd(%eax)
  10204b:	0f b6 90 dd 81 00 00 	movzbl 0x81dd(%eax),%edx
  102052:	83 ca 80             	or     $0xffffff80,%edx
  102055:	88 90 dd 81 00 00    	mov    %dl,0x81dd(%eax)
  10205b:	c7 c2 f2 26 10 00    	mov    $0x1026f2,%edx
  102061:	c1 ea 10             	shr    $0x10,%edx
  102064:	66 89 90 de 81 00 00 	mov    %dx,0x81de(%eax)
  10206b:	c7 c2 f8 26 10 00    	mov    $0x1026f8,%edx
  102071:	66 89 90 e0 81 00 00 	mov    %dx,0x81e0(%eax)
  102078:	66 c7 80 e2 81 00 00 	movw   $0x8,0x81e2(%eax)
  10207f:	08 00 
  102081:	0f b6 90 e4 81 00 00 	movzbl 0x81e4(%eax),%edx
  102088:	83 e2 e0             	and    $0xffffffe0,%edx
  10208b:	88 90 e4 81 00 00    	mov    %dl,0x81e4(%eax)
  102091:	0f b6 90 e4 81 00 00 	movzbl 0x81e4(%eax),%edx
  102098:	83 e2 1f             	and    $0x1f,%edx
  10209b:	88 90 e4 81 00 00    	mov    %dl,0x81e4(%eax)
  1020a1:	0f b6 90 e5 81 00 00 	movzbl 0x81e5(%eax),%edx
  1020a8:	83 e2 f0             	and    $0xfffffff0,%edx
  1020ab:	83 ca 0e             	or     $0xe,%edx
  1020ae:	88 90 e5 81 00 00    	mov    %dl,0x81e5(%eax)
  1020b4:	0f b6 90 e5 81 00 00 	movzbl 0x81e5(%eax),%edx
  1020bb:	83 e2 ef             	and    $0xffffffef,%edx
  1020be:	88 90 e5 81 00 00    	mov    %dl,0x81e5(%eax)
  1020c4:	0f b6 90 e5 81 00 00 	movzbl 0x81e5(%eax),%edx
  1020cb:	83 e2 9f             	and    $0xffffff9f,%edx
  1020ce:	88 90 e5 81 00 00    	mov    %dl,0x81e5(%eax)
  1020d4:	0f b6 90 e5 81 00 00 	movzbl 0x81e5(%eax),%edx
  1020db:	83 ca 80             	or     $0xffffff80,%edx
  1020de:	88 90 e5 81 00 00    	mov    %dl,0x81e5(%eax)
  1020e4:	c7 c2 f8 26 10 00    	mov    $0x1026f8,%edx
  1020ea:	c1 ea 10             	shr    $0x10,%edx
  1020ed:	66 89 90 e6 81 00 00 	mov    %dx,0x81e6(%eax)
  1020f4:	c7 c2 fe 26 10 00    	mov    $0x1026fe,%edx
  1020fa:	66 89 90 e8 81 00 00 	mov    %dx,0x81e8(%eax)
  102101:	66 c7 80 ea 81 00 00 	movw   $0x8,0x81ea(%eax)
  102108:	08 00 
  10210a:	0f b6 90 ec 81 00 00 	movzbl 0x81ec(%eax),%edx
  102111:	83 e2 e0             	and    $0xffffffe0,%edx
  102114:	88 90 ec 81 00 00    	mov    %dl,0x81ec(%eax)
  10211a:	0f b6 90 ec 81 00 00 	movzbl 0x81ec(%eax),%edx
  102121:	83 e2 1f             	and    $0x1f,%edx
  102124:	88 90 ec 81 00 00    	mov    %dl,0x81ec(%eax)
  10212a:	0f b6 90 ed 81 00 00 	movzbl 0x81ed(%eax),%edx
  102131:	83 e2 f0             	and    $0xfffffff0,%edx
  102134:	83 ca 0e             	or     $0xe,%edx
  102137:	88 90 ed 81 00 00    	mov    %dl,0x81ed(%eax)
  10213d:	0f b6 90 ed 81 00 00 	movzbl 0x81ed(%eax),%edx
  102144:	83 e2 ef             	and    $0xffffffef,%edx
  102147:	88 90 ed 81 00 00    	mov    %dl,0x81ed(%eax)
  10214d:	0f b6 90 ed 81 00 00 	movzbl 0x81ed(%eax),%edx
  102154:	83 e2 9f             	and    $0xffffff9f,%edx
  102157:	88 90 ed 81 00 00    	mov    %dl,0x81ed(%eax)
  10215d:	0f b6 90 ed 81 00 00 	movzbl 0x81ed(%eax),%edx
  102164:	83 ca 80             	or     $0xffffff80,%edx
  102167:	88 90 ed 81 00 00    	mov    %dl,0x81ed(%eax)
  10216d:	c7 c2 fe 26 10 00    	mov    $0x1026fe,%edx
  102173:	c1 ea 10             	shr    $0x10,%edx
  102176:	66 89 90 ee 81 00 00 	mov    %dx,0x81ee(%eax)
  10217d:	c7 c2 04 27 10 00    	mov    $0x102704,%edx
  102183:	66 89 90 f0 81 00 00 	mov    %dx,0x81f0(%eax)
  10218a:	66 c7 80 f2 81 00 00 	movw   $0x8,0x81f2(%eax)
  102191:	08 00 
  102193:	0f b6 90 f4 81 00 00 	movzbl 0x81f4(%eax),%edx
  10219a:	83 e2 e0             	and    $0xffffffe0,%edx
  10219d:	88 90 f4 81 00 00    	mov    %dl,0x81f4(%eax)
  1021a3:	0f b6 90 f4 81 00 00 	movzbl 0x81f4(%eax),%edx
  1021aa:	83 e2 1f             	and    $0x1f,%edx
  1021ad:	88 90 f4 81 00 00    	mov    %dl,0x81f4(%eax)
  1021b3:	0f b6 90 f5 81 00 00 	movzbl 0x81f5(%eax),%edx
  1021ba:	83 e2 f0             	and    $0xfffffff0,%edx
  1021bd:	83 ca 0e             	or     $0xe,%edx
  1021c0:	88 90 f5 81 00 00    	mov    %dl,0x81f5(%eax)
  1021c6:	0f b6 90 f5 81 00 00 	movzbl 0x81f5(%eax),%edx
  1021cd:	83 e2 ef             	and    $0xffffffef,%edx
  1021d0:	88 90 f5 81 00 00    	mov    %dl,0x81f5(%eax)
  1021d6:	0f b6 90 f5 81 00 00 	movzbl 0x81f5(%eax),%edx
  1021dd:	83 e2 9f             	and    $0xffffff9f,%edx
  1021e0:	88 90 f5 81 00 00    	mov    %dl,0x81f5(%eax)
  1021e6:	0f b6 90 f5 81 00 00 	movzbl 0x81f5(%eax),%edx
  1021ed:	83 ca 80             	or     $0xffffff80,%edx
  1021f0:	88 90 f5 81 00 00    	mov    %dl,0x81f5(%eax)
  1021f6:	c7 c2 04 27 10 00    	mov    $0x102704,%edx
  1021fc:	c1 ea 10             	shr    $0x10,%edx
  1021ff:	66 89 90 f6 81 00 00 	mov    %dx,0x81f6(%eax)
  102206:	c7 c2 0a 27 10 00    	mov    $0x10270a,%edx
  10220c:	66 89 90 f8 81 00 00 	mov    %dx,0x81f8(%eax)
  102213:	66 c7 80 fa 81 00 00 	movw   $0x8,0x81fa(%eax)
  10221a:	08 00 
  10221c:	0f b6 90 fc 81 00 00 	movzbl 0x81fc(%eax),%edx
  102223:	83 e2 e0             	and    $0xffffffe0,%edx
  102226:	88 90 fc 81 00 00    	mov    %dl,0x81fc(%eax)
  10222c:	0f b6 90 fc 81 00 00 	movzbl 0x81fc(%eax),%edx
  102233:	83 e2 1f             	and    $0x1f,%edx
  102236:	88 90 fc 81 00 00    	mov    %dl,0x81fc(%eax)
  10223c:	0f b6 90 fd 81 00 00 	movzbl 0x81fd(%eax),%edx
  102243:	83 e2 f0             	and    $0xfffffff0,%edx
  102246:	83 ca 0e             	or     $0xe,%edx
  102249:	88 90 fd 81 00 00    	mov    %dl,0x81fd(%eax)
  10224f:	0f b6 90 fd 81 00 00 	movzbl 0x81fd(%eax),%edx
  102256:	83 e2 ef             	and    $0xffffffef,%edx
  102259:	88 90 fd 81 00 00    	mov    %dl,0x81fd(%eax)
  10225f:	0f b6 90 fd 81 00 00 	movzbl 0x81fd(%eax),%edx
  102266:	83 e2 9f             	and    $0xffffff9f,%edx
  102269:	88 90 fd 81 00 00    	mov    %dl,0x81fd(%eax)
  10226f:	0f b6 90 fd 81 00 00 	movzbl 0x81fd(%eax),%edx
  102276:	83 ca 80             	or     $0xffffff80,%edx
  102279:	88 90 fd 81 00 00    	mov    %dl,0x81fd(%eax)
  10227f:	c7 c2 0a 27 10 00    	mov    $0x10270a,%edx
  102285:	c1 ea 10             	shr    $0x10,%edx
  102288:	66 89 90 fe 81 00 00 	mov    %dx,0x81fe(%eax)
  10228f:	c7 c2 10 27 10 00    	mov    $0x102710,%edx
  102295:	66 89 90 00 82 00 00 	mov    %dx,0x8200(%eax)
  10229c:	66 c7 80 02 82 00 00 	movw   $0x8,0x8202(%eax)
  1022a3:	08 00 
  1022a5:	0f b6 90 04 82 00 00 	movzbl 0x8204(%eax),%edx
  1022ac:	83 e2 e0             	and    $0xffffffe0,%edx
  1022af:	88 90 04 82 00 00    	mov    %dl,0x8204(%eax)
  1022b5:	0f b6 90 04 82 00 00 	movzbl 0x8204(%eax),%edx
  1022bc:	83 e2 1f             	and    $0x1f,%edx
  1022bf:	88 90 04 82 00 00    	mov    %dl,0x8204(%eax)
  1022c5:	0f b6 90 05 82 00 00 	movzbl 0x8205(%eax),%edx
  1022cc:	83 e2 f0             	and    $0xfffffff0,%edx
  1022cf:	83 ca 0e             	or     $0xe,%edx
  1022d2:	88 90 05 82 00 00    	mov    %dl,0x8205(%eax)
  1022d8:	0f b6 90 05 82 00 00 	movzbl 0x8205(%eax),%edx
  1022df:	83 e2 ef             	and    $0xffffffef,%edx
  1022e2:	88 90 05 82 00 00    	mov    %dl,0x8205(%eax)
  1022e8:	0f b6 90 05 82 00 00 	movzbl 0x8205(%eax),%edx
  1022ef:	83 e2 9f             	and    $0xffffff9f,%edx
  1022f2:	88 90 05 82 00 00    	mov    %dl,0x8205(%eax)
  1022f8:	0f b6 90 05 82 00 00 	movzbl 0x8205(%eax),%edx
  1022ff:	83 ca 80             	or     $0xffffff80,%edx
  102302:	88 90 05 82 00 00    	mov    %dl,0x8205(%eax)
  102308:	c7 c2 10 27 10 00    	mov    $0x102710,%edx
  10230e:	c1 ea 10             	shr    $0x10,%edx
  102311:	66 89 90 06 82 00 00 	mov    %dx,0x8206(%eax)
  102318:	c7 c2 16 27 10 00    	mov    $0x102716,%edx
  10231e:	66 89 90 08 82 00 00 	mov    %dx,0x8208(%eax)
  102325:	66 c7 80 0a 82 00 00 	movw   $0x8,0x820a(%eax)
  10232c:	08 00 
  10232e:	0f b6 90 0c 82 00 00 	movzbl 0x820c(%eax),%edx
  102335:	83 e2 e0             	and    $0xffffffe0,%edx
  102338:	88 90 0c 82 00 00    	mov    %dl,0x820c(%eax)
  10233e:	0f b6 90 0c 82 00 00 	movzbl 0x820c(%eax),%edx
  102345:	83 e2 1f             	and    $0x1f,%edx
  102348:	88 90 0c 82 00 00    	mov    %dl,0x820c(%eax)
  10234e:	0f b6 90 0d 82 00 00 	movzbl 0x820d(%eax),%edx
  102355:	83 e2 f0             	and    $0xfffffff0,%edx
  102358:	83 ca 0e             	or     $0xe,%edx
  10235b:	88 90 0d 82 00 00    	mov    %dl,0x820d(%eax)
  102361:	0f b6 90 0d 82 00 00 	movzbl 0x820d(%eax),%edx
  102368:	83 e2 ef             	and    $0xffffffef,%edx
  10236b:	88 90 0d 82 00 00    	mov    %dl,0x820d(%eax)
  102371:	0f b6 90 0d 82 00 00 	movzbl 0x820d(%eax),%edx
  102378:	83 e2 9f             	and    $0xffffff9f,%edx
  10237b:	88 90 0d 82 00 00    	mov    %dl,0x820d(%eax)
  102381:	0f b6 90 0d 82 00 00 	movzbl 0x820d(%eax),%edx
  102388:	83 ca 80             	or     $0xffffff80,%edx
  10238b:	88 90 0d 82 00 00    	mov    %dl,0x820d(%eax)
  102391:	c7 c2 16 27 10 00    	mov    $0x102716,%edx
  102397:	c1 ea 10             	shr    $0x10,%edx
  10239a:	66 89 90 0e 82 00 00 	mov    %dx,0x820e(%eax)
  1023a1:	c7 c2 1c 27 10 00    	mov    $0x10271c,%edx
  1023a7:	66 89 90 10 82 00 00 	mov    %dx,0x8210(%eax)
  1023ae:	66 c7 80 12 82 00 00 	movw   $0x8,0x8212(%eax)
  1023b5:	08 00 
  1023b7:	0f b6 90 14 82 00 00 	movzbl 0x8214(%eax),%edx
  1023be:	83 e2 e0             	and    $0xffffffe0,%edx
  1023c1:	88 90 14 82 00 00    	mov    %dl,0x8214(%eax)
  1023c7:	0f b6 90 14 82 00 00 	movzbl 0x8214(%eax),%edx
  1023ce:	83 e2 1f             	and    $0x1f,%edx
  1023d1:	88 90 14 82 00 00    	mov    %dl,0x8214(%eax)
  1023d7:	0f b6 90 15 82 00 00 	movzbl 0x8215(%eax),%edx
  1023de:	83 e2 f0             	and    $0xfffffff0,%edx
  1023e1:	83 ca 0e             	or     $0xe,%edx
  1023e4:	88 90 15 82 00 00    	mov    %dl,0x8215(%eax)
  1023ea:	0f b6 90 15 82 00 00 	movzbl 0x8215(%eax),%edx
  1023f1:	83 e2 ef             	and    $0xffffffef,%edx
  1023f4:	88 90 15 82 00 00    	mov    %dl,0x8215(%eax)
  1023fa:	0f b6 90 15 82 00 00 	movzbl 0x8215(%eax),%edx
  102401:	83 e2 9f             	and    $0xffffff9f,%edx
  102404:	88 90 15 82 00 00    	mov    %dl,0x8215(%eax)
  10240a:	0f b6 90 15 82 00 00 	movzbl 0x8215(%eax),%edx
  102411:	83 ca 80             	or     $0xffffff80,%edx
  102414:	88 90 15 82 00 00    	mov    %dl,0x8215(%eax)
  10241a:	c7 c2 1c 27 10 00    	mov    $0x10271c,%edx
  102420:	c1 ea 10             	shr    $0x10,%edx
  102423:	66 89 90 16 82 00 00 	mov    %dx,0x8216(%eax)
  10242a:	c7 c2 22 27 10 00    	mov    $0x102722,%edx
  102430:	66 89 90 18 82 00 00 	mov    %dx,0x8218(%eax)
  102437:	66 c7 80 1a 82 00 00 	movw   $0x8,0x821a(%eax)
  10243e:	08 00 
  102440:	0f b6 90 1c 82 00 00 	movzbl 0x821c(%eax),%edx
  102447:	83 e2 e0             	and    $0xffffffe0,%edx
  10244a:	88 90 1c 82 00 00    	mov    %dl,0x821c(%eax)
  102450:	0f b6 90 1c 82 00 00 	movzbl 0x821c(%eax),%edx
  102457:	83 e2 1f             	and    $0x1f,%edx
  10245a:	88 90 1c 82 00 00    	mov    %dl,0x821c(%eax)
  102460:	0f b6 90 1d 82 00 00 	movzbl 0x821d(%eax),%edx
  102467:	83 e2 f0             	and    $0xfffffff0,%edx
  10246a:	83 ca 0e             	or     $0xe,%edx
  10246d:	88 90 1d 82 00 00    	mov    %dl,0x821d(%eax)
  102473:	0f b6 90 1d 82 00 00 	movzbl 0x821d(%eax),%edx
  10247a:	83 e2 ef             	and    $0xffffffef,%edx
  10247d:	88 90 1d 82 00 00    	mov    %dl,0x821d(%eax)
  102483:	0f b6 90 1d 82 00 00 	movzbl 0x821d(%eax),%edx
  10248a:	83 e2 9f             	and    $0xffffff9f,%edx
  10248d:	88 90 1d 82 00 00    	mov    %dl,0x821d(%eax)
  102493:	0f b6 90 1d 82 00 00 	movzbl 0x821d(%eax),%edx
  10249a:	83 ca 80             	or     $0xffffff80,%edx
  10249d:	88 90 1d 82 00 00    	mov    %dl,0x821d(%eax)
  1024a3:	c7 c2 22 27 10 00    	mov    $0x102722,%edx
  1024a9:	c1 ea 10             	shr    $0x10,%edx
  1024ac:	66 89 90 1e 82 00 00 	mov    %dx,0x821e(%eax)
  1024b3:	c7 c2 58 27 10 00    	mov    $0x102758,%edx
  1024b9:	66 89 90 20 82 00 00 	mov    %dx,0x8220(%eax)
  1024c0:	66 c7 80 22 82 00 00 	movw   $0x8,0x8222(%eax)
  1024c7:	08 00 
  1024c9:	0f b6 90 24 82 00 00 	movzbl 0x8224(%eax),%edx
  1024d0:	83 e2 e0             	and    $0xffffffe0,%edx
  1024d3:	88 90 24 82 00 00    	mov    %dl,0x8224(%eax)
  1024d9:	0f b6 90 24 82 00 00 	movzbl 0x8224(%eax),%edx
  1024e0:	83 e2 1f             	and    $0x1f,%edx
  1024e3:	88 90 24 82 00 00    	mov    %dl,0x8224(%eax)
  1024e9:	0f b6 90 25 82 00 00 	movzbl 0x8225(%eax),%edx
  1024f0:	83 e2 f0             	and    $0xfffffff0,%edx
  1024f3:	83 ca 0e             	or     $0xe,%edx
  1024f6:	88 90 25 82 00 00    	mov    %dl,0x8225(%eax)
  1024fc:	0f b6 90 25 82 00 00 	movzbl 0x8225(%eax),%edx
  102503:	83 e2 ef             	and    $0xffffffef,%edx
  102506:	88 90 25 82 00 00    	mov    %dl,0x8225(%eax)
  10250c:	0f b6 90 25 82 00 00 	movzbl 0x8225(%eax),%edx
  102513:	83 ca 60             	or     $0x60,%edx
  102516:	88 90 25 82 00 00    	mov    %dl,0x8225(%eax)
  10251c:	0f b6 90 25 82 00 00 	movzbl 0x8225(%eax),%edx
  102523:	83 ca 80             	or     $0xffffff80,%edx
  102526:	88 90 25 82 00 00    	mov    %dl,0x8225(%eax)
  10252c:	c7 c2 58 27 10 00    	mov    $0x102758,%edx
  102532:	c1 ea 10             	shr    $0x10,%edx
  102535:	66 89 90 26 82 00 00 	mov    %dx,0x8226(%eax)
  10253c:	c7 c2 5e 27 10 00    	mov    $0x10275e,%edx
  102542:	66 89 90 90 88 00 00 	mov    %dx,0x8890(%eax)
  102549:	66 c7 80 92 88 00 00 	movw   $0x8,0x8892(%eax)
  102550:	08 00 
  102552:	0f b6 90 94 88 00 00 	movzbl 0x8894(%eax),%edx
  102559:	83 e2 e0             	and    $0xffffffe0,%edx
  10255c:	88 90 94 88 00 00    	mov    %dl,0x8894(%eax)
  102562:	0f b6 90 94 88 00 00 	movzbl 0x8894(%eax),%edx
  102569:	83 e2 1f             	and    $0x1f,%edx
  10256c:	88 90 94 88 00 00    	mov    %dl,0x8894(%eax)
  102572:	0f b6 90 95 88 00 00 	movzbl 0x8895(%eax),%edx
  102579:	83 e2 f0             	and    $0xfffffff0,%edx
  10257c:	83 ca 0e             	or     $0xe,%edx
  10257f:	88 90 95 88 00 00    	mov    %dl,0x8895(%eax)
  102585:	0f b6 90 95 88 00 00 	movzbl 0x8895(%eax),%edx
  10258c:	83 e2 ef             	and    $0xffffffef,%edx
  10258f:	88 90 95 88 00 00    	mov    %dl,0x8895(%eax)
  102595:	0f b6 90 95 88 00 00 	movzbl 0x8895(%eax),%edx
  10259c:	83 e2 9f             	and    $0xffffff9f,%edx
  10259f:	88 90 95 88 00 00    	mov    %dl,0x8895(%eax)
  1025a5:	0f b6 90 95 88 00 00 	movzbl 0x8895(%eax),%edx
  1025ac:	83 ca 80             	or     $0xffffff80,%edx
  1025af:	88 90 95 88 00 00    	mov    %dl,0x8895(%eax)
  1025b5:	c7 c2 5e 27 10 00    	mov    $0x10275e,%edx
  1025bb:	c1 ea 10             	shr    $0x10,%edx
  1025be:	66 89 90 96 88 00 00 	mov    %dx,0x8896(%eax)
  1025c5:	0f 01 98 10 15 00 00 	lidtl  0x1510(%eax)
  1025cc:	90                   	nop
  1025cd:	c9                   	leave  
  1025ce:	c3                   	ret    

001025cf <intr_init>:
  1025cf:	55                   	push   %ebp
  1025d0:	89 e5                	mov    %esp,%ebp
  1025d2:	53                   	push   %ebx
  1025d3:	e8 e5 dd ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1025d8:	81 c3 28 6a 00 00    	add    $0x6a28,%ebx
  1025de:	0f b6 83 a0 88 00 00 	movzbl 0x88a0(%ebx),%eax
  1025e5:	3c 01                	cmp    $0x1,%al
  1025e7:	74 0e                	je     1025f7 <intr_init+0x28>
  1025e9:	e8 36 ec ff ff       	call   101224 <intr_init_idt>
  1025ee:	c6 83 a0 88 00 00 01 	movb   $0x1,0x88a0(%ebx)
  1025f5:	eb 01                	jmp    1025f8 <intr_init+0x29>
  1025f7:	90                   	nop
  1025f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1025fb:	c9                   	leave  
  1025fc:	c3                   	ret    
  1025fd:	66 90                	xchg   %ax,%ax
  1025ff:	90                   	nop

00102600 <Xdivide>:
  102600:	6a 00                	push   $0x0
  102602:	6a 00                	push   $0x0
  102604:	e9 67 01 00 00       	jmp    102770 <_alltraps>
  102609:	90                   	nop

0010260a <Xdebug>:
  10260a:	6a 00                	push   $0x0
  10260c:	6a 01                	push   $0x1
  10260e:	e9 5d 01 00 00       	jmp    102770 <_alltraps>
  102613:	90                   	nop

00102614 <Xnmi>:
  102614:	6a 00                	push   $0x0
  102616:	6a 02                	push   $0x2
  102618:	e9 53 01 00 00       	jmp    102770 <_alltraps>
  10261d:	90                   	nop

0010261e <Xbrkpt>:
  10261e:	6a 00                	push   $0x0
  102620:	6a 03                	push   $0x3
  102622:	e9 49 01 00 00       	jmp    102770 <_alltraps>
  102627:	90                   	nop

00102628 <Xoflow>:
  102628:	6a 00                	push   $0x0
  10262a:	6a 04                	push   $0x4
  10262c:	e9 3f 01 00 00       	jmp    102770 <_alltraps>
  102631:	90                   	nop

00102632 <Xbound>:
  102632:	6a 00                	push   $0x0
  102634:	6a 05                	push   $0x5
  102636:	e9 35 01 00 00       	jmp    102770 <_alltraps>
  10263b:	90                   	nop

0010263c <Xillop>:
  10263c:	6a 00                	push   $0x0
  10263e:	6a 06                	push   $0x6
  102640:	e9 2b 01 00 00       	jmp    102770 <_alltraps>
  102645:	90                   	nop

00102646 <Xdevice>:
  102646:	6a 00                	push   $0x0
  102648:	6a 07                	push   $0x7
  10264a:	e9 21 01 00 00       	jmp    102770 <_alltraps>
  10264f:	90                   	nop

00102650 <Xdblflt>:
  102650:	6a 08                	push   $0x8
  102652:	e9 19 01 00 00       	jmp    102770 <_alltraps>
  102657:	90                   	nop

00102658 <Xcoproc>:
  102658:	6a 00                	push   $0x0
  10265a:	6a 09                	push   $0x9
  10265c:	e9 0f 01 00 00       	jmp    102770 <_alltraps>
  102661:	90                   	nop

00102662 <Xtss>:
  102662:	6a 0a                	push   $0xa
  102664:	e9 07 01 00 00       	jmp    102770 <_alltraps>
  102669:	90                   	nop

0010266a <Xsegnp>:
  10266a:	6a 0b                	push   $0xb
  10266c:	e9 ff 00 00 00       	jmp    102770 <_alltraps>
  102671:	90                   	nop

00102672 <Xstack>:
  102672:	6a 0c                	push   $0xc
  102674:	e9 f7 00 00 00       	jmp    102770 <_alltraps>
  102679:	90                   	nop

0010267a <Xgpflt>:
  10267a:	6a 0d                	push   $0xd
  10267c:	e9 ef 00 00 00       	jmp    102770 <_alltraps>
  102681:	90                   	nop

00102682 <Xpgflt>:
  102682:	6a 0e                	push   $0xe
  102684:	e9 e7 00 00 00       	jmp    102770 <_alltraps>
  102689:	90                   	nop

0010268a <Xres>:
  10268a:	6a 00                	push   $0x0
  10268c:	6a 0f                	push   $0xf
  10268e:	e9 dd 00 00 00       	jmp    102770 <_alltraps>
  102693:	90                   	nop

00102694 <Xfperr>:
  102694:	6a 00                	push   $0x0
  102696:	6a 10                	push   $0x10
  102698:	e9 d3 00 00 00       	jmp    102770 <_alltraps>
  10269d:	90                   	nop

0010269e <Xalign>:
  10269e:	6a 11                	push   $0x11
  1026a0:	e9 cb 00 00 00       	jmp    102770 <_alltraps>
  1026a5:	90                   	nop

001026a6 <Xmchk>:
  1026a6:	6a 00                	push   $0x0
  1026a8:	6a 12                	push   $0x12
  1026aa:	e9 c1 00 00 00       	jmp    102770 <_alltraps>
  1026af:	90                   	nop

001026b0 <Xirq_timer>:
  1026b0:	6a 00                	push   $0x0
  1026b2:	6a 20                	push   $0x20
  1026b4:	e9 b7 00 00 00       	jmp    102770 <_alltraps>
  1026b9:	90                   	nop

001026ba <Xirq_kbd>:
  1026ba:	6a 00                	push   $0x0
  1026bc:	6a 21                	push   $0x21
  1026be:	e9 ad 00 00 00       	jmp    102770 <_alltraps>
  1026c3:	90                   	nop

001026c4 <Xirq_slave>:
  1026c4:	6a 00                	push   $0x0
  1026c6:	6a 22                	push   $0x22
  1026c8:	e9 a3 00 00 00       	jmp    102770 <_alltraps>
  1026cd:	90                   	nop

001026ce <Xirq_serial2>:
  1026ce:	6a 00                	push   $0x0
  1026d0:	6a 23                	push   $0x23
  1026d2:	e9 99 00 00 00       	jmp    102770 <_alltraps>
  1026d7:	90                   	nop

001026d8 <Xirq_serial1>:
  1026d8:	6a 00                	push   $0x0
  1026da:	6a 24                	push   $0x24
  1026dc:	e9 8f 00 00 00       	jmp    102770 <_alltraps>
  1026e1:	90                   	nop

001026e2 <Xirq_lpt>:
  1026e2:	6a 00                	push   $0x0
  1026e4:	6a 25                	push   $0x25
  1026e6:	e9 85 00 00 00       	jmp    102770 <_alltraps>
  1026eb:	90                   	nop

001026ec <Xirq_floppy>:
  1026ec:	6a 00                	push   $0x0
  1026ee:	6a 26                	push   $0x26
  1026f0:	eb 7e                	jmp    102770 <_alltraps>

001026f2 <Xirq_spurious>:
  1026f2:	6a 00                	push   $0x0
  1026f4:	6a 27                	push   $0x27
  1026f6:	eb 78                	jmp    102770 <_alltraps>

001026f8 <Xirq_rtc>:
  1026f8:	6a 00                	push   $0x0
  1026fa:	6a 28                	push   $0x28
  1026fc:	eb 72                	jmp    102770 <_alltraps>

001026fe <Xirq9>:
  1026fe:	6a 00                	push   $0x0
  102700:	6a 29                	push   $0x29
  102702:	eb 6c                	jmp    102770 <_alltraps>

00102704 <Xirq10>:
  102704:	6a 00                	push   $0x0
  102706:	6a 2a                	push   $0x2a
  102708:	eb 66                	jmp    102770 <_alltraps>

0010270a <Xirq11>:
  10270a:	6a 00                	push   $0x0
  10270c:	6a 2b                	push   $0x2b
  10270e:	eb 60                	jmp    102770 <_alltraps>

00102710 <Xirq_mouse>:
  102710:	6a 00                	push   $0x0
  102712:	6a 2c                	push   $0x2c
  102714:	eb 5a                	jmp    102770 <_alltraps>

00102716 <Xirq_coproc>:
  102716:	6a 00                	push   $0x0
  102718:	6a 2d                	push   $0x2d
  10271a:	eb 54                	jmp    102770 <_alltraps>

0010271c <Xirq_ide1>:
  10271c:	6a 00                	push   $0x0
  10271e:	6a 2e                	push   $0x2e
  102720:	eb 4e                	jmp    102770 <_alltraps>

00102722 <Xirq_ide2>:
  102722:	6a 00                	push   $0x0
  102724:	6a 2f                	push   $0x2f
  102726:	eb 48                	jmp    102770 <_alltraps>

00102728 <Xirq_ehci1>:
  102728:	6a 00                	push   $0x0
  10272a:	6a 30                	push   $0x30
  10272c:	eb 42                	jmp    102770 <_alltraps>

0010272e <Xirq17>:
  10272e:	6a 00                	push   $0x0
  102730:	6a 31                	push   $0x31
  102732:	eb 3c                	jmp    102770 <_alltraps>

00102734 <Xirq18>:
  102734:	6a 00                	push   $0x0
  102736:	6a 32                	push   $0x32
  102738:	eb 36                	jmp    102770 <_alltraps>

0010273a <Xirq19>:
  10273a:	6a 00                	push   $0x0
  10273c:	6a 33                	push   $0x33
  10273e:	eb 30                	jmp    102770 <_alltraps>

00102740 <Xirq20>:
  102740:	6a 00                	push   $0x0
  102742:	6a 34                	push   $0x34
  102744:	eb 2a                	jmp    102770 <_alltraps>

00102746 <Xirq21>:
  102746:	6a 00                	push   $0x0
  102748:	6a 35                	push   $0x35
  10274a:	eb 24                	jmp    102770 <_alltraps>

0010274c <Xirq22>:
  10274c:	6a 00                	push   $0x0
  10274e:	6a 36                	push   $0x36
  102750:	eb 1e                	jmp    102770 <_alltraps>

00102752 <Xirq_ehci2>:
  102752:	6a 00                	push   $0x0
  102754:	6a 37                	push   $0x37
  102756:	eb 18                	jmp    102770 <_alltraps>

00102758 <Xsyscall>:
  102758:	6a 00                	push   $0x0
  10275a:	6a 30                	push   $0x30
  10275c:	eb 12                	jmp    102770 <_alltraps>

0010275e <Xdefault>:
  10275e:	68 fe 00 00 00       	push   $0xfe
  102763:	eb 0b                	jmp    102770 <_alltraps>
  102765:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10276c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00102770 <_alltraps>:
  102770:	fa                   	cli    
  102771:	1e                   	push   %ds
  102772:	06                   	push   %es
  102773:	60                   	pusha  
  102774:	b8 10 00 00 00       	mov    $0x10,%eax
  102779:	8e d8                	mov    %eax,%ds
  10277b:	8e c0                	mov    %eax,%es
  10277d:	54                   	push   %esp
  10277e:	e8 56 21 00 00       	call   1048d9 <trap>
  102783:	f4                   	hlt    
  102784:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10278b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  10278f:	90                   	nop

00102790 <trap_return>:
  102790:	8b 64 24 04          	mov    0x4(%esp),%esp
  102794:	61                   	popa   
  102795:	07                   	pop    %es
  102796:	1f                   	pop    %ds
  102797:	83 c4 08             	add    $0x8,%esp
  10279a:	c3                   	ret    

0010279b <memset>:
  10279b:	55                   	push   %ebp
  10279c:	89 e5                	mov    %esp,%ebp
  10279e:	57                   	push   %edi
  10279f:	e8 11 dc ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1027a4:	05 5c 68 00 00       	add    $0x685c,%eax
  1027a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1027ad:	75 05                	jne    1027b4 <memset+0x19>
  1027af:	8b 45 08             	mov    0x8(%ebp),%eax
  1027b2:	eb 5c                	jmp    102810 <memset+0x75>
  1027b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1027b7:	83 e0 03             	and    $0x3,%eax
  1027ba:	85 c0                	test   %eax,%eax
  1027bc:	75 41                	jne    1027ff <memset+0x64>
  1027be:	8b 45 10             	mov    0x10(%ebp),%eax
  1027c1:	83 e0 03             	and    $0x3,%eax
  1027c4:	85 c0                	test   %eax,%eax
  1027c6:	75 37                	jne    1027ff <memset+0x64>
  1027c8:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  1027cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027d2:	c1 e0 18             	shl    $0x18,%eax
  1027d5:	89 c2                	mov    %eax,%edx
  1027d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027da:	c1 e0 10             	shl    $0x10,%eax
  1027dd:	09 c2                	or     %eax,%edx
  1027df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027e2:	c1 e0 08             	shl    $0x8,%eax
  1027e5:	09 d0                	or     %edx,%eax
  1027e7:	09 45 0c             	or     %eax,0xc(%ebp)
  1027ea:	8b 45 10             	mov    0x10(%ebp),%eax
  1027ed:	c1 e8 02             	shr    $0x2,%eax
  1027f0:	89 c1                	mov    %eax,%ecx
  1027f2:	8b 55 08             	mov    0x8(%ebp),%edx
  1027f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027f8:	89 d7                	mov    %edx,%edi
  1027fa:	fc                   	cld    
  1027fb:	f3 ab                	rep stos %eax,%es:(%edi)
  1027fd:	eb 0e                	jmp    10280d <memset+0x72>
  1027ff:	8b 55 08             	mov    0x8(%ebp),%edx
  102802:	8b 45 0c             	mov    0xc(%ebp),%eax
  102805:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102808:	89 d7                	mov    %edx,%edi
  10280a:	fc                   	cld    
  10280b:	f3 aa                	rep stos %al,%es:(%edi)
  10280d:	8b 45 08             	mov    0x8(%ebp),%eax
  102810:	8b 7d fc             	mov    -0x4(%ebp),%edi
  102813:	c9                   	leave  
  102814:	c3                   	ret    

00102815 <memmove>:
  102815:	55                   	push   %ebp
  102816:	89 e5                	mov    %esp,%ebp
  102818:	57                   	push   %edi
  102819:	56                   	push   %esi
  10281a:	53                   	push   %ebx
  10281b:	83 ec 10             	sub    $0x10,%esp
  10281e:	e8 92 db ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102823:	05 dd 67 00 00       	add    $0x67dd,%eax
  102828:	8b 45 0c             	mov    0xc(%ebp),%eax
  10282b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10282e:	8b 45 08             	mov    0x8(%ebp),%eax
  102831:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102834:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102837:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10283a:	73 6d                	jae    1028a9 <memmove+0x94>
  10283c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10283f:	8b 45 10             	mov    0x10(%ebp),%eax
  102842:	01 d0                	add    %edx,%eax
  102844:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  102847:	73 60                	jae    1028a9 <memmove+0x94>
  102849:	8b 45 10             	mov    0x10(%ebp),%eax
  10284c:	01 45 f0             	add    %eax,-0x10(%ebp)
  10284f:	8b 45 10             	mov    0x10(%ebp),%eax
  102852:	01 45 ec             	add    %eax,-0x14(%ebp)
  102855:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102858:	83 e0 03             	and    $0x3,%eax
  10285b:	85 c0                	test   %eax,%eax
  10285d:	75 2f                	jne    10288e <memmove+0x79>
  10285f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102862:	83 e0 03             	and    $0x3,%eax
  102865:	85 c0                	test   %eax,%eax
  102867:	75 25                	jne    10288e <memmove+0x79>
  102869:	8b 45 10             	mov    0x10(%ebp),%eax
  10286c:	83 e0 03             	and    $0x3,%eax
  10286f:	85 c0                	test   %eax,%eax
  102871:	75 1b                	jne    10288e <memmove+0x79>
  102873:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102876:	83 e8 04             	sub    $0x4,%eax
  102879:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10287c:	83 ea 04             	sub    $0x4,%edx
  10287f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102882:	c1 e9 02             	shr    $0x2,%ecx
  102885:	89 c7                	mov    %eax,%edi
  102887:	89 d6                	mov    %edx,%esi
  102889:	fd                   	std    
  10288a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10288c:	eb 18                	jmp    1028a6 <memmove+0x91>
  10288e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102891:	8d 50 ff             	lea    -0x1(%eax),%edx
  102894:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102897:	8d 58 ff             	lea    -0x1(%eax),%ebx
  10289a:	8b 45 10             	mov    0x10(%ebp),%eax
  10289d:	89 d7                	mov    %edx,%edi
  10289f:	89 de                	mov    %ebx,%esi
  1028a1:	89 c1                	mov    %eax,%ecx
  1028a3:	fd                   	std    
  1028a4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1028a6:	fc                   	cld    
  1028a7:	eb 45                	jmp    1028ee <memmove+0xd9>
  1028a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028ac:	83 e0 03             	and    $0x3,%eax
  1028af:	85 c0                	test   %eax,%eax
  1028b1:	75 2b                	jne    1028de <memmove+0xc9>
  1028b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028b6:	83 e0 03             	and    $0x3,%eax
  1028b9:	85 c0                	test   %eax,%eax
  1028bb:	75 21                	jne    1028de <memmove+0xc9>
  1028bd:	8b 45 10             	mov    0x10(%ebp),%eax
  1028c0:	83 e0 03             	and    $0x3,%eax
  1028c3:	85 c0                	test   %eax,%eax
  1028c5:	75 17                	jne    1028de <memmove+0xc9>
  1028c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1028ca:	c1 e8 02             	shr    $0x2,%eax
  1028cd:	89 c1                	mov    %eax,%ecx
  1028cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028d2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1028d5:	89 c7                	mov    %eax,%edi
  1028d7:	89 d6                	mov    %edx,%esi
  1028d9:	fc                   	cld    
  1028da:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1028dc:	eb 10                	jmp    1028ee <memmove+0xd9>
  1028de:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1028e1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1028e4:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1028e7:	89 c7                	mov    %eax,%edi
  1028e9:	89 d6                	mov    %edx,%esi
  1028eb:	fc                   	cld    
  1028ec:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1028ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1028f1:	83 c4 10             	add    $0x10,%esp
  1028f4:	5b                   	pop    %ebx
  1028f5:	5e                   	pop    %esi
  1028f6:	5f                   	pop    %edi
  1028f7:	5d                   	pop    %ebp
  1028f8:	c3                   	ret    

001028f9 <memcpy>:
  1028f9:	55                   	push   %ebp
  1028fa:	89 e5                	mov    %esp,%ebp
  1028fc:	e8 b4 da ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102901:	05 ff 66 00 00       	add    $0x66ff,%eax
  102906:	ff 75 10             	push   0x10(%ebp)
  102909:	ff 75 0c             	push   0xc(%ebp)
  10290c:	ff 75 08             	push   0x8(%ebp)
  10290f:	e8 01 ff ff ff       	call   102815 <memmove>
  102914:	83 c4 0c             	add    $0xc,%esp
  102917:	c9                   	leave  
  102918:	c3                   	ret    

00102919 <strncmp>:
  102919:	55                   	push   %ebp
  10291a:	89 e5                	mov    %esp,%ebp
  10291c:	e8 94 da ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102921:	05 df 66 00 00       	add    $0x66df,%eax
  102926:	eb 0c                	jmp    102934 <strncmp+0x1b>
  102928:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10292c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102930:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  102934:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102938:	74 1a                	je     102954 <strncmp+0x3b>
  10293a:	8b 45 08             	mov    0x8(%ebp),%eax
  10293d:	0f b6 00             	movzbl (%eax),%eax
  102940:	84 c0                	test   %al,%al
  102942:	74 10                	je     102954 <strncmp+0x3b>
  102944:	8b 45 08             	mov    0x8(%ebp),%eax
  102947:	0f b6 10             	movzbl (%eax),%edx
  10294a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10294d:	0f b6 00             	movzbl (%eax),%eax
  102950:	38 c2                	cmp    %al,%dl
  102952:	74 d4                	je     102928 <strncmp+0xf>
  102954:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102958:	75 07                	jne    102961 <strncmp+0x48>
  10295a:	b8 00 00 00 00       	mov    $0x0,%eax
  10295f:	eb 16                	jmp    102977 <strncmp+0x5e>
  102961:	8b 45 08             	mov    0x8(%ebp),%eax
  102964:	0f b6 00             	movzbl (%eax),%eax
  102967:	0f b6 d0             	movzbl %al,%edx
  10296a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10296d:	0f b6 00             	movzbl (%eax),%eax
  102970:	0f b6 c8             	movzbl %al,%ecx
  102973:	89 d0                	mov    %edx,%eax
  102975:	29 c8                	sub    %ecx,%eax
  102977:	5d                   	pop    %ebp
  102978:	c3                   	ret    

00102979 <strnlen>:
  102979:	55                   	push   %ebp
  10297a:	89 e5                	mov    %esp,%ebp
  10297c:	83 ec 10             	sub    $0x10,%esp
  10297f:	e8 31 da ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102984:	05 7c 66 00 00       	add    $0x667c,%eax
  102989:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102990:	eb 0c                	jmp    10299e <strnlen+0x25>
  102992:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102996:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10299a:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  10299e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1029a2:	74 0a                	je     1029ae <strnlen+0x35>
  1029a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029a7:	0f b6 00             	movzbl (%eax),%eax
  1029aa:	84 c0                	test   %al,%al
  1029ac:	75 e4                	jne    102992 <strnlen+0x19>
  1029ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1029b1:	c9                   	leave  
  1029b2:	c3                   	ret    

001029b3 <strcmp>:
  1029b3:	55                   	push   %ebp
  1029b4:	89 e5                	mov    %esp,%ebp
  1029b6:	e8 fa d9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1029bb:	05 45 66 00 00       	add    $0x6645,%eax
  1029c0:	eb 08                	jmp    1029ca <strcmp+0x17>
  1029c2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1029c6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  1029ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1029cd:	0f b6 00             	movzbl (%eax),%eax
  1029d0:	84 c0                	test   %al,%al
  1029d2:	74 10                	je     1029e4 <strcmp+0x31>
  1029d4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d7:	0f b6 10             	movzbl (%eax),%edx
  1029da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029dd:	0f b6 00             	movzbl (%eax),%eax
  1029e0:	38 c2                	cmp    %al,%dl
  1029e2:	74 de                	je     1029c2 <strcmp+0xf>
  1029e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e7:	0f b6 00             	movzbl (%eax),%eax
  1029ea:	0f b6 d0             	movzbl %al,%edx
  1029ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029f0:	0f b6 00             	movzbl (%eax),%eax
  1029f3:	0f b6 c8             	movzbl %al,%ecx
  1029f6:	89 d0                	mov    %edx,%eax
  1029f8:	29 c8                	sub    %ecx,%eax
  1029fa:	5d                   	pop    %ebp
  1029fb:	c3                   	ret    

001029fc <strchr>:
  1029fc:	55                   	push   %ebp
  1029fd:	89 e5                	mov    %esp,%ebp
  1029ff:	83 ec 04             	sub    $0x4,%esp
  102a02:	e8 ae d9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102a07:	05 f9 65 00 00       	add    $0x65f9,%eax
  102a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a0f:	88 45 fc             	mov    %al,-0x4(%ebp)
  102a12:	eb 14                	jmp    102a28 <strchr+0x2c>
  102a14:	8b 45 08             	mov    0x8(%ebp),%eax
  102a17:	0f b6 00             	movzbl (%eax),%eax
  102a1a:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102a1d:	75 05                	jne    102a24 <strchr+0x28>
  102a1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102a22:	eb 13                	jmp    102a37 <strchr+0x3b>
  102a24:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102a28:	8b 45 08             	mov    0x8(%ebp),%eax
  102a2b:	0f b6 00             	movzbl (%eax),%eax
  102a2e:	84 c0                	test   %al,%al
  102a30:	75 e2                	jne    102a14 <strchr+0x18>
  102a32:	b8 00 00 00 00       	mov    $0x0,%eax
  102a37:	c9                   	leave  
  102a38:	c3                   	ret    

00102a39 <memzero>:
  102a39:	55                   	push   %ebp
  102a3a:	89 e5                	mov    %esp,%ebp
  102a3c:	e8 74 d9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102a41:	05 bf 65 00 00       	add    $0x65bf,%eax
  102a46:	ff 75 0c             	push   0xc(%ebp)
  102a49:	6a 00                	push   $0x0
  102a4b:	ff 75 08             	push   0x8(%ebp)
  102a4e:	e8 48 fd ff ff       	call   10279b <memset>
  102a53:	83 c4 0c             	add    $0xc,%esp
  102a56:	c9                   	leave  
  102a57:	c3                   	ret    

00102a58 <debug_info>:
  102a58:	55                   	push   %ebp
  102a59:	89 e5                	mov    %esp,%ebp
  102a5b:	53                   	push   %ebx
  102a5c:	83 ec 14             	sub    $0x14,%esp
  102a5f:	e8 51 d9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102a64:	05 9c 65 00 00       	add    $0x659c,%eax
  102a69:	8d 55 0c             	lea    0xc(%ebp),%edx
  102a6c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102a6f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102a72:	83 ec 08             	sub    $0x8,%esp
  102a75:	52                   	push   %edx
  102a76:	ff 75 08             	push   0x8(%ebp)
  102a79:	89 c3                	mov    %eax,%ebx
  102a7b:	e8 68 02 00 00       	call   102ce8 <vdprintf>
  102a80:	83 c4 10             	add    $0x10,%esp
  102a83:	90                   	nop
  102a84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102a87:	c9                   	leave  
  102a88:	c3                   	ret    

00102a89 <debug_normal>:
  102a89:	55                   	push   %ebp
  102a8a:	89 e5                	mov    %esp,%ebp
  102a8c:	53                   	push   %ebx
  102a8d:	83 ec 14             	sub    $0x14,%esp
  102a90:	e8 28 d9 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  102a95:	81 c3 6b 65 00 00    	add    $0x656b,%ebx
  102a9b:	83 ec 04             	sub    $0x4,%esp
  102a9e:	ff 75 0c             	push   0xc(%ebp)
  102aa1:	ff 75 08             	push   0x8(%ebp)
  102aa4:	8d 83 17 d1 ff ff    	lea    -0x2ee9(%ebx),%eax
  102aaa:	50                   	push   %eax
  102aab:	e8 ac 02 00 00       	call   102d5c <dprintf>
  102ab0:	83 c4 10             	add    $0x10,%esp
  102ab3:	8d 45 14             	lea    0x14(%ebp),%eax
  102ab6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ab9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102abc:	83 ec 08             	sub    $0x8,%esp
  102abf:	50                   	push   %eax
  102ac0:	ff 75 10             	push   0x10(%ebp)
  102ac3:	e8 20 02 00 00       	call   102ce8 <vdprintf>
  102ac8:	83 c4 10             	add    $0x10,%esp
  102acb:	90                   	nop
  102acc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102acf:	c9                   	leave  
  102ad0:	c3                   	ret    

00102ad1 <debug_trace>:
  102ad1:	55                   	push   %ebp
  102ad2:	89 e5                	mov    %esp,%ebp
  102ad4:	83 ec 10             	sub    $0x10,%esp
  102ad7:	e8 d9 d8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102adc:	05 24 65 00 00       	add    $0x6524,%eax
  102ae1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102ae7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102aee:	eb 23                	jmp    102b13 <debug_trace+0x42>
  102af0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102af3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102afa:	8b 45 0c             	mov    0xc(%ebp),%eax
  102afd:	01 c2                	add    %eax,%edx
  102aff:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b02:	8b 40 04             	mov    0x4(%eax),%eax
  102b05:	89 02                	mov    %eax,(%edx)
  102b07:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102b0a:	8b 00                	mov    (%eax),%eax
  102b0c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102b0f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b13:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  102b17:	7f 21                	jg     102b3a <debug_trace+0x69>
  102b19:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  102b1d:	75 d1                	jne    102af0 <debug_trace+0x1f>
  102b1f:	eb 19                	jmp    102b3a <debug_trace+0x69>
  102b21:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b24:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  102b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b2e:	01 d0                	add    %edx,%eax
  102b30:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  102b36:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102b3a:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  102b3e:	7e e1                	jle    102b21 <debug_trace+0x50>
  102b40:	90                   	nop
  102b41:	90                   	nop
  102b42:	c9                   	leave  
  102b43:	c3                   	ret    

00102b44 <debug_panic>:
  102b44:	55                   	push   %ebp
  102b45:	89 e5                	mov    %esp,%ebp
  102b47:	53                   	push   %ebx
  102b48:	83 ec 44             	sub    $0x44,%esp
  102b4b:	e8 6d d8 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  102b50:	81 c3 b0 64 00 00    	add    $0x64b0,%ebx
  102b56:	83 ec 04             	sub    $0x4,%esp
  102b59:	ff 75 0c             	push   0xc(%ebp)
  102b5c:	ff 75 08             	push   0x8(%ebp)
  102b5f:	8d 83 23 d1 ff ff    	lea    -0x2edd(%ebx),%eax
  102b65:	50                   	push   %eax
  102b66:	e8 f1 01 00 00       	call   102d5c <dprintf>
  102b6b:	83 c4 10             	add    $0x10,%esp
  102b6e:	8d 45 14             	lea    0x14(%ebp),%eax
  102b71:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  102b74:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  102b77:	83 ec 08             	sub    $0x8,%esp
  102b7a:	50                   	push   %eax
  102b7b:	ff 75 10             	push   0x10(%ebp)
  102b7e:	e8 65 01 00 00       	call   102ce8 <vdprintf>
  102b83:	83 c4 10             	add    $0x10,%esp
  102b86:	89 e8                	mov    %ebp,%eax
  102b88:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b8e:	83 ec 08             	sub    $0x8,%esp
  102b91:	8d 55 c8             	lea    -0x38(%ebp),%edx
  102b94:	52                   	push   %edx
  102b95:	50                   	push   %eax
  102b96:	e8 36 ff ff ff       	call   102ad1 <debug_trace>
  102b9b:	83 c4 10             	add    $0x10,%esp
  102b9e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  102ba5:	eb 1e                	jmp    102bc5 <debug_panic+0x81>
  102ba7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102baa:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  102bae:	83 ec 08             	sub    $0x8,%esp
  102bb1:	50                   	push   %eax
  102bb2:	8d 83 2f d1 ff ff    	lea    -0x2ed1(%ebx),%eax
  102bb8:	50                   	push   %eax
  102bb9:	e8 9e 01 00 00       	call   102d5c <dprintf>
  102bbe:	83 c4 10             	add    $0x10,%esp
  102bc1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  102bc5:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  102bc9:	7f 0b                	jg     102bd6 <debug_panic+0x92>
  102bcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102bce:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  102bd2:	85 c0                	test   %eax,%eax
  102bd4:	75 d1                	jne    102ba7 <debug_panic+0x63>
  102bd6:	83 ec 0c             	sub    $0xc,%esp
  102bd9:	8d 83 3d d1 ff ff    	lea    -0x2ec3(%ebx),%eax
  102bdf:	50                   	push   %eax
  102be0:	e8 77 01 00 00       	call   102d5c <dprintf>
  102be5:	83 c4 10             	add    $0x10,%esp
  102be8:	e8 d3 0c 00 00       	call   1038c0 <halt>
  102bed:	90                   	nop
  102bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102bf1:	c9                   	leave  
  102bf2:	c3                   	ret    

00102bf3 <debug_warn>:
  102bf3:	55                   	push   %ebp
  102bf4:	89 e5                	mov    %esp,%ebp
  102bf6:	53                   	push   %ebx
  102bf7:	83 ec 14             	sub    $0x14,%esp
  102bfa:	e8 be d7 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  102bff:	81 c3 01 64 00 00    	add    $0x6401,%ebx
  102c05:	83 ec 04             	sub    $0x4,%esp
  102c08:	ff 75 0c             	push   0xc(%ebp)
  102c0b:	ff 75 08             	push   0x8(%ebp)
  102c0e:	8d 83 4f d1 ff ff    	lea    -0x2eb1(%ebx),%eax
  102c14:	50                   	push   %eax
  102c15:	e8 42 01 00 00       	call   102d5c <dprintf>
  102c1a:	83 c4 10             	add    $0x10,%esp
  102c1d:	8d 45 14             	lea    0x14(%ebp),%eax
  102c20:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c26:	83 ec 08             	sub    $0x8,%esp
  102c29:	50                   	push   %eax
  102c2a:	ff 75 10             	push   0x10(%ebp)
  102c2d:	e8 b6 00 00 00       	call   102ce8 <vdprintf>
  102c32:	83 c4 10             	add    $0x10,%esp
  102c35:	90                   	nop
  102c36:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102c39:	c9                   	leave  
  102c3a:	c3                   	ret    

00102c3b <cputs>:
  102c3b:	55                   	push   %ebp
  102c3c:	89 e5                	mov    %esp,%ebp
  102c3e:	53                   	push   %ebx
  102c3f:	83 ec 04             	sub    $0x4,%esp
  102c42:	e8 76 d7 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  102c47:	81 c3 b9 63 00 00    	add    $0x63b9,%ebx
  102c4d:	eb 19                	jmp    102c68 <cputs+0x2d>
  102c4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c52:	0f b6 00             	movzbl (%eax),%eax
  102c55:	0f be c0             	movsbl %al,%eax
  102c58:	83 ec 0c             	sub    $0xc,%esp
  102c5b:	50                   	push   %eax
  102c5c:	e8 6b d8 ff ff       	call   1004cc <cons_putc>
  102c61:	83 c4 10             	add    $0x10,%esp
  102c64:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c68:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6b:	0f b6 00             	movzbl (%eax),%eax
  102c6e:	84 c0                	test   %al,%al
  102c70:	75 dd                	jne    102c4f <cputs+0x14>
  102c72:	90                   	nop
  102c73:	90                   	nop
  102c74:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102c77:	c9                   	leave  
  102c78:	c3                   	ret    

00102c79 <putch>:
  102c79:	55                   	push   %ebp
  102c7a:	89 e5                	mov    %esp,%ebp
  102c7c:	83 ec 08             	sub    $0x8,%esp
  102c7f:	e8 31 d7 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102c84:	05 7c 63 00 00       	add    $0x637c,%eax
  102c89:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c8c:	8b 00                	mov    (%eax),%eax
  102c8e:	8d 48 01             	lea    0x1(%eax),%ecx
  102c91:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c94:	89 0a                	mov    %ecx,(%edx)
  102c96:	8b 55 08             	mov    0x8(%ebp),%edx
  102c99:	89 d1                	mov    %edx,%ecx
  102c9b:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c9e:	88 4c 02 08          	mov    %cl,0x8(%edx,%eax,1)
  102ca2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ca5:	8b 00                	mov    (%eax),%eax
  102ca7:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  102cac:	75 28                	jne    102cd6 <putch+0x5d>
  102cae:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb1:	8b 00                	mov    (%eax),%eax
  102cb3:	8b 55 0c             	mov    0xc(%ebp),%edx
  102cb6:	c6 44 02 08 00       	movb   $0x0,0x8(%edx,%eax,1)
  102cbb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cbe:	83 c0 08             	add    $0x8,%eax
  102cc1:	83 ec 0c             	sub    $0xc,%esp
  102cc4:	50                   	push   %eax
  102cc5:	e8 71 ff ff ff       	call   102c3b <cputs>
  102cca:	83 c4 10             	add    $0x10,%esp
  102ccd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cd0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  102cd6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cd9:	8b 40 04             	mov    0x4(%eax),%eax
  102cdc:	8d 50 01             	lea    0x1(%eax),%edx
  102cdf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ce2:	89 50 04             	mov    %edx,0x4(%eax)
  102ce5:	90                   	nop
  102ce6:	c9                   	leave  
  102ce7:	c3                   	ret    

00102ce8 <vdprintf>:
  102ce8:	55                   	push   %ebp
  102ce9:	89 e5                	mov    %esp,%ebp
  102ceb:	53                   	push   %ebx
  102cec:	81 ec 14 02 00 00    	sub    $0x214,%esp
  102cf2:	e8 be d6 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102cf7:	05 09 63 00 00       	add    $0x6309,%eax
  102cfc:	c7 85 f0 fd ff ff 00 	movl   $0x0,-0x210(%ebp)
  102d03:	00 00 00 
  102d06:	c7 85 f4 fd ff ff 00 	movl   $0x0,-0x20c(%ebp)
  102d0d:	00 00 00 
  102d10:	ff 75 0c             	push   0xc(%ebp)
  102d13:	ff 75 08             	push   0x8(%ebp)
  102d16:	8d 95 f0 fd ff ff    	lea    -0x210(%ebp),%edx
  102d1c:	52                   	push   %edx
  102d1d:	8d 90 79 9c ff ff    	lea    -0x6387(%eax),%edx
  102d23:	52                   	push   %edx
  102d24:	89 c3                	mov    %eax,%ebx
  102d26:	e8 d6 01 00 00       	call   102f01 <vprintfmt>
  102d2b:	83 c4 10             	add    $0x10,%esp
  102d2e:	8b 85 f0 fd ff ff    	mov    -0x210(%ebp),%eax
  102d34:	c6 84 05 f8 fd ff ff 	movb   $0x0,-0x208(%ebp,%eax,1)
  102d3b:	00 
  102d3c:	83 ec 0c             	sub    $0xc,%esp
  102d3f:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  102d45:	83 c0 08             	add    $0x8,%eax
  102d48:	50                   	push   %eax
  102d49:	e8 ed fe ff ff       	call   102c3b <cputs>
  102d4e:	83 c4 10             	add    $0x10,%esp
  102d51:	8b 85 f4 fd ff ff    	mov    -0x20c(%ebp),%eax
  102d57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  102d5a:	c9                   	leave  
  102d5b:	c3                   	ret    

00102d5c <dprintf>:
  102d5c:	55                   	push   %ebp
  102d5d:	89 e5                	mov    %esp,%ebp
  102d5f:	83 ec 18             	sub    $0x18,%esp
  102d62:	e8 4e d6 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102d67:	05 99 62 00 00       	add    $0x6299,%eax
  102d6c:	8d 45 0c             	lea    0xc(%ebp),%eax
  102d6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d72:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d75:	83 ec 08             	sub    $0x8,%esp
  102d78:	50                   	push   %eax
  102d79:	ff 75 08             	push   0x8(%ebp)
  102d7c:	e8 67 ff ff ff       	call   102ce8 <vdprintf>
  102d81:	83 c4 10             	add    $0x10,%esp
  102d84:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d87:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d8a:	c9                   	leave  
  102d8b:	c3                   	ret    

00102d8c <printnum>:
  102d8c:	55                   	push   %ebp
  102d8d:	89 e5                	mov    %esp,%ebp
  102d8f:	57                   	push   %edi
  102d90:	56                   	push   %esi
  102d91:	53                   	push   %ebx
  102d92:	83 ec 1c             	sub    $0x1c,%esp
  102d95:	e8 a8 04 00 00       	call   103242 <__x86.get_pc_thunk.si>
  102d9a:	81 c6 66 62 00 00    	add    $0x6266,%esi
  102da0:	8b 45 10             	mov    0x10(%ebp),%eax
  102da3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102da6:	8b 45 14             	mov    0x14(%ebp),%eax
  102da9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102dac:	8b 45 18             	mov    0x18(%ebp),%eax
  102daf:	ba 00 00 00 00       	mov    $0x0,%edx
  102db4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  102db7:	39 45 e0             	cmp    %eax,-0x20(%ebp)
  102dba:	19 d1                	sbb    %edx,%ecx
  102dbc:	72 4d                	jb     102e0b <printnum+0x7f>
  102dbe:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102dc1:	8d 78 ff             	lea    -0x1(%eax),%edi
  102dc4:	8b 45 18             	mov    0x18(%ebp),%eax
  102dc7:	ba 00 00 00 00       	mov    $0x0,%edx
  102dcc:	52                   	push   %edx
  102dcd:	50                   	push   %eax
  102dce:	ff 75 e4             	push   -0x1c(%ebp)
  102dd1:	ff 75 e0             	push   -0x20(%ebp)
  102dd4:	89 f3                	mov    %esi,%ebx
  102dd6:	e8 b5 28 00 00       	call   105690 <__udivdi3>
  102ddb:	83 c4 10             	add    $0x10,%esp
  102dde:	83 ec 04             	sub    $0x4,%esp
  102de1:	ff 75 20             	push   0x20(%ebp)
  102de4:	57                   	push   %edi
  102de5:	ff 75 18             	push   0x18(%ebp)
  102de8:	52                   	push   %edx
  102de9:	50                   	push   %eax
  102dea:	ff 75 0c             	push   0xc(%ebp)
  102ded:	ff 75 08             	push   0x8(%ebp)
  102df0:	e8 97 ff ff ff       	call   102d8c <printnum>
  102df5:	83 c4 20             	add    $0x20,%esp
  102df8:	eb 1b                	jmp    102e15 <printnum+0x89>
  102dfa:	83 ec 08             	sub    $0x8,%esp
  102dfd:	ff 75 0c             	push   0xc(%ebp)
  102e00:	ff 75 20             	push   0x20(%ebp)
  102e03:	8b 45 08             	mov    0x8(%ebp),%eax
  102e06:	ff d0                	call   *%eax
  102e08:	83 c4 10             	add    $0x10,%esp
  102e0b:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102e0f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102e13:	7f e5                	jg     102dfa <printnum+0x6e>
  102e15:	8b 4d 18             	mov    0x18(%ebp),%ecx
  102e18:	bb 00 00 00 00       	mov    $0x0,%ebx
  102e1d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e20:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e23:	53                   	push   %ebx
  102e24:	51                   	push   %ecx
  102e25:	52                   	push   %edx
  102e26:	50                   	push   %eax
  102e27:	89 f3                	mov    %esi,%ebx
  102e29:	e8 82 29 00 00       	call   1057b0 <__umoddi3>
  102e2e:	83 c4 10             	add    $0x10,%esp
  102e31:	8d 8e 5c d1 ff ff    	lea    -0x2ea4(%esi),%ecx
  102e37:	01 c8                	add    %ecx,%eax
  102e39:	0f b6 00             	movzbl (%eax),%eax
  102e3c:	0f be c0             	movsbl %al,%eax
  102e3f:	83 ec 08             	sub    $0x8,%esp
  102e42:	ff 75 0c             	push   0xc(%ebp)
  102e45:	50                   	push   %eax
  102e46:	8b 45 08             	mov    0x8(%ebp),%eax
  102e49:	ff d0                	call   *%eax
  102e4b:	83 c4 10             	add    $0x10,%esp
  102e4e:	90                   	nop
  102e4f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  102e52:	5b                   	pop    %ebx
  102e53:	5e                   	pop    %esi
  102e54:	5f                   	pop    %edi
  102e55:	5d                   	pop    %ebp
  102e56:	c3                   	ret    

00102e57 <getuint>:
  102e57:	55                   	push   %ebp
  102e58:	89 e5                	mov    %esp,%ebp
  102e5a:	e8 56 d5 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102e5f:	05 a1 61 00 00       	add    $0x61a1,%eax
  102e64:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102e68:	7e 14                	jle    102e7e <getuint+0x27>
  102e6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e6d:	8b 00                	mov    (%eax),%eax
  102e6f:	8d 48 08             	lea    0x8(%eax),%ecx
  102e72:	8b 55 08             	mov    0x8(%ebp),%edx
  102e75:	89 0a                	mov    %ecx,(%edx)
  102e77:	8b 50 04             	mov    0x4(%eax),%edx
  102e7a:	8b 00                	mov    (%eax),%eax
  102e7c:	eb 30                	jmp    102eae <getuint+0x57>
  102e7e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e82:	74 16                	je     102e9a <getuint+0x43>
  102e84:	8b 45 08             	mov    0x8(%ebp),%eax
  102e87:	8b 00                	mov    (%eax),%eax
  102e89:	8d 48 04             	lea    0x4(%eax),%ecx
  102e8c:	8b 55 08             	mov    0x8(%ebp),%edx
  102e8f:	89 0a                	mov    %ecx,(%edx)
  102e91:	8b 00                	mov    (%eax),%eax
  102e93:	ba 00 00 00 00       	mov    $0x0,%edx
  102e98:	eb 14                	jmp    102eae <getuint+0x57>
  102e9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e9d:	8b 00                	mov    (%eax),%eax
  102e9f:	8d 48 04             	lea    0x4(%eax),%ecx
  102ea2:	8b 55 08             	mov    0x8(%ebp),%edx
  102ea5:	89 0a                	mov    %ecx,(%edx)
  102ea7:	8b 00                	mov    (%eax),%eax
  102ea9:	ba 00 00 00 00       	mov    $0x0,%edx
  102eae:	5d                   	pop    %ebp
  102eaf:	c3                   	ret    

00102eb0 <getint>:
  102eb0:	55                   	push   %ebp
  102eb1:	89 e5                	mov    %esp,%ebp
  102eb3:	e8 fd d4 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  102eb8:	05 48 61 00 00       	add    $0x6148,%eax
  102ebd:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102ec1:	7e 14                	jle    102ed7 <getint+0x27>
  102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec6:	8b 00                	mov    (%eax),%eax
  102ec8:	8d 48 08             	lea    0x8(%eax),%ecx
  102ecb:	8b 55 08             	mov    0x8(%ebp),%edx
  102ece:	89 0a                	mov    %ecx,(%edx)
  102ed0:	8b 50 04             	mov    0x4(%eax),%edx
  102ed3:	8b 00                	mov    (%eax),%eax
  102ed5:	eb 28                	jmp    102eff <getint+0x4f>
  102ed7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102edb:	74 12                	je     102eef <getint+0x3f>
  102edd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee0:	8b 00                	mov    (%eax),%eax
  102ee2:	8d 48 04             	lea    0x4(%eax),%ecx
  102ee5:	8b 55 08             	mov    0x8(%ebp),%edx
  102ee8:	89 0a                	mov    %ecx,(%edx)
  102eea:	8b 00                	mov    (%eax),%eax
  102eec:	99                   	cltd   
  102eed:	eb 10                	jmp    102eff <getint+0x4f>
  102eef:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef2:	8b 00                	mov    (%eax),%eax
  102ef4:	8d 48 04             	lea    0x4(%eax),%ecx
  102ef7:	8b 55 08             	mov    0x8(%ebp),%edx
  102efa:	89 0a                	mov    %ecx,(%edx)
  102efc:	8b 00                	mov    (%eax),%eax
  102efe:	99                   	cltd   
  102eff:	5d                   	pop    %ebp
  102f00:	c3                   	ret    

00102f01 <vprintfmt>:
  102f01:	55                   	push   %ebp
  102f02:	89 e5                	mov    %esp,%ebp
  102f04:	57                   	push   %edi
  102f05:	56                   	push   %esi
  102f06:	53                   	push   %ebx
  102f07:	83 ec 2c             	sub    $0x2c,%esp
  102f0a:	e8 37 03 00 00       	call   103246 <__x86.get_pc_thunk.di>
  102f0f:	81 c7 f1 60 00 00    	add    $0x60f1,%edi
  102f15:	eb 17                	jmp    102f2e <vprintfmt+0x2d>
  102f17:	85 db                	test   %ebx,%ebx
  102f19:	0f 84 1a 03 00 00    	je     103239 <.L20+0x2d>
  102f1f:	83 ec 08             	sub    $0x8,%esp
  102f22:	ff 75 0c             	push   0xc(%ebp)
  102f25:	53                   	push   %ebx
  102f26:	8b 45 08             	mov    0x8(%ebp),%eax
  102f29:	ff d0                	call   *%eax
  102f2b:	83 c4 10             	add    $0x10,%esp
  102f2e:	8b 45 10             	mov    0x10(%ebp),%eax
  102f31:	8d 50 01             	lea    0x1(%eax),%edx
  102f34:	89 55 10             	mov    %edx,0x10(%ebp)
  102f37:	0f b6 00             	movzbl (%eax),%eax
  102f3a:	0f b6 d8             	movzbl %al,%ebx
  102f3d:	83 fb 25             	cmp    $0x25,%ebx
  102f40:	75 d5                	jne    102f17 <vprintfmt+0x16>
  102f42:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
  102f46:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  102f4d:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  102f54:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  102f5b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  102f62:	8b 45 10             	mov    0x10(%ebp),%eax
  102f65:	8d 50 01             	lea    0x1(%eax),%edx
  102f68:	89 55 10             	mov    %edx,0x10(%ebp)
  102f6b:	0f b6 00             	movzbl (%eax),%eax
  102f6e:	0f b6 d8             	movzbl %al,%ebx
  102f71:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102f74:	83 f8 55             	cmp    $0x55,%eax
  102f77:	0f 87 8f 02 00 00    	ja     10320c <.L20>
  102f7d:	c1 e0 02             	shl    $0x2,%eax
  102f80:	8b 84 38 74 d1 ff ff 	mov    -0x2e8c(%eax,%edi,1),%eax
  102f87:	01 f8                	add    %edi,%eax
  102f89:	ff e0                	jmp    *%eax

00102f8b <.L32>:
  102f8b:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
  102f8f:	eb d1                	jmp    102f62 <vprintfmt+0x61>

00102f91 <.L30>:
  102f91:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
  102f95:	eb cb                	jmp    102f62 <vprintfmt+0x61>

00102f97 <.L29>:
  102f97:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  102f9e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  102fa1:	89 d0                	mov    %edx,%eax
  102fa3:	c1 e0 02             	shl    $0x2,%eax
  102fa6:	01 d0                	add    %edx,%eax
  102fa8:	01 c0                	add    %eax,%eax
  102faa:	01 d8                	add    %ebx,%eax
  102fac:	83 e8 30             	sub    $0x30,%eax
  102faf:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102fb2:	8b 45 10             	mov    0x10(%ebp),%eax
  102fb5:	0f b6 00             	movzbl (%eax),%eax
  102fb8:	0f be d8             	movsbl %al,%ebx
  102fbb:	83 fb 2f             	cmp    $0x2f,%ebx
  102fbe:	7e 39                	jle    102ff9 <.L35+0xc>
  102fc0:	83 fb 39             	cmp    $0x39,%ebx
  102fc3:	7f 34                	jg     102ff9 <.L35+0xc>
  102fc5:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102fc9:	eb d3                	jmp    102f9e <.L29+0x7>

00102fcb <.L33>:
  102fcb:	8b 45 14             	mov    0x14(%ebp),%eax
  102fce:	8d 50 04             	lea    0x4(%eax),%edx
  102fd1:	89 55 14             	mov    %edx,0x14(%ebp)
  102fd4:	8b 00                	mov    (%eax),%eax
  102fd6:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102fd9:	eb 1f                	jmp    102ffa <.L35+0xd>

00102fdb <.L31>:
  102fdb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  102fdf:	79 81                	jns    102f62 <vprintfmt+0x61>
  102fe1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  102fe8:	e9 75 ff ff ff       	jmp    102f62 <vprintfmt+0x61>

00102fed <.L35>:
  102fed:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
  102ff4:	e9 69 ff ff ff       	jmp    102f62 <vprintfmt+0x61>
  102ff9:	90                   	nop
  102ffa:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  102ffe:	0f 89 5e ff ff ff    	jns    102f62 <vprintfmt+0x61>
  103004:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103007:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  10300a:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  103011:	e9 4c ff ff ff       	jmp    102f62 <vprintfmt+0x61>

00103016 <.L26>:
  103016:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
  10301a:	e9 43 ff ff ff       	jmp    102f62 <vprintfmt+0x61>

0010301f <.L28>:
  10301f:	8b 45 14             	mov    0x14(%ebp),%eax
  103022:	8d 50 04             	lea    0x4(%eax),%edx
  103025:	89 55 14             	mov    %edx,0x14(%ebp)
  103028:	8b 00                	mov    (%eax),%eax
  10302a:	83 ec 08             	sub    $0x8,%esp
  10302d:	ff 75 0c             	push   0xc(%ebp)
  103030:	50                   	push   %eax
  103031:	8b 45 08             	mov    0x8(%ebp),%eax
  103034:	ff d0                	call   *%eax
  103036:	83 c4 10             	add    $0x10,%esp
  103039:	e9 f6 01 00 00       	jmp    103234 <.L20+0x28>

0010303e <.L24>:
  10303e:	8b 45 14             	mov    0x14(%ebp),%eax
  103041:	8d 50 04             	lea    0x4(%eax),%edx
  103044:	89 55 14             	mov    %edx,0x14(%ebp)
  103047:	8b 30                	mov    (%eax),%esi
  103049:	85 f6                	test   %esi,%esi
  10304b:	75 06                	jne    103053 <.L24+0x15>
  10304d:	8d b7 6d d1 ff ff    	lea    -0x2e93(%edi),%esi
  103053:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103057:	7e 71                	jle    1030ca <.L24+0x8c>
  103059:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  10305d:	74 6b                	je     1030ca <.L24+0x8c>
  10305f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103062:	83 ec 08             	sub    $0x8,%esp
  103065:	50                   	push   %eax
  103066:	56                   	push   %esi
  103067:	89 fb                	mov    %edi,%ebx
  103069:	e8 0b f9 ff ff       	call   102979 <strnlen>
  10306e:	83 c4 10             	add    $0x10,%esp
  103071:	29 45 d4             	sub    %eax,-0x2c(%ebp)
  103074:	eb 17                	jmp    10308d <.L24+0x4f>
  103076:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  10307a:	83 ec 08             	sub    $0x8,%esp
  10307d:	ff 75 0c             	push   0xc(%ebp)
  103080:	50                   	push   %eax
  103081:	8b 45 08             	mov    0x8(%ebp),%eax
  103084:	ff d0                	call   *%eax
  103086:	83 c4 10             	add    $0x10,%esp
  103089:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  10308d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103091:	7f e3                	jg     103076 <.L24+0x38>
  103093:	eb 35                	jmp    1030ca <.L24+0x8c>
  103095:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  103099:	74 1c                	je     1030b7 <.L24+0x79>
  10309b:	83 fb 1f             	cmp    $0x1f,%ebx
  10309e:	7e 05                	jle    1030a5 <.L24+0x67>
  1030a0:	83 fb 7e             	cmp    $0x7e,%ebx
  1030a3:	7e 12                	jle    1030b7 <.L24+0x79>
  1030a5:	83 ec 08             	sub    $0x8,%esp
  1030a8:	ff 75 0c             	push   0xc(%ebp)
  1030ab:	6a 3f                	push   $0x3f
  1030ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b0:	ff d0                	call   *%eax
  1030b2:	83 c4 10             	add    $0x10,%esp
  1030b5:	eb 0f                	jmp    1030c6 <.L24+0x88>
  1030b7:	83 ec 08             	sub    $0x8,%esp
  1030ba:	ff 75 0c             	push   0xc(%ebp)
  1030bd:	53                   	push   %ebx
  1030be:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c1:	ff d0                	call   *%eax
  1030c3:	83 c4 10             	add    $0x10,%esp
  1030c6:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  1030ca:	89 f0                	mov    %esi,%eax
  1030cc:	8d 70 01             	lea    0x1(%eax),%esi
  1030cf:	0f b6 00             	movzbl (%eax),%eax
  1030d2:	0f be d8             	movsbl %al,%ebx
  1030d5:	85 db                	test   %ebx,%ebx
  1030d7:	74 26                	je     1030ff <.L24+0xc1>
  1030d9:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  1030dd:	78 b6                	js     103095 <.L24+0x57>
  1030df:	83 6d d0 01          	subl   $0x1,-0x30(%ebp)
  1030e3:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  1030e7:	79 ac                	jns    103095 <.L24+0x57>
  1030e9:	eb 14                	jmp    1030ff <.L24+0xc1>
  1030eb:	83 ec 08             	sub    $0x8,%esp
  1030ee:	ff 75 0c             	push   0xc(%ebp)
  1030f1:	6a 20                	push   $0x20
  1030f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f6:	ff d0                	call   *%eax
  1030f8:	83 c4 10             	add    $0x10,%esp
  1030fb:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  1030ff:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103103:	7f e6                	jg     1030eb <.L24+0xad>
  103105:	e9 2a 01 00 00       	jmp    103234 <.L20+0x28>

0010310a <.L27>:
  10310a:	83 ec 08             	sub    $0x8,%esp
  10310d:	ff 75 d8             	push   -0x28(%ebp)
  103110:	8d 45 14             	lea    0x14(%ebp),%eax
  103113:	50                   	push   %eax
  103114:	e8 97 fd ff ff       	call   102eb0 <getint>
  103119:	83 c4 10             	add    $0x10,%esp
  10311c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10311f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103122:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103125:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103128:	85 d2                	test   %edx,%edx
  10312a:	79 23                	jns    10314f <.L27+0x45>
  10312c:	83 ec 08             	sub    $0x8,%esp
  10312f:	ff 75 0c             	push   0xc(%ebp)
  103132:	6a 2d                	push   $0x2d
  103134:	8b 45 08             	mov    0x8(%ebp),%eax
  103137:	ff d0                	call   *%eax
  103139:	83 c4 10             	add    $0x10,%esp
  10313c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10313f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103142:	f7 d8                	neg    %eax
  103144:	83 d2 00             	adc    $0x0,%edx
  103147:	f7 da                	neg    %edx
  103149:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10314c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10314f:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  103156:	eb 7e                	jmp    1031d6 <.L21+0x1f>

00103158 <.L23>:
  103158:	83 ec 08             	sub    $0x8,%esp
  10315b:	ff 75 d8             	push   -0x28(%ebp)
  10315e:	8d 45 14             	lea    0x14(%ebp),%eax
  103161:	50                   	push   %eax
  103162:	e8 f0 fc ff ff       	call   102e57 <getuint>
  103167:	83 c4 10             	add    $0x10,%esp
  10316a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10316d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103170:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  103177:	eb 5d                	jmp    1031d6 <.L21+0x1f>

00103179 <.L25>:
  103179:	83 ec 08             	sub    $0x8,%esp
  10317c:	ff 75 0c             	push   0xc(%ebp)
  10317f:	6a 30                	push   $0x30
  103181:	8b 45 08             	mov    0x8(%ebp),%eax
  103184:	ff d0                	call   *%eax
  103186:	83 c4 10             	add    $0x10,%esp
  103189:	83 ec 08             	sub    $0x8,%esp
  10318c:	ff 75 0c             	push   0xc(%ebp)
  10318f:	6a 78                	push   $0x78
  103191:	8b 45 08             	mov    0x8(%ebp),%eax
  103194:	ff d0                	call   *%eax
  103196:	83 c4 10             	add    $0x10,%esp
  103199:	8b 45 14             	mov    0x14(%ebp),%eax
  10319c:	8d 50 04             	lea    0x4(%eax),%edx
  10319f:	89 55 14             	mov    %edx,0x14(%ebp)
  1031a2:	8b 00                	mov    (%eax),%eax
  1031a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1031a7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1031ae:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  1031b5:	eb 1f                	jmp    1031d6 <.L21+0x1f>

001031b7 <.L21>:
  1031b7:	83 ec 08             	sub    $0x8,%esp
  1031ba:	ff 75 d8             	push   -0x28(%ebp)
  1031bd:	8d 45 14             	lea    0x14(%ebp),%eax
  1031c0:	50                   	push   %eax
  1031c1:	e8 91 fc ff ff       	call   102e57 <getuint>
  1031c6:	83 c4 10             	add    $0x10,%esp
  1031c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1031cc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1031cf:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  1031d6:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  1031da:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1031dd:	83 ec 04             	sub    $0x4,%esp
  1031e0:	52                   	push   %edx
  1031e1:	ff 75 d4             	push   -0x2c(%ebp)
  1031e4:	50                   	push   %eax
  1031e5:	ff 75 e4             	push   -0x1c(%ebp)
  1031e8:	ff 75 e0             	push   -0x20(%ebp)
  1031eb:	ff 75 0c             	push   0xc(%ebp)
  1031ee:	ff 75 08             	push   0x8(%ebp)
  1031f1:	e8 96 fb ff ff       	call   102d8c <printnum>
  1031f6:	83 c4 20             	add    $0x20,%esp
  1031f9:	eb 39                	jmp    103234 <.L20+0x28>

001031fb <.L34>:
  1031fb:	83 ec 08             	sub    $0x8,%esp
  1031fe:	ff 75 0c             	push   0xc(%ebp)
  103201:	53                   	push   %ebx
  103202:	8b 45 08             	mov    0x8(%ebp),%eax
  103205:	ff d0                	call   *%eax
  103207:	83 c4 10             	add    $0x10,%esp
  10320a:	eb 28                	jmp    103234 <.L20+0x28>

0010320c <.L20>:
  10320c:	83 ec 08             	sub    $0x8,%esp
  10320f:	ff 75 0c             	push   0xc(%ebp)
  103212:	6a 25                	push   $0x25
  103214:	8b 45 08             	mov    0x8(%ebp),%eax
  103217:	ff d0                	call   *%eax
  103219:	83 c4 10             	add    $0x10,%esp
  10321c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103220:	eb 04                	jmp    103226 <.L20+0x1a>
  103222:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103226:	8b 45 10             	mov    0x10(%ebp),%eax
  103229:	83 e8 01             	sub    $0x1,%eax
  10322c:	0f b6 00             	movzbl (%eax),%eax
  10322f:	3c 25                	cmp    $0x25,%al
  103231:	75 ef                	jne    103222 <.L20+0x16>
  103233:	90                   	nop
  103234:	e9 f5 fc ff ff       	jmp    102f2e <vprintfmt+0x2d>
  103239:	90                   	nop
  10323a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10323d:	5b                   	pop    %ebx
  10323e:	5e                   	pop    %esi
  10323f:	5f                   	pop    %edi
  103240:	5d                   	pop    %ebp
  103241:	c3                   	ret    

00103242 <__x86.get_pc_thunk.si>:
  103242:	8b 34 24             	mov    (%esp),%esi
  103245:	c3                   	ret    

00103246 <__x86.get_pc_thunk.di>:
  103246:	8b 3c 24             	mov    (%esp),%edi
  103249:	c3                   	ret    

0010324a <seg_init>:
  10324a:	55                   	push   %ebp
  10324b:	89 e5                	mov    %esp,%ebp
  10324d:	53                   	push   %ebx
  10324e:	83 ec 14             	sub    $0x14,%esp
  103251:	e8 67 d1 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  103256:	81 c3 aa 5d 00 00    	add    $0x5daa,%ebx
  10325c:	8d 83 00 90 00 00    	lea    0x9000(%ebx),%eax
  103262:	c7 c2 f0 f8 10 00    	mov    $0x10f8f0,%edx
  103268:	29 d0                	sub    %edx,%eax
  10326a:	83 ec 08             	sub    $0x8,%esp
  10326d:	50                   	push   %eax
  10326e:	c7 c0 f0 f8 10 00    	mov    $0x10f8f0,%eax
  103274:	50                   	push   %eax
  103275:	e8 bf f7 ff ff       	call   102a39 <memzero>
  10327a:	83 c4 10             	add    $0x10,%esp
  10327d:	c7 c0 00 80 d9 00    	mov    $0xd98000,%eax
  103283:	8d 93 00 90 00 00    	lea    0x9000(%ebx),%edx
  103289:	29 d0                	sub    %edx,%eax
  10328b:	2d 00 10 00 00       	sub    $0x1000,%eax
  103290:	89 c2                	mov    %eax,%edx
  103292:	8d 83 00 a0 00 00    	lea    0xa000(%ebx),%eax
  103298:	83 ec 08             	sub    $0x8,%esp
  10329b:	52                   	push   %edx
  10329c:	50                   	push   %eax
  10329d:	e8 97 f7 ff ff       	call   102a39 <memzero>
  1032a2:	83 c4 10             	add    $0x10,%esp
  1032a5:	c7 83 00 a0 04 00 00 	movl   $0x0,0x4a000(%ebx)
  1032ac:	00 00 00 
  1032af:	c7 83 04 a0 04 00 00 	movl   $0x0,0x4a004(%ebx)
  1032b6:	00 00 00 
  1032b9:	66 c7 83 08 a0 04 00 	movw   $0xffff,0x4a008(%ebx)
  1032c0:	ff ff 
  1032c2:	66 c7 83 0a a0 04 00 	movw   $0x0,0x4a00a(%ebx)
  1032c9:	00 00 
  1032cb:	c6 83 0c a0 04 00 00 	movb   $0x0,0x4a00c(%ebx)
  1032d2:	0f b6 83 0d a0 04 00 	movzbl 0x4a00d(%ebx),%eax
  1032d9:	83 e0 f0             	and    $0xfffffff0,%eax
  1032dc:	83 c8 0a             	or     $0xa,%eax
  1032df:	88 83 0d a0 04 00    	mov    %al,0x4a00d(%ebx)
  1032e5:	0f b6 83 0d a0 04 00 	movzbl 0x4a00d(%ebx),%eax
  1032ec:	83 c8 10             	or     $0x10,%eax
  1032ef:	88 83 0d a0 04 00    	mov    %al,0x4a00d(%ebx)
  1032f5:	0f b6 83 0d a0 04 00 	movzbl 0x4a00d(%ebx),%eax
  1032fc:	83 e0 9f             	and    $0xffffff9f,%eax
  1032ff:	88 83 0d a0 04 00    	mov    %al,0x4a00d(%ebx)
  103305:	0f b6 83 0d a0 04 00 	movzbl 0x4a00d(%ebx),%eax
  10330c:	83 c8 80             	or     $0xffffff80,%eax
  10330f:	88 83 0d a0 04 00    	mov    %al,0x4a00d(%ebx)
  103315:	0f b6 83 0e a0 04 00 	movzbl 0x4a00e(%ebx),%eax
  10331c:	83 c8 0f             	or     $0xf,%eax
  10331f:	88 83 0e a0 04 00    	mov    %al,0x4a00e(%ebx)
  103325:	0f b6 83 0e a0 04 00 	movzbl 0x4a00e(%ebx),%eax
  10332c:	83 e0 ef             	and    $0xffffffef,%eax
  10332f:	88 83 0e a0 04 00    	mov    %al,0x4a00e(%ebx)
  103335:	0f b6 83 0e a0 04 00 	movzbl 0x4a00e(%ebx),%eax
  10333c:	83 e0 df             	and    $0xffffffdf,%eax
  10333f:	88 83 0e a0 04 00    	mov    %al,0x4a00e(%ebx)
  103345:	0f b6 83 0e a0 04 00 	movzbl 0x4a00e(%ebx),%eax
  10334c:	83 c8 40             	or     $0x40,%eax
  10334f:	88 83 0e a0 04 00    	mov    %al,0x4a00e(%ebx)
  103355:	0f b6 83 0e a0 04 00 	movzbl 0x4a00e(%ebx),%eax
  10335c:	83 c8 80             	or     $0xffffff80,%eax
  10335f:	88 83 0e a0 04 00    	mov    %al,0x4a00e(%ebx)
  103365:	c6 83 0f a0 04 00 00 	movb   $0x0,0x4a00f(%ebx)
  10336c:	66 c7 83 10 a0 04 00 	movw   $0xffff,0x4a010(%ebx)
  103373:	ff ff 
  103375:	66 c7 83 12 a0 04 00 	movw   $0x0,0x4a012(%ebx)
  10337c:	00 00 
  10337e:	c6 83 14 a0 04 00 00 	movb   $0x0,0x4a014(%ebx)
  103385:	0f b6 83 15 a0 04 00 	movzbl 0x4a015(%ebx),%eax
  10338c:	83 e0 f0             	and    $0xfffffff0,%eax
  10338f:	83 c8 02             	or     $0x2,%eax
  103392:	88 83 15 a0 04 00    	mov    %al,0x4a015(%ebx)
  103398:	0f b6 83 15 a0 04 00 	movzbl 0x4a015(%ebx),%eax
  10339f:	83 c8 10             	or     $0x10,%eax
  1033a2:	88 83 15 a0 04 00    	mov    %al,0x4a015(%ebx)
  1033a8:	0f b6 83 15 a0 04 00 	movzbl 0x4a015(%ebx),%eax
  1033af:	83 e0 9f             	and    $0xffffff9f,%eax
  1033b2:	88 83 15 a0 04 00    	mov    %al,0x4a015(%ebx)
  1033b8:	0f b6 83 15 a0 04 00 	movzbl 0x4a015(%ebx),%eax
  1033bf:	83 c8 80             	or     $0xffffff80,%eax
  1033c2:	88 83 15 a0 04 00    	mov    %al,0x4a015(%ebx)
  1033c8:	0f b6 83 16 a0 04 00 	movzbl 0x4a016(%ebx),%eax
  1033cf:	83 c8 0f             	or     $0xf,%eax
  1033d2:	88 83 16 a0 04 00    	mov    %al,0x4a016(%ebx)
  1033d8:	0f b6 83 16 a0 04 00 	movzbl 0x4a016(%ebx),%eax
  1033df:	83 e0 ef             	and    $0xffffffef,%eax
  1033e2:	88 83 16 a0 04 00    	mov    %al,0x4a016(%ebx)
  1033e8:	0f b6 83 16 a0 04 00 	movzbl 0x4a016(%ebx),%eax
  1033ef:	83 e0 df             	and    $0xffffffdf,%eax
  1033f2:	88 83 16 a0 04 00    	mov    %al,0x4a016(%ebx)
  1033f8:	0f b6 83 16 a0 04 00 	movzbl 0x4a016(%ebx),%eax
  1033ff:	83 c8 40             	or     $0x40,%eax
  103402:	88 83 16 a0 04 00    	mov    %al,0x4a016(%ebx)
  103408:	0f b6 83 16 a0 04 00 	movzbl 0x4a016(%ebx),%eax
  10340f:	83 c8 80             	or     $0xffffff80,%eax
  103412:	88 83 16 a0 04 00    	mov    %al,0x4a016(%ebx)
  103418:	c6 83 17 a0 04 00 00 	movb   $0x0,0x4a017(%ebx)
  10341f:	66 c7 83 18 a0 04 00 	movw   $0xffff,0x4a018(%ebx)
  103426:	ff ff 
  103428:	66 c7 83 1a a0 04 00 	movw   $0x0,0x4a01a(%ebx)
  10342f:	00 00 
  103431:	c6 83 1c a0 04 00 00 	movb   $0x0,0x4a01c(%ebx)
  103438:	0f b6 83 1d a0 04 00 	movzbl 0x4a01d(%ebx),%eax
  10343f:	83 e0 f0             	and    $0xfffffff0,%eax
  103442:	83 c8 0a             	or     $0xa,%eax
  103445:	88 83 1d a0 04 00    	mov    %al,0x4a01d(%ebx)
  10344b:	0f b6 83 1d a0 04 00 	movzbl 0x4a01d(%ebx),%eax
  103452:	83 c8 10             	or     $0x10,%eax
  103455:	88 83 1d a0 04 00    	mov    %al,0x4a01d(%ebx)
  10345b:	0f b6 83 1d a0 04 00 	movzbl 0x4a01d(%ebx),%eax
  103462:	83 c8 60             	or     $0x60,%eax
  103465:	88 83 1d a0 04 00    	mov    %al,0x4a01d(%ebx)
  10346b:	0f b6 83 1d a0 04 00 	movzbl 0x4a01d(%ebx),%eax
  103472:	83 c8 80             	or     $0xffffff80,%eax
  103475:	88 83 1d a0 04 00    	mov    %al,0x4a01d(%ebx)
  10347b:	0f b6 83 1e a0 04 00 	movzbl 0x4a01e(%ebx),%eax
  103482:	83 c8 0f             	or     $0xf,%eax
  103485:	88 83 1e a0 04 00    	mov    %al,0x4a01e(%ebx)
  10348b:	0f b6 83 1e a0 04 00 	movzbl 0x4a01e(%ebx),%eax
  103492:	83 e0 ef             	and    $0xffffffef,%eax
  103495:	88 83 1e a0 04 00    	mov    %al,0x4a01e(%ebx)
  10349b:	0f b6 83 1e a0 04 00 	movzbl 0x4a01e(%ebx),%eax
  1034a2:	83 e0 df             	and    $0xffffffdf,%eax
  1034a5:	88 83 1e a0 04 00    	mov    %al,0x4a01e(%ebx)
  1034ab:	0f b6 83 1e a0 04 00 	movzbl 0x4a01e(%ebx),%eax
  1034b2:	83 c8 40             	or     $0x40,%eax
  1034b5:	88 83 1e a0 04 00    	mov    %al,0x4a01e(%ebx)
  1034bb:	0f b6 83 1e a0 04 00 	movzbl 0x4a01e(%ebx),%eax
  1034c2:	83 c8 80             	or     $0xffffff80,%eax
  1034c5:	88 83 1e a0 04 00    	mov    %al,0x4a01e(%ebx)
  1034cb:	c6 83 1f a0 04 00 00 	movb   $0x0,0x4a01f(%ebx)
  1034d2:	66 c7 83 20 a0 04 00 	movw   $0xffff,0x4a020(%ebx)
  1034d9:	ff ff 
  1034db:	66 c7 83 22 a0 04 00 	movw   $0x0,0x4a022(%ebx)
  1034e2:	00 00 
  1034e4:	c6 83 24 a0 04 00 00 	movb   $0x0,0x4a024(%ebx)
  1034eb:	0f b6 83 25 a0 04 00 	movzbl 0x4a025(%ebx),%eax
  1034f2:	83 e0 f0             	and    $0xfffffff0,%eax
  1034f5:	83 c8 02             	or     $0x2,%eax
  1034f8:	88 83 25 a0 04 00    	mov    %al,0x4a025(%ebx)
  1034fe:	0f b6 83 25 a0 04 00 	movzbl 0x4a025(%ebx),%eax
  103505:	83 c8 10             	or     $0x10,%eax
  103508:	88 83 25 a0 04 00    	mov    %al,0x4a025(%ebx)
  10350e:	0f b6 83 25 a0 04 00 	movzbl 0x4a025(%ebx),%eax
  103515:	83 c8 60             	or     $0x60,%eax
  103518:	88 83 25 a0 04 00    	mov    %al,0x4a025(%ebx)
  10351e:	0f b6 83 25 a0 04 00 	movzbl 0x4a025(%ebx),%eax
  103525:	83 c8 80             	or     $0xffffff80,%eax
  103528:	88 83 25 a0 04 00    	mov    %al,0x4a025(%ebx)
  10352e:	0f b6 83 26 a0 04 00 	movzbl 0x4a026(%ebx),%eax
  103535:	83 c8 0f             	or     $0xf,%eax
  103538:	88 83 26 a0 04 00    	mov    %al,0x4a026(%ebx)
  10353e:	0f b6 83 26 a0 04 00 	movzbl 0x4a026(%ebx),%eax
  103545:	83 e0 ef             	and    $0xffffffef,%eax
  103548:	88 83 26 a0 04 00    	mov    %al,0x4a026(%ebx)
  10354e:	0f b6 83 26 a0 04 00 	movzbl 0x4a026(%ebx),%eax
  103555:	83 e0 df             	and    $0xffffffdf,%eax
  103558:	88 83 26 a0 04 00    	mov    %al,0x4a026(%ebx)
  10355e:	0f b6 83 26 a0 04 00 	movzbl 0x4a026(%ebx),%eax
  103565:	83 c8 40             	or     $0x40,%eax
  103568:	88 83 26 a0 04 00    	mov    %al,0x4a026(%ebx)
  10356e:	0f b6 83 26 a0 04 00 	movzbl 0x4a026(%ebx),%eax
  103575:	83 c8 80             	or     $0xffffff80,%eax
  103578:	88 83 26 a0 04 00    	mov    %al,0x4a026(%ebx)
  10357e:	c6 83 27 a0 04 00 00 	movb   $0x0,0x4a027(%ebx)
  103585:	8d 83 00 90 00 00    	lea    0x9000(%ebx),%eax
  10358b:	05 00 10 00 00       	add    $0x1000,%eax
  103590:	89 83 44 db 04 00    	mov    %eax,0x4db44(%ebx)
  103596:	66 c7 83 48 db 04 00 	movw   $0x10,0x4db48(%ebx)
  10359d:	10 00 
  10359f:	66 c7 83 28 a0 04 00 	movw   $0xeb,0x4a028(%ebx)
  1035a6:	eb 00 
  1035a8:	8d 83 40 db 04 00    	lea    0x4db40(%ebx),%eax
  1035ae:	66 89 83 2a a0 04 00 	mov    %ax,0x4a02a(%ebx)
  1035b5:	8d 83 40 db 04 00    	lea    0x4db40(%ebx),%eax
  1035bb:	c1 e8 10             	shr    $0x10,%eax
  1035be:	88 83 2c a0 04 00    	mov    %al,0x4a02c(%ebx)
  1035c4:	0f b6 83 2d a0 04 00 	movzbl 0x4a02d(%ebx),%eax
  1035cb:	83 e0 f0             	and    $0xfffffff0,%eax
  1035ce:	83 c8 09             	or     $0x9,%eax
  1035d1:	88 83 2d a0 04 00    	mov    %al,0x4a02d(%ebx)
  1035d7:	0f b6 83 2d a0 04 00 	movzbl 0x4a02d(%ebx),%eax
  1035de:	83 c8 10             	or     $0x10,%eax
  1035e1:	88 83 2d a0 04 00    	mov    %al,0x4a02d(%ebx)
  1035e7:	0f b6 83 2d a0 04 00 	movzbl 0x4a02d(%ebx),%eax
  1035ee:	83 e0 9f             	and    $0xffffff9f,%eax
  1035f1:	88 83 2d a0 04 00    	mov    %al,0x4a02d(%ebx)
  1035f7:	0f b6 83 2d a0 04 00 	movzbl 0x4a02d(%ebx),%eax
  1035fe:	83 c8 80             	or     $0xffffff80,%eax
  103601:	88 83 2d a0 04 00    	mov    %al,0x4a02d(%ebx)
  103607:	0f b6 83 2e a0 04 00 	movzbl 0x4a02e(%ebx),%eax
  10360e:	83 e0 f0             	and    $0xfffffff0,%eax
  103611:	88 83 2e a0 04 00    	mov    %al,0x4a02e(%ebx)
  103617:	0f b6 83 2e a0 04 00 	movzbl 0x4a02e(%ebx),%eax
  10361e:	83 e0 ef             	and    $0xffffffef,%eax
  103621:	88 83 2e a0 04 00    	mov    %al,0x4a02e(%ebx)
  103627:	0f b6 83 2e a0 04 00 	movzbl 0x4a02e(%ebx),%eax
  10362e:	83 e0 df             	and    $0xffffffdf,%eax
  103631:	88 83 2e a0 04 00    	mov    %al,0x4a02e(%ebx)
  103637:	0f b6 83 2e a0 04 00 	movzbl 0x4a02e(%ebx),%eax
  10363e:	83 c8 40             	or     $0x40,%eax
  103641:	88 83 2e a0 04 00    	mov    %al,0x4a02e(%ebx)
  103647:	0f b6 83 2e a0 04 00 	movzbl 0x4a02e(%ebx),%eax
  10364e:	83 e0 7f             	and    $0x7f,%eax
  103651:	88 83 2e a0 04 00    	mov    %al,0x4a02e(%ebx)
  103657:	8d 83 40 db 04 00    	lea    0x4db40(%ebx),%eax
  10365d:	c1 e8 18             	shr    $0x18,%eax
  103660:	88 83 2f a0 04 00    	mov    %al,0x4a02f(%ebx)
  103666:	0f b6 83 2d a0 04 00 	movzbl 0x4a02d(%ebx),%eax
  10366d:	83 e0 ef             	and    $0xffffffef,%eax
  103670:	88 83 2d a0 04 00    	mov    %al,0x4a02d(%ebx)
  103676:	66 c7 45 ee 2f 00    	movw   $0x2f,-0x12(%ebp)
  10367c:	8d 83 00 a0 04 00    	lea    0x4a000(%ebx),%eax
  103682:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103685:	0f 01 55 ee          	lgdtl  -0x12(%ebp)
  103689:	b8 10 00 00 00       	mov    $0x10,%eax
  10368e:	8e e8                	mov    %eax,%gs
  103690:	b8 10 00 00 00       	mov    $0x10,%eax
  103695:	8e e0                	mov    %eax,%fs
  103697:	b8 10 00 00 00       	mov    $0x10,%eax
  10369c:	8e c0                	mov    %eax,%es
  10369e:	b8 10 00 00 00       	mov    $0x10,%eax
  1036a3:	8e d8                	mov    %eax,%ds
  1036a5:	b8 10 00 00 00       	mov    $0x10,%eax
  1036aa:	8e d0                	mov    %eax,%ss
  1036ac:	ea b3 36 10 00 08 00 	ljmp   $0x8,$0x1036b3
  1036b3:	83 ec 0c             	sub    $0xc,%esp
  1036b6:	6a 00                	push   $0x0
  1036b8:	e8 70 01 00 00       	call   10382d <lldt>
  1036bd:	83 c4 10             	add    $0x10,%esp
  1036c0:	83 ec 0c             	sub    $0xc,%esp
  1036c3:	6a 28                	push   $0x28
  1036c5:	e8 2f 03 00 00       	call   1039f9 <ltr>
  1036ca:	83 c4 10             	add    $0x10,%esp
  1036cd:	83 ec 08             	sub    $0x8,%esp
  1036d0:	68 00 3b 00 00       	push   $0x3b00
  1036d5:	8d 83 40 a0 04 00    	lea    0x4a040(%ebx),%eax
  1036db:	50                   	push   %eax
  1036dc:	e8 58 f3 ff ff       	call   102a39 <memzero>
  1036e1:	83 c4 10             	add    $0x10,%esp
  1036e4:	83 ec 08             	sub    $0x8,%esp
  1036e7:	68 00 00 04 00       	push   $0x40000
  1036ec:	8d 83 00 a0 00 00    	lea    0xa000(%ebx),%eax
  1036f2:	50                   	push   %eax
  1036f3:	e8 41 f3 ff ff       	call   102a39 <memzero>
  1036f8:	83 c4 10             	add    $0x10,%esp
  1036fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103702:	e9 9d 00 00 00       	jmp    1037a4 <seg_init+0x55a>
  103707:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10370a:	c1 e0 0c             	shl    $0xc,%eax
  10370d:	89 c2                	mov    %eax,%edx
  10370f:	8d 83 00 a0 00 00    	lea    0xa000(%ebx),%eax
  103715:	01 d0                	add    %edx,%eax
  103717:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  10371d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103720:	8d 8b 44 a0 04 00    	lea    0x4a044(%ebx),%ecx
  103726:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  10372c:	01 c8                	add    %ecx,%eax
  10372e:	89 10                	mov    %edx,(%eax)
  103730:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103733:	8d 93 48 a0 04 00    	lea    0x4a048(%ebx),%edx
  103739:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  10373f:	01 d0                	add    %edx,%eax
  103741:	66 c7 00 10 00       	movw   $0x10,(%eax)
  103746:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103749:	8d 93 46 a0 04 00    	lea    0x4a046(%ebx),%edx
  10374f:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103755:	01 d0                	add    %edx,%eax
  103757:	83 c0 60             	add    $0x60,%eax
  10375a:	66 c7 00 68 00       	movw   $0x68,(%eax)
  10375f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103762:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103768:	8d 50 60             	lea    0x60(%eax),%edx
  10376b:	8d 83 40 a0 04 00    	lea    0x4a040(%ebx),%eax
  103771:	01 d0                	add    %edx,%eax
  103773:	83 c0 08             	add    $0x8,%eax
  103776:	83 ec 08             	sub    $0x8,%esp
  103779:	68 80 00 00 00       	push   $0x80
  10377e:	50                   	push   %eax
  10377f:	e8 b5 f2 ff ff       	call   102a39 <memzero>
  103784:	83 c4 10             	add    $0x10,%esp
  103787:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10378a:	8d 93 48 a0 04 00    	lea    0x4a048(%ebx),%edx
  103790:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103796:	01 d0                	add    %edx,%eax
  103798:	05 e0 00 00 00       	add    $0xe0,%eax
  10379d:	c6 00 ff             	movb   $0xff,(%eax)
  1037a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1037a4:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  1037a8:	0f 86 59 ff ff ff    	jbe    103707 <seg_init+0x4bd>
  1037ae:	90                   	nop
  1037af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1037b2:	c9                   	leave  
  1037b3:	c3                   	ret    

001037b4 <max>:
  1037b4:	55                   	push   %ebp
  1037b5:	89 e5                	mov    %esp,%ebp
  1037b7:	e8 f9 cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1037bc:	05 44 58 00 00       	add    $0x5844,%eax
  1037c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1037c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1037c7:	39 c2                	cmp    %eax,%edx
  1037c9:	0f 43 c2             	cmovae %edx,%eax
  1037cc:	5d                   	pop    %ebp
  1037cd:	c3                   	ret    

001037ce <min>:
  1037ce:	55                   	push   %ebp
  1037cf:	89 e5                	mov    %esp,%ebp
  1037d1:	e8 df cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1037d6:	05 2a 58 00 00       	add    $0x582a,%eax
  1037db:	8b 55 0c             	mov    0xc(%ebp),%edx
  1037de:	8b 45 08             	mov    0x8(%ebp),%eax
  1037e1:	39 c2                	cmp    %eax,%edx
  1037e3:	0f 46 c2             	cmovbe %edx,%eax
  1037e6:	5d                   	pop    %ebp
  1037e7:	c3                   	ret    

001037e8 <rounddown>:
  1037e8:	55                   	push   %ebp
  1037e9:	89 e5                	mov    %esp,%ebp
  1037eb:	e8 c5 cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1037f0:	05 10 58 00 00       	add    $0x5810,%eax
  1037f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1037f8:	ba 00 00 00 00       	mov    $0x0,%edx
  1037fd:	f7 75 0c             	divl   0xc(%ebp)
  103800:	8b 45 08             	mov    0x8(%ebp),%eax
  103803:	29 d0                	sub    %edx,%eax
  103805:	5d                   	pop    %ebp
  103806:	c3                   	ret    

00103807 <roundup>:
  103807:	55                   	push   %ebp
  103808:	89 e5                	mov    %esp,%ebp
  10380a:	e8 a6 cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  10380f:	05 f1 57 00 00       	add    $0x57f1,%eax
  103814:	8b 55 08             	mov    0x8(%ebp),%edx
  103817:	8b 45 0c             	mov    0xc(%ebp),%eax
  10381a:	01 d0                	add    %edx,%eax
  10381c:	83 e8 01             	sub    $0x1,%eax
  10381f:	ff 75 0c             	push   0xc(%ebp)
  103822:	50                   	push   %eax
  103823:	e8 c0 ff ff ff       	call   1037e8 <rounddown>
  103828:	83 c4 08             	add    $0x8,%esp
  10382b:	c9                   	leave  
  10382c:	c3                   	ret    

0010382d <lldt>:
  10382d:	55                   	push   %ebp
  10382e:	89 e5                	mov    %esp,%ebp
  103830:	83 ec 04             	sub    $0x4,%esp
  103833:	e8 7d cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103838:	05 c8 57 00 00       	add    $0x57c8,%eax
  10383d:	8b 45 08             	mov    0x8(%ebp),%eax
  103840:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103844:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103848:	0f 00 d0             	lldt   %ax
  10384b:	90                   	nop
  10384c:	c9                   	leave  
  10384d:	c3                   	ret    

0010384e <cli>:
  10384e:	55                   	push   %ebp
  10384f:	89 e5                	mov    %esp,%ebp
  103851:	e8 5f cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103856:	05 aa 57 00 00       	add    $0x57aa,%eax
  10385b:	fa                   	cli    
  10385c:	90                   	nop
  10385d:	5d                   	pop    %ebp
  10385e:	c3                   	ret    

0010385f <sti>:
  10385f:	55                   	push   %ebp
  103860:	89 e5                	mov    %esp,%ebp
  103862:	e8 4e cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103867:	05 99 57 00 00       	add    $0x5799,%eax
  10386c:	fb                   	sti    
  10386d:	90                   	nop
  10386e:	90                   	nop
  10386f:	5d                   	pop    %ebp
  103870:	c3                   	ret    

00103871 <rdmsr>:
  103871:	55                   	push   %ebp
  103872:	89 e5                	mov    %esp,%ebp
  103874:	83 ec 10             	sub    $0x10,%esp
  103877:	e8 39 cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  10387c:	05 84 57 00 00       	add    $0x5784,%eax
  103881:	8b 45 08             	mov    0x8(%ebp),%eax
  103884:	89 c1                	mov    %eax,%ecx
  103886:	0f 32                	rdmsr  
  103888:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10388b:	89 55 fc             	mov    %edx,-0x4(%ebp)
  10388e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103891:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103894:	c9                   	leave  
  103895:	c3                   	ret    

00103896 <wrmsr>:
  103896:	55                   	push   %ebp
  103897:	89 e5                	mov    %esp,%ebp
  103899:	83 ec 08             	sub    $0x8,%esp
  10389c:	e8 14 cb ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1038a1:	05 5f 57 00 00       	add    $0x575f,%eax
  1038a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1038a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1038ac:	8b 45 10             	mov    0x10(%ebp),%eax
  1038af:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1038b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1038b5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1038b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  1038bb:	0f 30                	wrmsr  
  1038bd:	90                   	nop
  1038be:	c9                   	leave  
  1038bf:	c3                   	ret    

001038c0 <halt>:
  1038c0:	55                   	push   %ebp
  1038c1:	89 e5                	mov    %esp,%ebp
  1038c3:	e8 ed ca ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1038c8:	05 38 57 00 00       	add    $0x5738,%eax
  1038cd:	f4                   	hlt    
  1038ce:	90                   	nop
  1038cf:	5d                   	pop    %ebp
  1038d0:	c3                   	ret    

001038d1 <rdtsc>:
  1038d1:	55                   	push   %ebp
  1038d2:	89 e5                	mov    %esp,%ebp
  1038d4:	83 ec 10             	sub    $0x10,%esp
  1038d7:	e8 d9 ca ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1038dc:	05 24 57 00 00       	add    $0x5724,%eax
  1038e1:	0f 31                	rdtsc  
  1038e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1038e6:	89 55 fc             	mov    %edx,-0x4(%ebp)
  1038e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1038ec:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1038ef:	c9                   	leave  
  1038f0:	c3                   	ret    

001038f1 <enable_sse>:
  1038f1:	55                   	push   %ebp
  1038f2:	89 e5                	mov    %esp,%ebp
  1038f4:	83 ec 20             	sub    $0x20,%esp
  1038f7:	e8 b9 ca ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1038fc:	05 04 57 00 00       	add    $0x5704,%eax
  103901:	0f 20 e0             	mov    %cr4,%eax
  103904:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103907:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10390a:	80 cc 06             	or     $0x6,%ah
  10390d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103910:	0f ae f0             	mfence 
  103913:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103916:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103919:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10391c:	0f 22 e0             	mov    %eax,%cr4
  10391f:	90                   	nop
  103920:	0f 20 c0             	mov    %cr0,%eax
  103923:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103926:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103929:	83 c8 02             	or     $0x2,%eax
  10392c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10392f:	0f ae f0             	mfence 
  103932:	83 65 f8 f3          	andl   $0xfffffff3,-0x8(%ebp)
  103936:	90                   	nop
  103937:	c9                   	leave  
  103938:	c3                   	ret    

00103939 <cpuid>:
  103939:	55                   	push   %ebp
  10393a:	89 e5                	mov    %esp,%ebp
  10393c:	53                   	push   %ebx
  10393d:	83 ec 10             	sub    $0x10,%esp
  103940:	e8 70 ca ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103945:	05 bb 56 00 00       	add    $0x56bb,%eax
  10394a:	8b 45 08             	mov    0x8(%ebp),%eax
  10394d:	0f a2                	cpuid  
  10394f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103952:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  103955:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  103958:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10395b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10395f:	74 08                	je     103969 <cpuid+0x30>
  103961:	8b 45 0c             	mov    0xc(%ebp),%eax
  103964:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103967:	89 10                	mov    %edx,(%eax)
  103969:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10396d:	74 08                	je     103977 <cpuid+0x3e>
  10396f:	8b 45 10             	mov    0x10(%ebp),%eax
  103972:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103975:	89 10                	mov    %edx,(%eax)
  103977:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  10397b:	74 08                	je     103985 <cpuid+0x4c>
  10397d:	8b 45 14             	mov    0x14(%ebp),%eax
  103980:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103983:	89 10                	mov    %edx,(%eax)
  103985:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  103989:	74 08                	je     103993 <cpuid+0x5a>
  10398b:	8b 45 18             	mov    0x18(%ebp),%eax
  10398e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103991:	89 10                	mov    %edx,(%eax)
  103993:	90                   	nop
  103994:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103997:	c9                   	leave  
  103998:	c3                   	ret    

00103999 <rcr3>:
  103999:	55                   	push   %ebp
  10399a:	89 e5                	mov    %esp,%ebp
  10399c:	83 ec 10             	sub    $0x10,%esp
  10399f:	e8 11 ca ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1039a4:	05 5c 56 00 00       	add    $0x565c,%eax
  1039a9:	0f 20 d8             	mov    %cr3,%eax
  1039ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1039af:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1039b2:	c9                   	leave  
  1039b3:	c3                   	ret    

001039b4 <outl>:
  1039b4:	55                   	push   %ebp
  1039b5:	89 e5                	mov    %esp,%ebp
  1039b7:	e8 f9 c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1039bc:	05 44 56 00 00       	add    $0x5644,%eax
  1039c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1039c4:	8b 55 08             	mov    0x8(%ebp),%edx
  1039c7:	ef                   	out    %eax,(%dx)
  1039c8:	90                   	nop
  1039c9:	5d                   	pop    %ebp
  1039ca:	c3                   	ret    

001039cb <inl>:
  1039cb:	55                   	push   %ebp
  1039cc:	89 e5                	mov    %esp,%ebp
  1039ce:	83 ec 10             	sub    $0x10,%esp
  1039d1:	e8 df c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1039d6:	05 2a 56 00 00       	add    $0x562a,%eax
  1039db:	8b 45 08             	mov    0x8(%ebp),%eax
  1039de:	89 c2                	mov    %eax,%edx
  1039e0:	ed                   	in     (%dx),%eax
  1039e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1039e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1039e7:	c9                   	leave  
  1039e8:	c3                   	ret    

001039e9 <smp_wmb>:
  1039e9:	55                   	push   %ebp
  1039ea:	89 e5                	mov    %esp,%ebp
  1039ec:	e8 c4 c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1039f1:	05 0f 56 00 00       	add    $0x560f,%eax
  1039f6:	90                   	nop
  1039f7:	5d                   	pop    %ebp
  1039f8:	c3                   	ret    

001039f9 <ltr>:
  1039f9:	55                   	push   %ebp
  1039fa:	89 e5                	mov    %esp,%ebp
  1039fc:	83 ec 04             	sub    $0x4,%esp
  1039ff:	e8 b1 c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103a04:	05 fc 55 00 00       	add    $0x55fc,%eax
  103a09:	8b 45 08             	mov    0x8(%ebp),%eax
  103a0c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103a10:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103a14:	0f 00 d8             	ltr    %ax
  103a17:	90                   	nop
  103a18:	c9                   	leave  
  103a19:	c3                   	ret    

00103a1a <lcr0>:
  103a1a:	55                   	push   %ebp
  103a1b:	89 e5                	mov    %esp,%ebp
  103a1d:	e8 93 c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103a22:	05 de 55 00 00       	add    $0x55de,%eax
  103a27:	8b 45 08             	mov    0x8(%ebp),%eax
  103a2a:	0f 22 c0             	mov    %eax,%cr0
  103a2d:	90                   	nop
  103a2e:	5d                   	pop    %ebp
  103a2f:	c3                   	ret    

00103a30 <rcr0>:
  103a30:	55                   	push   %ebp
  103a31:	89 e5                	mov    %esp,%ebp
  103a33:	83 ec 10             	sub    $0x10,%esp
  103a36:	e8 7a c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103a3b:	05 c5 55 00 00       	add    $0x55c5,%eax
  103a40:	0f 20 c0             	mov    %cr0,%eax
  103a43:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103a46:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103a49:	c9                   	leave  
  103a4a:	c3                   	ret    

00103a4b <rcr2>:
  103a4b:	55                   	push   %ebp
  103a4c:	89 e5                	mov    %esp,%ebp
  103a4e:	83 ec 10             	sub    $0x10,%esp
  103a51:	e8 5f c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103a56:	05 aa 55 00 00       	add    $0x55aa,%eax
  103a5b:	0f 20 d0             	mov    %cr2,%eax
  103a5e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103a61:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103a64:	c9                   	leave  
  103a65:	c3                   	ret    

00103a66 <lcr3>:
  103a66:	55                   	push   %ebp
  103a67:	89 e5                	mov    %esp,%ebp
  103a69:	e8 47 c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103a6e:	05 92 55 00 00       	add    $0x5592,%eax
  103a73:	8b 45 08             	mov    0x8(%ebp),%eax
  103a76:	0f 22 d8             	mov    %eax,%cr3
  103a79:	90                   	nop
  103a7a:	5d                   	pop    %ebp
  103a7b:	c3                   	ret    

00103a7c <lcr4>:
  103a7c:	55                   	push   %ebp
  103a7d:	89 e5                	mov    %esp,%ebp
  103a7f:	e8 31 c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103a84:	05 7c 55 00 00       	add    $0x557c,%eax
  103a89:	8b 45 08             	mov    0x8(%ebp),%eax
  103a8c:	0f 22 e0             	mov    %eax,%cr4
  103a8f:	90                   	nop
  103a90:	5d                   	pop    %ebp
  103a91:	c3                   	ret    

00103a92 <rcr4>:
  103a92:	55                   	push   %ebp
  103a93:	89 e5                	mov    %esp,%ebp
  103a95:	83 ec 10             	sub    $0x10,%esp
  103a98:	e8 18 c9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103a9d:	05 63 55 00 00       	add    $0x5563,%eax
  103aa2:	0f 20 e0             	mov    %cr4,%eax
  103aa5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103aa8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103aab:	c9                   	leave  
  103aac:	c3                   	ret    

00103aad <inb>:
  103aad:	55                   	push   %ebp
  103aae:	89 e5                	mov    %esp,%ebp
  103ab0:	83 ec 10             	sub    $0x10,%esp
  103ab3:	e8 fd c8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103ab8:	05 48 55 00 00       	add    $0x5548,%eax
  103abd:	8b 45 08             	mov    0x8(%ebp),%eax
  103ac0:	89 c2                	mov    %eax,%edx
  103ac2:	ec                   	in     (%dx),%al
  103ac3:	88 45 ff             	mov    %al,-0x1(%ebp)
  103ac6:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  103aca:	c9                   	leave  
  103acb:	c3                   	ret    

00103acc <insl>:
  103acc:	55                   	push   %ebp
  103acd:	89 e5                	mov    %esp,%ebp
  103acf:	57                   	push   %edi
  103ad0:	53                   	push   %ebx
  103ad1:	e8 df c8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103ad6:	05 2a 55 00 00       	add    $0x552a,%eax
  103adb:	8b 55 08             	mov    0x8(%ebp),%edx
  103ade:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103ae1:	8b 45 10             	mov    0x10(%ebp),%eax
  103ae4:	89 cb                	mov    %ecx,%ebx
  103ae6:	89 df                	mov    %ebx,%edi
  103ae8:	89 c1                	mov    %eax,%ecx
  103aea:	fc                   	cld    
  103aeb:	f2 6d                	repnz insl (%dx),%es:(%edi)
  103aed:	89 c8                	mov    %ecx,%eax
  103aef:	89 fb                	mov    %edi,%ebx
  103af1:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  103af4:	89 45 10             	mov    %eax,0x10(%ebp)
  103af7:	90                   	nop
  103af8:	5b                   	pop    %ebx
  103af9:	5f                   	pop    %edi
  103afa:	5d                   	pop    %ebp
  103afb:	c3                   	ret    

00103afc <outb>:
  103afc:	55                   	push   %ebp
  103afd:	89 e5                	mov    %esp,%ebp
  103aff:	83 ec 04             	sub    $0x4,%esp
  103b02:	e8 ae c8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103b07:	05 f9 54 00 00       	add    $0x54f9,%eax
  103b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
  103b0f:	88 45 fc             	mov    %al,-0x4(%ebp)
  103b12:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  103b16:	8b 55 08             	mov    0x8(%ebp),%edx
  103b19:	ee                   	out    %al,(%dx)
  103b1a:	90                   	nop
  103b1b:	c9                   	leave  
  103b1c:	c3                   	ret    

00103b1d <outsw>:
  103b1d:	55                   	push   %ebp
  103b1e:	89 e5                	mov    %esp,%ebp
  103b20:	56                   	push   %esi
  103b21:	53                   	push   %ebx
  103b22:	e8 8e c8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103b27:	05 d9 54 00 00       	add    $0x54d9,%eax
  103b2c:	8b 55 08             	mov    0x8(%ebp),%edx
  103b2f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  103b32:	8b 45 10             	mov    0x10(%ebp),%eax
  103b35:	89 cb                	mov    %ecx,%ebx
  103b37:	89 de                	mov    %ebx,%esi
  103b39:	89 c1                	mov    %eax,%ecx
  103b3b:	fc                   	cld    
  103b3c:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
  103b3f:	89 c8                	mov    %ecx,%eax
  103b41:	89 f3                	mov    %esi,%ebx
  103b43:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  103b46:	89 45 10             	mov    %eax,0x10(%ebp)
  103b49:	90                   	nop
  103b4a:	5b                   	pop    %ebx
  103b4b:	5e                   	pop    %esi
  103b4c:	5d                   	pop    %ebp
  103b4d:	c3                   	ret    

00103b4e <mon_help>:
  103b4e:	55                   	push   %ebp
  103b4f:	89 e5                	mov    %esp,%ebp
  103b51:	56                   	push   %esi
  103b52:	53                   	push   %ebx
  103b53:	83 ec 10             	sub    $0x10,%esp
  103b56:	e8 62 c8 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  103b5b:	81 c3 a5 54 00 00    	add    $0x54a5,%ebx
  103b61:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103b68:	eb 44                	jmp    103bae <mon_help+0x60>
  103b6a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103b6d:	8d 8b 24 15 00 00    	lea    0x1524(%ebx),%ecx
  103b73:	89 d0                	mov    %edx,%eax
  103b75:	01 c0                	add    %eax,%eax
  103b77:	01 d0                	add    %edx,%eax
  103b79:	c1 e0 02             	shl    $0x2,%eax
  103b7c:	01 c8                	add    %ecx,%eax
  103b7e:	8b 10                	mov    (%eax),%edx
  103b80:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  103b83:	8d b3 20 15 00 00    	lea    0x1520(%ebx),%esi
  103b89:	89 c8                	mov    %ecx,%eax
  103b8b:	01 c0                	add    %eax,%eax
  103b8d:	01 c8                	add    %ecx,%eax
  103b8f:	c1 e0 02             	shl    $0x2,%eax
  103b92:	01 f0                	add    %esi,%eax
  103b94:	8b 00                	mov    (%eax),%eax
  103b96:	83 ec 04             	sub    $0x4,%esp
  103b99:	52                   	push   %edx
  103b9a:	50                   	push   %eax
  103b9b:	8d 83 40 d3 ff ff    	lea    -0x2cc0(%ebx),%eax
  103ba1:	50                   	push   %eax
  103ba2:	e8 b5 f1 ff ff       	call   102d5c <dprintf>
  103ba7:	83 c4 10             	add    $0x10,%esp
  103baa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103bae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103bb1:	83 f8 02             	cmp    $0x2,%eax
  103bb4:	76 b4                	jbe    103b6a <mon_help+0x1c>
  103bb6:	b8 00 00 00 00       	mov    $0x0,%eax
  103bbb:	8d 65 f8             	lea    -0x8(%ebp),%esp
  103bbe:	5b                   	pop    %ebx
  103bbf:	5e                   	pop    %esi
  103bc0:	5d                   	pop    %ebp
  103bc1:	c3                   	ret    

00103bc2 <mon_kerninfo>:
  103bc2:	55                   	push   %ebp
  103bc3:	89 e5                	mov    %esp,%ebp
  103bc5:	53                   	push   %ebx
  103bc6:	83 ec 14             	sub    $0x14,%esp
  103bc9:	e8 ef c7 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  103bce:	81 c3 32 54 00 00    	add    $0x5432,%ebx
  103bd4:	83 ec 0c             	sub    $0xc,%esp
  103bd7:	8d 83 49 d3 ff ff    	lea    -0x2cb7(%ebx),%eax
  103bdd:	50                   	push   %eax
  103bde:	e8 79 f1 ff ff       	call   102d5c <dprintf>
  103be3:	83 c4 10             	add    $0x10,%esp
  103be6:	83 ec 08             	sub    $0x8,%esp
  103be9:	c7 c0 f4 49 10 00    	mov    $0x1049f4,%eax
  103bef:	50                   	push   %eax
  103bf0:	8d 83 62 d3 ff ff    	lea    -0x2c9e(%ebx),%eax
  103bf6:	50                   	push   %eax
  103bf7:	e8 60 f1 ff ff       	call   102d5c <dprintf>
  103bfc:	83 c4 10             	add    $0x10,%esp
  103bff:	83 ec 08             	sub    $0x8,%esp
  103c02:	c7 c0 c1 58 10 00    	mov    $0x1058c1,%eax
  103c08:	50                   	push   %eax
  103c09:	8d 83 71 d3 ff ff    	lea    -0x2c8f(%ebx),%eax
  103c0f:	50                   	push   %eax
  103c10:	e8 47 f1 ff ff       	call   102d5c <dprintf>
  103c15:	83 c4 10             	add    $0x10,%esp
  103c18:	83 ec 08             	sub    $0x8,%esp
  103c1b:	c7 c0 f0 f8 10 00    	mov    $0x10f8f0,%eax
  103c21:	50                   	push   %eax
  103c22:	8d 83 80 d3 ff ff    	lea    -0x2c80(%ebx),%eax
  103c28:	50                   	push   %eax
  103c29:	e8 2e f1 ff ff       	call   102d5c <dprintf>
  103c2e:	83 c4 10             	add    $0x10,%esp
  103c31:	83 ec 08             	sub    $0x8,%esp
  103c34:	c7 c0 00 80 d9 00    	mov    $0xd98000,%eax
  103c3a:	50                   	push   %eax
  103c3b:	8d 83 8f d3 ff ff    	lea    -0x2c71(%ebx),%eax
  103c41:	50                   	push   %eax
  103c42:	e8 15 f1 ff ff       	call   102d5c <dprintf>
  103c47:	83 c4 10             	add    $0x10,%esp
  103c4a:	c7 c0 00 80 d9 00    	mov    $0xd98000,%eax
  103c50:	89 c2                	mov    %eax,%edx
  103c52:	c7 c0 f4 49 10 00    	mov    $0x1049f4,%eax
  103c58:	89 c1                	mov    %eax,%ecx
  103c5a:	89 d0                	mov    %edx,%eax
  103c5c:	29 c8                	sub    %ecx,%eax
  103c5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103c61:	c7 45 f0 00 04 00 00 	movl   $0x400,-0x10(%ebp)
  103c68:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103c6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c6e:	01 d0                	add    %edx,%eax
  103c70:	83 e8 01             	sub    $0x1,%eax
  103c73:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103c76:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103c79:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103c7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103c7f:	99                   	cltd   
  103c80:	f7 7d e8             	idivl  -0x18(%ebp)
  103c83:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103c86:	29 d0                	sub    %edx,%eax
  103c88:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  103c8e:	85 c0                	test   %eax,%eax
  103c90:	0f 48 c2             	cmovs  %edx,%eax
  103c93:	c1 f8 0a             	sar    $0xa,%eax
  103c96:	83 ec 08             	sub    $0x8,%esp
  103c99:	50                   	push   %eax
  103c9a:	8d 83 a0 d3 ff ff    	lea    -0x2c60(%ebx),%eax
  103ca0:	50                   	push   %eax
  103ca1:	e8 b6 f0 ff ff       	call   102d5c <dprintf>
  103ca6:	83 c4 10             	add    $0x10,%esp
  103ca9:	b8 00 00 00 00       	mov    $0x0,%eax
  103cae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103cb1:	c9                   	leave  
  103cb2:	c3                   	ret    

00103cb3 <mon_backtrace>:
  103cb3:	55                   	push   %ebp
  103cb4:	89 e5                	mov    %esp,%ebp
  103cb6:	e8 fa c6 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  103cbb:	05 45 53 00 00       	add    $0x5345,%eax
  103cc0:	b8 00 00 00 00       	mov    $0x0,%eax
  103cc5:	5d                   	pop    %ebp
  103cc6:	c3                   	ret    

00103cc7 <mon_start_user>:
  103cc7:	55                   	push   %ebp
  103cc8:	89 e5                	mov    %esp,%ebp
  103cca:	53                   	push   %ebx
  103ccb:	83 ec 14             	sub    $0x14,%esp
  103cce:	e8 ea c6 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  103cd3:	81 c3 2d 53 00 00    	add    $0x532d,%ebx
  103cd9:	8b 83 2c dc 04 00    	mov    0x4dc2c(%ebx),%eax
  103cdf:	85 c0                	test   %eax,%eax
  103ce1:	74 1c                	je     103cff <mon_start_user+0x38>
  103ce3:	83 ec 0c             	sub    $0xc,%esp
  103ce6:	8d 83 cc d3 ff ff    	lea    -0x2c34(%ebx),%eax
  103cec:	50                   	push   %eax
  103ced:	e8 6a f0 ff ff       	call   102d5c <dprintf>
  103cf2:	83 c4 10             	add    $0x10,%esp
  103cf5:	b8 00 00 00 00       	mov    $0x0,%eax
  103cfa:	e9 81 00 00 00       	jmp    103d80 <mon_start_user+0xb9>
  103cff:	c7 c0 04 c0 10 00    	mov    $0x10c004,%eax
  103d05:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103d08:	83 ec 0c             	sub    $0xc,%esp
  103d0b:	6a 00                	push   $0x0
  103d0d:	e8 7e 11 00 00       	call   104e90 <container_get_quota>
  103d12:	83 c4 10             	add    $0x10,%esp
  103d15:	83 ec 08             	sub    $0x8,%esp
  103d18:	50                   	push   %eax
  103d19:	6a 00                	push   $0x0
  103d1b:	e8 40 19 00 00       	call   105660 <alloc_mem_quota>
  103d20:	83 c4 10             	add    $0x10,%esp
  103d23:	89 83 2c dc 04 00    	mov    %eax,0x4dc2c(%ebx)
  103d29:	8b 83 2c dc 04 00    	mov    0x4dc2c(%ebx),%eax
  103d2f:	83 ec 08             	sub    $0x8,%esp
  103d32:	50                   	push   %eax
  103d33:	ff 75 f4             	push   -0xc(%ebp)
  103d36:	e8 42 05 00 00       	call   10427d <elf_load>
  103d3b:	83 c4 10             	add    $0x10,%esp
  103d3e:	83 ec 08             	sub    $0x8,%esp
  103d41:	ff 75 f4             	push   -0xc(%ebp)
  103d44:	8d 83 28 d4 ff ff    	lea    -0x2bd8(%ebx),%eax
  103d4a:	50                   	push   %eax
  103d4b:	e8 0c f0 ff ff       	call   102d5c <dprintf>
  103d50:	83 c4 10             	add    $0x10,%esp
  103d53:	8b 83 2c dc 04 00    	mov    0x4dc2c(%ebx),%eax
  103d59:	83 ec 0c             	sub    $0xc,%esp
  103d5c:	50                   	push   %eax
  103d5d:	e8 fe 12 00 00       	call   105060 <set_pdir_base>
  103d62:	83 c4 10             	add    $0x10,%esp
  103d65:	83 ec 0c             	sub    $0xc,%esp
  103d68:	ff 75 f4             	push   -0xc(%ebp)
  103d6b:	e8 cd 07 00 00       	call   10453d <elf_entry>
  103d70:	83 c4 10             	add    $0x10,%esp
  103d73:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103d76:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103d79:	ff d0                	call   *%eax
  103d7b:	b8 00 00 00 00       	mov    $0x0,%eax
  103d80:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103d83:	c9                   	leave  
  103d84:	c3                   	ret    

00103d85 <runcmd>:
  103d85:	55                   	push   %ebp
  103d86:	89 e5                	mov    %esp,%ebp
  103d88:	53                   	push   %ebx
  103d89:	83 ec 54             	sub    $0x54,%esp
  103d8c:	e8 2c c6 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  103d91:	81 c3 6f 52 00 00    	add    $0x526f,%ebx
  103d97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103d9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103da1:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  103da8:	00 
  103da9:	eb 0c                	jmp    103db7 <runcmd+0x32>
  103dab:	8b 45 08             	mov    0x8(%ebp),%eax
  103dae:	8d 50 01             	lea    0x1(%eax),%edx
  103db1:	89 55 08             	mov    %edx,0x8(%ebp)
  103db4:	c6 00 00             	movb   $0x0,(%eax)
  103db7:	8b 45 08             	mov    0x8(%ebp),%eax
  103dba:	0f b6 00             	movzbl (%eax),%eax
  103dbd:	84 c0                	test   %al,%al
  103dbf:	74 20                	je     103de1 <runcmd+0x5c>
  103dc1:	8b 45 08             	mov    0x8(%ebp),%eax
  103dc4:	0f b6 00             	movzbl (%eax),%eax
  103dc7:	0f be c0             	movsbl %al,%eax
  103dca:	83 ec 08             	sub    $0x8,%esp
  103dcd:	50                   	push   %eax
  103dce:	8d 83 43 d4 ff ff    	lea    -0x2bbd(%ebx),%eax
  103dd4:	50                   	push   %eax
  103dd5:	e8 22 ec ff ff       	call   1029fc <strchr>
  103dda:	83 c4 10             	add    $0x10,%esp
  103ddd:	85 c0                	test   %eax,%eax
  103ddf:	75 ca                	jne    103dab <runcmd+0x26>
  103de1:	8b 45 08             	mov    0x8(%ebp),%eax
  103de4:	0f b6 00             	movzbl (%eax),%eax
  103de7:	84 c0                	test   %al,%al
  103de9:	74 69                	je     103e54 <runcmd+0xcf>
  103deb:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  103def:	75 1e                	jne    103e0f <runcmd+0x8a>
  103df1:	83 ec 08             	sub    $0x8,%esp
  103df4:	6a 10                	push   $0x10
  103df6:	8d 83 48 d4 ff ff    	lea    -0x2bb8(%ebx),%eax
  103dfc:	50                   	push   %eax
  103dfd:	e8 5a ef ff ff       	call   102d5c <dprintf>
  103e02:	83 c4 10             	add    $0x10,%esp
  103e05:	b8 00 00 00 00       	mov    $0x0,%eax
  103e0a:	e9 e5 00 00 00       	jmp    103ef4 <runcmd+0x16f>
  103e0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e12:	8d 50 01             	lea    0x1(%eax),%edx
  103e15:	89 55 f4             	mov    %edx,-0xc(%ebp)
  103e18:	8b 55 08             	mov    0x8(%ebp),%edx
  103e1b:	89 54 85 b0          	mov    %edx,-0x50(%ebp,%eax,4)
  103e1f:	eb 04                	jmp    103e25 <runcmd+0xa0>
  103e21:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103e25:	8b 45 08             	mov    0x8(%ebp),%eax
  103e28:	0f b6 00             	movzbl (%eax),%eax
  103e2b:	84 c0                	test   %al,%al
  103e2d:	74 88                	je     103db7 <runcmd+0x32>
  103e2f:	8b 45 08             	mov    0x8(%ebp),%eax
  103e32:	0f b6 00             	movzbl (%eax),%eax
  103e35:	0f be c0             	movsbl %al,%eax
  103e38:	83 ec 08             	sub    $0x8,%esp
  103e3b:	50                   	push   %eax
  103e3c:	8d 83 43 d4 ff ff    	lea    -0x2bbd(%ebx),%eax
  103e42:	50                   	push   %eax
  103e43:	e8 b4 eb ff ff       	call   1029fc <strchr>
  103e48:	83 c4 10             	add    $0x10,%esp
  103e4b:	85 c0                	test   %eax,%eax
  103e4d:	74 d2                	je     103e21 <runcmd+0x9c>
  103e4f:	e9 63 ff ff ff       	jmp    103db7 <runcmd+0x32>
  103e54:	90                   	nop
  103e55:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e58:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  103e5f:	00 
  103e60:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103e64:	75 0a                	jne    103e70 <runcmd+0xeb>
  103e66:	b8 00 00 00 00       	mov    $0x0,%eax
  103e6b:	e9 84 00 00 00       	jmp    103ef4 <runcmd+0x16f>
  103e70:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  103e77:	eb 58                	jmp    103ed1 <runcmd+0x14c>
  103e79:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103e7c:	8d 8b 20 15 00 00    	lea    0x1520(%ebx),%ecx
  103e82:	89 d0                	mov    %edx,%eax
  103e84:	01 c0                	add    %eax,%eax
  103e86:	01 d0                	add    %edx,%eax
  103e88:	c1 e0 02             	shl    $0x2,%eax
  103e8b:	01 c8                	add    %ecx,%eax
  103e8d:	8b 10                	mov    (%eax),%edx
  103e8f:	8b 45 b0             	mov    -0x50(%ebp),%eax
  103e92:	83 ec 08             	sub    $0x8,%esp
  103e95:	52                   	push   %edx
  103e96:	50                   	push   %eax
  103e97:	e8 17 eb ff ff       	call   1029b3 <strcmp>
  103e9c:	83 c4 10             	add    $0x10,%esp
  103e9f:	85 c0                	test   %eax,%eax
  103ea1:	75 2a                	jne    103ecd <runcmd+0x148>
  103ea3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103ea6:	8d 8b 28 15 00 00    	lea    0x1528(%ebx),%ecx
  103eac:	89 d0                	mov    %edx,%eax
  103eae:	01 c0                	add    %eax,%eax
  103eb0:	01 d0                	add    %edx,%eax
  103eb2:	c1 e0 02             	shl    $0x2,%eax
  103eb5:	01 c8                	add    %ecx,%eax
  103eb7:	8b 00                	mov    (%eax),%eax
  103eb9:	83 ec 04             	sub    $0x4,%esp
  103ebc:	ff 75 0c             	push   0xc(%ebp)
  103ebf:	8d 55 b0             	lea    -0x50(%ebp),%edx
  103ec2:	52                   	push   %edx
  103ec3:	ff 75 f4             	push   -0xc(%ebp)
  103ec6:	ff d0                	call   *%eax
  103ec8:	83 c4 10             	add    $0x10,%esp
  103ecb:	eb 27                	jmp    103ef4 <runcmd+0x16f>
  103ecd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  103ed1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ed4:	83 f8 02             	cmp    $0x2,%eax
  103ed7:	76 a0                	jbe    103e79 <runcmd+0xf4>
  103ed9:	8b 45 b0             	mov    -0x50(%ebp),%eax
  103edc:	83 ec 08             	sub    $0x8,%esp
  103edf:	50                   	push   %eax
  103ee0:	8d 83 65 d4 ff ff    	lea    -0x2b9b(%ebx),%eax
  103ee6:	50                   	push   %eax
  103ee7:	e8 70 ee ff ff       	call   102d5c <dprintf>
  103eec:	83 c4 10             	add    $0x10,%esp
  103eef:	b8 00 00 00 00       	mov    $0x0,%eax
  103ef4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103ef7:	c9                   	leave  
  103ef8:	c3                   	ret    

00103ef9 <monitor>:
  103ef9:	55                   	push   %ebp
  103efa:	89 e5                	mov    %esp,%ebp
  103efc:	53                   	push   %ebx
  103efd:	83 ec 14             	sub    $0x14,%esp
  103f00:	e8 b8 c4 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  103f05:	81 c3 fb 50 00 00    	add    $0x50fb,%ebx
  103f0b:	83 ec 0c             	sub    $0xc,%esp
  103f0e:	8d 83 7c d4 ff ff    	lea    -0x2b84(%ebx),%eax
  103f14:	50                   	push   %eax
  103f15:	e8 42 ee ff ff       	call   102d5c <dprintf>
  103f1a:	83 c4 10             	add    $0x10,%esp
  103f1d:	83 ec 0c             	sub    $0xc,%esp
  103f20:	8d 83 a8 d4 ff ff    	lea    -0x2b58(%ebx),%eax
  103f26:	50                   	push   %eax
  103f27:	e8 30 ee ff ff       	call   102d5c <dprintf>
  103f2c:	83 c4 10             	add    $0x10,%esp
  103f2f:	83 ec 0c             	sub    $0xc,%esp
  103f32:	8d 83 7c d4 ff ff    	lea    -0x2b84(%ebx),%eax
  103f38:	50                   	push   %eax
  103f39:	e8 1e ee ff ff       	call   102d5c <dprintf>
  103f3e:	83 c4 10             	add    $0x10,%esp
  103f41:	83 ec 0c             	sub    $0xc,%esp
  103f44:	8d 83 d4 d4 ff ff    	lea    -0x2b2c(%ebx),%eax
  103f4a:	50                   	push   %eax
  103f4b:	e8 0c ee ff ff       	call   102d5c <dprintf>
  103f50:	83 c4 10             	add    $0x10,%esp
  103f53:	83 ec 0c             	sub    $0xc,%esp
  103f56:	8d 83 f9 d4 ff ff    	lea    -0x2b07(%ebx),%eax
  103f5c:	50                   	push   %eax
  103f5d:	e8 f6 c5 ff ff       	call   100558 <readline>
  103f62:	83 c4 10             	add    $0x10,%esp
  103f65:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103f68:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  103f6c:	74 e5                	je     103f53 <monitor+0x5a>
  103f6e:	83 ec 08             	sub    $0x8,%esp
  103f71:	ff 75 08             	push   0x8(%ebp)
  103f74:	ff 75 f4             	push   -0xc(%ebp)
  103f77:	e8 09 fe ff ff       	call   103d85 <runcmd>
  103f7c:	83 c4 10             	add    $0x10,%esp
  103f7f:	85 c0                	test   %eax,%eax
  103f81:	78 02                	js     103f85 <monitor+0x8c>
  103f83:	eb ce                	jmp    103f53 <monitor+0x5a>
  103f85:	90                   	nop
  103f86:	90                   	nop
  103f87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103f8a:	c9                   	leave  
  103f8b:	c3                   	ret    

00103f8c <pt_copyin>:
  103f8c:	55                   	push   %ebp
  103f8d:	89 e5                	mov    %esp,%ebp
  103f8f:	53                   	push   %ebx
  103f90:	83 ec 14             	sub    $0x14,%esp
  103f93:	e8 25 c4 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  103f98:	81 c3 68 50 00 00    	add    $0x5068,%ebx
  103f9e:	81 7d 0c ff ff ff 3f 	cmpl   $0x3fffffff,0xc(%ebp)
  103fa5:	76 0f                	jbe    103fb6 <pt_copyin+0x2a>
  103fa7:	8b 55 0c             	mov    0xc(%ebp),%edx
  103faa:	8b 45 14             	mov    0x14(%ebp),%eax
  103fad:	01 d0                	add    %edx,%eax
  103faf:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  103fb4:	76 0a                	jbe    103fc0 <pt_copyin+0x34>
  103fb6:	b8 00 00 00 00       	mov    $0x0,%eax
  103fbb:	e9 d5 00 00 00       	jmp    104095 <pt_copyin+0x109>
  103fc0:	8b 55 10             	mov    0x10(%ebp),%edx
  103fc3:	8b 45 14             	mov    0x14(%ebp),%eax
  103fc6:	01 d0                	add    %edx,%eax
  103fc8:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  103fcd:	76 0a                	jbe    103fd9 <pt_copyin+0x4d>
  103fcf:	b8 00 00 00 00       	mov    $0x0,%eax
  103fd4:	e9 bc 00 00 00       	jmp    104095 <pt_copyin+0x109>
  103fd9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103fe0:	e9 a3 00 00 00       	jmp    104088 <pt_copyin+0xfc>
  103fe5:	83 ec 08             	sub    $0x8,%esp
  103fe8:	ff 75 0c             	push   0xc(%ebp)
  103feb:	ff 75 08             	push   0x8(%ebp)
  103fee:	e8 2d 12 00 00       	call   105220 <get_ptbl_entry_by_va>
  103ff3:	83 c4 10             	add    $0x10,%esp
  103ff6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103ff9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103ffc:	83 e0 01             	and    $0x1,%eax
  103fff:	85 c0                	test   %eax,%eax
  104001:	75 27                	jne    10402a <pt_copyin+0x9e>
  104003:	83 ec 04             	sub    $0x4,%esp
  104006:	6a 07                	push   $0x7
  104008:	ff 75 0c             	push   0xc(%ebp)
  10400b:	ff 75 08             	push   0x8(%ebp)
  10400e:	e8 fd 15 00 00       	call   105610 <alloc_page>
  104013:	83 c4 10             	add    $0x10,%esp
  104016:	83 ec 08             	sub    $0x8,%esp
  104019:	ff 75 0c             	push   0xc(%ebp)
  10401c:	ff 75 08             	push   0x8(%ebp)
  10401f:	e8 fc 11 00 00       	call   105220 <get_ptbl_entry_by_va>
  104024:	83 c4 10             	add    $0x10,%esp
  104027:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10402a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10402d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  104032:	89 c2                	mov    %eax,%edx
  104034:	8b 45 0c             	mov    0xc(%ebp),%eax
  104037:	25 ff 0f 00 00       	and    $0xfff,%eax
  10403c:	09 d0                	or     %edx,%eax
  10403e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104041:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104044:	25 ff 0f 00 00       	and    $0xfff,%eax
  104049:	ba 00 10 00 00       	mov    $0x1000,%edx
  10404e:	29 c2                	sub    %eax,%edx
  104050:	8b 45 14             	mov    0x14(%ebp),%eax
  104053:	39 d0                	cmp    %edx,%eax
  104055:	0f 47 c2             	cmova  %edx,%eax
  104058:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10405b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10405e:	83 ec 04             	sub    $0x4,%esp
  104061:	ff 75 ec             	push   -0x14(%ebp)
  104064:	50                   	push   %eax
  104065:	ff 75 10             	push   0x10(%ebp)
  104068:	e8 8c e8 ff ff       	call   1028f9 <memcpy>
  10406d:	83 c4 10             	add    $0x10,%esp
  104070:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104073:	29 45 14             	sub    %eax,0x14(%ebp)
  104076:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104079:	01 45 0c             	add    %eax,0xc(%ebp)
  10407c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10407f:	01 45 10             	add    %eax,0x10(%ebp)
  104082:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104085:	01 45 f4             	add    %eax,-0xc(%ebp)
  104088:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  10408c:	0f 85 53 ff ff ff    	jne    103fe5 <pt_copyin+0x59>
  104092:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104095:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104098:	c9                   	leave  
  104099:	c3                   	ret    

0010409a <pt_copyout>:
  10409a:	55                   	push   %ebp
  10409b:	89 e5                	mov    %esp,%ebp
  10409d:	53                   	push   %ebx
  10409e:	83 ec 14             	sub    $0x14,%esp
  1040a1:	e8 17 c3 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1040a6:	81 c3 5a 4f 00 00    	add    $0x4f5a,%ebx
  1040ac:	81 7d 10 ff ff ff 3f 	cmpl   $0x3fffffff,0x10(%ebp)
  1040b3:	76 0f                	jbe    1040c4 <pt_copyout+0x2a>
  1040b5:	8b 55 10             	mov    0x10(%ebp),%edx
  1040b8:	8b 45 14             	mov    0x14(%ebp),%eax
  1040bb:	01 d0                	add    %edx,%eax
  1040bd:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1040c2:	76 0a                	jbe    1040ce <pt_copyout+0x34>
  1040c4:	b8 00 00 00 00       	mov    $0x0,%eax
  1040c9:	e9 d5 00 00 00       	jmp    1041a3 <pt_copyout+0x109>
  1040ce:	8b 55 08             	mov    0x8(%ebp),%edx
  1040d1:	8b 45 14             	mov    0x14(%ebp),%eax
  1040d4:	01 d0                	add    %edx,%eax
  1040d6:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  1040db:	76 0a                	jbe    1040e7 <pt_copyout+0x4d>
  1040dd:	b8 00 00 00 00       	mov    $0x0,%eax
  1040e2:	e9 bc 00 00 00       	jmp    1041a3 <pt_copyout+0x109>
  1040e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1040ee:	e9 a3 00 00 00       	jmp    104196 <pt_copyout+0xfc>
  1040f3:	83 ec 08             	sub    $0x8,%esp
  1040f6:	ff 75 10             	push   0x10(%ebp)
  1040f9:	ff 75 0c             	push   0xc(%ebp)
  1040fc:	e8 1f 11 00 00       	call   105220 <get_ptbl_entry_by_va>
  104101:	83 c4 10             	add    $0x10,%esp
  104104:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104107:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10410a:	83 e0 01             	and    $0x1,%eax
  10410d:	85 c0                	test   %eax,%eax
  10410f:	75 27                	jne    104138 <pt_copyout+0x9e>
  104111:	83 ec 04             	sub    $0x4,%esp
  104114:	6a 07                	push   $0x7
  104116:	ff 75 10             	push   0x10(%ebp)
  104119:	ff 75 0c             	push   0xc(%ebp)
  10411c:	e8 ef 14 00 00       	call   105610 <alloc_page>
  104121:	83 c4 10             	add    $0x10,%esp
  104124:	83 ec 08             	sub    $0x8,%esp
  104127:	ff 75 10             	push   0x10(%ebp)
  10412a:	ff 75 0c             	push   0xc(%ebp)
  10412d:	e8 ee 10 00 00       	call   105220 <get_ptbl_entry_by_va>
  104132:	83 c4 10             	add    $0x10,%esp
  104135:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104138:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10413b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  104140:	89 c2                	mov    %eax,%edx
  104142:	8b 45 10             	mov    0x10(%ebp),%eax
  104145:	25 ff 0f 00 00       	and    $0xfff,%eax
  10414a:	09 d0                	or     %edx,%eax
  10414c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10414f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104152:	25 ff 0f 00 00       	and    $0xfff,%eax
  104157:	ba 00 10 00 00       	mov    $0x1000,%edx
  10415c:	29 c2                	sub    %eax,%edx
  10415e:	8b 45 14             	mov    0x14(%ebp),%eax
  104161:	39 d0                	cmp    %edx,%eax
  104163:	0f 47 c2             	cmova  %edx,%eax
  104166:	89 45 ec             	mov    %eax,-0x14(%ebp)
  104169:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10416c:	83 ec 04             	sub    $0x4,%esp
  10416f:	ff 75 ec             	push   -0x14(%ebp)
  104172:	ff 75 08             	push   0x8(%ebp)
  104175:	50                   	push   %eax
  104176:	e8 7e e7 ff ff       	call   1028f9 <memcpy>
  10417b:	83 c4 10             	add    $0x10,%esp
  10417e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104181:	29 45 14             	sub    %eax,0x14(%ebp)
  104184:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104187:	01 45 10             	add    %eax,0x10(%ebp)
  10418a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10418d:	01 45 08             	add    %eax,0x8(%ebp)
  104190:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104193:	01 45 f4             	add    %eax,-0xc(%ebp)
  104196:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  10419a:	0f 85 53 ff ff ff    	jne    1040f3 <pt_copyout+0x59>
  1041a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1041a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1041a6:	c9                   	leave  
  1041a7:	c3                   	ret    

001041a8 <pt_memset>:
  1041a8:	55                   	push   %ebp
  1041a9:	89 e5                	mov    %esp,%ebp
  1041ab:	53                   	push   %ebx
  1041ac:	83 ec 24             	sub    $0x24,%esp
  1041af:	e8 09 c2 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1041b4:	81 c3 4c 4e 00 00    	add    $0x4e4c,%ebx
  1041ba:	8b 45 10             	mov    0x10(%ebp),%eax
  1041bd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  1041c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1041c7:	e9 9f 00 00 00       	jmp    10426b <pt_memset+0xc3>
  1041cc:	83 ec 08             	sub    $0x8,%esp
  1041cf:	ff 75 0c             	push   0xc(%ebp)
  1041d2:	ff 75 08             	push   0x8(%ebp)
  1041d5:	e8 46 10 00 00       	call   105220 <get_ptbl_entry_by_va>
  1041da:	83 c4 10             	add    $0x10,%esp
  1041dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1041e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1041e3:	83 e0 01             	and    $0x1,%eax
  1041e6:	85 c0                	test   %eax,%eax
  1041e8:	75 27                	jne    104211 <pt_memset+0x69>
  1041ea:	83 ec 04             	sub    $0x4,%esp
  1041ed:	6a 07                	push   $0x7
  1041ef:	ff 75 0c             	push   0xc(%ebp)
  1041f2:	ff 75 08             	push   0x8(%ebp)
  1041f5:	e8 16 14 00 00       	call   105610 <alloc_page>
  1041fa:	83 c4 10             	add    $0x10,%esp
  1041fd:	83 ec 08             	sub    $0x8,%esp
  104200:	ff 75 0c             	push   0xc(%ebp)
  104203:	ff 75 08             	push   0x8(%ebp)
  104206:	e8 15 10 00 00       	call   105220 <get_ptbl_entry_by_va>
  10420b:	83 c4 10             	add    $0x10,%esp
  10420e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104211:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104214:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  104219:	89 c2                	mov    %eax,%edx
  10421b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10421e:	25 ff 0f 00 00       	and    $0xfff,%eax
  104223:	09 d0                	or     %edx,%eax
  104225:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104228:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10422b:	25 ff 0f 00 00       	and    $0xfff,%eax
  104230:	ba 00 10 00 00       	mov    $0x1000,%edx
  104235:	29 c2                	sub    %eax,%edx
  104237:	8b 45 14             	mov    0x14(%ebp),%eax
  10423a:	39 d0                	cmp    %edx,%eax
  10423c:	0f 47 c2             	cmova  %edx,%eax
  10423f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  104242:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
  104246:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104249:	83 ec 04             	sub    $0x4,%esp
  10424c:	ff 75 ec             	push   -0x14(%ebp)
  10424f:	52                   	push   %edx
  104250:	50                   	push   %eax
  104251:	e8 45 e5 ff ff       	call   10279b <memset>
  104256:	83 c4 10             	add    $0x10,%esp
  104259:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10425c:	29 45 14             	sub    %eax,0x14(%ebp)
  10425f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104262:	01 45 0c             	add    %eax,0xc(%ebp)
  104265:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104268:	01 45 f4             	add    %eax,-0xc(%ebp)
  10426b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  10426f:	0f 85 57 ff ff ff    	jne    1041cc <pt_memset+0x24>
  104275:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104278:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10427b:	c9                   	leave  
  10427c:	c3                   	ret    

0010427d <elf_load>:
  10427d:	55                   	push   %ebp
  10427e:	89 e5                	mov    %esp,%ebp
  104280:	53                   	push   %ebx
  104281:	83 ec 34             	sub    $0x34,%esp
  104284:	e8 34 c1 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104289:	81 c3 77 4d 00 00    	add    $0x4d77,%ebx
  10428f:	8b 45 08             	mov    0x8(%ebp),%eax
  104292:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  104295:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  104298:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10429b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10429e:	8b 00                	mov    (%eax),%eax
  1042a0:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  1042a5:	74 1f                	je     1042c6 <elf_load+0x49>
  1042a7:	8d 83 00 d5 ff ff    	lea    -0x2b00(%ebx),%eax
  1042ad:	50                   	push   %eax
  1042ae:	8d 83 19 d5 ff ff    	lea    -0x2ae7(%ebx),%eax
  1042b4:	50                   	push   %eax
  1042b5:	6a 26                	push   $0x26
  1042b7:	8d 83 36 d5 ff ff    	lea    -0x2aca(%ebx),%eax
  1042bd:	50                   	push   %eax
  1042be:	e8 81 e8 ff ff       	call   102b44 <debug_panic>
  1042c3:	83 c4 10             	add    $0x10,%esp
  1042c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1042c9:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  1042cd:	66 85 c0             	test   %ax,%ax
  1042d0:	75 1f                	jne    1042f1 <elf_load+0x74>
  1042d2:	8d 83 48 d5 ff ff    	lea    -0x2ab8(%ebx),%eax
  1042d8:	50                   	push   %eax
  1042d9:	8d 83 19 d5 ff ff    	lea    -0x2ae7(%ebx),%eax
  1042df:	50                   	push   %eax
  1042e0:	6a 27                	push   $0x27
  1042e2:	8d 83 36 d5 ff ff    	lea    -0x2aca(%ebx),%eax
  1042e8:	50                   	push   %eax
  1042e9:	e8 56 e8 ff ff       	call   102b44 <debug_panic>
  1042ee:	83 c4 10             	add    $0x10,%esp
  1042f1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1042f4:	8b 50 20             	mov    0x20(%eax),%edx
  1042f7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1042fa:	01 d0                	add    %edx,%eax
  1042fc:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1042ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104302:	0f b7 40 30          	movzwl 0x30(%eax),%eax
  104306:	0f b7 d0             	movzwl %ax,%edx
  104309:	89 d0                	mov    %edx,%eax
  10430b:	c1 e0 02             	shl    $0x2,%eax
  10430e:	01 d0                	add    %edx,%eax
  104310:	c1 e0 03             	shl    $0x3,%eax
  104313:	89 c2                	mov    %eax,%edx
  104315:	8b 45 dc             	mov    -0x24(%ebp),%eax
  104318:	01 d0                	add    %edx,%eax
  10431a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  10431d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104320:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  104324:	0f b7 d0             	movzwl %ax,%edx
  104327:	89 d0                	mov    %edx,%eax
  104329:	c1 e0 02             	shl    $0x2,%eax
  10432c:	01 d0                	add    %edx,%eax
  10432e:	c1 e0 03             	shl    $0x3,%eax
  104331:	89 c2                	mov    %eax,%edx
  104333:	8b 45 dc             	mov    -0x24(%ebp),%eax
  104336:	01 d0                	add    %edx,%eax
  104338:	8b 50 10             	mov    0x10(%eax),%edx
  10433b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10433e:	01 d0                	add    %edx,%eax
  104340:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  104343:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104346:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  10434a:	0f b7 d0             	movzwl %ax,%edx
  10434d:	89 d0                	mov    %edx,%eax
  10434f:	c1 e0 02             	shl    $0x2,%eax
  104352:	01 d0                	add    %edx,%eax
  104354:	c1 e0 03             	shl    $0x3,%eax
  104357:	89 c2                	mov    %eax,%edx
  104359:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10435c:	01 d0                	add    %edx,%eax
  10435e:	8b 40 04             	mov    0x4(%eax),%eax
  104361:	83 f8 03             	cmp    $0x3,%eax
  104364:	74 1f                	je     104385 <elf_load+0x108>
  104366:	8d 83 68 d5 ff ff    	lea    -0x2a98(%ebx),%eax
  10436c:	50                   	push   %eax
  10436d:	8d 83 19 d5 ff ff    	lea    -0x2ae7(%ebx),%eax
  104373:	50                   	push   %eax
  104374:	6a 2d                	push   $0x2d
  104376:	8d 83 36 d5 ff ff    	lea    -0x2aca(%ebx),%eax
  10437c:	50                   	push   %eax
  10437d:	e8 c2 e7 ff ff       	call   102b44 <debug_panic>
  104382:	83 c4 10             	add    $0x10,%esp
  104385:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104388:	8b 50 1c             	mov    0x1c(%eax),%edx
  10438b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10438e:	01 d0                	add    %edx,%eax
  104390:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104393:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104396:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10439a:	0f b7 c0             	movzwl %ax,%eax
  10439d:	c1 e0 05             	shl    $0x5,%eax
  1043a0:	89 c2                	mov    %eax,%edx
  1043a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043a5:	01 d0                	add    %edx,%eax
  1043a7:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1043aa:	e9 5f 01 00 00       	jmp    10450e <elf_load+0x291>
  1043af:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043b2:	8b 00                	mov    (%eax),%eax
  1043b4:	83 f8 01             	cmp    $0x1,%eax
  1043b7:	0f 85 4c 01 00 00    	jne    104509 <elf_load+0x28c>
  1043bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043c0:	8b 40 04             	mov    0x4(%eax),%eax
  1043c3:	83 ec 08             	sub    $0x8,%esp
  1043c6:	68 00 10 00 00       	push   $0x1000
  1043cb:	50                   	push   %eax
  1043cc:	e8 17 f4 ff ff       	call   1037e8 <rounddown>
  1043d1:	83 c4 10             	add    $0x10,%esp
  1043d4:	8b 55 e0             	mov    -0x20(%ebp),%edx
  1043d7:	01 d0                	add    %edx,%eax
  1043d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1043dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043df:	8b 40 08             	mov    0x8(%eax),%eax
  1043e2:	83 ec 08             	sub    $0x8,%esp
  1043e5:	68 00 10 00 00       	push   $0x1000
  1043ea:	50                   	push   %eax
  1043eb:	e8 f8 f3 ff ff       	call   1037e8 <rounddown>
  1043f0:	83 c4 10             	add    $0x10,%esp
  1043f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1043f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043f9:	8b 50 08             	mov    0x8(%eax),%edx
  1043fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1043ff:	8b 40 10             	mov    0x10(%eax),%eax
  104402:	01 d0                	add    %edx,%eax
  104404:	89 45 cc             	mov    %eax,-0x34(%ebp)
  104407:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10440a:	8b 50 08             	mov    0x8(%eax),%edx
  10440d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104410:	8b 40 14             	mov    0x14(%eax),%eax
  104413:	01 d0                	add    %edx,%eax
  104415:	83 ec 08             	sub    $0x8,%esp
  104418:	68 00 10 00 00       	push   $0x1000
  10441d:	50                   	push   %eax
  10441e:	e8 e4 f3 ff ff       	call   103807 <roundup>
  104423:	83 c4 10             	add    $0x10,%esp
  104426:	89 45 c8             	mov    %eax,-0x38(%ebp)
  104429:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
  104430:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104433:	8b 40 18             	mov    0x18(%eax),%eax
  104436:	83 e0 02             	and    $0x2,%eax
  104439:	85 c0                	test   %eax,%eax
  10443b:	0f 84 ba 00 00 00    	je     1044fb <elf_load+0x27e>
  104441:	83 4d e8 02          	orl    $0x2,-0x18(%ebp)
  104445:	e9 b1 00 00 00       	jmp    1044fb <elf_load+0x27e>
  10444a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10444d:	83 ec 04             	sub    $0x4,%esp
  104450:	ff 75 e8             	push   -0x18(%ebp)
  104453:	ff 75 ec             	push   -0x14(%ebp)
  104456:	50                   	push   %eax
  104457:	e8 b4 11 00 00       	call   105610 <alloc_page>
  10445c:	83 c4 10             	add    $0x10,%esp
  10445f:	83 ec 08             	sub    $0x8,%esp
  104462:	68 00 10 00 00       	push   $0x1000
  104467:	ff 75 cc             	push   -0x34(%ebp)
  10446a:	e8 79 f3 ff ff       	call   1037e8 <rounddown>
  10446f:	83 c4 10             	add    $0x10,%esp
  104472:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  104475:	73 1a                	jae    104491 <elf_load+0x214>
  104477:	8b 55 0c             	mov    0xc(%ebp),%edx
  10447a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10447d:	68 00 10 00 00       	push   $0x1000
  104482:	ff 75 ec             	push   -0x14(%ebp)
  104485:	52                   	push   %edx
  104486:	50                   	push   %eax
  104487:	e8 0e fc ff ff       	call   10409a <pt_copyout>
  10448c:	83 c4 10             	add    $0x10,%esp
  10448f:	eb 5c                	jmp    1044ed <elf_load+0x270>
  104491:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104494:	3b 45 cc             	cmp    -0x34(%ebp),%eax
  104497:	73 3e                	jae    1044d7 <elf_load+0x25a>
  104499:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10449c:	8b 40 10             	mov    0x10(%eax),%eax
  10449f:	85 c0                	test   %eax,%eax
  1044a1:	74 34                	je     1044d7 <elf_load+0x25a>
  1044a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1044a6:	68 00 10 00 00       	push   $0x1000
  1044ab:	6a 00                	push   $0x0
  1044ad:	ff 75 ec             	push   -0x14(%ebp)
  1044b0:	50                   	push   %eax
  1044b1:	e8 f2 fc ff ff       	call   1041a8 <pt_memset>
  1044b6:	83 c4 10             	add    $0x10,%esp
  1044b9:	8b 45 cc             	mov    -0x34(%ebp),%eax
  1044bc:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1044bf:	89 c1                	mov    %eax,%ecx
  1044c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1044c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1044c7:	51                   	push   %ecx
  1044c8:	ff 75 ec             	push   -0x14(%ebp)
  1044cb:	52                   	push   %edx
  1044cc:	50                   	push   %eax
  1044cd:	e8 c8 fb ff ff       	call   10409a <pt_copyout>
  1044d2:	83 c4 10             	add    $0x10,%esp
  1044d5:	eb 16                	jmp    1044ed <elf_load+0x270>
  1044d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1044da:	68 00 10 00 00       	push   $0x1000
  1044df:	6a 00                	push   $0x0
  1044e1:	ff 75 ec             	push   -0x14(%ebp)
  1044e4:	50                   	push   %eax
  1044e5:	e8 be fc ff ff       	call   1041a8 <pt_memset>
  1044ea:	83 c4 10             	add    $0x10,%esp
  1044ed:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  1044f4:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  1044fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1044fe:	3b 45 c8             	cmp    -0x38(%ebp),%eax
  104501:	0f 82 43 ff ff ff    	jb     10444a <elf_load+0x1cd>
  104507:	eb 01                	jmp    10450a <elf_load+0x28d>
  104509:	90                   	nop
  10450a:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  10450e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104511:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  104514:	0f 82 95 fe ff ff    	jb     1043af <elf_load+0x132>
  10451a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10451d:	68 00 10 00 00       	push   $0x1000
  104522:	68 00 00 00 e0       	push   $0xe0000000
  104527:	50                   	push   %eax
  104528:	8d 83 00 20 00 00    	lea    0x2000(%ebx),%eax
  10452e:	50                   	push   %eax
  10452f:	e8 66 fb ff ff       	call   10409a <pt_copyout>
  104534:	83 c4 10             	add    $0x10,%esp
  104537:	90                   	nop
  104538:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10453b:	c9                   	leave  
  10453c:	c3                   	ret    

0010453d <elf_entry>:
  10453d:	55                   	push   %ebp
  10453e:	89 e5                	mov    %esp,%ebp
  104540:	53                   	push   %ebx
  104541:	83 ec 14             	sub    $0x14,%esp
  104544:	e8 6c be ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  104549:	05 b7 4a 00 00       	add    $0x4ab7,%eax
  10454e:	8b 55 08             	mov    0x8(%ebp),%edx
  104551:	89 55 f4             	mov    %edx,-0xc(%ebp)
  104554:	8b 55 f4             	mov    -0xc(%ebp),%edx
  104557:	89 55 f0             	mov    %edx,-0x10(%ebp)
  10455a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10455d:	8b 12                	mov    (%edx),%edx
  10455f:	81 fa 7f 45 4c 46    	cmp    $0x464c457f,%edx
  104565:	74 21                	je     104588 <elf_entry+0x4b>
  104567:	8d 90 00 d5 ff ff    	lea    -0x2b00(%eax),%edx
  10456d:	52                   	push   %edx
  10456e:	8d 90 19 d5 ff ff    	lea    -0x2ae7(%eax),%edx
  104574:	52                   	push   %edx
  104575:	6a 5b                	push   $0x5b
  104577:	8d 90 36 d5 ff ff    	lea    -0x2aca(%eax),%edx
  10457d:	52                   	push   %edx
  10457e:	89 c3                	mov    %eax,%ebx
  104580:	e8 bf e5 ff ff       	call   102b44 <debug_panic>
  104585:	83 c4 10             	add    $0x10,%esp
  104588:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10458b:	8b 40 18             	mov    0x18(%eax),%eax
  10458e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104591:	c9                   	leave  
  104592:	c3                   	ret    

00104593 <trap_dump>:
  104593:	55                   	push   %ebp
  104594:	89 e5                	mov    %esp,%ebp
  104596:	53                   	push   %ebx
  104597:	83 ec 14             	sub    $0x14,%esp
  10459a:	e8 1e be ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  10459f:	81 c3 61 4a 00 00    	add    $0x4a61,%ebx
  1045a5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1045a9:	0f 84 4f 02 00 00    	je     1047fe <trap_dump+0x26b>
  1045af:	8b 45 08             	mov    0x8(%ebp),%eax
  1045b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1045b5:	ff 75 f4             	push   -0xc(%ebp)
  1045b8:	8d 83 98 d5 ff ff    	lea    -0x2a68(%ebx),%eax
  1045be:	50                   	push   %eax
  1045bf:	6a 12                	push   $0x12
  1045c1:	8d 83 a9 d5 ff ff    	lea    -0x2a57(%ebx),%eax
  1045c7:	50                   	push   %eax
  1045c8:	e8 bc e4 ff ff       	call   102a89 <debug_normal>
  1045cd:	83 c4 10             	add    $0x10,%esp
  1045d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1045d3:	8b 10                	mov    (%eax),%edx
  1045d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1045d8:	83 ec 04             	sub    $0x4,%esp
  1045db:	52                   	push   %edx
  1045dc:	50                   	push   %eax
  1045dd:	8d 83 b9 d5 ff ff    	lea    -0x2a47(%ebx),%eax
  1045e3:	50                   	push   %eax
  1045e4:	e8 6f e4 ff ff       	call   102a58 <debug_info>
  1045e9:	83 c4 10             	add    $0x10,%esp
  1045ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1045ef:	8b 40 04             	mov    0x4(%eax),%eax
  1045f2:	8b 55 08             	mov    0x8(%ebp),%edx
  1045f5:	83 c2 04             	add    $0x4,%edx
  1045f8:	83 ec 04             	sub    $0x4,%esp
  1045fb:	50                   	push   %eax
  1045fc:	52                   	push   %edx
  1045fd:	8d 83 cf d5 ff ff    	lea    -0x2a31(%ebx),%eax
  104603:	50                   	push   %eax
  104604:	e8 4f e4 ff ff       	call   102a58 <debug_info>
  104609:	83 c4 10             	add    $0x10,%esp
  10460c:	8b 45 08             	mov    0x8(%ebp),%eax
  10460f:	8b 40 08             	mov    0x8(%eax),%eax
  104612:	8b 55 08             	mov    0x8(%ebp),%edx
  104615:	83 c2 08             	add    $0x8,%edx
  104618:	83 ec 04             	sub    $0x4,%esp
  10461b:	50                   	push   %eax
  10461c:	52                   	push   %edx
  10461d:	8d 83 e5 d5 ff ff    	lea    -0x2a1b(%ebx),%eax
  104623:	50                   	push   %eax
  104624:	e8 2f e4 ff ff       	call   102a58 <debug_info>
  104629:	83 c4 10             	add    $0x10,%esp
  10462c:	8b 45 08             	mov    0x8(%ebp),%eax
  10462f:	8b 40 0c             	mov    0xc(%eax),%eax
  104632:	8b 55 08             	mov    0x8(%ebp),%edx
  104635:	83 c2 0c             	add    $0xc,%edx
  104638:	83 ec 04             	sub    $0x4,%esp
  10463b:	50                   	push   %eax
  10463c:	52                   	push   %edx
  10463d:	8d 83 fb d5 ff ff    	lea    -0x2a05(%ebx),%eax
  104643:	50                   	push   %eax
  104644:	e8 0f e4 ff ff       	call   102a58 <debug_info>
  104649:	83 c4 10             	add    $0x10,%esp
  10464c:	8b 45 08             	mov    0x8(%ebp),%eax
  10464f:	8b 40 10             	mov    0x10(%eax),%eax
  104652:	8b 55 08             	mov    0x8(%ebp),%edx
  104655:	83 c2 10             	add    $0x10,%edx
  104658:	83 ec 04             	sub    $0x4,%esp
  10465b:	50                   	push   %eax
  10465c:	52                   	push   %edx
  10465d:	8d 83 11 d6 ff ff    	lea    -0x29ef(%ebx),%eax
  104663:	50                   	push   %eax
  104664:	e8 ef e3 ff ff       	call   102a58 <debug_info>
  104669:	83 c4 10             	add    $0x10,%esp
  10466c:	8b 45 08             	mov    0x8(%ebp),%eax
  10466f:	8b 40 14             	mov    0x14(%eax),%eax
  104672:	8b 55 08             	mov    0x8(%ebp),%edx
  104675:	83 c2 14             	add    $0x14,%edx
  104678:	83 ec 04             	sub    $0x4,%esp
  10467b:	50                   	push   %eax
  10467c:	52                   	push   %edx
  10467d:	8d 83 27 d6 ff ff    	lea    -0x29d9(%ebx),%eax
  104683:	50                   	push   %eax
  104684:	e8 cf e3 ff ff       	call   102a58 <debug_info>
  104689:	83 c4 10             	add    $0x10,%esp
  10468c:	8b 45 08             	mov    0x8(%ebp),%eax
  10468f:	8b 40 18             	mov    0x18(%eax),%eax
  104692:	8b 55 08             	mov    0x8(%ebp),%edx
  104695:	83 c2 18             	add    $0x18,%edx
  104698:	83 ec 04             	sub    $0x4,%esp
  10469b:	50                   	push   %eax
  10469c:	52                   	push   %edx
  10469d:	8d 83 3d d6 ff ff    	lea    -0x29c3(%ebx),%eax
  1046a3:	50                   	push   %eax
  1046a4:	e8 af e3 ff ff       	call   102a58 <debug_info>
  1046a9:	83 c4 10             	add    $0x10,%esp
  1046ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1046af:	8b 40 1c             	mov    0x1c(%eax),%eax
  1046b2:	8b 55 08             	mov    0x8(%ebp),%edx
  1046b5:	83 c2 1c             	add    $0x1c,%edx
  1046b8:	83 ec 04             	sub    $0x4,%esp
  1046bb:	50                   	push   %eax
  1046bc:	52                   	push   %edx
  1046bd:	8d 83 53 d6 ff ff    	lea    -0x29ad(%ebx),%eax
  1046c3:	50                   	push   %eax
  1046c4:	e8 8f e3 ff ff       	call   102a58 <debug_info>
  1046c9:	83 c4 10             	add    $0x10,%esp
  1046cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1046cf:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1046d3:	0f b7 c0             	movzwl %ax,%eax
  1046d6:	8b 55 08             	mov    0x8(%ebp),%edx
  1046d9:	83 c2 20             	add    $0x20,%edx
  1046dc:	83 ec 04             	sub    $0x4,%esp
  1046df:	50                   	push   %eax
  1046e0:	52                   	push   %edx
  1046e1:	8d 83 69 d6 ff ff    	lea    -0x2997(%ebx),%eax
  1046e7:	50                   	push   %eax
  1046e8:	e8 6b e3 ff ff       	call   102a58 <debug_info>
  1046ed:	83 c4 10             	add    $0x10,%esp
  1046f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1046f3:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1046f7:	0f b7 c0             	movzwl %ax,%eax
  1046fa:	8b 55 08             	mov    0x8(%ebp),%edx
  1046fd:	83 c2 24             	add    $0x24,%edx
  104700:	83 ec 04             	sub    $0x4,%esp
  104703:	50                   	push   %eax
  104704:	52                   	push   %edx
  104705:	8d 83 7f d6 ff ff    	lea    -0x2981(%ebx),%eax
  10470b:	50                   	push   %eax
  10470c:	e8 47 e3 ff ff       	call   102a58 <debug_info>
  104711:	83 c4 10             	add    $0x10,%esp
  104714:	8b 45 08             	mov    0x8(%ebp),%eax
  104717:	8b 40 28             	mov    0x28(%eax),%eax
  10471a:	8b 55 08             	mov    0x8(%ebp),%edx
  10471d:	83 c2 28             	add    $0x28,%edx
  104720:	83 ec 04             	sub    $0x4,%esp
  104723:	50                   	push   %eax
  104724:	52                   	push   %edx
  104725:	8d 83 95 d6 ff ff    	lea    -0x296b(%ebx),%eax
  10472b:	50                   	push   %eax
  10472c:	e8 27 e3 ff ff       	call   102a58 <debug_info>
  104731:	83 c4 10             	add    $0x10,%esp
  104734:	8b 45 08             	mov    0x8(%ebp),%eax
  104737:	8b 40 2c             	mov    0x2c(%eax),%eax
  10473a:	8b 55 08             	mov    0x8(%ebp),%edx
  10473d:	83 c2 2c             	add    $0x2c,%edx
  104740:	83 ec 04             	sub    $0x4,%esp
  104743:	50                   	push   %eax
  104744:	52                   	push   %edx
  104745:	8d 83 ab d6 ff ff    	lea    -0x2955(%ebx),%eax
  10474b:	50                   	push   %eax
  10474c:	e8 07 e3 ff ff       	call   102a58 <debug_info>
  104751:	83 c4 10             	add    $0x10,%esp
  104754:	8b 45 08             	mov    0x8(%ebp),%eax
  104757:	8b 40 30             	mov    0x30(%eax),%eax
  10475a:	8b 55 08             	mov    0x8(%ebp),%edx
  10475d:	83 c2 30             	add    $0x30,%edx
  104760:	83 ec 04             	sub    $0x4,%esp
  104763:	50                   	push   %eax
  104764:	52                   	push   %edx
  104765:	8d 83 c1 d6 ff ff    	lea    -0x293f(%ebx),%eax
  10476b:	50                   	push   %eax
  10476c:	e8 e7 e2 ff ff       	call   102a58 <debug_info>
  104771:	83 c4 10             	add    $0x10,%esp
  104774:	8b 45 08             	mov    0x8(%ebp),%eax
  104777:	0f b7 40 34          	movzwl 0x34(%eax),%eax
  10477b:	0f b7 c0             	movzwl %ax,%eax
  10477e:	8b 55 08             	mov    0x8(%ebp),%edx
  104781:	83 c2 34             	add    $0x34,%edx
  104784:	83 ec 04             	sub    $0x4,%esp
  104787:	50                   	push   %eax
  104788:	52                   	push   %edx
  104789:	8d 83 d7 d6 ff ff    	lea    -0x2929(%ebx),%eax
  10478f:	50                   	push   %eax
  104790:	e8 c3 e2 ff ff       	call   102a58 <debug_info>
  104795:	83 c4 10             	add    $0x10,%esp
  104798:	8b 45 08             	mov    0x8(%ebp),%eax
  10479b:	8b 40 38             	mov    0x38(%eax),%eax
  10479e:	8b 55 08             	mov    0x8(%ebp),%edx
  1047a1:	83 c2 38             	add    $0x38,%edx
  1047a4:	83 ec 04             	sub    $0x4,%esp
  1047a7:	50                   	push   %eax
  1047a8:	52                   	push   %edx
  1047a9:	8d 83 ed d6 ff ff    	lea    -0x2913(%ebx),%eax
  1047af:	50                   	push   %eax
  1047b0:	e8 a3 e2 ff ff       	call   102a58 <debug_info>
  1047b5:	83 c4 10             	add    $0x10,%esp
  1047b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1047bb:	8b 40 3c             	mov    0x3c(%eax),%eax
  1047be:	8b 55 08             	mov    0x8(%ebp),%edx
  1047c1:	83 c2 3c             	add    $0x3c,%edx
  1047c4:	83 ec 04             	sub    $0x4,%esp
  1047c7:	50                   	push   %eax
  1047c8:	52                   	push   %edx
  1047c9:	8d 83 fb d5 ff ff    	lea    -0x2a05(%ebx),%eax
  1047cf:	50                   	push   %eax
  1047d0:	e8 83 e2 ff ff       	call   102a58 <debug_info>
  1047d5:	83 c4 10             	add    $0x10,%esp
  1047d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1047db:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  1047df:	0f b7 c0             	movzwl %ax,%eax
  1047e2:	8b 55 08             	mov    0x8(%ebp),%edx
  1047e5:	83 c2 40             	add    $0x40,%edx
  1047e8:	83 ec 04             	sub    $0x4,%esp
  1047eb:	50                   	push   %eax
  1047ec:	52                   	push   %edx
  1047ed:	8d 83 03 d7 ff ff    	lea    -0x28fd(%ebx),%eax
  1047f3:	50                   	push   %eax
  1047f4:	e8 5f e2 ff ff       	call   102a58 <debug_info>
  1047f9:	83 c4 10             	add    $0x10,%esp
  1047fc:	eb 01                	jmp    1047ff <trap_dump+0x26c>
  1047fe:	90                   	nop
  1047ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104802:	c9                   	leave  
  104803:	c3                   	ret    

00104804 <pgflt_handler>:
  104804:	55                   	push   %ebp
  104805:	89 e5                	mov    %esp,%ebp
  104807:	53                   	push   %ebx
  104808:	83 ec 14             	sub    $0x14,%esp
  10480b:	e8 ad bb ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104810:	81 c3 f0 47 00 00    	add    $0x47f0,%ebx
  104816:	8b 45 08             	mov    0x8(%ebp),%eax
  104819:	8b 40 2c             	mov    0x2c(%eax),%eax
  10481c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10481f:	e8 27 f2 ff ff       	call   103a4b <rcr2>
  104824:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104827:	8b 45 08             	mov    0x8(%ebp),%eax
  10482a:	8b 50 30             	mov    0x30(%eax),%edx
  10482d:	c7 c0 2c 6c 15 00    	mov    $0x156c2c,%eax
  104833:	8b 00                	mov    (%eax),%eax
  104835:	83 ec 0c             	sub    $0xc,%esp
  104838:	52                   	push   %edx
  104839:	50                   	push   %eax
  10483a:	ff 75 f4             	push   -0xc(%ebp)
  10483d:	ff 75 f0             	push   -0x10(%ebp)
  104840:	8d 83 1c d7 ff ff    	lea    -0x28e4(%ebx),%eax
  104846:	50                   	push   %eax
  104847:	e8 10 e5 ff ff       	call   102d5c <dprintf>
  10484c:	83 c4 20             	add    $0x20,%esp
  10484f:	8b 45 08             	mov    0x8(%ebp),%eax
  104852:	8b 40 2c             	mov    0x2c(%eax),%eax
  104855:	83 e0 01             	and    $0x1,%eax
  104858:	85 c0                	test   %eax,%eax
  10485a:	74 23                	je     10487f <pgflt_handler+0x7b>
  10485c:	83 ec 0c             	sub    $0xc,%esp
  10485f:	ff 75 f4             	push   -0xc(%ebp)
  104862:	ff 75 f0             	push   -0x10(%ebp)
  104865:	8d 83 60 d7 ff ff    	lea    -0x28a0(%ebx),%eax
  10486b:	50                   	push   %eax
  10486c:	6a 32                	push   $0x32
  10486e:	8d 83 a9 d5 ff ff    	lea    -0x2a57(%ebx),%eax
  104874:	50                   	push   %eax
  104875:	e8 ca e2 ff ff       	call   102b44 <debug_panic>
  10487a:	83 c4 20             	add    $0x20,%esp
  10487d:	eb 2a                	jmp    1048a9 <pgflt_handler+0xa5>
  10487f:	83 ec 08             	sub    $0x8,%esp
  104882:	68 00 10 00 00       	push   $0x1000
  104887:	ff 75 f0             	push   -0x10(%ebp)
  10488a:	e8 59 ef ff ff       	call   1037e8 <rounddown>
  10488f:	83 c4 10             	add    $0x10,%esp
  104892:	c7 c2 2c 6c 15 00    	mov    $0x156c2c,%edx
  104898:	8b 12                	mov    (%edx),%edx
  10489a:	83 ec 04             	sub    $0x4,%esp
  10489d:	6a 07                	push   $0x7
  10489f:	50                   	push   %eax
  1048a0:	52                   	push   %edx
  1048a1:	e8 6a 0d 00 00       	call   105610 <alloc_page>
  1048a6:	83 c4 10             	add    $0x10,%esp
  1048a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1048ac:	c9                   	leave  
  1048ad:	c3                   	ret    

001048ae <checkpoint>:
  1048ae:	55                   	push   %ebp
  1048af:	89 e5                	mov    %esp,%ebp
  1048b1:	53                   	push   %ebx
  1048b2:	83 ec 04             	sub    $0x4,%esp
  1048b5:	e8 fb ba ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  1048ba:	05 46 47 00 00       	add    $0x4746,%eax
  1048bf:	83 ec 0c             	sub    $0xc,%esp
  1048c2:	8d 90 91 d7 ff ff    	lea    -0x286f(%eax),%edx
  1048c8:	52                   	push   %edx
  1048c9:	89 c3                	mov    %eax,%ebx
  1048cb:	e8 88 e1 ff ff       	call   102a58 <debug_info>
  1048d0:	83 c4 10             	add    $0x10,%esp
  1048d3:	90                   	nop
  1048d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1048d7:	c9                   	leave  
  1048d8:	c3                   	ret    

001048d9 <trap>:
  1048d9:	55                   	push   %ebp
  1048da:	89 e5                	mov    %esp,%ebp
  1048dc:	53                   	push   %ebx
  1048dd:	83 ec 04             	sub    $0x4,%esp
  1048e0:	e8 d8 ba ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1048e5:	81 c3 1b 47 00 00    	add    $0x471b,%ebx
  1048eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1048ee:	8b 40 28             	mov    0x28(%eax),%eax
  1048f1:	83 f8 0e             	cmp    $0xe,%eax
  1048f4:	75 1d                	jne    104913 <trap+0x3a>
  1048f6:	83 ec 0c             	sub    $0xc,%esp
  1048f9:	6a 00                	push   $0x0
  1048fb:	e8 60 07 00 00       	call   105060 <set_pdir_base>
  104900:	83 c4 10             	add    $0x10,%esp
  104903:	83 ec 0c             	sub    $0xc,%esp
  104906:	ff 75 08             	push   0x8(%ebp)
  104909:	e8 f6 fe ff ff       	call   104804 <pgflt_handler>
  10490e:	83 c4 10             	add    $0x10,%esp
  104911:	eb 48                	jmp    10495b <trap+0x82>
  104913:	8b 45 08             	mov    0x8(%ebp),%eax
  104916:	8b 40 28             	mov    0x28(%eax),%eax
  104919:	50                   	push   %eax
  10491a:	8d 83 9e d7 ff ff    	lea    -0x2862(%ebx),%eax
  104920:	50                   	push   %eax
  104921:	6a 45                	push   $0x45
  104923:	8d 83 a9 d5 ff ff    	lea    -0x2a57(%ebx),%eax
  104929:	50                   	push   %eax
  10492a:	e8 5a e1 ff ff       	call   102a89 <debug_normal>
  10492f:	83 c4 10             	add    $0x10,%esp
  104932:	83 ec 0c             	sub    $0xc,%esp
  104935:	ff 75 08             	push   0x8(%ebp)
  104938:	e8 56 fc ff ff       	call   104593 <trap_dump>
  10493d:	83 c4 10             	add    $0x10,%esp
  104940:	83 ec 04             	sub    $0x4,%esp
  104943:	8d 83 b2 d7 ff ff    	lea    -0x284e(%ebx),%eax
  104949:	50                   	push   %eax
  10494a:	6a 47                	push   $0x47
  10494c:	8d 83 a9 d5 ff ff    	lea    -0x2a57(%ebx),%eax
  104952:	50                   	push   %eax
  104953:	e8 ec e1 ff ff       	call   102b44 <debug_panic>
  104958:	83 c4 10             	add    $0x10,%esp
  10495b:	c7 c0 2c 6c 15 00    	mov    $0x156c2c,%eax
  104961:	8b 00                	mov    (%eax),%eax
  104963:	83 ec 0c             	sub    $0xc,%esp
  104966:	50                   	push   %eax
  104967:	e8 f4 06 00 00       	call   105060 <set_pdir_base>
  10496c:	83 c4 10             	add    $0x10,%esp
  10496f:	83 ec 0c             	sub    $0xc,%esp
  104972:	ff 75 08             	push   0x8(%ebp)
  104975:	e8 16 de ff ff       	call   102790 <trap_return>
  10497a:	83 c4 10             	add    $0x10,%esp
  10497d:	90                   	nop
  10497e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104981:	c9                   	leave  
  104982:	c3                   	ret    
  104983:	66 90                	xchg   %ax,%ax
  104985:	66 90                	xchg   %ax,%ax
  104987:	66 90                	xchg   %ax,%ax
  104989:	66 90                	xchg   %ax,%ax
  10498b:	66 90                	xchg   %ax,%ax
  10498d:	66 90                	xchg   %ax,%ax
  10498f:	90                   	nop

00104990 <kern_init>:
    monitor(NULL);
#endif
}

void kern_init(uintptr_t mbi_addr)
{
  104990:	56                   	push   %esi
  104991:	53                   	push   %ebx
  104992:	e8 26 ba ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104997:	81 c3 69 46 00 00    	add    $0x4669,%ebx
  10499d:	83 ec 10             	sub    $0x10,%esp
#ifdef TEST
    pdir_init_kern(mbi_addr);
#else
    paging_init(mbi_addr);
  1049a0:	ff 74 24 1c          	push   0x1c(%esp)
  1049a4:	e8 37 0c 00 00       	call   1055e0 <paging_init>
#endif

    KERN_DEBUG("Kernel initialized.\n");
  1049a9:	8d b3 ce d7 ff ff    	lea    -0x2832(%ebx),%esi
  1049af:	83 c4 0c             	add    $0xc,%esp
  1049b2:	8d 83 b9 d7 ff ff    	lea    -0x2847(%ebx),%eax
  1049b8:	50                   	push   %eax
  1049b9:	6a 53                	push   $0x53
  1049bb:	56                   	push   %esi
  1049bc:	e8 c8 e0 ff ff       	call   102a89 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  1049c1:	83 c4 0c             	add    $0xc,%esp
  1049c4:	8d 83 df d7 ff ff    	lea    -0x2821(%ebx),%eax
  1049ca:	50                   	push   %eax
  1049cb:	6a 18                	push   $0x18
  1049cd:	56                   	push   %esi
  1049ce:	e8 b6 e0 ff ff       	call   102a89 <debug_normal>
    monitor(NULL);
  1049d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1049da:	e8 1a f5 ff ff       	call   103ef9 <monitor>

    kern_main();
}
  1049df:	83 c4 14             	add    $0x14,%esp
  1049e2:	5b                   	pop    %ebx
  1049e3:	5e                   	pop    %esi
  1049e4:	c3                   	ret    
  1049e5:	66 90                	xchg   %ax,%ax
  1049e7:	90                   	nop
  1049e8:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  1049ee:	00 00                	add    %al,(%eax)
  1049f0:	fb                   	sti    
  1049f1:	4f                   	dec    %edi
  1049f2:	52                   	push   %edx
  1049f3:	e4                   	.byte 0xe4

001049f4 <start>:
  1049f4:	fa                   	cli    
  1049f5:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
  1049fa:	75 27                	jne    104a23 <spin>
  1049fc:	89 1d 24 4a 10 00    	mov    %ebx,0x104a24
  104a02:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  104a09:	34 12 
  104a0b:	6a 02                	push   $0x2
  104a0d:	9d                   	popf   
  104a0e:	bd 00 00 00 00       	mov    $0x0,%ebp
  104a13:	bc 00 30 11 00       	mov    $0x113000,%esp
  104a18:	ff 35 24 4a 10 00    	push   0x104a24
  104a1e:	e8 6d ff ff ff       	call   104990 <kern_init>

00104a23 <spin>:
  104a23:	f4                   	hlt    

00104a24 <multiboot_ptr>:
  104a24:	00 00                	add    %al,(%eax)
  104a26:	00 00                	add    %al,(%eax)
  104a28:	66 90                	xchg   %ax,%ax
  104a2a:	66 90                	xchg   %ax,%ax
  104a2c:	66 90                	xchg   %ax,%ax
  104a2e:	66 90                	xchg   %ax,%ax

00104a30 <get_nps>:
static struct ATStruct AT[1 << 20];

// The getter function for NUM_PAGES.
unsigned int get_nps(void)
{
    return NUM_PAGES;
  104a30:	e8 80 b9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  104a35:	05 cb 45 00 00       	add    $0x45cb,%eax
  104a3a:	8b 80 40 dc 84 00    	mov    0x84dc40(%eax),%eax
}
  104a40:	c3                   	ret    
  104a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104a48:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104a4f:	90                   	nop

00104a50 <set_nps>:

// The setter function for NUM_PAGES.
void set_nps(unsigned int nps)
{
    NUM_PAGES = nps;
  104a50:	e8 60 b9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  104a55:	05 ab 45 00 00       	add    $0x45ab,%eax
  104a5a:	8b 54 24 04          	mov    0x4(%esp),%edx
  104a5e:	89 90 40 dc 84 00    	mov    %edx,0x84dc40(%eax)
}
  104a64:	c3                   	ret    
  104a65:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104a70 <at_is_norm>:
        perm = 1;
    } else {
        perm = 0;
    }

    return perm;
  104a70:	e8 40 b9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  104a75:	05 8b 45 00 00       	add    $0x458b,%eax
    if (perm > 1) {
  104a7a:	8b 54 24 04          	mov    0x4(%esp),%edx
  104a7e:	83 bc d0 40 dc 04 00 	cmpl   $0x1,0x4dc40(%eax,%edx,8)
  104a85:	01 
  104a86:	0f 97 c0             	seta   %al
  104a89:	0f b6 c0             	movzbl %al,%eax
}
  104a8c:	c3                   	ret    
  104a8d:	8d 76 00             	lea    0x0(%esi),%esi

00104a90 <at_set_perm>:
 * Sets the permission of the page with given index.
 * It also marks the page as unallocated.
 */
void at_set_perm(unsigned int page_index, unsigned int perm)
{
    AT[page_index].perm = perm;
  104a90:	e8 20 b9 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  104a95:	05 6b 45 00 00       	add    $0x456b,%eax
{
  104a9a:	8b 54 24 04          	mov    0x4(%esp),%edx
    AT[page_index].perm = perm;
  104a9e:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    AT[page_index].allocated = 0;
  104aa2:	c7 84 d0 44 dc 04 00 	movl   $0x0,0x4dc44(%eax,%edx,8)
  104aa9:	00 00 00 00 
    AT[page_index].perm = perm;
  104aad:	89 8c d0 40 dc 04 00 	mov    %ecx,0x4dc40(%eax,%edx,8)
}
  104ab4:	c3                   	ret    
  104ab5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104ac0 <at_is_allocated>:
    allocated = AT[page_index].allocated;
    if (allocated > 0) {
        allocated = 1;
    }

    return allocated;
  104ac0:	e8 f0 b8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  104ac5:	05 3b 45 00 00       	add    $0x453b,%eax
    if (allocated > 0) {
  104aca:	8b 54 24 04          	mov    0x4(%esp),%edx
  104ace:	8b 84 d0 44 dc 04 00 	mov    0x4dc44(%eax,%edx,8),%eax
  104ad5:	85 c0                	test   %eax,%eax
  104ad7:	0f 95 c0             	setne  %al
  104ada:	0f b6 c0             	movzbl %al,%eax
}
  104add:	c3                   	ret    
  104ade:	66 90                	xchg   %ax,%ax

00104ae0 <at_set_allocated>:
 * The setter function for the physical page allocation flag.
 * Set the flag of the page with given index to the given value.
 */
void at_set_allocated(unsigned int page_index, unsigned int allocated)
{
    AT[page_index].allocated = allocated;
  104ae0:	e8 d0 b8 ff ff       	call   1003b5 <__x86.get_pc_thunk.ax>
  104ae5:	05 1b 45 00 00       	add    $0x451b,%eax
  104aea:	8b 54 24 04          	mov    0x4(%esp),%edx
  104aee:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  104af2:	89 8c d0 44 dc 04 00 	mov    %ecx,0x4dc44(%eax,%edx,8)
}
  104af9:	c3                   	ret    
  104afa:	66 90                	xchg   %ax,%ax
  104afc:	66 90                	xchg   %ax,%ax
  104afe:	66 90                	xchg   %ax,%ax

00104b00 <pmem_init>:
 *    based on the information available in the physical memory map table.
 *    Review import.h in the current directory for the list of available
 *    getter and setter functions.
 */
void pmem_init(unsigned int mbi_addr)
{
  104b00:	55                   	push   %ebp
  104b01:	57                   	push   %edi
  104b02:	56                   	push   %esi
  104b03:	53                   	push   %ebx
  104b04:	e8 b4 b8 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104b09:	81 c3 f7 44 00 00    	add    $0x44f7,%ebx
  104b0f:	83 ec 38             	sub    $0x38,%esp
    unsigned int pg_idx, pmmap_size, cur_addr, highest_addr;
    unsigned int entry_idx, flag, isnorm, start, len;

    // Calls the lower layer initialization primitive.
    // The parameter mbi_addr should not be used in the further code.
    devinit(mbi_addr);
  104b12:	ff 74 24 4c          	push   0x4c(%esp)
  104b16:	e8 e2 bf ff ff       	call   100afd <devinit>
     * Hint: Think of it as the highest address in the ranges of the memory map table,
     *       divided by the page size.
     */
    nps = 0;
    entry_idx = 0;
    pmmap_size = get_size();
  104b1b:	e8 2b c5 ff ff       	call   10104b <get_size>
  104b20:	89 44 24 18          	mov    %eax,0x18(%esp)
    while (entry_idx < pmmap_size) {
  104b24:	83 c4 10             	add    $0x10,%esp
  104b27:	85 c0                	test   %eax,%eax
  104b29:	0f 84 57 01 00 00    	je     104c86 <pmem_init+0x186>
    entry_idx = 0;
  104b2f:	31 ff                	xor    %edi,%edi
    nps = 0;
  104b31:	31 f6                	xor    %esi,%esi
  104b33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104b37:	90                   	nop
        cur_addr = get_mms(entry_idx) + get_mml(entry_idx);
  104b38:	83 ec 0c             	sub    $0xc,%esp
  104b3b:	57                   	push   %edi
  104b3c:	e8 1f c5 ff ff       	call   101060 <get_mms>
  104b41:	89 3c 24             	mov    %edi,(%esp)
  104b44:	89 c5                	mov    %eax,%ebp
  104b46:	e8 7b c5 ff ff       	call   1010c6 <get_mml>
  104b4b:	01 e8                	add    %ebp,%eax
  104b4d:	39 c6                	cmp    %eax,%esi
  104b4f:	0f 42 f0             	cmovb  %eax,%esi
    while (entry_idx < pmmap_size) {
  104b52:	83 c4 10             	add    $0x10,%esp
        if (nps < cur_addr) {
            nps = cur_addr;
        }
        entry_idx++;
  104b55:	83 c7 01             	add    $0x1,%edi
    while (entry_idx < pmmap_size) {
  104b58:	39 7c 24 08          	cmp    %edi,0x8(%esp)
  104b5c:	75 da                	jne    104b38 <pmem_init+0x38>
    }

    nps = ROUNDDOWN(nps, PAGESIZE) / PAGESIZE;
  104b5e:	89 f5                	mov    %esi,%ebp
    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  104b60:	83 ec 0c             	sub    $0xc,%esp
    nps = ROUNDDOWN(nps, PAGESIZE) / PAGESIZE;
  104b63:	c1 ed 0c             	shr    $0xc,%ebp
  104b66:	89 6c 24 28          	mov    %ebp,0x28(%esp)
    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  104b6a:	55                   	push   %ebp
  104b6b:	e8 e0 fe ff ff       	call   104a50 <set_nps>
     *    not aligned by pages, so it may be possible that for some pages, only some of
     *    the addresses are in a usable range. Currently, we do not utilize partial pages,
     *    so in that case, you should consider those pages as unavailable.
     */
    pg_idx = 0;
    while (pg_idx < nps) {
  104b70:	83 c4 10             	add    $0x10,%esp
  104b73:	85 ed                	test   %ebp,%ebp
  104b75:	0f 84 ea 00 00 00    	je     104c65 <pmem_init+0x165>
  104b7b:	31 c0                	xor    %eax,%eax
    pg_idx = 0;
  104b7d:	89 7c 24 10          	mov    %edi,0x10(%esp)
  104b81:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  104b88:	00 
  104b89:	89 c7                	mov    %eax,%edi
  104b8b:	eb 25                	jmp    104bb2 <pmem_init+0xb2>
  104b8d:	8d 76 00             	lea    0x0(%esi),%esi
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
            at_set_perm(pg_idx, 1);
  104b90:	83 ec 08             	sub    $0x8,%esp
  104b93:	6a 01                	push   $0x1
  104b95:	51                   	push   %ecx
  104b96:	e8 f5 fe ff ff       	call   104a90 <at_set_perm>
  104b9b:	83 c4 10             	add    $0x10,%esp
    while (pg_idx < nps) {
  104b9e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  104ba2:	81 c7 00 10 00 00    	add    $0x1000,%edi
  104ba8:	39 54 24 08          	cmp    %edx,0x8(%esp)
  104bac:	0f 84 b3 00 00 00    	je     104c65 <pmem_init+0x165>
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
  104bb2:	8b 44 24 08          	mov    0x8(%esp),%eax
  104bb6:	89 c1                	mov    %eax,%ecx
  104bb8:	89 44 24 18          	mov    %eax,0x18(%esp)
            isnorm = 0;
            while (entry_idx < pmmap_size && !flag) {
                isnorm = is_usable(entry_idx);
                start = get_mms(entry_idx);
                len = get_mml(entry_idx);
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  104bbc:	83 c0 01             	add    $0x1,%eax
  104bbf:	89 44 24 08          	mov    %eax,0x8(%esp)
        if (pg_idx < VM_USERLO_PI || VM_USERHI_PI <= pg_idx) {
  104bc3:	8d 81 00 00 fc ff    	lea    -0x40000(%ecx),%eax
  104bc9:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  104bce:	77 c0                	ja     104b90 <pmem_init+0x90>
            while (entry_idx < pmmap_size && !flag) {
  104bd0:	8b 44 24 08          	mov    0x8(%esp),%eax
            entry_idx = 0;
  104bd4:	31 f6                	xor    %esi,%esi
  104bd6:	c1 e0 0c             	shl    $0xc,%eax
  104bd9:	89 44 24 14          	mov    %eax,0x14(%esp)
  104bdd:	eb 1f                	jmp    104bfe <pmem_init+0xfe>
  104bdf:	90                   	nop
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  104be0:	8d 54 05 00          	lea    0x0(%ebp,%eax,1),%edx
  104be4:	3b 54 24 14          	cmp    0x14(%esp),%edx
  104be8:	0f 93 c2             	setae  %dl
  104beb:	0f 92 c0             	setb   %al
                    flag = 1;
                }
                entry_idx++;
  104bee:	83 c6 01             	add    $0x1,%esi
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  104bf1:	0f b6 d2             	movzbl %dl,%edx
            while (entry_idx < pmmap_size && !flag) {
  104bf4:	3b 74 24 10          	cmp    0x10(%esp),%esi
  104bf8:	73 3a                	jae    104c34 <pmem_init+0x134>
  104bfa:	84 c0                	test   %al,%al
  104bfc:	74 36                	je     104c34 <pmem_init+0x134>
                isnorm = is_usable(entry_idx);
  104bfe:	83 ec 0c             	sub    $0xc,%esp
  104c01:	56                   	push   %esi
  104c02:	e8 2f c5 ff ff       	call   101136 <is_usable>
                start = get_mms(entry_idx);
  104c07:	89 34 24             	mov    %esi,(%esp)
                isnorm = is_usable(entry_idx);
  104c0a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
                start = get_mms(entry_idx);
  104c0e:	e8 4d c4 ff ff       	call   101060 <get_mms>
                len = get_mml(entry_idx);
  104c13:	89 34 24             	mov    %esi,(%esp)
                start = get_mms(entry_idx);
  104c16:	89 c5                	mov    %eax,%ebp
                len = get_mml(entry_idx);
  104c18:	e8 a9 c4 ff ff       	call   1010c6 <get_mml>
                if (start <= pg_idx * PAGESIZE && (pg_idx + 1) * PAGESIZE <= start + len) {
  104c1d:	83 c4 10             	add    $0x10,%esp
  104c20:	39 ef                	cmp    %ebp,%edi
  104c22:	73 bc                	jae    104be0 <pmem_init+0xe0>
  104c24:	b8 01 00 00 00       	mov    $0x1,%eax
  104c29:	31 d2                	xor    %edx,%edx
                entry_idx++;
  104c2b:	83 c6 01             	add    $0x1,%esi
            while (entry_idx < pmmap_size && !flag) {
  104c2e:	3b 74 24 10          	cmp    0x10(%esp),%esi
  104c32:	72 c6                	jb     104bfa <pmem_init+0xfa>
            }

            if (flag && isnorm) {
  104c34:	8b 44 24 0c          	mov    0xc(%esp),%eax
  104c38:	85 c0                	test   %eax,%eax
  104c3a:	74 34                	je     104c70 <pmem_init+0x170>
  104c3c:	85 d2                	test   %edx,%edx
  104c3e:	74 30                	je     104c70 <pmem_init+0x170>
                at_set_perm(pg_idx, 2);
  104c40:	83 ec 08             	sub    $0x8,%esp
    while (pg_idx < nps) {
  104c43:	81 c7 00 10 00 00    	add    $0x1000,%edi
                at_set_perm(pg_idx, 2);
  104c49:	6a 02                	push   $0x2
  104c4b:	ff 74 24 24          	push   0x24(%esp)
  104c4f:	e8 3c fe ff ff       	call   104a90 <at_set_perm>
  104c54:	83 c4 10             	add    $0x10,%esp
    while (pg_idx < nps) {
  104c57:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  104c5b:	39 54 24 08          	cmp    %edx,0x8(%esp)
  104c5f:	0f 85 4d ff ff ff    	jne    104bb2 <pmem_init+0xb2>
                at_set_perm(pg_idx, 0);
            }
        }
        pg_idx++;
    }
}
  104c65:	83 c4 2c             	add    $0x2c,%esp
  104c68:	5b                   	pop    %ebx
  104c69:	5e                   	pop    %esi
  104c6a:	5f                   	pop    %edi
  104c6b:	5d                   	pop    %ebp
  104c6c:	c3                   	ret    
  104c6d:	8d 76 00             	lea    0x0(%esi),%esi
                at_set_perm(pg_idx, 0);
  104c70:	83 ec 08             	sub    $0x8,%esp
  104c73:	6a 00                	push   $0x0
  104c75:	ff 74 24 24          	push   0x24(%esp)
  104c79:	e8 12 fe ff ff       	call   104a90 <at_set_perm>
  104c7e:	83 c4 10             	add    $0x10,%esp
  104c81:	e9 18 ff ff ff       	jmp    104b9e <pmem_init+0x9e>
    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  104c86:	83 ec 0c             	sub    $0xc,%esp
  104c89:	6a 00                	push   $0x0
  104c8b:	e8 c0 fd ff ff       	call   104a50 <set_nps>
  104c90:	83 c4 10             	add    $0x10,%esp
}
  104c93:	83 c4 2c             	add    $0x2c,%esp
  104c96:	5b                   	pop    %ebx
  104c97:	5e                   	pop    %esi
  104c98:	5f                   	pop    %edi
  104c99:	5d                   	pop    %ebp
  104c9a:	c3                   	ret    
  104c9b:	66 90                	xchg   %ax,%ax
  104c9d:	66 90                	xchg   %ax,%ax
  104c9f:	90                   	nop

00104ca0 <palloc>:
 *    return 0.
 * 2. Optimize the code using memoization so that you do not have to
 *    scan the allocation table from scratch every time.
 */
unsigned int palloc()
{
  104ca0:	55                   	push   %ebp
  104ca1:	57                   	push   %edi
  104ca2:	56                   	push   %esi
  104ca3:	53                   	push   %ebx
  104ca4:	e8 14 b7 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104ca9:	81 c3 57 43 00 00    	add    $0x4357,%ebx
  104caf:	83 ec 0c             	sub    $0xc,%esp
    unsigned int palloc_free_index;
    bool first;

    // mem_lock();

    nps = get_nps();
  104cb2:	e8 79 fd ff ff       	call   104a30 <get_nps>
    palloc_index = last_palloc_index;
  104cb7:	8b b3 00 30 00 00    	mov    0x3000(%ebx),%esi
    nps = get_nps();
  104cbd:	89 c7                	mov    %eax,%edi
    palloc_free_index = nps;
    first = TRUE;

    while ((palloc_index != last_palloc_index || first) && palloc_free_index == nps) {
  104cbf:	eb 17                	jmp    104cd8 <palloc+0x38>
  104cc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104cc8:	3d 00 00 04 00       	cmp    $0x40000,%eax
  104ccd:	74 30                	je     104cff <palloc+0x5f>
  104ccf:	be 00 00 04 00       	mov    $0x40000,%esi
  104cd4:	39 fd                	cmp    %edi,%ebp
  104cd6:	75 60                	jne    104d38 <palloc+0x98>
        first = FALSE;
        if (at_is_norm(palloc_index) && !at_is_allocated(palloc_index)) {
  104cd8:	83 ec 0c             	sub    $0xc,%esp
  104cdb:	89 fd                	mov    %edi,%ebp
  104cdd:	56                   	push   %esi
  104cde:	e8 8d fd ff ff       	call   104a70 <at_is_norm>
  104ce3:	83 c4 10             	add    $0x10,%esp
  104ce6:	85 c0                	test   %eax,%eax
  104ce8:	75 36                	jne    104d20 <palloc+0x80>
            palloc_free_index = palloc_index;
        }
        palloc_index++;
  104cea:	83 c6 01             	add    $0x1,%esi
    while ((palloc_index != last_palloc_index || first) && palloc_free_index == nps) {
  104ced:	8b 83 00 30 00 00    	mov    0x3000(%ebx),%eax
        if (palloc_index >= VM_USERHI_PI) {
  104cf3:	81 fe ff ff 0e 00    	cmp    $0xeffff,%esi
  104cf9:	77 cd                	ja     104cc8 <palloc+0x28>
    while ((palloc_index != last_palloc_index || first) && palloc_free_index == nps) {
  104cfb:	39 c6                	cmp    %eax,%esi
  104cfd:	75 d5                	jne    104cd4 <palloc+0x34>
            palloc_index = VM_USERLO_PI;
        }
    }

    if (palloc_free_index == nps) {
  104cff:	39 fd                	cmp    %edi,%ebp
  104d01:	75 35                	jne    104d38 <palloc+0x98>
  104d03:	b8 00 00 04 00       	mov    $0x40000,%eax
        palloc_free_index = 0;
  104d08:	31 ed                	xor    %ebp,%ebp
        last_palloc_index = VM_USERLO_PI;
  104d0a:	89 83 00 30 00 00    	mov    %eax,0x3000(%ebx)
    }

    // mem_unlock();

    return palloc_free_index;
}
  104d10:	83 c4 0c             	add    $0xc,%esp
  104d13:	89 e8                	mov    %ebp,%eax
  104d15:	5b                   	pop    %ebx
  104d16:	5e                   	pop    %esi
  104d17:	5f                   	pop    %edi
  104d18:	5d                   	pop    %ebp
  104d19:	c3                   	ret    
  104d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if (at_is_norm(palloc_index) && !at_is_allocated(palloc_index)) {
  104d20:	83 ec 0c             	sub    $0xc,%esp
  104d23:	89 f5                	mov    %esi,%ebp
  104d25:	56                   	push   %esi
  104d26:	e8 95 fd ff ff       	call   104ac0 <at_is_allocated>
  104d2b:	83 c4 10             	add    $0x10,%esp
  104d2e:	85 c0                	test   %eax,%eax
  104d30:	0f 45 ef             	cmovne %edi,%ebp
  104d33:	eb b5                	jmp    104cea <palloc+0x4a>
  104d35:	8d 76 00             	lea    0x0(%esi),%esi
        at_set_allocated(palloc_free_index, 1);
  104d38:	83 ec 08             	sub    $0x8,%esp
  104d3b:	6a 01                	push   $0x1
  104d3d:	55                   	push   %ebp
  104d3e:	e8 9d fd ff ff       	call   104ae0 <at_set_allocated>
  104d43:	89 e8                	mov    %ebp,%eax
  104d45:	83 c4 10             	add    $0x10,%esp
        last_palloc_index = VM_USERLO_PI;
  104d48:	89 83 00 30 00 00    	mov    %eax,0x3000(%ebx)
}
  104d4e:	83 c4 0c             	add    $0xc,%esp
  104d51:	89 e8                	mov    %ebp,%eax
  104d53:	5b                   	pop    %ebx
  104d54:	5e                   	pop    %esi
  104d55:	5f                   	pop    %edi
  104d56:	5d                   	pop    %ebp
  104d57:	c3                   	ret    
  104d58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104d5f:	90                   	nop

00104d60 <pfree>:
 * in the allocation table.
 *
 * Hint: Simple.
 */
void pfree(unsigned int pfree_index)
{
  104d60:	53                   	push   %ebx
  104d61:	e8 57 b6 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104d66:	81 c3 9a 42 00 00    	add    $0x429a,%ebx
  104d6c:	83 ec 10             	sub    $0x10,%esp
    // mem_lock();
    at_set_allocated(pfree_index, 0);
  104d6f:	6a 00                	push   $0x0
  104d71:	ff 74 24 1c          	push   0x1c(%esp)
  104d75:	e8 66 fd ff ff       	call   104ae0 <at_set_allocated>
    // mem_unlock();
}
  104d7a:	83 c4 18             	add    $0x18,%esp
  104d7d:	5b                   	pop    %ebx
  104d7e:	c3                   	ret    
  104d7f:	90                   	nop

00104d80 <container_init>:
/**
 * Initializes the container data for the root process (the one with index 0).
 * The root process is the one that gets spawned first by the kernel.
 */
void container_init(unsigned int mbi_addr)
{
  104d80:	55                   	push   %ebp
  104d81:	57                   	push   %edi
  104d82:	56                   	push   %esi
  104d83:	53                   	push   %ebx
  104d84:	e8 34 b6 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104d89:	81 c3 77 42 00 00    	add    $0x4277,%ebx
  104d8f:	83 ec 18             	sub    $0x18,%esp
    unsigned int real_quota;
    int total_pages;
    // TODO: define your local variables here. 

    pmem_init(mbi_addr);
  104d92:	ff 74 24 2c          	push   0x2c(%esp)
  104d96:	e8 65 fd ff ff       	call   104b00 <pmem_init>
     * TODO: Compute the available quota and store it into the variable real_quota.
     * It should be the number of the unallocated pages with the normal permission
     * in the physical memory allocation table.
     */

    total_pages = get_nps();
  104d9b:	e8 90 fc ff ff       	call   104a30 <get_nps>
    for(int i=0; i< total_pages; i++){
  104da0:	83 c4 10             	add    $0x10,%esp
  104da3:	85 c0                	test   %eax,%eax
  104da5:	0f 8e 95 00 00 00    	jle    104e40 <container_init+0xc0>
  104dab:	89 c7                	mov    %eax,%edi
  104dad:	31 f6                	xor    %esi,%esi
    real_quota = 0;
  104daf:	31 ed                	xor    %ebp,%ebp
  104db1:	eb 0c                	jmp    104dbf <container_init+0x3f>
  104db3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104db7:	90                   	nop
    for(int i=0; i< total_pages; i++){
  104db8:	83 c6 01             	add    $0x1,%esi
  104dbb:	39 f7                	cmp    %esi,%edi
  104dbd:	74 29                	je     104de8 <container_init+0x68>
        if(at_is_norm(i) && !at_is_allocated(i)){
  104dbf:	83 ec 0c             	sub    $0xc,%esp
  104dc2:	56                   	push   %esi
  104dc3:	e8 a8 fc ff ff       	call   104a70 <at_is_norm>
  104dc8:	83 c4 10             	add    $0x10,%esp
  104dcb:	85 c0                	test   %eax,%eax
  104dcd:	74 e9                	je     104db8 <container_init+0x38>
  104dcf:	83 ec 0c             	sub    $0xc,%esp
  104dd2:	56                   	push   %esi
  104dd3:	e8 e8 fc ff ff       	call   104ac0 <at_is_allocated>
  104dd8:	83 c4 10             	add    $0x10,%esp
            real_quota += 1;
  104ddb:	83 f8 01             	cmp    $0x1,%eax
  104dde:	83 d5 00             	adc    $0x0,%ebp
    for(int i=0; i< total_pages; i++){
  104de1:	83 c6 01             	add    $0x1,%esi
  104de4:	39 f7                	cmp    %esi,%edi
  104de6:	75 d7                	jne    104dbf <container_init+0x3f>
    }


    KERN_DEBUG("\nreal quota: %d\n\n", real_quota);

    CONTAINER[0].quota = real_quota;
  104de8:	89 ee                	mov    %ebp,%esi
    KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  104dea:	8d 83 f1 d7 ff ff    	lea    -0x280f(%ebx),%eax
  104df0:	55                   	push   %ebp
  104df1:	50                   	push   %eax
  104df2:	8d 83 04 d8 ff ff    	lea    -0x27fc(%ebx),%eax
  104df8:	6a 2b                	push   $0x2b
  104dfa:	50                   	push   %eax
  104dfb:	e8 89 dc ff ff       	call   102a89 <debug_normal>
    CONTAINER[0].quota = real_quota;
  104e00:	89 b3 60 dc 84 00    	mov    %esi,0x84dc60(%ebx)
    CONTAINER[0].usage = 0;
  104e06:	c7 83 64 dc 84 00 00 	movl   $0x0,0x84dc64(%ebx)
  104e0d:	00 00 00 
    CONTAINER[0].parent = 0;
  104e10:	c7 83 68 dc 84 00 00 	movl   $0x0,0x84dc68(%ebx)
  104e17:	00 00 00 
    CONTAINER[0].nchildren = 0;
  104e1a:	c7 83 6c dc 84 00 00 	movl   $0x0,0x84dc6c(%ebx)
  104e21:	00 00 00 
    CONTAINER[0].used = 1;
  104e24:	c7 83 70 dc 84 00 01 	movl   $0x1,0x84dc70(%ebx)
  104e2b:	00 00 00 
}
  104e2e:	83 c4 1c             	add    $0x1c,%esp
  104e31:	5b                   	pop    %ebx
  104e32:	5e                   	pop    %esi
  104e33:	5f                   	pop    %edi
  104e34:	5d                   	pop    %ebp
  104e35:	c3                   	ret    
  104e36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104e3d:	8d 76 00             	lea    0x0(%esi),%esi
    for(int i=0; i< total_pages; i++){
  104e40:	31 f6                	xor    %esi,%esi
    real_quota = 0;
  104e42:	31 ed                	xor    %ebp,%ebp
  104e44:	eb a4                	jmp    104dea <container_init+0x6a>
  104e46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104e4d:	8d 76 00             	lea    0x0(%esi),%esi

00104e50 <container_get_parent>:

// Get the id of parent process of process # [id].
unsigned int container_get_parent(unsigned int id)
{
    
    return CONTAINER[id].parent;
  104e50:	e8 64 b5 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  104e55:	81 c2 ab 41 00 00    	add    $0x41ab,%edx
{
  104e5b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].parent;
  104e5f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  104e62:	8b 84 82 68 dc 84 00 	mov    0x84dc68(%edx,%eax,4),%eax
}
  104e69:	c3                   	ret    
  104e6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104e70 <container_get_nchildren>:

// Get the number of children of process # [id].
unsigned int container_get_nchildren(unsigned int id)
{
    return CONTAINER[id].nchildren;
  104e70:	e8 44 b5 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  104e75:	81 c2 8b 41 00 00    	add    $0x418b,%edx
{
  104e7b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].nchildren;
  104e7f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  104e82:	8b 84 82 6c dc 84 00 	mov    0x84dc6c(%edx,%eax,4),%eax
}
  104e89:	c3                   	ret    
  104e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104e90 <container_get_quota>:

// Get the maximum memory quota of process # [id].
unsigned int container_get_quota(unsigned int id)
{
    return CONTAINER[id].quota;
  104e90:	e8 24 b5 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  104e95:	81 c2 6b 41 00 00    	add    $0x416b,%edx
{
  104e9b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].quota;
  104e9f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  104ea2:	8b 84 82 60 dc 84 00 	mov    0x84dc60(%edx,%eax,4),%eax
}
  104ea9:	c3                   	ret    
  104eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104eb0 <container_get_usage>:

// Get the current memory usage of process # [id].
unsigned int container_get_usage(unsigned int id)
{
    return CONTAINER[id].usage;
  104eb0:	e8 04 b5 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  104eb5:	81 c2 4b 41 00 00    	add    $0x414b,%edx
{
  104ebb:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].usage;
  104ebf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  104ec2:	8b 84 82 64 dc 84 00 	mov    0x84dc64(%edx,%eax,4),%eax
}
  104ec9:	c3                   	ret    
  104eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104ed0 <container_can_consume>:

// Determines whether the process # [id] can consume an extra
// [n] pages of memory. If so, returns 1, otherwise, returns 0.
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
    if(container_get_quota(id) - container_get_usage(id) >= n){
  104ed0:	e8 e4 b4 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  104ed5:	81 c2 2b 41 00 00    	add    $0x412b,%edx
{
  104edb:	8b 44 24 04          	mov    0x4(%esp),%eax
    return CONTAINER[id].quota;
  104edf:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
    if(container_get_quota(id) - container_get_usage(id) >= n){
  104ee2:	8b 84 8a 60 dc 84 00 	mov    0x84dc60(%edx,%ecx,4),%eax
  104ee9:	2b 84 8a 64 dc 84 00 	sub    0x84dc64(%edx,%ecx,4),%eax
  104ef0:	3b 44 24 08          	cmp    0x8(%esp),%eax
  104ef4:	0f 93 c0             	setae  %al
  104ef7:	0f b6 c0             	movzbl %al,%eax
        return 1;
    }
    return 0;
}
  104efa:	c3                   	ret    
  104efb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104eff:	90                   	nop

00104f00 <container_split>:
 * You can assume it is safe to allocate [quota] pages
 * (the check is already done outside before calling this function).
 * Returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  104f00:	55                   	push   %ebp
  104f01:	e8 50 01 00 00       	call   105056 <__x86.get_pc_thunk.bp>
  104f06:	81 c5 fa 40 00 00    	add    $0x40fa,%ebp
  104f0c:	57                   	push   %edi
  104f0d:	56                   	push   %esi
  104f0e:	53                   	push   %ebx
  104f0f:	83 ec 04             	sub    $0x4,%esp
    unsigned int child, nc;

    nc = CONTAINER[id].nchildren;
  104f12:	8b 44 24 18          	mov    0x18(%esp),%eax
  104f16:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  104f19:	8d 44 40 01          	lea    0x1(%eax,%eax,2),%eax
    nc = CONTAINER[id].nchildren;
  104f1d:	c1 e1 02             	shl    $0x2,%ecx
  104f20:	8d b4 0d 60 dc 84 00 	lea    0x84dc60(%ebp,%ecx,1),%esi
  104f27:	8b 7e 0c             	mov    0xc(%esi),%edi
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  104f2a:	01 f8                	add    %edi,%eax

    if (NUM_IDS <= child) {
  104f2c:	83 f8 3f             	cmp    $0x3f,%eax
  104f2f:	77 4f                	ja     104f80 <container_split+0x80>
  104f31:	8d 1d 60 dc 84 00    	lea    0x84dc60,%ebx
    }

    /**
     * TODO: Update the container structure of both parent and child process appropriately.
     */
    CONTAINER[id].quota = CONTAINER[id].quota - quota;
  104f37:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    CONTAINER[id].usage = CONTAINER[id].usage + quota;
    CONTAINER[id].nchildren = CONTAINER[id].nchildren + 1;
  104f3b:	83 c7 01             	add    $0x1,%edi
    CONTAINER[id].usage = CONTAINER[id].usage + quota;
  104f3e:	01 56 04             	add    %edx,0x4(%esi)
    CONTAINER[id].quota = CONTAINER[id].quota - quota;
  104f41:	89 1c 24             	mov    %ebx,(%esp)
  104f44:	01 eb                	add    %ebp,%ebx
  104f46:	29 14 19             	sub    %edx,(%ecx,%ebx,1)
    CONTAINER[child].quota = quota;
  104f49:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
    CONTAINER[id].nchildren = CONTAINER[id].nchildren + 1;
  104f4c:	89 7e 0c             	mov    %edi,0xc(%esi)
    CONTAINER[child].quota = quota;
  104f4f:	c1 e1 02             	shl    $0x2,%ecx
    CONTAINER[child].parent = id;
  104f52:	8b 74 24 18          	mov    0x18(%esp),%esi
    CONTAINER[child].quota = quota;
  104f56:	01 cb                	add    %ecx,%ebx
    CONTAINER[child].parent = id;
  104f58:	01 e9                	add    %ebp,%ecx
  104f5a:	03 0c 24             	add    (%esp),%ecx
    CONTAINER[child].quota = quota;
  104f5d:	89 13                	mov    %edx,(%ebx)
    CONTAINER[child].parent = id;
  104f5f:	89 71 08             	mov    %esi,0x8(%ecx)
    CONTAINER[child].usage = 0;
  104f62:	c7 41 04 00 00 00 00 	movl   $0x0,0x4(%ecx)
    CONTAINER[child].nchildren = 0;
  104f69:	c7 41 0c 00 00 00 00 	movl   $0x0,0xc(%ecx)
    CONTAINER[child].used = 1;
  104f70:	c7 43 10 01 00 00 00 	movl   $0x1,0x10(%ebx)

    return child;
}
  104f77:	83 c4 04             	add    $0x4,%esp
  104f7a:	5b                   	pop    %ebx
  104f7b:	5e                   	pop    %esi
  104f7c:	5f                   	pop    %edi
  104f7d:	5d                   	pop    %ebp
  104f7e:	c3                   	ret    
  104f7f:	90                   	nop
  104f80:	83 c4 04             	add    $0x4,%esp
        return NUM_IDS;
  104f83:	b8 40 00 00 00       	mov    $0x40,%eax
}
  104f88:	5b                   	pop    %ebx
  104f89:	5e                   	pop    %esi
  104f8a:	5f                   	pop    %edi
  104f8b:	5d                   	pop    %ebp
  104f8c:	c3                   	ret    
  104f8d:	8d 76 00             	lea    0x0(%esi),%esi

00104f90 <container_alloc>:
 * Allocates one more page for process # [id], given that this will not exceed the quota.
 * The container structure should be updated accordingly after the allocation.
 * Returns the page index of the allocated page, or 0 in the case of failure.
 */
unsigned int container_alloc(unsigned int id)
{
  104f90:	56                   	push   %esi
  104f91:	53                   	push   %ebx
  104f92:	e8 26 b4 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104f97:	81 c3 69 40 00 00    	add    $0x4069,%ebx
  104f9d:	83 ec 04             	sub    $0x4,%esp
  104fa0:	8b 44 24 10          	mov    0x10(%esp),%eax
    /*
     * TODO: Implement the function here.
     */
    unsigned int allocated_page_index;

    if(CONTAINER[id].quota > CONTAINER[id].usage){
  104fa4:	8d 14 80             	lea    (%eax,%eax,4),%edx
  104fa7:	31 c0                	xor    %eax,%eax
  104fa9:	c1 e2 02             	shl    $0x2,%edx
  104fac:	8d b4 13 60 dc 84 00 	lea    0x84dc60(%ebx,%edx,1),%esi
  104fb3:	8b 4e 04             	mov    0x4(%esi),%ecx
  104fb6:	39 8c 13 60 dc 84 00 	cmp    %ecx,0x84dc60(%ebx,%edx,1)
  104fbd:	7f 09                	jg     104fc8 <container_alloc+0x38>
        CONTAINER[id].usage = CONTAINER[id].usage + 1;
        return allocated_page_index;
    }

    return 0;
}
  104fbf:	83 c4 04             	add    $0x4,%esp
  104fc2:	5b                   	pop    %ebx
  104fc3:	5e                   	pop    %esi
  104fc4:	c3                   	ret    
  104fc5:	8d 76 00             	lea    0x0(%esi),%esi
        allocated_page_index = palloc();
  104fc8:	e8 d3 fc ff ff       	call   104ca0 <palloc>
        CONTAINER[id].usage = CONTAINER[id].usage + 1;
  104fcd:	83 46 04 01          	addl   $0x1,0x4(%esi)
}
  104fd1:	83 c4 04             	add    $0x4,%esp
  104fd4:	5b                   	pop    %ebx
  104fd5:	5e                   	pop    %esi
  104fd6:	c3                   	ret    
  104fd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104fde:	66 90                	xchg   %ax,%ax

00104fe0 <container_free>:

// Frees the physical page and reduces the usage by 1.
void container_free(unsigned int id, unsigned int page_index)
{   
  104fe0:	55                   	push   %ebp
  104fe1:	57                   	push   %edi
  104fe2:	56                   	push   %esi
  104fe3:	53                   	push   %ebx
  104fe4:	e8 d4 b3 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  104fe9:	81 c3 17 40 00 00    	add    $0x4017,%ebx
  104fef:	83 ec 0c             	sub    $0xc,%esp
  104ff2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    // TODO
    unsigned int total_pages = get_nps();
  104ff6:	e8 35 fa ff ff       	call   104a30 <get_nps>
    for(int i=0; i< total_pages; i++){
  104ffb:	85 c0                	test   %eax,%eax
  104ffd:	74 43                	je     105042 <container_free+0x62>
  104fff:	89 c7                	mov    %eax,%edi
  105001:	31 f6                	xor    %esi,%esi
  105003:	eb 0a                	jmp    10500f <container_free+0x2f>
  105005:	8d 76 00             	lea    0x0(%esi),%esi
  105008:	83 c6 01             	add    $0x1,%esi
  10500b:	39 fe                	cmp    %edi,%esi
  10500d:	74 33                	je     105042 <container_free+0x62>
        if(at_is_norm(i)  && !at_is_allocated(i)){
  10500f:	83 ec 0c             	sub    $0xc,%esp
  105012:	56                   	push   %esi
  105013:	e8 58 fa ff ff       	call   104a70 <at_is_norm>
  105018:	83 c4 10             	add    $0x10,%esp
  10501b:	85 c0                	test   %eax,%eax
  10501d:	74 e9                	je     105008 <container_free+0x28>
  10501f:	83 ec 0c             	sub    $0xc,%esp
  105022:	56                   	push   %esi
  105023:	e8 98 fa ff ff       	call   104ac0 <at_is_allocated>
  105028:	83 c4 10             	add    $0x10,%esp
  10502b:	85 c0                	test   %eax,%eax
  10502d:	75 d9                	jne    105008 <container_free+0x28>
            pfree(i);
  10502f:	83 ec 0c             	sub    $0xc,%esp
  105032:	56                   	push   %esi
    for(int i=0; i< total_pages; i++){
  105033:	83 c6 01             	add    $0x1,%esi
            pfree(i);
  105036:	e8 25 fd ff ff       	call   104d60 <pfree>
  10503b:	83 c4 10             	add    $0x10,%esp
    for(int i=0; i< total_pages; i++){
  10503e:	39 fe                	cmp    %edi,%esi
  105040:	75 cd                	jne    10500f <container_free+0x2f>
        }
    }

    CONTAINER[id].usage = CONTAINER[id].usage - 1;
  105042:	8d 44 ad 00          	lea    0x0(%ebp,%ebp,4),%eax
  105046:	83 ac 83 64 dc 84 00 	subl   $0x1,0x84dc64(%ebx,%eax,4)
  10504d:	01 
}
  10504e:	83 c4 0c             	add    $0xc,%esp
  105051:	5b                   	pop    %ebx
  105052:	5e                   	pop    %esi
  105053:	5f                   	pop    %edi
  105054:	5d                   	pop    %ebp
  105055:	c3                   	ret    

00105056 <__x86.get_pc_thunk.bp>:
  105056:	8b 2c 24             	mov    (%esp),%ebp
  105059:	c3                   	ret    
  10505a:	66 90                	xchg   %ax,%ax
  10505c:	66 90                	xchg   %ax,%ax
  10505e:	66 90                	xchg   %ax,%ax

00105060 <set_pdir_base>:
 */
unsigned int IDPTbl[1024][1024] gcc_aligned(PAGESIZE);

// Sets the CR3 register with the start address of the page structure for process # [index].
void set_pdir_base(unsigned int index)
{
  105060:	53                   	push   %ebx
  105061:	e8 57 b3 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105066:	81 c3 9a 3f 00 00    	add    $0x3f9a,%ebx
  10506c:	83 ec 14             	sub    $0x14,%esp
    // TODO
    set_cr3(PDirPool[index]);
  10506f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105073:	c1 e0 0c             	shl    $0xc,%eax
  105076:	8d 84 03 00 f0 c4 00 	lea    0xc4f000(%ebx,%eax,1),%eax
  10507d:	50                   	push   %eax
  10507e:	e8 23 c1 ff ff       	call   1011a6 <set_cr3>
}
  105083:	83 c4 18             	add    $0x18,%esp
  105086:	5b                   	pop    %ebx
  105087:	c3                   	ret    
  105088:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10508f:	90                   	nop

00105090 <get_pdir_entry>:
// Returns the page directory entry # [pde_index] of the process # [proc_index].
// This can be used to test whether the page directory entry is mapped.
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    return (unsigned int) PDirPool[proc_index][pde_index];
  105090:	e8 24 b3 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  105095:	81 c2 6b 3f 00 00    	add    $0x3f6b,%edx
  10509b:	8b 44 24 04          	mov    0x4(%esp),%eax
  10509f:	c1 e0 0a             	shl    $0xa,%eax
  1050a2:	03 44 24 08          	add    0x8(%esp),%eax
  1050a6:	8b 84 82 00 f0 c4 00 	mov    0xc4f000(%edx,%eax,4),%eax
    // return 0;
}
  1050ad:	c3                   	ret    
  1050ae:	66 90                	xchg   %ax,%ax

001050b0 <set_pdir_entry>:
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int page_index)
{

    unsigned int addr = page_index << 12; 
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1050b0:	e8 59 01 00 00       	call   10520e <__x86.get_pc_thunk.cx>
  1050b5:	81 c1 4b 3f 00 00    	add    $0x3f4b,%ecx
    unsigned int addr = page_index << 12; 
  1050bb:	8b 54 24 0c          	mov    0xc(%esp),%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1050bf:	8b 44 24 04          	mov    0x4(%esp),%eax
    unsigned int addr = page_index << 12; 
  1050c3:	c1 e2 0c             	shl    $0xc,%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1050c6:	c1 e0 0a             	shl    $0xa,%eax
  1050c9:	03 44 24 08          	add    0x8(%esp),%eax
  1050cd:	83 ca 07             	or     $0x7,%edx
  1050d0:	89 94 81 00 f0 c4 00 	mov    %edx,0xc4f000(%ecx,%eax,4)
    // TODO
}
  1050d7:	c3                   	ret    
  1050d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1050df:	90                   	nop

001050e0 <set_pdir_entry_identity>:
// You should also set the permissions PTE_P, PTE_W, and PTE_U.
// This will be used to map a page directory entry to an identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    unsigned int addr = IDPTbl[pde_index];
  1050e0:	e8 29 01 00 00       	call   10520e <__x86.get_pc_thunk.cx>
  1050e5:	81 c1 1b 3f 00 00    	add    $0x3f1b,%ecx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1050eb:	8b 44 24 04          	mov    0x4(%esp),%eax
{
  1050ef:	8b 54 24 08          	mov    0x8(%esp),%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  1050f3:	c1 e0 0a             	shl    $0xa,%eax
  1050f6:	01 d0                	add    %edx,%eax
    unsigned int addr = IDPTbl[pde_index];
  1050f8:	c1 e2 0c             	shl    $0xc,%edx
  1050fb:	8d 94 11 00 f0 84 00 	lea    0x84f000(%ecx,%edx,1),%edx
    PDirPool[proc_index][pde_index] = (unsigned int *) (addr | PT_PERM_PTU);
  105102:	83 ca 07             	or     $0x7,%edx
  105105:	89 94 81 00 f0 c4 00 	mov    %edx,0xc4f000(%ecx,%eax,4)

}
  10510c:	c3                   	ret    
  10510d:	8d 76 00             	lea    0x0(%esi),%esi

00105110 <rmv_pdir_entry>:
// Don't forget to cast the value to (unsigned int *).
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO
    unsigned int zero = 0;
    PDirPool[proc_index][pde_index] = (unsigned int *) (zero);
  105110:	e8 a4 b2 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  105115:	81 c2 eb 3e 00 00    	add    $0x3eeb,%edx
  10511b:	8b 44 24 04          	mov    0x4(%esp),%eax
  10511f:	c1 e0 0a             	shl    $0xa,%eax
  105122:	03 44 24 08          	add    0x8(%esp),%eax
  105126:	c7 84 82 00 f0 c4 00 	movl   $0x0,0xc4f000(%edx,%eax,4)
  10512d:	00 00 00 00 
}
  105131:	c3                   	ret    
  105132:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105140 <get_ptbl_entry>:
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                            unsigned int pte_index)
{
    // TODO
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
    return pt[pte_index];
  105140:	e8 74 b2 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  105145:	81 c2 bb 3e 00 00    	add    $0x3ebb,%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  10514b:	8b 44 24 04          	mov    0x4(%esp),%eax
  10514f:	c1 e0 0a             	shl    $0xa,%eax
  105152:	03 44 24 08          	add    0x8(%esp),%eax
  105156:	8b 84 82 00 f0 c4 00 	mov    0xc4f000(%edx,%eax,4),%eax
    return pt[pte_index];
  10515d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  105161:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    return pt[pte_index];
  105166:	8b 04 90             	mov    (%eax,%edx,4),%eax
}
  105169:	c3                   	ret    
  10516a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105170 <set_ptbl_entry>:
                    unsigned int pte_index, unsigned int page_index,
                    unsigned int perm)
{
    // TODO
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
    pt[pte_index] = (page_index << 12) | perm;
  105170:	e8 44 b2 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  105175:	81 c2 8b 3e 00 00    	add    $0x3e8b,%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  10517b:	8b 44 24 04          	mov    0x4(%esp),%eax
    pt[pte_index] = (page_index << 12) | perm;
  10517f:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  105183:	c1 e0 0a             	shl    $0xa,%eax
  105186:	03 44 24 08          	add    0x8(%esp),%eax
  10518a:	8b 94 82 00 f0 c4 00 	mov    0xc4f000(%edx,%eax,4),%edx
    pt[pte_index] = (page_index << 12) | perm;
  105191:	8b 44 24 10          	mov    0x10(%esp),%eax
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  105195:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    pt[pte_index] = (page_index << 12) | perm;
  10519b:	c1 e0 0c             	shl    $0xc,%eax
  10519e:	0b 44 24 14          	or     0x14(%esp),%eax
  1051a2:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
}
  1051a5:	c3                   	ret    
  1051a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1051ad:	8d 76 00             	lea    0x0(%esi),%esi

001051b0 <set_ptbl_entry_identity>:

// Sets up the specified page table entry in IDPTbl as the identity map.
// You should also set the given permission.
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index,
                             unsigned int perm)
{
  1051b0:	53                   	push   %ebx
  1051b1:	8b 54 24 08          	mov    0x8(%esp),%edx
  1051b5:	e8 03 b2 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1051ba:	81 c3 46 3e 00 00    	add    $0x3e46,%ebx
  1051c0:	8b 44 24 0c          	mov    0xc(%esp),%eax
    unsigned int addr = (pde_index << 22) | (pte_index << 12);
    IDPTbl[pde_index][pte_index] = addr | perm;
  1051c4:	89 d1                	mov    %edx,%ecx
    unsigned int addr = (pde_index << 22) | (pte_index << 12);
  1051c6:	c1 e2 16             	shl    $0x16,%edx
    IDPTbl[pde_index][pte_index] = addr | perm;
  1051c9:	c1 e1 0a             	shl    $0xa,%ecx
  1051cc:	01 c1                	add    %eax,%ecx
    unsigned int addr = (pde_index << 22) | (pte_index << 12);
  1051ce:	c1 e0 0c             	shl    $0xc,%eax
    IDPTbl[pde_index][pte_index] = addr | perm;
  1051d1:	0b 44 24 10          	or     0x10(%esp),%eax
  1051d5:	09 d0                	or     %edx,%eax
  1051d7:	89 84 8b 00 f0 84 00 	mov    %eax,0x84f000(%ebx,%ecx,4)
}
  1051de:	5b                   	pop    %ebx
  1051df:	c3                   	ret    

001051e0 <rmv_ptbl_entry>:
// Sets the specified page table entry to 0.
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int pte_index)
{
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
    pt[pte_index] = (unsigned int *) 0;
  1051e0:	e8 d4 b1 ff ff       	call   1003b9 <__x86.get_pc_thunk.dx>
  1051e5:	81 c2 1b 3e 00 00    	add    $0x3e1b,%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  1051eb:	8b 44 24 04          	mov    0x4(%esp),%eax
  1051ef:	c1 e0 0a             	shl    $0xa,%eax
  1051f2:	03 44 24 08          	add    0x8(%esp),%eax
  1051f6:	8b 84 82 00 f0 c4 00 	mov    0xc4f000(%edx,%eax,4),%eax
    pt[pte_index] = (unsigned int *) 0;
  1051fd:	8b 54 24 0c          	mov    0xc(%esp),%edx
    unsigned int *pt = (unsigned int *) ADDR_MASK(PDirPool[proc_index][pde_index]);
  105201:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    pt[pte_index] = (unsigned int *) 0;
  105206:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
}
  10520d:	c3                   	ret    

0010520e <__x86.get_pc_thunk.cx>:
  10520e:	8b 0c 24             	mov    (%esp),%ecx
  105211:	c3                   	ret    
  105212:	66 90                	xchg   %ax,%ax
  105214:	66 90                	xchg   %ax,%ax
  105216:	66 90                	xchg   %ax,%ax
  105218:	66 90                	xchg   %ax,%ax
  10521a:	66 90                	xchg   %ax,%ax
  10521c:	66 90                	xchg   %ax,%ax
  10521e:	66 90                	xchg   %ax,%ax

00105220 <get_ptbl_entry_by_va>:
 * Returns the page table entry corresponding to the virtual address,
 * according to the page structure of process # [proc_index].
 * Returns 0 if the mapping does not exist.
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  105220:	55                   	push   %ebp
  105221:	57                   	push   %edi
  105222:	56                   	push   %esi
  105223:	53                   	push   %ebx
  105224:	e8 94 b1 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105229:	81 c3 d7 3d 00 00    	add    $0x3dd7,%ebx
  10522f:	83 ec 14             	sub    $0x14,%esp
  105232:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  105236:	8b 7c 24 28          	mov    0x28(%esp),%edi
    // TODO
    unsigned int directory_entry_index = GET_DIR_FROM_VA(vaddr);
  10523a:	89 f5                	mov    %esi,%ebp
  10523c:	c1 ed 16             	shr    $0x16,%ebp
    unsigned int page_table_entry_index = GET_PT_FROM_VA(vaddr);

    if(get_pdir_entry(proc_index, directory_entry_index) !=0 && PTE_P != 0){
  10523f:	55                   	push   %ebp
  105240:	57                   	push   %edi
  105241:	e8 4a fe ff ff       	call   105090 <get_pdir_entry>
  105246:	83 c4 10             	add    $0x10,%esp
  105249:	85 c0                	test   %eax,%eax
  10524b:	74 14                	je     105261 <get_ptbl_entry_by_va+0x41>
    unsigned int page_table_entry_index = GET_PT_FROM_VA(vaddr);
  10524d:	c1 ee 0c             	shr    $0xc,%esi
        unsigned int page_table_entry = get_ptbl_entry(proc_index, directory_entry_index, page_table_entry_index);
  105250:	83 ec 04             	sub    $0x4,%esp
    unsigned int page_table_entry_index = GET_PT_FROM_VA(vaddr);
  105253:	83 e6 3f             	and    $0x3f,%esi
        unsigned int page_table_entry = get_ptbl_entry(proc_index, directory_entry_index, page_table_entry_index);
  105256:	56                   	push   %esi
  105257:	55                   	push   %ebp
  105258:	57                   	push   %edi
  105259:	e8 e2 fe ff ff       	call   105140 <get_ptbl_entry>
        if(page_table_entry != 0 && PTE_P != 0){
  10525e:	83 c4 10             	add    $0x10,%esp
        } 
    }
    else{
        return 0;
    }
}
  105261:	83 c4 0c             	add    $0xc,%esp
  105264:	5b                   	pop    %ebx
  105265:	5e                   	pop    %esi
  105266:	5f                   	pop    %edi
  105267:	5d                   	pop    %ebp
  105268:	c3                   	ret    
  105269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105270 <get_pdir_entry_by_va>:

// Returns the page directory entry corresponding to the given virtual address.
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  105270:	53                   	push   %ebx
  105271:	e8 47 b1 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105276:	81 c3 8a 3d 00 00    	add    $0x3d8a,%ebx
  10527c:	83 ec 10             	sub    $0x10,%esp
    // TODO
    unsigned int directory_entry_index = GET_DIR_FROM_VA(vaddr);
  10527f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105283:	c1 e8 16             	shr    $0x16,%eax

    return get_pdir_entry(proc_index, directory_entry_index); 
  105286:	50                   	push   %eax
  105287:	ff 74 24 1c          	push   0x1c(%esp)
  10528b:	e8 00 fe ff ff       	call   105090 <get_pdir_entry>

}
  105290:	83 c4 18             	add    $0x18,%esp
  105293:	5b                   	pop    %ebx
  105294:	c3                   	ret    
  105295:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10529c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001052a0 <rmv_ptbl_entry_by_va>:

// Removes the page table entry for the given virtual address.
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1052a0:	53                   	push   %ebx
  1052a1:	e8 17 b1 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1052a6:	81 c3 5a 3d 00 00    	add    $0x3d5a,%ebx
  1052ac:	83 ec 0c             	sub    $0xc,%esp
  1052af:	8b 44 24 18          	mov    0x18(%esp),%eax
    // TODO
    rmv_ptbl_entry(proc_index, GET_DIR_FROM_VA(vaddr), GET_PT_FROM_VA(vaddr));
  1052b3:	89 c2                	mov    %eax,%edx
  1052b5:	c1 e8 16             	shr    $0x16,%eax
  1052b8:	c1 ea 0c             	shr    $0xc,%edx
  1052bb:	83 e2 3f             	and    $0x3f,%edx
  1052be:	52                   	push   %edx
  1052bf:	50                   	push   %eax
  1052c0:	ff 74 24 1c          	push   0x1c(%esp)
  1052c4:	e8 17 ff ff ff       	call   1051e0 <rmv_ptbl_entry>

}
  1052c9:	83 c4 18             	add    $0x18,%esp
  1052cc:	5b                   	pop    %ebx
  1052cd:	c3                   	ret    
  1052ce:	66 90                	xchg   %ax,%ax

001052d0 <rmv_pdir_entry_by_va>:

// Removes the page directory entry for the given virtual address.
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1052d0:	53                   	push   %ebx
  1052d1:	e8 e7 b0 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1052d6:	81 c3 2a 3d 00 00    	add    $0x3d2a,%ebx
  1052dc:	83 ec 10             	sub    $0x10,%esp
    // TODO
    rmv_pdir_entry(proc_index, GET_DIR_FROM_VA(vaddr));
  1052df:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1052e3:	c1 e8 16             	shr    $0x16,%eax
  1052e6:	50                   	push   %eax
  1052e7:	ff 74 24 1c          	push   0x1c(%esp)
  1052eb:	e8 20 fe ff ff       	call   105110 <rmv_pdir_entry>
}
  1052f0:	83 c4 18             	add    $0x18,%esp
  1052f3:	5b                   	pop    %ebx
  1052f4:	c3                   	ret    
  1052f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1052fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105300 <set_ptbl_entry_by_va>:

// Maps the virtual address [vaddr] to the physical page # [page_index] with permission [perm].
// You do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index, unsigned int perm)
{
  105300:	53                   	push   %ebx
  105301:	e8 b7 b0 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105306:	81 c3 fa 3c 00 00    	add    $0x3cfa,%ebx
  10530c:	83 ec 14             	sub    $0x14,%esp
  10530f:	8b 44 24 20          	mov    0x20(%esp),%eax
    // TODO
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);
    unsigned int pte_index = GET_PT_FROM_VA(vaddr);

    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  105313:	ff 74 24 28          	push   0x28(%esp)
  105317:	ff 74 24 28          	push   0x28(%esp)
    unsigned int pte_index = GET_PT_FROM_VA(vaddr);
  10531b:	89 c2                	mov    %eax,%edx
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);
  10531d:	c1 e8 16             	shr    $0x16,%eax
    unsigned int pte_index = GET_PT_FROM_VA(vaddr);
  105320:	c1 ea 0c             	shr    $0xc,%edx
  105323:	83 e2 3f             	and    $0x3f,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  105326:	52                   	push   %edx
  105327:	50                   	push   %eax
  105328:	ff 74 24 2c          	push   0x2c(%esp)
  10532c:	e8 3f fe ff ff       	call   105170 <set_ptbl_entry>

}
  105331:	83 c4 28             	add    $0x28,%esp
  105334:	5b                   	pop    %ebx
  105335:	c3                   	ret    
  105336:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10533d:	8d 76 00             	lea    0x0(%esi),%esi

00105340 <set_pdir_entry_by_va>:

// Registers the mapping from [vaddr] to physical page # [page_index] in the page directory.
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index)
{
  105340:	53                   	push   %ebx
  105341:	e8 77 b0 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105346:	81 c3 ba 3c 00 00    	add    $0x3cba,%ebx
  10534c:	83 ec 0c             	sub    $0xc,%esp
    // TODO
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);

    set_pdir_entry(proc_index, pde_index, page_index);
  10534f:	ff 74 24 1c          	push   0x1c(%esp)
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);
  105353:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105357:	c1 e8 16             	shr    $0x16,%eax
    set_pdir_entry(proc_index, pde_index, page_index);
  10535a:	50                   	push   %eax
  10535b:	ff 74 24 1c          	push   0x1c(%esp)
  10535f:	e8 4c fd ff ff       	call   1050b0 <set_pdir_entry>
}
  105364:	83 c4 18             	add    $0x18,%esp
  105367:	5b                   	pop    %ebx
  105368:	c3                   	ret    
  105369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105370 <idptbl_init>:

// Initializes the identity page table.
// The permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// While the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_addr)
{
  105370:	55                   	push   %ebp
    unsigned int pde_index, pte_index, perm;

    container_init(mbi_addr);

    // Set up IDPTbl
    for (pde_index = 0; pde_index < 1024; pde_index++) {
  105371:	31 ed                	xor    %ebp,%ebp
{
  105373:	57                   	push   %edi
  105374:	56                   	push   %esi
  105375:	53                   	push   %ebx
  105376:	e8 42 b0 ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  10537b:	81 c3 85 3c 00 00    	add    $0x3c85,%ebx
  105381:	83 ec 18             	sub    $0x18,%esp
    container_init(mbi_addr);
  105384:	ff 74 24 2c          	push   0x2c(%esp)
  105388:	e8 f3 f9 ff ff       	call   104d80 <container_init>
  10538d:	83 c4 10             	add    $0x10,%esp
        if ((pde_index < VM_USERLO_PDE) || (VM_USERHI_PDE <= pde_index)) {
  105390:	8d 85 00 ff ff ff    	lea    -0x100(%ebp),%eax
            // kernel mapping
            perm = PTE_P | PTE_W | PTE_G;
        } else {
            // normal memory
            perm = PTE_P | PTE_W;
  105396:	3d c0 02 00 00       	cmp    $0x2c0,%eax
  10539b:	19 ff                	sbb    %edi,%edi
        }

        for (pte_index = 0; pte_index < 1024; pte_index++) {
  10539d:	31 f6                	xor    %esi,%esi
            perm = PTE_P | PTE_W;
  10539f:	81 e7 00 ff ff ff    	and    $0xffffff00,%edi
  1053a5:	81 c7 03 01 00 00    	add    $0x103,%edi
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  1053ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1053af:	90                   	nop
            set_ptbl_entry_identity(pde_index, pte_index, perm);
  1053b0:	83 ec 04             	sub    $0x4,%esp
  1053b3:	57                   	push   %edi
  1053b4:	56                   	push   %esi
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  1053b5:	83 c6 01             	add    $0x1,%esi
            set_ptbl_entry_identity(pde_index, pte_index, perm);
  1053b8:	55                   	push   %ebp
  1053b9:	e8 f2 fd ff ff       	call   1051b0 <set_ptbl_entry_identity>
        for (pte_index = 0; pte_index < 1024; pte_index++) {
  1053be:	83 c4 10             	add    $0x10,%esp
  1053c1:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  1053c7:	75 e7                	jne    1053b0 <idptbl_init+0x40>
    for (pde_index = 0; pde_index < 1024; pde_index++) {
  1053c9:	83 c5 01             	add    $0x1,%ebp
  1053cc:	81 fd 00 04 00 00    	cmp    $0x400,%ebp
  1053d2:	75 bc                	jne    105390 <idptbl_init+0x20>
        }
    }

}
  1053d4:	83 c4 0c             	add    $0xc,%esp
  1053d7:	5b                   	pop    %ebx
  1053d8:	5e                   	pop    %esi
  1053d9:	5f                   	pop    %edi
  1053da:	5d                   	pop    %ebp
  1053db:	c3                   	ret    
  1053dc:	66 90                	xchg   %ax,%ax
  1053de:	66 90                	xchg   %ax,%ax

001053e0 <pdir_init>:
 * For each process from id 0 to NUM_IDS - 1,
 * set up the page directory entries so that the kernel portion of the map is
 * the identity map, and the rest of the page directories are unmapped.
 */
void pdir_init(unsigned int mbi_addr)
{
  1053e0:	57                   	push   %edi
    // TODO: Define your local variables here.

    idptbl_init(mbi_addr);

    // TODO
    for(int proc_id = 0; proc_id < NUM_IDS - 1; proc_id ++ ){
  1053e1:	31 ff                	xor    %edi,%edi
{
  1053e3:	56                   	push   %esi
  1053e4:	53                   	push   %ebx
  1053e5:	e8 d3 af ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1053ea:	81 c3 16 3c 00 00    	add    $0x3c16,%ebx
    idptbl_init(mbi_addr);
  1053f0:	83 ec 0c             	sub    $0xc,%esp
  1053f3:	ff 74 24 1c          	push   0x1c(%esp)
  1053f7:	e8 74 ff ff ff       	call   105370 <idptbl_init>
  1053fc:	83 c4 10             	add    $0x10,%esp
        for(int pde_index = 0; pde_index < 1024; pde_index++){
  1053ff:	31 f6                	xor    %esi,%esi
  105401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            set_pdir_entry_identity(proc_id, pde_index);
  105408:	83 ec 08             	sub    $0x8,%esp
  10540b:	56                   	push   %esi
        for(int pde_index = 0; pde_index < 1024; pde_index++){
  10540c:	83 c6 01             	add    $0x1,%esi
            set_pdir_entry_identity(proc_id, pde_index);
  10540f:	57                   	push   %edi
  105410:	e8 cb fc ff ff       	call   1050e0 <set_pdir_entry_identity>
        for(int pde_index = 0; pde_index < 1024; pde_index++){
  105415:	83 c4 10             	add    $0x10,%esp
  105418:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  10541e:	75 e8                	jne    105408 <pdir_init+0x28>
    for(int proc_id = 0; proc_id < NUM_IDS - 1; proc_id ++ ){
  105420:	83 c7 01             	add    $0x1,%edi
  105423:	83 ff 3f             	cmp    $0x3f,%edi
  105426:	75 d7                	jne    1053ff <pdir_init+0x1f>
        }
    }
}
  105428:	5b                   	pop    %ebx
  105429:	5e                   	pop    %esi
  10542a:	5f                   	pop    %edi
  10542b:	c3                   	ret    
  10542c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105430 <alloc_ptbl>:
 * and clears (set to 0) all page table entries for this newly mapped page table.
 * It returns the page index of the newly allocated physical page.
 * In the case when there's no physical page available, it returns 0.
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  105430:	56                   	push   %esi
  105431:	53                   	push   %ebx
  105432:	e8 86 af ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105437:	81 c3 c9 3b 00 00    	add    $0x3bc9,%ebx
  10543d:	83 ec 20             	sub    $0x20,%esp
  105440:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    // TODO
    unsigned int allocated_page_index = container_alloc(proc_index);
  105444:	56                   	push   %esi
  105445:	e8 46 fb ff ff       	call   104f90 <container_alloc>
    unsigned int pde_index = GET_DIR_FROM_VA(vaddr);
    unsigned int pte_index = GET_PT_FROM_VA(vaddr);

    if(allocated_page_index != 0){
  10544a:	83 c4 10             	add    $0x10,%esp
  10544d:	85 c0                	test   %eax,%eax
  10544f:	75 0f                	jne    105460 <alloc_ptbl+0x30>
        set_pdir_entry_by_va(proc_index, vaddr, allocated_page_index);
        return allocated_page_index;
    }

    return 0;
}
  105451:	83 c4 14             	add    $0x14,%esp
  105454:	5b                   	pop    %ebx
  105455:	5e                   	pop    %esi
  105456:	c3                   	ret    
  105457:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10545e:	66 90                	xchg   %ax,%ax
        set_pdir_entry_by_va(proc_index, vaddr, allocated_page_index);
  105460:	83 ec 04             	sub    $0x4,%esp
  105463:	50                   	push   %eax
  105464:	89 44 24 14          	mov    %eax,0x14(%esp)
  105468:	ff 74 24 2c          	push   0x2c(%esp)
  10546c:	56                   	push   %esi
  10546d:	e8 ce fe ff ff       	call   105340 <set_pdir_entry_by_va>
        return allocated_page_index;
  105472:	83 c4 10             	add    $0x10,%esp
  105475:	8b 44 24 0c          	mov    0xc(%esp),%eax
}
  105479:	83 c4 14             	add    $0x14,%esp
  10547c:	5b                   	pop    %ebx
  10547d:	5e                   	pop    %esi
  10547e:	c3                   	ret    
  10547f:	90                   	nop

00105480 <free_ptbl>:

// Reverse operation of alloc_ptbl.
// Removes corresponding the page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vaddr)
{
  105480:	55                   	push   %ebp
  105481:	57                   	push   %edi
  105482:	56                   	push   %esi
  105483:	53                   	push   %ebx
  105484:	e8 34 af ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105489:	81 c3 77 3b 00 00    	add    $0x3b77,%ebx
  10548f:	83 ec 14             	sub    $0x14,%esp
  105492:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  105496:	8b 6c 24 28          	mov    0x28(%esp),%ebp
    // TODO
    unsigned int pd_entry = get_pdir_entry_by_va(proc_index, vaddr);
  10549a:	57                   	push   %edi
    unsigned int pd_index = GET_DIR_FROM_VA(vaddr);
    unsigned int pt_index = GET_PT_FROM_VA(vaddr);
  10549b:	89 fe                	mov    %edi,%esi
    unsigned int pd_entry = get_pdir_entry_by_va(proc_index, vaddr);
  10549d:	55                   	push   %ebp
    unsigned int pt_index = GET_PT_FROM_VA(vaddr);
  10549e:	c1 ee 0c             	shr    $0xc,%esi
  1054a1:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
    unsigned int pd_entry = get_pdir_entry_by_va(proc_index, vaddr);
  1054a7:	e8 c4 fd ff ff       	call   105270 <get_pdir_entry_by_va>
    unsigned int pd_index = GET_DIR_FROM_VA(vaddr);
  1054ac:	89 f8                	mov    %edi,%eax
  1054ae:	c1 e8 16             	shr    $0x16,%eax
    
    unsigned int page_index = pd_index | pt_index;
  1054b1:	09 c6                	or     %eax,%esi
    rmv_pdir_entry_by_va(proc_index, vaddr);
  1054b3:	58                   	pop    %eax
  1054b4:	5a                   	pop    %edx
  1054b5:	57                   	push   %edi
  1054b6:	55                   	push   %ebp
  1054b7:	e8 14 fe ff ff       	call   1052d0 <rmv_pdir_entry_by_va>
    container_free(proc_index, page_index);
  1054bc:	59                   	pop    %ecx
  1054bd:	5f                   	pop    %edi
  1054be:	56                   	push   %esi
  1054bf:	55                   	push   %ebp
  1054c0:	e8 1b fb ff ff       	call   104fe0 <container_free>
}
  1054c5:	83 c4 1c             	add    $0x1c,%esp
  1054c8:	5b                   	pop    %ebx
  1054c9:	5e                   	pop    %esi
  1054ca:	5f                   	pop    %edi
  1054cb:	5d                   	pop    %ebp
  1054cc:	c3                   	ret    
  1054cd:	66 90                	xchg   %ax,%ax
  1054cf:	90                   	nop

001054d0 <pdir_init_kern>:
/**
 * Sets the entire page map for process 0 as the identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_addr)
{
  1054d0:	56                   	push   %esi
    // TODO: Define your local variables here.

    pdir_init(mbi_addr);

    //TODO
    for(unsigned int pde_index = 0; pde_index < 1024; pde_index ++){
  1054d1:	31 f6                	xor    %esi,%esi
{
  1054d3:	53                   	push   %ebx
  1054d4:	e8 e4 ae ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1054d9:	81 c3 27 3b 00 00    	add    $0x3b27,%ebx
  1054df:	83 ec 10             	sub    $0x10,%esp
    pdir_init(mbi_addr);
  1054e2:	ff 74 24 1c          	push   0x1c(%esp)
  1054e6:	e8 f5 fe ff ff       	call   1053e0 <pdir_init>
  1054eb:	83 c4 10             	add    $0x10,%esp
  1054ee:	66 90                	xchg   %ax,%ax
        set_pdir_entry_identity(0, pde_index);
  1054f0:	83 ec 08             	sub    $0x8,%esp
  1054f3:	56                   	push   %esi
    for(unsigned int pde_index = 0; pde_index < 1024; pde_index ++){
  1054f4:	83 c6 01             	add    $0x1,%esi
        set_pdir_entry_identity(0, pde_index);
  1054f7:	6a 00                	push   $0x0
  1054f9:	e8 e2 fb ff ff       	call   1050e0 <set_pdir_entry_identity>
    for(unsigned int pde_index = 0; pde_index < 1024; pde_index ++){
  1054fe:	83 c4 10             	add    $0x10,%esp
  105501:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  105507:	75 e7                	jne    1054f0 <pdir_init_kern+0x20>
    }

}   
  105509:	83 c4 04             	add    $0x4,%esp
  10550c:	5b                   	pop    %ebx
  10550d:	5e                   	pop    %esi
  10550e:	c3                   	ret    
  10550f:	90                   	nop

00105510 <map_page>:
 * otherwise, it returns the physical page index registered in the page directory,
 * (the return value of get_pdir_entry_by_va or alloc_ptbl).
 */
unsigned int map_page(unsigned int proc_index, unsigned int vaddr,
                      unsigned int page_index, unsigned int perm)
{
  105510:	55                   	push   %ebp
  105511:	57                   	push   %edi
  105512:	56                   	push   %esi
  105513:	53                   	push   %ebx
  105514:	e8 a4 ae ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105519:	81 c3 e7 3a 00 00    	add    $0x3ae7,%ebx
  10551f:	83 ec 14             	sub    $0x14,%esp
  105522:	8b 7c 24 28          	mov    0x28(%esp),%edi
  105526:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
    // TODO
    unsigned int pde_entry = get_pdir_entry_by_va(proc_index, vaddr);
  10552a:	55                   	push   %ebp
  10552b:	57                   	push   %edi
  10552c:	e8 3f fd ff ff       	call   105270 <get_pdir_entry_by_va>
    unsigned int pde_page_index = pde_entry >> 12;

    if (pde_entry == 0) {
  105531:	83 c4 10             	add    $0x10,%esp
  105534:	85 c0                	test   %eax,%eax
  105536:	74 28                	je     105560 <map_page+0x50>
    unsigned int pde_page_index = pde_entry >> 12;
  105538:	c1 e8 0c             	shr    $0xc,%eax
  10553b:	89 c6                	mov    %eax,%esi
        if (pde_page_index == 0) {
            return MagicNumber;
        }
    }

    set_ptbl_entry_by_va(proc_index, vaddr, page_index, perm);
  10553d:	ff 74 24 2c          	push   0x2c(%esp)
  105541:	ff 74 24 2c          	push   0x2c(%esp)
  105545:	55                   	push   %ebp
  105546:	57                   	push   %edi
  105547:	e8 b4 fd ff ff       	call   105300 <set_ptbl_entry_by_va>
    return pde_page_index;
  10554c:	83 c4 10             	add    $0x10,%esp
}
  10554f:	89 f0                	mov    %esi,%eax
  105551:	83 c4 0c             	add    $0xc,%esp
  105554:	5b                   	pop    %ebx
  105555:	5e                   	pop    %esi
  105556:	5f                   	pop    %edi
  105557:	5d                   	pop    %ebp
  105558:	c3                   	ret    
  105559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        pde_page_index = alloc_ptbl(proc_index, vaddr);
  105560:	83 ec 08             	sub    $0x8,%esp
  105563:	55                   	push   %ebp
  105564:	57                   	push   %edi
  105565:	e8 c6 fe ff ff       	call   105430 <alloc_ptbl>
        if (pde_page_index == 0) {
  10556a:	83 c4 10             	add    $0x10,%esp
        pde_page_index = alloc_ptbl(proc_index, vaddr);
  10556d:	89 c6                	mov    %eax,%esi
        if (pde_page_index == 0) {
  10556f:	85 c0                	test   %eax,%eax
  105571:	75 ca                	jne    10553d <map_page+0x2d>
}
  105573:	83 c4 0c             	add    $0xc,%esp
            return MagicNumber;
  105576:	be 01 00 10 00       	mov    $0x100001,%esi
}
  10557b:	5b                   	pop    %ebx
  10557c:	89 f0                	mov    %esi,%eax
  10557e:	5e                   	pop    %esi
  10557f:	5f                   	pop    %edi
  105580:	5d                   	pop    %ebp
  105581:	c3                   	ret    
  105582:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105590 <unmap_page>:
 * Nothing should be done if the mapping no longer exists.
 * You do not need to unmap the page table from the page directory.
 * It should return the corresponding page table entry.
 */
unsigned int unmap_page(unsigned int proc_index, unsigned int vaddr)
{
  105590:	57                   	push   %edi
  105591:	56                   	push   %esi
  105592:	53                   	push   %ebx
  105593:	e8 25 ae ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105598:	81 c3 68 3a 00 00    	add    $0x3a68,%ebx
  10559e:	83 ec 18             	sub    $0x18,%esp
  1055a1:	8b 74 24 28          	mov    0x28(%esp),%esi
  1055a5:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    // TODO
    unsigned int pte_entry = get_ptbl_entry_by_va(proc_index, vaddr);
  1055a9:	57                   	push   %edi
  1055aa:	56                   	push   %esi
  1055ab:	e8 70 fc ff ff       	call   105220 <get_ptbl_entry_by_va>
    if (pte_entry != 0){
  1055b0:	83 c4 10             	add    $0x10,%esp
  1055b3:	85 c0                	test   %eax,%eax
  1055b5:	75 09                	jne    1055c0 <unmap_page+0x30>
        rmv_ptbl_entry_by_va(proc_index, vaddr);
    }
    return pte_entry;
}
  1055b7:	83 c4 10             	add    $0x10,%esp
  1055ba:	5b                   	pop    %ebx
  1055bb:	5e                   	pop    %esi
  1055bc:	5f                   	pop    %edi
  1055bd:	c3                   	ret    
  1055be:	66 90                	xchg   %ax,%ax
  1055c0:	89 44 24 0c          	mov    %eax,0xc(%esp)
        rmv_ptbl_entry_by_va(proc_index, vaddr);
  1055c4:	83 ec 08             	sub    $0x8,%esp
  1055c7:	57                   	push   %edi
  1055c8:	56                   	push   %esi
  1055c9:	e8 d2 fc ff ff       	call   1052a0 <rmv_ptbl_entry_by_va>
  1055ce:	83 c4 10             	add    $0x10,%esp
  1055d1:	8b 44 24 0c          	mov    0xc(%esp),%eax
}
  1055d5:	83 c4 10             	add    $0x10,%esp
  1055d8:	5b                   	pop    %ebx
  1055d9:	5e                   	pop    %esi
  1055da:	5f                   	pop    %edi
  1055db:	c3                   	ret    
  1055dc:	66 90                	xchg   %ax,%ax
  1055de:	66 90                	xchg   %ax,%ax

001055e0 <paging_init>:
/**
 * Initializes the page structures, moves to the kernel page structure (0),
 * and turns on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  1055e0:	53                   	push   %ebx
  1055e1:	e8 d7 ad ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  1055e6:	81 c3 1a 3a 00 00    	add    $0x3a1a,%ebx
  1055ec:	83 ec 14             	sub    $0x14,%esp
    pdir_init_kern(mbi_addr);
  1055ef:	ff 74 24 1c          	push   0x1c(%esp)
  1055f3:	e8 d8 fe ff ff       	call   1054d0 <pdir_init_kern>
    set_pdir_base(0);
  1055f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1055ff:	e8 5c fa ff ff       	call   105060 <set_pdir_base>
    enable_paging();
  105604:	e8 c5 bb ff ff       	call   1011ce <enable_paging>
}
  105609:	83 c4 18             	add    $0x18,%esp
  10560c:	5b                   	pop    %ebx
  10560d:	c3                   	ret    
  10560e:	66 90                	xchg   %ax,%ax

00105610 <alloc_page>:
 * return value from map_page.
 * In the case of error, it should return the constant MagicNumber.
 */
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr,
                        unsigned int perm)
{
  105610:	55                   	push   %ebp
  105611:	57                   	push   %edi
  105612:	56                   	push   %esi
  105613:	53                   	push   %ebx
  105614:	e8 a4 ad ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105619:	81 c3 e7 39 00 00    	add    $0x39e7,%ebx
  10561f:	83 ec 18             	sub    $0x18,%esp
  105622:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  105626:	8b 6c 24 34          	mov    0x34(%esp),%ebp
    // TODO
    unsigned int  physical_page_index = container_alloc(proc_index);
  10562a:	56                   	push   %esi
  10562b:	e8 60 f9 ff ff       	call   104f90 <container_alloc>

    unsigned int page_map = map_page(proc_index, vaddr, physical_page_index, perm);
  105630:	55                   	push   %ebp
  105631:	50                   	push   %eax
    unsigned int  physical_page_index = container_alloc(proc_index);
  105632:	89 c7                	mov    %eax,%edi
    unsigned int page_map = map_page(proc_index, vaddr, physical_page_index, perm);
  105634:	ff 74 24 3c          	push   0x3c(%esp)
  105638:	56                   	push   %esi
  105639:	e8 d2 fe ff ff       	call   105510 <map_page>
    set_ptbl_entry_by_va(proc_index, vaddr, physical_page_index, perm );
  10563e:	83 c4 20             	add    $0x20,%esp
  105641:	55                   	push   %ebp
  105642:	57                   	push   %edi
  105643:	ff 74 24 2c          	push   0x2c(%esp)
  105647:	56                   	push   %esi
  105648:	e8 b3 fc ff ff       	call   105300 <set_ptbl_entry_by_va>

    return physical_page_index;
}
  10564d:	83 c4 1c             	add    $0x1c,%esp
  105650:	89 f8                	mov    %edi,%eax
  105652:	5b                   	pop    %ebx
  105653:	5e                   	pop    %esi
  105654:	5f                   	pop    %edi
  105655:	5d                   	pop    %ebp
  105656:	c3                   	ret    
  105657:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10565e:	66 90                	xchg   %ax,%ax

00105660 <alloc_mem_quota>:

/**
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota)
{
  105660:	53                   	push   %ebx
  105661:	e8 57 ad ff ff       	call   1003bd <__x86.get_pc_thunk.bx>
  105666:	81 c3 9a 39 00 00    	add    $0x399a,%ebx
  10566c:	83 ec 10             	sub    $0x10,%esp
    unsigned int child;
    child = container_split(id, quota);
  10566f:	ff 74 24 1c          	push   0x1c(%esp)
  105673:	ff 74 24 1c          	push   0x1c(%esp)
  105677:	e8 84 f8 ff ff       	call   104f00 <container_split>
    return child;
}
  10567c:	83 c4 18             	add    $0x18,%esp
  10567f:	5b                   	pop    %ebx
  105680:	c3                   	ret    
  105681:	66 90                	xchg   %ax,%ax
  105683:	66 90                	xchg   %ax,%ax
  105685:	66 90                	xchg   %ax,%ax
  105687:	66 90                	xchg   %ax,%ax
  105689:	66 90                	xchg   %ax,%ax
  10568b:	66 90                	xchg   %ax,%ax
  10568d:	66 90                	xchg   %ax,%ax
  10568f:	90                   	nop

00105690 <__udivdi3>:
  105690:	f3 0f 1e fb          	endbr32 
  105694:	55                   	push   %ebp
  105695:	57                   	push   %edi
  105696:	56                   	push   %esi
  105697:	53                   	push   %ebx
  105698:	83 ec 1c             	sub    $0x1c,%esp
  10569b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  10569f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  1056a3:	8b 74 24 34          	mov    0x34(%esp),%esi
  1056a7:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  1056ab:	85 c0                	test   %eax,%eax
  1056ad:	75 19                	jne    1056c8 <__udivdi3+0x38>
  1056af:	39 f3                	cmp    %esi,%ebx
  1056b1:	76 4d                	jbe    105700 <__udivdi3+0x70>
  1056b3:	31 ff                	xor    %edi,%edi
  1056b5:	89 e8                	mov    %ebp,%eax
  1056b7:	89 f2                	mov    %esi,%edx
  1056b9:	f7 f3                	div    %ebx
  1056bb:	89 fa                	mov    %edi,%edx
  1056bd:	83 c4 1c             	add    $0x1c,%esp
  1056c0:	5b                   	pop    %ebx
  1056c1:	5e                   	pop    %esi
  1056c2:	5f                   	pop    %edi
  1056c3:	5d                   	pop    %ebp
  1056c4:	c3                   	ret    
  1056c5:	8d 76 00             	lea    0x0(%esi),%esi
  1056c8:	39 f0                	cmp    %esi,%eax
  1056ca:	76 14                	jbe    1056e0 <__udivdi3+0x50>
  1056cc:	31 ff                	xor    %edi,%edi
  1056ce:	31 c0                	xor    %eax,%eax
  1056d0:	89 fa                	mov    %edi,%edx
  1056d2:	83 c4 1c             	add    $0x1c,%esp
  1056d5:	5b                   	pop    %ebx
  1056d6:	5e                   	pop    %esi
  1056d7:	5f                   	pop    %edi
  1056d8:	5d                   	pop    %ebp
  1056d9:	c3                   	ret    
  1056da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1056e0:	0f bd f8             	bsr    %eax,%edi
  1056e3:	83 f7 1f             	xor    $0x1f,%edi
  1056e6:	75 48                	jne    105730 <__udivdi3+0xa0>
  1056e8:	39 f0                	cmp    %esi,%eax
  1056ea:	72 06                	jb     1056f2 <__udivdi3+0x62>
  1056ec:	31 c0                	xor    %eax,%eax
  1056ee:	39 eb                	cmp    %ebp,%ebx
  1056f0:	77 de                	ja     1056d0 <__udivdi3+0x40>
  1056f2:	b8 01 00 00 00       	mov    $0x1,%eax
  1056f7:	eb d7                	jmp    1056d0 <__udivdi3+0x40>
  1056f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105700:	89 d9                	mov    %ebx,%ecx
  105702:	85 db                	test   %ebx,%ebx
  105704:	75 0b                	jne    105711 <__udivdi3+0x81>
  105706:	b8 01 00 00 00       	mov    $0x1,%eax
  10570b:	31 d2                	xor    %edx,%edx
  10570d:	f7 f3                	div    %ebx
  10570f:	89 c1                	mov    %eax,%ecx
  105711:	31 d2                	xor    %edx,%edx
  105713:	89 f0                	mov    %esi,%eax
  105715:	f7 f1                	div    %ecx
  105717:	89 c6                	mov    %eax,%esi
  105719:	89 e8                	mov    %ebp,%eax
  10571b:	89 f7                	mov    %esi,%edi
  10571d:	f7 f1                	div    %ecx
  10571f:	89 fa                	mov    %edi,%edx
  105721:	83 c4 1c             	add    $0x1c,%esp
  105724:	5b                   	pop    %ebx
  105725:	5e                   	pop    %esi
  105726:	5f                   	pop    %edi
  105727:	5d                   	pop    %ebp
  105728:	c3                   	ret    
  105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105730:	89 f9                	mov    %edi,%ecx
  105732:	ba 20 00 00 00       	mov    $0x20,%edx
  105737:	29 fa                	sub    %edi,%edx
  105739:	d3 e0                	shl    %cl,%eax
  10573b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10573f:	89 d1                	mov    %edx,%ecx
  105741:	89 d8                	mov    %ebx,%eax
  105743:	d3 e8                	shr    %cl,%eax
  105745:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105749:	09 c1                	or     %eax,%ecx
  10574b:	89 f0                	mov    %esi,%eax
  10574d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  105751:	89 f9                	mov    %edi,%ecx
  105753:	d3 e3                	shl    %cl,%ebx
  105755:	89 d1                	mov    %edx,%ecx
  105757:	d3 e8                	shr    %cl,%eax
  105759:	89 f9                	mov    %edi,%ecx
  10575b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  10575f:	89 eb                	mov    %ebp,%ebx
  105761:	d3 e6                	shl    %cl,%esi
  105763:	89 d1                	mov    %edx,%ecx
  105765:	d3 eb                	shr    %cl,%ebx
  105767:	09 f3                	or     %esi,%ebx
  105769:	89 c6                	mov    %eax,%esi
  10576b:	89 f2                	mov    %esi,%edx
  10576d:	89 d8                	mov    %ebx,%eax
  10576f:	f7 74 24 08          	divl   0x8(%esp)
  105773:	89 d6                	mov    %edx,%esi
  105775:	89 c3                	mov    %eax,%ebx
  105777:	f7 64 24 0c          	mull   0xc(%esp)
  10577b:	39 d6                	cmp    %edx,%esi
  10577d:	72 19                	jb     105798 <__udivdi3+0x108>
  10577f:	89 f9                	mov    %edi,%ecx
  105781:	d3 e5                	shl    %cl,%ebp
  105783:	39 c5                	cmp    %eax,%ebp
  105785:	73 04                	jae    10578b <__udivdi3+0xfb>
  105787:	39 d6                	cmp    %edx,%esi
  105789:	74 0d                	je     105798 <__udivdi3+0x108>
  10578b:	89 d8                	mov    %ebx,%eax
  10578d:	31 ff                	xor    %edi,%edi
  10578f:	e9 3c ff ff ff       	jmp    1056d0 <__udivdi3+0x40>
  105794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105798:	8d 43 ff             	lea    -0x1(%ebx),%eax
  10579b:	31 ff                	xor    %edi,%edi
  10579d:	e9 2e ff ff ff       	jmp    1056d0 <__udivdi3+0x40>
  1057a2:	66 90                	xchg   %ax,%ax
  1057a4:	66 90                	xchg   %ax,%ax
  1057a6:	66 90                	xchg   %ax,%ax
  1057a8:	66 90                	xchg   %ax,%ax
  1057aa:	66 90                	xchg   %ax,%ax
  1057ac:	66 90                	xchg   %ax,%ax
  1057ae:	66 90                	xchg   %ax,%ax

001057b0 <__umoddi3>:
  1057b0:	f3 0f 1e fb          	endbr32 
  1057b4:	55                   	push   %ebp
  1057b5:	57                   	push   %edi
  1057b6:	56                   	push   %esi
  1057b7:	53                   	push   %ebx
  1057b8:	83 ec 1c             	sub    $0x1c,%esp
  1057bb:	8b 74 24 30          	mov    0x30(%esp),%esi
  1057bf:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  1057c3:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
  1057c7:	8b 6c 24 38          	mov    0x38(%esp),%ebp
  1057cb:	89 f0                	mov    %esi,%eax
  1057cd:	89 da                	mov    %ebx,%edx
  1057cf:	85 ff                	test   %edi,%edi
  1057d1:	75 15                	jne    1057e8 <__umoddi3+0x38>
  1057d3:	39 dd                	cmp    %ebx,%ebp
  1057d5:	76 39                	jbe    105810 <__umoddi3+0x60>
  1057d7:	f7 f5                	div    %ebp
  1057d9:	89 d0                	mov    %edx,%eax
  1057db:	31 d2                	xor    %edx,%edx
  1057dd:	83 c4 1c             	add    $0x1c,%esp
  1057e0:	5b                   	pop    %ebx
  1057e1:	5e                   	pop    %esi
  1057e2:	5f                   	pop    %edi
  1057e3:	5d                   	pop    %ebp
  1057e4:	c3                   	ret    
  1057e5:	8d 76 00             	lea    0x0(%esi),%esi
  1057e8:	39 df                	cmp    %ebx,%edi
  1057ea:	77 f1                	ja     1057dd <__umoddi3+0x2d>
  1057ec:	0f bd cf             	bsr    %edi,%ecx
  1057ef:	83 f1 1f             	xor    $0x1f,%ecx
  1057f2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  1057f6:	75 40                	jne    105838 <__umoddi3+0x88>
  1057f8:	39 df                	cmp    %ebx,%edi
  1057fa:	72 04                	jb     105800 <__umoddi3+0x50>
  1057fc:	39 f5                	cmp    %esi,%ebp
  1057fe:	77 dd                	ja     1057dd <__umoddi3+0x2d>
  105800:	89 da                	mov    %ebx,%edx
  105802:	89 f0                	mov    %esi,%eax
  105804:	29 e8                	sub    %ebp,%eax
  105806:	19 fa                	sbb    %edi,%edx
  105808:	eb d3                	jmp    1057dd <__umoddi3+0x2d>
  10580a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105810:	89 e9                	mov    %ebp,%ecx
  105812:	85 ed                	test   %ebp,%ebp
  105814:	75 0b                	jne    105821 <__umoddi3+0x71>
  105816:	b8 01 00 00 00       	mov    $0x1,%eax
  10581b:	31 d2                	xor    %edx,%edx
  10581d:	f7 f5                	div    %ebp
  10581f:	89 c1                	mov    %eax,%ecx
  105821:	89 d8                	mov    %ebx,%eax
  105823:	31 d2                	xor    %edx,%edx
  105825:	f7 f1                	div    %ecx
  105827:	89 f0                	mov    %esi,%eax
  105829:	f7 f1                	div    %ecx
  10582b:	89 d0                	mov    %edx,%eax
  10582d:	31 d2                	xor    %edx,%edx
  10582f:	eb ac                	jmp    1057dd <__umoddi3+0x2d>
  105831:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105838:	8b 44 24 04          	mov    0x4(%esp),%eax
  10583c:	ba 20 00 00 00       	mov    $0x20,%edx
  105841:	29 c2                	sub    %eax,%edx
  105843:	89 c1                	mov    %eax,%ecx
  105845:	89 e8                	mov    %ebp,%eax
  105847:	d3 e7                	shl    %cl,%edi
  105849:	89 d1                	mov    %edx,%ecx
  10584b:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10584f:	d3 e8                	shr    %cl,%eax
  105851:	89 c1                	mov    %eax,%ecx
  105853:	8b 44 24 04          	mov    0x4(%esp),%eax
  105857:	09 f9                	or     %edi,%ecx
  105859:	89 df                	mov    %ebx,%edi
  10585b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  10585f:	89 c1                	mov    %eax,%ecx
  105861:	d3 e5                	shl    %cl,%ebp
  105863:	89 d1                	mov    %edx,%ecx
  105865:	d3 ef                	shr    %cl,%edi
  105867:	89 c1                	mov    %eax,%ecx
  105869:	89 f0                	mov    %esi,%eax
  10586b:	d3 e3                	shl    %cl,%ebx
  10586d:	89 d1                	mov    %edx,%ecx
  10586f:	89 fa                	mov    %edi,%edx
  105871:	d3 e8                	shr    %cl,%eax
  105873:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  105878:	09 d8                	or     %ebx,%eax
  10587a:	f7 74 24 08          	divl   0x8(%esp)
  10587e:	89 d3                	mov    %edx,%ebx
  105880:	d3 e6                	shl    %cl,%esi
  105882:	f7 e5                	mul    %ebp
  105884:	89 c7                	mov    %eax,%edi
  105886:	89 d1                	mov    %edx,%ecx
  105888:	39 d3                	cmp    %edx,%ebx
  10588a:	72 06                	jb     105892 <__umoddi3+0xe2>
  10588c:	75 0e                	jne    10589c <__umoddi3+0xec>
  10588e:	39 c6                	cmp    %eax,%esi
  105890:	73 0a                	jae    10589c <__umoddi3+0xec>
  105892:	29 e8                	sub    %ebp,%eax
  105894:	1b 54 24 08          	sbb    0x8(%esp),%edx
  105898:	89 d1                	mov    %edx,%ecx
  10589a:	89 c7                	mov    %eax,%edi
  10589c:	89 f5                	mov    %esi,%ebp
  10589e:	8b 74 24 04          	mov    0x4(%esp),%esi
  1058a2:	29 fd                	sub    %edi,%ebp
  1058a4:	19 cb                	sbb    %ecx,%ebx
  1058a6:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
  1058ab:	89 d8                	mov    %ebx,%eax
  1058ad:	d3 e0                	shl    %cl,%eax
  1058af:	89 f1                	mov    %esi,%ecx
  1058b1:	d3 ed                	shr    %cl,%ebp
  1058b3:	d3 eb                	shr    %cl,%ebx
  1058b5:	09 e8                	or     %ebp,%eax
  1058b7:	89 da                	mov    %ebx,%edx
  1058b9:	83 c4 1c             	add    $0x1c,%esp
  1058bc:	5b                   	pop    %ebx
  1058bd:	5e                   	pop    %esi
  1058be:	5f                   	pop    %edi
  1058bf:	5d                   	pop    %ebp
  1058c0:	c3                   	ret    
