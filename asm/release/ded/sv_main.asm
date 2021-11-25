
./build/release-linux-x86_64_-_obj/ded/sv_main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <SV_Restart>:
SV_Restart():
       0:	55                   	push   rbp
       1:	53                   	push   rbx
       2:	48 81 ec 08 01 00 00 	sub    rsp,0x108
       9:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 10 <SV_Restart+0x10>
      10:	48 85 c0             	test   rax,rax
      13:	74 3f                	je     54 <SV_Restart+0x54>
      15:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1c <SV_Restart+0x1c>
      1c:	8b 52 30             	mov    edx,DWORD PTR [rdx+0x30]
      1f:	85 d2                	test   edx,edx
      21:	7e 31                	jle    54 <SV_Restart+0x54>
      23:	83 38 01             	cmp    DWORD PTR [rax],0x1
      26:	48 89 fd             	mov    rbp,rdi
      29:	77 75                	ja     a0 <SV_Restart+0xa0>
      2b:	83 ea 01             	sub    edx,0x1
      2e:	48 05 e0 dd 02 00    	add    rax,0x2dde0
      34:	48 69 d2 e0 dd 02 00 	imul   rdx,rdx,0x2dde0
      3b:	48 01 c2             	add    rdx,rax
      3e:	eb 0f                	jmp    4f <SV_Restart+0x4f>
      40:	48 05 e0 dd 02 00    	add    rax,0x2dde0
      46:	83 b8 20 22 fd ff 01 	cmp    DWORD PTR [rax-0x2dde0],0x1
      4d:	77 51                	ja     a0 <SV_Restart+0xa0>
      4f:	48 39 c2             	cmp    rdx,rax
      52:	75 ec                	jne    40 <SV_Restart+0x40>
      54:	48 89 e3             	mov    rbx,rsp
      57:	ba 00 01 00 00       	mov    edx,0x100
      5c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 63 <SV_Restart+0x63>
      63:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 6e <SV_Restart+0x6e>
      6a:	00 00 00 00 
      6e:	48 89 de             	mov    rsi,rbx
      71:	e8 00 00 00 00       	call   76 <SV_Restart+0x76>
      76:	48 89 de             	mov    rsi,rbx
      79:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 80 <SV_Restart+0x80>
      80:	31 c0                	xor    eax,eax
      82:	e8 00 00 00 00       	call   87 <SV_Restart+0x87>
      87:	48 89 c7             	mov    rdi,rax
      8a:	e8 00 00 00 00       	call   8f <SV_Restart+0x8f>
      8f:	48 81 c4 08 01 00 00 	add    rsp,0x108
      96:	5b                   	pop    rbx
      97:	5d                   	pop    rbp
      98:	c3                   	ret    
      99:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
      a0:	48 89 e3             	mov    rbx,rsp
      a3:	ba 00 01 00 00       	mov    edx,0x100
      a8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # af <SV_Restart+0xaf>
      af:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # ba <SV_Restart+0xba>
      b6:	00 00 00 00 
      ba:	48 89 de             	mov    rsi,rbx
      bd:	e8 00 00 00 00       	call   c2 <SV_Restart+0xc2>
      c2:	48 89 ef             	mov    rdi,rbp
      c5:	e8 00 00 00 00       	call   ca <SV_Restart+0xca>
      ca:	eb aa                	jmp    76 <SV_Restart+0x76>
      cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000000d0 <SV_FlushRedirect>:
SV_FlushRedirect():
      d0:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
      d3:	75 0b                	jne    e0 <SV_FlushRedirect+0x10>
      d5:	c3                   	ret    
      d6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
      dd:	00 00 00 
      e0:	48 89 f9             	mov    rcx,rdi
      e3:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # ea <SV_FlushRedirect+0x1a>
      ea:	bf 01 00 00 00       	mov    edi,0x1
      ef:	31 c0                	xor    eax,eax
      f1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # f8 <SV_FlushRedirect+0x28>
      f8:	e9 00 00 00 00       	jmp    fd <SV_FlushRedirect+0x2d>
      fd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000000100 <SVC_BucketForAddress.isra.1>:
SVC_BucketForAddress.isra.1():
     100:	41 57                	push   r15
     102:	41 56                	push   r14
     104:	41 55                	push   r13
     106:	41 54                	push   r12
     108:	41 89 f4             	mov    r12d,esi
     10b:	55                   	push   rbp
     10c:	48 89 fd             	mov    rbp,rdi
     10f:	53                   	push   rbx
     110:	48 83 ec 18          	sub    rsp,0x18
     114:	8b 07                	mov    eax,DWORD PTR [rdi]
     116:	83 f8 04             	cmp    eax,0x4
     119:	0f 84 29 02 00 00    	je     348 <SVC_BucketForAddress.isra.1+0x248>
     11f:	31 db                	xor    ebx,ebx
     121:	83 f8 05             	cmp    eax,0x5
     124:	75 42                	jne    168 <SVC_BucketForAddress.isra.1+0x68>
     126:	48 8d 47 04          	lea    rax,[rdi+0x4]
     12a:	ba 10 00 00 00       	mov    edx,0x10
     12f:	83 ea 01             	sub    edx,0x1
     132:	bf 77 00 00 00       	mov    edi,0x77
     137:	31 c9                	xor    ecx,ecx
     139:	4c 8d 44 10 01       	lea    r8,[rax+rdx*1+0x1]
     13e:	29 c7                	sub    edi,eax
     140:	0f b6 30             	movzx  esi,BYTE PTR [rax]
     143:	8d 14 07             	lea    edx,[rdi+rax*1]
     146:	48 83 c0 01          	add    rax,0x1
     14a:	0f af d6             	imul   edx,esi
     14d:	01 d1                	add    ecx,edx
     14f:	4c 39 c0             	cmp    rax,r8
     152:	75 ec                	jne    140 <SVC_BucketForAddress.isra.1+0x40>
     154:	89 cb                	mov    ebx,ecx
     156:	89 c8                	mov    eax,ecx
     158:	c1 fb 0a             	sar    ebx,0xa
     15b:	c1 f8 14             	sar    eax,0x14
     15e:	31 c3                	xor    ebx,eax
     160:	31 cb                	xor    ebx,ecx
     162:	81 e3 ff 03 00 00    	and    ebx,0x3ff
     168:	e8 00 00 00 00       	call   16d <SVC_BucketForAddress.isra.1+0x6d>
     16d:	4c 8d 15 00 00 00 00 	lea    r10,[rip+0x0]        # 174 <SVC_BucketForAddress.isra.1+0x74>
     174:	4c 63 db             	movsxd r11,ebx
     177:	4f 8b 0c da          	mov    r9,QWORD PTR [r10+r11*8]
     17b:	4d 85 c9             	test   r9,r9
     17e:	0f 84 88 00 00 00    	je     20c <SVC_BucketForAddress.isra.1+0x10c>
     184:	4c 89 ca             	mov    rdx,r9
     187:	31 f6                	xor    esi,esi
     189:	4c 8d 45 04          	lea    r8,[rbp+0x4]
     18d:	8b 0a                	mov    ecx,DWORD PTR [rdx]
     18f:	83 f9 04             	cmp    ecx,0x4
     192:	74 64                	je     1f8 <SVC_BucketForAddress.isra.1+0xf8>
     194:	83 f9 05             	cmp    ecx,0x5
     197:	0f 85 8b 01 00 00    	jne    328 <SVC_BucketForAddress.isra.1+0x228>
     19d:	48 8b 4a 04          	mov    rcx,QWORD PTR [rdx+0x4]
     1a1:	48 8b 7a 0c          	mov    rdi,QWORD PTR [rdx+0xc]
     1a5:	49 33 08             	xor    rcx,QWORD PTR [r8]
     1a8:	49 33 78 08          	xor    rdi,QWORD PTR [r8+0x8]
     1ac:	48 09 cf             	or     rdi,rcx
     1af:	75 4f                	jne    200 <SVC_BucketForAddress.isra.1+0x100>
     1b1:	83 fe 08             	cmp    esi,0x8
     1b4:	0f 8e 75 01 00 00    	jle    32f <SVC_BucketForAddress.isra.1+0x22f>
     1ba:	48 8b 42 28          	mov    rax,QWORD PTR [rdx+0x28]
     1be:	48 85 c0             	test   rax,rax
     1c1:	0f 84 68 01 00 00    	je     32f <SVC_BucketForAddress.isra.1+0x22f>
     1c7:	48 8b 4a 30          	mov    rcx,QWORD PTR [rdx+0x30]
     1cb:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
     1cf:	48 85 c9             	test   rcx,rcx
     1d2:	74 04                	je     1d8 <SVC_BucketForAddress.isra.1+0xd8>
     1d4:	48 89 41 28          	mov    QWORD PTR [rcx+0x28],rax
     1d8:	4c 89 4a 30          	mov    QWORD PTR [rdx+0x30],r9
     1dc:	4b 89 14 da          	mov    QWORD PTR [r10+r11*8],rdx
     1e0:	49 89 51 28          	mov    QWORD PTR [r9+0x28],rdx
     1e4:	48 c7 42 28 00 00 00 	mov    QWORD PTR [rdx+0x28],0x0
     1eb:	00 
     1ec:	e9 3e 01 00 00       	jmp    32f <SVC_BucketForAddress.isra.1+0x22f>
     1f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     1f8:	8b 7a 04             	mov    edi,DWORD PTR [rdx+0x4]
     1fb:	39 7d 04             	cmp    DWORD PTR [rbp+0x4],edi
     1fe:	74 b1                	je     1b1 <SVC_BucketForAddress.isra.1+0xb1>
     200:	48 8b 52 30          	mov    rdx,QWORD PTR [rdx+0x30]
     204:	83 c6 01             	add    esi,0x1
     207:	48 85 d2             	test   rdx,rdx
     20a:	75 81                	jne    18d <SVC_BucketForAddress.isra.1+0x8d>
     20c:	44 89 64 24 0c       	mov    DWORD PTR [rsp+0xc],r12d
     211:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # 218 <SVC_BucketForAddress.isra.1+0x118>
     218:	be 00 40 00 00       	mov    esi,0x4000
     21d:	4c 8d 2d 00 00 00 00 	lea    r13,[rip+0x0]        # 224 <SVC_BucketForAddress.isra.1+0x124>
     224:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     228:	41 81 f8 ff 3f 00 00 	cmp    r8d,0x3fff
     22f:	0f 8f 53 01 00 00    	jg     388 <SVC_BucketForAddress.isra.1+0x288>
     235:	49 63 d0             	movsxd rdx,r8d
     238:	49 63 c8             	movsxd rcx,r8d
     23b:	41 83 c0 01          	add    r8d,0x1
     23f:	4c 8d 34 d5 00 00 00 	lea    r14,[rdx*8+0x0]
     246:	00 
     247:	49 29 d6             	sub    r14,rdx
     24a:	49 c1 e6 03          	shl    r14,0x3
     24e:	4b 8d 54 35 00       	lea    rdx,[r13+r14*1+0x0]
     253:	48 8d 3c cd 00 00 00 	lea    rdi,[rcx*8+0x0]
     25a:	00 
     25b:	48 29 cf             	sub    rdi,rcx
     25e:	49 8d 7c fd 00       	lea    rdi,[r13+rdi*8+0x0]
     263:	44 8b 27             	mov    r12d,DWORD PTR [rdi]
     266:	45 85 e4             	test   r12d,r12d
     269:	0f 84 09 01 00 00    	je     378 <SVC_BucketForAddress.isra.1+0x278>
     26f:	44 8b 7c 24 0c       	mov    r15d,DWORD PTR [rsp+0xc]
     274:	44 0f af 7f 18       	imul   r15d,DWORD PTR [rdi+0x18]
     279:	41 89 c4             	mov    r12d,eax
     27c:	44 2b 67 14          	sub    r12d,DWORD PTR [rdi+0x14]
     280:	45 39 e7             	cmp    r15d,r12d
     283:	0f 83 d7 00 00 00    	jae    360 <SVC_BucketForAddress.isra.1+0x260>
     289:	44 89 05 00 00 00 00 	mov    DWORD PTR [rip+0x0],r8d        # 290 <SVC_BucketForAddress.isra.1+0x190>
     290:	4c 8b 47 28          	mov    r8,QWORD PTR [rdi+0x28]
     294:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
     298:	4d 85 c0             	test   r8,r8
     29b:	0f 84 ff 00 00 00    	je     3a0 <SVC_BucketForAddress.isra.1+0x2a0>
     2a1:	49 89 70 30          	mov    QWORD PTR [r8+0x30],rsi
     2a5:	48 8b 77 30          	mov    rsi,QWORD PTR [rdi+0x30]
     2a9:	48 85 f6             	test   rsi,rsi
     2ac:	74 04                	je     2b2 <SVC_BucketForAddress.isra.1+0x1b2>
     2ae:	4c 89 46 28          	mov    QWORD PTR [rsi+0x28],r8
     2b2:	8b 75 00             	mov    esi,DWORD PTR [rbp+0x0]
     2b5:	48 8d 3c cd 00 00 00 	lea    rdi,[rcx*8+0x0]
     2bc:	00 
     2bd:	48 29 cf             	sub    rdi,rcx
     2c0:	41 89 74 fd 00       	mov    DWORD PTR [r13+rdi*8+0x0],esi
     2c5:	83 fe 04             	cmp    esi,0x4
     2c8:	0f 84 00 01 00 00    	je     3ce <SVC_BucketForAddress.isra.1+0x2ce>
     2ce:	83 fe 05             	cmp    esi,0x5
     2d1:	0f 84 e1 00 00 00    	je     3b8 <SVC_BucketForAddress.isra.1+0x2b8>
     2d7:	48 8d 34 cd 00 00 00 	lea    rsi,[rcx*8+0x0]
     2de:	00 
     2df:	48 29 ce             	sub    rsi,rcx
     2e2:	49 8d 74 f5 00       	lea    rsi,[r13+rsi*8+0x0]
     2e7:	89 46 14             	mov    DWORD PTR [rsi+0x14],eax
     2ea:	c7 46 18 00 00 00 00 	mov    DWORD PTR [rsi+0x18],0x0
     2f1:	89 5e 1c             	mov    DWORD PTR [rsi+0x1c],ebx
     2f4:	c7 46 20 00 00 00 00 	mov    DWORD PTR [rsi+0x20],0x0
     2fb:	4c 89 4e 30          	mov    QWORD PTR [rsi+0x30],r9
     2ff:	4d 85 c9             	test   r9,r9
     302:	74 04                	je     308 <SVC_BucketForAddress.isra.1+0x208>
     304:	49 89 51 28          	mov    QWORD PTR [r9+0x28],rdx
     308:	48 8d 04 cd 00 00 00 	lea    rax,[rcx*8+0x0]
     30f:	00 
     310:	4b 89 14 da          	mov    QWORD PTR [r10+r11*8],rdx
     314:	48 29 c8             	sub    rax,rcx
     317:	49 c7 44 c5 28 00 00 	mov    QWORD PTR [r13+rax*8+0x28],0x0
     31e:	00 00 
     320:	eb 0d                	jmp    32f <SVC_BucketForAddress.isra.1+0x22f>
     322:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     328:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 32f <SVC_BucketForAddress.isra.1+0x22f>
     32f:	48 83 c4 18          	add    rsp,0x18
     333:	48 89 d0             	mov    rax,rdx
     336:	5b                   	pop    rbx
     337:	5d                   	pop    rbp
     338:	41 5c                	pop    r12
     33a:	41 5d                	pop    r13
     33c:	41 5e                	pop    r14
     33e:	41 5f                	pop    r15
     340:	c3                   	ret    
     341:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     348:	48 8d 47 04          	lea    rax,[rdi+0x4]
     34c:	ba 04 00 00 00       	mov    edx,0x4
     351:	e9 d9 fd ff ff       	jmp    12f <SVC_BucketForAddress.isra.1+0x2f>
     356:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
     35d:	00 00 00 
     360:	83 ee 01             	sub    esi,0x1
     363:	0f 85 bf fe ff ff    	jne    228 <SVC_BucketForAddress.isra.1+0x128>
     369:	44 89 05 00 00 00 00 	mov    DWORD PTR [rip+0x0],r8d        # 370 <SVC_BucketForAddress.isra.1+0x270>
     370:	31 d2                	xor    edx,edx
     372:	eb bb                	jmp    32f <SVC_BucketForAddress.isra.1+0x22f>
     374:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     378:	44 89 05 00 00 00 00 	mov    DWORD PTR [rip+0x0],r8d        # 37f <SVC_BucketForAddress.isra.1+0x27f>
     37f:	e9 2e ff ff ff       	jmp    2b2 <SVC_BucketForAddress.isra.1+0x1b2>
     384:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     388:	45 31 f6             	xor    r14d,r14d
     38b:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 392 <SVC_BucketForAddress.isra.1+0x292>
     392:	41 b8 01 00 00 00    	mov    r8d,0x1
     398:	31 c9                	xor    ecx,ecx
     39a:	e9 b4 fe ff ff       	jmp    253 <SVC_BucketForAddress.isra.1+0x153>
     39f:	90                   	nop
     3a0:	48 63 7f 1c          	movsxd rdi,DWORD PTR [rdi+0x1c]
     3a4:	49 89 34 fa          	mov    QWORD PTR [r10+rdi*8],rsi
     3a8:	4f 8b 0c da          	mov    r9,QWORD PTR [r10+r11*8]
     3ac:	e9 f8 fe ff ff       	jmp    2a9 <SVC_BucketForAddress.isra.1+0x1a9>
     3b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     3b8:	f3 0f 6f 45 04       	movdqu xmm0,XMMWORD PTR [rbp+0x4]
     3bd:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3c4 <SVC_BucketForAddress.isra.1+0x2c4>
     3c4:	42 0f 11 04 36       	movups XMMWORD PTR [rsi+r14*1],xmm0
     3c9:	e9 09 ff ff ff       	jmp    2d7 <SVC_BucketForAddress.isra.1+0x1d7>
     3ce:	8b 7d 04             	mov    edi,DWORD PTR [rbp+0x4]
     3d1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3d8 <SVC_BucketForAddress.isra.1+0x2d8>
     3d8:	42 89 3c 36          	mov    DWORD PTR [rsi+r14*1],edi
     3dc:	e9 f6 fe ff ff       	jmp    2d7 <SVC_BucketForAddress.isra.1+0x1d7>
     3e1:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
     3e8:	00 00 00 00 
     3ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000003f0 <SV_MasterHeartbeat.constprop.3>:
SV_MasterHeartbeat.constprop.3():
     3f0:	41 57                	push   r15
     3f2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3f9 <SV_MasterHeartbeat.constprop.3+0x9>
     3f9:	41 56                	push   r14
     3fb:	41 55                	push   r13
     3fd:	41 54                	push   r12
     3ff:	55                   	push   rbp
     400:	53                   	push   rbx
     401:	48 83 ec 18          	sub    rsp,0x18
     405:	e8 00 00 00 00       	call   40a <SV_MasterHeartbeat.constprop.3+0x1a>
     40a:	41 89 c4             	mov    r12d,eax
     40d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 414 <SV_MasterHeartbeat.constprop.3+0x24>
     414:	48 85 c0             	test   rax,rax
     417:	0f 84 e7 00 00 00    	je     504 <SV_MasterHeartbeat.constprop.3+0x114>
     41d:	83 78 30 02          	cmp    DWORD PTR [rax+0x30],0x2
     421:	0f 85 dd 00 00 00    	jne    504 <SV_MasterHeartbeat.constprop.3+0x114>
     427:	41 f6 c4 03          	test   r12b,0x3
     42b:	0f 84 d3 00 00 00    	je     504 <SV_MasterHeartbeat.constprop.3+0x114>
     431:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 437 <SV_MasterHeartbeat.constprop.3+0x47>
     437:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 43d <SV_MasterHeartbeat.constprop.3+0x4d>
     43d:	29 d0                	sub    eax,edx
     43f:	85 c0                	test   eax,eax
     441:	0f 8f bd 00 00 00    	jg     504 <SV_MasterHeartbeat.constprop.3+0x114>
     447:	81 c2 e0 93 04 00    	add    edx,0x493e0
     44d:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 454 <SV_MasterHeartbeat.constprop.3+0x64>
     454:	45 89 e6             	mov    r14d,r12d
     457:	89 15 00 00 00 00    	mov    DWORD PTR [rip+0x0],edx        # 45d <SV_MasterHeartbeat.constprop.3+0x6d>
     45d:	4c 8d 3d 00 00 00 00 	lea    r15,[rip+0x0]        # 464 <SV_MasterHeartbeat.constprop.3+0x74>
     464:	4c 8d 6b 28          	lea    r13,[rbx+0x28]
     468:	41 83 e6 01          	and    r14d,0x1
     46c:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 473 <SV_MasterHeartbeat.constprop.3+0x83>
     473:	48 8b 03             	mov    rax,QWORD PTR [rbx]
     476:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
     47a:	80 3e 00             	cmp    BYTE PTR [rsi],0x0
     47d:	74 70                	je     4ef <SV_MasterHeartbeat.constprop.3+0xff>
     47f:	8b 78 24             	mov    edi,DWORD PTR [rax+0x24]
     482:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 488 <SV_MasterHeartbeat.constprop.3+0x98>
     488:	85 ff                	test   edi,edi
     48a:	75 09                	jne    495 <SV_MasterHeartbeat.constprop.3+0xa5>
     48c:	89 d1                	mov    ecx,edx
     48e:	2b 4d 50             	sub    ecx,DWORD PTR [rbp+0x50]
     491:	85 c9                	test   ecx,ecx
     493:	7e 1f                	jle    4b4 <SV_MasterHeartbeat.constprop.3+0xc4>
     495:	81 c2 00 5c 26 05    	add    edx,0x5265c00
     49b:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
     4a2:	89 55 50             	mov    DWORD PTR [rbp+0x50],edx
     4a5:	45 85 f6             	test   r14d,r14d
     4a8:	0f 85 ca 00 00 00    	jne    578 <SV_MasterHeartbeat.constprop.3+0x188>
     4ae:	41 f6 c4 02          	test   r12b,0x2
     4b2:	75 64                	jne    518 <SV_MasterHeartbeat.constprop.3+0x128>
     4b4:	41 8b 37             	mov    esi,DWORD PTR [r15]
     4b7:	85 f6                	test   esi,esi
     4b9:	75 08                	jne    4c3 <SV_MasterHeartbeat.constprop.3+0xd3>
     4bb:	41 8b 4f 20          	mov    ecx,DWORD PTR [r15+0x20]
     4bf:	85 c9                	test   ecx,ecx
     4c1:	74 2c                	je     4ef <SV_MasterHeartbeat.constprop.3+0xff>
     4c3:	48 8b 03             	mov    rax,QWORD PTR [rbx]
     4c6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4cd <SV_MasterHeartbeat.constprop.3+0xdd>
     4cd:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
     4d1:	31 c0                	xor    eax,eax
     4d3:	e8 00 00 00 00       	call   4d8 <SV_MasterHeartbeat.constprop.3+0xe8>
     4d8:	41 8b 17             	mov    edx,DWORD PTR [r15]
     4db:	85 d2                	test   edx,edx
     4dd:	0f 85 0d 01 00 00    	jne    5f0 <SV_MasterHeartbeat.constprop.3+0x200>
     4e3:	41 8b 47 20          	mov    eax,DWORD PTR [r15+0x20]
     4e7:	85 c0                	test   eax,eax
     4e9:	0f 85 d9 00 00 00    	jne    5c8 <SV_MasterHeartbeat.constprop.3+0x1d8>
     4ef:	48 83 c3 08          	add    rbx,0x8
     4f3:	49 83 c7 40          	add    r15,0x40
     4f7:	48 83 c5 04          	add    rbp,0x4
     4fb:	4c 39 eb             	cmp    rbx,r13
     4fe:	0f 85 6f ff ff ff    	jne    473 <SV_MasterHeartbeat.constprop.3+0x83>
     504:	48 83 c4 18          	add    rsp,0x18
     508:	5b                   	pop    rbx
     509:	5d                   	pop    rbp
     50a:	41 5c                	pop    r12
     50c:	41 5d                	pop    r13
     50e:	41 5e                	pop    r14
     510:	41 5f                	pop    r15
     512:	c3                   	ret    
     513:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     518:	48 8b 03             	mov    rax,QWORD PTR [rbx]
     51b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 522 <SV_MasterHeartbeat.constprop.3+0x132>
     522:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
     526:	31 c0                	xor    eax,eax
     528:	e8 00 00 00 00       	call   52d <SV_MasterHeartbeat.constprop.3+0x13d>
     52d:	48 8b 03             	mov    rax,QWORD PTR [rbx]
     530:	49 8d 77 20          	lea    rsi,[r15+0x20]
     534:	ba 05 00 00 00       	mov    edx,0x5
     539:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
     53e:	48 8b 78 08          	mov    rdi,QWORD PTR [rax+0x8]
     542:	e8 00 00 00 00       	call   547 <SV_MasterHeartbeat.constprop.3+0x157>
     547:	83 f8 02             	cmp    eax,0x2
     54a:	0f 84 c8 00 00 00    	je     618 <SV_MasterHeartbeat.constprop.3+0x228>
     550:	85 c0                	test   eax,eax
     552:	0f 85 cf 00 00 00    	jne    627 <SV_MasterHeartbeat.constprop.3+0x237>
     558:	48 8b 03             	mov    rax,QWORD PTR [rbx]
     55b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 562 <SV_MasterHeartbeat.constprop.3+0x172>
     562:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
     566:	31 c0                	xor    eax,eax
     568:	e8 00 00 00 00       	call   56d <SV_MasterHeartbeat.constprop.3+0x17d>
     56d:	e9 42 ff ff ff       	jmp    4b4 <SV_MasterHeartbeat.constprop.3+0xc4>
     572:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     578:	31 c0                	xor    eax,eax
     57a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 581 <SV_MasterHeartbeat.constprop.3+0x191>
     581:	e8 00 00 00 00       	call   586 <SV_MasterHeartbeat.constprop.3+0x196>
     586:	48 8b 03             	mov    rax,QWORD PTR [rbx]
     589:	ba 04 00 00 00       	mov    edx,0x4
     58e:	4c 89 fe             	mov    rsi,r15
     591:	48 8b 78 08          	mov    rdi,QWORD PTR [rax+0x8]
     595:	e8 00 00 00 00       	call   59a <SV_MasterHeartbeat.constprop.3+0x1aa>
     59a:	83 f8 02             	cmp    eax,0x2
     59d:	0f 84 ad 00 00 00    	je     650 <SV_MasterHeartbeat.constprop.3+0x260>
     5a3:	85 c0                	test   eax,eax
     5a5:	0f 85 b4 00 00 00    	jne    65f <SV_MasterHeartbeat.constprop.3+0x26f>
     5ab:	48 8b 03             	mov    rax,QWORD PTR [rbx]
     5ae:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5b5 <SV_MasterHeartbeat.constprop.3+0x1c5>
     5b5:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
     5b9:	31 c0                	xor    eax,eax
     5bb:	e8 00 00 00 00       	call   5c0 <SV_MasterHeartbeat.constprop.3+0x1d0>
     5c0:	e9 e9 fe ff ff       	jmp    4ae <SV_MasterHeartbeat.constprop.3+0xbe>
     5c5:	0f 1f 00             	nop    DWORD PTR [rax]
     5c8:	49 8d 77 20          	lea    rsi,[r15+0x20]
     5cc:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 5d3 <SV_MasterHeartbeat.constprop.3+0x1e3>
     5d3:	bf 01 00 00 00       	mov    edi,0x1
     5d8:	31 c0                	xor    eax,eax
     5da:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 5e1 <SV_MasterHeartbeat.constprop.3+0x1f1>
     5e1:	e8 00 00 00 00       	call   5e6 <SV_MasterHeartbeat.constprop.3+0x1f6>
     5e6:	e9 04 ff ff ff       	jmp    4ef <SV_MasterHeartbeat.constprop.3+0xff>
     5eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     5f0:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 5f7 <SV_MasterHeartbeat.constprop.3+0x207>
     5f7:	4c 89 fe             	mov    rsi,r15
     5fa:	bf 01 00 00 00       	mov    edi,0x1
     5ff:	31 c0                	xor    eax,eax
     601:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 608 <SV_MasterHeartbeat.constprop.3+0x218>
     608:	e8 00 00 00 00       	call   60d <SV_MasterHeartbeat.constprop.3+0x21d>
     60d:	e9 d1 fe ff ff       	jmp    4e3 <SV_MasterHeartbeat.constprop.3+0xf3>
     612:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     618:	bf 2e 6d 00 00       	mov    edi,0x6d2e
     61d:	e8 00 00 00 00       	call   622 <SV_MasterHeartbeat.constprop.3+0x232>
     622:	66 41 89 47 34       	mov    WORD PTR [r15+0x34],ax
     627:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
     62c:	e8 00 00 00 00       	call   631 <SV_MasterHeartbeat.constprop.3+0x241>
     631:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
     634:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 63b <SV_MasterHeartbeat.constprop.3+0x24b>
     63b:	48 8b 72 08          	mov    rsi,QWORD PTR [rdx+0x8]
     63f:	48 89 c2             	mov    rdx,rax
     642:	31 c0                	xor    eax,eax
     644:	e8 00 00 00 00       	call   649 <SV_MasterHeartbeat.constprop.3+0x259>
     649:	e9 66 fe ff ff       	jmp    4b4 <SV_MasterHeartbeat.constprop.3+0xc4>
     64e:	66 90                	xchg   ax,ax
     650:	bf 2e 6d 00 00       	mov    edi,0x6d2e
     655:	e8 00 00 00 00       	call   65a <SV_MasterHeartbeat.constprop.3+0x26a>
     65a:	66 41 89 47 14       	mov    WORD PTR [r15+0x14],ax
     65f:	4c 89 ff             	mov    rdi,r15
     662:	e8 00 00 00 00       	call   667 <SV_MasterHeartbeat.constprop.3+0x277>
     667:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
     66a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 671 <SV_MasterHeartbeat.constprop.3+0x281>
     671:	48 8b 72 08          	mov    rsi,QWORD PTR [rdx+0x8]
     675:	48 89 c2             	mov    rdx,rax
     678:	31 c0                	xor    eax,eax
     67a:	e8 00 00 00 00       	call   67f <SV_MasterHeartbeat.constprop.3+0x28f>
     67f:	e9 2a fe ff ff       	jmp    4ae <SV_MasterHeartbeat.constprop.3+0xbe>
     684:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
     68b:	00 00 00 00 
     68f:	90                   	nop

0000000000000690 <SV_AddServerCommand>:
SV_AddServerCommand():
     690:	83 3f 02             	cmp    DWORD PTR [rdi],0x2
     693:	76 3b                	jbe    6d0 <SV_AddServerCommand+0x40>
     695:	8b 87 04 04 01 00    	mov    eax,DWORD PTR [rdi+0x10404]
     69b:	83 c0 01             	add    eax,0x1
     69e:	89 c2                	mov    edx,eax
     6a0:	2b 97 08 04 01 00    	sub    edx,DWORD PTR [rdi+0x10408]
     6a6:	89 87 04 04 01 00    	mov    DWORD PTR [rdi+0x10404],eax
     6ac:	83 fa 41             	cmp    edx,0x41
     6af:	74 27                	je     6d8 <SV_AddServerCommand+0x48>
     6b1:	83 e0 3f             	and    eax,0x3f
     6b4:	ba 00 04 00 00       	mov    edx,0x400
     6b9:	48 c1 e0 0a          	shl    rax,0xa
     6bd:	48 8d bc 07 04 04 00 	lea    rdi,[rdi+rax*1+0x404]
     6c4:	00 
     6c5:	e9 00 00 00 00       	jmp    6ca <SV_AddServerCommand+0x3a>
     6ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     6d0:	c3                   	ret    
     6d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     6d8:	41 56                	push   r14
     6da:	31 c0                	xor    eax,eax
     6dc:	41 55                	push   r13
     6de:	41 54                	push   r12
     6e0:	55                   	push   rbp
     6e1:	48 89 f5             	mov    rbp,rsi
     6e4:	53                   	push   rbx
     6e5:	48 89 fb             	mov    rbx,rdi
     6e8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ef <SV_AddServerCommand+0x5f>
     6ef:	e8 00 00 00 00       	call   6f4 <SV_AddServerCommand+0x64>
     6f4:	8b 83 08 04 01 00    	mov    eax,DWORD PTR [rbx+0x10408]
     6fa:	44 8b a3 04 04 01 00 	mov    r12d,DWORD PTR [rbx+0x10404]
     701:	41 29 c4             	sub    r12d,eax
     704:	45 85 e4             	test   r12d,r12d
     707:	7e 6f                	jle    778 <SV_AddServerCommand+0xe8>
     709:	45 31 f6             	xor    r14d,r14d
     70c:	4c 8d 2d 00 00 00 00 	lea    r13,[rip+0x0]        # 713 <SV_AddServerCommand+0x83>
     713:	eb 09                	jmp    71e <SV_AddServerCommand+0x8e>
     715:	0f 1f 00             	nop    DWORD PTR [rax]
     718:	8b 83 08 04 01 00    	mov    eax,DWORD PTR [rbx+0x10408]
     71e:	41 8d 44 06 01       	lea    eax,[r14+rax*1+0x1]
     723:	44 89 f6             	mov    esi,r14d
     726:	4c 89 ef             	mov    rdi,r13
     729:	41 83 c6 01          	add    r14d,0x1
     72d:	83 e0 3f             	and    eax,0x3f
     730:	48 c1 e0 0a          	shl    rax,0xa
     734:	48 8d 94 03 04 04 00 	lea    rdx,[rbx+rax*1+0x404]
     73b:	00 
     73c:	31 c0                	xor    eax,eax
     73e:	e8 00 00 00 00       	call   743 <SV_AddServerCommand+0xb3>
     743:	45 39 f4             	cmp    r12d,r14d
     746:	75 d0                	jne    718 <SV_AddServerCommand+0x88>
     748:	44 89 e6             	mov    esi,r12d
     74b:	48 89 ea             	mov    rdx,rbp
     74e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 755 <SV_AddServerCommand+0xc5>
     755:	31 c0                	xor    eax,eax
     757:	e8 00 00 00 00       	call   75c <SV_AddServerCommand+0xcc>
     75c:	48 89 df             	mov    rdi,rbx
     75f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 766 <SV_AddServerCommand+0xd6>
     766:	5b                   	pop    rbx
     767:	5d                   	pop    rbp
     768:	41 5c                	pop    r12
     76a:	41 5d                	pop    r13
     76c:	41 5e                	pop    r14
     76e:	e9 00 00 00 00       	jmp    773 <SV_AddServerCommand+0xe3>
     773:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     778:	45 31 e4             	xor    r12d,r12d
     77b:	eb cb                	jmp    748 <SV_AddServerCommand+0xb8>
     77d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000000780 <SV_SendServerCommand>:
SV_SendServerCommand():
     780:	41 55                	push   r13
     782:	41 54                	push   r12
     784:	55                   	push   rbp
     785:	53                   	push   rbx
     786:	48 89 fb             	mov    rbx,rdi
     789:	48 81 ec 58 05 00 00 	sub    rsp,0x558
     790:	48 89 94 24 b0 04 00 	mov    QWORD PTR [rsp+0x4b0],rdx
     797:	00 
     798:	48 89 8c 24 b8 04 00 	mov    QWORD PTR [rsp+0x4b8],rcx
     79f:	00 
     7a0:	4c 89 84 24 c0 04 00 	mov    QWORD PTR [rsp+0x4c0],r8
     7a7:	00 
     7a8:	4c 89 8c 24 c8 04 00 	mov    QWORD PTR [rsp+0x4c8],r9
     7af:	00 
     7b0:	84 c0                	test   al,al
     7b2:	74 40                	je     7f4 <SV_SendServerCommand+0x74>
     7b4:	0f 29 84 24 d0 04 00 	movaps XMMWORD PTR [rsp+0x4d0],xmm0
     7bb:	00 
     7bc:	0f 29 8c 24 e0 04 00 	movaps XMMWORD PTR [rsp+0x4e0],xmm1
     7c3:	00 
     7c4:	0f 29 94 24 f0 04 00 	movaps XMMWORD PTR [rsp+0x4f0],xmm2
     7cb:	00 
     7cc:	0f 29 9c 24 00 05 00 	movaps XMMWORD PTR [rsp+0x500],xmm3
     7d3:	00 
     7d4:	0f 29 a4 24 10 05 00 	movaps XMMWORD PTR [rsp+0x510],xmm4
     7db:	00 
     7dc:	0f 29 ac 24 20 05 00 	movaps XMMWORD PTR [rsp+0x520],xmm5
     7e3:	00 
     7e4:	0f 29 b4 24 30 05 00 	movaps XMMWORD PTR [rsp+0x530],xmm6
     7eb:	00 
     7ec:	0f 29 bc 24 40 05 00 	movaps XMMWORD PTR [rsp+0x540],xmm7
     7f3:	00 
     7f4:	48 8d 84 24 80 05 00 	lea    rax,[rsp+0x580]
     7fb:	00 
     7fc:	4c 8d 6c 24 20       	lea    r13,[rsp+0x20]
     801:	48 89 f2             	mov    rdx,rsi
     804:	be 80 04 00 00       	mov    esi,0x480
     809:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
     80e:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
     813:	48 8d 84 24 a0 04 00 	lea    rax,[rsp+0x4a0]
     81a:	00 
     81b:	4c 89 ef             	mov    rdi,r13
     81e:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
     825:	00 
     826:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
     82d:	00 
     82e:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
     833:	e8 00 00 00 00       	call   838 <SV_SendServerCommand+0xb8>
     838:	41 89 c4             	mov    r12d,eax
     83b:	48 85 db             	test   rbx,rbx
     83e:	74 30                	je     870 <SV_SendServerCommand+0xf0>
     840:	3d fe 03 00 00       	cmp    eax,0x3fe
     845:	7e 0a                	jle    851 <SV_SendServerCommand+0xd1>
     847:	8b bb c8 dd 02 00    	mov    edi,DWORD PTR [rbx+0x2ddc8]
     84d:	85 ff                	test   edi,edi
     84f:	74 0b                	je     85c <SV_SendServerCommand+0xdc>
     851:	4c 89 ee             	mov    rsi,r13
     854:	48 89 df             	mov    rdi,rbx
     857:	e8 00 00 00 00       	call   85c <SV_SendServerCommand+0xdc>
     85c:	48 81 c4 58 05 00 00 	add    rsp,0x558
     863:	5b                   	pop    rbx
     864:	5d                   	pop    rbp
     865:	41 5c                	pop    r12
     867:	41 5d                	pop    r13
     869:	c3                   	ret    
     86a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     870:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 877 <SV_SendServerCommand+0xf7>
     877:	8b 70 30             	mov    esi,DWORD PTR [rax+0x30]
     87a:	85 f6                	test   esi,esi
     87c:	0f 84 91 00 00 00    	je     913 <SV_SendServerCommand+0x193>
     882:	b9 05 00 00 00       	mov    ecx,0x5
     887:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 88e <SV_SendServerCommand+0x10e>
     88e:	4c 89 ee             	mov    rsi,r13
     891:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
     893:	0f 97 c0             	seta   al
     896:	1c 00                	sbb    al,0x0
     898:	0f be c0             	movsx  eax,al
     89b:	85 c0                	test   eax,eax
     89d:	75 74                	jne    913 <SV_SendServerCommand+0x193>
     89f:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
     8a4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 8ab <SV_SendServerCommand+0x12b>
     8ab:	84 d2                	test   dl,dl
     8ad:	74 49                	je     8f8 <SV_SendServerCommand+0x178>
     8af:	4c 89 e9             	mov    rcx,r13
     8b2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 8b9 <SV_SendServerCommand+0x139>
     8b9:	eb 1e                	jmp    8d9 <SV_SendServerCommand+0x159>
     8bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     8c0:	48 98                	cdqe   
     8c2:	88 14 07             	mov    BYTE PTR [rdi+rax*1],dl
     8c5:	89 f0                	mov    eax,esi
     8c7:	48 83 c1 01          	add    rcx,0x1
     8cb:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
     8ce:	84 d2                	test   dl,dl
     8d0:	74 26                	je     8f8 <SV_SendServerCommand+0x178>
     8d2:	3d fc 07 00 00       	cmp    eax,0x7fc
     8d7:	7f 1f                	jg     8f8 <SV_SendServerCommand+0x178>
     8d9:	8d 70 01             	lea    esi,[rax+0x1]
     8dc:	80 fa 0a             	cmp    dl,0xa
     8df:	75 df                	jne    8c0 <SV_SendServerCommand+0x140>
     8e1:	48 63 d0             	movsxd rdx,eax
     8e4:	48 63 f6             	movsxd rsi,esi
     8e7:	83 c0 02             	add    eax,0x2
     8ea:	c6 04 17 5c          	mov    BYTE PTR [rdi+rdx*1],0x5c
     8ee:	c6 04 37 6e          	mov    BYTE PTR [rdi+rsi*1],0x6e
     8f2:	eb d3                	jmp    8c7 <SV_SendServerCommand+0x147>
     8f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     8f8:	48 98                	cdqe   
     8fa:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 901 <SV_SendServerCommand+0x181>
     901:	c6 04 07 00          	mov    BYTE PTR [rdi+rax*1],0x0
     905:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 90c <SV_SendServerCommand+0x18c>
     90c:	31 c0                	xor    eax,eax
     90e:	e8 00 00 00 00       	call   913 <SV_SendServerCommand+0x193>
     913:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 91a <SV_SendServerCommand+0x19a>
     91a:	48 8b 1d 00 00 00 00 	mov    rbx,QWORD PTR [rip+0x0]        # 921 <SV_SendServerCommand+0x1a1>
     921:	8b 48 30             	mov    ecx,DWORD PTR [rax+0x30]
     924:	85 c9                	test   ecx,ecx
     926:	0f 8e 30 ff ff ff    	jle    85c <SV_SendServerCommand+0xdc>
     92c:	31 ed                	xor    ebp,ebp
     92e:	66 90                	xchg   ax,ax
     930:	41 81 fc fe 03 00 00 	cmp    r12d,0x3fe
     937:	7e 0a                	jle    943 <SV_SendServerCommand+0x1c3>
     939:	8b 93 c8 dd 02 00    	mov    edx,DWORD PTR [rbx+0x2ddc8]
     93f:	85 d2                	test   edx,edx
     941:	74 12                	je     955 <SV_SendServerCommand+0x1d5>
     943:	4c 89 ee             	mov    rsi,r13
     946:	48 89 df             	mov    rdi,rbx
     949:	e8 00 00 00 00       	call   94e <SV_SendServerCommand+0x1ce>
     94e:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 955 <SV_SendServerCommand+0x1d5>
     955:	83 c5 01             	add    ebp,0x1
     958:	48 81 c3 e0 dd 02 00 	add    rbx,0x2dde0
     95f:	39 68 30             	cmp    DWORD PTR [rax+0x30],ebp
     962:	7f cc                	jg     930 <SV_SendServerCommand+0x1b0>
     964:	48 81 c4 58 05 00 00 	add    rsp,0x558
     96b:	5b                   	pop    rbx
     96c:	5d                   	pop    rbp
     96d:	41 5c                	pop    r12
     96f:	41 5d                	pop    r13
     971:	c3                   	ret    
     972:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
     979:	00 00 00 00 
     97d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000000980 <SV_MasterShutdown>:
SV_MasterShutdown():
     980:	48 83 ec 08          	sub    rsp,0x8
     984:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 98a <SV_MasterShutdown+0xa>
     98a:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 990 <SV_MasterShutdown+0x10>
     990:	e8 5b fa ff ff       	call   3f0 <SV_MasterHeartbeat.constprop.3>
     995:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 99b <SV_MasterShutdown+0x1b>
     99b:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 9a1 <SV_MasterShutdown+0x21>
     9a1:	48 83 c4 08          	add    rsp,0x8
     9a5:	e9 46 fa ff ff       	jmp    3f0 <SV_MasterHeartbeat.constprop.3>
     9aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000009b0 <SVC_RateLimit>:
SVC_RateLimit():
     9b0:	41 54                	push   r12
     9b2:	41 89 d4             	mov    r12d,edx
     9b5:	55                   	push   rbp
     9b6:	89 f5                	mov    ebp,esi
     9b8:	53                   	push   rbx
     9b9:	48 89 fb             	mov    rbx,rdi
     9bc:	e8 00 00 00 00       	call   9c1 <SVC_RateLimit+0x11>
     9c1:	8b 4b 04             	mov    ecx,DWORD PTR [rbx+0x4]
     9c4:	89 c7                	mov    edi,eax
     9c6:	2b 3b                	sub    edi,DWORD PTR [rbx]
     9c8:	41 89 c0             	mov    r8d,eax
     9cb:	89 f8                	mov    eax,edi
     9cd:	99                   	cdq    
     9ce:	41 f7 fc             	idiv   r12d
     9d1:	85 ff                	test   edi,edi
     9d3:	78 04                	js     9d9 <SVC_RateLimit+0x29>
     9d5:	39 c1                	cmp    ecx,eax
     9d7:	7d 27                	jge    a00 <SVC_RateLimit+0x50>
     9d9:	c7 43 04 00 00 00 00 	mov    DWORD PTR [rbx+0x4],0x0
     9e0:	31 c9                	xor    ecx,ecx
     9e2:	44 89 03             	mov    DWORD PTR [rbx],r8d
     9e5:	b8 01 00 00 00       	mov    eax,0x1
     9ea:	39 cd                	cmp    ebp,ecx
     9ec:	7e 08                	jle    9f6 <SVC_RateLimit+0x46>
     9ee:	83 c1 01             	add    ecx,0x1
     9f1:	31 c0                	xor    eax,eax
     9f3:	89 4b 04             	mov    DWORD PTR [rbx+0x4],ecx
     9f6:	5b                   	pop    rbx
     9f7:	5d                   	pop    rbp
     9f8:	41 5c                	pop    r12
     9fa:	c3                   	ret    
     9fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     a00:	29 c1                	sub    ecx,eax
     a02:	41 29 d0             	sub    r8d,edx
     a05:	89 4b 04             	mov    DWORD PTR [rbx+0x4],ecx
     a08:	44 89 03             	mov    DWORD PTR [rbx],r8d
     a0b:	eb d8                	jmp    9e5 <SVC_RateLimit+0x35>
     a0d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000000a10 <SVC_RateLimitAddress>:
SVC_RateLimitAddress():
     a10:	55                   	push   rbp
     a11:	89 f5                	mov    ebp,esi
     a13:	89 d6                	mov    esi,edx
     a15:	53                   	push   rbx
     a16:	89 d3                	mov    ebx,edx
     a18:	48 83 ec 08          	sub    rsp,0x8
     a1c:	e8 df f6 ff ff       	call   100 <SVC_BucketForAddress.isra.1>
     a21:	48 85 c0             	test   rax,rax
     a24:	74 1a                	je     a40 <SVC_RateLimitAddress+0x30>
     a26:	48 83 c4 08          	add    rsp,0x8
     a2a:	89 da                	mov    edx,ebx
     a2c:	48 8d 78 14          	lea    rdi,[rax+0x14]
     a30:	89 ee                	mov    esi,ebp
     a32:	5b                   	pop    rbx
     a33:	5d                   	pop    rbp
     a34:	e9 77 ff ff ff       	jmp    9b0 <SVC_RateLimit>
     a39:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     a40:	48 83 c4 08          	add    rsp,0x8
     a44:	b8 01 00 00 00       	mov    eax,0x1
     a49:	5b                   	pop    rbx
     a4a:	5d                   	pop    rbp
     a4b:	c3                   	ret    
     a4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000000a50 <SVC_RemoteCommand>:
SVC_RemoteCommand():
     a50:	55                   	push   rbp
     a51:	ba e8 03 00 00       	mov    edx,0x3e8
     a56:	be 0a 00 00 00       	mov    esi,0xa
     a5b:	53                   	push   rbx
     a5c:	48 89 fb             	mov    rbx,rdi
     a5f:	48 81 ec f8 03 00 00 	sub    rsp,0x3f8
     a66:	e8 00 00 00 00       	call   a6b <SVC_RemoteCommand+0x1b>
     a6b:	85 c0                	test   eax,eax
     a6d:	74 21                	je     a90 <SVC_RemoteCommand+0x40>
     a6f:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # a76 <SVC_RemoteCommand+0x26>
     a76:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
     a79:	85 c0                	test   eax,eax
     a7b:	0f 85 ef 01 00 00    	jne    c70 <SVC_RemoteCommand+0x220>
     a81:	48 81 c4 f8 03 00 00 	add    rsp,0x3f8
     a88:	5b                   	pop    rbx
     a89:	5d                   	pop    rbp
     a8a:	c3                   	ret    
     a8b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     a90:	bf 01 00 00 00       	mov    edi,0x1
     a95:	e8 00 00 00 00       	call   a9a <SVC_RemoteCommand+0x4a>
     a9a:	48 89 c5             	mov    rbp,rax
     a9d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # aa4 <SVC_RemoteCommand+0x54>
     aa4:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
     aa8:	80 3e 00             	cmp    BYTE PTR [rsi],0x0
     aab:	74 0c                	je     ab9 <SVC_RemoteCommand+0x69>
     aad:	48 89 ef             	mov    rdi,rbp
     ab0:	e8 00 00 00 00       	call   ab5 <SVC_RemoteCommand+0x65>
     ab5:	85 c0                	test   eax,eax
     ab7:	74 24                	je     add <SVC_RemoteCommand+0x8d>
     ab9:	80 3d 00 00 00 00 00 	cmp    BYTE PTR [rip+0x0],0x0        # ac0 <SVC_RemoteCommand+0x70>
     ac0:	0f 84 02 01 00 00    	je     bc8 <SVC_RemoteCommand+0x178>
     ac6:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # acd <SVC_RemoteCommand+0x7d>
     acd:	48 89 ef             	mov    rdi,rbp
     ad0:	e8 00 00 00 00       	call   ad5 <SVC_RemoteCommand+0x85>
     ad5:	85 c0                	test   eax,eax
     ad7:	0f 85 eb 00 00 00    	jne    bc8 <SVC_RemoteCommand+0x178>
     add:	bf 02 00 00 00       	mov    edi,0x2
     ae2:	e8 00 00 00 00       	call   ae7 <SVC_RemoteCommand+0x97>
     ae7:	48 89 df             	mov    rdi,rbx
     aea:	48 89 c5             	mov    rbp,rax
     aed:	e8 00 00 00 00       	call   af2 <SVC_RemoteCommand+0xa2>
     af2:	48 89 ea             	mov    rdx,rbp
     af5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # afc <SVC_RemoteCommand+0xac>
     afc:	48 89 c6             	mov    rsi,rax
     aff:	31 c0                	xor    eax,eax
     b01:	e8 00 00 00 00       	call   b06 <SVC_RemoteCommand+0xb6>
     b06:	f3 0f 6f 03          	movdqu xmm0,XMMWORD PTR [rbx]
     b0a:	48 89 e7             	mov    rdi,rsp
     b0d:	48 8d 15 bc f5 ff ff 	lea    rdx,[rip+0xfffffffffffff5bc]        # d0 <SV_FlushRedirect>
     b14:	be f0 03 00 00       	mov    esi,0x3f0
     b19:	0f 29 05 00 00 00 00 	movaps XMMWORD PTR [rip+0x0],xmm0        # b20 <SVC_RemoteCommand+0xd0>
     b20:	f3 0f 6f 4b 10       	movdqu xmm1,XMMWORD PTR [rbx+0x10]
     b25:	0f 29 0d 00 00 00 00 	movaps XMMWORD PTR [rip+0x0],xmm1        # b2c <SVC_RemoteCommand+0xdc>
     b2c:	e8 00 00 00 00       	call   b31 <SVC_RemoteCommand+0xe1>
     b31:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # b38 <SVC_RemoteCommand+0xe8>
     b38:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
     b3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
     b3f:	0a 05 00 00 00 00    	or     al,BYTE PTR [rip+0x0]        # b45 <SVC_RemoteCommand+0xf5>
     b45:	0f 84 65 01 00 00    	je     cb0 <SVC_RemoteCommand+0x260>
     b4b:	e8 00 00 00 00       	call   b50 <SVC_RemoteCommand+0x100>
     b50:	0f b6 10             	movzx  edx,BYTE PTR [rax]
     b53:	84 d2                	test   dl,dl
     b55:	75 14                	jne    b6b <SVC_RemoteCommand+0x11b>
     b57:	eb 17                	jmp    b70 <SVC_RemoteCommand+0x120>
     b59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     b60:	48 83 c0 01          	add    rax,0x1
     b64:	0f b6 10             	movzx  edx,BYTE PTR [rax]
     b67:	84 d2                	test   dl,dl
     b69:	74 05                	je     b70 <SVC_RemoteCommand+0x120>
     b6b:	80 fa 20             	cmp    dl,0x20
     b6e:	7e f0                	jle    b60 <SVC_RemoteCommand+0x110>
     b70:	48 8d 78 04          	lea    rdi,[rax+0x4]
     b74:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
     b78:	3c 20                	cmp    al,0x20
     b7a:	75 0f                	jne    b8b <SVC_RemoteCommand+0x13b>
     b7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     b80:	48 83 c7 01          	add    rdi,0x1
     b84:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
     b87:	3c 20                	cmp    al,0x20
     b89:	74 f5                	je     b80 <SVC_RemoteCommand+0x130>
     b8b:	3c 22                	cmp    al,0x22
     b8d:	75 0d                	jne    b9c <SVC_RemoteCommand+0x14c>
     b8f:	e9 2c 01 00 00       	jmp    cc0 <SVC_RemoteCommand+0x270>
     b94:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     b98:	48 83 c7 01          	add    rdi,0x1
     b9c:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
     b9f:	a8 df                	test   al,0xdf
     ba1:	75 f5                	jne    b98 <SVC_RemoteCommand+0x148>
     ba3:	3c 20                	cmp    al,0x20
     ba5:	75 12                	jne    bb9 <SVC_RemoteCommand+0x169>
     ba7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
     bae:	00 00 
     bb0:	48 83 c7 01          	add    rdi,0x1
     bb4:	80 3f 20             	cmp    BYTE PTR [rdi],0x20
     bb7:	74 f7                	je     bb0 <SVC_RemoteCommand+0x160>
     bb9:	e8 00 00 00 00       	call   bbe <SVC_RemoteCommand+0x16e>
     bbe:	e9 9b 00 00 00       	jmp    c5e <SVC_RemoteCommand+0x20e>
     bc3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     bc8:	ba e8 03 00 00       	mov    edx,0x3e8
     bcd:	be 0a 00 00 00       	mov    esi,0xa
     bd2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # bd9 <SVC_RemoteCommand+0x189>
     bd9:	e8 00 00 00 00       	call   bde <SVC_RemoteCommand+0x18e>
     bde:	85 c0                	test   eax,eax
     be0:	0f 85 b2 00 00 00    	jne    c98 <SVC_RemoteCommand+0x248>
     be6:	bf 02 00 00 00       	mov    edi,0x2
     beb:	e8 00 00 00 00       	call   bf0 <SVC_RemoteCommand+0x1a0>
     bf0:	48 89 df             	mov    rdi,rbx
     bf3:	48 89 c5             	mov    rbp,rax
     bf6:	e8 00 00 00 00       	call   bfb <SVC_RemoteCommand+0x1ab>
     bfb:	48 89 ea             	mov    rdx,rbp
     bfe:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # c05 <SVC_RemoteCommand+0x1b5>
     c05:	48 89 c6             	mov    rsi,rax
     c08:	31 c0                	xor    eax,eax
     c0a:	e8 00 00 00 00       	call   c0f <SVC_RemoteCommand+0x1bf>
     c0f:	f3 0f 6f 13          	movdqu xmm2,XMMWORD PTR [rbx]
     c13:	48 89 e7             	mov    rdi,rsp
     c16:	48 8d 15 b3 f4 ff ff 	lea    rdx,[rip+0xfffffffffffff4b3]        # d0 <SV_FlushRedirect>
     c1d:	be f0 03 00 00       	mov    esi,0x3f0
     c22:	0f 29 15 00 00 00 00 	movaps XMMWORD PTR [rip+0x0],xmm2        # c29 <SVC_RemoteCommand+0x1d9>
     c29:	f3 0f 6f 5b 10       	movdqu xmm3,XMMWORD PTR [rbx+0x10]
     c2e:	0f 29 1d 00 00 00 00 	movaps XMMWORD PTR [rip+0x0],xmm3        # c35 <SVC_RemoteCommand+0x1e5>
     c35:	e8 00 00 00 00       	call   c3a <SVC_RemoteCommand+0x1ea>
     c3a:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # c41 <SVC_RemoteCommand+0x1f1>
     c41:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
     c45:	0f b6 00             	movzx  eax,BYTE PTR [rax]
     c48:	0a 05 00 00 00 00    	or     al,BYTE PTR [rip+0x0]        # c4e <SVC_RemoteCommand+0x1fe>
     c4e:	74 60                	je     cb0 <SVC_RemoteCommand+0x260>
     c50:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # c57 <SVC_RemoteCommand+0x207>
     c57:	31 c0                	xor    eax,eax
     c59:	e8 00 00 00 00       	call   c5e <SVC_RemoteCommand+0x20e>
     c5e:	e8 00 00 00 00       	call   c63 <SVC_RemoteCommand+0x213>
     c63:	48 81 c4 f8 03 00 00 	add    rsp,0x3f8
     c6a:	5b                   	pop    rbx
     c6b:	5d                   	pop    rbp
     c6c:	c3                   	ret    
     c6d:	0f 1f 00             	nop    DWORD PTR [rax]
     c70:	48 89 df             	mov    rdi,rbx
     c73:	e8 00 00 00 00       	call   c78 <SVC_RemoteCommand+0x228>
     c78:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # c7f <SVC_RemoteCommand+0x22f>
     c7f:	48 89 c6             	mov    rsi,rax
     c82:	31 c0                	xor    eax,eax
     c84:	e8 00 00 00 00       	call   c89 <SVC_RemoteCommand+0x239>
     c89:	48 81 c4 f8 03 00 00 	add    rsp,0x3f8
     c90:	5b                   	pop    rbx
     c91:	5d                   	pop    rbp
     c92:	c3                   	ret    
     c93:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     c98:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # c9f <SVC_RemoteCommand+0x24f>
     c9f:	31 c0                	xor    eax,eax
     ca1:	e8 00 00 00 00       	call   ca6 <SVC_RemoteCommand+0x256>
     ca6:	e9 d6 fd ff ff       	jmp    a81 <SVC_RemoteCommand+0x31>
     cab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     cb0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # cb7 <SVC_RemoteCommand+0x267>
     cb7:	31 c0                	xor    eax,eax
     cb9:	e8 00 00 00 00       	call   cbe <SVC_RemoteCommand+0x26e>
     cbe:	eb 9e                	jmp    c5e <SVC_RemoteCommand+0x20e>
     cc0:	0f b6 47 01          	movzx  eax,BYTE PTR [rdi+0x1]
     cc4:	48 8d 57 01          	lea    rdx,[rdi+0x1]
     cc8:	3c 22                	cmp    al,0x22
     cca:	74 13                	je     cdf <SVC_RemoteCommand+0x28f>
     ccc:	84 c0                	test   al,al
     cce:	74 0f                	je     cdf <SVC_RemoteCommand+0x28f>
     cd0:	48 83 c2 01          	add    rdx,0x1
     cd4:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
     cd7:	84 c0                	test   al,al
     cd9:	74 04                	je     cdf <SVC_RemoteCommand+0x28f>
     cdb:	3c 22                	cmp    al,0x22
     cdd:	75 f1                	jne    cd0 <SVC_RemoteCommand+0x280>
     cdf:	3c 22                	cmp    al,0x22
     ce1:	74 0d                	je     cf0 <SVC_RemoteCommand+0x2a0>
     ce3:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
     ce6:	48 89 d7             	mov    rdi,rdx
     ce9:	e9 b5 fe ff ff       	jmp    ba3 <SVC_RemoteCommand+0x153>
     cee:	66 90                	xchg   ax,ax
     cf0:	48 8d 7a 01          	lea    rdi,[rdx+0x1]
     cf4:	0f b6 42 01          	movzx  eax,BYTE PTR [rdx+0x1]
     cf8:	e9 a6 fe ff ff       	jmp    ba3 <SVC_RemoteCommand+0x153>
     cfd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000000d00 <SVC_Status>:
SVC_Status():
     d00:	41 57                	push   r15
     d02:	ba e8 03 00 00       	mov    edx,0x3e8
     d07:	be 0a 00 00 00       	mov    esi,0xa
     d0c:	41 56                	push   r14
     d0e:	41 55                	push   r13
     d10:	41 54                	push   r12
     d12:	55                   	push   rbp
     d13:	48 89 fd             	mov    rbp,rdi
     d16:	53                   	push   rbx
     d17:	48 81 ec 88 0a 00 00 	sub    rsp,0xa88
     d1e:	e8 00 00 00 00       	call   d23 <SVC_Status+0x23>
     d23:	85 c0                	test   eax,eax
     d25:	74 29                	je     d50 <SVC_Status+0x50>
     d27:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # d2e <SVC_Status+0x2e>
     d2e:	8b 48 30             	mov    ecx,DWORD PTR [rax+0x30]
     d31:	85 c9                	test   ecx,ecx
     d33:	0f 85 97 01 00 00    	jne    ed0 <SVC_Status+0x1d0>
     d39:	48 81 c4 88 0a 00 00 	add    rsp,0xa88
     d40:	5b                   	pop    rbx
     d41:	5d                   	pop    rbp
     d42:	41 5c                	pop    r12
     d44:	41 5d                	pop    r13
     d46:	41 5e                	pop    r14
     d48:	41 5f                	pop    r15
     d4a:	c3                   	ret    
     d4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     d50:	ba 64 00 00 00       	mov    edx,0x64
     d55:	be 0a 00 00 00       	mov    esi,0xa
     d5a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # d61 <SVC_Status+0x61>
     d61:	e8 00 00 00 00       	call   d66 <SVC_Status+0x66>
     d66:	85 c0                	test   eax,eax
     d68:	0f 85 82 01 00 00    	jne    ef0 <SVC_Status+0x1f0>
     d6e:	bf 01 00 00 00       	mov    edi,0x1
     d73:	e8 00 00 00 00       	call   d78 <SVC_Status+0x78>
     d78:	48 89 c7             	mov    rdi,rax
     d7b:	e8 00 00 00 00       	call   d80 <SVC_Status+0x80>
     d80:	48 3d 80 00 00 00    	cmp    rax,0x80
     d86:	77 b1                	ja     d39 <SVC_Status+0x39>
     d88:	31 f6                	xor    esi,esi
     d8a:	bf 04 00 00 00       	mov    edi,0x4
     d8f:	e8 00 00 00 00       	call   d94 <SVC_Status+0x94>
     d94:	48 8d 4c 24 60       	lea    rcx,[rsp+0x60]
     d99:	ba a0 04 00 00       	mov    edx,0x4a0
     d9e:	48 89 cf             	mov    rdi,rcx
     da1:	48 89 c6             	mov    rsi,rax
     da4:	48 89 cb             	mov    rbx,rcx
     da7:	48 89 4c 24 10       	mov    QWORD PTR [rsp+0x10],rcx
     dac:	e8 00 00 00 00       	call   db1 <SVC_Status+0xb1>
     db1:	bf 01 00 00 00       	mov    edi,0x1
     db6:	e8 00 00 00 00       	call   dbb <SVC_Status+0xbb>
     dbb:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # dc2 <SVC_Status+0xc2>
     dc2:	be 00 04 00 00       	mov    esi,0x400
     dc7:	48 89 df             	mov    rdi,rbx
     dca:	48 89 c1             	mov    rcx,rax
     dcd:	e8 00 00 00 00       	call   dd2 <SVC_Status+0xd2>
     dd2:	c6 84 24 00 05 00 00 	mov    BYTE PTR [rsp+0x500],0x0
     dd9:	00 
     dda:	8b 13                	mov    edx,DWORD PTR [rbx]
     ddc:	48 83 c3 04          	add    rbx,0x4
     de0:	8d 82 ff fe fe fe    	lea    eax,[rdx-0x1010101]
     de6:	f7 d2                	not    edx
     de8:	21 d0                	and    eax,edx
     dea:	25 80 80 80 80       	and    eax,0x80808080
     def:	74 e9                	je     dda <SVC_Status+0xda>
     df1:	89 c2                	mov    edx,eax
     df3:	c1 ea 10             	shr    edx,0x10
     df6:	a9 80 80 00 00       	test   eax,0x8080
     dfb:	0f 44 c2             	cmove  eax,edx
     dfe:	48 8d 53 02          	lea    rdx,[rbx+0x2]
     e02:	48 0f 44 da          	cmove  rbx,rdx
     e06:	89 c1                	mov    ecx,eax
     e08:	00 c1                	add    cl,al
     e0a:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # e11 <SVC_Status+0x111>
     e11:	48 83 db 03          	sbb    rbx,0x3
     e15:	48 2b 5c 24 10       	sub    rbx,QWORD PTR [rsp+0x10]
     e1a:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
     e1d:	83 c3 10             	add    ebx,0x10
     e20:	85 d2                	test   edx,edx
     e22:	0f 8e db 00 00 00    	jle    f03 <SVC_Status+0x203>
     e28:	48 8d 8c 24 00 05 00 	lea    rcx,[rsp+0x500]
     e2f:	00 
     e30:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
     e35:	45 31 f6             	xor    r14d,r14d
     e38:	45 31 ff             	xor    r15d,r15d
     e3b:	48 89 4c 24 18       	mov    QWORD PTR [rsp+0x18],rcx
     e40:	49 89 cd             	mov    r13,rcx
     e43:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
     e48:	eb 1b                	jmp    e65 <SVC_Status+0x165>
     e4a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     e50:	41 83 c7 01          	add    r15d,0x1
     e54:	49 81 c6 e0 dd 02 00 	add    r14,0x2dde0
     e5b:	44 39 78 30          	cmp    DWORD PTR [rax+0x30],r15d
     e5f:	0f 8e ab 00 00 00    	jle    f10 <SVC_Status+0x210>
     e65:	4c 8b 25 00 00 00 00 	mov    r12,QWORD PTR [rip+0x0]        # e6c <SVC_Status+0x16c>
     e6c:	4d 01 f4             	add    r12,r14
     e6f:	41 83 3c 24 01       	cmp    DWORD PTR [r12],0x1
     e74:	76 da                	jbe    e50 <SVC_Status+0x150>
     e76:	44 89 ff             	mov    edi,r15d
     e79:	e8 00 00 00 00       	call   e7e <SVC_Status+0x17e>
     e7e:	4d 8d 8c 24 40 08 01 	lea    r9,[r12+0x10840]
     e85:	00 
     e86:	be 40 00 00 00       	mov    esi,0x40
     e8b:	45 8b 84 24 20 4d 02 	mov    r8d,DWORD PTR [r12+0x24d20]
     e92:	00 
     e93:	4c 8b 64 24 08       	mov    r12,QWORD PTR [rsp+0x8]
     e98:	8b 88 f8 00 00 00    	mov    ecx,DWORD PTR [rax+0xf8]
     e9e:	31 c0                	xor    eax,eax
     ea0:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # ea7 <SVC_Status+0x1a7>
     ea7:	4c 89 e7             	mov    rdi,r12
     eaa:	e8 00 00 00 00       	call   eaf <SVC_Status+0x1af>
     eaf:	01 c3                	add    ebx,eax
     eb1:	81 fb 73 05 00 00    	cmp    ebx,0x573
     eb7:	7f 57                	jg     f10 <SVC_Status+0x210>
     eb9:	4c 89 ef             	mov    rdi,r13
     ebc:	4c 89 e6             	mov    rsi,r12
     ebf:	e8 00 00 00 00       	call   ec4 <SVC_Status+0x1c4>
     ec4:	49 89 c5             	mov    r13,rax
     ec7:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # ece <SVC_Status+0x1ce>
     ece:	eb 80                	jmp    e50 <SVC_Status+0x150>
     ed0:	48 89 ef             	mov    rdi,rbp
     ed3:	e8 00 00 00 00       	call   ed8 <SVC_Status+0x1d8>
     ed8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # edf <SVC_Status+0x1df>
     edf:	48 89 c6             	mov    rsi,rax
     ee2:	31 c0                	xor    eax,eax
     ee4:	e8 00 00 00 00       	call   ee9 <SVC_Status+0x1e9>
     ee9:	e9 4b fe ff ff       	jmp    d39 <SVC_Status+0x39>
     eee:	66 90                	xchg   ax,ax
     ef0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # ef7 <SVC_Status+0x1f7>
     ef7:	31 c0                	xor    eax,eax
     ef9:	e8 00 00 00 00       	call   efe <SVC_Status+0x1fe>
     efe:	e9 36 fe ff ff       	jmp    d39 <SVC_Status+0x39>
     f03:	48 8d 84 24 00 05 00 	lea    rax,[rsp+0x500]
     f0a:	00 
     f0b:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
     f10:	4c 8b 44 24 18       	mov    r8,QWORD PTR [rsp+0x18]
     f15:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
     f1a:	48 89 ee             	mov    rsi,rbp
     f1d:	31 c0                	xor    eax,eax
     f1f:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # f26 <SVC_Status+0x226>
     f26:	bf 01 00 00 00       	mov    edi,0x1
     f2b:	e8 00 00 00 00       	call   f30 <SVC_Status+0x230>
     f30:	e9 04 fe ff ff       	jmp    d39 <SVC_Status+0x39>
     f35:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
     f3c:	00 00 00 00 

0000000000000f40 <SVC_Info>:
SVC_Info():
     f40:	41 55                	push   r13
     f42:	ba e8 03 00 00       	mov    edx,0x3e8
     f47:	be 0a 00 00 00       	mov    esi,0xa
     f4c:	49 89 fd             	mov    r13,rdi
     f4f:	41 54                	push   r12
     f51:	55                   	push   rbp
     f52:	53                   	push   rbx
     f53:	48 81 ec 08 04 00 00 	sub    rsp,0x408
     f5a:	e8 00 00 00 00       	call   f5f <SVC_Info+0x1f>
     f5f:	85 c0                	test   eax,eax
     f61:	74 25                	je     f88 <SVC_Info+0x48>
     f63:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # f6a <SVC_Info+0x2a>
     f6a:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
     f6d:	85 c0                	test   eax,eax
     f6f:	0f 85 9b 02 00 00    	jne    1210 <SVC_Info+0x2d0>
     f75:	48 81 c4 08 04 00 00 	add    rsp,0x408
     f7c:	5b                   	pop    rbx
     f7d:	5d                   	pop    rbp
     f7e:	41 5c                	pop    r12
     f80:	41 5d                	pop    r13
     f82:	c3                   	ret    
     f83:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     f88:	ba 64 00 00 00       	mov    edx,0x64
     f8d:	be 0a 00 00 00       	mov    esi,0xa
     f92:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # f99 <SVC_Info+0x59>
     f99:	e8 00 00 00 00       	call   f9e <SVC_Info+0x5e>
     f9e:	85 c0                	test   eax,eax
     fa0:	0f 85 9a 02 00 00    	jne    1240 <SVC_Info+0x300>
     fa6:	bf 01 00 00 00       	mov    edi,0x1
     fab:	e8 00 00 00 00       	call   fb0 <SVC_Info+0x70>
     fb0:	48 89 c7             	mov    rdi,rax
     fb3:	e8 00 00 00 00       	call   fb8 <SVC_Info+0x78>
     fb8:	48 3d 80 00 00 00    	cmp    rax,0x80
     fbe:	77 b5                	ja     f75 <SVC_Info+0x35>
     fc0:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # fc7 <SVC_Info+0x87>
     fc7:	8b 48 30             	mov    ecx,DWORD PTR [rax+0x30]
     fca:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # fd1 <SVC_Info+0x91>
     fd1:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
     fd4:	39 d1                	cmp    ecx,edx
     fd6:	0f 8d a4 02 00 00    	jge    1280 <SVC_Info+0x340>
     fdc:	83 ea 01             	sub    edx,0x1
     fdf:	48 63 f9             	movsxd rdi,ecx
     fe2:	48 8b 35 00 00 00 00 	mov    rsi,QWORD PTR [rip+0x0]        # fe9 <SVC_Info+0xa9>
     fe9:	31 ed                	xor    ebp,ebp
     feb:	29 ca                	sub    edx,ecx
     fed:	48 69 c7 e0 dd 02 00 	imul   rax,rdi,0x2dde0
     ff4:	45 31 e4             	xor    r12d,r12d
     ff7:	48 01 fa             	add    rdx,rdi
     ffa:	48 69 d2 e0 dd 02 00 	imul   rdx,rdx,0x2dde0
    1001:	48 01 f0             	add    rax,rsi
    1004:	48 8d 8c 16 e0 dd 02 	lea    rcx,[rsi+rdx*1+0x2dde0]
    100b:	00 
    100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1010:	83 38 01             	cmp    DWORD PTR [rax],0x1
    1013:	76 12                	jbe    1027 <SVC_Info+0xe7>
    1015:	31 d2                	xor    edx,edx
    1017:	41 83 c4 01          	add    r12d,0x1
    101b:	83 b8 40 4d 02 00 01 	cmp    DWORD PTR [rax+0x24d40],0x1
    1022:	0f 95 c2             	setne  dl
    1025:	01 d5                	add    ebp,edx
    1027:	48 05 e0 dd 02 00    	add    rax,0x2dde0
    102d:	48 39 c8             	cmp    rax,rcx
    1030:	75 de                	jne    1010 <SVC_Info+0xd0>
    1032:	bf 01 00 00 00       	mov    edi,0x1
    1037:	48 89 e3             	mov    rbx,rsp
    103a:	c6 04 24 00          	mov    BYTE PTR [rsp],0x0
    103e:	e8 00 00 00 00       	call   1043 <SVC_Info+0x103>
    1043:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 104a <SVC_Info+0x10a>
    104a:	be 00 04 00 00       	mov    esi,0x400
    104f:	48 89 df             	mov    rdi,rbx
    1052:	48 89 c1             	mov    rcx,rax
    1055:	e8 00 00 00 00       	call   105a <SVC_Info+0x11a>
    105a:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1061 <SVC_Info+0x121>
    1061:	be 00 04 00 00       	mov    esi,0x400
    1066:	48 89 df             	mov    rdi,rbx
    1069:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1070 <SVC_Info+0x130>
    1070:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    1074:	e8 00 00 00 00       	call   1079 <SVC_Info+0x139>
    1079:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1080 <SVC_Info+0x140>
    1080:	be 00 04 00 00       	mov    esi,0x400
    1085:	48 89 df             	mov    rdi,rbx
    1088:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 108f <SVC_Info+0x14f>
    108f:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    1093:	e8 00 00 00 00       	call   1098 <SVC_Info+0x158>
    1098:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 109f <SVC_Info+0x15f>
    109f:	be 00 04 00 00       	mov    esi,0x400
    10a4:	48 89 df             	mov    rdi,rbx
    10a7:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 10ae <SVC_Info+0x16e>
    10ae:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    10b2:	e8 00 00 00 00       	call   10b7 <SVC_Info+0x177>
    10b7:	44 89 e6             	mov    esi,r12d
    10ba:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 10c1 <SVC_Info+0x181>
    10c1:	31 c0                	xor    eax,eax
    10c3:	e8 00 00 00 00       	call   10c8 <SVC_Info+0x188>
    10c8:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 10cf <SVC_Info+0x18f>
    10cf:	be 00 04 00 00       	mov    esi,0x400
    10d4:	48 89 df             	mov    rdi,rbx
    10d7:	48 89 c1             	mov    rcx,rax
    10da:	e8 00 00 00 00       	call   10df <SVC_Info+0x19f>
    10df:	89 ee                	mov    esi,ebp
    10e1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 10e8 <SVC_Info+0x1a8>
    10e8:	31 c0                	xor    eax,eax
    10ea:	e8 00 00 00 00       	call   10ef <SVC_Info+0x1af>
    10ef:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 10f6 <SVC_Info+0x1b6>
    10f6:	be 00 04 00 00       	mov    esi,0x400
    10fb:	48 89 df             	mov    rdi,rbx
    10fe:	48 89 c1             	mov    rcx,rax
    1101:	e8 00 00 00 00       	call   1106 <SVC_Info+0x1c6>
    1106:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 110d <SVC_Info+0x1cd>
    110d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1114 <SVC_Info+0x1d4>
    1114:	8b 70 30             	mov    esi,DWORD PTR [rax+0x30]
    1117:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 111e <SVC_Info+0x1de>
    111e:	2b 70 30             	sub    esi,DWORD PTR [rax+0x30]
    1121:	31 c0                	xor    eax,eax
    1123:	e8 00 00 00 00       	call   1128 <SVC_Info+0x1e8>
    1128:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 112f <SVC_Info+0x1ef>
    112f:	be 00 04 00 00       	mov    esi,0x400
    1134:	48 89 df             	mov    rdi,rbx
    1137:	48 89 c1             	mov    rcx,rax
    113a:	e8 00 00 00 00       	call   113f <SVC_Info+0x1ff>
    113f:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1146 <SVC_Info+0x206>
    1146:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 114d <SVC_Info+0x20d>
    114d:	8b 70 30             	mov    esi,DWORD PTR [rax+0x30]
    1150:	31 c0                	xor    eax,eax
    1152:	e8 00 00 00 00       	call   1157 <SVC_Info+0x217>
    1157:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 115e <SVC_Info+0x21e>
    115e:	be 00 04 00 00       	mov    esi,0x400
    1163:	48 89 df             	mov    rdi,rbx
    1166:	48 89 c1             	mov    rcx,rax
    1169:	e8 00 00 00 00       	call   116e <SVC_Info+0x22e>
    116e:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1175 <SVC_Info+0x235>
    1175:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 117c <SVC_Info+0x23c>
    117c:	8b 70 30             	mov    esi,DWORD PTR [rax+0x30]
    117f:	31 c0                	xor    eax,eax
    1181:	e8 00 00 00 00       	call   1186 <SVC_Info+0x246>
    1186:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 118d <SVC_Info+0x24d>
    118d:	be 00 04 00 00       	mov    esi,0x400
    1192:	48 89 df             	mov    rdi,rbx
    1195:	48 89 c1             	mov    rcx,rax
    1198:	e8 00 00 00 00       	call   119d <SVC_Info+0x25d>
    119d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 11a4 <SVC_Info+0x264>
    11a4:	e8 00 00 00 00       	call   11a9 <SVC_Info+0x269>
    11a9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 11b0 <SVC_Info+0x270>
    11b0:	89 c6                	mov    esi,eax
    11b2:	31 c0                	xor    eax,eax
    11b4:	e8 00 00 00 00       	call   11b9 <SVC_Info+0x279>
    11b9:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 11c0 <SVC_Info+0x280>
    11c0:	be 00 04 00 00       	mov    esi,0x400
    11c5:	48 89 df             	mov    rdi,rbx
    11c8:	48 89 c1             	mov    rcx,rax
    11cb:	e8 00 00 00 00       	call   11d0 <SVC_Info+0x290>
    11d0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 11d7 <SVC_Info+0x297>
    11d7:	e8 00 00 00 00       	call   11dc <SVC_Info+0x29c>
    11dc:	80 38 00             	cmp    BYTE PTR [rax],0x0
    11df:	75 7f                	jne    1260 <SVC_Info+0x320>
    11e1:	48 89 d9             	mov    rcx,rbx
    11e4:	4c 89 ee             	mov    rsi,r13
    11e7:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 11ee <SVC_Info+0x2ae>
    11ee:	31 c0                	xor    eax,eax
    11f0:	bf 01 00 00 00       	mov    edi,0x1
    11f5:	e8 00 00 00 00       	call   11fa <SVC_Info+0x2ba>
    11fa:	48 81 c4 08 04 00 00 	add    rsp,0x408
    1201:	5b                   	pop    rbx
    1202:	5d                   	pop    rbp
    1203:	41 5c                	pop    r12
    1205:	41 5d                	pop    r13
    1207:	c3                   	ret    
    1208:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    120f:	00 
    1210:	4c 89 ef             	mov    rdi,r13
    1213:	e8 00 00 00 00       	call   1218 <SVC_Info+0x2d8>
    1218:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 121f <SVC_Info+0x2df>
    121f:	48 89 c6             	mov    rsi,rax
    1222:	31 c0                	xor    eax,eax
    1224:	e8 00 00 00 00       	call   1229 <SVC_Info+0x2e9>
    1229:	48 81 c4 08 04 00 00 	add    rsp,0x408
    1230:	5b                   	pop    rbx
    1231:	5d                   	pop    rbp
    1232:	41 5c                	pop    r12
    1234:	41 5d                	pop    r13
    1236:	c3                   	ret    
    1237:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    123e:	00 00 
    1240:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1247 <SVC_Info+0x307>
    1247:	31 c0                	xor    eax,eax
    1249:	e8 00 00 00 00       	call   124e <SVC_Info+0x30e>
    124e:	48 81 c4 08 04 00 00 	add    rsp,0x408
    1255:	5b                   	pop    rbx
    1256:	5d                   	pop    rbp
    1257:	41 5c                	pop    r12
    1259:	41 5d                	pop    r13
    125b:	c3                   	ret    
    125c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1260:	48 89 c1             	mov    rcx,rax
    1263:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 126a <SVC_Info+0x32a>
    126a:	be 00 04 00 00       	mov    esi,0x400
    126f:	48 89 df             	mov    rdi,rbx
    1272:	e8 00 00 00 00       	call   1277 <SVC_Info+0x337>
    1277:	e9 65 ff ff ff       	jmp    11e1 <SVC_Info+0x2a1>
    127c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1280:	31 ed                	xor    ebp,ebp
    1282:	45 31 e4             	xor    r12d,r12d
    1285:	e9 a8 fd ff ff       	jmp    1032 <SVC_Info+0xf2>
    128a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001290 <SVC_RateRestoreBurstAddress>:
SVC_RateRestoreBurstAddress():
    1290:	48 83 ec 08          	sub    rsp,0x8
    1294:	89 d6                	mov    esi,edx
    1296:	e8 65 ee ff ff       	call   100 <SVC_BucketForAddress.isra.1>
    129b:	48 85 c0             	test   rax,rax
    129e:	74 0d                	je     12ad <SVC_RateRestoreBurstAddress+0x1d>
    12a0:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
    12a3:	85 d2                	test   edx,edx
    12a5:	7e 06                	jle    12ad <SVC_RateRestoreBurstAddress+0x1d>
    12a7:	83 ea 01             	sub    edx,0x1
    12aa:	89 50 18             	mov    DWORD PTR [rax+0x18],edx
    12ad:	48 83 c4 08          	add    rsp,0x8
    12b1:	c3                   	ret    
    12b2:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    12b9:	00 00 00 00 
    12bd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000000012c0 <SVC_RateRestoreToxicAddress>:
SVC_RateRestoreToxicAddress():
    12c0:	48 83 ec 08          	sub    rsp,0x8
    12c4:	89 d6                	mov    esi,edx
    12c6:	e8 35 ee ff ff       	call   100 <SVC_BucketForAddress.isra.1>
    12cb:	48 85 c0             	test   rax,rax
    12ce:	74 0d                	je     12dd <SVC_RateRestoreToxicAddress+0x1d>
    12d0:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
    12d3:	85 d2                	test   edx,edx
    12d5:	7e 06                	jle    12dd <SVC_RateRestoreToxicAddress+0x1d>
    12d7:	83 ea 01             	sub    edx,0x1
    12da:	89 50 20             	mov    DWORD PTR [rax+0x20],edx
    12dd:	48 83 c4 08          	add    rsp,0x8
    12e1:	c3                   	ret    
    12e2:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    12e9:	00 00 00 00 
    12ed:	0f 1f 00             	nop    DWORD PTR [rax]

00000000000012f0 <SVC_RateDropAddress>:
SVC_RateDropAddress():
    12f0:	55                   	push   rbp
    12f1:	89 f5                	mov    ebp,esi
    12f3:	89 d6                	mov    esi,edx
    12f5:	53                   	push   rbx
    12f6:	48 83 ec 08          	sub    rsp,0x8
    12fa:	e8 01 ee ff ff       	call   100 <SVC_BucketForAddress.isra.1>
    12ff:	48 85 c0             	test   rax,rax
    1302:	74 1c                	je     1320 <SVC_RateDropAddress+0x30>
    1304:	8b 70 20             	mov    esi,DWORD PTR [rax+0x20]
    1307:	48 89 c3             	mov    rbx,rax
    130a:	81 fe 0f 27 00 00    	cmp    esi,0x270f
    1310:	7e 1e                	jle    1330 <SVC_RateDropAddress+0x40>
    1312:	0f af f5             	imul   esi,ebp
    1315:	89 73 18             	mov    DWORD PTR [rbx+0x18],esi
    1318:	e8 00 00 00 00       	call   131d <SVC_RateDropAddress+0x2d>
    131d:	89 43 14             	mov    DWORD PTR [rbx+0x14],eax
    1320:	48 83 c4 08          	add    rsp,0x8
    1324:	5b                   	pop    rbx
    1325:	5d                   	pop    rbp
    1326:	c3                   	ret    
    1327:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    132e:	00 00 
    1330:	83 c6 01             	add    esi,0x1
    1333:	89 70 20             	mov    DWORD PTR [rax+0x20],esi
    1336:	eb da                	jmp    1312 <SVC_RateDropAddress+0x22>
    1338:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    133f:	00 

0000000000001340 <SV_PacketEvent>:
SV_PacketEvent():
    1340:	83 7e 20 05          	cmp    DWORD PTR [rsi+0x20],0x5
    1344:	0f 8e c6 00 00 00    	jle    1410 <SV_PacketEvent+0xd0>
    134a:	41 56                	push   r14
    134c:	41 55                	push   r13
    134e:	49 89 fd             	mov    r13,rdi
    1351:	41 54                	push   r12
    1353:	49 89 f4             	mov    r12,rsi
    1356:	55                   	push   rbp
    1357:	53                   	push   rbx
    1358:	48 8b 46 10          	mov    rax,QWORD PTR [rsi+0x10]
    135c:	83 38 ff             	cmp    DWORD PTR [rax],0xffffffff
    135f:	0f 84 b3 00 00 00    	je     1418 <SV_PacketEvent+0xd8>
    1365:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 136b <SV_PacketEvent+0x2b>
    136b:	85 f6                	test   esi,esi
    136d:	75 11                	jne    1380 <SV_PacketEvent+0x40>
    136f:	5b                   	pop    rbx
    1370:	5d                   	pop    rbp
    1371:	41 5c                	pop    r12
    1373:	41 5d                	pop    r13
    1375:	41 5e                	pop    r14
    1377:	c3                   	ret    
    1378:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    137f:	00 
    1380:	4c 89 e7             	mov    rdi,r12
    1383:	e8 00 00 00 00       	call   1388 <SV_PacketEvent+0x48>
    1388:	4c 89 e7             	mov    rdi,r12
    138b:	e8 00 00 00 00       	call   1390 <SV_PacketEvent+0x50>
    1390:	4c 89 e7             	mov    rdi,r12
    1393:	e8 00 00 00 00       	call   1398 <SV_PacketEvent+0x58>
    1398:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 139f <SV_PacketEvent+0x5f>
    139f:	48 8b 1d 00 00 00 00 	mov    rbx,QWORD PTR [rip+0x0]        # 13a6 <SV_PacketEvent+0x66>
    13a6:	44 0f b7 f0          	movzx  r14d,ax
    13aa:	8b 4a 30             	mov    ecx,DWORD PTR [rdx+0x30]
    13ad:	85 c9                	test   ecx,ecx
    13af:	7e be                	jle    136f <SV_PacketEvent+0x2f>
    13b1:	31 ed                	xor    ebp,ebp
    13b3:	eb 12                	jmp    13c7 <SV_PacketEvent+0x87>
    13b5:	0f 1f 00             	nop    DWORD PTR [rax]
    13b8:	83 c5 01             	add    ebp,0x1
    13bb:	48 81 c3 e0 dd 02 00 	add    rbx,0x2dde0
    13c2:	39 6a 30             	cmp    DWORD PTR [rdx+0x30],ebp
    13c5:	7e a8                	jle    136f <SV_PacketEvent+0x2f>
    13c7:	8b 03                	mov    eax,DWORD PTR [rbx]
    13c9:	85 c0                	test   eax,eax
    13cb:	74 eb                	je     13b8 <SV_PacketEvent+0x78>
    13cd:	48 8d b3 40 4d 02 00 	lea    rsi,[rbx+0x24d40]
    13d4:	4c 89 ef             	mov    rdi,r13
    13d7:	e8 00 00 00 00       	call   13dc <SV_PacketEvent+0x9c>
    13dc:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 13e3 <SV_PacketEvent+0xa3>
    13e3:	85 c0                	test   eax,eax
    13e5:	74 d1                	je     13b8 <SV_PacketEvent+0x78>
    13e7:	44 39 b3 60 4d 02 00 	cmp    DWORD PTR [rbx+0x24d60],r14d
    13ee:	75 c8                	jne    13b8 <SV_PacketEvent+0x78>
    13f0:	4c 89 e6             	mov    rsi,r12
    13f3:	48 89 df             	mov    rdi,rbx
    13f6:	e8 00 00 00 00       	call   13fb <SV_PacketEvent+0xbb>
    13fb:	85 c0                	test   eax,eax
    13fd:	0f 85 32 01 00 00    	jne    1535 <SV_PacketEvent+0x1f5>
    1403:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 140a <SV_PacketEvent+0xca>
    140a:	eb ac                	jmp    13b8 <SV_PacketEvent+0x78>
    140c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1410:	c3                   	ret    
    1411:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1418:	48 89 f7             	mov    rdi,rsi
    141b:	e8 00 00 00 00       	call   1420 <SV_PacketEvent+0xe0>
    1420:	4c 89 e7             	mov    rdi,r12
    1423:	e8 00 00 00 00       	call   1428 <SV_PacketEvent+0xe8>
    1428:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
    142d:	48 b8 63 6f 6e 6e 65 	movabs rax,0x207463656e6e6f63
    1434:	63 74 20 
    1437:	48 39 42 04          	cmp    QWORD PTR [rdx+0x4],rax
    143b:	75 51                	jne    148e <SV_PacketEvent+0x14e>
    143d:	41 8b 5c 24 20       	mov    ebx,DWORD PTR [r12+0x20]
    1442:	81 fb 00 08 00 00    	cmp    ebx,0x800
    1448:	7e 37                	jle    1481 <SV_PacketEvent+0x141>
    144a:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1451 <SV_PacketEvent+0x111>
    1451:	44 8b 48 30          	mov    r9d,DWORD PTR [rax+0x30]
    1455:	45 85 c9             	test   r9d,r9d
    1458:	0f 84 11 ff ff ff    	je     136f <SV_PacketEvent+0x2f>
    145e:	4c 89 ef             	mov    rdi,r13
    1461:	e8 00 00 00 00       	call   1466 <SV_PacketEvent+0x126>
    1466:	89 da                	mov    edx,ebx
    1468:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 146f <SV_PacketEvent+0x12f>
    146f:	5b                   	pop    rbx
    1470:	48 89 c6             	mov    rsi,rax
    1473:	5d                   	pop    rbp
    1474:	31 c0                	xor    eax,eax
    1476:	41 5c                	pop    r12
    1478:	41 5d                	pop    r13
    147a:	41 5e                	pop    r14
    147c:	e9 00 00 00 00       	jmp    1481 <SV_PacketEvent+0x141>
    1481:	be 0c 00 00 00       	mov    esi,0xc
    1486:	4c 89 e7             	mov    rdi,r12
    1489:	e8 00 00 00 00       	call   148e <SV_PacketEvent+0x14e>
    148e:	4c 89 e7             	mov    rdi,r12
    1491:	e8 00 00 00 00       	call   1496 <SV_PacketEvent+0x156>
    1496:	48 89 c7             	mov    rdi,rax
    1499:	48 89 c5             	mov    rbp,rax
    149c:	e8 00 00 00 00       	call   14a1 <SV_PacketEvent+0x161>
    14a1:	31 ff                	xor    edi,edi
    14a3:	e8 00 00 00 00       	call   14a8 <SV_PacketEvent+0x168>
    14a8:	48 89 c3             	mov    rbx,rax
    14ab:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 14b2 <SV_PacketEvent+0x172>
    14b2:	44 8b 40 30          	mov    r8d,DWORD PTR [rax+0x30]
    14b6:	45 85 c0             	test   r8d,r8d
    14b9:	75 4c                	jne    1507 <SV_PacketEvent+0x1c7>
    14bb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 14c2 <SV_PacketEvent+0x182>
    14c2:	48 89 df             	mov    rdi,rbx
    14c5:	e8 00 00 00 00       	call   14ca <SV_PacketEvent+0x18a>
    14ca:	85 c0                	test   eax,eax
    14cc:	74 57                	je     1525 <SV_PacketEvent+0x1e5>
    14ce:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 14d5 <SV_PacketEvent+0x195>
    14d5:	8b 78 30             	mov    edi,DWORD PTR [rax+0x30]
    14d8:	85 ff                	test   edi,edi
    14da:	0f 84 8f fe ff ff    	je     136f <SV_PacketEvent+0x2f>
    14e0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 14e7 <SV_PacketEvent+0x1a7>
    14e7:	48 89 df             	mov    rdi,rbx
    14ea:	e8 00 00 00 00       	call   14ef <SV_PacketEvent+0x1af>
    14ef:	85 c0                	test   eax,eax
    14f1:	0f 85 8e 00 00 00    	jne    1585 <SV_PacketEvent+0x245>
    14f7:	5b                   	pop    rbx
    14f8:	4c 89 ef             	mov    rdi,r13
    14fb:	5d                   	pop    rbp
    14fc:	41 5c                	pop    r12
    14fe:	41 5d                	pop    r13
    1500:	41 5e                	pop    r14
    1502:	e9 f9 f7 ff ff       	jmp    d00 <SVC_Status>
    1507:	4c 89 ef             	mov    rdi,r13
    150a:	e8 00 00 00 00       	call   150f <SV_PacketEvent+0x1cf>
    150f:	48 89 da             	mov    rdx,rbx
    1512:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1519 <SV_PacketEvent+0x1d9>
    1519:	48 89 c6             	mov    rsi,rax
    151c:	31 c0                	xor    eax,eax
    151e:	e8 00 00 00 00       	call   1523 <SV_PacketEvent+0x1e3>
    1523:	eb 96                	jmp    14bb <SV_PacketEvent+0x17b>
    1525:	5b                   	pop    rbx
    1526:	4c 89 ef             	mov    rdi,r13
    1529:	5d                   	pop    rbp
    152a:	41 5c                	pop    r12
    152c:	41 5d                	pop    r13
    152e:	41 5e                	pop    r14
    1530:	e9 1b f5 ff ff       	jmp    a50 <SVC_RemoteCommand>
    1535:	41 0f b7 45 14       	movzx  eax,WORD PTR [r13+0x14]
    153a:	66 39 83 54 4d 02 00 	cmp    WORD PTR [rbx+0x24d54],ax
    1541:	74 1a                	je     155d <SV_PacketEvent+0x21d>
    1543:	31 c0                	xor    eax,eax
    1545:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 154c <SV_PacketEvent+0x20c>
    154c:	e8 00 00 00 00       	call   1551 <SV_PacketEvent+0x211>
    1551:	41 0f b7 45 14       	movzx  eax,WORD PTR [r13+0x14]
    1556:	66 89 83 54 4d 02 00 	mov    WORD PTR [rbx+0x24d54],ax
    155d:	83 3b 01             	cmp    DWORD PTR [rbx],0x1
    1560:	0f 84 09 fe ff ff    	je     136f <SV_PacketEvent+0x2f>
    1566:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 156c <SV_PacketEvent+0x22c>
    156c:	4c 89 e6             	mov    rsi,r12
    156f:	48 89 df             	mov    rdi,rbx
    1572:	89 83 04 0b 01 00    	mov    DWORD PTR [rbx+0x10b04],eax
    1578:	5b                   	pop    rbx
    1579:	5d                   	pop    rbp
    157a:	41 5c                	pop    r12
    157c:	41 5d                	pop    r13
    157e:	41 5e                	pop    r14
    1580:	e9 00 00 00 00       	jmp    1585 <SV_PacketEvent+0x245>
    1585:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 158c <SV_PacketEvent+0x24c>
    158c:	48 89 df             	mov    rdi,rbx
    158f:	e8 00 00 00 00       	call   1594 <SV_PacketEvent+0x254>
    1594:	85 c0                	test   eax,eax
    1596:	75 10                	jne    15a8 <SV_PacketEvent+0x268>
    1598:	5b                   	pop    rbx
    1599:	4c 89 ef             	mov    rdi,r13
    159c:	5d                   	pop    rbp
    159d:	41 5c                	pop    r12
    159f:	41 5d                	pop    r13
    15a1:	41 5e                	pop    r14
    15a3:	e9 98 f9 ff ff       	jmp    f40 <SVC_Info>
    15a8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 15af <SV_PacketEvent+0x26f>
    15af:	48 89 df             	mov    rdi,rbx
    15b2:	e8 00 00 00 00       	call   15b7 <SV_PacketEvent+0x277>
    15b7:	85 c0                	test   eax,eax
    15b9:	75 10                	jne    15cb <SV_PacketEvent+0x28b>
    15bb:	5b                   	pop    rbx
    15bc:	4c 89 ef             	mov    rdi,r13
    15bf:	5d                   	pop    rbp
    15c0:	41 5c                	pop    r12
    15c2:	41 5d                	pop    r13
    15c4:	41 5e                	pop    r14
    15c6:	e9 00 00 00 00       	jmp    15cb <SV_PacketEvent+0x28b>
    15cb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 15d2 <SV_PacketEvent+0x292>
    15d2:	48 89 df             	mov    rdi,rbx
    15d5:	e8 00 00 00 00       	call   15da <SV_PacketEvent+0x29a>
    15da:	85 c0                	test   eax,eax
    15dc:	75 10                	jne    15ee <SV_PacketEvent+0x2ae>
    15de:	5b                   	pop    rbx
    15df:	4c 89 ef             	mov    rdi,r13
    15e2:	5d                   	pop    rbp
    15e3:	41 5c                	pop    r12
    15e5:	41 5d                	pop    r13
    15e7:	41 5e                	pop    r14
    15e9:	e9 00 00 00 00       	jmp    15ee <SV_PacketEvent+0x2ae>
    15ee:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 15f5 <SV_PacketEvent+0x2b5>
    15f5:	48 89 df             	mov    rdi,rbx
    15f8:	e8 00 00 00 00       	call   15fd <SV_PacketEvent+0x2bd>
    15fd:	85 c0                	test   eax,eax
    15ff:	0f 84 6a fd ff ff    	je     136f <SV_PacketEvent+0x2f>
    1605:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 160c <SV_PacketEvent+0x2cc>
    160c:	48 89 df             	mov    rdi,rbx
    160f:	e8 00 00 00 00       	call   1614 <SV_PacketEvent+0x2d4>
    1614:	85 c0                	test   eax,eax
    1616:	0f 84 53 fd ff ff    	je     136f <SV_PacketEvent+0x2f>
    161c:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1623 <SV_PacketEvent+0x2e3>
    1623:	83 78 30 00          	cmp    DWORD PTR [rax+0x30],0x0
    1627:	0f 84 42 fd ff ff    	je     136f <SV_PacketEvent+0x2f>
    162d:	4c 89 ef             	mov    rdi,r13
    1630:	e8 00 00 00 00       	call   1635 <SV_PacketEvent+0x2f5>
    1635:	5b                   	pop    rbx
    1636:	48 89 ea             	mov    rdx,rbp
    1639:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1640 <SV_PacketEvent+0x300>
    1640:	5d                   	pop    rbp
    1641:	48 89 c6             	mov    rsi,rax
    1644:	41 5c                	pop    r12
    1646:	31 c0                	xor    eax,eax
    1648:	41 5d                	pop    r13
    164a:	41 5e                	pop    r14
    164c:	e9 00 00 00 00       	jmp    1651 <SV_PacketEvent+0x311>
    1651:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    1658:	00 00 00 00 
    165c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001660 <SV_FrameMsec>:
SV_FrameMsec():
    1660:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1667 <SV_FrameMsec+0x7>
    1667:	48 85 c0             	test   rax,rax
    166a:	74 2c                	je     1698 <SV_FrameMsec+0x38>
    166c:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 1674 <SV_FrameMsec+0x14>
    1673:	00 
    1674:	f3 0f 5e 40 2c       	divss  xmm0,DWORD PTR [rax+0x2c]
    1679:	f3 0f 2c d0          	cvttss2si edx,xmm0
    167d:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 1683 <SV_FrameMsec+0x23>
    1683:	89 d0                	mov    eax,edx
    1685:	29 c8                	sub    eax,ecx
    1687:	39 d1                	cmp    ecx,edx
    1689:	ba 00 00 00 00       	mov    edx,0x0
    168e:	0f 4f c2             	cmovg  eax,edx
    1691:	c3                   	ret    
    1692:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1698:	b8 01 00 00 00       	mov    eax,0x1
    169d:	c3                   	ret    
    169e:	66 90                	xchg   ax,ax

00000000000016a0 <SV_TrackCvarChanges>:
SV_TrackCvarChanges():
    16a0:	55                   	push   rbp
    16a1:	53                   	push   rbx
    16a2:	48 83 ec 08          	sub    rsp,0x8
    16a6:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 16ad <SV_TrackCvarChanges+0xd>
    16ad:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    16b0:	85 c0                	test   eax,eax
    16b2:	74 0b                	je     16bf <SV_TrackCvarChanges+0x1f>
    16b4:	3d e7 03 00 00       	cmp    eax,0x3e7
    16b9:	0f 8e b1 00 00 00    	jle    1770 <SV_TrackCvarChanges+0xd0>
    16bf:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 16c6 <SV_TrackCvarChanges+0x26>
    16c6:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    16c9:	85 c0                	test   eax,eax
    16cb:	74 07                	je     16d4 <SV_TrackCvarChanges+0x34>
    16cd:	3d e7 03 00 00       	cmp    eax,0x3e7
    16d2:	7e 6c                	jle    1740 <SV_TrackCvarChanges+0xa0>
    16d4:	31 f6                	xor    esi,esi
    16d6:	bf 02 00 00 00       	mov    edi,0x2
    16db:	e8 00 00 00 00       	call   16e0 <SV_TrackCvarChanges+0x40>
    16e0:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 16e6 <SV_TrackCvarChanges+0x46>
    16e6:	85 c9                	test   ecx,ecx
    16e8:	74 4d                	je     1737 <SV_TrackCvarChanges+0x97>
    16ea:	48 8b 1d 00 00 00 00 	mov    rbx,QWORD PTR [rip+0x0]        # 16f1 <SV_TrackCvarChanges+0x51>
    16f1:	48 85 db             	test   rbx,rbx
    16f4:	74 41                	je     1737 <SV_TrackCvarChanges+0x97>
    16f6:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 16fd <SV_TrackCvarChanges+0x5d>
    16fd:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    1700:	85 d2                	test   edx,edx
    1702:	7e 33                	jle    1737 <SV_TrackCvarChanges+0x97>
    1704:	31 ed                	xor    ebp,ebp
    1706:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    170d:	00 00 00 
    1710:	83 3b 01             	cmp    DWORD PTR [rbx],0x1
    1713:	76 13                	jbe    1728 <SV_TrackCvarChanges+0x88>
    1715:	31 d2                	xor    edx,edx
    1717:	31 f6                	xor    esi,esi
    1719:	48 89 df             	mov    rdi,rbx
    171c:	e8 00 00 00 00       	call   1721 <SV_TrackCvarChanges+0x81>
    1721:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1728 <SV_TrackCvarChanges+0x88>
    1728:	83 c5 01             	add    ebp,0x1
    172b:	48 81 c3 e0 dd 02 00 	add    rbx,0x2dde0
    1732:	39 68 30             	cmp    DWORD PTR [rax+0x30],ebp
    1735:	7f d9                	jg     1710 <SV_TrackCvarChanges+0x70>
    1737:	48 83 c4 08          	add    rsp,0x8
    173b:	5b                   	pop    rbx
    173c:	5d                   	pop    rbp
    173d:	c3                   	ret    
    173e:	66 90                	xchg   ax,ax
    1740:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1747 <SV_TrackCvarChanges+0xa7>
    1747:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 174e <SV_TrackCvarChanges+0xae>
    174e:	e8 00 00 00 00       	call   1753 <SV_TrackCvarChanges+0xb3>
    1753:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 175a <SV_TrackCvarChanges+0xba>
    175a:	31 c0                	xor    eax,eax
    175c:	e8 00 00 00 00       	call   1761 <SV_TrackCvarChanges+0xc1>
    1761:	e9 6e ff ff ff       	jmp    16d4 <SV_TrackCvarChanges+0x34>
    1766:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    176d:	00 00 00 
    1770:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1777 <SV_TrackCvarChanges+0xd7>
    1777:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 177e <SV_TrackCvarChanges+0xde>
    177e:	e8 00 00 00 00       	call   1783 <SV_TrackCvarChanges+0xe3>
    1783:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 178a <SV_TrackCvarChanges+0xea>
    178a:	31 c0                	xor    eax,eax
    178c:	e8 00 00 00 00       	call   1791 <SV_TrackCvarChanges+0xf1>
    1791:	e9 29 ff ff ff       	jmp    16bf <SV_TrackCvarChanges+0x1f>
    1796:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    179d:	00 00 00 

00000000000017a0 <SV_Frame>:
SV_Frame():
    17a0:	41 57                	push   r15
    17a2:	41 56                	push   r14
    17a4:	41 55                	push   r13
    17a6:	41 54                	push   r12
    17a8:	41 89 fc             	mov    r12d,edi
    17ab:	bf 02 00 00 00       	mov    edi,0x2
    17b0:	55                   	push   rbp
    17b1:	53                   	push   rbx
    17b2:	48 83 ec 08          	sub    rsp,0x8
    17b6:	e8 00 00 00 00       	call   17bb <SV_Frame+0x1b>
    17bb:	85 c0                	test   eax,eax
    17bd:	0f 85 65 04 00 00    	jne    1c28 <SV_Frame+0x488>
    17c3:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 17ca <SV_Frame+0x2a>
    17ca:	8b 68 30             	mov    ebp,DWORD PTR [rax+0x30]
    17cd:	85 ed                	test   ebp,ebp
    17cf:	0f 85 6a 04 00 00    	jne    1c3f <SV_Frame+0x49f>
    17d5:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 17dc <SV_Frame+0x3c>
    17dc:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    17df:	85 c0                	test   eax,eax
    17e1:	0f 84 89 04 00 00    	je     1c70 <SV_Frame+0x4d0>
    17e7:	b8 e8 03 00 00       	mov    eax,0x3e8
    17ec:	48 8b 0d 00 00 00 00 	mov    rcx,QWORD PTR [rip+0x0]        # 17f3 <SV_Frame+0x53>
    17f3:	66 0f ef c0          	pxor   xmm0,xmm0
    17f7:	99                   	cdq    
    17f8:	f7 79 30             	idiv   DWORD PTR [rcx+0x30]
    17fb:	f3 0f 2a c0          	cvtsi2ss xmm0,eax
    17ff:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1806 <SV_Frame+0x66>
    1806:	f3 0f 59 40 2c       	mulss  xmm0,DWORD PTR [rax+0x2c]
    180b:	f3 0f 2c d8          	cvttss2si ebx,xmm0
    180f:	85 db                	test   ebx,ebx
    1811:	0f 8e a1 04 00 00    	jle    1cb8 <SV_Frame+0x518>
    1817:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 181e <SV_Frame+0x7e>
    181e:	44 03 25 00 00 00 00 	add    r12d,DWORD PTR [rip+0x0]        # 1825 <SV_Frame+0x85>
    1825:	44 89 25 00 00 00 00 	mov    DWORD PTR [rip+0x0],r12d        # 182c <SV_Frame+0x8c>
    182c:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 1832 <SV_Frame+0x92>
    1832:	44 8b 70 30          	mov    r14d,DWORD PTR [rax+0x30]
    1836:	45 85 f6             	test   r14d,r14d
    1839:	0f 84 59 04 00 00    	je     1c98 <SV_Frame+0x4f8>
    183f:	81 ff 00 00 00 78    	cmp    edi,0x78000000
    1845:	0f 8f cd 04 00 00    	jg     1d18 <SV_Frame+0x578>
    184b:	81 ff 00 2e 93 02    	cmp    edi,0x2932e00
    1851:	7e 6d                	jle    18c0 <SV_Frame+0x120>
    1853:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 185a <SV_Frame+0xba>
    185a:	44 8b 68 30          	mov    r13d,DWORD PTR [rax+0x30]
    185e:	45 85 ed             	test   r13d,r13d
    1861:	74 08                	je     186b <SV_Frame+0xcb>
    1863:	81 ff 00 00 00 40    	cmp    edi,0x40000000
    1869:	7e 55                	jle    18c0 <SV_Frame+0x120>
    186b:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1872 <SV_Frame+0xd2>
    1872:	48 85 c0             	test   rax,rax
    1875:	74 49                	je     18c0 <SV_Frame+0x120>
    1877:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 187e <SV_Frame+0xde>
    187e:	8b 4a 30             	mov    ecx,DWORD PTR [rdx+0x30]
    1881:	85 c9                	test   ecx,ecx
    1883:	7e 35                	jle    18ba <SV_Frame+0x11a>
    1885:	31 d2                	xor    edx,edx
    1887:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    188e:	00 00 
    1890:	44 8b 20             	mov    r12d,DWORD PTR [rax]
    1893:	45 85 e4             	test   r12d,r12d
    1896:	74 09                	je     18a1 <SV_Frame+0x101>
    1898:	83 b8 40 4d 02 00 01 	cmp    DWORD PTR [rax+0x24d40],0x1
    189f:	75 1f                	jne    18c0 <SV_Frame+0x120>
    18a1:	83 c2 01             	add    edx,0x1
    18a4:	48 05 e0 dd 02 00    	add    rax,0x2dde0
    18aa:	39 ca                	cmp    edx,ecx
    18ac:	75 e2                	jne    1890 <SV_Frame+0xf0>
    18ae:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 18b5 <SV_Frame+0x115>
    18b5:	e9 65 04 00 00       	jmp    1d1f <SV_Frame+0x57f>
    18ba:	74 f2                	je     18ae <SV_Frame+0x10e>
    18bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    18c0:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 18c6 <SV_Frame+0x126>
    18c6:	85 c0                	test   eax,eax
    18c8:	74 08                	je     18d2 <SV_Frame+0x132>
    18ca:	39 c7                	cmp    edi,eax
    18cc:	0f 89 7e 04 00 00    	jns    1d50 <SV_Frame+0x5b0>
    18d2:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 18d8 <SV_Frame+0x138>
    18d8:	a8 04                	test   al,0x4
    18da:	0f 85 98 04 00 00    	jne    1d78 <SV_Frame+0x5d8>
    18e0:	a8 08                	test   al,0x8
    18e2:	0f 85 bd 04 00 00    	jne    1da5 <SV_Frame+0x605>
    18e8:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 18ef <SV_Frame+0x14f>
    18ef:	44 8b 60 30          	mov    r12d,DWORD PTR [rax+0x30]
    18f3:	45 85 e4             	test   r12d,r12d
    18f6:	0f 85 dd 04 00 00    	jne    1dd9 <SV_Frame+0x639>
    18fc:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1903 <SV_Frame+0x163>
    1903:	45 31 ff             	xor    r15d,r15d
    1906:	45 31 ed             	xor    r13d,r13d
    1909:	44 8b 58 30          	mov    r11d,DWORD PTR [rax+0x30]
    190d:	45 85 db             	test   r11d,r11d
    1910:	0f 8e b0 00 00 00    	jle    19c6 <SV_Frame+0x226>
    1916:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    191d:	00 00 00 
    1920:	4c 8b 35 00 00 00 00 	mov    r14,QWORD PTR [rip+0x0]        # 1927 <SV_Frame+0x187>
    1927:	4d 01 ee             	add    r14,r13
    192a:	41 83 3e 04          	cmp    DWORD PTR [r14],0x4
    192e:	0f 85 7c 02 00 00    	jne    1bb0 <SV_Frame+0x410>
    1934:	49 83 be 38 08 01 00 	cmp    QWORD PTR [r14+0x10838],0x0
    193b:	00 
    193c:	0f 84 6e 02 00 00    	je     1bb0 <SV_Frame+0x410>
    1942:	41 83 be 40 4d 02 00 	cmp    DWORD PTR [r14+0x24d40],0x1
    1949:	01 
    194a:	0f 84 70 02 00 00    	je     1bc0 <SV_Frame+0x420>
    1950:	49 8d 8e 1c 0d 01 00 	lea    rcx,[r14+0x10d1c]
    1957:	49 8d 96 1c 4f 02 00 	lea    rdx,[r14+0x24f1c]
    195e:	31 c0                	xor    eax,eax
    1960:	31 ff                	xor    edi,edi
    1962:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1968:	8b 71 04             	mov    esi,DWORD PTR [rcx+0x4]
    196b:	85 f6                	test   esi,esi
    196d:	74 07                	je     1976 <SV_Frame+0x1d6>
    196f:	2b 31                	sub    esi,DWORD PTR [rcx]
    1971:	83 c7 01             	add    edi,0x1
    1974:	01 f0                	add    eax,esi
    1976:	48 81 c1 10 0a 00 00 	add    rcx,0xa10
    197d:	48 39 ca             	cmp    rdx,rcx
    1980:	75 e6                	jne    1968 <SV_Frame+0x1c8>
    1982:	85 ff                	test   edi,edi
    1984:	0f 85 7e 02 00 00    	jne    1c08 <SV_Frame+0x468>
    198a:	41 c7 86 20 4d 02 00 	mov    DWORD PTR [r14+0x24d20],0x3e7
    1991:	e7 03 00 00 
    1995:	44 89 ff             	mov    edi,r15d
    1998:	e8 00 00 00 00       	call   199d <SV_Frame+0x1fd>
    199d:	41 8b 96 20 4d 02 00 	mov    edx,DWORD PTR [r14+0x24d20]
    19a4:	89 90 c4 01 00 00    	mov    DWORD PTR [rax+0x1c4],edx
    19aa:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 19b1 <SV_Frame+0x211>
    19b1:	41 83 c7 01          	add    r15d,0x1
    19b5:	49 81 c5 e0 dd 02 00 	add    r13,0x2dde0
    19bc:	44 3b 78 30          	cmp    r15d,DWORD PTR [rax+0x30]
    19c0:	0f 8c 5a ff ff ff    	jl     1920 <SV_Frame+0x180>
    19c6:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 19cd <SV_Frame+0x22d>
    19cd:	44 8b 50 30          	mov    r10d,DWORD PTR [rax+0x30]
    19d1:	45 85 d2             	test   r10d,r10d
    19d4:	0f 85 2e 04 00 00    	jne    1e08 <SV_Frame+0x668>
    19da:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 19e0 <SV_Frame+0x240>
    19e0:	39 c3                	cmp    ebx,eax
    19e2:	7f 42                	jg     1a26 <SV_Frame+0x286>
    19e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    19e8:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 19ee <SV_Frame+0x24e>
    19ee:	29 d8                	sub    eax,ebx
    19f0:	ba 08 00 00 00       	mov    edx,0x8
    19f5:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 19fc <SV_Frame+0x25c>
    19fc:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 1a02 <SV_Frame+0x262>
    1a02:	be 01 00 00 00       	mov    esi,0x1
    1a07:	31 c0                	xor    eax,eax
    1a09:	01 d9                	add    ecx,ebx
    1a0b:	01 1d 00 00 00 00    	add    DWORD PTR [rip+0x0],ebx        # 1a11 <SV_Frame+0x271>
    1a11:	89 0d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ecx        # 1a17 <SV_Frame+0x277>
    1a17:	e8 00 00 00 00       	call   1a1c <SV_Frame+0x27c>
    1a1c:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 1a22 <SV_Frame+0x282>
    1a22:	39 d8                	cmp    eax,ebx
    1a24:	7d c2                	jge    19e8 <SV_Frame+0x248>
    1a26:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1a2d <SV_Frame+0x28d>
    1a2d:	44 8b 48 30          	mov    r9d,DWORD PTR [rax+0x30]
    1a31:	45 85 c9             	test   r9d,r9d
    1a34:	0f 85 b6 03 00 00    	jne    1df0 <SV_Frame+0x650>
    1a3a:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1a41 <SV_Frame+0x2a1>
    1a41:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 1a47 <SV_Frame+0x2a7>
    1a47:	4c 8d 35 00 00 00 00 	lea    r14,[rip+0x0]        # 1a4e <SV_Frame+0x2ae>
    1a4e:	48 8b 1d 00 00 00 00 	mov    rbx,QWORD PTR [rip+0x0]        # 1a55 <SV_Frame+0x2b5>
    1a55:	44 69 62 30 18 fc ff 	imul   r12d,DWORD PTR [rdx+0x30],0xfffffc18
    1a5c:	ff 
    1a5d:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1a64 <SV_Frame+0x2c4>
    1a64:	44 69 6a 30 18 fc ff 	imul   r13d,DWORD PTR [rdx+0x30],0xfffffc18
    1a6b:	ff 
    1a6c:	41 01 c4             	add    r12d,eax
    1a6f:	41 01 c5             	add    r13d,eax
    1a72:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1a79 <SV_Frame+0x2d9>
    1a79:	44 8b 40 30          	mov    r8d,DWORD PTR [rax+0x30]
    1a7d:	45 85 c0             	test   r8d,r8d
    1a80:	7f 50                	jg     1ad2 <SV_Frame+0x332>
    1a82:	e9 03 01 00 00       	jmp    1b8a <SV_Frame+0x3ea>
    1a87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    1a8e:	00 00 
    1a90:	8b bb cc dd 02 00    	mov    edi,DWORD PTR [rbx+0x2ddcc]
    1a96:	85 ff                	test   edi,edi
    1a98:	74 0e                	je     1aa8 <SV_Frame+0x308>
    1a9a:	2b 93 04 0b 01 00    	sub    edx,DWORD PTR [rbx+0x10b04]
    1aa0:	81 fa a0 0f 00 00    	cmp    edx,0xfa0
    1aa6:	7f 78                	jg     1b20 <SV_Frame+0x380>
    1aa8:	44 39 a3 04 0b 01 00 	cmp    DWORD PTR [rbx+0x10b04],r12d
    1aaf:	0f 88 1b 01 00 00    	js     1bd0 <SV_Frame+0x430>
    1ab5:	c7 83 18 0b 01 00 00 	mov    DWORD PTR [rbx+0x10b18],0x0
    1abc:	00 00 00 
    1abf:	83 c5 01             	add    ebp,0x1
    1ac2:	48 81 c3 e0 dd 02 00 	add    rbx,0x2dde0
    1ac9:	3b 68 30             	cmp    ebp,DWORD PTR [rax+0x30]
    1acc:	0f 8d b8 00 00 00    	jge    1b8a <SV_Frame+0x3ea>
    1ad2:	8b 33                	mov    esi,DWORD PTR [rbx]
    1ad4:	85 f6                	test   esi,esi
    1ad6:	74 e7                	je     1abf <SV_Frame+0x31f>
    1ad8:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 1ade <SV_Frame+0x33e>
    1ade:	8b 8b 04 0b 01 00    	mov    ecx,DWORD PTR [rbx+0x10b04]
    1ae4:	29 d1                	sub    ecx,edx
    1ae6:	85 c9                	test   ecx,ecx
    1ae8:	7e 06                	jle    1af0 <SV_Frame+0x350>
    1aea:	89 93 04 0b 01 00    	mov    DWORD PTR [rbx+0x10b04],edx
    1af0:	83 fe 01             	cmp    esi,0x1
    1af3:	75 9b                	jne    1a90 <SV_Frame+0x2f0>
    1af5:	8b 8b 04 0b 01 00    	mov    ecx,DWORD PTR [rbx+0x10b04]
    1afb:	44 39 e9             	cmp    ecx,r13d
    1afe:	0f 88 1c 03 00 00    	js     1e20 <SV_Frame+0x680>
    1b04:	8b b3 cc dd 02 00    	mov    esi,DWORD PTR [rbx+0x2ddcc]
    1b0a:	85 f6                	test   esi,esi
    1b0c:	74 a7                	je     1ab5 <SV_Frame+0x315>
    1b0e:	29 ca                	sub    edx,ecx
    1b10:	81 fa a0 0f 00 00    	cmp    edx,0xfa0
    1b16:	7e 9d                	jle    1ab5 <SV_Frame+0x315>
    1b18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    1b1f:	00 
    1b20:	48 8d bb 40 4d 02 00 	lea    rdi,[rbx+0x24d40]
    1b27:	be e8 03 00 00       	mov    esi,0x3e8
    1b2c:	e8 cf e5 ff ff       	call   100 <SVC_BucketForAddress.isra.1>
    1b31:	49 89 c7             	mov    r15,rax
    1b34:	48 85 c0             	test   rax,rax
    1b37:	74 23                	je     1b5c <SV_Frame+0x3bc>
    1b39:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
    1b3c:	3d 0f 27 00 00       	cmp    eax,0x270f
    1b41:	7f 07                	jg     1b4a <SV_Frame+0x3aa>
    1b43:	83 c0 01             	add    eax,0x1
    1b46:	41 89 47 20          	mov    DWORD PTR [r15+0x20],eax
    1b4a:	8d 04 80             	lea    eax,[rax+rax*4]
    1b4d:	01 c0                	add    eax,eax
    1b4f:	41 89 47 18          	mov    DWORD PTR [r15+0x18],eax
    1b53:	e8 00 00 00 00       	call   1b58 <SV_Frame+0x3b8>
    1b58:	41 89 47 14          	mov    DWORD PTR [r15+0x14],eax
    1b5c:	48 89 df             	mov    rdi,rbx
    1b5f:	31 f6                	xor    esi,esi
    1b61:	83 c5 01             	add    ebp,0x1
    1b64:	48 81 c3 e0 dd 02 00 	add    rbx,0x2dde0
    1b6b:	e8 00 00 00 00       	call   1b70 <SV_Frame+0x3d0>
    1b70:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1b77 <SV_Frame+0x3d7>
    1b77:	c7 83 20 22 fd ff 00 	mov    DWORD PTR [rbx-0x2dde0],0x0
    1b7e:	00 00 00 
    1b81:	3b 68 30             	cmp    ebp,DWORD PTR [rax+0x30]
    1b84:	0f 8c 48 ff ff ff    	jl     1ad2 <SV_Frame+0x332>
    1b8a:	e8 00 00 00 00       	call   1b8f <SV_Frame+0x3ef>
    1b8f:	e8 00 00 00 00       	call   1b94 <SV_Frame+0x3f4>
    1b94:	48 83 c4 08          	add    rsp,0x8
    1b98:	5b                   	pop    rbx
    1b99:	5d                   	pop    rbp
    1b9a:	41 5c                	pop    r12
    1b9c:	41 5d                	pop    r13
    1b9e:	41 5e                	pop    r14
    1ba0:	41 5f                	pop    r15
    1ba2:	e9 49 e8 ff ff       	jmp    3f0 <SV_MasterHeartbeat.constprop.3>
    1ba7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    1bae:	00 00 
    1bb0:	41 c7 86 20 4d 02 00 	mov    DWORD PTR [r14+0x24d20],0x3e7
    1bb7:	e7 03 00 00 
    1bbb:	e9 f1 fd ff ff       	jmp    19b1 <SV_Frame+0x211>
    1bc0:	41 c7 86 20 4d 02 00 	mov    DWORD PTR [r14+0x24d20],0x0
    1bc7:	00 00 00 00 
    1bcb:	e9 e1 fd ff ff       	jmp    19b1 <SV_Frame+0x211>
    1bd0:	8b bb 18 0b 01 00    	mov    edi,DWORD PTR [rbx+0x10b18]
    1bd6:	8d 57 01             	lea    edx,[rdi+0x1]
    1bd9:	89 93 18 0b 01 00    	mov    DWORD PTR [rbx+0x10b18],edx
    1bdf:	83 fa 05             	cmp    edx,0x5
    1be2:	0f 8e d7 fe ff ff    	jle    1abf <SV_Frame+0x31f>
    1be8:	4c 89 f6             	mov    rsi,r14
    1beb:	48 89 df             	mov    rdi,rbx
    1bee:	e8 00 00 00 00       	call   1bf3 <SV_Frame+0x453>
    1bf3:	c7 03 00 00 00 00    	mov    DWORD PTR [rbx],0x0
    1bf9:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1c00 <SV_Frame+0x460>
    1c00:	e9 ba fe ff ff       	jmp    1abf <SV_Frame+0x31f>
    1c05:	0f 1f 00             	nop    DWORD PTR [rax]
    1c08:	99                   	cdq    
    1c09:	f7 ff                	idiv   edi
    1c0b:	bf e7 03 00 00       	mov    edi,0x3e7
    1c10:	3d e7 03 00 00       	cmp    eax,0x3e7
    1c15:	0f 4f c7             	cmovg  eax,edi
    1c18:	41 89 86 20 4d 02 00 	mov    DWORD PTR [r14+0x24d20],eax
    1c1f:	e9 71 fd ff ff       	jmp    1995 <SV_Frame+0x1f5>
    1c24:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1c28:	e8 00 00 00 00       	call   1c2d <SV_Frame+0x48d>
    1c2d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1c34 <SV_Frame+0x494>
    1c34:	8b 68 30             	mov    ebp,DWORD PTR [rax+0x30]
    1c37:	85 ed                	test   ebp,ebp
    1c39:	0f 84 96 fb ff ff    	je     17d5 <SV_Frame+0x35>
    1c3f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1c46 <SV_Frame+0x4a6>
    1c46:	e8 00 00 00 00       	call   1c4b <SV_Frame+0x4ab>
    1c4b:	48 83 c4 08          	add    rsp,0x8
    1c4f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1c56 <SV_Frame+0x4b6>
    1c56:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1c5d <SV_Frame+0x4bd>
    1c5d:	5b                   	pop    rbx
    1c5e:	5d                   	pop    rbp
    1c5f:	41 5c                	pop    r12
    1c61:	41 5d                	pop    r13
    1c63:	41 5e                	pop    r14
    1c65:	41 5f                	pop    r15
    1c67:	e9 00 00 00 00       	jmp    1c6c <SV_Frame+0x4cc>
    1c6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1c70:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1c77 <SV_Frame+0x4d7>
    1c77:	44 8b 78 30          	mov    r15d,DWORD PTR [rax+0x30]
    1c7b:	45 85 ff             	test   r15d,r15d
    1c7e:	0f 85 b4 00 00 00    	jne    1d38 <SV_Frame+0x598>
    1c84:	48 83 c4 08          	add    rsp,0x8
    1c88:	5b                   	pop    rbx
    1c89:	5d                   	pop    rbp
    1c8a:	41 5c                	pop    r12
    1c8c:	41 5d                	pop    r13
    1c8e:	41 5e                	pop    r14
    1c90:	41 5f                	pop    r15
    1c92:	c3                   	ret    
    1c93:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1c98:	44 01 e7             	add    edi,r12d
    1c9b:	e8 00 00 00 00       	call   1ca0 <SV_Frame+0x500>
    1ca0:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 1ca6 <SV_Frame+0x506>
    1ca6:	81 ff 00 00 00 78    	cmp    edi,0x78000000
    1cac:	0f 8e 99 fb ff ff    	jle    184b <SV_Frame+0xab>
    1cb2:	eb 64                	jmp    1d18 <SV_Frame+0x578>
    1cb4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1cb8:	b8 01 00 00 00       	mov    eax,0x1
    1cbd:	f3 0f 10 41 2c       	movss  xmm0,DWORD PTR [rcx+0x2c]
    1cc2:	bb 01 00 00 00       	mov    ebx,0x1
    1cc7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1cce <SV_Frame+0x52e>
    1cce:	f3 0f 5e 05 00 00 00 	divss  xmm0,DWORD PTR [rip+0x0]        # 1cd6 <SV_Frame+0x536>
    1cd5:	00 
    1cd6:	f3 0f 5a c0          	cvtss2sd xmm0,xmm0
    1cda:	e8 00 00 00 00       	call   1cdf <SV_Frame+0x53f>
    1cdf:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1ce6 <SV_Frame+0x546>
    1ce6:	48 89 c6             	mov    rsi,rax
    1ce9:	e8 00 00 00 00       	call   1cee <SV_Frame+0x54e>
    1cee:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1cf5 <SV_Frame+0x555>
    1cf5:	66 0f ef c0          	pxor   xmm0,xmm0
    1cf9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d00 <SV_Frame+0x560>
    1d00:	f3 0f 5a 40 2c       	cvtss2sd xmm0,DWORD PTR [rax+0x2c]
    1d05:	b8 01 00 00 00       	mov    eax,0x1
    1d0a:	e8 00 00 00 00       	call   1d0f <SV_Frame+0x56f>
    1d0f:	e9 03 fb ff ff       	jmp    1817 <SV_Frame+0x77>
    1d14:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1d18:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d1f <SV_Frame+0x57f>
    1d1f:	48 83 c4 08          	add    rsp,0x8
    1d23:	5b                   	pop    rbx
    1d24:	5d                   	pop    rbp
    1d25:	41 5c                	pop    r12
    1d27:	41 5d                	pop    r13
    1d29:	41 5e                	pop    r14
    1d2b:	41 5f                	pop    r15
    1d2d:	e9 ce e2 ff ff       	jmp    0 <SV_Restart>
    1d32:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1d38:	48 83 c4 08          	add    rsp,0x8
    1d3c:	bf ff ff ff ff       	mov    edi,0xffffffff
    1d41:	5b                   	pop    rbx
    1d42:	5d                   	pop    rbp
    1d43:	41 5c                	pop    r12
    1d45:	41 5d                	pop    r13
    1d47:	41 5e                	pop    r14
    1d49:	41 5f                	pop    r15
    1d4b:	e9 00 00 00 00       	jmp    1d50 <SV_Frame+0x5b0>
    1d50:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 1d5a <SV_Frame+0x5ba>
    1d57:	00 00 00 
    1d5a:	48 83 c4 08          	add    rsp,0x8
    1d5e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d65 <SV_Frame+0x5c5>
    1d65:	5b                   	pop    rbx
    1d66:	5d                   	pop    rbp
    1d67:	41 5c                	pop    r12
    1d69:	41 5d                	pop    r13
    1d6b:	41 5e                	pop    r14
    1d6d:	41 5f                	pop    r15
    1d6f:	e9 00 00 00 00       	jmp    1d74 <SV_Frame+0x5d4>
    1d74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1d78:	31 f6                	xor    esi,esi
    1d7a:	bf 04 00 00 00       	mov    edi,0x4
    1d7f:	e8 00 00 00 00       	call   1d84 <SV_Frame+0x5e4>
    1d84:	31 ff                	xor    edi,edi
    1d86:	48 89 c6             	mov    rsi,rax
    1d89:	e8 00 00 00 00       	call   1d8e <SV_Frame+0x5ee>
    1d8e:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 1d94 <SV_Frame+0x5f4>
    1d94:	83 e0 fb             	and    eax,0xfffffffb
    1d97:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 1d9d <SV_Frame+0x5fd>
    1d9d:	a8 08                	test   al,0x8
    1d9f:	0f 84 43 fb ff ff    	je     18e8 <SV_Frame+0x148>
    1da5:	31 f6                	xor    esi,esi
    1da7:	bf 08 00 00 00       	mov    edi,0x8
    1dac:	e8 00 00 00 00       	call   1db1 <SV_Frame+0x611>
    1db1:	bf 01 00 00 00       	mov    edi,0x1
    1db6:	48 89 c6             	mov    rsi,rax
    1db9:	e8 00 00 00 00       	call   1dbe <SV_Frame+0x61e>
    1dbe:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1dc5 <SV_Frame+0x625>
    1dc5:	83 25 00 00 00 00 f7 	and    DWORD PTR [rip+0x0],0xfffffff7        # 1dcc <SV_Frame+0x62c>
    1dcc:	44 8b 60 30          	mov    r12d,DWORD PTR [rax+0x30]
    1dd0:	45 85 e4             	test   r12d,r12d
    1dd3:	0f 84 23 fb ff ff    	je     18fc <SV_Frame+0x15c>
    1dd9:	e8 00 00 00 00       	call   1dde <SV_Frame+0x63e>
    1dde:	41 89 c4             	mov    r12d,eax
    1de1:	e9 16 fb ff ff       	jmp    18fc <SV_Frame+0x15c>
    1de6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    1ded:	00 00 00 
    1df0:	e8 00 00 00 00       	call   1df5 <SV_Frame+0x655>
    1df5:	44 29 e0             	sub    eax,r12d
    1df8:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 1dfe <SV_Frame+0x65e>
    1dfe:	e9 37 fc ff ff       	jmp    1a3a <SV_Frame+0x29a>
    1e03:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1e08:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 1e0e <SV_Frame+0x66e>
    1e0e:	e8 00 00 00 00       	call   1e13 <SV_Frame+0x673>
    1e13:	e9 c2 fb ff ff       	jmp    19da <SV_Frame+0x23a>
    1e18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    1e1f:	00 
    1e20:	31 c0                	xor    eax,eax
    1e22:	89 ee                	mov    esi,ebp
    1e24:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1e2b <SV_Frame+0x68b>
    1e2b:	e8 00 00 00 00       	call   1e30 <SV_Frame+0x690>
    1e30:	c7 03 00 00 00 00    	mov    DWORD PTR [rbx],0x0
    1e36:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1e3d <SV_Frame+0x69d>
    1e3d:	e9 7d fc ff ff       	jmp    1abf <SV_Frame+0x31f>
    1e42:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    1e49:	00 00 00 00 
    1e4d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000001e50 <SV_RateMsec>:
SV_RateMsec():
    1e50:	8b 8f 24 4d 02 00    	mov    ecx,DWORD PTR [rdi+0x24d24]
    1e56:	85 c9                	test   ecx,ecx
    1e58:	74 6e                	je     1ec8 <SV_RateMsec+0x78>
    1e5a:	55                   	push   rbp
    1e5b:	53                   	push   rbx
    1e5c:	48 83 ec 08          	sub    rsp,0x8
    1e60:	8b 97 88 cd 02 00    	mov    edx,DWORD PTR [rdi+0x2cd88]
    1e66:	83 bf 40 4d 02 00 05 	cmp    DWORD PTR [rdi+0x24d40],0x5
    1e6d:	8d 42 1c             	lea    eax,[rdx+0x1c]
    1e70:	74 4e                	je     1ec0 <SV_RateMsec+0x70>
    1e72:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1e79 <SV_RateMsec+0x29>
    1e79:	66 0f ef c0          	pxor   xmm0,xmm0
    1e7d:	69 c0 e8 03 00 00    	imul   eax,eax,0x3e8
    1e83:	48 89 fd             	mov    rbp,rdi
    1e86:	f3 0f 2a c1          	cvtsi2ss xmm0,ecx
    1e8a:	f3 0f 59 42 2c       	mulss  xmm0,DWORD PTR [rdx+0x2c]
    1e8f:	99                   	cdq    
    1e90:	f3 0f 2c c8          	cvttss2si ecx,xmm0
    1e94:	f7 f9                	idiv   ecx
    1e96:	89 c3                	mov    ebx,eax
    1e98:	e8 00 00 00 00       	call   1e9d <SV_RateMsec+0x4d>
    1e9d:	2b 85 84 cd 02 00    	sub    eax,DWORD PTR [rbp+0x2cd84]
    1ea3:	39 c3                	cmp    ebx,eax
    1ea5:	7d 09                	jge    1eb0 <SV_RateMsec+0x60>
    1ea7:	48 83 c4 08          	add    rsp,0x8
    1eab:	31 c0                	xor    eax,eax
    1ead:	5b                   	pop    rbx
    1eae:	5d                   	pop    rbp
    1eaf:	c3                   	ret    
    1eb0:	29 c3                	sub    ebx,eax
    1eb2:	48 83 c4 08          	add    rsp,0x8
    1eb6:	89 d8                	mov    eax,ebx
    1eb8:	5b                   	pop    rbx
    1eb9:	5d                   	pop    rbp
    1eba:	c3                   	ret    
    1ebb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1ec0:	8d 42 30             	lea    eax,[rdx+0x30]
    1ec3:	eb ad                	jmp    1e72 <SV_RateMsec+0x22>
    1ec5:	0f 1f 00             	nop    DWORD PTR [rax]
    1ec8:	31 c0                	xor    eax,eax
    1eca:	c3                   	ret    
    1ecb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001ed0 <SV_SendQueuedPackets>:
SV_SendQueuedPackets():
    1ed0:	41 54                	push   r12
    1ed2:	55                   	push   rbp
    1ed3:	53                   	push   rbx
    1ed4:	e8 00 00 00 00       	call   1ed9 <SV_SendQueuedPackets+0x9>
    1ed9:	89 c3                	mov    ebx,eax
    1edb:	85 c0                	test   eax,eax
    1edd:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
    1ee2:	0f 48 d8             	cmovs  ebx,eax
    1ee5:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1eec <SV_SendQueuedPackets+0x1c>
    1eec:	8b 68 30             	mov    ebp,DWORD PTR [rax+0x30]
    1eef:	85 ed                	test   ebp,ebp
    1ef1:	74 25                	je     1f18 <SV_SendQueuedPackets+0x48>
    1ef3:	e8 00 00 00 00       	call   1ef8 <SV_SendQueuedPackets+0x28>
    1ef8:	89 c5                	mov    ebp,eax
    1efa:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 1f00 <SV_SendQueuedPackets+0x30>
    1f00:	29 e8                	sub    eax,ebp
    1f02:	85 c0                	test   eax,eax
    1f04:	7e 2a                	jle    1f30 <SV_SendQueuedPackets+0x60>
    1f06:	8d 50 01             	lea    edx,[rax+0x1]
    1f09:	39 c3                	cmp    ebx,eax
    1f0b:	0f 4f da             	cmovg  ebx,edx
    1f0e:	89 d8                	mov    eax,ebx
    1f10:	5b                   	pop    rbx
    1f11:	5d                   	pop    rbp
    1f12:	41 5c                	pop    r12
    1f14:	c3                   	ret    
    1f15:	0f 1f 00             	nop    DWORD PTR [rax]
    1f18:	e8 00 00 00 00       	call   1f1d <SV_SendQueuedPackets+0x4d>
    1f1d:	85 c0                	test   eax,eax
    1f1f:	0f 45 dd             	cmovne ebx,ebp
    1f22:	89 d8                	mov    eax,ebx
    1f24:	5b                   	pop    rbx
    1f25:	5d                   	pop    rbp
    1f26:	41 5c                	pop    r12
    1f28:	c3                   	ret    
    1f29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1f30:	e8 00 00 00 00       	call   1f35 <SV_SendQueuedPackets+0x65>
    1f35:	41 89 c4             	mov    r12d,eax
    1f38:	85 c0                	test   eax,eax
    1f3a:	74 d2                	je     1f0e <SV_SendQueuedPackets+0x3e>
    1f3c:	e8 00 00 00 00       	call   1f41 <SV_SendQueuedPackets+0x71>
    1f41:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1f48 <SV_SendQueuedPackets+0x78>
    1f48:	89 c7                	mov    edi,eax
    1f4a:	89 c6                	mov    esi,eax
    1f4c:	41 69 c4 00 a0 0f 00 	imul   eax,r12d,0xfa000
    1f53:	8b 4a 30             	mov    ecx,DWORD PTR [rdx+0x30]
    1f56:	29 ef                	sub    edi,ebp
    1f58:	c1 e1 0a             	shl    ecx,0xa
    1f5b:	99                   	cdq    
    1f5c:	f7 f9                	idiv   ecx
    1f5e:	8d 57 01             	lea    edx,[rdi+0x1]
    1f61:	39 c2                	cmp    edx,eax
    1f63:	7c 1b                	jl     1f80 <SV_SendQueuedPackets+0xb0>
    1f65:	83 fb 02             	cmp    ebx,0x2
    1f68:	b8 02 00 00 00       	mov    eax,0x2
    1f6d:	0f 4f d8             	cmovg  ebx,eax
    1f70:	83 c6 01             	add    esi,0x1
    1f73:	89 35 00 00 00 00    	mov    DWORD PTR [rip+0x0],esi        # 1f79 <SV_SendQueuedPackets+0xa9>
    1f79:	eb 93                	jmp    1f0e <SV_SendQueuedPackets+0x3e>
    1f7b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    1f80:	01 c5                	add    ebp,eax
    1f82:	29 f8                	sub    eax,edi
    1f84:	39 c3                	cmp    ebx,eax
    1f86:	89 2d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebp        # 1f8c <SV_SendQueuedPackets+0xbc>
    1f8c:	0f 4f d8             	cmovg  ebx,eax
    1f8f:	e9 7a ff ff ff       	jmp    1f0e <SV_SendQueuedPackets+0x3e>

Disassembly of section .bss:

0000000000000000 <gvm>:
	...

0000000000000008 <dlNextRound.8126>:
	...

0000000000000010 <bucket.8011>:
	...

0000000000000018 <start.7914>:
	...

0000000000000020 <dummy.7913>:
	...

0000000000000060 <adr.7876>:
	...

00000000000001a0 <string.7845>:
	...

00000000000009a0 <redirectAddress>:
	...

00000000000009c0 <outboundRateLimit>:
	...

00000000000009e0 <bucketHashes>:
	...

00000000000029e0 <buckets>:
	...

Disassembly of section .rodata.str1.1:

0000000000000000 <.LC0>:
.LC0():
   0:	6d                   	ins    DWORD PTR es:[rdi],dx
   1:	61                   	(bad)  
   2:	70 6e                	jo     72 <.LC7+0xc>
   4:	61                   	(bad)  
   5:	6d                   	ins    DWORD PTR es:[rdi],dx
   6:	65 00            	add    BYTE PTR gs:[rbp+0x61],ch

0000000000000008 <.LC1>:
.LC1():
   8:	6d                   	ins    DWORD PTR es:[rdi],dx
   9:	61                   	(bad)  
   a:	70 20                	jo     2c <.LC4+0x7>
   c:	25 73 0a 00        	and    eax,0x70000a73

0000000000000010 <.LC2>:
.LC2():
  10:	70 72                	jo     84 <.LC8+0x9>
  12:	69 6e 74 0a 25 73 00 	imul   ebp,DWORD PTR [rsi+0x74],0x73250a

0000000000000019 <.LC3>:
.LC3():
  19:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  1a:	65 74 5f             	gs je  7c <.LC8+0x1>
  1d:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  1f:	61                   	(bad)  
  20:	62                   	(bad)  
  21:	6c                   	ins    BYTE PTR es:[rdi],dx
  22:	65 64 00         	gs add BYTE PTR fs:[rdx+0x65],dl

0000000000000025 <.LC4>:
.LC4():
  25:	52                   	push   rdx
  26:	65 73 6f             	gs jae 98 <.LC9+0x4>
  29:	6c                   	ins    BYTE PTR es:[rdi],dx
  2a:	76 69                	jbe    95 <.LC9+0x1>
  2c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  2d:	67 20 25 73 20 28 49 	and    BYTE PTR [eip+0x49282073],ah        # 492820a7 <buckets+0x4927f6c7>
  34:	50                   	push   rax
  35:	76 34                	jbe    6b <.LC7+0x5>
  37:	29 0a                	sub    DWORD PTR [rdx],ecx
	...

000000000000003a <.LC5>:
.LC5():
  3a:	25 73 20 72 65       	and    eax,0x65722073
  3f:	73 6f                	jae    b0 <.LC10+0x3>
  41:	6c                   	ins    BYTE PTR es:[rdi],dx
  42:	76 65                	jbe    a9 <.LC9+0x15>
  44:	64 20 74 6f 20       	and    BYTE PTR fs:[rdi+rbp*2+0x20],dh
  49:	25 73 0a 00        	and    eax,0x25000a73

000000000000004d <.LC6>:
.LC6():
  4d:	25 73 20 68 61       	and    eax,0x61682073
  52:	73 20                	jae    74 <.LC7+0xe>
  54:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  55:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  56:	20 49 50             	and    BYTE PTR [rcx+0x50],cl
  59:	76 34                	jbe    8f <.LC8+0x14>
  5b:	20 61 64             	and    BYTE PTR [rcx+0x64],ah
  5e:	64 72 65             	fs jb  c6 <.LC11+0xc>
  61:	73 73                	jae    d6 <.LC14+0x1>
  63:	2e 0a 00             	or     al,BYTE PTR cs:[rax]

0000000000000066 <.LC7>:
.LC7():
  66:	52                   	push   rdx
  67:	65 73 6f             	gs jae d9 <.LC14+0x4>
  6a:	6c                   	ins    BYTE PTR es:[rdi],dx
  6b:	76 69                	jbe    d6 <.LC14+0x1>
  6d:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  6e:	67 20 25 73 20 28 49 	and    BYTE PTR [eip+0x49282073],ah        # 492820e8 <buckets+0x4927f708>
  75:	50                   	push   rax
  76:	76 36                	jbe    ae <.LC10+0x1>
  78:	29 0a                	sub    DWORD PTR [rdx],ecx
	...

000000000000007b <.LC8>:
.LC8():
  7b:	25 73 20 68 61       	and    eax,0x61682073
  80:	73 20                	jae    a2 <.LC9+0xe>
  82:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  83:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  84:	20 49 50             	and    BYTE PTR [rcx+0x50],cl
  87:	76 36                	jbe    bf <.LC11+0x5>
  89:	20 61 64             	and    BYTE PTR [rcx+0x64],ah
  8c:	64 72 65             	fs jb  f4 <.LC16+0x1>
  8f:	73 73                	jae    104 <.LC18+0x2>
  91:	2e 0a 00             	or     al,BYTE PTR cs:[rax]

0000000000000094 <.LC9>:
.LC9():
  94:	53                   	push   rbx
  95:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  97:	64 69 6e 67 20 68 65 	imul   ebp,DWORD PTR fs:[rsi+0x67],0x61656820
  9e:	61 
  9f:	72 74                	jb     115 <.LC21+0x1>
  a1:	62                   	(bad)  
  a2:	65 61                	gs (bad) 
  a4:	74 20                	je     c6 <.LC11+0xc>
  a6:	74 6f                	je     117 <.LC21+0x3>
  a8:	20 25 73 0a 00     	and    BYTE PTR [rip+0x51000a73],ah        # 51000b21 <buckets+0x50ffe141>

00000000000000ad <.LC10>:
.LC10():
  ad:	51                   	push   rcx
  ae:	75 61                	jne    111 <.LC18+0xf>
  b0:	6b 65 41 72          	imul   esp,DWORD PTR [rbp+0x41],0x72
  b4:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  b6:	61                   	(bad)  
  b7:	2d 31 00         	sub    eax,0x65680031

00000000000000ba <.LC11>:
.LC11():
  ba:	68 65 61 72 74       	push   0x74726165
  bf:	62                   	(bad)  
  c0:	65 61                	gs (bad) 
  c2:	74 20                	je     e4 <.LC14+0xf>
  c4:	25 73 0a 00        	and    eax,0x63000a73

00000000000000c8 <.LC13>:
.LC13():
  c8:	63 6d 64             	movsxd ebp,DWORD PTR [rbp+0x64]
  cb:	20 25 35 64 3a 20    	and    BYTE PTR [rip+0x203a6435],ah        # 203a6506 <buckets+0x203a3b26>
  d1:	25 73 0a 00        	and    eax,0x53000a73

00000000000000d5 <.LC14>:
.LC14():
  d5:	53                   	push   rbx
  d6:	65 72 76             	gs jb  14f <.LC26+0x8>
  d9:	65 72 20             	gs jb  fc <.LC16+0x9>
  dc:	63 6f 6d             	movsxd ebp,DWORD PTR [rdi+0x6d]
  df:	6d                   	ins    DWORD PTR es:[rdi],dx
  e0:	61                   	(bad)  
  e1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  e2:	64 20 6f 76          	and    BYTE PTR fs:[rdi+0x76],ch
  e6:	65 72 66             	gs jb  14f <.LC26+0x8>
  e9:	6c                   	ins    BYTE PTR es:[rdi],dx
  ea:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  eb:	77 00                	ja     ed <.LC15>

00000000000000ed <.LC15>:
.LC15():
  ed:	70 72                	jo     161 <.LC27+0xe>
  ef:	69 6e 74 00    	imul   ebp,DWORD PTR [rsi+0x74],0x6f726200

00000000000000f3 <.LC16>:
.LC16():
  f3:	62 72 6f 61 64       	(bad)  {k1}
  f8:	63 61 73             	movsxd esp,DWORD PTR [rcx+0x73]
  fb:	74 3a                	je     137 <.LC22+0xd>
  fd:	20 25 73 0a 00     	and    BYTE PTR [rip+0x52000a73],ah        # 52000b76 <buckets+0x51ffe196>

0000000000000102 <.LC18>:
.LC18():
 102:	52                   	push   rdx
 103:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 106:	20 66 72             	and    BYTE PTR [rsi+0x72],ah
 109:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 10a:	6d                   	ins    DWORD PTR es:[rdi],dx
 10b:	20 25 73 3a 20 25    	and    BYTE PTR [rip+0x25203a73],ah        # 25203b84 <buckets+0x252011a4>
 111:	73 0a                	jae    11d <.LC21+0x9>
	...

0000000000000114 <.LC21>:
.LC21():
 114:	42 61                	rex.X (bad) 
 116:	64 20 72 63          	and    BYTE PTR fs:[rdx+0x63],dh
 11a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 11b:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 11c:	20 66 72             	and    BYTE PTR [rsi+0x72],ah
 11f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 120:	6d                   	ins    DWORD PTR es:[rdi],dx
 121:	20 25 73 3a 20 25    	and    BYTE PTR [rip+0x25203a73],ah        # 25203b9a <buckets+0x252011ba>
 127:	73 0a                	jae    133 <.LC22+0x9>
	...

000000000000012a <.LC22>:
.LC22():
 12a:	42 61                	rex.X (bad) 
 12c:	64 20 72 63          	and    BYTE PTR fs:[rdx+0x63],dh
 130:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 131:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 132:	70 61                	jo     195 <.LC35+0x1>
 134:	73 73                	jae    1a9 <.LC36+0x7>
 136:	77 6f                	ja     1a7 <.LC36+0x5>
 138:	72 64                	jb     19e <.LC35+0xa>
 13a:	2e 0a 00             	or     al,BYTE PTR cs:[rax]

000000000000013d <.LC25>:
.LC25():
 13d:	63 68 61             	movsxd ebp,DWORD PTR [rax+0x61]
 140:	6c                   	ins    BYTE PTR es:[rdi],dx
 141:	6c                   	ins    BYTE PTR es:[rdi],dx
 142:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 144:	67 65 00     	add    BYTE PTR gs:[eip+0x69252069],ah        # 692521b5 <buckets+0x6924f7d5>
 14b:	 

0000000000000147 <.LC26>:
.LC26():
 147:	25 69 20 25 69       	and    eax,0x69252069
 14c:	20 22                	and    BYTE PTR [rdx],ah
 14e:	25 73 22 0a 00       	and    eax,0xa2273

0000000000000153 <.LC27>:
.LC27():
 153:	73 74                	jae    1c9 <.LC41+0x3>
 155:	61                   	(bad)  
 156:	74 75                	je     1cd <.LC42+0x2>
 158:	73 52                	jae    1ac <.LC37+0x1>
 15a:	65 73 70             	gs jae 1cd <.LC42+0x2>
 15d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 15e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 15f:	73 65                	jae    1c6 <.LC41>
 161:	0a 25 73 0a 25 73    	or     ah,BYTE PTR [rip+0x73250a73]        # 73250bda <buckets+0x7324e1fa>
	...

0000000000000168 <.LC30>:
.LC30():
 168:	70 72                	jo     1dc <.LC44+0x1>
 16a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 16b:	74 6f                	je     1dc <.LC44+0x1>
 16d:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
	...

0000000000000171 <.LC31>:
.LC31():
 171:	68 6f 73 74 6e       	push   0x6e74736f
 176:	61                   	(bad)  
 177:	6d                   	ins    DWORD PTR es:[rdi],dx
 178:	65 00      	add    BYTE PTR gs:[rip+0x6c630069],ah        # 6c6301e8 <buckets+0x6c62d808>

000000000000017a <.LC32>:
.LC32():
 17a:	25 69 00         	and    eax,0x6c630069

000000000000017d <.LC33>:
.LC33():
 17d:	63 6c 69 65          	movsxd ebp,DWORD PTR [rcx+rbp*2+0x65]
 181:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 182:	74 73                	je     1f7 <.LC46+0x4>
	...

0000000000000185 <.LC34>:
.LC34():
 185:	67 5f                	addr32 pop rdi
 187:	68 75 6d 61 6e       	push   0x6e616d75
 18c:	70 6c                	jo     1fa <.LC46+0x7>
 18e:	61                   	(bad)  
 18f:	79 65                	jns    1f6 <.LC46+0x3>
 191:	72 73                	jb     206 <.LC48+0x1>
	...

0000000000000194 <.LC35>:
.LC35():
 194:	73 76                	jae    20c <.LC48+0x7>
 196:	5f                   	pop    rdi
 197:	6d                   	ins    DWORD PTR es:[rdi],dx
 198:	61                   	(bad)  
 199:	78 63                	js     1fe <.LC47+0x1>
 19b:	6c                   	ins    BYTE PTR es:[rdi],dx
 19c:	69 65 6e 74 73 00  	imul   esp,DWORD PTR [rbp+0x6e],0x67007374

00000000000001a2 <.LC36>:
.LC36():
 1a2:	67 61                	addr32 (bad) 
 1a4:	6d                   	ins    DWORD PTR es:[rdi],dx
 1a5:	65 74 79             	gs je  221 <.LC50+0x7>
 1a8:	70 65                	jo     20f <.LC48+0xa>
	...

00000000000001ab <.LC37>:
.LC37():
 1ab:	70 75                	jo     222 <.LC50+0x8>
 1ad:	72 65                	jb     214 <.LC49+0x2>
	...

00000000000001b0 <.LC38>:
.LC38():
 1b0:	67 5f                	addr32 pop rdi
 1b2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1b3:	65 65 64 70 61       	gs gs fs jo 219 <.LC49+0x7>
 1b8:	73 73                	jae    22d <.LC51+0x7>
	...

00000000000001bb <.LC39>:
.LC39():
 1bb:	25 64 00         	and    eax,0x73660064

00000000000001be <.LC40>:
.LC40():
 1be:	66 73 5f             	data16 jae 220 <.LC50+0x6>
 1c1:	67 61                	addr32 (bad) 
 1c3:	6d                   	ins    DWORD PTR es:[rdi],dx
 1c4:	65 00            	add    BYTE PTR gs:[rdi+0x61],ah

00000000000001c6 <.LC41>:
.LC41():
 1c6:	67 61                	addr32 (bad) 
 1c8:	6d                   	ins    DWORD PTR es:[rdi],dx
 1c9:	65 00            	add    BYTE PTR gs:[rcx+0x6e],ch

00000000000001cb <.LC42>:
.LC42():
 1cb:	69 6e 66 6f 52 65 73 	imul   ebp,DWORD PTR [rsi+0x66],0x7365526f
 1d2:	70 6f                	jo     243 <.LC57+0x2>
 1d4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1d5:	73 65                	jae    23c <.LC56+0x6>
 1d7:	0a 25 73 00      	or     ah,BYTE PTR [rip+0x56530073]        # 56530250 <buckets+0x5652d870>

00000000000001db <.LC44>:
.LC44():
 1db:	53                   	push   rbx
 1dc:	56                   	push   rsi
 1dd:	20 70 61             	and    BYTE PTR [rax+0x61],dh
 1e0:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 1e3:	74 20                	je     205 <.LC48>
 1e5:	25 73 20 3a 20       	and    eax,0x203a2073
 1ea:	25 73 0a 00        	and    eax,0x72000a73

00000000000001ee <.LC45>:
.LC45():
 1ee:	72 63                	jb     253 <.LC57+0x12>
 1f0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1f1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
	...

00000000000001f3 <.LC46>:
.LC46():
 1f3:	67 65 74 73          	addr32 gs je 26a <.LC59+0x1>
 1f7:	74 61                	je     25a <.LC57+0x19>
 1f9:	74 75                	je     270 <.LC59+0x7>
 1fb:	73 00                	jae    1fd <.LC47>

00000000000001fd <.LC47>:
.LC47():
 1fd:	67 65 74 69          	addr32 gs je 26a <.LC59+0x1>
 201:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 202:	66 6f                	outs   dx,WORD PTR ds:[rsi]
	...

0000000000000205 <.LC48>:
.LC48():
 205:	67 65 74 63          	addr32 gs je 26c <.LC59+0x3>
 209:	68 61 6c 6c 65       	push   0x656c6c61
 20e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 20f:	67 65 00         	add    BYTE PTR gs:[ebx+0x6f],ah

0000000000000212 <.LC49>:
.LC49():
 212:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 215:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 216:	65 63 74 00        	movsxd esi,DWORD PTR gs:[rax+rax*1+0x69]

000000000000021a <.LC50>:
.LC50():
 21a:	69 70 41 75 74 68 6f 	imul   esi,DWORD PTR [rax+0x41],0x6f687475
 221:	72 69                	jb     28c <.LC60+0x6>
 223:	7a 65                	jp     28a <.LC60+0x4>
	...

0000000000000226 <.LC51>:
.LC51():
 226:	64 69 73 63 6f 6e 6e 	imul   esi,DWORD PTR fs:[rbx+0x63],0x656e6e6f
 22d:	65 
 22e:	63 74 00           	movsxd esi,DWORD PTR [rax+rax*1+0x31]

0000000000000231 <.LC55>:
.LC55():
 231:	31 30                	xor    DWORD PTR [rax],esi
 233:	30 30                	xor    BYTE PTR [rax],dh
	...

0000000000000236 <.LC56>:
.LC56():
 236:	73 76                	jae    2ae <.LC64+0x3>
 238:	5f                   	pop    rdi
 239:	6d                   	ins    DWORD PTR es:[rdi],dx
 23a:	61                   	(bad)  
 23b:	78 52                	js     28f <.LC60+0x9>
 23d:	61                   	(bad)  
 23e:	74 65                	je     2a5 <.LC62+0xb>
	...

0000000000000241 <.LC57>:
.LC57():
 241:	73 76                	jae    2b9 <.LC65+0x4>
 243:	5f                   	pop    rdi
 244:	6d                   	ins    DWORD PTR es:[rdi],dx
 245:	61                   	(bad)  
 246:	78 52                	js     29a <.LC62>
 248:	61                   	(bad)  
 249:	74 65                	je     2b0 <.LC64+0x5>
 24b:	20 61 64             	and    BYTE PTR [rcx+0x64],ah
 24e:	6a 75                	push   0x75
 250:	73 74                	jae    2c6 <.LC65+0x11>
 252:	65 64 20 74 6f 20    	gs and BYTE PTR fs:[rdi+rbp*2+0x20],dh
 258:	31 30                	xor    DWORD PTR [rax],esi
 25a:	30 30                	xor    BYTE PTR [rax],dh
 25c:	0a 00                	or     al,BYTE PTR [rax]

000000000000025e <.LC58>:
.LC58():
 25e:	73 76                	jae    2d6 <.LC67+0x7>
 260:	5f                   	pop    rdi
 261:	6d                   	ins    DWORD PTR es:[rdi],dx
 262:	69 6e 52 61 74 65 00 	imul   ebp,DWORD PTR [rsi+0x52],0x657461

0000000000000269 <.LC59>:
.LC59():
 269:	73 76                	jae    2e1 <.LC68>
 26b:	5f                   	pop    rdi
 26c:	6d                   	ins    DWORD PTR es:[rdi],dx
 26d:	69 6e 52 61 74 65 20 	imul   ebp,DWORD PTR [rsi+0x52],0x20657461
 274:	61                   	(bad)  
 275:	64 6a 75             	fs push 0x75
 278:	73 74                	jae    2ee <.LC68+0xd>
 27a:	65 64 20 74 6f 20    	gs and BYTE PTR fs:[rdi+rbp*2+0x20],dh
 280:	31 30                	xor    DWORD PTR [rax],esi
 282:	30 30                	xor    BYTE PTR [rax],dh
 284:	0a 00                	or     al,BYTE PTR [rax]

0000000000000286 <.LC60>:
.LC60():
 286:	53                   	push   rbx
 287:	65 72 76             	gs jb  300 <.LC70+0x10>
 28a:	65 72 20             	gs jb  2ad <.LC64+0x2>
 28d:	77 61                	ja     2f0 <.LC70>
 28f:	73 20                	jae    2b1 <.LC64+0x6>
 291:	6b 69 6c 6c          	imul   ebp,DWORD PTR [rcx+0x6c],0x6c
 295:	65 64 00           	gs add BYTE PTR fs:[rax],dh

0000000000000298 <.LC61>:
.LC61():
 298:	30 00                	xor    BYTE PTR [rax],al

000000000000029a <.LC62>:
.LC62():
 29a:	73 76                	jae    312 <.LC70+0x22>
 29c:	5f                   	pop    rdi
 29d:	6b 69 6c 6c          	imul   ebp,DWORD PTR [rcx+0x6c],0x6c
 2a1:	73 65                	jae    308 <.LC70+0x18>
 2a3:	72 76                	jb     31b <.LC70+0x2b>
 2a5:	65 72 00             	gs jb  2a8 <.LC63>

00000000000002a8 <.LC63>:
.LC63():
 2a8:	25 66 00         	and    eax,0x69740066

00000000000002ab <.LC64>:
.LC64():
 2ab:	74 69                	je     316 <.LC70+0x26>
 2ad:	6d                   	ins    DWORD PTR es:[rdi],dx
 2ae:	65 73 63             	gs jae 314 <.LC70+0x24>
 2b1:	61                   	(bad)  
 2b2:	6c                   	ins    BYTE PTR es:[rdi],dx
 2b3:	65 00          	add    BYTE PTR gs:[rcx+rbp*2+0x6d],dh

00000000000002b5 <.LC65>:
.LC65():
 2b5:	74 69                	je     320 <.LC70+0x30>
 2b7:	6d                   	ins    DWORD PTR es:[rdi],dx
 2b8:	65 73 63             	gs jae 31e <.LC70+0x2e>
 2bb:	61                   	(bad)  
 2bc:	6c                   	ins    BYTE PTR es:[rdi],dx
 2bd:	65 20 61 64          	and    BYTE PTR gs:[rcx+0x64],ah
 2c1:	6a 75                	push   0x75
 2c3:	73 74                	jae    339 <.LC70+0x49>
 2c5:	65 64 20 74 6f 20    	gs and BYTE PTR fs:[rdi+rbp*2+0x20],dh
 2cb:	25 66 0a 00        	and    eax,0x52000a66

00000000000002cf <.LC67>:
.LC67():
 2cf:	52                   	push   rdx
 2d0:	65 73 74             	gs jae 347 <.LC70+0x57>
 2d3:	61                   	(bad)  
 2d4:	72 74                	jb     34a <.LC70+0x5a>
 2d6:	69 6e 67 20 73 65 72 	imul   ebp,DWORD PTR [rsi+0x67],0x72657320
 2dd:	76 65                	jbe    344 <.LC70+0x54>
 2df:	72 00                	jb     2e1 <.LC68>

00000000000002e1 <.LC68>:
.LC68():
 2e1:	6d                   	ins    DWORD PTR es:[rdi],dx
 2e2:	61                   	(bad)  
 2e3:	70 5f                	jo     344 <.LC70+0x54>
 2e5:	72 65                	jb     34c <.LC70+0x5c>
 2e7:	73 74                	jae    35d <.LC70+0x6d>
 2e9:	61                   	(bad)  
 2ea:	72 74                	jb     360 <.LC70+0x70>
 2ec:	20 30                	and    BYTE PTR [rax],dh
 2ee:	0a 00                	or     al,BYTE PTR [rax]

00000000000002f0 <.LC70>:
.LC70():
 2f0:	74 69                	je     35b <.LC70+0x6b>
 2f2:	6d                   	ins    DWORD PTR es:[rdi],dx
 2f3:	65 64 20 6f 75       	gs and BYTE PTR fs:[rdi+0x75],ch
 2f8:	74 00                	je     2fa <.LC70+0xa>

Disassembly of section .rodata.str1.8:

0000000000000000 <.LC12>:
.LC12():
   0:	3d 3d 3d 3d 3d       	cmp    eax,0x3d3d3d3d
   5:	20 70 65             	and    BYTE PTR [rax+0x65],dh
   8:	6e                   	outs   dx,BYTE PTR ds:[rsi]
   9:	64 69 6e 67 20 73 65 	imul   ebp,DWORD PTR fs:[rsi+0x67],0x72657320
  10:	72 
  11:	76 65                	jbe    78 <.LC19+0x8>
  13:	72 20                	jb     35 <.LC17+0xd>
  15:	63 6f 6d             	movsxd ebp,DWORD PTR [rdi+0x6d]
  18:	6d                   	ins    DWORD PTR es:[rdi],dx
  19:	61                   	(bad)  
  1a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  1b:	64 73 20             	fs jae 3e <.LC17+0x16>
  1e:	3d 3d 3d 3d 3d       	cmp    eax,0x3d3d3d3d
  23:	0a 00                	or     al,BYTE PTR [rax]
  25:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000028 <.LC17>:
.LC17():
  28:	53                   	push   rbx
  29:	56                   	push   rsi
  2a:	43 5f                	rex.XB pop r15
  2c:	52                   	push   rdx
  2d:	65 6d                	gs ins DWORD PTR es:[rdi],dx
  2f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  30:	74 65                	je     97 <.LC19+0x27>
  32:	43 6f                	rex.XB outs dx,DWORD PTR ds:[rsi]
  34:	6d                   	ins    DWORD PTR es:[rdi],dx
  35:	6d                   	ins    DWORD PTR es:[rdi],dx
  36:	61                   	(bad)  
  37:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  38:	64 3a 20             	cmp    ah,BYTE PTR fs:[rax]
  3b:	72 61                	jb     9e <.LC20+0x6>
  3d:	74 65                	je     a4 <.LC20+0xc>
  3f:	20 6c 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],ch
  43:	69 74 20 66 72 6f 6d 	imul   esi,DWORD PTR [rax+riz*1+0x66],0x206d6f72
  4a:	20 
  4b:	25 73 20 65 78       	and    eax,0x78652073
  50:	63 65 65             	movsxd esp,DWORD PTR [rbp+0x65]
  53:	64 65 64 2c 20       	fs gs fs sub al,0x20
  58:	64 72 6f             	fs jb  ca <.LC20+0x32>
  5b:	70 70                	jo     cd <.LC20+0x35>
  5d:	69 6e 67 20 72 65 71 	imul   ebp,DWORD PTR [rsi+0x67],0x71657220
  64:	75 65                	jne    cb <.LC20+0x33>
  66:	73 74                	jae    dc <.LC23+0x4>
  68:	0a 00                	or     al,BYTE PTR [rax]
  6a:	00 00                	add    BYTE PTR [rax],al
  6c:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000070 <.LC19>:
.LC19():
  70:	4e 6f                	rex.WRX outs dx,DWORD PTR ds:[rsi]
  72:	20 72 63             	and    BYTE PTR [rdx+0x63],dh
  75:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  76:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  77:	70 61                	jo     da <.LC23+0x2>
  79:	73 73                	jae    ee <.LC23+0x16>
  7b:	77 6f                	ja     ec <.LC23+0x14>
  7d:	72 64                	jb     e3 <.LC23+0xb>
  7f:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
  82:	74 20                	je     a4 <.LC20+0xc>
  84:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  85:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  86:	20 74 68 65          	and    BYTE PTR [rax+rbp*2+0x65],dh
  8a:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
  8d:	72 76                	jb     105 <.LC23+0x2d>
  8f:	65 72 2e             	gs jb  c0 <.LC20+0x28>
  92:	0a 00                	or     al,BYTE PTR [rax]
  94:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000098 <.LC20>:
.LC20():
  98:	53                   	push   rbx
  99:	56                   	push   rsi
  9a:	43 5f                	rex.XB pop r15
  9c:	52                   	push   rdx
  9d:	65 6d                	gs ins DWORD PTR es:[rdi],dx
  9f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  a0:	74 65                	je     107 <.LC23+0x2f>
  a2:	43 6f                	rex.XB outs dx,DWORD PTR ds:[rsi]
  a4:	6d                   	ins    DWORD PTR es:[rdi],dx
  a5:	6d                   	ins    DWORD PTR es:[rdi],dx
  a6:	61                   	(bad)  
  a7:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  a8:	64 3a 20             	cmp    ah,BYTE PTR fs:[rax]
  ab:	72 61                	jb     10e <.LC23+0x36>
  ad:	74 65                	je     114 <.LC23+0x3c>
  af:	20 6c 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],ch
  b3:	69 74 20 65 78 63 65 	imul   esi,DWORD PTR [rax+riz*1+0x65],0x65656378
  ba:	65 
  bb:	64 65 64 2c 20       	fs gs fs sub al,0x20
  c0:	64 72 6f             	fs jb  132 <.LC24+0x1a>
  c3:	70 70                	jo     135 <.LC24+0x1d>
  c5:	69 6e 67 20 72 65 71 	imul   ebp,DWORD PTR [rsi+0x67],0x71657220
  cc:	75 65                	jne    133 <.LC24+0x1b>
  ce:	73 74                	jae    144 <.LC24+0x2c>
  d0:	0a 00                	or     al,BYTE PTR [rax]
  d2:	00 00                	add    BYTE PTR [rax],al
  d4:	00 00                	add    BYTE PTR [rax],al
	...

00000000000000d8 <.LC23>:
.LC23():
  d8:	53                   	push   rbx
  d9:	56                   	push   rsi
  da:	43 5f                	rex.XB pop r15
  dc:	53                   	push   rbx
  dd:	74 61                	je     140 <.LC24+0x28>
  df:	74 75                	je     156 <.LC28+0x6>
  e1:	73 3a                	jae    11d <.LC24+0x5>
  e3:	20 72 61             	and    BYTE PTR [rdx+0x61],dh
  e6:	74 65                	je     14d <.LC24+0x35>
  e8:	20 6c 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],ch
  ec:	69 74 20 66 72 6f 6d 	imul   esi,DWORD PTR [rax+riz*1+0x66],0x206d6f72
  f3:	20 
  f4:	25 73 20 65 78       	and    eax,0x78652073
  f9:	63 65 65             	movsxd esp,DWORD PTR [rbp+0x65]
  fc:	64 65 64 2c 20       	fs gs fs sub al,0x20
 101:	64 72 6f             	fs jb  173 <.LC28+0x23>
 104:	70 70                	jo     176 <.LC28+0x26>
 106:	69 6e 67 20 72 65 71 	imul   ebp,DWORD PTR [rsi+0x67],0x71657220
 10d:	75 65                	jne    174 <.LC28+0x24>
 10f:	73 74                	jae    185 <.LC28+0x35>
 111:	0a 00                	or     al,BYTE PTR [rax]
 113:	00 00                	add    BYTE PTR [rax],al
 115:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000118 <.LC24>:
.LC24():
 118:	53                   	push   rbx
 119:	56                   	push   rsi
 11a:	43 5f                	rex.XB pop r15
 11c:	53                   	push   rbx
 11d:	74 61                	je     180 <.LC28+0x30>
 11f:	74 75                	je     196 <.LC29+0x6>
 121:	73 3a                	jae    15d <.LC28+0xd>
 123:	20 72 61             	and    BYTE PTR [rdx+0x61],dh
 126:	74 65                	je     18d <.LC28+0x3d>
 128:	20 6c 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],ch
 12c:	69 74 20 65 78 63 65 	imul   esi,DWORD PTR [rax+riz*1+0x65],0x65656378
 133:	65 
 134:	64 65 64 2c 20       	fs gs fs sub al,0x20
 139:	64 72 6f             	fs jb  1ab <.LC29+0x1b>
 13c:	70 70                	jo     1ae <.LC29+0x1e>
 13e:	69 6e 67 20 72 65 71 	imul   ebp,DWORD PTR [rsi+0x67],0x71657220
 145:	75 65                	jne    1ac <.LC29+0x1c>
 147:	73 74                	jae    1bd <.LC29+0x2d>
 149:	0a 00                	or     al,BYTE PTR [rax]
 14b:	00 00                	add    BYTE PTR [rax],al
 14d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000150 <.LC28>:
.LC28():
 150:	53                   	push   rbx
 151:	56                   	push   rsi
 152:	43 5f                	rex.XB pop r15
 154:	49 6e                	rex.WB outs dx,BYTE PTR ds:[rsi]
 156:	66 6f                	outs   dx,WORD PTR ds:[rsi]
 158:	3a 20                	cmp    ah,BYTE PTR [rax]
 15a:	72 61                	jb     1bd <.LC29+0x2d>
 15c:	74 65                	je     1c3 <.LC29+0x33>
 15e:	20 6c 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],ch
 162:	69 74 20 66 72 6f 6d 	imul   esi,DWORD PTR [rax+riz*1+0x66],0x206d6f72
 169:	20 
 16a:	25 73 20 65 78       	and    eax,0x78652073
 16f:	63 65 65             	movsxd esp,DWORD PTR [rbp+0x65]
 172:	64 65 64 2c 20       	fs gs fs sub al,0x20
 177:	64 72 6f             	fs jb  1e9 <.LC43+0x21>
 17a:	70 70                	jo     1ec <.LC43+0x24>
 17c:	69 6e 67 20 72 65 71 	imul   ebp,DWORD PTR [rsi+0x67],0x71657220
 183:	75 65                	jne    1ea <.LC43+0x22>
 185:	73 74                	jae    1fb <.LC52+0xb>
 187:	0a 00                	or     al,BYTE PTR [rax]
 189:	00 00                	add    BYTE PTR [rax],al
 18b:	00 00                	add    BYTE PTR [rax],al
 18d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000190 <.LC29>:
.LC29():
 190:	53                   	push   rbx
 191:	56                   	push   rsi
 192:	43 5f                	rex.XB pop r15
 194:	49 6e                	rex.WB outs dx,BYTE PTR ds:[rsi]
 196:	66 6f                	outs   dx,WORD PTR ds:[rsi]
 198:	3a 20                	cmp    ah,BYTE PTR [rax]
 19a:	72 61                	jb     1fd <.LC52+0xd>
 19c:	74 65                	je     203 <.LC52+0x13>
 19e:	20 6c 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],ch
 1a2:	69 74 20 65 78 63 65 	imul   esi,DWORD PTR [rax+riz*1+0x65],0x65656378
 1a9:	65 
 1aa:	64 65 64 2c 20       	fs gs fs sub al,0x20
 1af:	64 72 6f             	fs jb  221 <.LC53+0x9>
 1b2:	70 70                	jo     224 <.LC53+0xc>
 1b4:	69 6e 67 20 72 65 71 	imul   ebp,DWORD PTR [rsi+0x67],0x71657220
 1bb:	75 65                	jne    222 <.LC53+0xa>
 1bd:	73 74                	jae    233 <.LC53+0x1b>
 1bf:	0a 00                	or     al,BYTE PTR [rax]
 1c1:	00 00                	add    BYTE PTR [rax],al
 1c3:	00 00                	add    BYTE PTR [rax],al
 1c5:	00 00                	add    BYTE PTR [rax],al
	...

00000000000001c8 <.LC43>:
.LC43():
 1c8:	25 73 20 3a 20       	and    eax,0x203a2073
 1cd:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 1d0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1d1:	65 63 74 20 70       	movsxd esi,DWORD PTR gs:[rax+riz*1+0x70]
 1d6:	61                   	(bad)  
 1d7:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 1da:	74 20                	je     1fc <.LC52+0xc>
 1dc:	69 73 20 74 6f 6f 20 	imul   esi,DWORD PTR [rbx+0x20],0x206f6f74
 1e3:	6c                   	ins    BYTE PTR es:[rdi],dx
 1e4:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1e5:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1e6:	67 20 2d 20 25 69 0a 	and    BYTE PTR [eip+0xa692520],ch        # a69270d <buckets+0xa68fd2d>
 1ed:	00 00                	add    BYTE PTR [rax],al
	...

00000000000001f0 <.LC52>:
.LC52():
 1f0:	62 61 64 20 63       	(bad)  
 1f5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1f6:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1f7:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1f8:	65 63 74 69 6f       	movsxd esi,DWORD PTR gs:[rcx+rbp*2+0x6f]
 1fd:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 1fe:	6c                   	ins    BYTE PTR es:[rdi],dx
 1ff:	65 73 73             	gs jae 275 <.LC69+0x5>
 202:	20 70 61             	and    BYTE PTR [rax+0x61],dh
 205:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 208:	74 20                	je     22a <.LC53+0x12>
 20a:	66 72 6f             	data16 jb 27c <.LC69+0xc>
 20d:	6d                   	ins    DWORD PTR es:[rdi],dx
 20e:	20 25 73 3a 0a 25    	and    BYTE PTR [rip+0x250a3a73],ah        # 250a3c87 <buckets+0x250a12a7>
 214:	73 0a                	jae    220 <.LC53+0x8>
	...

0000000000000218 <.LC53>:
.LC53():
 218:	53                   	push   rbx
 219:	56                   	push   rsi
 21a:	5f                   	pop    rdi
 21b:	50                   	push   rax
 21c:	61                   	(bad)  
 21d:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 220:	74 45                	je     267 <.LC66+0x1f>
 222:	76 65                	jbe    289 <.LC69+0x19>
 224:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 225:	74 3a                	je     261 <.LC66+0x19>
 227:	20 66 69             	and    BYTE PTR [rsi+0x69],ah
 22a:	78 69                	js     295 <.LC69+0x25>
 22c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 22d:	67 20 75 70          	and    BYTE PTR [ebp+0x70],dh
 231:	20 61 20             	and    BYTE PTR [rcx+0x20],ah
 234:	74 72                	je     2a8 <.LC63>
 236:	61                   	(bad)  
 237:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 238:	73 6c                	jae    2a6 <.LC62+0xc>
 23a:	61                   	(bad)  
 23b:	74 65                	je     2a2 <.LC62+0x8>
 23d:	64 20 70 6f          	and    BYTE PTR fs:[rax+0x6f],dh
 241:	72 74                	jb     2b7 <.LC65+0x2>
 243:	0a 00                	or     al,BYTE PTR [rax]
 245:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000248 <.LC66>:
.LC66():
 248:	52                   	push   rdx
 249:	65 73 74             	gs jae 2c0 <.LC65+0xb>
 24c:	61                   	(bad)  
 24d:	72 74                	jb     2c3 <.LC65+0xe>
 24f:	69 6e 67 20 73 65 72 	imul   ebp,DWORD PTR [rsi+0x67],0x72657320
 256:	76 65                	jbe    2bd <.LC65+0x8>
 258:	72 20                	jb     27a <.LC69+0xa>
 25a:	64 75 65             	fs jne 2c2 <.LC65+0xd>
 25d:	20 74 6f 20          	and    BYTE PTR [rdi+rbp*2+0x20],dh
 261:	74 69                	je     2cc <.LC65+0x17>
 263:	6d                   	ins    DWORD PTR es:[rdi],dx
 264:	65 20 77 72          	and    BYTE PTR gs:[rdi+0x72],dh
 268:	61                   	(bad)  
 269:	70 70                	jo     2db <.LC67+0xc>
 26b:	69 6e 67 00 00   	imul   ebp,DWORD PTR [rsi+0x67],0x6f470000

0000000000000270 <.LC69>:
.LC69():
 270:	47 6f                	rex.RXB outs dx,DWORD PTR ds:[rsi]
 272:	69 6e 67 20 66 72 6f 	imul   ebp,DWORD PTR [rsi+0x67],0x6f726620
 279:	6d                   	ins    DWORD PTR es:[rdi],dx
 27a:	20 43 53             	and    BYTE PTR [rbx+0x53],al
 27d:	5f                   	pop    rdi
 27e:	5a                   	pop    rdx
 27f:	4f                   	rex.WRXB
 280:	4d                   	rex.WRB
 281:	42                   	rex.X
 282:	49                   	rex.WB
 283:	45 20 74 6f 20       	and    BYTE PTR [r15+rbp*2+0x20],r14b
 288:	43 53                	rex.XB push r11
 28a:	5f                   	pop    rdi
 28b:	46 52                	rex.RX push rdx
 28d:	45                   	rex.RB
 28e:	45 20 66 6f          	and    BYTE PTR [r14+0x6f],r12b
 292:	72 20                	jb     2b4 <.LC64+0x9>
 294:	63 6c 69 65          	movsxd ebp,DWORD PTR [rcx+rbp*2+0x65]
 298:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 299:	74 20                	je     2bb <.LC65+0x6>
 29b:	25                   	.byte 0x25
 29c:	64 0a 00             	or     al,BYTE PTR fs:[rax]

Disassembly of section .rodata.cst4:

0000000000000000 <.LC54>:
.LC54():
   0:	00 00                	add    BYTE PTR [rax],al
   2:	7a 44                	jp     48 <.LC5+0xe>

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	00 47 43             	add    BYTE PTR [rdi+0x43],al
   3:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
   6:	28 44 65 62          	sub    BYTE PTR [rbp+riz*2+0x62],al
   a:	69 61 6e 20 38 2e 33 	imul   esp,DWORD PTR [rcx+0x6e],0x332e3820
  11:	2e 30 2d 36 29 20 38 	xor    BYTE PTR cs:[rip+0x38202936],ch        # 3820294e <buckets+0x381fff6e>
  18:	2e 33 2e             	xor    ebp,DWORD PTR cs:[rsi]
  1b:	30 00                	xor    BYTE PTR [rax],al

Disassembly of section .eh_frame:

0000000000000000 <.eh_frame>:
   0:	14 00                	adc    al,0x0
   2:	00 00                	add    BYTE PTR [rax],al
   4:	00 00                	add    BYTE PTR [rax],al
   6:	00 00                	add    BYTE PTR [rax],al
   8:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
   b:	00 01                	add    BYTE PTR [rcx],al
   d:	78 10                	js     1f <.eh_frame+0x1f>
   f:	01 1b                	add    DWORD PTR [rbx],ebx
  11:	0c 07                	or     al,0x7
  13:	08 90 01 00 00 28    	or     BYTE PTR [rax+0x28000001],dl
  19:	00 00                	add    BYTE PTR [rax],al
  1b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
  1e:	00 00                	add    BYTE PTR [rax],al
  20:	00 00                	add    BYTE PTR [rax],al
  22:	00 00                	add    BYTE PTR [rax],al
  24:	cc                   	int3   
  25:	00 00                	add    BYTE PTR [rax],al
  27:	00 00                	add    BYTE PTR [rax],al
  29:	41 0e                	rex.B (bad) 
  2b:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
  31:	83 03 47             	add    DWORD PTR [rbx],0x47
  34:	0e                   	(bad)  
  35:	a0 02 02 8d 0a 0e 18 	movabs al,ds:0xe41180e0a8d0202
  3c:	41 0e 
  3e:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
  41:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
  44:	10 00                	adc    BYTE PTR [rax],al
  46:	00 00                	add    BYTE PTR [rax],al
  48:	48 00 00             	rex.W add BYTE PTR [rax],al
  4b:	00 00                	add    BYTE PTR [rax],al
  4d:	00 00                	add    BYTE PTR [rax],al
  4f:	00 2d 00 00 00 00    	add    BYTE PTR [rip+0x0],ch        # 55 <.eh_frame+0x55>
  55:	00 00                	add    BYTE PTR [rax],al
  57:	00 48 00             	add    BYTE PTR [rax+0x0],cl
  5a:	00 00                	add    BYTE PTR [rax],al
  5c:	5c                   	pop    rsp
  5d:	00 00                	add    BYTE PTR [rax],al
  5f:	00 00                	add    BYTE PTR [rax],al
  61:	00 00                	add    BYTE PTR [rax],al
  63:	00 e1                	add    cl,ah
  65:	02 00                	add    al,BYTE PTR [rax]
  67:	00 00                	add    BYTE PTR [rax],al
  69:	42 0e                	rex.X (bad) 
  6b:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
  71:	8e 03                	mov    es,WORD PTR [rbx]
  73:	42 0e                	rex.X (bad) 
  75:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
  7b:	8c 05 44 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e44],es        # ffffffff86300ec5 <buckets+0xffffffff862fe4e5>
  81:	06                   	(bad)  
  82:	44 0e                	rex.R (bad) 
  84:	38 83 07 44 0e 50    	cmp    BYTE PTR [rbx+0x500e4407],al
  8a:	03 1f                	add    ebx,DWORD PTR [rdi]
  8c:	02 0a                	add    cl,BYTE PTR [rdx]
  8e:	0e                   	(bad)  
  8f:	38 44 0e 30          	cmp    BYTE PTR [rsi+rcx*1+0x30],al
  93:	41 0e                	rex.B (bad) 
  95:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
  98:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
  9b:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
  9e:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
  a1:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
  a4:	48 00 00             	rex.W add BYTE PTR [rax],al
  a7:	00 a8 00 00 00 00    	add    BYTE PTR [rax+0x0],ch
  ad:	00 00                	add    BYTE PTR [rax],al
  af:	00 94 02 00 00 00 42 	add    BYTE PTR [rdx+rax*1+0x42000000],dl
  b6:	0e                   	(bad)  
  b7:	10 8f 02 49 0e 18    	adc    BYTE PTR [rdi+0x180e4902],cl
  bd:	8e 03                	mov    es,WORD PTR [rbx]
  bf:	42 0e                	rex.X (bad) 
  c1:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
  c7:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff86300f0e <buckets+0xffffffff862fe52e>
  cd:	06                   	(bad)  
  ce:	41 0e                	rex.B (bad) 
  d0:	38 83 07 44 0e 50    	cmp    BYTE PTR [rbx+0x500e4407],al
  d6:	03 03                	add    eax,DWORD PTR [rbx]
  d8:	01 0a                	add    DWORD PTR [rdx],ecx
  da:	0e                   	(bad)  
  db:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
  de:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
  e1:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
  e4:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
  e7:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
  ea:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
  ed:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
  f0:	40 00 00             	add    BYTE PTR [rax],al
  f3:	00 f4                	add    ah,dh
  f5:	00 00                	add    BYTE PTR [rax],al
  f7:	00 00                	add    BYTE PTR [rax],al
  f9:	00 00                	add    BYTE PTR [rax],al
  fb:	00 ed                	add    ch,ch
  fd:	00 00                	add    BYTE PTR [rax],al
  ff:	00 00                	add    BYTE PTR [rax],al
 101:	02 4a 0e             	add    cl,BYTE PTR [rdx+0xe]
 104:	10 8e 02 44 0e 18    	adc    BYTE PTR [rsi+0x180e4402],cl
 10a:	8d 03                	lea    eax,[rbx]
 10c:	42 0e                	rex.X (bad) 
 10e:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
 115:	05 44 0e 30 83       	add    eax,0x83300e44
 11a:	06                   	(bad)  
 11b:	02 82 0a c3 0e 28    	add    al,BYTE PTR [rdx+0x280ec30a]
 121:	41 c6                	rex.B (bad) 
 123:	0e                   	(bad)  
 124:	20 42 cc             	and    BYTE PTR [rdx-0x34],al
 127:	0e                   	(bad)  
 128:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 12b:	0e                   	(bad)  
 12c:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 12f:	0e                   	(bad)  
 130:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 133:	00 48 00             	add    BYTE PTR [rax+0x0],cl
 136:	00 00                	add    BYTE PTR [rax],al
 138:	38 01                	cmp    BYTE PTR [rcx],al
 13a:	00 00                	add    BYTE PTR [rax],al
 13c:	00 00                	add    BYTE PTR [rax],al
 13e:	00 00                	add    BYTE PTR [rax],al
 140:	f2 01 00             	repnz add DWORD PTR [rax],eax
 143:	00 00                	add    BYTE PTR [rax],al
 145:	42 0e                	rex.X (bad) 
 147:	10 8d 02 42 0e 18    	adc    BYTE PTR [rbp+0x180e4202],cl
 14d:	8c 03                	mov    WORD PTR [rbx],es
 14f:	41 0e                	rex.B (bad) 
 151:	20 86 04 41 0e 28    	and    BYTE PTR [rsi+0x280e4104],al
 157:	83 05 4a 0e 80 0b 02 	add    DWORD PTR [rip+0xb800e4a],0x2        # b800fa8 <buckets+0xb7fe5c8>
 15e:	d3 0a                	ror    DWORD PTR [rdx],cl
 160:	0e                   	(bad)  
 161:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 164:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 167:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 16a:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 16d:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 170:	02 fb                	add    bh,bl
 172:	0e                   	(bad)  
 173:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 176:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 179:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 17c:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 17f:	08 14 00             	or     BYTE PTR [rax+rax*1],dl
 182:	00 00                	add    BYTE PTR [rax],al
 184:	84 01                	test   BYTE PTR [rcx],al
 186:	00 00                	add    BYTE PTR [rax],al
 188:	00 00                	add    BYTE PTR [rax],al
 18a:	00 00                	add    BYTE PTR [rax],al
 18c:	2a 00                	sub    al,BYTE PTR [rax]
 18e:	00 00                	add    BYTE PTR [rax],al
 190:	00 44 0e 10          	add    BYTE PTR [rsi+rcx*1+0x10],al
 194:	61                   	(bad)  
 195:	0e                   	(bad)  
 196:	08 00                	or     BYTE PTR [rax],al
 198:	28 00                	sub    BYTE PTR [rax],al
 19a:	00 00                	add    BYTE PTR [rax],al
 19c:	9c                   	pushf  
 19d:	01 00                	add    DWORD PTR [rax],eax
 19f:	00 00                	add    BYTE PTR [rax],al
 1a1:	00 00                	add    BYTE PTR [rax],al
 1a3:	00 5d 00             	add    BYTE PTR [rbp+0x0],bl
 1a6:	00 00                	add    BYTE PTR [rax],al
 1a8:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
 1ab:	10 8c 02 44 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bc],cl
 1b2:	03 43 0e             	add    eax,DWORD PTR [rbx+0xe]
 1b5:	20 83 04 7e 0a 0e    	and    BYTE PTR [rbx+0xe0a7e04],al
 1bb:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 1be:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 1c1:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 1c4:	30 00                	xor    BYTE PTR [rax],al
 1c6:	00 00                	add    BYTE PTR [rax],al
 1c8:	c8 01 00 00          	enter  0x1,0x0
 1cc:	00 00                	add    BYTE PTR [rax],al
 1ce:	00 00                	add    BYTE PTR [rax],al
 1d0:	3c 00                	cmp    al,0x0
 1d2:	00 00                	add    BYTE PTR [rax],al
 1d4:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 1d7:	10 86 02 45 0e 18    	adc    BYTE PTR [rsi+0x180e4502],al
 1dd:	83 03 46             	add    DWORD PTR [rbx],0x46
 1e0:	0e                   	(bad)  
 1e1:	20 4e 0a             	and    BYTE PTR [rsi+0xa],cl
 1e4:	0e                   	(bad)  
 1e5:	18 49 0e             	sbb    BYTE PTR [rcx+0xe],cl
 1e8:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 1eb:	08 4c 0b 44          	or     BYTE PTR [rbx+rcx*1+0x44],cl
 1ef:	0e                   	(bad)  
 1f0:	18 46 0e             	sbb    BYTE PTR [rsi+0xe],al
 1f3:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 1f6:	08 00                	or     BYTE PTR [rax],al
 1f8:	44 00 00             	add    BYTE PTR [rax],r8b
 1fb:	00 fc                	add    ah,bh
 1fd:	01 00                	add    DWORD PTR [rax],eax
 1ff:	00 00                	add    BYTE PTR [rax],al
 201:	00 00                	add    BYTE PTR [rax],al
 203:	00 ad 02 00 00 00    	add    BYTE PTR [rbp+0x2],ch
 209:	41 0e                	rex.B (bad) 
 20b:	10 86 02 4b 0e 18    	adc    BYTE PTR [rsi+0x180e4b02],al
 211:	83 03 4a             	add    DWORD PTR [rbx],0x4a
 214:	0e                   	(bad)  
 215:	90                   	nop
 216:	08 62 0a             	or     BYTE PTR [rdx+0xa],ah
 219:	0e                   	(bad)  
 21a:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 21d:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 220:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 223:	03 da                	add    ebx,edx
 225:	01 0a                	add    DWORD PTR [rdx],ecx
 227:	0e                   	(bad)  
 228:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 22b:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 22e:	08 44 0b 60          	or     BYTE PTR [rbx+rcx*1+0x60],al
 232:	0a 0e                	or     cl,BYTE PTR [rsi]
 234:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 237:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 23a:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 23d:	00 00                	add    BYTE PTR [rax],al
 23f:	00 48 00             	add    BYTE PTR [rax+0x0],cl
 242:	00 00                	add    BYTE PTR [rax],al
 244:	44 02 00             	add    r8b,BYTE PTR [rax]
 247:	00 00                	add    BYTE PTR [rax],al
 249:	00 00                	add    BYTE PTR [rax],al
 24b:	00 35 02 00 00 00    	add    BYTE PTR [rip+0x2],dh        # 253 <.eh_frame+0x253>
 251:	42 0e                	rex.X (bad) 
 253:	10 8f 02 4c 0e 18    	adc    BYTE PTR [rdi+0x180e4c02],cl
 259:	8e 03                	mov    es,WORD PTR [rbx]
 25b:	42 0e                	rex.X (bad) 
 25d:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
 263:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff863010aa <buckets+0xffffffff862fe6ca>
 269:	06                   	(bad)  
 26a:	44 0e                	rex.R (bad) 
 26c:	38 83 07 47 0e c0    	cmp    BYTE PTR [rbx-0x3ff1b8f9],al
 272:	15 62 0a 0e 38       	adc    eax,0x380e0a62
 277:	41 0e                	rex.B (bad) 
 279:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 27c:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 27f:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 282:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 285:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 288:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 28b:	00 70 00             	add    BYTE PTR [rax+0x0],dh
 28e:	00 00                	add    BYTE PTR [rax],al
 290:	90                   	nop
 291:	02 00                	add    al,BYTE PTR [rax]
 293:	00 00                	add    BYTE PTR [rax],al
 295:	00 00                	add    BYTE PTR [rax],al
 297:	00 4a 03             	add    BYTE PTR [rdx+0x3],cl
 29a:	00 00                	add    BYTE PTR [rax],al
 29c:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
 29f:	10 8d 02 4f 0e 18    	adc    BYTE PTR [rbp+0x180e4f02],cl
 2a5:	8c 03                	mov    WORD PTR [rbx],es
 2a7:	41 0e                	rex.B (bad) 
 2a9:	20 86 04 41 0e 28    	and    BYTE PTR [rsi+0x280e4104],al
 2af:	83 05 47 0e b0 08 62 	add    DWORD PTR [rip+0x8b00e47],0x62        # 8b010fd <buckets+0x8afe71d>
 2b6:	0a 0e                	or     cl,BYTE PTR [rsi]
 2b8:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 2bb:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 2be:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 2c1:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 2c4:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 2c7:	03 79 02             	add    edi,DWORD PTR [rcx+0x2]
 2ca:	0a 0e                	or     cl,BYTE PTR [rsi]
 2cc:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 2cf:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 2d2:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 2d5:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 2d8:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 2db:	60                   	(bad)  
 2dc:	0a 0e                	or     cl,BYTE PTR [rsi]
 2de:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 2e1:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 2e4:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 2e7:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 2ea:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 2ed:	55                   	push   rbp
 2ee:	0a 0e                	or     cl,BYTE PTR [rsi]
 2f0:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 2f3:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 2f6:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 2f9:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 2fc:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 2ff:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
 302:	00 00                	add    BYTE PTR [rax],al
 304:	04 03                	add    al,0x3
 306:	00 00                	add    BYTE PTR [rax],al
 308:	00 00                	add    BYTE PTR [rax],al
 30a:	00 00                	add    BYTE PTR [rax],al
 30c:	22 00                	and    al,BYTE PTR [rax]
 30e:	00 00                	add    BYTE PTR [rax],al
 310:	00 44 0e 10          	add    BYTE PTR [rsi+rcx*1+0x10],al
 314:	5d                   	pop    rbp
 315:	0e                   	(bad)  
 316:	08 00                	or     BYTE PTR [rax],al
 318:	14 00                	adc    al,0x0
 31a:	00 00                	add    BYTE PTR [rax],al
 31c:	1c 03                	sbb    al,0x3
 31e:	00 00                	add    BYTE PTR [rax],al
 320:	00 00                	add    BYTE PTR [rax],al
 322:	00 00                	add    BYTE PTR [rax],al
 324:	22 00                	and    al,BYTE PTR [rax]
 326:	00 00                	add    BYTE PTR [rax],al
 328:	00 44 0e 10          	add    BYTE PTR [rsi+rcx*1+0x10],al
 32c:	5d                   	pop    rbp
 32d:	0e                   	(bad)  
 32e:	08 00                	or     BYTE PTR [rax],al
 330:	28 00                	sub    BYTE PTR [rax],al
 332:	00 00                	add    BYTE PTR [rax],al
 334:	34 03                	xor    al,0x3
 336:	00 00                	add    BYTE PTR [rax],al
 338:	00 00                	add    BYTE PTR [rax],al
 33a:	00 00                	add    BYTE PTR [rax],al
 33c:	48 00 00             	rex.W add BYTE PTR [rax],al
 33f:	00 00                	add    BYTE PTR [rax],al
 341:	41 0e                	rex.B (bad) 
 343:	10 86 02 45 0e 18    	adc    BYTE PTR [rsi+0x180e4502],al
 349:	83 03 44             	add    DWORD PTR [rbx],0x44
 34c:	0e                   	(bad)  
 34d:	20 6a 0a             	and    BYTE PTR [rdx+0xa],ch
 350:	0e                   	(bad)  
 351:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 354:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 357:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 35a:	00 00                	add    BYTE PTR [rax],al
 35c:	08 01                	or     BYTE PTR [rcx],al
 35e:	00 00                	add    BYTE PTR [rax],al
 360:	60                   	(bad)  
 361:	03 00                	add    eax,DWORD PTR [rax]
 363:	00 00                	add    BYTE PTR [rax],al
 365:	00 00                	add    BYTE PTR [rax],al
 367:	00 11                	add    BYTE PTR [rcx],dl
 369:	03 00                	add    eax,DWORD PTR [rax]
 36b:	00 00                	add    BYTE PTR [rax],al
 36d:	4c 0e                	rex.WR (bad) 
 36f:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
 375:	8d 03                	lea    eax,[rbx]
 377:	45 0e                	rex.RB (bad) 
 379:	20 8c 04 44 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bc],cl
 380:	05 41 0e 30 83       	add    eax,0x83300e41
 385:	06                   	(bad)  
 386:	58                   	pop    rax
 387:	0a 0e                	or     cl,BYTE PTR [rsi]
 389:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 38c:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 38f:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 392:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 395:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 398:	02 90 0e 08 c3 c6    	add    dl,BYTE PTR [rax-0x393cf7f2]
 39e:	cc                   	int3   
 39f:	cd ce                	int    0xce
 3a1:	48 0e                	rex.W (bad) 
 3a3:	30 83 06 86 05 8c    	xor    BYTE PTR [rbx-0x73fa79fa],al
 3a9:	04 8d                	add    al,0x8d
 3ab:	03 8e 02 02 58 0a    	add    ecx,DWORD PTR [rsi+0xa580202]
 3b1:	c3                   	ret    
 3b2:	0e                   	(bad)  
 3b3:	28 44 c6 0e          	sub    BYTE PTR [rsi+rax*8+0xe],al
 3b7:	20 44 cc 0e          	and    BYTE PTR [rsp+rcx*8+0xe],al
 3bb:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 3be:	0e                   	(bad)  
 3bf:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 3c2:	0e                   	(bad)  
 3c3:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 3c6:	02 77 0a             	add    dh,BYTE PTR [rdi+0xa]
 3c9:	c3                   	ret    
 3ca:	0e                   	(bad)  
 3cb:	28 44 c6 0e          	sub    BYTE PTR [rsi+rax*8+0xe],al
 3cf:	20 42 cc             	and    BYTE PTR [rdx-0x34],al
 3d2:	0e                   	(bad)  
 3d3:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 3d6:	0e                   	(bad)  
 3d7:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 3da:	0e                   	(bad)  
 3db:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 3de:	5f                   	pop    rdi
 3df:	0a c3                	or     al,bl
 3e1:	0e                   	(bad)  
 3e2:	28 44 c6 0e          	sub    BYTE PTR [rsi+rax*8+0xe],al
 3e6:	20 42 cc             	and    BYTE PTR [rdx-0x34],al
 3e9:	0e                   	(bad)  
 3ea:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 3ed:	0e                   	(bad)  
 3ee:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 3f1:	0e                   	(bad)  
 3f2:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 3f5:	02 44 0a c3          	add    al,BYTE PTR [rdx+rcx*1-0x3d]
 3f9:	0e                   	(bad)  
 3fa:	28 41 c6             	sub    BYTE PTR [rcx-0x3a],al
 3fd:	0e                   	(bad)  
 3fe:	20 42 cc             	and    BYTE PTR [rdx-0x34],al
 401:	0e                   	(bad)  
 402:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 405:	0e                   	(bad)  
 406:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 409:	0e                   	(bad)  
 40a:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 40d:	54                   	push   rsp
 40e:	0a c3                	or     al,bl
 410:	0e                   	(bad)  
 411:	28 44 c6 0e          	sub    BYTE PTR [rsi+rax*8+0xe],al
 415:	20 42 cc             	and    BYTE PTR [rdx-0x34],al
 418:	0e                   	(bad)  
 419:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 41c:	0e                   	(bad)  
 41d:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 420:	0e                   	(bad)  
 421:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 424:	54                   	push   rsp
 425:	0a c3                	or     al,bl
 427:	0e                   	(bad)  
 428:	28 44 c6 0e          	sub    BYTE PTR [rsi+rax*8+0xe],al
 42c:	20 42 cc             	and    BYTE PTR [rdx-0x34],al
 42f:	0e                   	(bad)  
 430:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 433:	0e                   	(bad)  
 434:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 437:	0e                   	(bad)  
 438:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 43b:	54                   	push   rsp
 43c:	0a c3                	or     al,bl
 43e:	0e                   	(bad)  
 43f:	28 44 c6 0e          	sub    BYTE PTR [rsi+rax*8+0xe],al
 443:	20 42 cc             	and    BYTE PTR [rdx-0x34],al
 446:	0e                   	(bad)  
 447:	18 42 cd             	sbb    BYTE PTR [rdx-0x33],al
 44a:	0e                   	(bad)  
 44b:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 44e:	0e                   	(bad)  
 44f:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 452:	02 48 c3             	add    cl,BYTE PTR [rax-0x3d]
 455:	0e                   	(bad)  
 456:	28 4b c6             	sub    BYTE PTR [rbx-0x3a],cl
 459:	0e                   	(bad)  
 45a:	20 45 cc             	and    BYTE PTR [rbp-0x34],al
 45d:	0e                   	(bad)  
 45e:	18 44 cd 0e          	sbb    BYTE PTR [rbp+rcx*8+0xe],al
 462:	10 42 ce             	adc    BYTE PTR [rdx-0x32],al
 465:	0e                   	(bad)  
 466:	08 00                	or     BYTE PTR [rax],al
 468:	10 00                	adc    BYTE PTR [rax],al
 46a:	00 00                	add    BYTE PTR [rax],al
 46c:	6c                   	ins    BYTE PTR es:[rdi],dx
 46d:	04 00                	add    al,0x0
 46f:	00 00                	add    BYTE PTR [rax],al
 471:	00 00                	add    BYTE PTR [rax],al
 473:	00 3e                	add    BYTE PTR [rsi],bh
 475:	00 00                	add    BYTE PTR [rax],al
 477:	00 00                	add    BYTE PTR [rax],al
 479:	00 00                	add    BYTE PTR [rax],al
 47b:	00 28                	add    BYTE PTR [rax],ch
 47d:	00 00                	add    BYTE PTR [rax],al
 47f:	00 80 04 00 00 00    	add    BYTE PTR [rax+0x4],al
 485:	00 00                	add    BYTE PTR [rax],al
 487:	00 f6                	add    dh,dh
 489:	00 00                	add    BYTE PTR [rax],al
 48b:	00 00                	add    BYTE PTR [rax],al
 48d:	41 0e                	rex.B (bad) 
 48f:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
 495:	83 03 44             	add    DWORD PTR [rbx],0x44
 498:	0e                   	(bad)  
 499:	20 02                	and    BYTE PTR [rdx],al
 49b:	95                   	xchg   ebp,eax
 49c:	0a 0e                	or     cl,BYTE PTR [rsi]
 49e:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 4a1:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 4a4:	08 43 0b             	or     BYTE PTR [rbx+0xb],al
 4a7:	00 c4                	add    ah,al
 4a9:	00 00                	add    BYTE PTR [rax],al
 4ab:	00 ac 04 00 00 00 00 	add    BYTE PTR [rsp+rax*1+0x0],ch
 4b2:	00 00                	add    BYTE PTR [rax],al
 4b4:	a2 06 00 00 00 42 0e 	movabs ds:0x8f100e4200000006,al
 4bb:	10 8f 
 4bd:	02 42 0e             	add    al,BYTE PTR [rdx+0xe]
 4c0:	18 8e 03 42 0e 20    	sbb    BYTE PTR [rsi+0x200e4203],cl
 4c6:	8d 04 42             	lea    eax,[rdx+rax*2]
 4c9:	0e                   	(bad)  
 4ca:	28 8c 05 49 0e 30 86 	sub    BYTE PTR [rbp+rax*1-0x79cff1b7],cl
 4d1:	06                   	(bad)  
 4d2:	41 0e                	rex.B (bad) 
 4d4:	38 83 07 44 0e 40    	cmp    BYTE PTR [rbx+0x400e4407],al
 4da:	03 e2                	add    esp,edx
 4dc:	03 0a                	add    ecx,DWORD PTR [rdx]
 4de:	0e                   	(bad)  
 4df:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
 4e2:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 4e5:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 4e8:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 4eb:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 4ee:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 4f1:	08 4e 0b             	or     BYTE PTR [rsi+0xb],cl
 4f4:	02 9f 0a 0e 38 4f    	add    bl,BYTE PTR [rdi+0x4f380e0a]
 4fa:	0e                   	(bad)  
 4fb:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 4fe:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 501:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 504:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 507:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 50a:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 50d:	58                   	pop    rax
 50e:	0a 0e                	or     cl,BYTE PTR [rsi]
 510:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
 513:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 516:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 519:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 51c:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 51f:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 522:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 525:	02 8b 0a 0e 38 41    	add    cl,BYTE PTR [rbx+0x41380e0a]
 52b:	0e                   	(bad)  
 52c:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 52f:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 532:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 535:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 538:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 53b:	08 4b 0b             	or     BYTE PTR [rbx+0xb],cl
 53e:	44 0a 0e             	or     r9b,BYTE PTR [rsi]
 541:	38 46 0e             	cmp    BYTE PTR [rsi+0xe],al
 544:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 547:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 54a:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 54d:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 550:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 553:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 556:	4e 0a 0e             	rex.WRX or r9b,BYTE PTR [rsi]
 559:	38 48 0e             	cmp    BYTE PTR [rax+0xe],cl
 55c:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 55f:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 562:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 565:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 568:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 56b:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 56e:	00 00                	add    BYTE PTR [rax],al
 570:	38 00                	cmp    BYTE PTR [rax],al
 572:	00 00                	add    BYTE PTR [rax],al
 574:	74 05                	je     57b <.eh_frame+0x57b>
 576:	00 00                	add    BYTE PTR [rax],al
 578:	00 00                	add    BYTE PTR [rax],al
 57a:	00 00                	add    BYTE PTR [rax],al
 57c:	7b 00                	jnp    57e <.eh_frame+0x57e>
 57e:	00 00                	add    BYTE PTR [rax],al
 580:	00 4b 0e             	add    BYTE PTR [rbx+0xe],cl
 583:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
 589:	83 03 44             	add    DWORD PTR [rbx],0x44
 58c:	0e                   	(bad)  
 58d:	20 02                	and    BYTE PTR [rdx],al
 58f:	4b 0a 0e             	rex.WXB or cl,BYTE PTR [r14]
 592:	18 43 0e             	sbb    BYTE PTR [rbx+0xe],al
 595:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 598:	08 41 0b             	or     BYTE PTR [rcx+0xb],al
 59b:	46 0a 0e             	rex.RX or r9b,BYTE PTR [rsi]
 59e:	18 43 0e             	sbb    BYTE PTR [rbx+0xe],al
 5a1:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 5a4:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 5a7:	48 0e                	rex.W (bad) 
 5a9:	08 c3                	or     bl,al
 5ab:	c6                   	(bad)  
 5ac:	38 00                	cmp    BYTE PTR [rax],al
 5ae:	00 00                	add    BYTE PTR [rax],al
 5b0:	b0 05                	mov    al,0x5
 5b2:	00 00                	add    BYTE PTR [rax],al
 5b4:	00 00                	add    BYTE PTR [rax],al
 5b6:	00 00                	add    BYTE PTR [rax],al
 5b8:	c4                   	(bad)  
 5b9:	00 00                	add    BYTE PTR [rax],al
 5bb:	00 00                	add    BYTE PTR [rax],al
 5bd:	42 0e                	rex.X (bad) 
 5bf:	10 8c 02 41 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bf],cl
 5c6:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
 5c9:	20 83 04 7d 0a 0e    	and    BYTE PTR [rbx+0xe0a7d04],al
 5cf:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 5d2:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 5d5:	08 44 0b 4d          	or     BYTE PTR [rbx+rcx*1+0x4d],al
 5d9:	0a 0e                	or     cl,BYTE PTR [rsi]
 5db:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 5de:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 5e1:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
 5e4:	00 00                	add    BYTE PTR [rax],al
	...
Contents of the .eh_frame section:


00000000 0000000000000014 00000000 CIE
  Version:               1
  Augmentation:          "zR"
  Code alignment factor: 1
  Data alignment factor: -8
  Return address column: 16
  Augmentation data:     1b
  DW_CFA_def_cfa: r7 (rsp) ofs 8
  DW_CFA_offset: r16 (rip) at cfa-8
  DW_CFA_nop
  DW_CFA_nop

00000018 0000000000000028 0000001c FDE cie=00000000 pc=0000000000000000..00000000000000cc
  DW_CFA_advance_loc: 1 to 0000000000000001
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000000002
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 7 to 0000000000000009
  DW_CFA_def_cfa_offset: 288
  DW_CFA_advance_loc1: 141 to 0000000000000096
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000000097
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000000098
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 00000000000000a0
  DW_CFA_restore_state

00000044 0000000000000010 00000048 FDE cie=00000000 pc=00000000000000d0..00000000000000fd
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000058 0000000000000048 0000005c FDE cie=00000000 pc=0000000000000100..00000000000003e1
  DW_CFA_advance_loc: 2 to 0000000000000102
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000000104
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000000106
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 0000000000000108
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 4 to 000000000000010c
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 4 to 0000000000000110
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 4 to 0000000000000114
  DW_CFA_def_cfa_offset: 80
  DW_CFA_advance_loc2: 543 to 0000000000000333
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 4 to 0000000000000337
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000000338
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 000000000000033a
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 000000000000033c
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 000000000000033e
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000340
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 0000000000000348
  DW_CFA_restore_state

000000a4 0000000000000048 000000a8 FDE cie=00000000 pc=00000000000003f0..0000000000000684
  DW_CFA_advance_loc: 2 to 00000000000003f2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 9 to 00000000000003fb
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 00000000000003fd
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 00000000000003ff
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000000400
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 1 to 0000000000000401
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 4 to 0000000000000405
  DW_CFA_def_cfa_offset: 80
  DW_CFA_advance_loc2: 259 to 0000000000000508
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 0000000000000509
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 000000000000050a
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 000000000000050c
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 000000000000050e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000000510
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000512
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000000518
  DW_CFA_restore_state

000000f0 0000000000000040 000000f4 FDE cie=00000000 pc=0000000000000690..000000000000077d
  DW_CFA_advance_loc1: 74 to 00000000000006da
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 4 to 00000000000006de
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 2 to 00000000000006e0
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 1 to 00000000000006e1
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 4 to 00000000000006e5
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc1: 130 to 0000000000000767
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000000768
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 000000000000076a
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 000000000000076c
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 000000000000076e
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 0000000000000778
  DW_CFA_restore_state
  DW_CFA_nop

00000134 0000000000000048 00000138 FDE cie=00000000 pc=0000000000000780..0000000000000972
  DW_CFA_advance_loc: 2 to 0000000000000782
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r13 (r13) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000000784
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r12 (r12) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000000785
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r6 (rbp) at cfa-32
  DW_CFA_advance_loc: 1 to 0000000000000786
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r3 (rbx) at cfa-40
  DW_CFA_advance_loc: 10 to 0000000000000790
  DW_CFA_def_cfa_offset: 1408
  DW_CFA_advance_loc1: 211 to 0000000000000863
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000000864
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000000865
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000000867
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000869
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000000870
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 251 to 000000000000096b
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 000000000000096c
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 000000000000096d
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 000000000000096f
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000971
  DW_CFA_def_cfa_offset: 8

00000180 0000000000000014 00000184 FDE cie=00000000 pc=0000000000000980..00000000000009aa
  DW_CFA_advance_loc: 4 to 0000000000000984
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 33 to 00000000000009a5
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000198 0000000000000028 0000019c FDE cie=00000000 pc=00000000000009b0..0000000000000a0d
  DW_CFA_advance_loc: 2 to 00000000000009b2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 4 to 00000000000009b6
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 3 to 00000000000009b9
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 62 to 00000000000009f7
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 00000000000009f8
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000009fa
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000000a00
  DW_CFA_restore_state

000001c4 0000000000000030 000001c8 FDE cie=00000000 pc=0000000000000a10..0000000000000a4c
  DW_CFA_advance_loc: 1 to 0000000000000a11
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 5 to 0000000000000a16
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 6 to 0000000000000a1c
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 14 to 0000000000000a2a
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 9 to 0000000000000a33
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000000a34
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 12 to 0000000000000a40
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000000a44
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 6 to 0000000000000a4a
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000000a4b
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000001f8 0000000000000044 000001fc FDE cie=00000000 pc=0000000000000a50..0000000000000cfd
  DW_CFA_advance_loc: 1 to 0000000000000a51
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 11 to 0000000000000a5c
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 10 to 0000000000000a66
  DW_CFA_def_cfa_offset: 1040
  DW_CFA_advance_loc: 34 to 0000000000000a88
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000000a89
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000000a8a
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000000a90
  DW_CFA_restore_state
  DW_CFA_advance_loc2: 474 to 0000000000000c6a
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000000c6b
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000000c6c
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000000c70
  DW_CFA_restore_state
  DW_CFA_advance_loc: 32 to 0000000000000c90
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000000c91
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000000c92
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000000c98
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000240 0000000000000048 00000244 FDE cie=00000000 pc=0000000000000d00..0000000000000f35
  DW_CFA_advance_loc: 2 to 0000000000000d02
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 12 to 0000000000000d0e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000000d10
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 0000000000000d12
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000000d13
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 4 to 0000000000000d17
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 7 to 0000000000000d1e
  DW_CFA_def_cfa_offset: 2752
  DW_CFA_advance_loc: 34 to 0000000000000d40
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 0000000000000d41
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000000d42
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000000d44
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000000d46
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000000d48
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000d4a
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000000d50
  DW_CFA_restore_state
  DW_CFA_nop

0000028c 0000000000000070 00000290 FDE cie=00000000 pc=0000000000000f40..000000000000128a
  DW_CFA_advance_loc: 2 to 0000000000000f42
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r13 (r13) at cfa-16
  DW_CFA_advance_loc: 15 to 0000000000000f51
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r12 (r12) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000000f52
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r6 (rbp) at cfa-32
  DW_CFA_advance_loc: 1 to 0000000000000f53
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r3 (rbx) at cfa-40
  DW_CFA_advance_loc: 7 to 0000000000000f5a
  DW_CFA_def_cfa_offset: 1072
  DW_CFA_advance_loc: 34 to 0000000000000f7c
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000000f7d
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000000f7e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000000f80
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000f82
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000000f88
  DW_CFA_restore_state
  DW_CFA_advance_loc2: 633 to 0000000000001201
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001202
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000001203
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001205
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001207
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000001210
  DW_CFA_restore_state
  DW_CFA_advance_loc: 32 to 0000000000001230
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001231
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000001232
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001234
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001236
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 0000000000001240
  DW_CFA_restore_state
  DW_CFA_advance_loc: 21 to 0000000000001255
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001256
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000001257
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001259
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 000000000000125b
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001260
  DW_CFA_restore_state
  DW_CFA_nop

00000300 0000000000000014 00000304 FDE cie=00000000 pc=0000000000001290..00000000000012b2
  DW_CFA_advance_loc: 4 to 0000000000001294
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 29 to 00000000000012b1
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000318 0000000000000014 0000031c FDE cie=00000000 pc=00000000000012c0..00000000000012e2
  DW_CFA_advance_loc: 4 to 00000000000012c4
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 29 to 00000000000012e1
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000330 0000000000000028 00000334 FDE cie=00000000 pc=00000000000012f0..0000000000001338
  DW_CFA_advance_loc: 1 to 00000000000012f1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 5 to 00000000000012f6
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 4 to 00000000000012fa
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 42 to 0000000000001324
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000001325
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000001326
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 0000000000001330
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop

0000035c 0000000000000108 00000360 FDE cie=00000000 pc=0000000000001340..0000000000001651
  DW_CFA_advance_loc: 12 to 000000000000134c
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 2 to 000000000000134e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 5 to 0000000000001353
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 4 to 0000000000001357
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000001358
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc: 24 to 0000000000001370
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001371
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001373
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001375
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001377
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000001380
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 144 to 0000000000001410
  DW_CFA_def_cfa_offset: 8
  DW_CFA_restore: r3 (rbx)
  DW_CFA_restore: r6 (rbp)
  DW_CFA_restore: r12 (r12)
  DW_CFA_restore: r13 (r13)
  DW_CFA_restore: r14 (r14)
  DW_CFA_advance_loc: 8 to 0000000000001418
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc1: 88 to 0000000000001470
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 4 to 0000000000001474
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 4 to 0000000000001478
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 000000000000147a
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 000000000000147c
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001481
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 119 to 00000000000014f8
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 4 to 00000000000014fc
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000014fe
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001500
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001502
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001507
  DW_CFA_restore_state
  DW_CFA_advance_loc: 31 to 0000000000001526
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 4 to 000000000000152a
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 000000000000152c
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 000000000000152e
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001530
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001535
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 68 to 0000000000001579
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 000000000000157a
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 000000000000157c
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 000000000000157e
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001580
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001585
  DW_CFA_restore_state
  DW_CFA_advance_loc: 20 to 0000000000001599
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 4 to 000000000000159d
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 000000000000159f
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000015a1
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000015a3
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 00000000000015a8
  DW_CFA_restore_state
  DW_CFA_advance_loc: 20 to 00000000000015bc
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 4 to 00000000000015c0
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000015c2
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000015c4
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000015c6
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 00000000000015cb
  DW_CFA_restore_state
  DW_CFA_advance_loc: 20 to 00000000000015df
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 4 to 00000000000015e3
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000015e5
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000015e7
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000015e9
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 00000000000015ee
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 72 to 0000000000001636
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 11 to 0000000000001641
  DW_CFA_restore: r6 (rbp)
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 5 to 0000000000001646
  DW_CFA_restore: r12 (r12)
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 4 to 000000000000164a
  DW_CFA_restore: r13 (r13)
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 000000000000164c
  DW_CFA_restore: r14 (r14)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000468 0000000000000010 0000046c FDE cie=00000000 pc=0000000000001660..000000000000169e
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0000047c 0000000000000028 00000480 FDE cie=00000000 pc=00000000000016a0..0000000000001796
  DW_CFA_advance_loc: 1 to 00000000000016a1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 1 to 00000000000016a2
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 4 to 00000000000016a6
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc1: 149 to 000000000000173b
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 000000000000173c
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 000000000000173d
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 3 to 0000000000001740
  DW_CFA_restore_state
  DW_CFA_nop

000004a8 00000000000000c4 000004ac FDE cie=00000000 pc=00000000000017a0..0000000000001e42
  DW_CFA_advance_loc: 2 to 00000000000017a2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 00000000000017a4
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 00000000000017a6
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 00000000000017a8
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 9 to 00000000000017b1
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 1 to 00000000000017b2
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 4 to 00000000000017b6
  DW_CFA_def_cfa_offset: 64
  DW_CFA_advance_loc2: 994 to 0000000000001b98
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 0000000000001b99
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001b9a
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000001b9c
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001b9e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001ba0
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001ba2
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 14 to 0000000000001bb0
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 159 to 0000000000001c4f
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 15 to 0000000000001c5e
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001c5f
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000001c61
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001c63
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001c65
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001c67
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000001c70
  DW_CFA_restore_state
  DW_CFA_advance_loc: 24 to 0000000000001c88
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 0000000000001c89
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001c8a
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000001c8c
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001c8e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001c90
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001c92
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000001c98
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 139 to 0000000000001d23
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 0000000000001d24
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001d25
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000001d27
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001d29
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001d2b
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001d2d
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 11 to 0000000000001d38
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000001d3c
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 6 to 0000000000001d42
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001d43
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000001d45
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001d47
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001d49
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001d4b
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001d50
  DW_CFA_restore_state
  DW_CFA_advance_loc: 14 to 0000000000001d5e
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 8 to 0000000000001d66
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001d67
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000001d69
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001d6b
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001d6d
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001d6f
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000001d78
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop

00000570 0000000000000038 00000574 FDE cie=00000000 pc=0000000000001e50..0000000000001ecb
  DW_CFA_advance_loc: 11 to 0000000000001e5b
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000001e5c
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 4 to 0000000000001e60
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc1: 75 to 0000000000001eab
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 3 to 0000000000001eae
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000001eaf
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 0000000000001eb0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 6 to 0000000000001eb6
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 3 to 0000000000001eb9
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000001eba
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000001ec0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 8 to 0000000000001ec8
  DW_CFA_def_cfa_offset: 8
  DW_CFA_restore: r3 (rbx)
  DW_CFA_restore: r6 (rbp)

000005ac 0000000000000038 000005b0 FDE cie=00000000 pc=0000000000001ed0..0000000000001f94
  DW_CFA_advance_loc: 2 to 0000000000001ed2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000001ed3
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000001ed4
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 61 to 0000000000001f11
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000001f12
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001f14
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000001f18
  DW_CFA_restore_state
  DW_CFA_advance_loc: 13 to 0000000000001f25
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000001f26
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001f28
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 0000000000001f30
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

