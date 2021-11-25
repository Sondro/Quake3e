
./build/release-linux-x86_64_-_obj/client/cl_main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <CL_IsMininized>:
CL_IsMininized():
       0:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 6 <CL_IsMininized+0x6>
       6:	c3                   	ret    
       7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
       e:	00 00 

0000000000000010 <CL_SetScaling>:
CL_SetScaling():
      10:	89 f1                	mov    ecx,esi
      12:	ba 49 d6 b9 f2       	mov    edx,0xf2b9d649
      17:	66 0f ef c9          	pxor   xmm1,xmm1
      1b:	f3 0f 10 15 00 00 00 	movss  xmm2,DWORD PTR [rip+0x0]        # 23 <CL_SetScaling+0x13>
      22:	00 
      23:	c1 e1 04             	shl    ecx,0x4
      26:	89 c8                	mov    eax,ecx
      28:	f7 ea                	imul   edx
      2a:	01 ca                	add    edx,ecx
      2c:	c1 f9 1f             	sar    ecx,0x1f
      2f:	c1 fa 0a             	sar    edx,0xa
      32:	29 ca                	sub    edx,ecx
      34:	f3 0f 2a ca          	cvtsi2ss xmm1,edx
      38:	f3 0f 59 0d 00 00 00 	mulss  xmm1,DWORD PTR [rip+0x0]        # 40 <CL_SetScaling+0x30>
      3f:	00 
      40:	0f 2f d1             	comiss xmm2,xmm1
      43:	77 04                	ja     49 <CL_SetScaling+0x39>
      45:	f3 0f 59 c1          	mulss  xmm0,xmm1
      49:	f3 0f 10 0d 00 00 00 	movss  xmm1,DWORD PTR [rip+0x0]        # 51 <CL_SetScaling+0x41>
      50:	00 
      51:	89 3d 00 00 00 00    	mov    DWORD PTR [rip+0x0],edi        # 57 <CL_SetScaling+0x47>
      57:	89 35 00 00 00 00    	mov    DWORD PTR [rip+0x0],esi        # 5d <CL_SetScaling+0x4d>
      5d:	f3 0f 59 c8          	mulss  xmm1,xmm0
      61:	f3 0f 59 05 00 00 00 	mulss  xmm0,DWORD PTR [rip+0x0]        # 69 <CL_SetScaling+0x59>
      68:	00 
      69:	f3 0f 2c c1          	cvttss2si eax,xmm1
      6d:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 73 <CL_SetScaling+0x63>
      73:	f3 0f 2c c0          	cvttss2si eax,xmm0
      77:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 7d <CL_SetScaling+0x6d>
      7d:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 83 <CL_SetScaling+0x73>
      83:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 89 <CL_SetScaling+0x79>
      89:	c3                   	ret    
      8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000000090 <CL_StopRecord_f>:
CL_StopRecord_f():
      90:	41 56                	push   r14
      92:	41 55                	push   r13
      94:	41 54                	push   r12
      96:	55                   	push   rbp
      97:	53                   	push   rbx
      98:	48 81 ec 10 20 00 00 	sub    rsp,0x2010
      9f:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # a5 <CL_StopRecord_f+0x15>
      a5:	85 d2                	test   edx,edx
      a7:	75 47                	jne    f0 <CL_StopRecord_f+0x60>
      a9:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # af <CL_StopRecord_f+0x1f>
      af:	85 c0                	test   eax,eax
      b1:	75 2d                	jne    e0 <CL_StopRecord_f+0x50>
      b3:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # ba <CL_StopRecord_f+0x2a>
      ba:	31 c0                	xor    eax,eax
      bc:	e8 00 00 00 00       	call   c1 <CL_StopRecord_f+0x31>
      c1:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # cc <CL_StopRecord_f+0x3c>
      c8:	00 00 00 00 
      cc:	48 81 c4 10 20 00 00 	add    rsp,0x2010
      d3:	5b                   	pop    rbx
      d4:	5d                   	pop    rbp
      d5:	41 5c                	pop    r12
      d7:	41 5d                	pop    r13
      d9:	41 5e                	pop    r14
      db:	c3                   	ret    
      dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
      e0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # e7 <CL_StopRecord_f+0x57>
      e7:	31 c0                	xor    eax,eax
      e9:	e8 00 00 00 00       	call   ee <CL_StopRecord_f+0x5e>
      ee:	eb d1                	jmp    c1 <CL_StopRecord_f+0x31>
      f0:	48 8d 5c 24 0c       	lea    rbx,[rsp+0xc]
      f5:	be 04 00 00 00       	mov    esi,0x4
      fa:	c7 44 24 0c ff ff ff 	mov    DWORD PTR [rsp+0xc],0xffffffff
     101:	ff 
     102:	4c 8d 74 24 10       	lea    r14,[rsp+0x10]
     107:	48 89 df             	mov    rdi,rbx
     10a:	48 8d ac 24 10 10 00 	lea    rbp,[rsp+0x1010]
     111:	00 
     112:	4c 8d 2d 00 00 00 00 	lea    r13,[rip+0x0]        # 119 <CL_StopRecord_f+0x89>
     119:	e8 00 00 00 00       	call   11e <CL_StopRecord_f+0x8e>
     11e:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 124 <CL_StopRecord_f+0x94>
     124:	be 04 00 00 00       	mov    esi,0x4
     129:	48 89 df             	mov    rdi,rbx
     12c:	e8 00 00 00 00       	call   131 <CL_StopRecord_f+0xa1>
     131:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 137 <CL_StopRecord_f+0xa7>
     137:	e8 00 00 00 00       	call   13c <CL_StopRecord_f+0xac>
     13c:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 142 <CL_StopRecord_f+0xb2>
     142:	0b 05 00 00 00 00    	or     eax,DWORD PTR [rip+0x0]        # 148 <CL_StopRecord_f+0xb8>
     148:	4c 89 f7             	mov    rdi,r14
     14b:	83 f8 01             	cmp    eax,0x1
     14e:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 155 <CL_StopRecord_f+0xc5>
     155:	be 00 10 00 00       	mov    esi,0x1000
     15a:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 164 <CL_StopRecord_f+0xd4>
     161:	00 00 00 
     164:	45 19 e4             	sbb    r12d,r12d
     167:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 16e <CL_StopRecord_f+0xde>
     16e:	31 c0                	xor    eax,eax
     170:	31 db                	xor    ebx,ebx
     172:	e8 00 00 00 00       	call   177 <CL_StopRecord_f+0xe7>
     177:	41 83 e4 03          	and    r12d,0x3
     17b:	be 00 10 00 00       	mov    esi,0x1000
     180:	31 c0                	xor    eax,eax
     182:	41 83 c4 44          	add    r12d,0x44
     186:	4c 8d 05 00 00 00 00 	lea    r8,[rip+0x0]        # 18d <CL_StopRecord_f+0xfd>
     18d:	48 89 ef             	mov    rdi,rbp
     190:	45 89 e1             	mov    r9d,r12d
     193:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 19a <CL_StopRecord_f+0x10a>
     19a:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1a1 <CL_StopRecord_f+0x111>
     1a1:	e8 00 00 00 00       	call   1a6 <CL_StopRecord_f+0x116>
     1a6:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 1ac <CL_StopRecord_f+0x11c>
     1ac:	85 f6                	test   esi,esi
     1ae:	74 3e                	je     1ee <CL_StopRecord_f+0x15e>
     1b0:	eb 5e                	jmp    210 <CL_StopRecord_f+0x180>
     1b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     1b8:	83 c3 01             	add    ebx,0x1
     1bb:	81 fb e8 03 00 00    	cmp    ebx,0x3e8
     1c1:	74 37                	je     1fa <CL_StopRecord_f+0x16a>
     1c3:	48 83 ec 08          	sub    rsp,0x8
     1c7:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 1ce <CL_StopRecord_f+0x13e>
     1ce:	4d 89 e9             	mov    r9,r13
     1d1:	31 c0                	xor    eax,eax
     1d3:	41 54                	push   r12
     1d5:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1dc <CL_StopRecord_f+0x14c>
     1dc:	41 89 d8             	mov    r8d,ebx
     1df:	48 89 ef             	mov    rdi,rbp
     1e2:	be 00 10 00 00       	mov    esi,0x1000
     1e7:	e8 00 00 00 00       	call   1ec <CL_StopRecord_f+0x15c>
     1ec:	5a                   	pop    rdx
     1ed:	59                   	pop    rcx
     1ee:	48 89 ef             	mov    rdi,rbp
     1f1:	e8 00 00 00 00       	call   1f6 <CL_StopRecord_f+0x166>
     1f6:	85 c0                	test   eax,eax
     1f8:	75 be                	jne    1b8 <CL_StopRecord_f+0x128>
     1fa:	48 89 ee             	mov    rsi,rbp
     1fd:	4c 89 f7             	mov    rdi,r14
     200:	e8 00 00 00 00       	call   205 <CL_StopRecord_f+0x175>
     205:	e9 9f fe ff ff       	jmp    a9 <CL_StopRecord_f+0x19>
     20a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     210:	48 89 ef             	mov    rdi,rbp
     213:	e8 00 00 00 00       	call   218 <CL_StopRecord_f+0x188>
     218:	48 89 ee             	mov    rsi,rbp
     21b:	4c 89 f7             	mov    rdi,r14
     21e:	e8 00 00 00 00       	call   223 <CL_StopRecord_f+0x193>
     223:	e9 81 fe ff ff       	jmp    a9 <CL_StopRecord_f+0x19>
     228:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
     22f:	00 

0000000000000230 <CL_ModeList_f>:
CL_ModeList_f():
     230:	41 54                	push   r12
     232:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 239 <CL_ModeList_f+0x9>
     239:	31 c0                	xor    eax,eax
     23b:	55                   	push   rbp
     23c:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 243 <CL_ModeList_f+0x13>
     243:	53                   	push   rbx
     244:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 24b <CL_ModeList_f+0x1b>
     24b:	4c 8d a3 40 02 00 00 	lea    r12,[rbx+0x240]
     252:	e8 00 00 00 00       	call   257 <CL_ModeList_f+0x27>
     257:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 25e <CL_ModeList_f+0x2e>
     25e:	eb 07                	jmp    267 <CL_ModeList_f+0x37>
     260:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
     263:	48 83 c3 18          	add    rbx,0x18
     267:	31 c0                	xor    eax,eax
     269:	48 89 ef             	mov    rdi,rbp
     26c:	e8 00 00 00 00       	call   271 <CL_ModeList_f+0x41>
     271:	4c 39 e3             	cmp    rbx,r12
     274:	75 ea                	jne    260 <CL_ModeList_f+0x30>
     276:	5b                   	pop    rbx
     277:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 27e <CL_ModeList_f+0x4e>
     27e:	5d                   	pop    rbp
     27f:	31 c0                	xor    eax,eax
     281:	41 5c                	pop    r12
     283:	e9 00 00 00 00       	jmp    288 <CL_ModeList_f+0x58>
     288:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
     28f:	00 

0000000000000290 <CL_ScaledMilliseconds>:
CL_ScaledMilliseconds():
     290:	48 83 ec 08          	sub    rsp,0x8
     294:	e8 00 00 00 00       	call   299 <CL_ScaledMilliseconds+0x9>
     299:	66 0f ef c0          	pxor   xmm0,xmm0
     29d:	f3 0f 2a c0          	cvtsi2ss xmm0,eax
     2a1:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 2a8 <CL_ScaledMilliseconds+0x18>
     2a8:	f3 0f 59 40 2c       	mulss  xmm0,DWORD PTR [rax+0x2c]
     2ad:	48 83 c4 08          	add    rsp,0x8
     2b1:	f3 0f 2c c0          	cvttss2si eax,xmm0
     2b5:	c3                   	ret    
     2b6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
     2bd:	00 00 00 

00000000000002c0 <CL_WriteServerCommands>:
CL_WriteServerCommands():
     2c0:	41 54                	push   r12
     2c2:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 2c8 <CL_WriteServerCommands+0x8>
     2c8:	55                   	push   rbp
     2c9:	53                   	push   rbx
     2ca:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 2d0 <CL_WriteServerCommands+0x10>
     2d0:	39 c3                	cmp    ebx,eax
     2d2:	7d 69                	jge    33d <CL_WriteServerCommands+0x7d>
     2d4:	89 c2                	mov    edx,eax
     2d6:	29 da                	sub    edx,ebx
     2d8:	83 fa 40             	cmp    edx,0x40
     2db:	7e 09                	jle    2e6 <CL_WriteServerCommands+0x26>
     2dd:	8d 58 c0             	lea    ebx,[rax-0x40]
     2e0:	89 1d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebx        # 2e6 <CL_WriteServerCommands+0x26>
     2e6:	83 c3 01             	add    ebx,0x1
     2e9:	39 d8                	cmp    eax,ebx
     2eb:	7c 50                	jl     33d <CL_WriteServerCommands+0x7d>
     2ed:	48 89 fd             	mov    rbp,rdi
     2f0:	4c 8d 25 00 00 00 00 	lea    r12,[rip+0x0]        # 2f7 <CL_WriteServerCommands+0x37>
     2f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
     2fe:	00 00 
     300:	be 05 00 00 00       	mov    esi,0x5
     305:	48 89 ef             	mov    rdi,rbp
     308:	e8 00 00 00 00       	call   30d <CL_WriteServerCommands+0x4d>
     30d:	89 de                	mov    esi,ebx
     30f:	48 89 ef             	mov    rdi,rbp
     312:	e8 00 00 00 00       	call   317 <CL_WriteServerCommands+0x57>
     317:	89 d8                	mov    eax,ebx
     319:	48 89 ef             	mov    rdi,rbp
     31c:	83 c3 01             	add    ebx,0x1
     31f:	83 e0 3f             	and    eax,0x3f
     322:	48 c1 e0 0a          	shl    rax,0xa
     326:	49 8d b4 04 54 04 01 	lea    rsi,[r12+rax*1+0x10454]
     32d:	00 
     32e:	e8 00 00 00 00       	call   333 <CL_WriteServerCommands+0x73>
     333:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 339 <CL_WriteServerCommands+0x79>
     339:	39 d8                	cmp    eax,ebx
     33b:	7d c3                	jge    300 <CL_WriteServerCommands+0x40>
     33d:	5b                   	pop    rbx
     33e:	5d                   	pop    rbp
     33f:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 345 <CL_WriteServerCommands+0x85>
     345:	41 5c                	pop    r12
     347:	c3                   	ret    
     348:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
     34f:	00 

0000000000000350 <CL_WriteGamestate>:
CL_WriteGamestate():
     350:	41 56                	push   r14
     352:	ba 00 40 00 00       	mov    edx,0x4000
     357:	41 55                	push   r13
     359:	41 54                	push   r12
     35b:	55                   	push   rbp
     35c:	53                   	push   rbx
     35d:	89 fb                	mov    ebx,edi
     35f:	48 81 ec 20 41 00 00 	sub    rsp,0x4120
     366:	4c 8d 64 24 10       	lea    r12,[rsp+0x10]
     36b:	48 8d b4 24 10 01 00 	lea    rsi,[rsp+0x110]
     372:	00 
     373:	4c 89 e7             	mov    rdi,r12
     376:	e8 00 00 00 00       	call   37b <CL_WriteGamestate+0x2b>
     37b:	4c 89 e7             	mov    rdi,r12
     37e:	e8 00 00 00 00       	call   383 <CL_WriteGamestate+0x33>
     383:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 389 <CL_WriteGamestate+0x39>
     389:	4c 89 e7             	mov    rdi,r12
     38c:	e8 00 00 00 00       	call   391 <CL_WriteGamestate+0x41>
     391:	85 db                	test   ebx,ebx
     393:	0f 84 9b 01 00 00    	je     534 <CL_WriteGamestate+0x1e4>
     399:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 3a3 <CL_WriteGamestate+0x53>
     3a0:	00 00 00 
     3a3:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 3a9 <CL_WriteGamestate+0x59>
     3a9:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 3af <CL_WriteGamestate+0x5f>
     3af:	be 02 00 00 00       	mov    esi,0x2
     3b4:	4c 89 e7             	mov    rdi,r12
     3b7:	4c 8d 35 00 00 00 00 	lea    r14,[rip+0x0]        # 3be <CL_WriteGamestate+0x6e>
     3be:	31 db                	xor    ebx,ebx
     3c0:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3ca <CL_WriteGamestate+0x7a>
     3c7:	00 00 00 
     3ca:	4d 8d ae 00 10 00 00 	lea    r13,[r14+0x1000]
     3d1:	e8 00 00 00 00       	call   3d6 <CL_WriteGamestate+0x86>
     3d6:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 3dc <CL_WriteGamestate+0x8c>
     3dc:	4c 89 e7             	mov    rdi,r12
     3df:	e8 00 00 00 00       	call   3e4 <CL_WriteGamestate+0x94>
     3e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     3e8:	41 8b 2c 9e          	mov    ebp,DWORD PTR [r14+rbx*4]
     3ec:	85 ed                	test   ebp,ebp
     3ee:	74 25                	je     415 <CL_WriteGamestate+0xc5>
     3f0:	be 03 00 00 00       	mov    esi,0x3
     3f5:	4c 89 e7             	mov    rdi,r12
     3f8:	e8 00 00 00 00       	call   3fd <CL_WriteGamestate+0xad>
     3fd:	89 de                	mov    esi,ebx
     3ff:	4c 89 e7             	mov    rdi,r12
     402:	e8 00 00 00 00       	call   407 <CL_WriteGamestate+0xb7>
     407:	48 63 f5             	movsxd rsi,ebp
     40a:	4c 89 e7             	mov    rdi,r12
     40d:	4c 01 ee             	add    rsi,r13
     410:	e8 00 00 00 00       	call   415 <CL_WriteGamestate+0xc5>
     415:	48 83 c3 01          	add    rbx,0x1
     419:	48 81 fb 00 04 00 00 	cmp    rbx,0x400
     420:	75 c6                	jne    3e8 <CL_WriteGamestate+0x98>
     422:	4c 8d 74 24 40       	lea    r14,[rsp+0x40]
     427:	b9 1a 00 00 00       	mov    ecx,0x1a
     42c:	31 c0                	xor    eax,eax
     42e:	4c 89 f7             	mov    rdi,r14
     431:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 438 <CL_WriteGamestate+0xe8>
     438:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
     43b:	48 8d ab 00 c0 e2 ff 	lea    rbp,[rbx-0x1d4000]
     442:	4c 8d ab 00 04 00 00 	lea    r13,[rbx+0x400]
     449:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     450:	80 3b 00             	cmp    BYTE PTR [rbx],0x0
     453:	74 20                	je     475 <CL_WriteGamestate+0x125>
     455:	be 04 00 00 00       	mov    esi,0x4
     45a:	4c 89 e7             	mov    rdi,r12
     45d:	e8 00 00 00 00       	call   462 <CL_WriteGamestate+0x112>
     462:	b9 01 00 00 00       	mov    ecx,0x1
     467:	48 89 ea             	mov    rdx,rbp
     46a:	4c 89 f6             	mov    rsi,r14
     46d:	4c 89 e7             	mov    rdi,r12
     470:	e8 00 00 00 00       	call   475 <CL_WriteGamestate+0x125>
     475:	48 83 c3 01          	add    rbx,0x1
     479:	48 81 c5 d0 00 00 00 	add    rbp,0xd0
     480:	4c 39 eb             	cmp    rbx,r13
     483:	75 cb                	jne    450 <CL_WriteGamestate+0x100>
     485:	be 08 00 00 00       	mov    esi,0x8
     48a:	4c 89 e7             	mov    rdi,r12
     48d:	e8 00 00 00 00       	call   492 <CL_WriteGamestate+0x142>
     492:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 498 <CL_WriteGamestate+0x148>
     498:	4c 89 e7             	mov    rdi,r12
     49b:	e8 00 00 00 00       	call   4a0 <CL_WriteGamestate+0x150>
     4a0:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 4a6 <CL_WriteGamestate+0x156>
     4a6:	4c 89 e7             	mov    rdi,r12
     4a9:	e8 00 00 00 00       	call   4ae <CL_WriteGamestate+0x15e>
     4ae:	be 08 00 00 00       	mov    esi,0x8
     4b3:	4c 89 e7             	mov    rdi,r12
     4b6:	e8 00 00 00 00       	call   4bb <CL_WriteGamestate+0x16b>
     4bb:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 4c1 <CL_WriteGamestate+0x171>
     4c1:	85 c0                	test   eax,eax
     4c3:	74 64                	je     529 <CL_WriteGamestate+0x1d9>
     4c5:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 4cb <CL_WriteGamestate+0x17b>
     4cb:	83 e8 01             	sub    eax,0x1
     4ce:	48 8d 5c 24 0c       	lea    rbx,[rsp+0xc]
     4d3:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 4d9 <CL_WriteGamestate+0x189>
     4d9:	be 04 00 00 00       	mov    esi,0x4
     4de:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
     4e2:	48 89 df             	mov    rdi,rbx
     4e5:	e8 00 00 00 00       	call   4ea <CL_WriteGamestate+0x19a>
     4ea:	8b 44 24 30          	mov    eax,DWORD PTR [rsp+0x30]
     4ee:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 4f4 <CL_WriteGamestate+0x1a4>
     4f4:	48 89 df             	mov    rdi,rbx
     4f7:	be 04 00 00 00       	mov    esi,0x4
     4fc:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
     500:	e8 00 00 00 00       	call   505 <CL_WriteGamestate+0x1b5>
     505:	8b 74 24 30          	mov    esi,DWORD PTR [rsp+0x30]
     509:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
     50e:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 514 <CL_WriteGamestate+0x1c4>
     514:	e8 00 00 00 00       	call   519 <CL_WriteGamestate+0x1c9>
     519:	48 81 c4 20 41 00 00 	add    rsp,0x4120
     520:	5b                   	pop    rbx
     521:	5d                   	pop    rbp
     522:	41 5c                	pop    r12
     524:	41 5d                	pop    r13
     526:	41 5e                	pop    r14
     528:	c3                   	ret    
     529:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 52f <CL_WriteGamestate+0x1df>
     52f:	83 e8 01             	sub    eax,0x1
     532:	eb 9a                	jmp    4ce <CL_WriteGamestate+0x17e>
     534:	4c 89 e7             	mov    rdi,r12
     537:	e8 84 fd ff ff       	call   2c0 <CL_WriteServerCommands>
     53c:	e9 6e fe ff ff       	jmp    3af <CL_WriteGamestate+0x5f>
     541:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
     548:	00 00 00 00 
     54c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000000550 <CL_ShutdownRef>:
CL_ShutdownRef():
     550:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 557 <CL_ShutdownRef+0x7>
     557:	53                   	push   rbx
     558:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
     55b:	85 c0                	test   eax,eax
     55d:	75 61                	jne    5c0 <CL_ShutdownRef+0x70>
     55f:	89 fb                	mov    ebx,edi
     561:	83 ff 01             	cmp    edi,0x1
     564:	74 05                	je     56b <CL_ShutdownRef+0x1b>
     566:	e8 00 00 00 00       	call   56b <CL_ShutdownRef+0x1b>
     56b:	e8 00 00 00 00       	call   570 <CL_ShutdownRef+0x20>
     570:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 577 <CL_ShutdownRef+0x27>
     577:	48 85 c0             	test   rax,rax
     57a:	74 04                	je     580 <CL_ShutdownRef+0x30>
     57c:	89 df                	mov    edi,ebx
     57e:	ff d0                	call   rax
     580:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 587 <CL_ShutdownRef+0x37>
     587:	48 85 ff             	test   rdi,rdi
     58a:	74 10                	je     59c <CL_ShutdownRef+0x4c>
     58c:	e8 00 00 00 00       	call   591 <CL_ShutdownRef+0x41>
     591:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 59c <CL_ShutdownRef+0x4c>
     598:	00 00 00 00 
     59c:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 5a3 <CL_ShutdownRef+0x53>
     5a3:	b9 26 00 00 00       	mov    ecx,0x26
     5a8:	31 c0                	xor    eax,eax
     5aa:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 5b4 <CL_ShutdownRef+0x64>
     5b1:	00 00 00 
     5b4:	48 89 d7             	mov    rdi,rdx
     5b7:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
     5ba:	5b                   	pop    rbx
     5bb:	c3                   	ret    
     5bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     5c0:	bb 03 00 00 00       	mov    ebx,0x3
     5c5:	eb 9f                	jmp    566 <CL_ShutdownRef+0x16>
     5c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
     5ce:	00 00 

00000000000005d0 <CL_CheckForResend>:
CL_CheckForResend():
     5d0:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # 5d7 <CL_CheckForResend+0x7>
     5d7:	45 85 d2             	test   r10d,r10d
     5da:	0f 85 e8 01 00 00    	jne    7c8 <CL_CheckForResend+0x1f8>
     5e0:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5e6 <CL_CheckForResend+0x16>
     5e6:	8d 50 fd             	lea    edx,[rax-0x3]
     5e9:	83 fa 01             	cmp    edx,0x1
     5ec:	0f 87 d6 01 00 00    	ja     7c8 <CL_CheckForResend+0x1f8>
     5f2:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 5f8 <CL_CheckForResend+0x28>
     5f8:	89 d1                	mov    ecx,edx
     5fa:	2b 0d 00 00 00 00    	sub    ecx,DWORD PTR [rip+0x0]        # 600 <CL_CheckForResend+0x30>
     600:	81 f9 b7 0b 00 00    	cmp    ecx,0xbb7
     606:	0f 8e bc 01 00 00    	jle    7c8 <CL_CheckForResend+0x1f8>
     60c:	41 54                	push   r12
     60e:	55                   	push   rbp
     60f:	53                   	push   rbx
     610:	48 81 ec 10 0c 00 00 	sub    rsp,0xc10
     617:	89 15 00 00 00 00    	mov    DWORD PTR [rip+0x0],edx        # 61d <CL_CheckForResend+0x4d>
     61d:	83 05 00 00 00 00 01 	add    DWORD PTR [rip+0x0],0x1        # 624 <CL_CheckForResend+0x54>
     624:	83 f8 04             	cmp    eax,0x4
     627:	0f 85 a3 01 00 00    	jne    7d0 <CL_CheckForResend+0x200>
     62d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 634 <CL_CheckForResend+0x64>
     634:	48 8d 9c 24 10 04 00 	lea    rbx,[rsp+0x410]
     63b:	00 
     63c:	e8 00 00 00 00       	call   641 <CL_CheckForResend+0x71>
     641:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
     646:	bf 02 00 00 00       	mov    edi,0x2
     64b:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
     652:	00 
     653:	41 89 c4             	mov    r12d,eax
     656:	e8 00 00 00 00       	call   65b <CL_CheckForResend+0x8b>
     65b:	ba 00 08 00 00       	mov    edx,0x800
     660:	48 89 df             	mov    rdi,rbx
     663:	48 89 c6             	mov    rsi,rax
     666:	e8 00 00 00 00       	call   66b <CL_CheckForResend+0x9b>
     66b:	48 89 d8             	mov    rax,rbx
     66e:	8b 08                	mov    ecx,DWORD PTR [rax]
     670:	48 83 c0 04          	add    rax,0x4
     674:	8d 91 ff fe fe fe    	lea    edx,[rcx-0x1010101]
     67a:	f7 d1                	not    ecx
     67c:	21 ca                	and    edx,ecx
     67e:	81 e2 80 80 80 80    	and    edx,0x80808080
     684:	74 e8                	je     66e <CL_CheckForResend+0x9e>
     686:	89 d1                	mov    ecx,edx
     688:	c1 e9 10             	shr    ecx,0x10
     68b:	f7 c2 80 80 00 00    	test   edx,0x8080
     691:	0f 44 d1             	cmove  edx,ecx
     694:	48 8d 48 02          	lea    rcx,[rax+0x2]
     698:	48 0f 44 c1          	cmove  rax,rcx
     69c:	89 d6                	mov    esi,edx
     69e:	40 00 d6             	add    sil,dl
     6a1:	48 83 d8 03          	sbb    rax,0x3
     6a5:	48 29 d8             	sub    rax,rbx
     6a8:	48 3d b3 03 00 00    	cmp    rax,0x3b3
     6ae:	0f 87 5c 02 00 00    	ja     910 <CL_CheckForResend+0x340>
     6b4:	31 ed                	xor    ebp,ebp
     6b6:	48 3d f3 03 00 00    	cmp    rax,0x3f3
     6bc:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6c3 <CL_CheckForResend+0xf3>
     6c3:	40 0f 96 c5          	setbe  bpl
     6c7:	83 78 30 44          	cmp    DWORD PTR [rax+0x30],0x44
     6cb:	0f 84 4f 01 00 00    	je     820 <CL_CheckForResend+0x250>
     6d1:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
     6d5:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 6dc <CL_CheckForResend+0x10c>
     6dc:	be f3 03 00 00       	mov    esi,0x3f3
     6e1:	48 89 df             	mov    rdi,rbx
     6e4:	e8 00 00 00 00       	call   6e9 <CL_CheckForResend+0x119>
     6e9:	44 89 e6             	mov    esi,r12d
     6ec:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6f3 <CL_CheckForResend+0x123>
     6f3:	21 c5                	and    ebp,eax
     6f5:	31 c0                	xor    eax,eax
     6f7:	e8 00 00 00 00       	call   6fc <CL_CheckForResend+0x12c>
     6fc:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 703 <CL_CheckForResend+0x133>
     703:	be f3 03 00 00       	mov    esi,0x3f3
     708:	48 89 df             	mov    rdi,rbx
     70b:	48 89 c1             	mov    rcx,rax
     70e:	e8 00 00 00 00       	call   713 <CL_CheckForResend+0x143>
     713:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 719 <CL_CheckForResend+0x149>
     719:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 720 <CL_CheckForResend+0x150>
     720:	21 c5                	and    ebp,eax
     722:	31 c0                	xor    eax,eax
     724:	e8 00 00 00 00       	call   729 <CL_CheckForResend+0x159>
     729:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 730 <CL_CheckForResend+0x160>
     730:	be f3 03 00 00       	mov    esi,0x3f3
     735:	48 89 df             	mov    rdi,rbx
     738:	48 89 c1             	mov    rcx,rax
     73b:	e8 00 00 00 00       	call   740 <CL_CheckForResend+0x170>
     740:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 747 <CL_CheckForResend+0x177>
     747:	be f3 03 00 00       	mov    esi,0x3f3
     74c:	48 89 df             	mov    rdi,rbx
     74f:	21 c5                	and    ebp,eax
     751:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 758 <CL_CheckForResend+0x188>
     758:	e8 00 00 00 00       	call   75d <CL_CheckForResend+0x18d>
     75d:	85 ed                	test   ebp,ebp
     75f:	0f 84 2b 02 00 00    	je     990 <CL_CheckForResend+0x3c0>
     765:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
     76a:	48 89 d9             	mov    rcx,rbx
     76d:	be 00 04 00 00       	mov    esi,0x400
     772:	31 c0                	xor    eax,eax
     774:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 77b <CL_CheckForResend+0x1ab>
     77b:	48 89 ef             	mov    rdi,rbp
     77e:	e8 00 00 00 00       	call   783 <CL_CheckForResend+0x1b3>
     783:	48 89 ea             	mov    rdx,rbp
     786:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 78d <CL_CheckForResend+0x1bd>
     78d:	31 ff                	xor    edi,edi
     78f:	89 c1                	mov    ecx,eax
     791:	e8 00 00 00 00       	call   796 <CL_CheckForResend+0x1c6>
     796:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 79c <CL_CheckForResend+0x1cc>
     79c:	8b 54 24 0c          	mov    edx,DWORD PTR [rsp+0xc]
     7a0:	83 e0 fd             	and    eax,0xfffffffd
     7a3:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 7a9 <CL_CheckForResend+0x1d9>
     7a9:	85 d2                	test   edx,edx
     7ab:	74 09                	je     7b6 <CL_CheckForResend+0x1e6>
     7ad:	83 c8 02             	or     eax,0x2
     7b0:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 7b6 <CL_CheckForResend+0x1e6>
     7b6:	48 81 c4 10 0c 00 00 	add    rsp,0xc10
     7bd:	5b                   	pop    rbx
     7be:	5d                   	pop    rbp
     7bf:	41 5c                	pop    r12
     7c1:	c3                   	ret    
     7c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     7c8:	c3                   	ret    
     7c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     7d0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 7d7 <CL_CheckForResend+0x207>
     7d7:	e8 00 00 00 00       	call   7dc <CL_CheckForResend+0x20c>
     7dc:	89 c3                	mov    ebx,eax
     7de:	85 c0                	test   eax,eax
     7e0:	75 09                	jne    7eb <CL_CheckForResend+0x21b>
     7e2:	83 3d 00 00 00 00 04 	cmp    DWORD PTR [rip+0x0],0x4        # 7e9 <CL_CheckForResend+0x219>
     7e9:	74 55                	je     840 <CL_CheckForResend+0x270>
     7eb:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 7f1 <CL_CheckForResend+0x221>
     7f1:	4c 8d 05 00 00 00 00 	lea    r8,[rip+0x0]        # 7f8 <CL_CheckForResend+0x228>
     7f8:	31 ff                	xor    edi,edi
     7fa:	31 c0                	xor    eax,eax
     7fc:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 803 <CL_CheckForResend+0x233>
     803:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 80a <CL_CheckForResend+0x23a>
     80a:	e8 00 00 00 00       	call   80f <CL_CheckForResend+0x23f>
     80f:	48 81 c4 10 0c 00 00 	add    rsp,0xc10
     816:	5b                   	pop    rbx
     817:	5d                   	pop    rbp
     818:	41 5c                	pop    r12
     81a:	c3                   	ret    
     81b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
     820:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 826 <CL_CheckForResend+0x256>
     826:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 82d <CL_CheckForResend+0x25d>
     82d:	85 c9                	test   ecx,ecx
     82f:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 836 <CL_CheckForResend+0x266>
     836:	48 0f 44 c8          	cmove  rcx,rax
     83a:	e9 96 fe ff ff       	jmp    6d5 <CL_CheckForResend+0x105>
     83f:	90                   	nop
     840:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 847 <CL_CheckForResend+0x277>
     847:	e8 00 00 00 00       	call   84c <CL_CheckForResend+0x27c>
     84c:	85 c0                	test   eax,eax
     84e:	75 9b                	jne    7eb <CL_CheckForResend+0x21b>
     850:	66 83 3d 00 00 00 00 	cmp    WORD PTR [rip+0x0],0x0        # 858 <CL_CheckForResend+0x288>
     857:	00 
     858:	0f 84 7f 01 00 00    	je     9dd <CL_CheckForResend+0x40d>
     85e:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 864 <CL_CheckForResend+0x294>
     864:	85 f6                	test   esi,esi
     866:	74 83                	je     7eb <CL_CheckForResend+0x21b>
     868:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 86f <CL_CheckForResend+0x29f>
     86f:	e8 00 00 00 00       	call   874 <CL_CheckForResend+0x2a4>
     874:	48 83 f8 21          	cmp    rax,0x21
     878:	0f 84 e6 01 00 00    	je     a64 <CL_CheckForResend+0x494>
     87e:	89 c7                	mov    edi,eax
     880:	48 85 c0             	test   rax,rax
     883:	74 39                	je     8be <CL_CheckForResend+0x2ee>
     885:	31 c0                	xor    eax,eax
     887:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 88e <CL_CheckForResend+0x2be>
     88e:	66 90                	xchg   ax,ax
     890:	0f b6 14 06          	movzx  edx,BYTE PTR [rsi+rax*1]
     894:	8d 4a d0             	lea    ecx,[rdx-0x30]
     897:	80 f9 09             	cmp    cl,0x9
     89a:	76 0d                	jbe    8a9 <CL_CheckForResend+0x2d9>
     89c:	89 d1                	mov    ecx,edx
     89e:	83 e1 df             	and    ecx,0xffffffdf
     8a1:	83 e9 41             	sub    ecx,0x41
     8a4:	80 f9 19             	cmp    cl,0x19
     8a7:	77 0d                	ja     8b6 <CL_CheckForResend+0x2e6>
     8a9:	48 63 cb             	movsxd rcx,ebx
     8ac:	83 c3 01             	add    ebx,0x1
     8af:	88 94 0c 10 04 00 00 	mov    BYTE PTR [rsp+rcx*1+0x410],dl
     8b6:	48 83 c0 01          	add    rax,0x1
     8ba:	39 c7                	cmp    edi,eax
     8bc:	7f d2                	jg     890 <CL_CheckForResend+0x2c0>
     8be:	48 63 db             	movsxd rbx,ebx
     8c1:	ba 18 00 00 00       	mov    edx,0x18
     8c6:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 8cd <CL_CheckForResend+0x2fd>
     8cd:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 8d4 <CL_CheckForResend+0x304>
     8d4:	c6 84 1c 10 04 00 00 	mov    BYTE PTR [rsp+rbx*1+0x410],0x0
     8db:	00 
     8dc:	e8 00 00 00 00       	call   8e1 <CL_CheckForResend+0x311>
     8e1:	4c 8d 84 24 10 04 00 	lea    r8,[rsp+0x410]
     8e8:	00 
     8e9:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 8f0 <CL_CheckForResend+0x320>
     8f0:	31 ff                	xor    edi,edi
     8f2:	8b 48 30             	mov    ecx,DWORD PTR [rax+0x30]
     8f5:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 8fc <CL_CheckForResend+0x32c>
     8fc:	31 c0                	xor    eax,eax
     8fe:	e8 00 00 00 00       	call   903 <CL_CheckForResend+0x333>
     903:	e9 e3 fe ff ff       	jmp    7eb <CL_CheckForResend+0x21b>
     908:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
     90f:	00 
     910:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 917 <CL_CheckForResend+0x347>
     917:	48 89 df             	mov    rdi,rbx
     91a:	e8 00 00 00 00       	call   91f <CL_CheckForResend+0x34f>
     91f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 926 <CL_CheckForResend+0x356>
     926:	48 89 df             	mov    rdi,rbx
     929:	85 c0                	test   eax,eax
     92b:	0f 95 c0             	setne  al
     92e:	0f b6 c0             	movzx  eax,al
     931:	09 44 24 0c          	or     DWORD PTR [rsp+0xc],eax
     935:	e8 00 00 00 00       	call   93a <CL_CheckForResend+0x36a>
     93a:	85 c0                	test   eax,eax
     93c:	0f 95 c0             	setne  al
     93f:	0f b6 c0             	movzx  eax,al
     942:	09 44 24 0c          	or     DWORD PTR [rsp+0xc],eax
     946:	48 89 d8             	mov    rax,rbx
     949:	8b 08                	mov    ecx,DWORD PTR [rax]
     94b:	48 83 c0 04          	add    rax,0x4
     94f:	8d 91 ff fe fe fe    	lea    edx,[rcx-0x1010101]
     955:	f7 d1                	not    ecx
     957:	21 ca                	and    edx,ecx
     959:	81 e2 80 80 80 80    	and    edx,0x80808080
     95f:	74 e8                	je     949 <CL_CheckForResend+0x379>
     961:	89 d1                	mov    ecx,edx
     963:	c1 e9 10             	shr    ecx,0x10
     966:	f7 c2 80 80 00 00    	test   edx,0x8080
     96c:	0f 44 d1             	cmove  edx,ecx
     96f:	48 8d 48 02          	lea    rcx,[rax+0x2]
     973:	48 0f 44 c1          	cmove  rax,rcx
     977:	89 d7                	mov    edi,edx
     979:	40 00 d7             	add    dil,dl
     97c:	48 83 d8 03          	sbb    rax,0x3
     980:	48 29 d8             	sub    rax,rbx
     983:	e9 2c fd ff ff       	jmp    6b4 <CL_CheckForResend+0xe4>
     988:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
     98f:	00 
     990:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 997 <CL_CheckForResend+0x3c7>
     997:	31 c0                	xor    eax,eax
     999:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
     99e:	e8 00 00 00 00       	call   9a3 <CL_CheckForResend+0x3d3>
     9a3:	48 89 d9             	mov    rcx,rbx
     9a6:	be 00 04 00 00       	mov    esi,0x400
     9ab:	48 89 ef             	mov    rdi,rbp
     9ae:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 9b5 <CL_CheckForResend+0x3e5>
     9b5:	31 c0                	xor    eax,eax
     9b7:	e8 00 00 00 00       	call   9bc <CL_CheckForResend+0x3ec>
     9bc:	48 89 ea             	mov    rdx,rbp
     9bf:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 9c6 <CL_CheckForResend+0x3f6>
     9c6:	31 ff                	xor    edi,edi
     9c8:	89 c1                	mov    ecx,eax
     9ca:	e8 00 00 00 00       	call   9cf <CL_CheckForResend+0x3ff>
     9cf:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 9d5 <CL_CheckForResend+0x405>
     9d5:	83 e0 fd             	and    eax,0xfffffffd
     9d8:	e9 d0 fd ff ff       	jmp    7ad <CL_CheckForResend+0x1dd>
     9dd:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 9e4 <CL_CheckForResend+0x414>
     9e4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 9eb <CL_CheckForResend+0x41b>
     9eb:	e8 00 00 00 00       	call   9f0 <CL_CheckForResend+0x420>
     9f0:	ba 04 00 00 00       	mov    edx,0x4
     9f5:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 9fc <CL_CheckForResend+0x42c>
     9fc:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # a03 <CL_CheckForResend+0x433>
     a03:	e8 00 00 00 00       	call   a08 <CL_CheckForResend+0x438>
     a08:	85 c0                	test   eax,eax
     a0a:	74 62                	je     a6e <CL_CheckForResend+0x49e>
     a0c:	bf 30 6d 00 00       	mov    edi,0x6d30
     a11:	e8 00 00 00 00       	call   a16 <CL_CheckForResend+0x446>
     a16:	0f bf f8             	movsx  edi,ax
     a19:	66 89 05 00 00 00 00 	mov    WORD PTR [rip+0x0],ax        # a20 <CL_CheckForResend+0x450>
     a20:	e8 00 00 00 00       	call   a25 <CL_CheckForResend+0x455>
     a25:	44 0f b6 0d 00 00 00 	movzx  r9d,BYTE PTR [rip+0x0]        # a2d <CL_CheckForResend+0x45d>
     a2c:	00 
     a2d:	44 0f b6 05 00 00 00 	movzx  r8d,BYTE PTR [rip+0x0]        # a35 <CL_CheckForResend+0x465>
     a34:	00 
     a35:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # a3c <CL_CheckForResend+0x46c>
     a3c:	98                   	cwde   
     a3d:	0f b6 0d 00 00 00 00 	movzx  ecx,BYTE PTR [rip+0x0]        # a44 <CL_CheckForResend+0x474>
     a44:	0f b6 15 00 00 00 00 	movzx  edx,BYTE PTR [rip+0x0]        # a4b <CL_CheckForResend+0x47b>
     a4b:	57                   	push   rdi
     a4c:	50                   	push   rax
     a4d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # a54 <CL_CheckForResend+0x484>
     a54:	31 c0                	xor    eax,eax
     a56:	e8 00 00 00 00       	call   a5b <CL_CheckForResend+0x48b>
     a5b:	41 58                	pop    r8
     a5d:	41 59                	pop    r9
     a5f:	e9 fa fd ff ff       	jmp    85e <CL_CheckForResend+0x28e>
     a64:	bf 20 00 00 00       	mov    edi,0x20
     a69:	e9 17 fe ff ff       	jmp    885 <CL_CheckForResend+0x2b5>
     a6e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # a75 <CL_CheckForResend+0x4a5>
     a75:	e8 00 00 00 00       	call   a7a <CL_CheckForResend+0x4aa>
     a7a:	e9 6c fd ff ff       	jmp    7eb <CL_CheckForResend+0x21b>
     a7f:	90                   	nop

0000000000000a80 <CL_StopVideo_f>:
CL_StopVideo_f():
     a80:	e9 00 00 00 00       	jmp    a85 <CL_StopVideo_f+0x5>
     a85:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
     a8c:	00 00 00 00 

0000000000000a90 <CL_UpdateGUID>:
CL_UpdateGUID():
     a90:	48 83 ec 08          	sub    rsp,0x8
     a94:	48 89 fa             	mov    rdx,rdi
     a97:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # a9e <CL_UpdateGUID+0xe>
     a9e:	89 f1                	mov    ecx,esi
     aa0:	be 22 00 00 00       	mov    esi,0x22
     aa5:	e8 00 00 00 00       	call   aaa <CL_UpdateGUID+0x1a>
     aaa:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # ab1 <CL_UpdateGUID+0x21>
     ab1:	48 83 c4 08          	add    rsp,0x8
     ab5:	48 89 c6             	mov    rsi,rax
     ab8:	e9 00 00 00 00       	jmp    abd <CL_UpdateGUID+0x2d>
     abd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000000ac0 <CL_OpenedPK3List_f>:
CL_OpenedPK3List_f():
     ac0:	48 83 ec 08          	sub    rsp,0x8
     ac4:	e8 00 00 00 00       	call   ac9 <CL_OpenedPK3List_f+0x9>
     ac9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # ad0 <CL_OpenedPK3List_f+0x10>
     ad0:	48 83 c4 08          	add    rsp,0x8
     ad4:	48 89 c6             	mov    rsi,rax
     ad7:	31 c0                	xor    eax,eax
     ad9:	e9 00 00 00 00       	jmp    ade <CL_OpenedPK3List_f+0x1e>
     ade:	66 90                	xchg   ax,ax

0000000000000ae0 <CL_SetServerInfo>:
CL_SetServerInfo():
     ae0:	48 85 ff             	test   rdi,rdi
     ae3:	0f 84 c7 01 00 00    	je     cb0 <CL_SetServerInfo+0x1d0>
     ae9:	41 54                	push   r12
     aeb:	41 89 d4             	mov    r12d,edx
     aee:	55                   	push   rbp
     aef:	48 89 f5             	mov    rbp,rsi
     af2:	53                   	push   rbx
     af3:	48 89 fb             	mov    rbx,rdi
     af6:	48 85 f6             	test   rsi,rsi
     af9:	0f 84 a4 01 00 00    	je     ca3 <CL_SetServerInfo+0x1c3>
     aff:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # b06 <CL_SetServerInfo+0x26>
     b06:	48 89 ef             	mov    rdi,rbp
     b09:	e8 00 00 00 00       	call   b0e <CL_SetServerInfo+0x2e>
     b0e:	ba 0a 00 00 00       	mov    edx,0xa
     b13:	31 f6                	xor    esi,esi
     b15:	48 89 c7             	mov    rdi,rax
     b18:	e8 00 00 00 00       	call   b1d <CL_SetServerInfo+0x3d>
     b1d:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # b24 <CL_SetServerInfo+0x44>
     b24:	48 89 ef             	mov    rdi,rbp
     b27:	89 83 88 00 00 00    	mov    DWORD PTR [rbx+0x88],eax
     b2d:	e8 00 00 00 00       	call   b32 <CL_SetServerInfo+0x52>
     b32:	ba 20 00 00 00       	mov    edx,0x20
     b37:	48 8d 7b 20          	lea    rdi,[rbx+0x20]
     b3b:	48 89 c6             	mov    rsi,rax
     b3e:	e8 00 00 00 00       	call   b43 <CL_SetServerInfo+0x63>
     b43:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # b4a <CL_SetServerInfo+0x6a>
     b4a:	48 89 ef             	mov    rdi,rbp
     b4d:	e8 00 00 00 00       	call   b52 <CL_SetServerInfo+0x72>
     b52:	ba 20 00 00 00       	mov    edx,0x20
     b57:	48 8d 7b 40          	lea    rdi,[rbx+0x40]
     b5b:	48 89 c6             	mov    rsi,rax
     b5e:	e8 00 00 00 00       	call   b63 <CL_SetServerInfo+0x83>
     b63:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # b6a <CL_SetServerInfo+0x8a>
     b6a:	48 89 ef             	mov    rdi,rbp
     b6d:	e8 00 00 00 00       	call   b72 <CL_SetServerInfo+0x92>
     b72:	ba 0a 00 00 00       	mov    edx,0xa
     b77:	31 f6                	xor    esi,esi
     b79:	48 89 c7             	mov    rdi,rax
     b7c:	e8 00 00 00 00       	call   b81 <CL_SetServerInfo+0xa1>
     b81:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # b88 <CL_SetServerInfo+0xa8>
     b88:	48 89 ef             	mov    rdi,rbp
     b8b:	89 83 8c 00 00 00    	mov    DWORD PTR [rbx+0x8c],eax
     b91:	e8 00 00 00 00       	call   b96 <CL_SetServerInfo+0xb6>
     b96:	ba 20 00 00 00       	mov    edx,0x20
     b9b:	48 8d 7b 60          	lea    rdi,[rbx+0x60]
     b9f:	48 89 c6             	mov    rsi,rax
     ba2:	e8 00 00 00 00       	call   ba7 <CL_SetServerInfo+0xc7>
     ba7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # bae <CL_SetServerInfo+0xce>
     bae:	48 89 ef             	mov    rdi,rbp
     bb1:	e8 00 00 00 00       	call   bb6 <CL_SetServerInfo+0xd6>
     bb6:	ba 0a 00 00 00       	mov    edx,0xa
     bbb:	31 f6                	xor    esi,esi
     bbd:	48 89 c7             	mov    rdi,rax
     bc0:	e8 00 00 00 00       	call   bc5 <CL_SetServerInfo+0xe5>
     bc5:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # bcc <CL_SetServerInfo+0xec>
     bcc:	48 89 ef             	mov    rdi,rbp
     bcf:	89 83 84 00 00 00    	mov    DWORD PTR [rbx+0x84],eax
     bd5:	e8 00 00 00 00       	call   bda <CL_SetServerInfo+0xfa>
     bda:	ba 0a 00 00 00       	mov    edx,0xa
     bdf:	31 f6                	xor    esi,esi
     be1:	48 89 c7             	mov    rdi,rax
     be4:	e8 00 00 00 00       	call   be9 <CL_SetServerInfo+0x109>
     be9:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # bf0 <CL_SetServerInfo+0x110>
     bf0:	48 89 ef             	mov    rdi,rbp
     bf3:	89 83 80 00 00 00    	mov    DWORD PTR [rbx+0x80],eax
     bf9:	e8 00 00 00 00       	call   bfe <CL_SetServerInfo+0x11e>
     bfe:	ba 0a 00 00 00       	mov    edx,0xa
     c03:	31 f6                	xor    esi,esi
     c05:	48 89 c7             	mov    rdi,rax
     c08:	e8 00 00 00 00       	call   c0d <CL_SetServerInfo+0x12d>
     c0d:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # c14 <CL_SetServerInfo+0x134>
     c14:	48 89 ef             	mov    rdi,rbp
     c17:	89 83 90 00 00 00    	mov    DWORD PTR [rbx+0x90],eax
     c1d:	e8 00 00 00 00       	call   c22 <CL_SetServerInfo+0x142>
     c22:	ba 0a 00 00 00       	mov    edx,0xa
     c27:	31 f6                	xor    esi,esi
     c29:	48 89 c7             	mov    rdi,rax
     c2c:	e8 00 00 00 00       	call   c31 <CL_SetServerInfo+0x151>
     c31:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # c38 <CL_SetServerInfo+0x158>
     c38:	48 89 ef             	mov    rdi,rbp
     c3b:	89 83 94 00 00 00    	mov    DWORD PTR [rbx+0x94],eax
     c41:	e8 00 00 00 00       	call   c46 <CL_SetServerInfo+0x166>
     c46:	ba 0a 00 00 00       	mov    edx,0xa
     c4b:	31 f6                	xor    esi,esi
     c4d:	48 89 c7             	mov    rdi,rax
     c50:	e8 00 00 00 00       	call   c55 <CL_SetServerInfo+0x175>
     c55:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # c5c <CL_SetServerInfo+0x17c>
     c5c:	48 89 ef             	mov    rdi,rbp
     c5f:	89 83 a0 00 00 00    	mov    DWORD PTR [rbx+0xa0],eax
     c65:	e8 00 00 00 00       	call   c6a <CL_SetServerInfo+0x18a>
     c6a:	ba 0a 00 00 00       	mov    edx,0xa
     c6f:	31 f6                	xor    esi,esi
     c71:	48 89 c7             	mov    rdi,rax
     c74:	e8 00 00 00 00       	call   c79 <CL_SetServerInfo+0x199>
     c79:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # c80 <CL_SetServerInfo+0x1a0>
     c80:	48 89 ef             	mov    rdi,rbp
     c83:	89 83 a4 00 00 00    	mov    DWORD PTR [rbx+0xa4],eax
     c89:	e8 00 00 00 00       	call   c8e <CL_SetServerInfo+0x1ae>
     c8e:	ba 0a 00 00 00       	mov    edx,0xa
     c93:	31 f6                	xor    esi,esi
     c95:	48 89 c7             	mov    rdi,rax
     c98:	e8 00 00 00 00       	call   c9d <CL_SetServerInfo+0x1bd>
     c9d:	89 83 a8 00 00 00    	mov    DWORD PTR [rbx+0xa8],eax
     ca3:	44 89 a3 98 00 00 00 	mov    DWORD PTR [rbx+0x98],r12d
     caa:	5b                   	pop    rbx
     cab:	5d                   	pop    rbp
     cac:	41 5c                	pop    r12
     cae:	c3                   	ret    
     caf:	90                   	nop
     cb0:	c3                   	ret    
     cb1:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
     cb8:	00 00 00 00 
     cbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000000cc0 <CL_ServerStatusResponse>:
CL_ServerStatusResponse():
     cc0:	41 57                	push   r15
     cc2:	41 56                	push   r14
     cc4:	49 89 fe             	mov    r14,rdi
     cc7:	41 55                	push   r13
     cc9:	45 31 ed             	xor    r13d,r13d
     ccc:	41 54                	push   r12
     cce:	55                   	push   rbp
     ccf:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # cd6 <CL_ServerStatusResponse+0x16>
     cd6:	53                   	push   rbx
     cd7:	31 db                	xor    ebx,ebx
     cd9:	48 81 ec 98 04 00 00 	sub    rsp,0x498
     ce0:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
     ce5:	0f 1f 00             	nop    DWORD PTR [rax]
     ce8:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # cef <CL_ServerStatusResponse+0x2f>
     cef:	4c 89 f7             	mov    rdi,r14
     cf2:	48 8d 34 18          	lea    rsi,[rax+rbx*1]
     cf6:	e8 00 00 00 00       	call   cfb <CL_ServerStatusResponse+0x3b>
     cfb:	85 c0                	test   eax,eax
     cfd:	75 29                	jne    d28 <CL_ServerStatusResponse+0x68>
     cff:	41 83 c5 01          	add    r13d,0x1
     d03:	48 81 c3 38 20 00 00 	add    rbx,0x2038
     d0a:	41 83 fd 10          	cmp    r13d,0x10
     d0e:	75 d8                	jne    ce8 <CL_ServerStatusResponse+0x28>
     d10:	48 81 c4 98 04 00 00 	add    rsp,0x498
     d17:	5b                   	pop    rbx
     d18:	5d                   	pop    rbp
     d19:	41 5c                	pop    r12
     d1b:	41 5d                	pop    r13
     d1d:	41 5e                	pop    r14
     d1f:	41 5f                	pop    r15
     d21:	c3                   	ret    
     d22:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
     d28:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
     d2d:	4c 8d 64 1d 00       	lea    r12,[rbp+rbx*1+0x0]
     d32:	e8 00 00 00 00       	call   d37 <CL_ServerStatusResponse+0x77>
     d37:	be 00 20 00 00       	mov    esi,0x2000
     d3c:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # d43 <CL_ServerStatusResponse+0x83>
     d43:	4c 89 e7             	mov    rdi,r12
     d46:	48 89 c1             	mov    rcx,rax
     d49:	49 89 c7             	mov    r15,rax
     d4c:	31 c0                	xor    eax,eax
     d4e:	e8 00 00 00 00       	call   d53 <CL_ServerStatusResponse+0x93>
     d53:	49 63 c5             	movsxd rax,r13d
     d56:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
     d5b:	48 69 c0 38 20 00 00 	imul   rax,rax,0x2038
     d62:	8b b4 05 2c 20 00 00 	mov    esi,DWORD PTR [rbp+rax*1+0x202c]
     d69:	85 f6                	test   esi,esi
     d6b:	0f 85 a9 02 00 00    	jne    101a <CL_ServerStatusResponse+0x35a>
     d71:	4c 89 e0             	mov    rax,r12
     d74:	8b 08                	mov    ecx,DWORD PTR [rax]
     d76:	48 83 c0 04          	add    rax,0x4
     d7a:	8d 91 ff fe fe fe    	lea    edx,[rcx-0x1010101]
     d80:	f7 d1                	not    ecx
     d82:	21 ca                	and    edx,ecx
     d84:	81 e2 80 80 80 80    	and    edx,0x80808080
     d8a:	74 e8                	je     d74 <CL_ServerStatusResponse+0xb4>
     d8c:	89 d1                	mov    ecx,edx
     d8e:	be 00 20 00 00       	mov    esi,0x2000
     d93:	c1 e9 10             	shr    ecx,0x10
     d96:	f7 c2 80 80 00 00    	test   edx,0x8080
     d9c:	0f 44 d1             	cmove  edx,ecx
     d9f:	48 8d 48 02          	lea    rcx,[rax+0x2]
     da3:	48 0f 44 c1          	cmove  rax,rcx
     da7:	89 d7                	mov    edi,edx
     da9:	40 00 d7             	add    dil,dl
     dac:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # db3 <CL_ServerStatusResponse+0xf3>
     db3:	48 83 d8 03          	sbb    rax,0x3
     db7:	4c 29 e0             	sub    rax,r12
     dba:	48 63 f8             	movsxd rdi,eax
     dbd:	29 c6                	sub    esi,eax
     dbf:	31 c0                	xor    eax,eax
     dc1:	48 01 df             	add    rdi,rbx
     dc4:	48 01 ef             	add    rdi,rbp
     dc7:	e8 00 00 00 00       	call   dcc <CL_ServerStatusResponse+0x10c>
     dcc:	48 69 44 24 28 38 20 	imul   rax,QWORD PTR [rsp+0x28],0x2038
     dd3:	00 00 
     dd5:	8b 8c 05 2c 20 00 00 	mov    ecx,DWORD PTR [rbp+rax*1+0x202c]
     ddc:	85 c9                	test   ecx,ecx
     dde:	0f 85 fb 02 00 00    	jne    10df <CL_ServerStatusResponse+0x41f>
     de4:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
     de9:	45 31 ff             	xor    r15d,r15d
     dec:	e8 00 00 00 00       	call   df1 <CL_ServerStatusResponse+0x131>
     df1:	80 38 00             	cmp    BYTE PTR [rax],0x0
     df4:	49 89 c5             	mov    r13,rax
     df7:	0f 84 68 01 00 00    	je     f65 <CL_ServerStatusResponse+0x2a5>
     dfd:	48 8d 74 24 50       	lea    rsi,[rsp+0x50]
     e02:	48 8d 7c 24 40       	lea    rdi,[rsp+0x40]
     e07:	4c 89 74 24 38       	mov    QWORD PTR [rsp+0x38],r14
     e0c:	48 69 44 24 28 38 20 	imul   rax,QWORD PTR [rsp+0x28],0x2038
     e13:	00 00 
     e15:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
     e1a:	48 89 7c 24 30       	mov    QWORD PTR [rsp+0x30],rdi
     e1f:	49 89 c6             	mov    r14,rax
     e22:	eb 1e                	jmp    e42 <CL_ServerStatusResponse+0x182>
     e24:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
     e28:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
     e2d:	41 83 c7 01          	add    r15d,0x1
     e31:	e8 00 00 00 00       	call   e36 <CL_ServerStatusResponse+0x176>
     e36:	80 38 00             	cmp    BYTE PTR [rax],0x0
     e39:	49 89 c5             	mov    r13,rax
     e3c:	0f 84 1e 01 00 00    	je     f60 <CL_ServerStatusResponse+0x2a0>
     e42:	4c 89 e0             	mov    rax,r12
     e45:	8b 08                	mov    ecx,DWORD PTR [rax]
     e47:	48 83 c0 04          	add    rax,0x4
     e4b:	8d 91 ff fe fe fe    	lea    edx,[rcx-0x1010101]
     e51:	f7 d1                	not    ecx
     e53:	21 ca                	and    edx,ecx
     e55:	81 e2 80 80 80 80    	and    edx,0x80808080
     e5b:	74 e8                	je     e45 <CL_ServerStatusResponse+0x185>
     e5d:	89 d1                	mov    ecx,edx
     e5f:	c1 e9 10             	shr    ecx,0x10
     e62:	f7 c2 80 80 00 00    	test   edx,0x8080
     e68:	0f 44 d1             	cmove  edx,ecx
     e6b:	48 8d 48 02          	lea    rcx,[rax+0x2]
     e6f:	48 0f 44 c1          	cmove  rax,rcx
     e73:	4c 89 e9             	mov    rcx,r13
     e76:	89 d6                	mov    esi,edx
     e78:	40 00 d6             	add    sil,dl
     e7b:	be 00 20 00 00       	mov    esi,0x2000
     e80:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # e87 <CL_ServerStatusResponse+0x1c7>
     e87:	48 83 d8 03          	sbb    rax,0x3
     e8b:	4c 29 e0             	sub    rax,r12
     e8e:	48 63 f8             	movsxd rdi,eax
     e91:	29 c6                	sub    esi,eax
     e93:	31 c0                	xor    eax,eax
     e95:	48 01 df             	add    rdi,rbx
     e98:	48 01 ef             	add    rdi,rbp
     e9b:	e8 00 00 00 00       	call   ea0 <CL_ServerStatusResponse+0x1e0>
     ea0:	42 8b 84 35 2c 20 00 	mov    eax,DWORD PTR [rbp+r14*1+0x202c]
     ea7:	00 
     ea8:	85 c0                	test   eax,eax
     eaa:	0f 84 78 ff ff ff    	je     e28 <CL_ServerStatusResponse+0x168>
     eb0:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
     eb5:	ba 40 00 00 00       	mov    edx,0x40
     eba:	4c 89 ee             	mov    rsi,r13
     ebd:	e8 00 00 00 00       	call   ec2 <CL_ServerStatusResponse+0x202>
     ec2:	48 8b 74 24 30       	mov    rsi,QWORD PTR [rsp+0x30]
     ec7:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
     ecc:	b9 20 00 00 00       	mov    ecx,0x20
     ed1:	ba 02 00 00 00       	mov    edx,0x2
     ed6:	e8 00 00 00 00       	call   edb <CL_ServerStatusResponse+0x21b>
     edb:	48 8b 7c 24 40       	mov    rdi,QWORD PTR [rsp+0x40]
     ee0:	ba 0a 00 00 00       	mov    edx,0xa
     ee5:	31 f6                	xor    esi,esi
     ee7:	e8 00 00 00 00       	call   eec <CL_ServerStatusResponse+0x22c>
     eec:	48 8b 7c 24 48       	mov    rdi,QWORD PTR [rsp+0x48]
     ef1:	ba 0a 00 00 00       	mov    edx,0xa
     ef6:	31 f6                	xor    esi,esi
     ef8:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
     efd:	e8 00 00 00 00       	call   f02 <CL_ServerStatusResponse+0x242>
     f02:	be 20 00 00 00       	mov    esi,0x20
     f07:	4c 89 ef             	mov    rdi,r13
     f0a:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
     f0f:	e8 00 00 00 00       	call   f14 <CL_ServerStatusResponse+0x254>
     f14:	4c 8d 05 00 00 00 00 	lea    r8,[rip+0x0]        # f1b <CL_ServerStatusResponse+0x25b>
     f1b:	48 85 c0             	test   rax,rax
     f1e:	74 1b                	je     f3b <CL_ServerStatusResponse+0x27b>
     f20:	48 8d 78 01          	lea    rdi,[rax+0x1]
     f24:	be 20 00 00 00       	mov    esi,0x20
     f29:	e8 00 00 00 00       	call   f2e <CL_ServerStatusResponse+0x26e>
     f2e:	48 85 c0             	test   rax,rax
     f31:	0f 84 c9 01 00 00    	je     1100 <CL_ServerStatusResponse+0x440>
     f37:	4c 8d 40 01          	lea    r8,[rax+0x1]
     f3b:	8b 4c 24 18          	mov    ecx,DWORD PTR [rsp+0x18]
     f3f:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
     f43:	44 89 fe             	mov    esi,r15d
     f46:	31 c0                	xor    eax,eax
     f48:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # f4f <CL_ServerStatusResponse+0x28f>
     f4f:	e8 00 00 00 00       	call   f54 <CL_ServerStatusResponse+0x294>
     f54:	e9 cf fe ff ff       	jmp    e28 <CL_ServerStatusResponse+0x168>
     f59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
     f60:	4c 8b 74 24 38       	mov    r14,QWORD PTR [rsp+0x38]
     f65:	4c 89 e0             	mov    rax,r12
     f68:	8b 08                	mov    ecx,DWORD PTR [rax]
     f6a:	48 83 c0 04          	add    rax,0x4
     f6e:	8d 91 ff fe fe fe    	lea    edx,[rcx-0x1010101]
     f74:	f7 d1                	not    ecx
     f76:	21 ca                	and    edx,ecx
     f78:	81 e2 80 80 80 80    	and    edx,0x80808080
     f7e:	74 e8                	je     f68 <CL_ServerStatusResponse+0x2a8>
     f80:	89 d1                	mov    ecx,edx
     f82:	be 00 20 00 00       	mov    esi,0x2000
     f87:	c1 e9 10             	shr    ecx,0x10
     f8a:	f7 c2 80 80 00 00    	test   edx,0x8080
     f90:	0f 44 d1             	cmove  edx,ecx
     f93:	48 8d 48 02          	lea    rcx,[rax+0x2]
     f97:	48 0f 44 c1          	cmove  rax,rcx
     f9b:	89 d7                	mov    edi,edx
     f9d:	40 00 d7             	add    dil,dl
     fa0:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # fa7 <CL_ServerStatusResponse+0x2e7>
     fa7:	48 83 d8 03          	sbb    rax,0x3
     fab:	4c 29 e0             	sub    rax,r12
     fae:	48 63 f8             	movsxd rdi,eax
     fb1:	29 c6                	sub    esi,eax
     fb3:	31 c0                	xor    eax,eax
     fb5:	48 01 df             	add    rdi,rbx
     fb8:	48 01 ef             	add    rdi,rbp
     fbb:	e8 00 00 00 00       	call   fc0 <CL_ServerStatusResponse+0x300>
     fc0:	e8 00 00 00 00       	call   fc5 <CL_ServerStatusResponse+0x305>
     fc5:	48 69 54 24 28 38 20 	imul   rdx,QWORD PTR [rsp+0x28],0x2038
     fcc:	00 00 
     fce:	48 01 d5             	add    rbp,rdx
     fd1:	89 85 20 20 00 00    	mov    DWORD PTR [rbp+0x2020],eax
     fd7:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # fde <CL_ServerStatusResponse+0x31e>
     fde:	f3 41 0f 6f 06       	movdqu xmm0,XMMWORD PTR [r14]
     fe3:	48 01 c2             	add    rdx,rax
     fe6:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
     fe9:	f3 41 0f 6f 4e 10    	movdqu xmm1,XMMWORD PTR [r14+0x10]
     fef:	c7 85 28 20 00 00 00 	mov    DWORD PTR [rbp+0x2028],0x0
     ff6:	00 00 00 
     ff9:	0f 11 4a 10          	movups XMMWORD PTR [rdx+0x10],xmm1
     ffd:	8b 95 2c 20 00 00    	mov    edx,DWORD PTR [rbp+0x202c]
    1003:	85 d2                	test   edx,edx
    1005:	0f 84 05 fd ff ff    	je     d10 <CL_ServerStatusResponse+0x50>
    100b:	c7 85 30 20 00 00 01 	mov    DWORD PTR [rbp+0x2030],0x1
    1012:	00 00 00 
    1015:	e9 f6 fc ff ff       	jmp    d10 <CL_ServerStatusResponse+0x50>
    101a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1021 <CL_ServerStatusResponse+0x361>
    1021:	31 c0                	xor    eax,eax
    1023:	4c 8d ac 24 90 00 00 	lea    r13,[rsp+0x90]
    102a:	00 
    102b:	e8 00 00 00 00       	call   1030 <CL_ServerStatusResponse+0x370>
    1030:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
    1035:	0f 1f 00             	nop    DWORD PTR [rax]
    1038:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
    103c:	84 c0                	test   al,al
    103e:	74 71                	je     10b1 <CL_ServerStatusResponse+0x3f1>
    1040:	31 db                	xor    ebx,ebx
    1042:	3c 5c                	cmp    al,0x5c
    1044:	4c 89 e9             	mov    rcx,r13
    1047:	0f 94 c0             	sete   al
    104a:	31 d2                	xor    edx,edx
    104c:	0f b6 c0             	movzx  eax,al
    104f:	49 01 c7             	add    r15,rax
    1052:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
    1056:	eb 25                	jmp    107d <CL_ServerStatusResponse+0x3bd>
    1058:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    105f:	00 
    1060:	83 c2 01             	add    edx,0x1
    1063:	88 01                	mov    BYTE PTR [rcx],al
    1065:	81 fa ff 03 00 00    	cmp    edx,0x3ff
    106b:	74 14                	je     1081 <CL_ServerStatusResponse+0x3c1>
    106d:	49 83 c7 01          	add    r15,0x1
    1071:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
    1075:	48 83 c1 01          	add    rcx,0x1
    1079:	3c 5c                	cmp    al,0x5c
    107b:	74 04                	je     1081 <CL_ServerStatusResponse+0x3c1>
    107d:	84 c0                	test   al,al
    107f:	75 df                	jne    1060 <CL_ServerStatusResponse+0x3a0>
    1081:	48 63 d2             	movsxd rdx,edx
    1084:	4c 89 ee             	mov    rsi,r13
    1087:	c6 84 14 90 00 00 00 	mov    BYTE PTR [rsp+rdx*1+0x90],0x0
    108e:	00 
    108f:	85 db                	test   ebx,ebx
    1091:	74 2d                	je     10c0 <CL_ServerStatusResponse+0x400>
    1093:	31 c0                	xor    eax,eax
    1095:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 109c <CL_ServerStatusResponse+0x3dc>
    109c:	e8 00 00 00 00       	call   10a1 <CL_ServerStatusResponse+0x3e1>
    10a1:	83 fb 01             	cmp    ebx,0x1
    10a4:	74 92                	je     1038 <CL_ServerStatusResponse+0x378>
    10a6:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
    10aa:	83 c3 01             	add    ebx,0x1
    10ad:	84 c0                	test   al,al
    10af:	75 91                	jne    1042 <CL_ServerStatusResponse+0x382>
    10b1:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
    10b6:	e9 b6 fc ff ff       	jmp    d71 <CL_ServerStatusResponse+0xb1>
    10bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    10c0:	31 c0                	xor    eax,eax
    10c2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 10c9 <CL_ServerStatusResponse+0x409>
    10c9:	83 c3 01             	add    ebx,0x1
    10cc:	e8 00 00 00 00       	call   10d1 <CL_ServerStatusResponse+0x411>
    10d1:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
    10d5:	84 c0                	test   al,al
    10d7:	0f 85 65 ff ff ff    	jne    1042 <CL_ServerStatusResponse+0x382>
    10dd:	eb d2                	jmp    10b1 <CL_ServerStatusResponse+0x3f1>
    10df:	31 c0                	xor    eax,eax
    10e1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 10e8 <CL_ServerStatusResponse+0x428>
    10e8:	e8 00 00 00 00       	call   10ed <CL_ServerStatusResponse+0x42d>
    10ed:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 10f4 <CL_ServerStatusResponse+0x434>
    10f4:	31 c0                	xor    eax,eax
    10f6:	e8 00 00 00 00       	call   10fb <CL_ServerStatusResponse+0x43b>
    10fb:	e9 e4 fc ff ff       	jmp    de4 <CL_ServerStatusResponse+0x124>
    1100:	4c 8d 05 00 00 00 00 	lea    r8,[rip+0x0]        # 1107 <CL_ServerStatusResponse+0x447>
    1107:	e9 2f fe ff ff       	jmp    f3b <CL_ServerStatusResponse+0x27b>
    110c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001110 <CL_InitRef>:
CL_InitRef():
    1110:	53                   	push   rbx
    1111:	ba 20 00 00 00       	mov    edx,0x20
    1116:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 111d <CL_InitRef+0xd>
    111d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1124 <CL_InitRef+0x14>
    1124:	48 81 ec c0 11 00 00 	sub    rsp,0x11c0
    112b:	e8 00 00 00 00       	call   1130 <CL_InitRef+0x20>
    1130:	ba 01 40 00 00       	mov    edx,0x4001
    1135:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 113c <CL_InitRef+0x2c>
    113c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1143 <CL_InitRef+0x33>
    1143:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 114a <CL_InitRef+0x3a>
    114a:	e8 00 00 00 00       	call   114f <CL_InitRef+0x3f>
    114f:	ba 21 40 00 00       	mov    edx,0x4021
    1154:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 115b <CL_InitRef+0x4b>
    115b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1162 <CL_InitRef+0x52>
    1162:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1169 <CL_InitRef+0x59>
    1169:	e8 00 00 00 00       	call   116e <CL_InitRef+0x5e>
    116e:	ba 20 00 00 00       	mov    edx,0x20
    1173:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 117a <CL_InitRef+0x6a>
    117a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1181 <CL_InitRef+0x71>
    1181:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1188 <CL_InitRef+0x78>
    1188:	e8 00 00 00 00       	call   118d <CL_InitRef+0x7d>
    118d:	b9 02 00 00 00       	mov    ecx,0x2
    1192:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1199 <CL_InitRef+0x89>
    1199:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 11a0 <CL_InitRef+0x90>
    11a0:	48 89 c7             	mov    rdi,rax
    11a3:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 11aa <CL_InitRef+0x9a>
    11aa:	e8 00 00 00 00       	call   11af <CL_InitRef+0x9f>
    11af:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 11b6 <CL_InitRef+0xa6>
    11b6:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 11bd <CL_InitRef+0xad>
    11bd:	e8 00 00 00 00       	call   11c2 <CL_InitRef+0xb2>
    11c2:	ba 01 00 00 00       	mov    edx,0x1
    11c7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 11ce <CL_InitRef+0xbe>
    11ce:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 11d5 <CL_InitRef+0xc5>
    11d5:	e8 00 00 00 00       	call   11da <CL_InitRef+0xca>
    11da:	ba 01 00 00 00       	mov    edx,0x1
    11df:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 11e6 <CL_InitRef+0xd6>
    11e6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 11ed <CL_InitRef+0xdd>
    11ed:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 11f4 <CL_InitRef+0xe4>
    11f4:	e8 00 00 00 00       	call   11f9 <CL_InitRef+0xe9>
    11f9:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 1200 <CL_InitRef+0xf0>
    1200:	31 d2                	xor    edx,edx
    1202:	31 f6                	xor    esi,esi
    1204:	b9 02 00 00 00       	mov    ecx,0x2
    1209:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1210 <CL_InitRef+0x100>
    1210:	e8 00 00 00 00       	call   1215 <CL_InitRef+0x105>
    1215:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 121c <CL_InitRef+0x10c>
    121c:	31 d2                	xor    edx,edx
    121e:	31 f6                	xor    esi,esi
    1220:	b9 02 00 00 00       	mov    ecx,0x2
    1225:	e8 00 00 00 00       	call   122a <CL_InitRef+0x11a>
    122a:	ba 21 40 00 00       	mov    edx,0x4021
    122f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1236 <CL_InitRef+0x126>
    1236:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 123d <CL_InitRef+0x12d>
    123d:	e8 00 00 00 00       	call   1242 <CL_InitRef+0x132>
    1242:	b9 02 00 00 00       	mov    ecx,0x2
    1247:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 124e <CL_InitRef+0x13e>
    124e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1255 <CL_InitRef+0x145>
    1255:	48 89 c7             	mov    rdi,rax
    1258:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 125f <CL_InitRef+0x14f>
    125f:	e8 00 00 00 00       	call   1264 <CL_InitRef+0x154>
    1264:	ba 21 00 00 00       	mov    edx,0x21
    1269:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1270 <CL_InitRef+0x160>
    1270:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1277 <CL_InitRef+0x167>
    1277:	e8 00 00 00 00       	call   127c <CL_InitRef+0x16c>
    127c:	ba 21 00 00 00       	mov    edx,0x21
    1281:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1288 <CL_InitRef+0x178>
    1288:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 128f <CL_InitRef+0x17f>
    128f:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1296 <CL_InitRef+0x186>
    1296:	e8 00 00 00 00       	call   129b <CL_InitRef+0x18b>
    129b:	be 18 00 00 00       	mov    esi,0x18
    12a0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 12a7 <CL_InitRef+0x197>
    12a7:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 12ae <CL_InitRef+0x19e>
    12ae:	31 c0                	xor    eax,eax
    12b0:	e8 00 00 00 00       	call   12b5 <CL_InitRef+0x1a5>
    12b5:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 12bc <CL_InitRef+0x1ac>
    12bc:	b9 02 00 00 00       	mov    ecx,0x2
    12c1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 12c8 <CL_InitRef+0x1b8>
    12c8:	48 89 c2             	mov    rdx,rax
    12cb:	e8 00 00 00 00       	call   12d0 <CL_InitRef+0x1c0>
    12d0:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 12d7 <CL_InitRef+0x1c7>
    12d7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 12de <CL_InitRef+0x1ce>
    12de:	e8 00 00 00 00       	call   12e3 <CL_InitRef+0x1d3>
    12e3:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 12ea <CL_InitRef+0x1da>
    12ea:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 12f1 <CL_InitRef+0x1e1>
    12f1:	e8 00 00 00 00       	call   12f6 <CL_InitRef+0x1e6>
    12f6:	ba 21 00 00 00       	mov    edx,0x21
    12fb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1302 <CL_InitRef+0x1f2>
    1302:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1309 <CL_InitRef+0x1f9>
    1309:	e8 00 00 00 00       	call   130e <CL_InitRef+0x1fe>
    130e:	ba 21 40 00 00       	mov    edx,0x4021
    1313:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 131a <CL_InitRef+0x20a>
    131a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1321 <CL_InitRef+0x211>
    1321:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1328 <CL_InitRef+0x218>
    1328:	e8 00 00 00 00       	call   132d <CL_InitRef+0x21d>
    132d:	ba 21 00 00 00       	mov    edx,0x21
    1332:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1339 <CL_InitRef+0x229>
    1339:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1340 <CL_InitRef+0x230>
    1340:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1347 <CL_InitRef+0x237>
    1347:	e8 00 00 00 00       	call   134c <CL_InitRef+0x23c>
    134c:	ba 21 00 00 00       	mov    edx,0x21
    1351:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1358 <CL_InitRef+0x248>
    1358:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 135f <CL_InitRef+0x24f>
    135f:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1366 <CL_InitRef+0x256>
    1366:	e8 00 00 00 00       	call   136b <CL_InitRef+0x25b>
    136b:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 1372 <CL_InitRef+0x262>
    1372:	31 d2                	xor    edx,edx
    1374:	b9 02 00 00 00       	mov    ecx,0x2
    1379:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1380 <CL_InitRef+0x270>
    1380:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1387 <CL_InitRef+0x277>
    1387:	e8 00 00 00 00       	call   138c <CL_InitRef+0x27c>
    138c:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 1393 <CL_InitRef+0x283>
    1393:	31 d2                	xor    edx,edx
    1395:	b9 02 00 00 00       	mov    ecx,0x2
    139a:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 13a1 <CL_InitRef+0x291>
    13a1:	e8 00 00 00 00       	call   13a6 <CL_InitRef+0x296>
    13a6:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 13ad <CL_InitRef+0x29d>
    13ad:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 13b4 <CL_InitRef+0x2a4>
    13b4:	e8 00 00 00 00       	call   13b9 <CL_InitRef+0x2a9>
    13b9:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 13c0 <CL_InitRef+0x2b0>
    13c0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 13c7 <CL_InitRef+0x2b7>
    13c7:	e8 00 00 00 00       	call   13cc <CL_InitRef+0x2bc>
    13cc:	ba 21 40 00 00       	mov    edx,0x4021
    13d1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 13d8 <CL_InitRef+0x2c8>
    13d8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 13df <CL_InitRef+0x2cf>
    13df:	e8 00 00 00 00       	call   13e4 <CL_InitRef+0x2d4>
    13e4:	b9 02 00 00 00       	mov    ecx,0x2
    13e9:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 13f0 <CL_InitRef+0x2e0>
    13f0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 13f7 <CL_InitRef+0x2e7>
    13f7:	48 89 c7             	mov    rdi,rax
    13fa:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1401 <CL_InitRef+0x2f1>
    1401:	e8 00 00 00 00       	call   1406 <CL_InitRef+0x2f6>
    1406:	ba 21 40 00 00       	mov    edx,0x4021
    140b:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1412 <CL_InitRef+0x302>
    1412:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1419 <CL_InitRef+0x309>
    1419:	e8 00 00 00 00       	call   141e <CL_InitRef+0x30e>
    141e:	b9 02 00 00 00       	mov    ecx,0x2
    1423:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 142a <CL_InitRef+0x31a>
    142a:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1431 <CL_InitRef+0x321>
    1431:	48 89 c7             	mov    rdi,rax
    1434:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 143b <CL_InitRef+0x32b>
    143b:	e8 00 00 00 00       	call   1440 <CL_InitRef+0x330>
    1440:	ba 21 40 00 00       	mov    edx,0x4021
    1445:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 144c <CL_InitRef+0x33c>
    144c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1453 <CL_InitRef+0x343>
    1453:	e8 00 00 00 00       	call   1458 <CL_InitRef+0x348>
    1458:	b9 02 00 00 00       	mov    ecx,0x2
    145d:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1464 <CL_InitRef+0x354>
    1464:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 146b <CL_InitRef+0x35b>
    146b:	48 89 c7             	mov    rdi,rax
    146e:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1475 <CL_InitRef+0x365>
    1475:	e8 00 00 00 00       	call   147a <CL_InitRef+0x36a>
    147a:	ba 00 02 00 00       	mov    edx,0x200
    147f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1486 <CL_InitRef+0x376>
    1486:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 148d <CL_InitRef+0x37d>
    148d:	e8 00 00 00 00       	call   1492 <CL_InitRef+0x382>
    1492:	ba 21 00 00 00       	mov    edx,0x21
    1497:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 149e <CL_InitRef+0x38e>
    149e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 14a5 <CL_InitRef+0x395>
    14a5:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 14ac <CL_InitRef+0x39c>
    14ac:	e8 00 00 00 00       	call   14b1 <CL_InitRef+0x3a1>
    14b1:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    14b5:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 14bc <CL_InitRef+0x3ac>
    14bc:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    14bf:	84 c0                	test   al,al
    14c1:	74 28                	je     14eb <CL_InitRef+0x3db>
    14c3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    14c8:	89 c1                	mov    ecx,eax
    14ca:	83 e1 df             	and    ecx,0xffffffdf
    14cd:	83 e9 41             	sub    ecx,0x41
    14d0:	80 f9 19             	cmp    cl,0x19
    14d3:	76 0b                	jbe    14e0 <CL_InitRef+0x3d0>
    14d5:	83 e8 31             	sub    eax,0x31
    14d8:	3c 08                	cmp    al,0x8
    14da:	0f 87 f0 03 00 00    	ja     18d0 <CL_InitRef+0x7c0>
    14e0:	48 83 c2 01          	add    rdx,0x1
    14e4:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
    14e7:	84 c0                	test   al,al
    14e9:	75 dd                	jne    14c8 <CL_InitRef+0x3b8>
    14eb:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 14f2 <CL_InitRef+0x3e2>
    14f2:	31 c0                	xor    eax,eax
    14f4:	48 8d 9c 24 c0 01 00 	lea    rbx,[rsp+0x1c0]
    14fb:	00 
    14fc:	e8 00 00 00 00       	call   1501 <CL_InitRef+0x3f1>
    1501:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 1508 <CL_InitRef+0x3f8>
    1508:	be 00 10 00 00       	mov    esi,0x1000
    150d:	48 89 df             	mov    rdi,rbx
    1510:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1517 <CL_InitRef+0x407>
    1517:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    151b:	31 c0                	xor    eax,eax
    151d:	e8 00 00 00 00       	call   1522 <CL_InitRef+0x412>
    1522:	48 89 df             	mov    rdi,rbx
    1525:	e8 00 00 00 00       	call   152a <CL_InitRef+0x41a>
    152a:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1531 <CL_InitRef+0x421>
    1531:	48 85 c0             	test   rax,rax
    1534:	0f 84 ae 03 00 00    	je     18e8 <CL_InitRef+0x7d8>
    153a:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1541 <CL_InitRef+0x431>
    1541:	48 89 c7             	mov    rdi,rax
    1544:	e8 00 00 00 00       	call   1549 <CL_InitRef+0x439>
    1549:	48 85 c0             	test   rax,rax
    154c:	0f 84 fc 03 00 00    	je     194e <CL_InitRef+0x83e>
    1552:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1559 <CL_InitRef+0x449>
    1559:	48 8d 1d 20 04 00 00 	lea    rbx,[rip+0x420]        # 1980 <CL_RefPrintf>
    1560:	bf 08 00 00 00       	mov    edi,0x8
    1565:	48 89 e6             	mov    rsi,rsp
    1568:	48 89 1c 24          	mov    QWORD PTR [rsp],rbx
    156c:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 1573 <CL_InitRef+0x463>
    1573:	c7 42 24 00 00 00 00 	mov    DWORD PTR [rdx+0x24],0x0
    157a:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1581 <CL_InitRef+0x471>
    1581:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
    1586:	48 8d 1d e3 03 00 00 	lea    rbx,[rip+0x3e3]        # 1970 <CL_RefMalloc>
    158d:	48 89 94 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],rdx
    1594:	00 
    1595:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 159c <CL_InitRef+0x48c>
    159c:	48 89 5c 24 38       	mov    QWORD PTR [rsp+0x38],rbx
    15a1:	48 8d 1d b8 03 00 00 	lea    rbx,[rip+0x3b8]        # 1960 <CL_RefFreeAll>
    15a8:	48 89 94 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],rdx
    15af:	00 
    15b0:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 15b7 <CL_InitRef+0x4a7>
    15b7:	48 89 5c 24 48       	mov    QWORD PTR [rsp+0x48],rbx
    15bc:	48 8d 1d 3d ea ff ff 	lea    rbx,[rip+0xffffffffffffea3d]        # 0 <CL_IsMininized>
    15c3:	48 89 94 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],rdx
    15ca:	00 
    15cb:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 15d2 <CL_InitRef+0x4c2>
    15d2:	48 89 94 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rdx
    15d9:	00 
    15da:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 15e1 <CL_InitRef+0x4d1>
    15e1:	48 89 94 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rdx
    15e8:	00 
    15e9:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 15f0 <CL_InitRef+0x4e0>
    15f0:	48 89 54 24 08       	mov    QWORD PTR [rsp+0x8],rdx
    15f5:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 15fc <CL_InitRef+0x4ec>
    15fc:	48 89 54 24 18       	mov    QWORD PTR [rsp+0x18],rdx
    1601:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1608 <CL_InitRef+0x4f8>
    1608:	48 89 54 24 40       	mov    QWORD PTR [rsp+0x40],rdx
    160d:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1614 <CL_InitRef+0x504>
    1614:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
    1619:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1620 <CL_InitRef+0x510>
    1620:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
    1625:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 162c <CL_InitRef+0x51c>
    162c:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
    1631:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1638 <CL_InitRef+0x528>
    1638:	48 89 94 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],rdx
    163f:	00 
    1640:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1647 <CL_InitRef+0x537>
    1647:	48 89 94 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],rdx
    164e:	00 
    164f:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1656 <CL_InitRef+0x546>
    1656:	48 89 94 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rdx
    165d:	00 
    165e:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1665 <CL_InitRef+0x555>
    1665:	48 89 94 24 e8 00 00 	mov    QWORD PTR [rsp+0xe8],rdx
    166c:	00 
    166d:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1674 <CL_InitRef+0x564>
    1674:	48 89 94 24 00 01 00 	mov    QWORD PTR [rsp+0x100],rdx
    167b:	00 
    167c:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1683 <CL_InitRef+0x573>
    1683:	48 89 94 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],rdx
    168a:	00 
    168b:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1692 <CL_InitRef+0x582>
    1692:	48 89 94 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],rdx
    1699:	00 
    169a:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16a1 <CL_InitRef+0x591>
    16a1:	48 89 94 24 08 01 00 	mov    QWORD PTR [rsp+0x108],rdx
    16a8:	00 
    16a9:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16b0 <CL_InitRef+0x5a0>
    16b0:	48 89 54 24 50       	mov    QWORD PTR [rsp+0x50],rdx
    16b5:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16bc <CL_InitRef+0x5ac>
    16bc:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
    16c1:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16c8 <CL_InitRef+0x5b8>
    16c8:	48 89 54 24 60       	mov    QWORD PTR [rsp+0x60],rdx
    16cd:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16d4 <CL_InitRef+0x5c4>
    16d4:	48 89 54 24 68       	mov    QWORD PTR [rsp+0x68],rdx
    16d9:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16e0 <CL_InitRef+0x5d0>
    16e0:	48 89 54 24 70       	mov    QWORD PTR [rsp+0x70],rdx
    16e5:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16ec <CL_InitRef+0x5dc>
    16ec:	48 89 94 24 90 00 00 	mov    QWORD PTR [rsp+0x90],rdx
    16f3:	00 
    16f4:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 16fb <CL_InitRef+0x5eb>
    16fb:	48 89 94 24 98 00 00 	mov    QWORD PTR [rsp+0x98],rdx
    1702:	00 
    1703:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 170a <CL_InitRef+0x5fa>
    170a:	48 89 94 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],rdx
    1711:	00 
    1712:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1719 <CL_InitRef+0x609>
    1719:	48 89 54 24 78       	mov    QWORD PTR [rsp+0x78],rdx
    171e:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1725 <CL_InitRef+0x615>
    1725:	48 89 94 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rdx
    172c:	00 
    172d:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1734 <CL_InitRef+0x624>
    1734:	48 89 9c 24 48 01 00 	mov    QWORD PTR [rsp+0x148],rbx
    173b:	00 
    173c:	48 8d 1d cd e8 ff ff 	lea    rbx,[rip+0xffffffffffffe8cd]        # 10 <CL_SetScaling>
    1743:	48 89 94 24 88 00 00 	mov    QWORD PTR [rsp+0x88],rdx
    174a:	00 
    174b:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1752 <CL_InitRef+0x642>
    1752:	48 89 9c 24 50 01 00 	mov    QWORD PTR [rsp+0x150],rbx
    1759:	00 
    175a:	48 89 94 24 10 01 00 	mov    QWORD PTR [rsp+0x110],rdx
    1761:	00 
    1762:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1769 <CL_InitRef+0x659>
    1769:	48 89 94 24 18 01 00 	mov    QWORD PTR [rsp+0x118],rdx
    1770:	00 
    1771:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1778 <CL_InitRef+0x668>
    1778:	48 89 94 24 20 01 00 	mov    QWORD PTR [rsp+0x120],rdx
    177f:	00 
    1780:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1787 <CL_InitRef+0x677>
    1787:	48 89 94 24 28 01 00 	mov    QWORD PTR [rsp+0x128],rdx
    178e:	00 
    178f:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1796 <CL_InitRef+0x686>
    1796:	48 89 94 24 30 01 00 	mov    QWORD PTR [rsp+0x130],rdx
    179d:	00 
    179e:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 17a5 <CL_InitRef+0x695>
    17a5:	48 89 94 24 38 01 00 	mov    QWORD PTR [rsp+0x138],rdx
    17ac:	00 
    17ad:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 17b4 <CL_InitRef+0x6a4>
    17b4:	48 89 94 24 40 01 00 	mov    QWORD PTR [rsp+0x140],rdx
    17bb:	00 
    17bc:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 17c3 <CL_InitRef+0x6b3>
    17c3:	48 89 94 24 58 01 00 	mov    QWORD PTR [rsp+0x158],rdx
    17ca:	00 
    17cb:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 17d2 <CL_InitRef+0x6c2>
    17d2:	48 89 94 24 60 01 00 	mov    QWORD PTR [rsp+0x160],rdx
    17d9:	00 
    17da:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 17e1 <CL_InitRef+0x6d1>
    17e1:	48 89 94 24 68 01 00 	mov    QWORD PTR [rsp+0x168],rdx
    17e8:	00 
    17e9:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 17f0 <CL_InitRef+0x6e0>
    17f0:	48 89 94 24 70 01 00 	mov    QWORD PTR [rsp+0x170],rdx
    17f7:	00 
    17f8:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 17ff <CL_InitRef+0x6ef>
    17ff:	48 89 94 24 78 01 00 	mov    QWORD PTR [rsp+0x178],rdx
    1806:	00 
    1807:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 180e <CL_InitRef+0x6fe>
    180e:	48 89 94 24 98 01 00 	mov    QWORD PTR [rsp+0x198],rdx
    1815:	00 
    1816:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 181d <CL_InitRef+0x70d>
    181d:	48 89 94 24 80 01 00 	mov    QWORD PTR [rsp+0x180],rdx
    1824:	00 
    1825:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 182c <CL_InitRef+0x71c>
    182c:	48 89 94 24 88 01 00 	mov    QWORD PTR [rsp+0x188],rdx
    1833:	00 
    1834:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 183b <CL_InitRef+0x72b>
    183b:	48 89 94 24 90 01 00 	mov    QWORD PTR [rsp+0x190],rdx
    1842:	00 
    1843:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 184a <CL_InitRef+0x73a>
    184a:	48 89 94 24 a0 01 00 	mov    QWORD PTR [rsp+0x1a0],rdx
    1851:	00 
    1852:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1859 <CL_InitRef+0x749>
    1859:	48 89 94 24 a8 01 00 	mov    QWORD PTR [rsp+0x1a8],rdx
    1860:	00 
    1861:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1868 <CL_InitRef+0x758>
    1868:	48 89 94 24 b0 01 00 	mov    QWORD PTR [rsp+0x1b0],rdx
    186f:	00 
    1870:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 1877 <CL_InitRef+0x767>
    1877:	48 89 94 24 b8 01 00 	mov    QWORD PTR [rsp+0x1b8],rdx
    187e:	00 
    187f:	ff d0                	call   rax
    1881:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1888 <CL_InitRef+0x778>
    1888:	48 89 c3             	mov    rbx,rax
    188b:	31 c0                	xor    eax,eax
    188d:	e8 00 00 00 00       	call   1892 <CL_InitRef+0x782>
    1892:	48 85 db             	test   rbx,rbx
    1895:	0f 84 a3 00 00 00    	je     193e <CL_InitRef+0x82e>
    189b:	48 89 de             	mov    rsi,rbx
    189e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 18a5 <CL_InitRef+0x795>
    18a5:	b9 26 00 00 00       	mov    ecx,0x26
    18aa:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    18ad:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 18b4 <CL_InitRef+0x7a4>
    18b4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 18bb <CL_InitRef+0x7ab>
    18bb:	e8 00 00 00 00       	call   18c0 <CL_InitRef+0x7b0>
    18c0:	48 81 c4 c0 11 00 00 	add    rsp,0x11c0
    18c7:	5b                   	pop    rbx
    18c8:	c3                   	ret    
    18c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    18d0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 18d7 <CL_InitRef+0x7c7>
    18d7:	e8 00 00 00 00       	call   18dc <CL_InitRef+0x7cc>
    18dc:	e9 0a fc ff ff       	jmp    14eb <CL_InitRef+0x3db>
    18e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    18e8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 18ef <CL_InitRef+0x7df>
    18ef:	e8 00 00 00 00       	call   18f4 <CL_InitRef+0x7e4>
    18f4:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 18fb <CL_InitRef+0x7eb>
    18fb:	be 00 10 00 00       	mov    esi,0x1000
    1900:	48 89 df             	mov    rdi,rbx
    1903:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 190a <CL_InitRef+0x7fa>
    190a:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    190e:	31 c0                	xor    eax,eax
    1910:	e8 00 00 00 00       	call   1915 <CL_InitRef+0x805>
    1915:	48 89 df             	mov    rdi,rbx
    1918:	e8 00 00 00 00       	call   191d <CL_InitRef+0x80d>
    191d:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 1924 <CL_InitRef+0x814>
    1924:	48 85 c0             	test   rax,rax
    1927:	0f 85 0d fc ff ff    	jne    153a <CL_InitRef+0x42a>
    192d:	48 89 da             	mov    rdx,rbx
    1930:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1937 <CL_InitRef+0x827>
    1937:	31 ff                	xor    edi,edi
    1939:	e8 00 00 00 00       	call   193e <CL_InitRef+0x82e>
    193e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1945 <CL_InitRef+0x835>
    1945:	31 ff                	xor    edi,edi
    1947:	31 c0                	xor    eax,eax
    1949:	e8 00 00 00 00       	call   194e <CL_InitRef+0x83e>
    194e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1955 <CL_InitRef+0x845>
    1955:	31 ff                	xor    edi,edi
    1957:	e8 00 00 00 00       	call   195c <CL_InitRef+0x84c>
    195c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001960 <CL_RefFreeAll>:
CL_RefFreeAll():
    1960:	bf 07 00 00 00       	mov    edi,0x7
    1965:	e9 00 00 00 00       	jmp    196a <CL_RefFreeAll+0xa>
    196a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001970 <CL_RefMalloc>:
CL_RefMalloc():
    1970:	be 07 00 00 00       	mov    esi,0x7
    1975:	e9 00 00 00 00       	jmp    197a <CL_RefMalloc+0xa>
    197a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000001980 <CL_RefPrintf>:
CL_RefPrintf():
    1980:	55                   	push   rbp
    1981:	53                   	push   rbx
    1982:	89 fb                	mov    ebx,edi
    1984:	48 81 ec d8 20 00 00 	sub    rsp,0x20d8
    198b:	48 89 94 24 30 20 00 	mov    QWORD PTR [rsp+0x2030],rdx
    1992:	00 
    1993:	48 89 8c 24 38 20 00 	mov    QWORD PTR [rsp+0x2038],rcx
    199a:	00 
    199b:	4c 89 84 24 40 20 00 	mov    QWORD PTR [rsp+0x2040],r8
    19a2:	00 
    19a3:	4c 89 8c 24 48 20 00 	mov    QWORD PTR [rsp+0x2048],r9
    19aa:	00 
    19ab:	84 c0                	test   al,al
    19ad:	74 40                	je     19ef <CL_RefPrintf+0x6f>
    19af:	0f 29 84 24 50 20 00 	movaps XMMWORD PTR [rsp+0x2050],xmm0
    19b6:	00 
    19b7:	0f 29 8c 24 60 20 00 	movaps XMMWORD PTR [rsp+0x2060],xmm1
    19be:	00 
    19bf:	0f 29 94 24 70 20 00 	movaps XMMWORD PTR [rsp+0x2070],xmm2
    19c6:	00 
    19c7:	0f 29 9c 24 80 20 00 	movaps XMMWORD PTR [rsp+0x2080],xmm3
    19ce:	00 
    19cf:	0f 29 a4 24 90 20 00 	movaps XMMWORD PTR [rsp+0x2090],xmm4
    19d6:	00 
    19d7:	0f 29 ac 24 a0 20 00 	movaps XMMWORD PTR [rsp+0x20a0],xmm5
    19de:	00 
    19df:	0f 29 b4 24 b0 20 00 	movaps XMMWORD PTR [rsp+0x20b0],xmm6
    19e6:	00 
    19e7:	0f 29 bc 24 c0 20 00 	movaps XMMWORD PTR [rsp+0x20c0],xmm7
    19ee:	00 
    19ef:	48 8d 84 24 f0 20 00 	lea    rax,[rsp+0x20f0]
    19f6:	00 
    19f7:	48 8d 6c 24 20       	lea    rbp,[rsp+0x20]
    19fc:	48 89 f2             	mov    rdx,rsi
    19ff:	be 00 20 00 00       	mov    esi,0x2000
    1a04:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    1a09:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
    1a0e:	48 8d 84 24 20 20 00 	lea    rax,[rsp+0x2020]
    1a15:	00 
    1a16:	48 89 ef             	mov    rdi,rbp
    1a19:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
    1a20:	00 
    1a21:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
    1a28:	00 
    1a29:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
    1a2e:	e8 00 00 00 00       	call   1a33 <CL_RefPrintf+0xb3>
    1a33:	48 89 ee             	mov    rsi,rbp
    1a36:	83 fb 02             	cmp    ebx,0x2
    1a39:	74 25                	je     1a60 <CL_RefPrintf+0xe0>
    1a3b:	83 fb 03             	cmp    ebx,0x3
    1a3e:	74 50                	je     1a90 <CL_RefPrintf+0x110>
    1a40:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1a47 <CL_RefPrintf+0xc7>
    1a47:	31 c0                	xor    eax,eax
    1a49:	83 fb 01             	cmp    ebx,0x1
    1a4c:	74 32                	je     1a80 <CL_RefPrintf+0x100>
    1a4e:	e8 00 00 00 00       	call   1a53 <CL_RefPrintf+0xd3>
    1a53:	48 81 c4 d8 20 00 00 	add    rsp,0x20d8
    1a5a:	5b                   	pop    rbx
    1a5b:	5d                   	pop    rbp
    1a5c:	c3                   	ret    
    1a5d:	0f 1f 00             	nop    DWORD PTR [rax]
    1a60:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1a67 <CL_RefPrintf+0xe7>
    1a67:	31 c0                	xor    eax,eax
    1a69:	e8 00 00 00 00       	call   1a6e <CL_RefPrintf+0xee>
    1a6e:	48 81 c4 d8 20 00 00 	add    rsp,0x20d8
    1a75:	5b                   	pop    rbx
    1a76:	5d                   	pop    rbp
    1a77:	c3                   	ret    
    1a78:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    1a7f:	00 
    1a80:	e8 00 00 00 00       	call   1a85 <CL_RefPrintf+0x105>
    1a85:	48 81 c4 d8 20 00 00 	add    rsp,0x20d8
    1a8c:	5b                   	pop    rbx
    1a8d:	5d                   	pop    rbp
    1a8e:	c3                   	ret    
    1a8f:	90                   	nop
    1a90:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1a97 <CL_RefPrintf+0x117>
    1a97:	31 c0                	xor    eax,eax
    1a99:	eb b3                	jmp    1a4e <CL_RefPrintf+0xce>
    1a9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001aa0 <CL_Video_f>:
CL_Video_f():
    1aa0:	41 56                	push   r14
    1aa2:	31 ff                	xor    edi,edi
    1aa4:	41 55                	push   r13
    1aa6:	41 54                	push   r12
    1aa8:	55                   	push   rbp
    1aa9:	53                   	push   rbx
    1aaa:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
    1ab1:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 1ab7 <CL_Video_f+0x17>
    1ab7:	85 c0                	test   eax,eax
    1ab9:	0f 84 81 01 00 00    	je     1c40 <CL_Video_f+0x1a0>
    1abf:	e8 00 00 00 00       	call   1ac4 <CL_Video_f+0x24>
    1ac4:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1acb <CL_Video_f+0x2b>
    1acb:	48 89 c7             	mov    rdi,rax
    1ace:	e8 00 00 00 00       	call   1ad3 <CL_Video_f+0x33>
    1ad3:	41 89 c6             	mov    r14d,eax
    1ad6:	85 c0                	test   eax,eax
    1ad8:	0f 84 da 00 00 00    	je     1bb8 <CL_Video_f+0x118>
    1ade:	e8 00 00 00 00       	call   1ae3 <CL_Video_f+0x43>
    1ae3:	4c 8d 25 00 00 00 00 	lea    r12,[rip+0x0]        # 1aea <CL_Video_f+0x4a>
    1aea:	83 f8 02             	cmp    eax,0x2
    1aed:	0f 84 9b 01 00 00    	je     1c8e <CL_Video_f+0x1ee>
    1af3:	31 db                	xor    ebx,ebx
    1af5:	48 89 e5             	mov    rbp,rsp
    1af8:	4c 8d 2d 00 00 00 00 	lea    r13,[rip+0x0]        # 1aff <CL_Video_f+0x5f>
    1aff:	eb 16                	jmp    1b17 <CL_Video_f+0x77>
    1b01:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    1b08:	83 c3 01             	add    ebx,0x1
    1b0b:	81 fb 10 27 00 00    	cmp    ebx,0x2710
    1b11:	0f 84 59 01 00 00    	je     1c70 <CL_Video_f+0x1d0>
    1b17:	48 89 ef             	mov    rdi,rbp
    1b1a:	31 c0                	xor    eax,eax
    1b1c:	4d 89 e0             	mov    r8,r12
    1b1f:	89 d9                	mov    ecx,ebx
    1b21:	4c 89 ea             	mov    rdx,r13
    1b24:	be 00 10 00 00       	mov    esi,0x1000
    1b29:	e8 00 00 00 00       	call   1b2e <CL_Video_f+0x8e>
    1b2e:	48 89 ef             	mov    rdi,rbp
    1b31:	e8 00 00 00 00       	call   1b36 <CL_Video_f+0x96>
    1b36:	85 c0                	test   eax,eax
    1b38:	75 ce                	jne    1b08 <CL_Video_f+0x68>
    1b3a:	89 d9                	mov    ecx,ebx
    1b3c:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1b43 <CL_Video_f+0xa3>
    1b43:	be 00 10 00 00       	mov    esi,0x1000
    1b48:	31 c0                	xor    eax,eax
    1b4a:	48 89 ef             	mov    rdi,rbp
    1b4d:	e8 00 00 00 00       	call   1b52 <CL_Video_f+0xb2>
    1b52:	48 89 ee             	mov    rsi,rbp
    1b55:	ba 40 00 00 00       	mov    edx,0x40
    1b5a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1b61 <CL_Video_f+0xc1>
    1b61:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 1b6c <CL_Video_f+0xcc>
    1b68:	00 00 00 00 
    1b6c:	e8 00 00 00 00       	call   1b71 <CL_Video_f+0xd1>
    1b71:	4c 89 e2             	mov    rdx,r12
    1b74:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1b7b <CL_Video_f+0xdb>
    1b7b:	31 c0                	xor    eax,eax
    1b7d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1b84 <CL_Video_f+0xe4>
    1b84:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 1b8e <CL_Video_f+0xee>
    1b8b:	00 00 00 
    1b8e:	e8 00 00 00 00       	call   1b93 <CL_Video_f+0xf3>
    1b93:	31 f6                	xor    esi,esi
    1b95:	45 85 f6             	test   r14d,r14d
    1b98:	40 0f 94 c6          	sete   sil
    1b9c:	48 89 c7             	mov    rdi,rax
    1b9f:	e8 00 00 00 00       	call   1ba4 <CL_Video_f+0x104>
    1ba4:	48 81 c4 00 10 00 00 	add    rsp,0x1000
    1bab:	5b                   	pop    rbx
    1bac:	5d                   	pop    rbp
    1bad:	41 5c                	pop    r12
    1baf:	41 5d                	pop    r13
    1bb1:	41 5e                	pop    r14
    1bb3:	c3                   	ret    
    1bb4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1bb8:	e8 00 00 00 00       	call   1bbd <CL_Video_f+0x11d>
    1bbd:	4c 8d 25 00 00 00 00 	lea    r12,[rip+0x0]        # 1bc4 <CL_Video_f+0x124>
    1bc4:	83 f8 02             	cmp    eax,0x2
    1bc7:	0f 85 26 ff ff ff    	jne    1af3 <CL_Video_f+0x53>
    1bcd:	bf 01 00 00 00       	mov    edi,0x1
    1bd2:	48 89 e5             	mov    rbp,rsp
    1bd5:	4c 8d 25 00 00 00 00 	lea    r12,[rip+0x0]        # 1bdc <CL_Video_f+0x13c>
    1bdc:	e8 00 00 00 00       	call   1be1 <CL_Video_f+0x141>
    1be1:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1be8 <CL_Video_f+0x148>
    1be8:	be 00 10 00 00       	mov    esi,0x1000
    1bed:	48 89 ef             	mov    rdi,rbp
    1bf0:	48 89 c1             	mov    rcx,rax
    1bf3:	31 c0                	xor    eax,eax
    1bf5:	e8 00 00 00 00       	call   1bfa <CL_Video_f+0x15a>
    1bfa:	be 2f 00 00 00       	mov    esi,0x2f
    1bff:	48 89 ef             	mov    rdi,rbp
    1c02:	e8 00 00 00 00       	call   1c07 <CL_Video_f+0x167>
    1c07:	be 2e 00 00 00       	mov    esi,0x2e
    1c0c:	48 89 ef             	mov    rdi,rbp
    1c0f:	48 89 c3             	mov    rbx,rax
    1c12:	e8 00 00 00 00       	call   1c17 <CL_Video_f+0x177>
    1c17:	48 85 c0             	test   rax,rax
    1c1a:	0f 84 32 ff ff ff    	je     1b52 <CL_Video_f+0xb2>
    1c20:	48 39 c3             	cmp    rbx,rax
    1c23:	0f 83 29 ff ff ff    	jae    1b52 <CL_Video_f+0xb2>
    1c29:	80 78 01 00          	cmp    BYTE PTR [rax+0x1],0x0
    1c2d:	0f 84 1f ff ff ff    	je     1b52 <CL_Video_f+0xb2>
    1c33:	4c 8d 60 01          	lea    r12,[rax+0x1]
    1c37:	c6 00 00             	mov    BYTE PTR [rax],0x0
    1c3a:	e9 13 ff ff ff       	jmp    1b52 <CL_Video_f+0xb2>
    1c3f:	90                   	nop
    1c40:	e8 00 00 00 00       	call   1c45 <CL_Video_f+0x1a5>
    1c45:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1c4c <CL_Video_f+0x1ac>
    1c4c:	48 89 c6             	mov    rsi,rax
    1c4f:	31 c0                	xor    eax,eax
    1c51:	e8 00 00 00 00       	call   1c56 <CL_Video_f+0x1b6>
    1c56:	48 81 c4 00 10 00 00 	add    rsp,0x1000
    1c5d:	5b                   	pop    rbx
    1c5e:	5d                   	pop    rbp
    1c5f:	41 5c                	pop    r12
    1c61:	41 5d                	pop    r13
    1c63:	41 5e                	pop    r14
    1c65:	c3                   	ret    
    1c66:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    1c6d:	00 00 00 
    1c70:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1c77 <CL_Video_f+0x1d7>
    1c77:	31 c0                	xor    eax,eax
    1c79:	e8 00 00 00 00       	call   1c7e <CL_Video_f+0x1de>
    1c7e:	48 81 c4 00 10 00 00 	add    rsp,0x1000
    1c85:	5b                   	pop    rbx
    1c86:	5d                   	pop    rbp
    1c87:	41 5c                	pop    r12
    1c89:	41 5d                	pop    r13
    1c8b:	41 5e                	pop    r14
    1c8d:	c3                   	ret    
    1c8e:	bf 01 00 00 00       	mov    edi,0x1
    1c93:	48 89 e5             	mov    rbp,rsp
    1c96:	4c 8d 25 00 00 00 00 	lea    r12,[rip+0x0]        # 1c9d <CL_Video_f+0x1fd>
    1c9d:	e8 00 00 00 00       	call   1ca2 <CL_Video_f+0x202>
    1ca2:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1ca9 <CL_Video_f+0x209>
    1ca9:	be 00 10 00 00       	mov    esi,0x1000
    1cae:	48 89 ef             	mov    rdi,rbp
    1cb1:	48 89 c1             	mov    rcx,rax
    1cb4:	31 c0                	xor    eax,eax
    1cb6:	e8 00 00 00 00       	call   1cbb <CL_Video_f+0x21b>
    1cbb:	e9 92 fe ff ff       	jmp    1b52 <CL_Video_f+0xb2>

0000000000001cc0 <CL_Systeminfo_f>:
CL_Systeminfo_f():
    1cc0:	53                   	push   rbx
    1cc1:	48 63 1d 00 00 00 00 	movsxd rbx,DWORD PTR [rip+0x0]        # 1cc8 <CL_Systeminfo_f+0x8>
    1cc8:	85 db                	test   ebx,ebx
    1cca:	75 04                	jne    1cd0 <CL_Systeminfo_f+0x10>
    1ccc:	5b                   	pop    rbx
    1ccd:	c3                   	ret    
    1cce:	66 90                	xchg   ax,ax
    1cd0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1cd7 <CL_Systeminfo_f+0x17>
    1cd7:	31 c0                	xor    eax,eax
    1cd9:	e8 00 00 00 00       	call   1cde <CL_Systeminfo_f+0x1e>
    1cde:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1ce5 <CL_Systeminfo_f+0x25>
    1ce5:	48 01 df             	add    rdi,rbx
    1ce8:	5b                   	pop    rbx
    1ce9:	e9 00 00 00 00       	jmp    1cee <CL_Systeminfo_f+0x2e>
    1cee:	66 90                	xchg   ax,ax

0000000000001cf0 <CL_Serverinfo_f>:
CL_Serverinfo_f():
    1cf0:	53                   	push   rbx
    1cf1:	48 63 1d 00 00 00 00 	movsxd rbx,DWORD PTR [rip+0x0]        # 1cf8 <CL_Serverinfo_f+0x8>
    1cf8:	85 db                	test   ebx,ebx
    1cfa:	75 04                	jne    1d00 <CL_Serverinfo_f+0x10>
    1cfc:	5b                   	pop    rbx
    1cfd:	c3                   	ret    
    1cfe:	66 90                	xchg   ax,ax
    1d00:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d07 <CL_Serverinfo_f+0x17>
    1d07:	31 c0                	xor    eax,eax
    1d09:	e8 00 00 00 00       	call   1d0e <CL_Serverinfo_f+0x1e>
    1d0e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d15 <CL_Serverinfo_f+0x25>
    1d15:	48 01 df             	add    rdi,rbx
    1d18:	5b                   	pop    rbx
    1d19:	e9 00 00 00 00       	jmp    1d1e <CL_Serverinfo_f+0x2e>
    1d1e:	66 90                	xchg   ax,ax

0000000000001d20 <CL_Clientinfo_f>:
CL_Clientinfo_f():
    1d20:	48 83 ec 08          	sub    rsp,0x8
    1d24:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d2b <CL_Clientinfo_f+0xb>
    1d2b:	31 c0                	xor    eax,eax
    1d2d:	e8 00 00 00 00       	call   1d32 <CL_Clientinfo_f+0x12>
    1d32:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 1d38 <CL_Clientinfo_f+0x18>
    1d38:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d3f <CL_Clientinfo_f+0x1f>
    1d3f:	31 c0                	xor    eax,eax
    1d41:	e8 00 00 00 00       	call   1d46 <CL_Clientinfo_f+0x26>
    1d46:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1d4d <CL_Clientinfo_f+0x2d>
    1d4d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d54 <CL_Clientinfo_f+0x34>
    1d54:	31 c0                	xor    eax,eax
    1d56:	e8 00 00 00 00       	call   1d5b <CL_Clientinfo_f+0x3b>
    1d5b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d62 <CL_Clientinfo_f+0x42>
    1d62:	31 c0                	xor    eax,eax
    1d64:	e8 00 00 00 00       	call   1d69 <CL_Clientinfo_f+0x49>
    1d69:	31 f6                	xor    esi,esi
    1d6b:	bf 02 00 00 00       	mov    edi,0x2
    1d70:	e8 00 00 00 00       	call   1d75 <CL_Clientinfo_f+0x55>
    1d75:	48 89 c7             	mov    rdi,rax
    1d78:	e8 00 00 00 00       	call   1d7d <CL_Clientinfo_f+0x5d>
    1d7d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1d84 <CL_Clientinfo_f+0x64>
    1d84:	31 c0                	xor    eax,eax
    1d86:	48 83 c4 08          	add    rsp,0x8
    1d8a:	e9 00 00 00 00       	jmp    1d8f <CL_Clientinfo_f+0x6f>
    1d8f:	90                   	nop

0000000000001d90 <CL_ReferencedPK3List_f>:
CL_ReferencedPK3List_f():
    1d90:	48 83 ec 08          	sub    rsp,0x8
    1d94:	e8 00 00 00 00       	call   1d99 <CL_ReferencedPK3List_f+0x9>
    1d99:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1da0 <CL_ReferencedPK3List_f+0x10>
    1da0:	48 83 c4 08          	add    rsp,0x8
    1da4:	48 89 c6             	mov    rsi,rax
    1da7:	31 c0                	xor    eax,eax
    1da9:	e9 00 00 00 00       	jmp    1dae <CL_ReferencedPK3List_f+0x1e>
    1dae:	66 90                	xchg   ax,ax

0000000000001db0 <CL_ShowIP_f>:
CL_ShowIP_f():
    1db0:	e9 00 00 00 00       	jmp    1db5 <CL_ShowIP_f+0x5>
    1db5:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    1dbc:	00 00 00 00 

0000000000001dc0 <CL_LocalServers_f>:
CL_LocalServers_f():
    1dc0:	41 55                	push   r13
    1dc2:	31 c0                	xor    eax,eax
    1dc4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1dcb <CL_LocalServers_f+0xb>
    1dcb:	41 54                	push   r12
    1dcd:	55                   	push   rbp
    1dce:	53                   	push   rbx
    1dcf:	48 83 ec 28          	sub    rsp,0x28
    1dd3:	e8 00 00 00 00       	call   1dd8 <CL_LocalServers_f+0x18>
    1dd8:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1ddf <CL_LocalServers_f+0x1f>
    1ddf:	31 c0                	xor    eax,eax
    1de1:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 1deb <CL_LocalServers_f+0x2b>
    1de8:	00 00 00 
    1deb:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 1df5 <CL_LocalServers_f+0x35>
    1df2:	00 00 00 
    1df5:	4c 8d 82 00 58 00 00 	lea    r8,[rdx+0x5800]
    1dfc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1e00:	48 8d 7a 08          	lea    rdi,[rdx+0x8]
    1e04:	48 89 d1             	mov    rcx,rdx
    1e07:	8b b2 9c 00 00 00    	mov    esi,DWORD PTR [rdx+0x9c]
    1e0d:	48 c7 02 00 00 00 00 	mov    QWORD PTR [rdx],0x0
    1e14:	48 83 e7 f8          	and    rdi,0xfffffffffffffff8
    1e18:	48 81 c2 b0 00 00 00 	add    rdx,0xb0
    1e1f:	48 c7 42 f8 00 00 00 	mov    QWORD PTR [rdx-0x8],0x0
    1e26:	00 
    1e27:	48 29 f9             	sub    rcx,rdi
    1e2a:	81 c1 b0 00 00 00    	add    ecx,0xb0
    1e30:	c1 e9 03             	shr    ecx,0x3
    1e33:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    1e36:	89 72 ec             	mov    DWORD PTR [rdx-0x14],esi
    1e39:	4c 39 c2             	cmp    rdx,r8
    1e3c:	75 c2                	jne    1e00 <CL_LocalServers_f+0x40>
    1e3e:	66 0f ef c0          	pxor   xmm0,xmm0
    1e42:	41 bd 02 00 00 00    	mov    r13d,0x2
    1e48:	49 89 e4             	mov    r12,rsp
    1e4b:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
    1e4f:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 1e56 <CL_LocalServers_f+0x96>
    1e56:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
    1e5b:	bb 38 6d 00 00       	mov    ebx,0x6d38
    1e60:	89 df                	mov    edi,ebx
    1e62:	83 c3 01             	add    ebx,0x1
    1e65:	e8 00 00 00 00       	call   1e6a <CL_LocalServers_f+0xaa>
    1e6a:	4c 89 e1             	mov    rcx,r12
    1e6d:	48 89 ea             	mov    rdx,rbp
    1e70:	be 0f 00 00 00       	mov    esi,0xf
    1e75:	31 ff                	xor    edi,edi
    1e77:	66 89 44 24 14       	mov    WORD PTR [rsp+0x14],ax
    1e7c:	c7 04 24 03 00 00 00 	mov    DWORD PTR [rsp],0x3
    1e83:	e8 00 00 00 00       	call   1e88 <CL_LocalServers_f+0xc8>
    1e88:	4c 89 e1             	mov    rcx,r12
    1e8b:	48 89 ea             	mov    rdx,rbp
    1e8e:	be 0f 00 00 00       	mov    esi,0xf
    1e93:	31 ff                	xor    edi,edi
    1e95:	c7 04 24 06 00 00 00 	mov    DWORD PTR [rsp],0x6
    1e9c:	e8 00 00 00 00       	call   1ea1 <CL_LocalServers_f+0xe1>
    1ea1:	81 fb 3c 6d 00 00    	cmp    ebx,0x6d3c
    1ea7:	75 b7                	jne    1e60 <CL_LocalServers_f+0xa0>
    1ea9:	41 83 fd 01          	cmp    r13d,0x1
    1ead:	74 08                	je     1eb7 <CL_LocalServers_f+0xf7>
    1eaf:	41 bd 01 00 00 00    	mov    r13d,0x1
    1eb5:	eb a4                	jmp    1e5b <CL_LocalServers_f+0x9b>
    1eb7:	48 83 c4 28          	add    rsp,0x28
    1ebb:	5b                   	pop    rbx
    1ebc:	5d                   	pop    rbp
    1ebd:	41 5c                	pop    r12
    1ebf:	41 5d                	pop    r13
    1ec1:	c3                   	ret    
    1ec2:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    1ec9:	00 00 00 00 
    1ecd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000001ed0 <CL_GlobalServers_f>:
CL_GlobalServers_f():
    1ed0:	41 56                	push   r14
    1ed2:	41 55                	push   r13
    1ed4:	41 54                	push   r12
    1ed6:	55                   	push   rbp
    1ed7:	53                   	push   rbx
    1ed8:	48 81 ec 20 04 00 00 	sub    rsp,0x420
    1edf:	e8 00 00 00 00       	call   1ee4 <CL_GlobalServers_f+0x14>
    1ee4:	83 f8 02             	cmp    eax,0x2
    1ee7:	7e 20                	jle    1f09 <CL_GlobalServers_f+0x39>
    1ee9:	bf 01 00 00 00       	mov    edi,0x1
    1eee:	89 c5                	mov    ebp,eax
    1ef0:	e8 00 00 00 00       	call   1ef5 <CL_GlobalServers_f+0x25>
    1ef5:	31 f6                	xor    esi,esi
    1ef7:	ba 0a 00 00 00       	mov    edx,0xa
    1efc:	48 89 c7             	mov    rdi,rax
    1eff:	e8 00 00 00 00       	call   1f04 <CL_GlobalServers_f+0x34>
    1f04:	83 f8 05             	cmp    eax,0x5
    1f07:	76 27                	jbe    1f30 <CL_GlobalServers_f+0x60>
    1f09:	be 05 00 00 00       	mov    esi,0x5
    1f0e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1f15 <CL_GlobalServers_f+0x45>
    1f15:	31 c0                	xor    eax,eax
    1f17:	e8 00 00 00 00       	call   1f1c <CL_GlobalServers_f+0x4c>
    1f1c:	48 81 c4 20 04 00 00 	add    rsp,0x420
    1f23:	5b                   	pop    rbx
    1f24:	5d                   	pop    rbp
    1f25:	41 5c                	pop    r12
    1f27:	41 5d                	pop    r13
    1f29:	41 5e                	pop    r14
    1f2b:	c3                   	ret    
    1f2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    1f30:	41 89 c4             	mov    r12d,eax
    1f33:	85 c0                	test   eax,eax
    1f35:	0f 85 95 00 00 00    	jne    1fd0 <CL_GlobalServers_f+0x100>
    1f3b:	bd 01 00 00 00       	mov    ebp,0x1
    1f40:	48 8d 5c 24 20       	lea    rbx,[rsp+0x20]
    1f45:	4c 8d 2d 00 00 00 00 	lea    r13,[rip+0x0]        # 1f4c <CL_GlobalServers_f+0x7c>
    1f4c:	89 ea                	mov    edx,ebp
    1f4e:	4c 89 ee             	mov    rsi,r13
    1f51:	48 89 df             	mov    rdi,rbx
    1f54:	31 c0                	xor    eax,eax
    1f56:	e8 00 00 00 00       	call   1f5b <CL_GlobalServers_f+0x8b>
    1f5b:	48 89 df             	mov    rdi,rbx
    1f5e:	e8 00 00 00 00       	call   1f63 <CL_GlobalServers_f+0x93>
    1f63:	80 38 00             	cmp    BYTE PTR [rax],0x0
    1f66:	74 41                	je     1fa9 <CL_GlobalServers_f+0xd9>
    1f68:	bf 03 00 00 00       	mov    edi,0x3
    1f6d:	41 83 c4 01          	add    r12d,0x1
    1f71:	e8 00 00 00 00       	call   1f76 <CL_GlobalServers_f+0xa6>
    1f76:	bf 02 00 00 00       	mov    edi,0x2
    1f7b:	49 89 c6             	mov    r14,rax
    1f7e:	e8 00 00 00 00       	call   1f83 <CL_GlobalServers_f+0xb3>
    1f83:	48 89 df             	mov    rdi,rbx
    1f86:	4d 89 f1             	mov    r9,r14
    1f89:	89 e9                	mov    ecx,ebp
    1f8b:	49 89 c0             	mov    r8,rax
    1f8e:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 1f95 <CL_GlobalServers_f+0xc5>
    1f95:	be 00 04 00 00       	mov    esi,0x400
    1f9a:	31 c0                	xor    eax,eax
    1f9c:	e8 00 00 00 00       	call   1fa1 <CL_GlobalServers_f+0xd1>
    1fa1:	48 89 df             	mov    rdi,rbx
    1fa4:	e8 00 00 00 00       	call   1fa9 <CL_GlobalServers_f+0xd9>
    1fa9:	83 c5 01             	add    ebp,0x1
    1fac:	83 fd 06             	cmp    ebp,0x6
    1faf:	75 9b                	jne    1f4c <CL_GlobalServers_f+0x7c>
    1fb1:	45 85 e4             	test   r12d,r12d
    1fb4:	0f 85 62 ff ff ff    	jne    1f1c <CL_GlobalServers_f+0x4c>
    1fba:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 1fc1 <CL_GlobalServers_f+0xf1>
    1fc1:	31 c0                	xor    eax,eax
    1fc3:	e8 00 00 00 00       	call   1fc8 <CL_GlobalServers_f+0xf8>
    1fc8:	e9 4f ff ff ff       	jmp    1f1c <CL_GlobalServers_f+0x4c>
    1fcd:	0f 1f 00             	nop    DWORD PTR [rax]
    1fd0:	48 8d 5c 24 20       	lea    rbx,[rsp+0x20]
    1fd5:	89 c2                	mov    edx,eax
    1fd7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 1fde <CL_GlobalServers_f+0x10e>
    1fde:	31 c0                	xor    eax,eax
    1fe0:	48 89 df             	mov    rdi,rbx
    1fe3:	e8 00 00 00 00       	call   1fe8 <CL_GlobalServers_f+0x118>
    1fe8:	48 89 df             	mov    rdi,rbx
    1feb:	e8 00 00 00 00       	call   1ff0 <CL_GlobalServers_f+0x120>
    1ff0:	80 38 00             	cmp    BYTE PTR [rax],0x0
    1ff3:	49 89 c4             	mov    r12,rax
    1ff6:	0f 84 f4 00 00 00    	je     20f0 <CL_GlobalServers_f+0x220>
    1ffc:	49 89 e6             	mov    r14,rsp
    1fff:	ba 07 00 00 00       	mov    edx,0x7
    2004:	48 89 c7             	mov    rdi,rax
    2007:	4c 89 f6             	mov    rsi,r14
    200a:	e8 00 00 00 00       	call   200f <CL_GlobalServers_f+0x13f>
    200f:	85 c0                	test   eax,eax
    2011:	0f 84 39 01 00 00    	je     2150 <CL_GlobalServers_f+0x280>
    2017:	83 f8 02             	cmp    eax,0x2
    201a:	0f 84 78 01 00 00    	je     2198 <CL_GlobalServers_f+0x2c8>
    2020:	4c 89 f7             	mov    rdi,r14
    2023:	e8 00 00 00 00       	call   2028 <CL_GlobalServers_f+0x158>
    2028:	4c 89 e6             	mov    rsi,r12
    202b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2032 <CL_GlobalServers_f+0x162>
    2032:	48 89 c2             	mov    rdx,rax
    2035:	31 c0                	xor    eax,eax
    2037:	e8 00 00 00 00       	call   203c <CL_GlobalServers_f+0x16c>
    203c:	8b 04 24             	mov    eax,DWORD PTR [rsp]
    203f:	c7 05 00 00 00 00 ff 	mov    DWORD PTR [rip+0x0],0xffffffff        # 2049 <CL_GlobalServers_f+0x179>
    2046:	ff ff ff 
    2049:	c7 05 00 00 00 00 02 	mov    DWORD PTR [rip+0x0],0x2        # 2053 <CL_GlobalServers_f+0x183>
    2050:	00 00 00 
    2053:	83 e8 05             	sub    eax,0x5
    2056:	83 f8 01             	cmp    eax,0x1
    2059:	0f 86 a9 00 00 00    	jbe    2108 <CL_GlobalServers_f+0x238>
    205f:	bf 02 00 00 00       	mov    edi,0x2
    2064:	e8 00 00 00 00       	call   2069 <CL_GlobalServers_f+0x199>
    2069:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 2070 <CL_GlobalServers_f+0x1a0>
    2070:	be 00 04 00 00       	mov    esi,0x400
    2075:	48 89 df             	mov    rdi,rbx
    2078:	48 89 c1             	mov    rcx,rax
    207b:	31 c0                	xor    eax,eax
    207d:	e8 00 00 00 00       	call   2082 <CL_GlobalServers_f+0x1b2>
    2082:	83 fd 03             	cmp    ebp,0x3
    2085:	74 42                	je     20c9 <CL_GlobalServers_f+0x1f9>
    2087:	41 bc 03 00 00 00    	mov    r12d,0x3
    208d:	4c 8d 2d 00 00 00 00 	lea    r13,[rip+0x0]        # 2094 <CL_GlobalServers_f+0x1c4>
    2094:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    2098:	4c 89 ea             	mov    rdx,r13
    209b:	be 00 04 00 00       	mov    esi,0x400
    20a0:	48 89 df             	mov    rdi,rbx
    20a3:	e8 00 00 00 00       	call   20a8 <CL_GlobalServers_f+0x1d8>
    20a8:	44 89 e7             	mov    edi,r12d
    20ab:	41 83 c4 01          	add    r12d,0x1
    20af:	e8 00 00 00 00       	call   20b4 <CL_GlobalServers_f+0x1e4>
    20b4:	be 00 04 00 00       	mov    esi,0x400
    20b9:	48 89 df             	mov    rdi,rbx
    20bc:	48 89 c2             	mov    rdx,rax
    20bf:	e8 00 00 00 00       	call   20c4 <CL_GlobalServers_f+0x1f4>
    20c4:	44 39 e5             	cmp    ebp,r12d
    20c7:	75 cf                	jne    2098 <CL_GlobalServers_f+0x1c8>
    20c9:	48 89 d9             	mov    rcx,rbx
    20cc:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 20d3 <CL_GlobalServers_f+0x203>
    20d3:	4c 89 f6             	mov    rsi,r14
    20d6:	31 c0                	xor    eax,eax
    20d8:	bf 01 00 00 00       	mov    edi,0x1
    20dd:	e8 00 00 00 00       	call   20e2 <CL_GlobalServers_f+0x212>
    20e2:	e9 35 fe ff ff       	jmp    1f1c <CL_GlobalServers_f+0x4c>
    20e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    20ee:	00 00 
    20f0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 20f7 <CL_GlobalServers_f+0x227>
    20f7:	31 c0                	xor    eax,eax
    20f9:	e8 00 00 00 00       	call   20fe <CL_GlobalServers_f+0x22e>
    20fe:	e9 19 fe ff ff       	jmp    1f1c <CL_GlobalServers_f+0x4c>
    2103:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2108:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 210f <CL_GlobalServers_f+0x23f>
    210f:	e8 00 00 00 00       	call   2114 <CL_GlobalServers_f+0x244>
    2114:	bf 02 00 00 00       	mov    edi,0x2
    2119:	a8 01                	test   al,0x1
    211b:	74 4b                	je     2168 <CL_GlobalServers_f+0x298>
    211d:	e8 00 00 00 00       	call   2122 <CL_GlobalServers_f+0x252>
    2122:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 2129 <CL_GlobalServers_f+0x259>
    2129:	be 00 04 00 00       	mov    esi,0x400
    212e:	48 89 df             	mov    rdi,rbx
    2131:	49 89 c0             	mov    r8,rax
    2134:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 213b <CL_GlobalServers_f+0x26b>
    213b:	31 c0                	xor    eax,eax
    213d:	e8 00 00 00 00       	call   2142 <CL_GlobalServers_f+0x272>
    2142:	e9 3b ff ff ff       	jmp    2082 <CL_GlobalServers_f+0x1b2>
    2147:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    214e:	00 00 
    2150:	4c 89 e6             	mov    rsi,r12
    2153:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 215a <CL_GlobalServers_f+0x28a>
    215a:	e8 00 00 00 00       	call   215f <CL_GlobalServers_f+0x28f>
    215f:	e9 b8 fd ff ff       	jmp    1f1c <CL_GlobalServers_f+0x4c>
    2164:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    2168:	e8 00 00 00 00       	call   216d <CL_GlobalServers_f+0x29d>
    216d:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 2174 <CL_GlobalServers_f+0x2a4>
    2174:	be 00 04 00 00       	mov    esi,0x400
    2179:	48 89 df             	mov    rdi,rbx
    217c:	49 89 c0             	mov    r8,rax
    217f:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 2186 <CL_GlobalServers_f+0x2b6>
    2186:	31 c0                	xor    eax,eax
    2188:	e8 00 00 00 00       	call   218d <CL_GlobalServers_f+0x2bd>
    218d:	e9 f0 fe ff ff       	jmp    2082 <CL_GlobalServers_f+0x1b2>
    2192:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    2198:	bf 2e 6d 00 00       	mov    edi,0x6d2e
    219d:	e8 00 00 00 00       	call   21a2 <CL_GlobalServers_f+0x2d2>
    21a2:	66 89 44 24 14       	mov    WORD PTR [rsp+0x14],ax
    21a7:	e9 74 fe ff ff       	jmp    2020 <CL_GlobalServers_f+0x150>
    21ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000021b0 <CL_DemoNameCallback_f>:
CL_DemoNameCallback_f():
    21b0:	83 fe 06             	cmp    esi,0x6
    21b3:	7f 0b                	jg     21c0 <CL_DemoNameCallback_f+0x10>
    21b5:	31 c0                	xor    eax,eax
    21b7:	c3                   	ret    
    21b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    21bf:	00 
    21c0:	55                   	push   rbp
    21c1:	ba 04 00 00 00       	mov    edx,0x4
    21c6:	48 89 fd             	mov    rbp,rdi
    21c9:	53                   	push   rbx
    21ca:	48 63 de             	movsxd rbx,esi
    21cd:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 21d4 <CL_DemoNameCallback_f+0x24>
    21d4:	48 8d 7c 1f fa       	lea    rdi,[rdi+rbx*1-0x6]
    21d9:	48 83 ec 08          	sub    rsp,0x8
    21dd:	e8 00 00 00 00       	call   21e2 <CL_DemoNameCallback_f+0x32>
    21e2:	85 c0                	test   eax,eax
    21e4:	75 2a                	jne    2210 <CL_DemoNameCallback_f+0x60>
    21e6:	48 8d 7c 1d fe       	lea    rdi,[rbp+rbx*1-0x2]
    21eb:	31 f6                	xor    esi,esi
    21ed:	ba 0a 00 00 00       	mov    edx,0xa
    21f2:	e8 00 00 00 00       	call   21f7 <CL_DemoNameCallback_f+0x47>
    21f7:	83 e8 42             	sub    eax,0x42
    21fa:	83 f8 05             	cmp    eax,0x5
    21fd:	0f 96 c0             	setbe  al
    2200:	48 83 c4 08          	add    rsp,0x8
    2204:	0f b6 c0             	movzx  eax,al
    2207:	5b                   	pop    rbx
    2208:	5d                   	pop    rbp
    2209:	c3                   	ret    
    220a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    2210:	48 83 c4 08          	add    rsp,0x8
    2214:	31 c0                	xor    eax,eax
    2216:	5b                   	pop    rbx
    2217:	5d                   	pop    rbp
    2218:	c3                   	ret    
    2219:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000002220 <CL_WalkDemoExt>:
CL_WalkDemoExt():
    2220:	41 57                	push   r15
    2222:	41 56                	push   r14
    2224:	41 55                	push   r13
    2226:	41 54                	push   r12
    2228:	55                   	push   rbp
    2229:	53                   	push   rbx
    222a:	48 83 ec 08          	sub    rsp,0x8
    222e:	8b 2d 00 00 00 00    	mov    ebp,DWORD PTR [rip+0x0]        # 2234 <CL_WalkDemoExt+0x14>
    2234:	c7 02 00 00 00 00    	mov    DWORD PTR [rdx],0x0
    223a:	85 ed                	test   ebp,ebp
    223c:	0f 84 8e 00 00 00    	je     22d0 <CL_WalkDemoExt+0xb0>
    2242:	49 89 d5             	mov    r13,rdx
    2245:	48 89 f3             	mov    rbx,rsi
    2248:	4c 8d 25 00 00 00 00 	lea    r12,[rip+0x0]        # 224f <CL_WalkDemoExt+0x2f>
    224f:	49 89 fe             	mov    r14,rdi
    2252:	4c 8d 3d 00 00 00 00 	lea    r15,[rip+0x0]        # 2259 <CL_WalkDemoExt+0x39>
    2259:	eb 20                	jmp    227b <CL_WalkDemoExt+0x5b>
    225b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2260:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2267 <CL_WalkDemoExt+0x47>
    2267:	31 c0                	xor    eax,eax
    2269:	49 83 c4 04          	add    r12,0x4
    226d:	e8 00 00 00 00       	call   2272 <CL_WalkDemoExt+0x52>
    2272:	41 8b 6c 24 fc       	mov    ebp,DWORD PTR [r12-0x4]
    2277:	85 ed                	test   ebp,ebp
    2279:	74 55                	je     22d0 <CL_WalkDemoExt+0xb0>
    227b:	41 89 e8             	mov    r8d,ebp
    227e:	4c 89 f1             	mov    rcx,r14
    2281:	4c 89 fa             	mov    rdx,r15
    2284:	be 00 10 00 00       	mov    esi,0x1000
    2289:	48 89 df             	mov    rdi,rbx
    228c:	31 c0                	xor    eax,eax
    228e:	e8 00 00 00 00       	call   2293 <CL_WalkDemoExt+0x73>
    2293:	e8 00 00 00 00       	call   2298 <CL_WalkDemoExt+0x78>
    2298:	4c 89 ee             	mov    rsi,r13
    229b:	ba 01 00 00 00       	mov    edx,0x1
    22a0:	48 89 df             	mov    rdi,rbx
    22a3:	e8 00 00 00 00       	call   22a8 <CL_WalkDemoExt+0x88>
    22a8:	e8 00 00 00 00       	call   22ad <CL_WalkDemoExt+0x8d>
    22ad:	41 8b 45 00          	mov    eax,DWORD PTR [r13+0x0]
    22b1:	48 89 de             	mov    rsi,rbx
    22b4:	85 c0                	test   eax,eax
    22b6:	74 a8                	je     2260 <CL_WalkDemoExt+0x40>
    22b8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 22bf <CL_WalkDemoExt+0x9f>
    22bf:	31 c0                	xor    eax,eax
    22c1:	e8 00 00 00 00       	call   22c6 <CL_WalkDemoExt+0xa6>
    22c6:	eb 0d                	jmp    22d5 <CL_WalkDemoExt+0xb5>
    22c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    22cf:	00 
    22d0:	bd ff ff ff ff       	mov    ebp,0xffffffff
    22d5:	48 83 c4 08          	add    rsp,0x8
    22d9:	89 e8                	mov    eax,ebp
    22db:	5b                   	pop    rbx
    22dc:	5d                   	pop    rbp
    22dd:	41 5c                	pop    r12
    22df:	41 5d                	pop    r13
    22e1:	41 5e                	pop    r14
    22e3:	41 5f                	pop    r15
    22e5:	c3                   	ret    
    22e6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    22ed:	00 00 00 

00000000000022f0 <CL_Record_f>:
CL_Record_f():
    22f0:	41 54                	push   r12
    22f2:	55                   	push   rbp
    22f3:	53                   	push   rbx
    22f4:	48 81 ec 40 20 00 00 	sub    rsp,0x2040
    22fb:	e8 00 00 00 00       	call   2300 <CL_Record_f+0x10>
    2300:	83 f8 02             	cmp    eax,0x2
    2303:	0f 8f 97 01 00 00    	jg     24a0 <CL_Record_f+0x1b0>
    2309:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 230f <CL_Record_f+0x1f>
    230f:	85 d2                	test   edx,edx
    2311:	0f 85 61 01 00 00    	jne    2478 <CL_Record_f+0x188>
    2317:	83 3d 00 00 00 00 08 	cmp    DWORD PTR [rip+0x0],0x8        # 231e <CL_Record_f+0x2e>
    231e:	74 20                	je     2340 <CL_Record_f+0x50>
    2320:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2327 <CL_Record_f+0x37>
    2327:	31 c0                	xor    eax,eax
    2329:	e8 00 00 00 00       	call   232e <CL_Record_f+0x3e>
    232e:	48 81 c4 40 20 00 00 	add    rsp,0x2040
    2335:	5b                   	pop    rbx
    2336:	5d                   	pop    rbp
    2337:	41 5c                	pop    r12
    2339:	c3                   	ret    
    233a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    2340:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2347 <CL_Record_f+0x57>
    2347:	e8 00 00 00 00       	call   234c <CL_Record_f+0x5c>
    234c:	85 c0                	test   eax,eax
    234e:	0f 85 cc 01 00 00    	jne    2520 <CL_Record_f+0x230>
    2354:	e8 00 00 00 00       	call   2359 <CL_Record_f+0x69>
    2359:	83 f8 02             	cmp    eax,0x2
    235c:	0f 84 5e 01 00 00    	je     24c0 <CL_Record_f+0x1d0>
    2362:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    2367:	48 8d 9c 24 40 10 00 	lea    rbx,[rsp+0x1040]
    236e:	00 
    236f:	e8 00 00 00 00       	call   2374 <CL_Record_f+0x84>
    2374:	8b 44 24 24          	mov    eax,DWORD PTR [rsp+0x24]
    2378:	48 83 ec 08          	sub    rsp,0x8
    237c:	48 89 df             	mov    rdi,rbx
    237f:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 2386 <CL_Record_f+0x96>
    2386:	be 00 10 00 00       	mov    esi,0x1000
    238b:	8d 88 6c 07 00 00    	lea    ecx,[rax+0x76c]
    2391:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
    2395:	50                   	push   rax
    2396:	8b 44 24 24          	mov    eax,DWORD PTR [rsp+0x24]
    239a:	50                   	push   rax
    239b:	8b 44 24 30          	mov    eax,DWORD PTR [rsp+0x30]
    239f:	50                   	push   rax
    23a0:	8b 44 24 40          	mov    eax,DWORD PTR [rsp+0x40]
    23a4:	44 8b 4c 24 3c       	mov    r9d,DWORD PTR [rsp+0x3c]
    23a9:	44 8d 40 01          	lea    r8d,[rax+0x1]
    23ad:	31 c0                	xor    eax,eax
    23af:	e8 00 00 00 00       	call   23b4 <CL_Record_f+0xc4>
    23b4:	48 83 c4 20          	add    rsp,0x20
    23b8:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 23c2 <CL_Record_f+0xd2>
    23bf:	00 00 00 
    23c2:	ba 00 10 00 00       	mov    edx,0x1000
    23c7:	48 89 de             	mov    rsi,rbx
    23ca:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 23d1 <CL_Record_f+0xe1>
    23d1:	e8 00 00 00 00       	call   23d6 <CL_Record_f+0xe6>
    23d6:	31 c0                	xor    eax,eax
    23d8:	48 89 de             	mov    rsi,rbx
    23db:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 23e2 <CL_Record_f+0xf2>
    23e2:	e8 00 00 00 00       	call   23e7 <CL_Record_f+0xf7>
    23e7:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 23ee <CL_Record_f+0xfe>
    23ee:	be 00 10 00 00       	mov    esi,0x1000
    23f3:	48 89 df             	mov    rdi,rbx
    23f6:	e8 00 00 00 00       	call   23fb <CL_Record_f+0x10b>
    23fb:	48 89 df             	mov    rdi,rbx
    23fe:	e8 00 00 00 00       	call   2403 <CL_Record_f+0x113>
    2403:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 2409 <CL_Record_f+0x119>
    2409:	85 c0                	test   eax,eax
    240b:	0f 84 37 01 00 00    	je     2548 <CL_Record_f+0x258>
    2411:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 2418 <CL_Record_f+0x128>
    2418:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 2422 <CL_Record_f+0x132>
    241f:	00 00 00 
    2422:	48 8d be 04 10 00 00 	lea    rdi,[rsi+0x1004]
    2429:	e8 00 00 00 00       	call   242e <CL_Record_f+0x13e>
    242e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2435 <CL_Record_f+0x145>
    2435:	e8 00 00 00 00       	call   243a <CL_Record_f+0x14a>
    243a:	bf 01 00 00 00       	mov    edi,0x1
    243f:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 2449 <CL_Record_f+0x159>
    2446:	00 00 00 
    2449:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 2453 <CL_Record_f+0x163>
    2450:	00 00 00 
    2453:	85 c0                	test   eax,eax
    2455:	0f 95 c0             	setne  al
    2458:	0f b6 c0             	movzx  eax,al
    245b:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 2461 <CL_Record_f+0x171>
    2461:	e8 ea de ff ff       	call   350 <CL_WriteGamestate>
    2466:	48 81 c4 40 20 00 00 	add    rsp,0x2040
    246d:	5b                   	pop    rbx
    246e:	5d                   	pop    rbp
    246f:	41 5c                	pop    r12
    2471:	c3                   	ret    
    2472:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    2478:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 247e <CL_Record_f+0x18e>
    247e:	85 c0                	test   eax,eax
    2480:	0f 85 a8 fe ff ff    	jne    232e <CL_Record_f+0x3e>
    2486:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 248d <CL_Record_f+0x19d>
    248d:	31 c0                	xor    eax,eax
    248f:	e8 00 00 00 00       	call   2494 <CL_Record_f+0x1a4>
    2494:	e9 95 fe ff ff       	jmp    232e <CL_Record_f+0x3e>
    2499:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    24a0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 24a7 <CL_Record_f+0x1b7>
    24a7:	31 c0                	xor    eax,eax
    24a9:	e8 00 00 00 00       	call   24ae <CL_Record_f+0x1be>
    24ae:	48 81 c4 40 20 00 00 	add    rsp,0x2040
    24b5:	5b                   	pop    rbx
    24b6:	5d                   	pop    rbp
    24b7:	41 5c                	pop    r12
    24b9:	c3                   	ret    
    24ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    24c0:	bf 01 00 00 00       	mov    edi,0x1
    24c5:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
    24ca:	e8 00 00 00 00       	call   24cf <CL_Record_f+0x1df>
    24cf:	ba 00 10 00 00       	mov    edx,0x1000
    24d4:	48 89 ef             	mov    rdi,rbp
    24d7:	48 89 c6             	mov    rsi,rax
    24da:	e8 00 00 00 00       	call   24df <CL_Record_f+0x1ef>
    24df:	48 89 ef             	mov    rdi,rbp
    24e2:	e8 00 00 00 00       	call   24e7 <CL_Record_f+0x1f7>
    24e7:	80 38 00             	cmp    BYTE PTR [rax],0x0
    24ea:	48 89 c3             	mov    rbx,rax
    24ed:	75 71                	jne    2560 <CL_Record_f+0x270>
    24ef:	48 8d 9c 24 40 10 00 	lea    rbx,[rsp+0x1040]
    24f6:	00 
    24f7:	48 89 e9             	mov    rcx,rbp
    24fa:	be 00 10 00 00       	mov    esi,0x1000
    24ff:	31 c0                	xor    eax,eax
    2501:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 2508 <CL_Record_f+0x218>
    2508:	48 89 df             	mov    rdi,rbx
    250b:	e8 00 00 00 00       	call   2510 <CL_Record_f+0x220>
    2510:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 251a <CL_Record_f+0x22a>
    2517:	00 00 00 
    251a:	e9 a3 fe ff ff       	jmp    23c2 <CL_Record_f+0xd2>
    251f:	90                   	nop
    2520:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2527 <CL_Record_f+0x237>
    2527:	e8 00 00 00 00       	call   252c <CL_Record_f+0x23c>
    252c:	85 c0                	test   eax,eax
    252e:	0f 85 20 fe ff ff    	jne    2354 <CL_Record_f+0x64>
    2534:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 253b <CL_Record_f+0x24b>
    253b:	e8 00 00 00 00       	call   2540 <CL_Record_f+0x250>
    2540:	e9 0f fe ff ff       	jmp    2354 <CL_Record_f+0x64>
    2545:	0f 1f 00             	nop    DWORD PTR [rax]
    2548:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 254f <CL_Record_f+0x25f>
    254f:	e8 00 00 00 00       	call   2554 <CL_Record_f+0x264>
    2554:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 255b <CL_Record_f+0x26b>
    255b:	e9 ce fd ff ff       	jmp    232e <CL_Record_f+0x3e>
    2560:	49 89 e4             	mov    r12,rsp
    2563:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 256a <CL_Record_f+0x27a>
    256a:	31 c0                	xor    eax,eax
    256c:	b9 44 00 00 00       	mov    ecx,0x44
    2571:	4c 89 e7             	mov    rdi,r12
    2574:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 257b <CL_Record_f+0x28b>
    257b:	e8 00 00 00 00       	call   2580 <CL_Record_f+0x290>
    2580:	4c 89 e6             	mov    rsi,r12
    2583:	48 89 df             	mov    rdi,rbx
    2586:	e8 00 00 00 00       	call   258b <CL_Record_f+0x29b>
    258b:	85 c0                	test   eax,eax
    258d:	75 15                	jne    25a4 <CL_Record_f+0x2b4>
    258f:	be 2e 00 00 00       	mov    esi,0x2e
    2594:	48 89 ef             	mov    rdi,rbp
    2597:	e8 00 00 00 00       	call   259c <CL_Record_f+0x2ac>
    259c:	c6 00 00             	mov    BYTE PTR [rax],0x0
    259f:	e9 4b ff ff ff       	jmp    24ef <CL_Record_f+0x1ff>
    25a4:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 25ab <CL_Record_f+0x2bb>
    25ab:	4c 89 e7             	mov    rdi,r12
    25ae:	31 c0                	xor    eax,eax
    25b0:	b9 47 00 00 00       	mov    ecx,0x47
    25b5:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 25bc <CL_Record_f+0x2cc>
    25bc:	e8 00 00 00 00       	call   25c1 <CL_Record_f+0x2d1>
    25c1:	4c 89 e6             	mov    rsi,r12
    25c4:	48 89 df             	mov    rdi,rbx
    25c7:	e8 00 00 00 00       	call   25cc <CL_Record_f+0x2dc>
    25cc:	85 c0                	test   eax,eax
    25ce:	0f 85 1b ff ff ff    	jne    24ef <CL_Record_f+0x1ff>
    25d4:	eb b9                	jmp    258f <CL_Record_f+0x29f>
    25d6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    25dd:	00 00 00 

00000000000025e0 <CL_Configstrings_f>:
CL_Configstrings_f():
    25e0:	83 3d 00 00 00 00 08 	cmp    DWORD PTR [rip+0x0],0x8        # 25e7 <CL_Configstrings_f+0x7>
    25e7:	75 45                	jne    262e <CL_Configstrings_f+0x4e>
    25e9:	41 54                	push   r12
    25eb:	55                   	push   rbp
    25ec:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 25f3 <CL_Configstrings_f+0x13>
    25f3:	53                   	push   rbx
    25f4:	4c 8d a5 00 10 00 00 	lea    r12,[rbp+0x1000]
    25fb:	31 db                	xor    ebx,ebx
    25fd:	0f 1f 00             	nop    DWORD PTR [rax]
    2600:	48 63 54 9d 00       	movsxd rdx,DWORD PTR [rbp+rbx*4+0x0]
    2605:	85 d2                	test   edx,edx
    2607:	74 13                	je     261c <CL_Configstrings_f+0x3c>
    2609:	4c 01 e2             	add    rdx,r12
    260c:	89 de                	mov    esi,ebx
    260e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2615 <CL_Configstrings_f+0x35>
    2615:	31 c0                	xor    eax,eax
    2617:	e8 00 00 00 00       	call   261c <CL_Configstrings_f+0x3c>
    261c:	48 83 c3 01          	add    rbx,0x1
    2620:	48 81 fb 00 04 00 00 	cmp    rbx,0x400
    2627:	75 d7                	jne    2600 <CL_Configstrings_f+0x20>
    2629:	5b                   	pop    rbx
    262a:	5d                   	pop    rbp
    262b:	41 5c                	pop    r12
    262d:	c3                   	ret    
    262e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2635 <CL_Configstrings_f+0x55>
    2635:	31 c0                	xor    eax,eax
    2637:	e9 00 00 00 00       	jmp    263c <CL_Configstrings_f+0x5c>
    263c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000002640 <CL_Reconnect_f>:
CL_Reconnect_f():
    2640:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 2647 <CL_Reconnect_f+0x7>
    2647:	48 8b 78 08          	mov    rdi,QWORD PTR [rax+0x8]
    264b:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
    264e:	75 08                	jne    2658 <CL_Reconnect_f+0x18>
    2650:	c3                   	ret    
    2651:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    2658:	48 83 ec 08          	sub    rsp,0x8
    265c:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 2663 <CL_Reconnect_f+0x23>
    2663:	e8 00 00 00 00       	call   2668 <CL_Reconnect_f+0x28>
    2668:	85 c0                	test   eax,eax
    266a:	74 3c                	je     26a8 <CL_Reconnect_f+0x68>
    266c:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 2673 <CL_Reconnect_f+0x33>
    2673:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 267a <CL_Reconnect_f+0x3a>
    267a:	e8 00 00 00 00       	call   267f <CL_Reconnect_f+0x3f>
    267f:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 2686 <CL_Reconnect_f+0x46>
    2686:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 268d <CL_Reconnect_f+0x4d>
    268d:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
    2691:	31 c0                	xor    eax,eax
    2693:	e8 00 00 00 00       	call   2698 <CL_Reconnect_f+0x58>
    2698:	48 83 c4 08          	add    rsp,0x8
    269c:	48 89 c7             	mov    rdi,rax
    269f:	e9 00 00 00 00       	jmp    26a4 <CL_Reconnect_f+0x64>
    26a4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    26a8:	48 83 c4 08          	add    rsp,0x8
    26ac:	c3                   	ret    
    26ad:	0f 1f 00             	nop    DWORD PTR [rax]

00000000000026b0 <CL_SetModel_f>:
CL_SetModel_f():
    26b0:	53                   	push   rbx
    26b1:	bf 01 00 00 00       	mov    edi,0x1
    26b6:	48 81 ec 00 01 00 00 	sub    rsp,0x100
    26bd:	e8 00 00 00 00       	call   26c2 <CL_SetModel_f+0x12>
    26c2:	80 38 00             	cmp    BYTE PTR [rax],0x0
    26c5:	74 31                	je     26f8 <CL_SetModel_f+0x48>
    26c7:	48 89 c3             	mov    rbx,rax
    26ca:	48 89 c6             	mov    rsi,rax
    26cd:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 26d4 <CL_SetModel_f+0x24>
    26d4:	e8 00 00 00 00       	call   26d9 <CL_SetModel_f+0x29>
    26d9:	48 89 de             	mov    rsi,rbx
    26dc:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 26e3 <CL_SetModel_f+0x33>
    26e3:	e8 00 00 00 00       	call   26e8 <CL_SetModel_f+0x38>
    26e8:	48 81 c4 00 01 00 00 	add    rsp,0x100
    26ef:	5b                   	pop    rbx
    26f0:	c3                   	ret    
    26f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    26f8:	48 89 e3             	mov    rbx,rsp
    26fb:	ba 00 01 00 00       	mov    edx,0x100
    2700:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2707 <CL_SetModel_f+0x57>
    2707:	48 89 de             	mov    rsi,rbx
    270a:	e8 00 00 00 00       	call   270f <CL_SetModel_f+0x5f>
    270f:	48 89 de             	mov    rsi,rbx
    2712:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2719 <CL_SetModel_f+0x69>
    2719:	31 c0                	xor    eax,eax
    271b:	e8 00 00 00 00       	call   2720 <CL_SetModel_f+0x70>
    2720:	48 81 c4 00 01 00 00 	add    rsp,0x100
    2727:	5b                   	pop    rbx
    2728:	c3                   	ret    
    2729:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000002730 <CL_CompleteCallvote.part.5>:
CL_CompleteCallvote.part.5():
    2730:	53                   	push   rbx
    2731:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 2738 <CL_CompleteCallvote.part.5+0x8>
    2738:	be 01 00 00 00       	mov    esi,0x1
    273d:	48 89 fb             	mov    rbx,rdi
    2740:	e8 00 00 00 00       	call   2745 <CL_CompleteCallvote.part.5+0x15>
    2745:	48 39 c3             	cmp    rbx,rax
    2748:	72 06                	jb     2750 <CL_CompleteCallvote.part.5+0x20>
    274a:	5b                   	pop    rbx
    274b:	c3                   	ret    
    274c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    2750:	ba 01 00 00 00       	mov    edx,0x1
    2755:	be 01 00 00 00       	mov    esi,0x1
    275a:	48 89 c7             	mov    rdi,rax
    275d:	5b                   	pop    rbx
    275e:	e9 00 00 00 00       	jmp    2763 <CL_CompleteCallvote.part.5+0x33>
    2763:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    276a:	00 00 00 00 
    276e:	66 90                	xchg   ax,ax

0000000000002770 <CL_CompleteCallvote>:
CL_CompleteCallvote():
    2770:	83 fe 01             	cmp    esi,0x1
    2773:	7f 0b                	jg     2780 <CL_CompleteCallvote+0x10>
    2775:	c3                   	ret    
    2776:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    277d:	00 00 00 
    2780:	eb ae                	jmp    2730 <CL_CompleteCallvote.part.5>
    2782:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    2789:	00 00 00 00 
    278d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000002790 <CL_CompleteRcon>:
CL_CompleteRcon():
    2790:	83 fe 01             	cmp    esi,0x1
    2793:	7f 0b                	jg     27a0 <CL_CompleteRcon+0x10>
    2795:	c3                   	ret    
    2796:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    279d:	00 00 00 
    27a0:	eb 8e                	jmp    2730 <CL_CompleteCallvote.part.5>
    27a2:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    27a9:	00 00 00 00 
    27ad:	0f 1f 00             	nop    DWORD PTR [rax]

00000000000027b0 <CL_SetServerInfoByAddress>:
CL_SetServerInfoByAddress():
    27b0:	41 56                	push   r14
    27b2:	41 55                	push   r13
    27b4:	41 89 d5             	mov    r13d,edx
    27b7:	41 54                	push   r12
    27b9:	49 89 f4             	mov    r12,rsi
    27bc:	55                   	push   rbp
    27bd:	48 89 fd             	mov    rbp,rdi
    27c0:	53                   	push   rbx
    27c1:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 27c8 <CL_SetServerInfoByAddress+0x18>
    27c8:	4c 8d b3 00 58 00 00 	lea    r14,[rbx+0x5800]
    27cf:	eb 13                	jmp    27e4 <CL_SetServerInfoByAddress+0x34>
    27d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    27d8:	48 81 c3 b0 00 00 00 	add    rbx,0xb0
    27df:	4c 39 f3             	cmp    rbx,r14
    27e2:	74 29                	je     280d <CL_SetServerInfoByAddress+0x5d>
    27e4:	48 89 de             	mov    rsi,rbx
    27e7:	48 89 ef             	mov    rdi,rbp
    27ea:	e8 00 00 00 00       	call   27ef <CL_SetServerInfoByAddress+0x3f>
    27ef:	85 c0                	test   eax,eax
    27f1:	74 e5                	je     27d8 <CL_SetServerInfoByAddress+0x28>
    27f3:	48 89 df             	mov    rdi,rbx
    27f6:	44 89 ea             	mov    edx,r13d
    27f9:	4c 89 e6             	mov    rsi,r12
    27fc:	48 81 c3 b0 00 00 00 	add    rbx,0xb0
    2803:	e8 d8 e2 ff ff       	call   ae0 <CL_SetServerInfo>
    2808:	4c 39 f3             	cmp    rbx,r14
    280b:	75 d7                	jne    27e4 <CL_SetServerInfoByAddress+0x34>
    280d:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 2814 <CL_SetServerInfoByAddress+0x64>
    2814:	4c 8d b3 00 00 0b 00 	lea    r14,[rbx+0xb0000]
    281b:	eb 0f                	jmp    282c <CL_SetServerInfoByAddress+0x7c>
    281d:	0f 1f 00             	nop    DWORD PTR [rax]
    2820:	48 81 c3 b0 00 00 00 	add    rbx,0xb0
    2827:	49 39 de             	cmp    r14,rbx
    282a:	74 29                	je     2855 <CL_SetServerInfoByAddress+0xa5>
    282c:	48 89 de             	mov    rsi,rbx
    282f:	48 89 ef             	mov    rdi,rbp
    2832:	e8 00 00 00 00       	call   2837 <CL_SetServerInfoByAddress+0x87>
    2837:	85 c0                	test   eax,eax
    2839:	74 e5                	je     2820 <CL_SetServerInfoByAddress+0x70>
    283b:	48 89 df             	mov    rdi,rbx
    283e:	44 89 ea             	mov    edx,r13d
    2841:	4c 89 e6             	mov    rsi,r12
    2844:	48 81 c3 b0 00 00 00 	add    rbx,0xb0
    284b:	e8 90 e2 ff ff       	call   ae0 <CL_SetServerInfo>
    2850:	49 39 de             	cmp    r14,rbx
    2853:	75 d7                	jne    282c <CL_SetServerInfoByAddress+0x7c>
    2855:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 285c <CL_SetServerInfoByAddress+0xac>
    285c:	4c 8d b3 00 58 00 00 	lea    r14,[rbx+0x5800]
    2863:	eb 0f                	jmp    2874 <CL_SetServerInfoByAddress+0xc4>
    2865:	0f 1f 00             	nop    DWORD PTR [rax]
    2868:	48 81 c3 b0 00 00 00 	add    rbx,0xb0
    286f:	4c 39 f3             	cmp    rbx,r14
    2872:	74 29                	je     289d <CL_SetServerInfoByAddress+0xed>
    2874:	48 89 de             	mov    rsi,rbx
    2877:	48 89 ef             	mov    rdi,rbp
    287a:	e8 00 00 00 00       	call   287f <CL_SetServerInfoByAddress+0xcf>
    287f:	85 c0                	test   eax,eax
    2881:	74 e5                	je     2868 <CL_SetServerInfoByAddress+0xb8>
    2883:	48 89 df             	mov    rdi,rbx
    2886:	44 89 ea             	mov    edx,r13d
    2889:	4c 89 e6             	mov    rsi,r12
    288c:	48 81 c3 b0 00 00 00 	add    rbx,0xb0
    2893:	e8 48 e2 ff ff       	call   ae0 <CL_SetServerInfo>
    2898:	4c 39 f3             	cmp    rbx,r14
    289b:	75 d7                	jne    2874 <CL_SetServerInfoByAddress+0xc4>
    289d:	5b                   	pop    rbx
    289e:	5d                   	pop    rbp
    289f:	41 5c                	pop    r12
    28a1:	41 5d                	pop    r13
    28a3:	41 5e                	pop    r14
    28a5:	c3                   	ret    
    28a6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    28ad:	00 00 00 

00000000000028b0 <CL_ServerInfoPacket>:
CL_ServerInfoPacket():
    28b0:	41 57                	push   r15
    28b2:	41 56                	push   r14
    28b4:	41 55                	push   r13
    28b6:	41 54                	push   r12
    28b8:	55                   	push   rbp
    28b9:	53                   	push   rbx
    28ba:	48 89 fb             	mov    rbx,rdi
    28bd:	48 89 f7             	mov    rdi,rsi
    28c0:	48 81 ec 18 04 00 00 	sub    rsp,0x418
    28c7:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
    28cc:	e8 00 00 00 00       	call   28d1 <CL_ServerInfoPacket+0x21>
    28d1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 28d8 <CL_ServerInfoPacket+0x28>
    28d8:	48 89 c7             	mov    rdi,rax
    28db:	48 89 04 24          	mov    QWORD PTR [rsp],rax
    28df:	e8 00 00 00 00       	call   28e4 <CL_ServerInfoPacket+0x34>
    28e4:	31 f6                	xor    esi,esi
    28e6:	ba 0a 00 00 00       	mov    edx,0xa
    28eb:	48 89 c7             	mov    rdi,rax
    28ee:	e8 00 00 00 00       	call   28f3 <CL_ServerInfoPacket+0x43>
    28f3:	83 f8 44             	cmp    eax,0x44
    28f6:	74 09                	je     2901 <CL_ServerInfoPacket+0x51>
    28f8:	83 f8 47             	cmp    eax,0x47
    28fb:	0f 85 93 02 00 00    	jne    2b94 <CL_ServerInfoPacket+0x2e4>
    2901:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 2908 <CL_ServerInfoPacket+0x58>
    2908:	45 31 f6             	xor    r14d,r14d
    290b:	49 89 ed             	mov    r13,rbp
    290e:	eb 15                	jmp    2925 <CL_ServerInfoPacket+0x75>
    2910:	41 83 c6 01          	add    r14d,0x1
    2914:	49 81 c5 28 04 00 00 	add    r13,0x428
    291b:	41 83 fe 20          	cmp    r14d,0x20
    291f:	0f 84 fb 00 00 00    	je     2a20 <CL_ServerInfoPacket+0x170>
    2925:	66 41 83 7d 14 00    	cmp    WORD PTR [r13+0x14],0x0
    292b:	74 e3                	je     2910 <CL_ServerInfoPacket+0x60>
    292d:	45 8b 7d 24          	mov    r15d,DWORD PTR [r13+0x24]
    2931:	45 85 ff             	test   r15d,r15d
    2934:	75 da                	jne    2910 <CL_ServerInfoPacket+0x60>
    2936:	4d 89 ec             	mov    r12,r13
    2939:	4c 89 ee             	mov    rsi,r13
    293c:	48 89 df             	mov    rdi,rbx
    293f:	49 29 ec             	sub    r12,rbp
    2942:	e8 00 00 00 00       	call   2947 <CL_ServerInfoPacket+0x97>
    2947:	85 c0                	test   eax,eax
    2949:	74 c5                	je     2910 <CL_ServerInfoPacket+0x60>
    294b:	e8 00 00 00 00       	call   2950 <CL_ServerInfoPacket+0xa0>
    2950:	49 63 ee             	movsxd rbp,r14d
    2953:	ba 01 00 00 00       	mov    edx,0x1
    2958:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 295f <CL_ServerInfoPacket+0xaf>
    295f:	4c 69 f5 28 04 00 00 	imul   r14,rbp,0x428
    2966:	49 01 ce             	add    r14,rcx
    2969:	41 2b 46 20          	sub    eax,DWORD PTR [r14+0x20]
    296d:	85 c0                	test   eax,eax
    296f:	0f 4e c2             	cmovle eax,edx
    2972:	41 89 46 24          	mov    DWORD PTR [r14+0x24],eax
    2976:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 297d <CL_ServerInfoPacket+0xcd>
    297d:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    2980:	85 c0                	test   eax,eax
    2982:	0f 85 2e 02 00 00    	jne    2bb6 <CL_ServerInfoPacket+0x306>
    2988:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 298f <CL_ServerInfoPacket+0xdf>
    298f:	48 8b 34 24          	mov    rsi,QWORD PTR [rsp]
    2993:	ba 00 04 00 00       	mov    edx,0x400
    2998:	4e 8d 64 20 28       	lea    r12,[rax+r12*1+0x28]
    299d:	4c 89 e7             	mov    rdi,r12
    29a0:	e8 00 00 00 00       	call   29a5 <CL_ServerInfoPacket+0xf5>
    29a5:	8b 03                	mov    eax,DWORD PTR [rbx]
    29a7:	83 f8 03             	cmp    eax,0x3
    29aa:	72 15                	jb     29c1 <CL_ServerInfoPacket+0x111>
    29ac:	83 f8 04             	cmp    eax,0x4
    29af:	0f 86 f6 01 00 00    	jbe    2bab <CL_ServerInfoPacket+0x2fb>
    29b5:	83 f8 05             	cmp    eax,0x5
    29b8:	b8 02 00 00 00       	mov    eax,0x2
    29bd:	44 0f 44 f8          	cmove  r15d,eax
    29c1:	44 89 fe             	mov    esi,r15d
    29c4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 29cb <CL_ServerInfoPacket+0x11b>
    29cb:	31 c0                	xor    eax,eax
    29cd:	e8 00 00 00 00       	call   29d2 <CL_ServerInfoPacket+0x122>
    29d2:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 29d9 <CL_ServerInfoPacket+0x129>
    29d9:	be 00 04 00 00       	mov    esi,0x400
    29de:	4c 89 e7             	mov    rdi,r12
    29e1:	48 89 c1             	mov    rcx,rax
    29e4:	e8 00 00 00 00       	call   29e9 <CL_ServerInfoPacket+0x139>
    29e9:	48 69 cd 28 04 00 00 	imul   rcx,rbp,0x428
    29f0:	48 8b 34 24          	mov    rsi,QWORD PTR [rsp]
    29f4:	48 89 df             	mov    rdi,rbx
    29f7:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 29fe <CL_ServerInfoPacket+0x14e>
    29fe:	8b 54 08 24          	mov    edx,DWORD PTR [rax+rcx*1+0x24]
    2a02:	e8 a9 fd ff ff       	call   27b0 <CL_SetServerInfoByAddress>
    2a07:	48 81 c4 18 04 00 00 	add    rsp,0x418
    2a0e:	5b                   	pop    rbx
    2a0f:	5d                   	pop    rbp
    2a10:	41 5c                	pop    r12
    2a12:	41 5d                	pop    r13
    2a14:	41 5e                	pop    r14
    2a16:	41 5f                	pop    r15
    2a18:	c3                   	ret    
    2a19:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    2a20:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # 2a27 <CL_ServerInfoPacket+0x177>
    2a27:	45 85 e4             	test   r12d,r12d
    2a2a:	75 db                	jne    2a07 <CL_ServerInfoPacket+0x157>
    2a2c:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 2a33 <CL_ServerInfoPacket+0x183>
    2a33:	eb 2a                	jmp    2a5f <CL_ServerInfoPacket+0x1af>
    2a35:	0f 1f 00             	nop    DWORD PTR [rax]
    2a38:	48 89 ee             	mov    rsi,rbp
    2a3b:	48 89 df             	mov    rdi,rbx
    2a3e:	e8 00 00 00 00       	call   2a43 <CL_ServerInfoPacket+0x193>
    2a43:	85 c0                	test   eax,eax
    2a45:	75 c0                	jne    2a07 <CL_ServerInfoPacket+0x157>
    2a47:	41 83 c4 01          	add    r12d,0x1
    2a4b:	48 81 c5 b0 00 00 00 	add    rbp,0xb0
    2a52:	41 81 fc 80 00 00 00 	cmp    r12d,0x80
    2a59:	0f 84 79 01 00 00    	je     2bd8 <CL_ServerInfoPacket+0x328>
    2a5f:	66 83 7d 14 00       	cmp    WORD PTR [rbp+0x14],0x0
    2a64:	75 d2                	jne    2a38 <CL_ServerInfoPacket+0x188>
    2a66:	41 8d 44 24 01       	lea    eax,[r12+0x1]
    2a6b:	4d 63 e4             	movsxd r12,r12d
    2a6e:	f3 0f 6f 03          	movdqu xmm0,XMMWORD PTR [rbx]
    2a72:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 2a79 <CL_ServerInfoPacket+0x1c9>
    2a79:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 2a7f <CL_ServerInfoPacket+0x1cf>
    2a7f:	4b 8d 04 a4          	lea    rax,[r12+r12*4]
    2a83:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    2a88:	48 8d 91 30 10 00 00 	lea    rdx,[rcx+0x1030]
    2a8f:	49 8d 04 44          	lea    rax,[r12+rax*2]
    2a93:	48 8d b1 c0 10 00 00 	lea    rsi,[rcx+0x10c0]
    2a9a:	48 c1 e0 04          	shl    rax,0x4
    2a9e:	48 8d 6c 24 10       	lea    rbp,[rsp+0x10]
    2aa3:	48 01 c2             	add    rdx,rax
    2aa6:	0f 11 42 08          	movups XMMWORD PTR [rdx+0x8],xmm0
    2aaa:	f3 0f 6f 4b 10       	movdqu xmm1,XMMWORD PTR [rbx+0x10]
    2aaf:	0f 11 4a 18          	movups XMMWORD PTR [rdx+0x18],xmm1
    2ab3:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    2ab7:	c6 82 58 10 00 00 00 	mov    BYTE PTR [rdx+0x1058],0x0
    2abe:	c6 82 78 10 00 00 00 	mov    BYTE PTR [rdx+0x1078],0x0
    2ac5:	48 c7 84 08 c8 10 00 	mov    QWORD PTR [rax+rcx*1+0x10c8],0x0
    2acc:	00 00 00 00 00 
    2ad1:	48 8d 8c 01 b0 10 00 	lea    rcx,[rcx+rax*1+0x10b0]
    2ad8:	00 
    2ad9:	c7 82 d0 10 00 00 ff 	mov    DWORD PTR [rdx+0x10d0],0xffffffff
    2ae0:	ff ff ff 
    2ae3:	c6 82 98 10 00 00 00 	mov    BYTE PTR [rdx+0x1098],0x0
    2aea:	48 c7 41 08 00 00 00 	mov    QWORD PTR [rcx+0x8],0x0
    2af1:	00 
    2af2:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
    2af9:	00 
    2afa:	48 c7 44 30 18 00 00 	mov    QWORD PTR [rax+rsi*1+0x18],0x0
    2b01:	00 00 
    2b03:	c7 82 e0 10 00 00 00 	mov    DWORD PTR [rdx+0x10e0],0x0
    2b0a:	00 00 00 
    2b0d:	e8 00 00 00 00       	call   2b12 <CL_ServerInfoPacket+0x262>
    2b12:	ba 00 04 00 00       	mov    edx,0x400
    2b17:	48 89 ef             	mov    rdi,rbp
    2b1a:	48 89 c6             	mov    rsi,rax
    2b1d:	e8 00 00 00 00       	call   2b22 <CL_ServerInfoPacket+0x272>
    2b22:	48 89 ea             	mov    rdx,rbp
    2b25:	8b 0a                	mov    ecx,DWORD PTR [rdx]
    2b27:	48 83 c2 04          	add    rdx,0x4
    2b2b:	8d 81 ff fe fe fe    	lea    eax,[rcx-0x1010101]
    2b31:	f7 d1                	not    ecx
    2b33:	21 c8                	and    eax,ecx
    2b35:	25 80 80 80 80       	and    eax,0x80808080
    2b3a:	74 e9                	je     2b25 <CL_ServerInfoPacket+0x275>
    2b3c:	89 c1                	mov    ecx,eax
    2b3e:	c1 e9 10             	shr    ecx,0x10
    2b41:	a9 80 80 00 00       	test   eax,0x8080
    2b46:	0f 44 c1             	cmove  eax,ecx
    2b49:	48 8d 4a 02          	lea    rcx,[rdx+0x2]
    2b4d:	48 0f 44 d1          	cmove  rdx,rcx
    2b51:	89 c1                	mov    ecx,eax
    2b53:	00 c1                	add    cl,al
    2b55:	48 83 da 03          	sbb    rdx,0x3
    2b59:	48 29 ea             	sub    rdx,rbp
    2b5c:	0f 84 a5 fe ff ff    	je     2a07 <CL_ServerInfoPacket+0x157>
    2b62:	8d 42 ff             	lea    eax,[rdx-0x1]
    2b65:	48 98                	cdqe   
    2b67:	80 7c 04 10 0a       	cmp    BYTE PTR [rsp+rax*1+0x10],0xa
    2b6c:	75 05                	jne    2b73 <CL_ServerInfoPacket+0x2c3>
    2b6e:	c6 44 04 10 00       	mov    BYTE PTR [rsp+rax*1+0x10],0x0
    2b73:	48 89 df             	mov    rdi,rbx
    2b76:	e8 00 00 00 00       	call   2b7b <CL_ServerInfoPacket+0x2cb>
    2b7b:	48 89 ea             	mov    rdx,rbp
    2b7e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2b85 <CL_ServerInfoPacket+0x2d5>
    2b85:	48 89 c6             	mov    rsi,rax
    2b88:	31 c0                	xor    eax,eax
    2b8a:	e8 00 00 00 00       	call   2b8f <CL_ServerInfoPacket+0x2df>
    2b8f:	e9 73 fe ff ff       	jmp    2a07 <CL_ServerInfoPacket+0x157>
    2b94:	48 8b 34 24          	mov    rsi,QWORD PTR [rsp]
    2b98:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2b9f <CL_ServerInfoPacket+0x2ef>
    2b9f:	31 c0                	xor    eax,eax
    2ba1:	e8 00 00 00 00       	call   2ba6 <CL_ServerInfoPacket+0x2f6>
    2ba6:	e9 5c fe ff ff       	jmp    2a07 <CL_ServerInfoPacket+0x157>
    2bab:	41 bf 01 00 00 00    	mov    r15d,0x1
    2bb1:	e9 0b fe ff ff       	jmp    29c1 <CL_ServerInfoPacket+0x111>
    2bb6:	48 89 df             	mov    rdi,rbx
    2bb9:	e8 00 00 00 00       	call   2bbe <CL_ServerInfoPacket+0x30e>
    2bbe:	41 8b 76 24          	mov    esi,DWORD PTR [r14+0x24]
    2bc2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2bc9 <CL_ServerInfoPacket+0x319>
    2bc9:	48 89 c2             	mov    rdx,rax
    2bcc:	31 c0                	xor    eax,eax
    2bce:	e8 00 00 00 00       	call   2bd3 <CL_ServerInfoPacket+0x323>
    2bd3:	e9 b0 fd ff ff       	jmp    2988 <CL_ServerInfoPacket+0xd8>
    2bd8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2bdf <CL_ServerInfoPacket+0x32f>
    2bdf:	31 c0                	xor    eax,eax
    2be1:	e8 00 00 00 00       	call   2be6 <CL_ServerInfoPacket+0x336>
    2be6:	e9 1c fe ff ff       	jmp    2a07 <CL_ServerInfoPacket+0x157>
    2beb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000002bf0 <CL_Ping_f>:
CL_Ping_f():
    2bf0:	55                   	push   rbp
    2bf1:	53                   	push   rbx
    2bf2:	48 83 ec 28          	sub    rsp,0x28
    2bf6:	e8 00 00 00 00       	call   2bfb <CL_Ping_f+0xb>
    2bfb:	8d 50 fe             	lea    edx,[rax-0x2]
    2bfe:	83 fa 01             	cmp    edx,0x1
    2c01:	0f 87 f9 00 00 00    	ja     2d00 <CL_Ping_f+0x110>
    2c07:	bf 01 00 00 00       	mov    edi,0x1
    2c0c:	83 f8 02             	cmp    eax,0x2
    2c0f:	0f 84 db 00 00 00    	je     2cf0 <CL_Ping_f+0x100>
    2c15:	e8 00 00 00 00       	call   2c1a <CL_Ping_f+0x2a>
    2c1a:	b9 03 00 00 00       	mov    ecx,0x3
    2c1f:	bb 04 00 00 00       	mov    ebx,0x4
    2c24:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2c2b <CL_Ping_f+0x3b>
    2c2b:	48 89 c6             	mov    rsi,rax
    2c2e:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    2c30:	0f 97 c0             	seta   al
    2c33:	1c 00                	sbb    al,0x0
    2c35:	84 c0                	test   al,al
    2c37:	0f 85 03 01 00 00    	jne    2d40 <CL_Ping_f+0x150>
    2c3d:	bf 02 00 00 00       	mov    edi,0x2
    2c42:	e8 00 00 00 00       	call   2c47 <CL_Ping_f+0x57>
    2c47:	48 89 e5             	mov    rbp,rsp
    2c4a:	66 0f ef c0          	pxor   xmm0,xmm0
    2c4e:	89 da                	mov    edx,ebx
    2c50:	48 89 c7             	mov    rdi,rax
    2c53:	48 89 ee             	mov    rsi,rbp
    2c56:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
    2c5a:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
    2c5f:	e8 00 00 00 00       	call   2c64 <CL_Ping_f+0x74>
    2c64:	85 c0                	test   eax,eax
    2c66:	74 7f                	je     2ce7 <CL_Ping_f+0xf7>
    2c68:	e8 00 00 00 00       	call   2c6d <CL_Ping_f+0x7d>
    2c6d:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 2c74 <CL_Ping_f+0x84>
    2c74:	66 83 3d 00 00 00 00 	cmp    WORD PTR [rip+0x0],0x0        # 2c7c <CL_Ping_f+0x8c>
    2c7b:	00 
    2c7c:	48 8d b3 00 85 00 00 	lea    rsi,[rbx+0x8500]
    2c83:	74 1c                	je     2ca1 <CL_Ping_f+0xb1>
    2c85:	8b 53 24             	mov    edx,DWORD PTR [rbx+0x24]
    2c88:	85 d2                	test   edx,edx
    2c8a:	0f 85 88 00 00 00    	jne    2d18 <CL_Ping_f+0x128>
    2c90:	89 c2                	mov    edx,eax
    2c92:	2b 53 20             	sub    edx,DWORD PTR [rbx+0x20]
    2c95:	81 fa f3 01 00 00    	cmp    edx,0x1f3
    2c9b:	0f 8e 83 00 00 00    	jle    2d24 <CL_Ping_f+0x134>
    2ca1:	31 c0                	xor    eax,eax
    2ca3:	66 89 43 14          	mov    WORD PTR [rbx+0x14],ax
    2ca7:	66 0f 6f 0c 24       	movdqa xmm1,XMMWORD PTR [rsp]
    2cac:	66 0f 6f 54 24 10    	movdqa xmm2,XMMWORD PTR [rsp+0x10]
    2cb2:	0f 11 0b             	movups XMMWORD PTR [rbx],xmm1
    2cb5:	0f 11 53 10          	movups XMMWORD PTR [rbx+0x10],xmm2
    2cb9:	e8 00 00 00 00       	call   2cbe <CL_Ping_f+0xce>
    2cbe:	c7 43 24 00 00 00 00 	mov    DWORD PTR [rbx+0x24],0x0
    2cc5:	31 d2                	xor    edx,edx
    2cc7:	31 f6                	xor    esi,esi
    2cc9:	89 43 20             	mov    DWORD PTR [rbx+0x20],eax
    2ccc:	48 89 df             	mov    rdi,rbx
    2ccf:	e8 dc fa ff ff       	call   27b0 <CL_SetServerInfoByAddress>
    2cd4:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 2cdb <CL_Ping_f+0xeb>
    2cdb:	31 ff                	xor    edi,edi
    2cdd:	31 c0                	xor    eax,eax
    2cdf:	48 89 ee             	mov    rsi,rbp
    2ce2:	e8 00 00 00 00       	call   2ce7 <CL_Ping_f+0xf7>
    2ce7:	48 83 c4 28          	add    rsp,0x28
    2ceb:	5b                   	pop    rbx
    2cec:	5d                   	pop    rbp
    2ced:	c3                   	ret    
    2cee:	66 90                	xchg   ax,ax
    2cf0:	e8 00 00 00 00       	call   2cf5 <CL_Ping_f+0x105>
    2cf5:	bb 07 00 00 00       	mov    ebx,0x7
    2cfa:	e9 48 ff ff ff       	jmp    2c47 <CL_Ping_f+0x57>
    2cff:	90                   	nop
    2d00:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2d07 <CL_Ping_f+0x117>
    2d07:	31 c0                	xor    eax,eax
    2d09:	e8 00 00 00 00       	call   2d0e <CL_Ping_f+0x11e>
    2d0e:	48 83 c4 28          	add    rsp,0x28
    2d12:	5b                   	pop    rbx
    2d13:	5d                   	pop    rbp
    2d14:	c3                   	ret    
    2d15:	0f 1f 00             	nop    DWORD PTR [rax]
    2d18:	81 fa f3 01 00 00    	cmp    edx,0x1f3
    2d1e:	0f 8f 7d ff ff ff    	jg     2ca1 <CL_Ping_f+0xb1>
    2d24:	48 81 c3 28 04 00 00 	add    rbx,0x428
    2d2b:	48 39 f3             	cmp    rbx,rsi
    2d2e:	74 55                	je     2d85 <CL_Ping_f+0x195>
    2d30:	66 83 7b 14 00       	cmp    WORD PTR [rbx+0x14],0x0
    2d35:	0f 85 4a ff ff ff    	jne    2c85 <CL_Ping_f+0x95>
    2d3b:	e9 61 ff ff ff       	jmp    2ca1 <CL_Ping_f+0xb1>
    2d40:	bf 01 00 00 00       	mov    edi,0x1
    2d45:	bb 05 00 00 00       	mov    ebx,0x5
    2d4a:	e8 00 00 00 00       	call   2d4f <CL_Ping_f+0x15f>
    2d4f:	b9 03 00 00 00       	mov    ecx,0x3
    2d54:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2d5b <CL_Ping_f+0x16b>
    2d5b:	48 89 c6             	mov    rsi,rax
    2d5e:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    2d60:	0f 97 c0             	seta   al
    2d63:	1c 00                	sbb    al,0x0
    2d65:	84 c0                	test   al,al
    2d67:	0f 84 d0 fe ff ff    	je     2c3d <CL_Ping_f+0x4d>
    2d6d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2d74 <CL_Ping_f+0x184>
    2d74:	31 c0                	xor    eax,eax
    2d76:	bb 07 00 00 00       	mov    ebx,0x7
    2d7b:	e8 00 00 00 00       	call   2d80 <CL_Ping_f+0x190>
    2d80:	e9 b8 fe ff ff       	jmp    2c3d <CL_Ping_f+0x4d>
    2d85:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 2d8c <CL_Ping_f+0x19c>
    2d8c:	bf 00 00 00 80       	mov    edi,0x80000000
    2d91:	48 89 da             	mov    rdx,rbx
    2d94:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    2d98:	89 c1                	mov    ecx,eax
    2d9a:	2b 4a 20             	sub    ecx,DWORD PTR [rdx+0x20]
    2d9d:	39 f9                	cmp    ecx,edi
    2d9f:	7e 05                	jle    2da6 <CL_Ping_f+0x1b6>
    2da1:	89 cf                	mov    edi,ecx
    2da3:	48 89 d3             	mov    rbx,rdx
    2da6:	48 81 c2 28 04 00 00 	add    rdx,0x428
    2dad:	48 39 f2             	cmp    rdx,rsi
    2db0:	75 e6                	jne    2d98 <CL_Ping_f+0x1a8>
    2db2:	e9 f0 fe ff ff       	jmp    2ca7 <CL_Ping_f+0xb7>
    2db7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    2dbe:	00 00 

0000000000002dc0 <CL_GetServerStatus>:
CL_GetServerStatus():
    2dc0:	41 55                	push   r13
    2dc2:	49 89 fd             	mov    r13,rdi
    2dc5:	41 54                	push   r12
    2dc7:	55                   	push   rbp
    2dc8:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 2dcf <CL_GetServerStatus+0xf>
    2dcf:	53                   	push   rbx
    2dd0:	4c 8d a5 00 20 00 00 	lea    r12,[rbp+0x2000]
    2dd7:	31 db                	xor    ebx,ebx
    2dd9:	48 83 ec 08          	sub    rsp,0x8
    2ddd:	0f 1f 00             	nop    DWORD PTR [rax]
    2de0:	49 8d 34 1c          	lea    rsi,[r12+rbx*1]
    2de4:	4c 89 ef             	mov    rdi,r13
    2de7:	e8 00 00 00 00       	call   2dec <CL_GetServerStatus+0x2c>
    2dec:	85 c0                	test   eax,eax
    2dee:	0f 85 7c 00 00 00    	jne    2e70 <CL_GetServerStatus+0xb0>
    2df4:	48 81 c3 38 20 00 00 	add    rbx,0x2038
    2dfb:	48 81 fb 80 03 02 00 	cmp    rbx,0x20380
    2e02:	75 dc                	jne    2de0 <CL_GetServerStatus+0x20>
    2e04:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 2e0b <CL_GetServerStatus+0x4b>
    2e0b:	31 d2                	xor    edx,edx
    2e0d:	0f 1f 00             	nop    DWORD PTR [rax]
    2e10:	8b 08                	mov    ecx,DWORD PTR [rax]
    2e12:	85 c9                	test   ecx,ecx
    2e14:	75 6a                	jne    2e80 <CL_GetServerStatus+0xc0>
    2e16:	83 c2 01             	add    edx,0x1
    2e19:	48 05 38 20 00 00    	add    rax,0x2038
    2e1f:	83 fa 10             	cmp    edx,0x10
    2e22:	75 ec                	jne    2e10 <CL_GetServerStatus+0x50>
    2e24:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 2e2b <CL_GetServerStatus+0x6b>
    2e2b:	31 ff                	xor    edi,edi
    2e2d:	31 d2                	xor    edx,edx
    2e2f:	be ff ff ff ff       	mov    esi,0xffffffff
    2e34:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    2e38:	8b 08                	mov    ecx,DWORD PTR [rax]
    2e3a:	83 fe ff             	cmp    esi,0xffffffff
    2e3d:	74 04                	je     2e43 <CL_GetServerStatus+0x83>
    2e3f:	39 f9                	cmp    ecx,edi
    2e41:	7d 04                	jge    2e47 <CL_GetServerStatus+0x87>
    2e43:	89 cf                	mov    edi,ecx
    2e45:	89 d6                	mov    esi,edx
    2e47:	83 c2 01             	add    edx,0x1
    2e4a:	48 05 38 20 00 00    	add    rax,0x2038
    2e50:	83 fa 10             	cmp    edx,0x10
    2e53:	75 e3                	jne    2e38 <CL_GetServerStatus+0x78>
    2e55:	48 63 c6             	movsxd rax,esi
    2e58:	48 83 c4 08          	add    rsp,0x8
    2e5c:	48 69 c0 38 20 00 00 	imul   rax,rax,0x2038
    2e63:	5b                   	pop    rbx
    2e64:	48 01 e8             	add    rax,rbp
    2e67:	5d                   	pop    rbp
    2e68:	41 5c                	pop    r12
    2e6a:	41 5d                	pop    r13
    2e6c:	c3                   	ret    
    2e6d:	0f 1f 00             	nop    DWORD PTR [rax]
    2e70:	48 83 c4 08          	add    rsp,0x8
    2e74:	48 8d 44 1d 00       	lea    rax,[rbp+rbx*1+0x0]
    2e79:	5b                   	pop    rbx
    2e7a:	5d                   	pop    rbp
    2e7b:	41 5c                	pop    r12
    2e7d:	41 5d                	pop    r13
    2e7f:	c3                   	ret    
    2e80:	48 63 c2             	movsxd rax,edx
    2e83:	48 83 c4 08          	add    rsp,0x8
    2e87:	48 69 c0 38 20 00 00 	imul   rax,rax,0x2038
    2e8e:	5b                   	pop    rbx
    2e8f:	48 01 e8             	add    rax,rbp
    2e92:	5d                   	pop    rbp
    2e93:	41 5c                	pop    r12
    2e95:	41 5d                	pop    r13
    2e97:	c3                   	ret    
    2e98:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    2e9f:	00 

0000000000002ea0 <CL_ServerStatus_f>:
CL_ServerStatus_f():
    2ea0:	55                   	push   rbp
    2ea1:	53                   	push   rbx
    2ea2:	48 83 ec 28          	sub    rsp,0x28
    2ea6:	e8 00 00 00 00       	call   2eab <CL_ServerStatus_f+0xb>
    2eab:	8d 50 fe             	lea    edx,[rax-0x2]
    2eae:	83 fa 01             	cmp    edx,0x1
    2eb1:	0f 86 91 00 00 00    	jbe    2f48 <CL_ServerStatus_f+0xa8>
    2eb7:	83 3d 00 00 00 00 08 	cmp    DWORD PTR [rip+0x0],0x8        # 2ebe <CL_ServerStatus_f+0x1e>
    2ebe:	75 60                	jne    2f20 <CL_ServerStatus_f+0x80>
    2ec0:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 2ec6 <CL_ServerStatus_f+0x26>
    2ec6:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 2ecd <CL_ServerStatus_f+0x2d>
    2ecd:	85 c0                	test   eax,eax
    2ecf:	75 4f                	jne    2f20 <CL_ServerStatus_f+0x80>
    2ed1:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 2ed8 <CL_ServerStatus_f+0x38>
    2ed8:	48 89 de             	mov    rsi,rbx
    2edb:	31 ff                	xor    edi,edi
    2edd:	31 c0                	xor    eax,eax
    2edf:	e8 00 00 00 00       	call   2ee4 <CL_ServerStatus_f+0x44>
    2ee4:	48 89 df             	mov    rdi,rbx
    2ee7:	e8 d4 fe ff ff       	call   2dc0 <CL_GetServerStatus>
    2eec:	f3 0f 6f 0b          	movdqu xmm1,XMMWORD PTR [rbx]
    2ef0:	48 b9 01 00 00 00 01 	movabs rcx,0x100000001
    2ef7:	00 00 00 
    2efa:	0f 11 88 00 20 00 00 	movups XMMWORD PTR [rax+0x2000],xmm1
    2f01:	f3 0f 6f 53 10       	movdqu xmm2,XMMWORD PTR [rbx+0x10]
    2f06:	48 89 88 28 20 00 00 	mov    QWORD PTR [rax+0x2028],rcx
    2f0d:	0f 11 90 10 20 00 00 	movups XMMWORD PTR [rax+0x2010],xmm2
    2f14:	48 83 c4 28          	add    rsp,0x28
    2f18:	5b                   	pop    rbx
    2f19:	5d                   	pop    rbp
    2f1a:	c3                   	ret    
    2f1b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2f20:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2f27 <CL_ServerStatus_f+0x87>
    2f27:	31 c0                	xor    eax,eax
    2f29:	e8 00 00 00 00       	call   2f2e <CL_ServerStatus_f+0x8e>
    2f2e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2f35 <CL_ServerStatus_f+0x95>
    2f35:	31 c0                	xor    eax,eax
    2f37:	e8 00 00 00 00       	call   2f3c <CL_ServerStatus_f+0x9c>
    2f3c:	48 83 c4 28          	add    rsp,0x28
    2f40:	5b                   	pop    rbx
    2f41:	5d                   	pop    rbp
    2f42:	c3                   	ret    
    2f43:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    2f48:	66 0f ef c0          	pxor   xmm0,xmm0
    2f4c:	bf 01 00 00 00       	mov    edi,0x1
    2f51:	0f 29 04 24          	movaps XMMWORD PTR [rsp],xmm0
    2f55:	0f 29 44 24 10       	movaps XMMWORD PTR [rsp+0x10],xmm0
    2f5a:	83 f8 02             	cmp    eax,0x2
    2f5d:	74 51                	je     2fb0 <CL_ServerStatus_f+0x110>
    2f5f:	e8 00 00 00 00       	call   2f64 <CL_ServerStatus_f+0xc4>
    2f64:	b9 03 00 00 00       	mov    ecx,0x3
    2f69:	bd 04 00 00 00       	mov    ebp,0x4
    2f6e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2f75 <CL_ServerStatus_f+0xd5>
    2f75:	48 89 c6             	mov    rsi,rax
    2f78:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    2f7a:	0f 97 c0             	seta   al
    2f7d:	1c 00                	sbb    al,0x0
    2f7f:	84 c0                	test   al,al
    2f81:	75 3d                	jne    2fc0 <CL_ServerStatus_f+0x120>
    2f83:	bf 02 00 00 00       	mov    edi,0x2
    2f88:	e8 00 00 00 00       	call   2f8d <CL_ServerStatus_f+0xed>
    2f8d:	48 89 c7             	mov    rdi,rax
    2f90:	48 89 e3             	mov    rbx,rsp
    2f93:	89 ea                	mov    edx,ebp
    2f95:	48 89 de             	mov    rsi,rbx
    2f98:	e8 00 00 00 00       	call   2f9d <CL_ServerStatus_f+0xfd>
    2f9d:	85 c0                	test   eax,eax
    2f9f:	0f 85 2c ff ff ff    	jne    2ed1 <CL_ServerStatus_f+0x31>
    2fa5:	e9 6a ff ff ff       	jmp    2f14 <CL_ServerStatus_f+0x74>
    2faa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    2fb0:	e8 00 00 00 00       	call   2fb5 <CL_ServerStatus_f+0x115>
    2fb5:	bd 07 00 00 00       	mov    ebp,0x7
    2fba:	48 89 c7             	mov    rdi,rax
    2fbd:	eb d1                	jmp    2f90 <CL_ServerStatus_f+0xf0>
    2fbf:	90                   	nop
    2fc0:	bf 01 00 00 00       	mov    edi,0x1
    2fc5:	bd 05 00 00 00       	mov    ebp,0x5
    2fca:	e8 00 00 00 00       	call   2fcf <CL_ServerStatus_f+0x12f>
    2fcf:	b9 03 00 00 00       	mov    ecx,0x3
    2fd4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2fdb <CL_ServerStatus_f+0x13b>
    2fdb:	48 89 c6             	mov    rsi,rax
    2fde:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    2fe0:	0f 97 c0             	seta   al
    2fe3:	1c 00                	sbb    al,0x0
    2fe5:	84 c0                	test   al,al
    2fe7:	74 9a                	je     2f83 <CL_ServerStatus_f+0xe3>
    2fe9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 2ff0 <CL_ServerStatus_f+0x150>
    2ff0:	31 c0                	xor    eax,eax
    2ff2:	bd 07 00 00 00       	mov    ebp,0x7
    2ff7:	e8 00 00 00 00       	call   2ffc <CL_ServerStatus_f+0x15c>
    2ffc:	eb 85                	jmp    2f83 <CL_ServerStatus_f+0xe3>
    2ffe:	66 90                	xchg   ax,ax

0000000000003000 <CL_CompleteVideoName>:
CL_CompleteVideoName():
    3000:	83 fe 02             	cmp    esi,0x2
    3003:	74 0b                	je     3010 <CL_CompleteVideoName+0x10>
    3005:	c3                   	ret    
    3006:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    300d:	00 00 00 
    3010:	b9 09 00 00 00       	mov    ecx,0x9
    3015:	ba 01 00 00 00       	mov    edx,0x1
    301a:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3021 <CL_CompleteVideoName+0x21>
    3021:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3028 <CL_CompleteVideoName+0x28>
    3028:	e9 00 00 00 00       	jmp    302d <CL_CompleteVideoName+0x2d>
    302d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003030 <CL_CompleteRecordName>:
CL_CompleteRecordName():
    3030:	83 fe 02             	cmp    esi,0x2
    3033:	74 0b                	je     3040 <CL_CompleteRecordName+0x10>
    3035:	c3                   	ret    
    3036:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    303d:	00 00 00 
    3040:	53                   	push   rbx
    3041:	b9 44 00 00 00       	mov    ecx,0x44
    3046:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 304d <CL_CompleteRecordName+0x1d>
    304d:	31 c0                	xor    eax,eax
    304f:	be 10 00 00 00       	mov    esi,0x10
    3054:	48 83 ec 10          	sub    rsp,0x10
    3058:	48 89 e3             	mov    rbx,rsp
    305b:	48 89 df             	mov    rdi,rbx
    305e:	e8 00 00 00 00       	call   3063 <CL_CompleteRecordName+0x33>
    3063:	48 89 de             	mov    rsi,rbx
    3066:	b9 09 00 00 00       	mov    ecx,0x9
    306b:	ba 01 00 00 00       	mov    edx,0x1
    3070:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3077 <CL_CompleteRecordName+0x47>
    3077:	e8 00 00 00 00       	call   307c <CL_CompleteRecordName+0x4c>
    307c:	48 83 c4 10          	add    rsp,0x10
    3080:	5b                   	pop    rbx
    3081:	c3                   	ret    
    3082:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3089:	00 00 00 00 
    308d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003090 <CL_Rcon_f.part.11>:
CL_Rcon_f.part.11():
    3090:	53                   	push   rbx
    3091:	be 20 00 00 00       	mov    esi,0x20
    3096:	48 81 ec 10 04 00 00 	sub    rsp,0x410
    309d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 30a4 <CL_Rcon_f.part.11+0x14>
    30a4:	c6 44 24 04 00       	mov    BYTE PTR [rsp+0x4],0x0
    30a9:	48 8b 78 08          	mov    rdi,QWORD PTR [rax+0x8]
    30ad:	c7 04 24 ff ff ff ff 	mov    DWORD PTR [rsp],0xffffffff
    30b4:	e8 00 00 00 00       	call   30b9 <CL_Rcon_f.part.11+0x29>
    30b9:	48 89 c3             	mov    rbx,rax
    30bc:	e8 00 00 00 00       	call   30c1 <CL_Rcon_f.part.11+0x31>
    30c1:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 30c8 <CL_Rcon_f.part.11+0x38>
    30c8:	48 85 db             	test   rbx,rbx
    30cb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 30d2 <CL_Rcon_f.part.11+0x42>
    30d2:	48 89 e3             	mov    rbx,rsp
    30d5:	4c 8d 40 05          	lea    r8,[rax+0x5]
    30d9:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
    30dd:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 30e4 <CL_Rcon_f.part.11+0x54>
    30e4:	48 8d 7b 04          	lea    rdi,[rbx+0x4]
    30e8:	48 0f 44 d6          	cmove  rdx,rsi
    30ec:	be 00 04 00 00       	mov    esi,0x400
    30f1:	31 c0                	xor    eax,eax
    30f3:	e8 00 00 00 00       	call   30f8 <CL_Rcon_f.part.11+0x68>
    30f8:	48 89 da             	mov    rdx,rbx
    30fb:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 3102 <CL_Rcon_f.part.11+0x72>
    3102:	31 ff                	xor    edi,edi
    3104:	8d 70 05             	lea    esi,[rax+0x5]
    3107:	e8 00 00 00 00       	call   310c <CL_Rcon_f.part.11+0x7c>
    310c:	48 81 c4 10 04 00 00 	add    rsp,0x410
    3113:	5b                   	pop    rbx
    3114:	c3                   	ret    
    3115:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    311c:	00 00 00 00 

0000000000003120 <CL_Rcon_f>:
CL_Rcon_f():
    3120:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 3127 <CL_Rcon_f+0x7>
    3127:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    312b:	80 38 00             	cmp    BYTE PTR [rax],0x0
    312e:	74 70                	je     31a0 <CL_Rcon_f+0x80>
    3130:	83 3d 00 00 00 00 04 	cmp    DWORD PTR [rip+0x0],0x4        # 3137 <CL_Rcon_f+0x17>
    3137:	77 3f                	ja     3178 <CL_Rcon_f+0x58>
    3139:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 3140 <CL_Rcon_f+0x20>
    3140:	48 8b 78 08          	mov    rdi,QWORD PTR [rax+0x8]
    3144:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
    3147:	74 6f                	je     31b8 <CL_Rcon_f+0x98>
    3149:	48 83 ec 08          	sub    rsp,0x8
    314d:	ba 07 00 00 00       	mov    edx,0x7
    3152:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3159 <CL_Rcon_f+0x39>
    3159:	e8 00 00 00 00       	call   315e <CL_Rcon_f+0x3e>
    315e:	85 c0                	test   eax,eax
    3160:	74 4e                	je     31b0 <CL_Rcon_f+0x90>
    3162:	66 83 3d 00 00 00 00 	cmp    WORD PTR [rip+0x0],0x0        # 316a <CL_Rcon_f+0x4a>
    3169:	00 
    316a:	74 64                	je     31d0 <CL_Rcon_f+0xb0>
    316c:	48 83 c4 08          	add    rsp,0x8
    3170:	e9 1b ff ff ff       	jmp    3090 <CL_Rcon_f.part.11>
    3175:	0f 1f 00             	nop    DWORD PTR [rax]
    3178:	f3 0f 6f 05 00 00 00 	movdqu xmm0,XMMWORD PTR [rip+0x0]        # 3180 <CL_Rcon_f+0x60>
    317f:	00 
    3180:	f3 0f 6f 0d 00 00 00 	movdqu xmm1,XMMWORD PTR [rip+0x0]        # 3188 <CL_Rcon_f+0x68>
    3187:	00 
    3188:	0f 11 05 00 00 00 00 	movups XMMWORD PTR [rip+0x0],xmm0        # 318f <CL_Rcon_f+0x6f>
    318f:	0f 11 0d 00 00 00 00 	movups XMMWORD PTR [rip+0x0],xmm1        # 3196 <CL_Rcon_f+0x76>
    3196:	e9 f5 fe ff ff       	jmp    3090 <CL_Rcon_f.part.11>
    319b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    31a0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 31a7 <CL_Rcon_f+0x87>
    31a7:	31 c0                	xor    eax,eax
    31a9:	e9 00 00 00 00       	jmp    31ae <CL_Rcon_f+0x8e>
    31ae:	66 90                	xchg   ax,ax
    31b0:	48 83 c4 08          	add    rsp,0x8
    31b4:	c3                   	ret    
    31b5:	0f 1f 00             	nop    DWORD PTR [rax]
    31b8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 31bf <CL_Rcon_f+0x9f>
    31bf:	31 c0                	xor    eax,eax
    31c1:	e9 00 00 00 00       	jmp    31c6 <CL_Rcon_f+0xa6>
    31c6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    31cd:	00 00 00 
    31d0:	bf 38 6d 00 00       	mov    edi,0x6d38
    31d5:	e8 00 00 00 00       	call   31da <CL_Rcon_f+0xba>
    31da:	66 89 05 00 00 00 00 	mov    WORD PTR [rip+0x0],ax        # 31e1 <CL_Rcon_f+0xc1>
    31e1:	eb 89                	jmp    316c <CL_Rcon_f+0x4c>
    31e3:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    31ea:	00 00 00 00 
    31ee:	66 90                	xchg   ax,ax

00000000000031f0 <CL_CompleteDemoName>:
CL_CompleteDemoName():
    31f0:	83 fe 02             	cmp    esi,0x2
    31f3:	74 0b                	je     3200 <CL_CompleteDemoName+0x10>
    31f5:	c3                   	ret    
    31f6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    31fd:	00 00 00 
    3200:	48 83 ec 08          	sub    rsp,0x8
    3204:	48 8d 3d a5 ef ff ff 	lea    rdi,[rip+0xffffffffffffefa5]        # 21b0 <CL_DemoNameCallback_f>
    320b:	e8 00 00 00 00       	call   3210 <CL_CompleteDemoName+0x20>
    3210:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3217 <CL_CompleteDemoName+0x27>
    3217:	31 d2                	xor    edx,edx
    3219:	b9 0f 00 00 00       	mov    ecx,0xf
    321e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3225 <CL_CompleteDemoName+0x35>
    3225:	e8 00 00 00 00       	call   322a <CL_CompleteDemoName+0x3a>
    322a:	31 ff                	xor    edi,edi
    322c:	48 83 c4 08          	add    rsp,0x8
    3230:	e9 00 00 00 00       	jmp    3235 <CL_CompleteDemoName+0x45>
    3235:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    323c:	00 00 00 00 

0000000000003240 <CL_ServersResponsePacket.isra.17>:
CL_ServersResponsePacket.isra.17():
    3240:	41 57                	push   r15
    3242:	41 56                	push   r14
    3244:	41 55                	push   r13
    3246:	41 54                	push   r12
    3248:	41 89 cc             	mov    r12d,ecx
    324b:	55                   	push   rbp
    324c:	48 89 f5             	mov    rbp,rsi
    324f:	53                   	push   rbx
    3250:	48 89 d3             	mov    rbx,rdx
    3253:	48 81 ec 28 20 00 00 	sub    rsp,0x2028
    325a:	83 3d 00 00 00 00 ff 	cmp    DWORD PTR [rip+0x0],0xffffffff        # 3261 <CL_ServersResponsePacket.isra.17+0x21>
    3261:	48 89 7c 24 08       	mov    QWORD PTR [rsp+0x8],rdi
    3266:	0f 84 43 04 00 00    	je     36af <CL_ServersResponsePacket.isra.17+0x46f>
    326c:	4c 8b 75 00          	mov    r14,QWORD PTR [rbp+0x0]
    3270:	48 63 0b             	movsxd rcx,DWORD PTR [rbx]
    3273:	44 89 e6             	mov    esi,r12d
    3276:	83 e6 01             	and    esi,0x1
    3279:	4d 8d 2c 0e          	lea    r13,[r14+rcx*1]
    327d:	eb 17                	jmp    3296 <CL_ServersResponsePacket.isra.17+0x56>
    327f:	90                   	nop
    3280:	80 fa 2f             	cmp    dl,0x2f
    3283:	75 05                	jne    328a <CL_ServersResponsePacket.isra.17+0x4a>
    3285:	40 84 f6             	test   sil,sil
    3288:	75 19                	jne    32a3 <CL_ServersResponsePacket.isra.17+0x63>
    328a:	49 89 c6             	mov    r14,rax
    328d:	49 39 c5             	cmp    r13,rax
    3290:	0f 86 10 04 00 00    	jbe    36a6 <CL_ServersResponsePacket.isra.17+0x466>
    3296:	41 0f b6 16          	movzx  edx,BYTE PTR [r14]
    329a:	49 8d 46 01          	lea    rax,[r14+0x1]
    329e:	80 fa 5c             	cmp    dl,0x5c
    32a1:	75 dd                	jne    3280 <CL_ServersResponsePacket.isra.17+0x40>
    32a3:	44 89 e7             	mov    edi,r12d
    32a6:	4c 8d 7c 24 20       	lea    r15,[rsp+0x20]
    32ab:	31 ed                	xor    ebp,ebp
    32ad:	83 e7 01             	and    edi,0x1
    32b0:	89 eb                	mov    ebx,ebp
    32b2:	4c 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],r15
    32b7:	4c 89 f5             	mov    rbp,r14
    32ba:	40 88 3c 24          	mov    BYTE PTR [rsp],dil
    32be:	4c 8b 74 24 08       	mov    r14,QWORD PTR [rsp+0x8]
    32c3:	4c 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],r15
    32c8:	49 39 c5             	cmp    r13,rax
    32cb:	0f 86 c1 00 00 00    	jbe    3392 <CL_ServersResponsePacket.isra.17+0x152>
    32d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    32d8:	0f b6 55 00          	movzx  edx,BYTE PTR [rbp+0x0]
    32dc:	80 fa 5c             	cmp    dl,0x5c
    32df:	0f 84 2b 02 00 00    	je     3510 <CL_ServersResponsePacket.isra.17+0x2d0>
    32e5:	80 fa 2f             	cmp    dl,0x2f
    32e8:	0f 85 a4 00 00 00    	jne    3392 <CL_ServersResponsePacket.isra.17+0x152>
    32ee:	80 3c 24 00          	cmp    BYTE PTR [rsp],0x0
    32f2:	0f 84 9a 00 00 00    	je     3392 <CL_ServersResponsePacket.isra.17+0x152>
    32f8:	4c 89 e9             	mov    rcx,r13
    32fb:	48 29 c1             	sub    rcx,rax
    32fe:	48 83 f9 12          	cmp    rcx,0x12
    3302:	0f 86 8a 00 00 00    	jbe    3392 <CL_ServersResponsePacket.isra.17+0x152>
    3308:	b8 01 00 00 00       	mov    eax,0x1
    330d:	0f 1f 00             	nop    DWORD PTR [rax]
    3310:	0f b6 54 05 00       	movzx  edx,BYTE PTR [rbp+rax*1+0x0]
    3315:	41 88 54 07 03       	mov    BYTE PTR [r15+rax*1+0x3],dl
    331a:	48 83 c0 01          	add    rax,0x1
    331e:	48 83 f8 11          	cmp    rax,0x11
    3322:	75 ec                	jne    3310 <CL_ServersResponsePacket.isra.17+0xd0>
    3324:	49 8b 06             	mov    rax,QWORD PTR [r14]
    3327:	41 c7 07 05 00 00 00 	mov    DWORD PTR [r15],0x5
    332e:	4c 8d 65 11          	lea    r12,[rbp+0x11]
    3332:	49 89 47 18          	mov    QWORD PTR [r15+0x18],rax
    3336:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
    333b:	49 8d 6c 24 02       	lea    rbp,[r12+0x2]
    3340:	89 f8                	mov    eax,edi
    3342:	c1 e0 08             	shl    eax,0x8
    3345:	66 41 89 47 14       	mov    WORD PTR [r15+0x14],ax
    334a:	41 0f b6 7c 24 01    	movzx  edi,BYTE PTR [r12+0x1]
    3350:	01 c7                	add    edi,eax
    3352:	66 41 89 7f 14       	mov    WORD PTR [r15+0x14],di
    3357:	0f bf ff             	movsx  edi,di
    335a:	e8 00 00 00 00       	call   335f <CL_ServersResponsePacket.isra.17+0x11f>
    335f:	66 41 89 47 14       	mov    WORD PTR [r15+0x14],ax
    3364:	41 0f b6 44 24 02    	movzx  eax,BYTE PTR [r12+0x2]
    336a:	3c 5c                	cmp    al,0x5c
    336c:	74 04                	je     3372 <CL_ServersResponsePacket.isra.17+0x132>
    336e:	3c 2f                	cmp    al,0x2f
    3370:	75 20                	jne    3392 <CL_ServersResponsePacket.isra.17+0x152>
    3372:	83 c3 01             	add    ebx,0x1
    3375:	49 83 c7 20          	add    r15,0x20
    3379:	81 fb 00 01 00 00    	cmp    ebx,0x100
    337f:	0f 84 98 03 00 00    	je     371d <CL_ServersResponsePacket.isra.17+0x4dd>
    3385:	48 8d 45 01          	lea    rax,[rbp+0x1]
    3389:	49 39 c5             	cmp    r13,rax
    338c:	0f 87 46 ff ff ff    	ja     32d8 <CL_ServersResponsePacket.isra.17+0x98>
    3392:	89 dd                	mov    ebp,ebx
    3394:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
    3399:	85 ed                	test   ebp,ebp
    339b:	0f 9f c0             	setg   al
    339e:	44 8b 2d 00 00 00 00 	mov    r13d,DWORD PTR [rip+0x0]        # 33a5 <CL_ServersResponsePacket.isra.17+0x165>
    33a5:	45 31 e4             	xor    r12d,r12d
    33a8:	41 81 fd ff 0f 00 00 	cmp    r13d,0xfff
    33af:	0f 8f 44 03 00 00    	jg     36f9 <CL_ServersResponsePacket.isra.17+0x4b9>
    33b5:	84 c0                	test   al,al
    33b7:	0f 84 3c 03 00 00    	je     36f9 <CL_ServersResponsePacket.isra.17+0x4b9>
    33bd:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 33c4 <CL_ServersResponsePacket.isra.17+0x184>
    33c4:	4c 8d 35 00 00 00 00 	lea    r14,[rip+0x0]        # 33cb <CL_ServersResponsePacket.isra.17+0x18b>
    33cb:	48 89 04 24          	mov    QWORD PTR [rsp],rax
    33cf:	90                   	nop
    33d0:	8b 33                	mov    esi,DWORD PTR [rbx]
    33d2:	83 fe 04             	cmp    esi,0x4
    33d5:	0f 84 9d 02 00 00    	je     3678 <CL_ServersResponsePacket.isra.17+0x438>
    33db:	31 c0                	xor    eax,eax
    33dd:	83 fe 05             	cmp    esi,0x5
    33e0:	75 2c                	jne    340e <CL_ServersResponsePacket.isra.17+0x1ce>
    33e2:	48 8d 53 04          	lea    rdx,[rbx+0x4]
    33e6:	be 10 00 00 00       	mov    esi,0x10
    33eb:	48 01 d6             	add    rsi,rdx
    33ee:	31 c0                	xor    eax,eax
    33f0:	6b c0 65             	imul   eax,eax,0x65
    33f3:	48 83 c2 01          	add    rdx,0x1
    33f7:	0f b6 4a ff          	movzx  ecx,BYTE PTR [rdx-0x1]
    33fb:	01 c8                	add    eax,ecx
    33fd:	48 39 f2             	cmp    rdx,rsi
    3400:	75 ee                	jne    33f0 <CL_ServersResponsePacket.isra.17+0x1b0>
    3402:	89 c2                	mov    edx,eax
    3404:	c1 ea 10             	shr    edx,0x10
    3407:	31 d0                	xor    eax,edx
    3409:	25 ff 03 00 00       	and    eax,0x3ff
    340e:	4d 8b 3c c6          	mov    r15,QWORD PTR [r14+rax*8]
    3412:	4d 85 ff             	test   r15,r15
    3415:	75 16                	jne    342d <CL_ServersResponsePacket.isra.17+0x1ed>
    3417:	e9 34 01 00 00       	jmp    3550 <CL_ServersResponsePacket.isra.17+0x310>
    341c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    3420:	4d 8b 7f 20          	mov    r15,QWORD PTR [r15+0x20]
    3424:	4d 85 ff             	test   r15,r15
    3427:	0f 84 23 01 00 00    	je     3550 <CL_ServersResponsePacket.isra.17+0x310>
    342d:	4c 89 fe             	mov    rsi,r15
    3430:	48 89 df             	mov    rdi,rbx
    3433:	e8 00 00 00 00       	call   3438 <CL_ServersResponsePacket.isra.17+0x1f8>
    3438:	85 c0                	test   eax,eax
    343a:	74 e4                	je     3420 <CL_ServersResponsePacket.isra.17+0x1e0>
    343c:	41 83 c4 01          	add    r12d,0x1
    3440:	48 83 c3 20          	add    rbx,0x20
    3444:	41 39 ec             	cmp    r12d,ebp
    3447:	7d 0d                	jge    3456 <CL_ServersResponsePacket.isra.17+0x216>
    3449:	41 81 fd ff 0f 00 00 	cmp    r13d,0xfff
    3450:	0f 8e 7a ff ff ff    	jle    33d0 <CL_ServersResponsePacket.isra.17+0x190>
    3456:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 345d <CL_ServersResponsePacket.isra.17+0x21d>
    345d:	41 81 fd ff 0f 00 00 	cmp    r13d,0xfff
    3464:	7e 74                	jle    34da <CL_ServersResponsePacket.isra.17+0x29a>
    3466:	81 f9 ff 0f 00 00    	cmp    ecx,0xfff
    346c:	7f 6c                	jg     34da <CL_ServersResponsePacket.isra.17+0x29a>
    346e:	44 39 e5             	cmp    ebp,r12d
    3471:	7e 67                	jle    34da <CL_ServersResponsePacket.isra.17+0x29a>
    3473:	8d 34 29             	lea    esi,[rcx+rbp*1]
    3476:	4c 8b 3c 24          	mov    r15,QWORD PTR [rsp]
    347a:	8d 51 01             	lea    edx,[rcx+0x1]
    347d:	48 c1 e1 05          	shl    rcx,0x5
    3481:	44 29 e6             	sub    esi,r12d
    3484:	4d 63 e4             	movsxd r12,r12d
    3487:	31 c0                	xor    eax,eax
    3489:	49 c1 e4 05          	shl    r12,0x5
    348d:	49 01 cf             	add    r15,rcx
    3490:	4c 03 64 24 18       	add    r12,QWORD PTR [rsp+0x18]
    3495:	eb 18                	jmp    34af <CL_ServersResponsePacket.isra.17+0x26f>
    3497:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    349e:	00 00 
    34a0:	83 c2 01             	add    edx,0x1
    34a3:	48 83 c0 20          	add    rax,0x20
    34a7:	81 fa 01 10 00 00    	cmp    edx,0x1001
    34ad:	74 2b                	je     34da <CL_ServersResponsePacket.isra.17+0x29a>
    34af:	66 41 0f 6f 14 04    	movdqa xmm2,XMMWORD PTR [r12+rax*1]
    34b5:	66 41 0f 6f 5c 04 10 	movdqa xmm3,XMMWORD PTR [r12+rax*1+0x10]
    34bc:	89 15 00 00 00 00    	mov    DWORD PTR [rip+0x0],edx        # 34c2 <CL_ServersResponsePacket.isra.17+0x282>
    34c2:	89 d1                	mov    ecx,edx
    34c4:	41 0f 11 94 07 48 68 	movups XMMWORD PTR [r15+rax*1+0xb6848],xmm2
    34cb:	0b 00 
    34cd:	41 0f 11 9c 07 58 68 	movups XMMWORD PTR [r15+rax*1+0xb6858],xmm3
    34d4:	0b 00 
    34d6:	39 d6                	cmp    esi,edx
    34d8:	75 c6                	jne    34a0 <CL_ServersResponsePacket.isra.17+0x260>
    34da:	41 8d 54 0d 00       	lea    edx,[r13+rcx*1+0x0]
    34df:	89 ee                	mov    esi,ebp
    34e1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 34e8 <CL_ServersResponsePacket.isra.17+0x2a8>
    34e8:	31 c0                	xor    eax,eax
    34ea:	44 89 2d 00 00 00 00 	mov    DWORD PTR [rip+0x0],r13d        # 34f1 <CL_ServersResponsePacket.isra.17+0x2b1>
    34f1:	e8 00 00 00 00       	call   34f6 <CL_ServersResponsePacket.isra.17+0x2b6>
    34f6:	48 81 c4 28 20 00 00 	add    rsp,0x2028
    34fd:	5b                   	pop    rbx
    34fe:	5d                   	pop    rbp
    34ff:	41 5c                	pop    r12
    3501:	41 5d                	pop    r13
    3503:	41 5e                	pop    r14
    3505:	41 5f                	pop    r15
    3507:	c3                   	ret    
    3508:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    350f:	00 
    3510:	4c 89 e9             	mov    rcx,r13
    3513:	48 29 c1             	sub    rcx,rax
    3516:	48 83 f9 06          	cmp    rcx,0x6
    351a:	0f 86 72 fe ff ff    	jbe    3392 <CL_ServersResponsePacket.isra.17+0x152>
    3520:	b8 01 00 00 00       	mov    eax,0x1
    3525:	0f b6 54 05 00       	movzx  edx,BYTE PTR [rbp+rax*1+0x0]
    352a:	41 88 54 07 03       	mov    BYTE PTR [r15+rax*1+0x3],dl
    352f:	48 83 c0 01          	add    rax,0x1
    3533:	48 83 f8 05          	cmp    rax,0x5
    3537:	75 ec                	jne    3525 <CL_ServersResponsePacket.isra.17+0x2e5>
    3539:	4c 8d 65 05          	lea    r12,[rbp+0x5]
    353d:	41 c7 07 04 00 00 00 	mov    DWORD PTR [r15],0x4
    3544:	e9 ed fd ff ff       	jmp    3336 <CL_ServersResponsePacket.isra.17+0xf6>
    3549:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3550:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 3556 <CL_ServersResponsePacket.isra.17+0x316>
    3556:	81 ff ff 0f 00 00    	cmp    edi,0xfff
    355c:	0f 87 26 01 00 00    	ja     3688 <CL_ServersResponsePacket.isra.17+0x448>
    3562:	8b 03                	mov    eax,DWORD PTR [rbx]
    3564:	83 f8 04             	cmp    eax,0x4
    3567:	0f 84 30 01 00 00    	je     369d <CL_ServersResponsePacket.isra.17+0x45d>
    356d:	83 f8 05             	cmp    eax,0x5
    3570:	0f 85 20 01 00 00    	jne    3696 <CL_ServersResponsePacket.isra.17+0x456>
    3576:	48 8d 53 04          	lea    rdx,[rbx+0x4]
    357a:	b8 10 00 00 00       	mov    eax,0x10
    357f:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
    3583:	31 c0                	xor    eax,eax
    3585:	0f 1f 00             	nop    DWORD PTR [rax]
    3588:	6b c0 65             	imul   eax,eax,0x65
    358b:	48 83 c2 01          	add    rdx,0x1
    358f:	0f b6 4a ff          	movzx  ecx,BYTE PTR [rdx-0x1]
    3593:	01 c8                	add    eax,ecx
    3595:	48 39 f2             	cmp    rdx,rsi
    3598:	75 ee                	jne    3588 <CL_ServersResponsePacket.isra.17+0x348>
    359a:	89 c2                	mov    edx,eax
    359c:	c1 ea 10             	shr    edx,0x10
    359f:	31 d0                	xor    eax,edx
    35a1:	25 ff 03 00 00       	and    eax,0x3ff
    35a6:	8d 57 01             	lea    edx,[rdi+0x1]
    35a9:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 35b0 <CL_ServersResponsePacket.isra.17+0x370>
    35b0:	be 00 00 00 00       	mov    esi,0x0
    35b5:	66 0f 6f 0b          	movdqa xmm1,XMMWORD PTR [rbx]
    35b9:	89 15 00 00 00 00    	mov    DWORD PTR [rip+0x0],edx        # 35bf <CL_ServersResponsePacket.isra.17+0x37f>
    35bf:	48 8d 14 bf          	lea    rdx,[rdi+rdi*4]
    35c3:	66 0f 6f 43 10       	movdqa xmm0,XMMWORD PTR [rbx+0x10]
    35c8:	48 8d 14 d1          	lea    rdx,[rcx+rdx*8]
    35cc:	49 8b 0c c6          	mov    rcx,QWORD PTR [r14+rax*8]
    35d0:	49 89 14 c6          	mov    QWORD PTR [r14+rax*8],rdx
    35d4:	48 39 ca             	cmp    rdx,rcx
    35d7:	0f 11 0a             	movups XMMWORD PTR [rdx],xmm1
    35da:	48 0f 44 ce          	cmove  rcx,rsi
    35de:	0f 11 42 10          	movups XMMWORD PTR [rdx+0x10],xmm0
    35e2:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
    35e6:	49 63 c5             	movsxd rax,r13d
    35e9:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 35f0 <CL_ServersResponsePacket.isra.17+0x3b0>
    35f0:	48 8b 3c 24          	mov    rdi,QWORD PTR [rsp]
    35f4:	41 83 c5 01          	add    r13d,0x1
    35f8:	48 8d 14 80          	lea    rdx,[rax+rax*4]
    35fc:	48 8d 04 50          	lea    rax,[rax+rdx*2]
    3600:	48 c1 e0 04          	shl    rax,0x4
    3604:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    3608:	0f 11 0a             	movups XMMWORD PTR [rdx],xmm1
    360b:	0f 11 42 10          	movups XMMWORD PTR [rdx+0x10],xmm0
    360f:	48 8d 14 07          	lea    rdx,[rdi+rax*1]
    3613:	c6 82 60 68 00 00 00 	mov    BYTE PTR [rdx+0x6860],0x0
    361a:	c6 82 80 68 00 00 00 	mov    BYTE PTR [rdx+0x6880],0x0
    3621:	48 c7 84 08 90 00 00 	mov    QWORD PTR [rax+rcx*1+0x90],0x0
    3628:	00 00 00 00 00 
    362d:	48 8d 8c 07 c0 68 00 	lea    rcx,[rdi+rax*1+0x68c0]
    3634:	00 
    3635:	c7 82 d8 68 00 00 ff 	mov    DWORD PTR [rdx+0x68d8],0xffffffff
    363c:	ff ff ff 
    363f:	c6 82 a0 68 00 00 00 	mov    BYTE PTR [rdx+0x68a0],0x0
    3646:	48 c7 01 00 00 00 00 	mov    QWORD PTR [rcx],0x0
    364d:	48 c7 41 08 00 00 00 	mov    QWORD PTR [rcx+0x8],0x0
    3654:	00 
    3655:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 365c <CL_ServersResponsePacket.isra.17+0x41c>
    365c:	48 c7 04 01 00 00 00 	mov    QWORD PTR [rcx+rax*1],0x0
    3663:	00 
    3664:	c7 82 e8 68 00 00 00 	mov    DWORD PTR [rdx+0x68e8],0x0
    366b:	00 00 00 
    366e:	e9 c9 fd ff ff       	jmp    343c <CL_ServersResponsePacket.isra.17+0x1fc>
    3673:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3678:	48 8d 53 04          	lea    rdx,[rbx+0x4]
    367c:	e9 6a fd ff ff       	jmp    33eb <CL_ServersResponsePacket.isra.17+0x1ab>
    3681:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3688:	66 0f 6f 0b          	movdqa xmm1,XMMWORD PTR [rbx]
    368c:	66 0f 6f 43 10       	movdqa xmm0,XMMWORD PTR [rbx+0x10]
    3691:	e9 50 ff ff ff       	jmp    35e6 <CL_ServersResponsePacket.isra.17+0x3a6>
    3696:	31 c0                	xor    eax,eax
    3698:	e9 09 ff ff ff       	jmp    35a6 <CL_ServersResponsePacket.isra.17+0x366>
    369d:	48 8d 53 04          	lea    rdx,[rbx+0x4]
    36a1:	e9 d9 fe ff ff       	jmp    357f <CL_ServersResponsePacket.isra.17+0x33f>
    36a6:	48 83 c0 01          	add    rax,0x1
    36aa:	e9 f4 fb ff ff       	jmp    32a3 <CL_ServersResponsePacket.isra.17+0x63>
    36af:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 36b6 <CL_ServersResponsePacket.isra.17+0x476>
    36b6:	ba 00 80 02 00       	mov    edx,0x28000
    36bb:	31 f6                	xor    esi,esi
    36bd:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 36c7 <CL_ServersResponsePacket.isra.17+0x487>
    36c4:	00 00 00 
    36c7:	4c 8d 35 00 00 00 00 	lea    r14,[rip+0x0]        # 36ce <CL_ServersResponsePacket.isra.17+0x48e>
    36ce:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 36d8 <CL_ServersResponsePacket.isra.17+0x498>
    36d5:	00 00 00 
    36d8:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 36e2 <CL_ServersResponsePacket.isra.17+0x4a2>
    36df:	00 00 00 
    36e2:	e8 00 00 00 00       	call   36e7 <CL_ServersResponsePacket.isra.17+0x4a7>
    36e7:	b9 00 04 00 00       	mov    ecx,0x400
    36ec:	31 c0                	xor    eax,eax
    36ee:	4c 89 f7             	mov    rdi,r14
    36f1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    36f4:	e9 73 fb ff ff       	jmp    326c <CL_ServersResponsePacket.isra.17+0x2c>
    36f9:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 3700 <CL_ServersResponsePacket.isra.17+0x4c0>
    3700:	48 63 0d 00 00 00 00 	movsxd rcx,DWORD PTR [rip+0x0]        # 3707 <CL_ServersResponsePacket.isra.17+0x4c7>
    3707:	48 89 04 24          	mov    QWORD PTR [rsp],rax
    370b:	41 81 fd ff 0f 00 00 	cmp    r13d,0xfff
    3712:	0f 8e c2 fd ff ff    	jle    34da <CL_ServersResponsePacket.isra.17+0x29a>
    3718:	e9 49 fd ff ff       	jmp    3466 <CL_ServersResponsePacket.isra.17+0x226>
    371d:	89 dd                	mov    ebp,ebx
    371f:	b8 01 00 00 00       	mov    eax,0x1
    3724:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
    3729:	e9 70 fc ff ff       	jmp    339e <CL_ServersResponsePacket.isra.17+0x15e>
    372e:	66 90                	xchg   ax,ax

0000000000003730 <CL_StartHunkUsers.part.18>:
CL_StartHunkUsers.part.18():
    3730:	48 83 ec 08          	sub    rsp,0x8
    3734:	48 83 3d 00 00 00 00 	cmp    QWORD PTR [rip+0x0],0x0        # 373c <CL_StartHunkUsers.part.18+0xc>
    373b:	00 
    373c:	0f 84 e6 01 00 00    	je     3928 <CL_StartHunkUsers.part.18+0x1f8>
    3742:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 3748 <CL_StartHunkUsers.part.18+0x18>
    3748:	85 f6                	test   esi,esi
    374a:	74 34                	je     3780 <CL_StartHunkUsers.part.18+0x50>
    374c:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 3752 <CL_StartHunkUsers.part.18+0x22>
    3752:	85 c9                	test   ecx,ecx
    3754:	0f 84 20 01 00 00    	je     387a <CL_StartHunkUsers.part.18+0x14a>
    375a:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 3760 <CL_StartHunkUsers.part.18+0x30>
    3760:	85 d2                	test   edx,edx
    3762:	0f 84 2f 01 00 00    	je     3897 <CL_StartHunkUsers.part.18+0x167>
    3768:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 376e <CL_StartHunkUsers.part.18+0x3e>
    376e:	85 c0                	test   eax,eax
    3770:	0f 84 3e 01 00 00    	je     38b4 <CL_StartHunkUsers.part.18+0x184>
    3776:	48 83 c4 08          	add    rsp,0x8
    377a:	c3                   	ret    
    377b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3780:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3787 <CL_StartHunkUsers.part.18+0x57>
    3787:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 3791 <CL_StartHunkUsers.part.18+0x61>
    378e:	00 00 00 
    3791:	ff 15 00 00 00 00    	call   QWORD PTR [rip+0x0]        # 3797 <CL_StartHunkUsers.part.18+0x67>
    3797:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 379e <CL_StartHunkUsers.part.18+0x6e>
    379e:	ff 15 00 00 00 00    	call   QWORD PTR [rip+0x0]        # 37a4 <CL_StartHunkUsers.part.18+0x74>
    37a4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 37ab <CL_StartHunkUsers.part.18+0x7b>
    37ab:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 37b1 <CL_StartHunkUsers.part.18+0x81>
    37b1:	ff 15 00 00 00 00    	call   QWORD PTR [rip+0x0]        # 37b7 <CL_StartHunkUsers.part.18+0x87>
    37b7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 37be <CL_StartHunkUsers.part.18+0x8e>
    37be:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 37c4 <CL_StartHunkUsers.part.18+0x94>
    37c4:	ff 15 00 00 00 00    	call   QWORD PTR [rip+0x0]        # 37ca <CL_StartHunkUsers.part.18+0x9a>
    37ca:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 37d0 <CL_StartHunkUsers.part.18+0xa0>
    37d0:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 37db <CL_StartHunkUsers.part.18+0xab>
    37d7:	00 00 00 00 
    37db:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 37e1 <CL_StartHunkUsers.part.18+0xb1>
    37e1:	89 c8                	mov    eax,ecx
    37e3:	69 f1 e0 01 00 00    	imul   esi,ecx,0x1e0
    37e9:	99                   	cdq    
    37ea:	f7 3d 00 00 00 00    	idiv   DWORD PTR [rip+0x0]        # 37f0 <CL_StartHunkUsers.part.18+0xc0>
    37f0:	83 e8 02             	sub    eax,0x2
    37f3:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 37f9 <CL_StartHunkUsers.part.18+0xc9>
    37f9:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 37ff <CL_StartHunkUsers.part.18+0xcf>
    37ff:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 3805 <CL_StartHunkUsers.part.18+0xd5>
    3805:	8d 14 80             	lea    edx,[rax+rax*4]
    3808:	c1 e2 07             	shl    edx,0x7
    380b:	39 d6                	cmp    esi,edx
    380d:	0f 8f bd 00 00 00    	jg     38d0 <CL_StartHunkUsers.part.18+0x1a0>
    3813:	66 0f ef c0          	pxor   xmm0,xmm0
    3817:	f2 0f 10 0d 00 00 00 	movsd  xmm1,QWORD PTR [rip+0x0]        # 381f <CL_StartHunkUsers.part.18+0xef>
    381e:	00 
    381f:	66 0f ef e4          	pxor   xmm4,xmm4
    3823:	66 0f ef ed          	pxor   xmm5,xmm5
    3827:	f2 0f 2a c1          	cvtsi2sd xmm0,ecx
    382b:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    382f:	f2 0f 59 05 00 00 00 	mulsd  xmm0,QWORD PTR [rip+0x0]        # 3837 <CL_StartHunkUsers.part.18+0x107>
    3836:	00 
    3837:	f2 0f 5a e1          	cvtsd2ss xmm4,xmm1
    383b:	66 0f ef c9          	pxor   xmm1,xmm1
    383f:	f3 0f 11 25 00 00 00 	movss  DWORD PTR [rip+0x0],xmm4        # 3847 <CL_StartHunkUsers.part.18+0x117>
    3846:	00 
    3847:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
    384b:	f2 0f 5c c8          	subsd  xmm1,xmm0
    384f:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 3857 <CL_StartHunkUsers.part.18+0x127>
    3856:	00 
    3857:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    385b:	f2 0f 5a e8          	cvtsd2ss xmm5,xmm0
    385f:	f3 0f 11 2d 00 00 00 	movss  DWORD PTR [rip+0x0],xmm5        # 3867 <CL_StartHunkUsers.part.18+0x137>
    3866:	00 
    3867:	e8 00 00 00 00       	call   386c <CL_StartHunkUsers.part.18+0x13c>
    386c:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 3872 <CL_StartHunkUsers.part.18+0x142>
    3872:	85 c9                	test   ecx,ecx
    3874:	0f 85 e0 fe ff ff    	jne    375a <CL_StartHunkUsers.part.18+0x2a>
    387a:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 3884 <CL_StartHunkUsers.part.18+0x154>
    3881:	00 00 00 
    3884:	e8 00 00 00 00       	call   3889 <CL_StartHunkUsers.part.18+0x159>
    3889:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 388f <CL_StartHunkUsers.part.18+0x15f>
    388f:	85 d2                	test   edx,edx
    3891:	0f 85 d1 fe ff ff    	jne    3768 <CL_StartHunkUsers.part.18+0x38>
    3897:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 38a1 <CL_StartHunkUsers.part.18+0x171>
    389e:	00 00 00 
    38a1:	e8 00 00 00 00       	call   38a6 <CL_StartHunkUsers.part.18+0x176>
    38a6:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 38ac <CL_StartHunkUsers.part.18+0x17c>
    38ac:	85 c0                	test   eax,eax
    38ae:	0f 85 c2 fe ff ff    	jne    3776 <CL_StartHunkUsers.part.18+0x46>
    38b4:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 38be <CL_StartHunkUsers.part.18+0x18e>
    38bb:	00 00 00 
    38be:	48 83 c4 08          	add    rsp,0x8
    38c2:	e9 00 00 00 00       	jmp    38c7 <CL_StartHunkUsers.part.18+0x197>
    38c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    38ce:	00 00 
    38d0:	66 0f ef c9          	pxor   xmm1,xmm1
    38d4:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 38dc <CL_StartHunkUsers.part.18+0x1ac>
    38db:	00 
    38dc:	66 0f ef d2          	pxor   xmm2,xmm2
    38e0:	66 0f ef db          	pxor   xmm3,xmm3
    38e4:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
    38e8:	f2 0f 59 c1          	mulsd  xmm0,xmm1
    38ec:	f2 0f 59 0d 00 00 00 	mulsd  xmm1,QWORD PTR [rip+0x0]        # 38f4 <CL_StartHunkUsers.part.18+0x1c4>
    38f3:	00 
    38f4:	f2 0f 5a d0          	cvtsd2ss xmm2,xmm0
    38f8:	66 0f ef c0          	pxor   xmm0,xmm0
    38fc:	f3 0f 11 15 00 00 00 	movss  DWORD PTR [rip+0x0],xmm2        # 3904 <CL_StartHunkUsers.part.18+0x1d4>
    3903:	00 
    3904:	f2 0f 2a c1          	cvtsi2sd xmm0,ecx
    3908:	f2 0f 5c c1          	subsd  xmm0,xmm1
    390c:	f2 0f 59 05 00 00 00 	mulsd  xmm0,QWORD PTR [rip+0x0]        # 3914 <CL_StartHunkUsers.part.18+0x1e4>
    3913:	00 
    3914:	f2 0f 5a d8          	cvtsd2ss xmm3,xmm0
    3918:	f3 0f 11 1d 00 00 00 	movss  DWORD PTR [rip+0x0],xmm3        # 3920 <CL_StartHunkUsers.part.18+0x1f0>
    391f:	00 
    3920:	e9 42 ff ff ff       	jmp    3867 <CL_StartHunkUsers.part.18+0x137>
    3925:	0f 1f 00             	nop    DWORD PTR [rax]
    3928:	e8 e3 d7 ff ff       	call   1110 <CL_InitRef>
    392d:	e9 10 fe ff ff       	jmp    3742 <CL_StartHunkUsers.part.18+0x12>
    3932:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3939:	00 00 00 00 
    393d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003940 <CL_GetPing.part.21>:
CL_GetPing.part.21():
    3940:	48 63 ff             	movsxd rdi,edi
    3943:	41 57                	push   r15
    3945:	4c 8d 3d 00 00 00 00 	lea    r15,[rip+0x0]        # 394c <CL_GetPing.part.21+0xc>
    394c:	41 56                	push   r14
    394e:	41 89 d6             	mov    r14d,edx
    3951:	41 55                	push   r13
    3953:	49 89 cd             	mov    r13,rcx
    3956:	41 54                	push   r12
    3958:	55                   	push   rbp
    3959:	48 89 f5             	mov    rbp,rsi
    395c:	53                   	push   rbx
    395d:	48 69 df 28 04 00 00 	imul   rbx,rdi,0x428
    3964:	4d 8d 24 1f          	lea    r12,[r15+rbx*1]
    3968:	48 83 ec 08          	sub    rsp,0x8
    396c:	4c 89 e7             	mov    rdi,r12
    396f:	e8 00 00 00 00       	call   3974 <CL_GetPing.part.21+0x34>
    3974:	44 89 f2             	mov    edx,r14d
    3977:	48 89 ef             	mov    rdi,rbp
    397a:	48 89 c6             	mov    rsi,rax
    397d:	e8 00 00 00 00       	call   3982 <CL_GetPing.part.21+0x42>
    3982:	41 8b 6c 24 24       	mov    ebp,DWORD PTR [r12+0x24]
    3987:	89 ea                	mov    edx,ebp
    3989:	85 ed                	test   ebp,ebp
    398b:	74 23                	je     39b0 <CL_GetPing.part.21+0x70>
    398d:	49 8d 74 1f 28       	lea    rsi,[r15+rbx*1+0x28]
    3992:	4c 89 e7             	mov    rdi,r12
    3995:	e8 16 ee ff ff       	call   27b0 <CL_SetServerInfoByAddress>
    399a:	41 89 6d 00          	mov    DWORD PTR [r13+0x0],ebp
    399e:	48 83 c4 08          	add    rsp,0x8
    39a2:	5b                   	pop    rbx
    39a3:	5d                   	pop    rbp
    39a4:	41 5c                	pop    r12
    39a6:	41 5d                	pop    r13
    39a8:	41 5e                	pop    r14
    39aa:	41 5f                	pop    r15
    39ac:	c3                   	ret    
    39ad:	0f 1f 00             	nop    DWORD PTR [rax]
    39b0:	e8 00 00 00 00       	call   39b5 <CL_GetPing.part.21+0x75>
    39b5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 39bc <CL_GetPing.part.21+0x7c>
    39bc:	41 2b 44 24 20       	sub    eax,DWORD PTR [r12+0x20]
    39c1:	41 89 c6             	mov    r14d,eax
    39c4:	e8 00 00 00 00       	call   39c9 <CL_GetPing.part.21+0x89>
    39c9:	ba 64 00 00 00       	mov    edx,0x64
    39ce:	83 f8 64             	cmp    eax,0x64
    39d1:	0f 4d d0             	cmovge edx,eax
    39d4:	41 39 d6             	cmp    r14d,edx
    39d7:	41 8b 54 24 24       	mov    edx,DWORD PTR [r12+0x24]
    39dc:	7c af                	jl     398d <CL_GetPing.part.21+0x4d>
    39de:	44 89 f5             	mov    ebp,r14d
    39e1:	eb aa                	jmp    398d <CL_GetPing.part.21+0x4d>
    39e3:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    39ea:	00 00 00 00 
    39ee:	66 90                	xchg   ax,ax

00000000000039f0 <CL_Download.part.22>:
CL_Download.part.22():
    39f0:	41 56                	push   r14
    39f2:	41 55                	push   r13
    39f4:	41 89 d5             	mov    r13d,edx
    39f7:	41 54                	push   r12
    39f9:	49 89 fc             	mov    r12,rdi
    39fc:	55                   	push   rbp
    39fd:	53                   	push   rbx
    39fe:	48 89 f3             	mov    rbx,rsi
    3a01:	48 81 ec 00 11 00 00 	sub    rsp,0x1100
    3a08:	0f b6 06             	movzx  eax,BYTE PTR [rsi]
    3a0b:	3c 5c                	cmp    al,0x5c
    3a0d:	74 09                	je     3a18 <CL_Download.part.22+0x28>
    3a0f:	3c 2f                	cmp    al,0x2f
    3a11:	75 14                	jne    3a27 <CL_Download.part.22+0x37>
    3a13:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3a18:	48 83 c3 01          	add    rbx,0x1
    3a1c:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
    3a1f:	3c 2f                	cmp    al,0x2f
    3a21:	74 f5                	je     3a18 <CL_Download.part.22+0x28>
    3a23:	3c 5c                	cmp    al,0x5c
    3a25:	74 f1                	je     3a18 <CL_Download.part.22+0x28>
    3a27:	48 89 df             	mov    rdi,rbx
    3a2a:	be 2f 00 00 00       	mov    esi,0x2f
    3a2f:	e8 00 00 00 00       	call   3a34 <CL_Download.part.22+0x44>
    3a34:	48 8d 50 01          	lea    rdx,[rax+0x1]
    3a38:	48 85 c0             	test   rax,rax
    3a3b:	48 0f 45 da          	cmovne rbx,rdx
    3a3f:	48 89 df             	mov    rdi,rbx
    3a42:	e8 00 00 00 00       	call   3a47 <CL_Download.part.22+0x57>
    3a47:	89 c5                	mov    ebp,eax
    3a49:	85 c0                	test   eax,eax
    3a4b:	0f 84 bf 00 00 00    	je     3b10 <CL_Download.part.22+0x120>
    3a51:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3a58 <CL_Download.part.22+0x68>
    3a58:	4c 89 e7             	mov    rdi,r12
    3a5b:	e8 00 00 00 00       	call   3a60 <CL_Download.part.22+0x70>
    3a60:	85 c0                	test   eax,eax
    3a62:	74 34                	je     3a98 <CL_Download.part.22+0xa8>
    3a64:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 3a6b <CL_Download.part.22+0x7b>
    3a6b:	44 89 e9             	mov    ecx,r13d
    3a6e:	48 89 de             	mov    rsi,rbx
    3a71:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3a78 <CL_Download.part.22+0x88>
    3a78:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    3a7c:	e8 00 00 00 00       	call   3a81 <CL_Download.part.22+0x91>
    3a81:	89 c5                	mov    ebp,eax
    3a83:	48 81 c4 00 11 00 00 	add    rsp,0x1100
    3a8a:	89 e8                	mov    eax,ebp
    3a8c:	5b                   	pop    rbx
    3a8d:	5d                   	pop    rbp
    3a8e:	41 5c                	pop    r12
    3a90:	41 5d                	pop    r13
    3a92:	41 5e                	pop    r14
    3a94:	c3                   	ret    
    3a95:	0f 1f 00             	nop    DWORD PTR [rax]
    3a98:	49 89 e4             	mov    r12,rsp
    3a9b:	ba 00 01 00 00       	mov    edx,0x100
    3aa0:	48 89 de             	mov    rsi,rbx
    3aa3:	31 ed                	xor    ebp,ebp
    3aa5:	4c 89 e7             	mov    rdi,r12
    3aa8:	e8 00 00 00 00       	call   3aad <CL_Download.part.22+0xbd>
    3aad:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3ab4 <CL_Download.part.22+0xc4>
    3ab4:	4c 89 e7             	mov    rdi,r12
    3ab7:	e8 00 00 00 00       	call   3abc <CL_Download.part.22+0xcc>
    3abc:	80 3c 24 00          	cmp    BYTE PTR [rsp],0x0
    3ac0:	74 c1                	je     3a83 <CL_Download.part.22+0x93>
    3ac2:	4c 89 e6             	mov    rsi,r12
    3ac5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3acc <CL_Download.part.22+0xdc>
    3acc:	31 c0                	xor    eax,eax
    3ace:	e8 00 00 00 00       	call   3ad3 <CL_Download.part.22+0xe3>
    3ad3:	4c 8d b4 24 00 01 00 	lea    r14,[rsp+0x100]
    3ada:	00 
    3adb:	31 f6                	xor    esi,esi
    3add:	4c 89 f2             	mov    rdx,r14
    3ae0:	48 89 c7             	mov    rdi,rax
    3ae3:	e8 00 00 00 00       	call   3ae8 <CL_Download.part.22+0xf8>
    3ae8:	85 c0                	test   eax,eax
    3aea:	0f 84 74 ff ff ff    	je     3a64 <CL_Download.part.22+0x74>
    3af0:	4c 89 f2             	mov    rdx,r14
    3af3:	4c 89 e6             	mov    rsi,r12
    3af6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3afd <CL_Download.part.22+0x10d>
    3afd:	31 c0                	xor    eax,eax
    3aff:	e8 00 00 00 00       	call   3b04 <CL_Download.part.22+0x114>
    3b04:	e9 7a ff ff ff       	jmp    3a83 <CL_Download.part.22+0x93>
    3b09:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3b10:	48 89 de             	mov    rsi,rbx
    3b13:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3b1a <CL_Download.part.22+0x12a>
    3b1a:	31 c0                	xor    eax,eax
    3b1c:	e8 00 00 00 00       	call   3b21 <CL_Download.part.22+0x131>
    3b21:	e9 5d ff ff ff       	jmp    3a83 <CL_Download.part.22+0x93>
    3b26:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    3b2d:	00 00 00 

0000000000003b30 <CL_CDDialog>:
CL_CDDialog():
    3b30:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 3b3a <CL_CDDialog+0xa>
    3b37:	00 00 00 
    3b3a:	c3                   	ret    
    3b3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000003b40 <CL_AddReliableCommand>:
CL_AddReliableCommand():
    3b40:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 3b46 <CL_AddReliableCommand+0x6>
    3b46:	85 c9                	test   ecx,ecx
    3b48:	74 21                	je     3b6b <CL_AddReliableCommand+0x2b>
    3b4a:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 3b50 <CL_AddReliableCommand+0x10>
    3b50:	89 c2                	mov    edx,eax
    3b52:	2b 15 00 00 00 00    	sub    edx,DWORD PTR [rip+0x0]        # 3b58 <CL_AddReliableCommand+0x18>
    3b58:	85 f6                	test   esi,esi
    3b5a:	74 14                	je     3b70 <CL_AddReliableCommand+0x30>
    3b5c:	83 fa 40             	cmp    edx,0x40
    3b5f:	7e 0f                	jle    3b70 <CL_AddReliableCommand+0x30>
    3b61:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 3b67 <CL_AddReliableCommand+0x27>
    3b67:	85 d2                	test   edx,edx
    3b69:	74 3d                	je     3ba8 <CL_AddReliableCommand+0x68>
    3b6b:	c3                   	ret    
    3b6c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    3b70:	85 f6                	test   esi,esi
    3b72:	75 05                	jne    3b79 <CL_AddReliableCommand+0x39>
    3b74:	83 fa 3f             	cmp    edx,0x3f
    3b77:	7f e8                	jg     3b61 <CL_AddReliableCommand+0x21>
    3b79:	83 c0 01             	add    eax,0x1
    3b7c:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 3b83 <CL_AddReliableCommand+0x43>
    3b83:	48 89 fe             	mov    rsi,rdi
    3b86:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 3b8c <CL_AddReliableCommand+0x4c>
    3b8c:	83 e0 3f             	and    eax,0x3f
    3b8f:	48 c1 e0 0a          	shl    rax,0xa
    3b93:	48 8d 84 02 48 04 00 	lea    rax,[rdx+rax*1+0x448]
    3b9a:	00 
    3b9b:	ba 00 04 00 00       	mov    edx,0x400
    3ba0:	48 89 c7             	mov    rdi,rax
    3ba3:	e9 00 00 00 00       	jmp    3ba8 <CL_AddReliableCommand+0x68>
    3ba8:	50                   	push   rax
    3ba9:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3bb0 <CL_AddReliableCommand+0x70>
    3bb0:	bf 01 00 00 00       	mov    edi,0x1
    3bb5:	31 c0                	xor    eax,eax
    3bb7:	e8 00 00 00 00       	call   3bbc <CL_AddReliableCommand+0x7c>
    3bbc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003bc0 <CL_SendPureChecksums.part.14>:
CL_SendPureChecksums.part.14():
    3bc0:	55                   	push   rbp
    3bc1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3bc8 <CL_SendPureChecksums.part.14+0x8>
    3bc8:	31 c0                	xor    eax,eax
    3bca:	53                   	push   rbx
    3bcb:	48 81 ec 08 04 00 00 	sub    rsp,0x408
    3bd2:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 3bd8 <CL_SendPureChecksums.part.14+0x18>
    3bd8:	48 89 e5             	mov    rbp,rsp
    3bdb:	48 89 ef             	mov    rdi,rbp
    3bde:	e8 00 00 00 00       	call   3be3 <CL_SendPureChecksums.part.14+0x23>
    3be3:	bf fe 03 00 00       	mov    edi,0x3fe
    3be8:	89 c3                	mov    ebx,eax
    3bea:	29 c7                	sub    edi,eax
    3bec:	e8 00 00 00 00       	call   3bf1 <CL_SendPureChecksums.part.14+0x31>
    3bf1:	48 63 fb             	movsxd rdi,ebx
    3bf4:	48 01 ef             	add    rdi,rbp
    3bf7:	48 89 c6             	mov    rsi,rax
    3bfa:	e8 00 00 00 00       	call   3bff <CL_SendPureChecksums.part.14+0x3f>
    3bff:	48 89 ef             	mov    rdi,rbp
    3c02:	31 f6                	xor    esi,esi
    3c04:	e8 00 00 00 00       	call   3c09 <CL_SendPureChecksums.part.14+0x49>
    3c09:	48 81 c4 08 04 00 00 	add    rsp,0x408
    3c10:	5b                   	pop    rbx
    3c11:	5d                   	pop    rbp
    3c12:	c3                   	ret    
    3c13:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3c1a:	00 00 00 00 
    3c1e:	66 90                	xchg   ax,ax

0000000000003c20 <CL_ForwardToServer_f>:
CL_ForwardToServer_f():
    3c20:	83 3d 00 00 00 00 08 	cmp    DWORD PTR [rip+0x0],0x8        # 3c27 <CL_ForwardToServer_f+0x7>
    3c27:	75 0a                	jne    3c33 <CL_ForwardToServer_f+0x13>
    3c29:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 3c2f <CL_ForwardToServer_f+0xf>
    3c2f:	85 c0                	test   eax,eax
    3c31:	74 15                	je     3c48 <CL_ForwardToServer_f+0x28>
    3c33:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3c3a <CL_ForwardToServer_f+0x1a>
    3c3a:	31 c0                	xor    eax,eax
    3c3c:	e9 00 00 00 00       	jmp    3c41 <CL_ForwardToServer_f+0x21>
    3c41:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3c48:	48 83 ec 08          	sub    rsp,0x8
    3c4c:	e8 00 00 00 00       	call   3c51 <CL_ForwardToServer_f+0x31>
    3c51:	83 f8 01             	cmp    eax,0x1
    3c54:	7e 42                	jle    3c98 <CL_ForwardToServer_f+0x78>
    3c56:	bf 01 00 00 00       	mov    edi,0x1
    3c5b:	e8 00 00 00 00       	call   3c60 <CL_ForwardToServer_f+0x40>
    3c60:	b9 09 00 00 00       	mov    ecx,0x9
    3c65:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3c6c <CL_ForwardToServer_f+0x4c>
    3c6c:	48 89 c6             	mov    rsi,rax
    3c6f:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    3c71:	0f 97 c0             	seta   al
    3c74:	1c 00                	sbb    al,0x0
    3c76:	84 c0                	test   al,al
    3c78:	74 1e                	je     3c98 <CL_ForwardToServer_f+0x78>
    3c7a:	bf 01 00 00 00       	mov    edi,0x1
    3c7f:	e8 00 00 00 00       	call   3c84 <CL_ForwardToServer_f+0x64>
    3c84:	31 f6                	xor    esi,esi
    3c86:	48 83 c4 08          	add    rsp,0x8
    3c8a:	48 89 c7             	mov    rdi,rax
    3c8d:	e9 ae fe ff ff       	jmp    3b40 <CL_AddReliableCommand>
    3c92:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3c98:	48 83 c4 08          	add    rsp,0x8
    3c9c:	c3                   	ret    
    3c9d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003ca0 <CL_ShutdownAll>:
CL_ShutdownAll():
    3ca0:	48 83 ec 08          	sub    rsp,0x8
    3ca4:	e8 00 00 00 00       	call   3ca9 <CL_ShutdownAll+0x9>
    3ca9:	e8 00 00 00 00       	call   3cae <CL_ShutdownAll+0xe>
    3cae:	e8 00 00 00 00       	call   3cb3 <CL_ShutdownAll+0x13>
    3cb3:	e8 00 00 00 00       	call   3cb8 <CL_ShutdownAll+0x18>
    3cb8:	48 83 3d 00 00 00 00 	cmp    QWORD PTR [rip+0x0],0x0        # 3cc0 <CL_ShutdownAll+0x20>
    3cbf:	00 
    3cc0:	74 11                	je     3cd3 <CL_ShutdownAll+0x33>
    3cc2:	e8 00 00 00 00       	call   3cc7 <CL_ShutdownAll+0x27>
    3cc7:	85 c0                	test   eax,eax
    3cc9:	75 25                	jne    3cf0 <CL_ShutdownAll+0x50>
    3ccb:	31 ff                	xor    edi,edi
    3ccd:	ff 15 00 00 00 00    	call   QWORD PTR [rip+0x0]        # 3cd3 <CL_ShutdownAll+0x33>
    3cd3:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3cdd <CL_ShutdownAll+0x3d>
    3cda:	00 00 00 
    3cdd:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3ce7 <CL_ShutdownAll+0x47>
    3ce4:	00 00 00 
    3ce7:	48 83 c4 08          	add    rsp,0x8
    3ceb:	e9 00 00 00 00       	jmp    3cf0 <CL_ShutdownAll+0x50>
    3cf0:	bf 02 00 00 00       	mov    edi,0x2
    3cf5:	e8 56 c8 ff ff       	call   550 <CL_ShutdownRef>
    3cfa:	eb d7                	jmp    3cd3 <CL_ShutdownAll+0x33>
    3cfc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003d00 <CL_ClearMemory>:
CL_ClearMemory():
    3d00:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 3d07 <CL_ClearMemory+0x7>
    3d07:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    3d0a:	85 c0                	test   eax,eax
    3d0c:	75 12                	jne    3d20 <CL_ClearMemory+0x20>
    3d0e:	48 83 ec 08          	sub    rsp,0x8
    3d12:	e8 00 00 00 00       	call   3d17 <CL_ClearMemory+0x17>
    3d17:	48 83 c4 08          	add    rsp,0x8
    3d1b:	e9 00 00 00 00       	jmp    3d20 <CL_ClearMemory+0x20>
    3d20:	e9 00 00 00 00       	jmp    3d25 <CL_ClearMemory+0x25>
    3d25:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3d2c:	00 00 00 00 

0000000000003d30 <CL_Vid_Restart>:
CL_Vid_Restart():
    3d30:	53                   	push   rbx
    3d31:	89 fb                	mov    ebx,edi
    3d33:	e8 00 00 00 00       	call   3d38 <CL_Vid_Restart+0x8>
    3d38:	85 c0                	test   eax,eax
    3d3a:	0f 85 08 01 00 00    	jne    3e48 <CL_Vid_Restart+0x118>
    3d40:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # 3d47 <CL_Vid_Restart+0x17>
    3d47:	45 85 c0             	test   r8d,r8d
    3d4a:	0f 85 e8 00 00 00    	jne    3e38 <CL_Vid_Restart+0x108>
    3d50:	e8 00 00 00 00       	call   3d55 <CL_Vid_Restart+0x25>
    3d55:	e8 00 00 00 00       	call   3d5a <CL_Vid_Restart+0x2a>
    3d5a:	e8 00 00 00 00       	call   3d5f <CL_Vid_Restart+0x2f>
    3d5f:	85 db                	test   ebx,ebx
    3d61:	b8 02 00 00 00       	mov    eax,0x2
    3d66:	0f 44 d8             	cmove  ebx,eax
    3d69:	89 df                	mov    edi,ebx
    3d6b:	e8 e0 c7 ff ff       	call   550 <CL_ShutdownRef>
    3d70:	31 f6                	xor    esi,esi
    3d72:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3d79 <CL_Vid_Restart+0x49>
    3d79:	e8 00 00 00 00       	call   3d7e <CL_Vid_Restart+0x4e>
    3d7e:	bf 06 00 00 00       	mov    edi,0x6
    3d83:	e8 00 00 00 00       	call   3d88 <CL_Vid_Restart+0x58>
    3d88:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 3d8e <CL_Vid_Restart+0x5e>
    3d8e:	85 ff                	test   edi,edi
    3d90:	0f 84 8a 00 00 00    	je     3e20 <CL_Vid_Restart+0xf0>
    3d96:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3d9d <CL_Vid_Restart+0x6d>
    3d9d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3da4 <CL_Vid_Restart+0x74>
    3da4:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3dae <CL_Vid_Restart+0x7e>
    3dab:	00 00 00 
    3dae:	e8 00 00 00 00       	call   3db3 <CL_Vid_Restart+0x83>
    3db3:	e8 00 00 00 00       	call   3db8 <CL_Vid_Restart+0x88>
    3db8:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 3dbf <CL_Vid_Restart+0x8f>
    3dbf:	48 85 c0             	test   rax,rax
    3dc2:	74 0c                	je     3dd0 <CL_Vid_Restart+0xa0>
    3dc4:	8b 70 30             	mov    esi,DWORD PTR [rax+0x30]
    3dc7:	85 f6                	test   esi,esi
    3dc9:	74 05                	je     3dd0 <CL_Vid_Restart+0xa0>
    3dcb:	e8 60 f9 ff ff       	call   3730 <CL_StartHunkUsers.part.18>
    3dd0:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 3dd6 <CL_Vid_Restart+0xa6>
    3dd6:	83 f8 05             	cmp    eax,0x5
    3dd9:	76 05                	jbe    3de0 <CL_Vid_Restart+0xb0>
    3ddb:	83 f8 09             	cmp    eax,0x9
    3dde:	75 0a                	jne    3dea <CL_Vid_Restart+0xba>
    3de0:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 3de6 <CL_Vid_Restart+0xb6>
    3de6:	85 c9                	test   ecx,ecx
    3de8:	74 28                	je     3e12 <CL_Vid_Restart+0xe2>
    3dea:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 3df4 <CL_Vid_Restart+0xc4>
    3df1:	00 00 00 
    3df4:	e8 00 00 00 00       	call   3df9 <CL_Vid_Restart+0xc9>
    3df9:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 3dff <CL_Vid_Restart+0xcf>
    3dff:	85 d2                	test   edx,edx
    3e01:	74 0f                	je     3e12 <CL_Vid_Restart+0xe2>
    3e03:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 3e09 <CL_Vid_Restart+0xd9>
    3e09:	85 c0                	test   eax,eax
    3e0b:	75 05                	jne    3e12 <CL_Vid_Restart+0xe2>
    3e0d:	e8 ae fd ff ff       	call   3bc0 <CL_SendPureChecksums.part.14>
    3e12:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3e1c <CL_Vid_Restart+0xec>
    3e19:	00 00 00 
    3e1c:	5b                   	pop    rbx
    3e1d:	c3                   	ret    
    3e1e:	66 90                	xchg   ax,ax
    3e20:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 3e26 <CL_Vid_Restart+0xf6>
    3e26:	31 f6                	xor    esi,esi
    3e28:	e8 00 00 00 00       	call   3e2d <CL_Vid_Restart+0xfd>
    3e2d:	e9 64 ff ff ff       	jmp    3d96 <CL_Vid_Restart+0x66>
    3e32:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3e38:	e8 00 00 00 00       	call   3e3d <CL_Vid_Restart+0x10d>
    3e3d:	e9 0e ff ff ff       	jmp    3d50 <CL_Vid_Restart+0x20>
    3e42:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3e48:	e8 00 00 00 00       	call   3e4d <CL_Vid_Restart+0x11d>
    3e4d:	e9 ee fe ff ff       	jmp    3d40 <CL_Vid_Restart+0x10>
    3e52:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3e59:	00 00 00 00 
    3e5d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003e60 <CL_Vid_Restart_f>:
CL_Vid_Restart_f():
    3e60:	53                   	push   rbx
    3e61:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 3e67 <CL_Vid_Restart_f+0x7>
    3e67:	85 db                	test   ebx,ebx
    3e69:	74 18                	je     3e83 <CL_Vid_Restart_f+0x23>
    3e6b:	e8 00 00 00 00       	call   3e70 <CL_Vid_Restart_f+0x10>
    3e70:	29 c3                	sub    ebx,eax
    3e72:	89 d8                	mov    eax,ebx
    3e74:	c1 f8 1f             	sar    eax,0x1f
    3e77:	31 c3                	xor    ebx,eax
    3e79:	29 c3                	sub    ebx,eax
    3e7b:	81 fb f3 01 00 00    	cmp    ebx,0x1f3
    3e81:	7e 3d                	jle    3ec0 <CL_Vid_Restart_f+0x60>
    3e83:	bf 01 00 00 00       	mov    edi,0x1
    3e88:	e8 00 00 00 00       	call   3e8d <CL_Vid_Restart_f+0x2d>
    3e8d:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 3e94 <CL_Vid_Restart_f+0x34>
    3e94:	48 89 c7             	mov    rdi,rax
    3e97:	e8 00 00 00 00       	call   3e9c <CL_Vid_Restart_f+0x3c>
    3e9c:	85 c0                	test   eax,eax
    3e9e:	75 10                	jne    3eb0 <CL_Vid_Restart_f+0x50>
    3ea0:	bf 01 00 00 00       	mov    edi,0x1
    3ea5:	5b                   	pop    rbx
    3ea6:	e9 85 fe ff ff       	jmp    3d30 <CL_Vid_Restart>
    3eab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    3eb0:	31 ff                	xor    edi,edi
    3eb2:	5b                   	pop    rbx
    3eb3:	e9 78 fe ff ff       	jmp    3d30 <CL_Vid_Restart>
    3eb8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    3ebf:	00 
    3ec0:	5b                   	pop    rbx
    3ec1:	c3                   	ret    
    3ec2:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3ec9:	00 00 00 00 
    3ecd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003ed0 <CL_Snd_Restart_f>:
CL_Snd_Restart_f():
    3ed0:	48 83 ec 08          	sub    rsp,0x8
    3ed4:	e8 00 00 00 00       	call   3ed9 <CL_Snd_Restart_f+0x9>
    3ed9:	bf 01 00 00 00       	mov    edi,0x1
    3ede:	48 83 c4 08          	add    rsp,0x8
    3ee2:	e9 49 fe ff ff       	jmp    3d30 <CL_Vid_Restart>
    3ee7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3eee:	00 00 

0000000000003ef0 <CL_FlushMemory>:
CL_FlushMemory():
    3ef0:	48 83 ec 08          	sub    rsp,0x8
    3ef4:	e8 00 00 00 00       	call   3ef9 <CL_FlushMemory+0x9>
    3ef9:	e8 00 00 00 00       	call   3efe <CL_FlushMemory+0xe>
    3efe:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 3f05 <CL_FlushMemory+0x15>
    3f05:	48 85 c0             	test   rax,rax
    3f08:	74 16                	je     3f20 <CL_FlushMemory+0x30>
    3f0a:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    3f0d:	85 c0                	test   eax,eax
    3f0f:	74 0f                	je     3f20 <CL_FlushMemory+0x30>
    3f11:	48 83 c4 08          	add    rsp,0x8
    3f15:	e9 16 f8 ff ff       	jmp    3730 <CL_StartHunkUsers.part.18>
    3f1a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    3f20:	48 83 c4 08          	add    rsp,0x8
    3f24:	c3                   	ret    
    3f25:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    3f2c:	00 00 00 00 

0000000000003f30 <CL_DownloadsComplete>:
CL_DownloadsComplete():
    3f30:	48 83 ec 08          	sub    rsp,0x8
    3f34:	44 8b 0d 00 00 00 00 	mov    r9d,DWORD PTR [rip+0x0]        # 3f3b <CL_DownloadsComplete+0xb>
    3f3b:	45 85 c9             	test   r9d,r9d
    3f3e:	75 30                	jne    3f70 <CL_DownloadsComplete+0x40>
    3f40:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 3f46 <CL_DownloadsComplete+0x16>
    3f46:	85 f6                	test   esi,esi
    3f48:	75 66                	jne    3fb0 <CL_DownloadsComplete+0x80>
    3f4a:	c7 05 00 00 00 00 06 	mov    DWORD PTR [rip+0x0],0x6        # 3f54 <CL_DownloadsComplete+0x24>
    3f51:	00 00 00 
    3f54:	e8 00 00 00 00       	call   3f59 <CL_DownloadsComplete+0x29>
    3f59:	83 3d 00 00 00 00 06 	cmp    DWORD PTR [rip+0x0],0x6        # 3f60 <CL_DownloadsComplete+0x30>
    3f60:	74 7e                	je     3fe0 <CL_DownloadsComplete+0xb0>
    3f62:	48 83 c4 08          	add    rsp,0x8
    3f66:	c3                   	ret    
    3f67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3f6e:	00 00 
    3f70:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3f7a <CL_DownloadsComplete+0x4a>
    3f77:	00 00 00 
    3f7a:	e8 00 00 00 00       	call   3f7f <CL_DownloadsComplete+0x4f>
    3f7f:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # 3f86 <CL_DownloadsComplete+0x56>
    3f86:	45 85 c0             	test   r8d,r8d
    3f89:	74 b5                	je     3f40 <CL_DownloadsComplete+0x10>
    3f8b:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 3f91 <CL_DownloadsComplete+0x61>
    3f91:	85 ff                	test   edi,edi
    3f93:	0f 85 bf 00 00 00    	jne    4058 <CL_DownloadsComplete+0x128>
    3f99:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3fa3 <CL_DownloadsComplete+0x73>
    3fa0:	00 00 00 
    3fa3:	48 83 c4 08          	add    rsp,0x8
    3fa7:	e9 94 e6 ff ff       	jmp    2640 <CL_Reconnect_f>
    3fac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    3fb0:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 3fba <CL_DownloadsComplete+0x8a>
    3fb7:	00 00 00 
    3fba:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 3fc0 <CL_DownloadsComplete+0x90>
    3fc0:	e8 00 00 00 00       	call   3fc5 <CL_DownloadsComplete+0x95>
    3fc5:	31 f6                	xor    esi,esi
    3fc7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 3fce <CL_DownloadsComplete+0x9e>
    3fce:	48 83 c4 08          	add    rsp,0x8
    3fd2:	e9 69 fb ff ff       	jmp    3b40 <CL_AddReliableCommand>
    3fd7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3fde:	00 00 
    3fe0:	e8 00 00 00 00       	call   3fe5 <CL_DownloadsComplete+0xb5>
    3fe5:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 3fef <CL_DownloadsComplete+0xbf>
    3fec:	00 00 00 
    3fef:	e8 00 00 00 00       	call   3ff4 <CL_DownloadsComplete+0xc4>
    3ff4:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 3ffa <CL_DownloadsComplete+0xca>
    3ffa:	85 c9                	test   ecx,ecx
    3ffc:	74 32                	je     4030 <CL_DownloadsComplete+0x100>
    3ffe:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 4004 <CL_DownloadsComplete+0xd4>
    4004:	85 d2                	test   edx,edx
    4006:	74 0f                	je     4017 <CL_DownloadsComplete+0xe7>
    4008:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 400e <CL_DownloadsComplete+0xde>
    400e:	85 c0                	test   eax,eax
    4010:	75 05                	jne    4017 <CL_DownloadsComplete+0xe7>
    4012:	e8 a9 fb ff ff       	call   3bc0 <CL_SendPureChecksums.part.14>
    4017:	e8 00 00 00 00       	call   401c <CL_DownloadsComplete+0xec>
    401c:	e8 00 00 00 00       	call   4021 <CL_DownloadsComplete+0xf1>
    4021:	48 83 c4 08          	add    rsp,0x8
    4025:	e9 00 00 00 00       	jmp    402a <CL_DownloadsComplete+0xfa>
    402a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    4030:	31 f6                	xor    esi,esi
    4032:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4039 <CL_DownloadsComplete+0x109>
    4039:	e8 00 00 00 00       	call   403e <CL_DownloadsComplete+0x10e>
    403e:	48 8d 35 2b e7 ff ff 	lea    rsi,[rip+0xffffffffffffe72b]        # 2770 <CL_CompleteCallvote>
    4045:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 404c <CL_DownloadsComplete+0x11c>
    404c:	e8 00 00 00 00       	call   4051 <CL_DownloadsComplete+0x121>
    4051:	eb ab                	jmp    3ffe <CL_DownloadsComplete+0xce>
    4053:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    4058:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 405e <CL_DownloadsComplete+0x12e>
    405e:	e8 00 00 00 00       	call   4063 <CL_DownloadsComplete+0x133>
    4063:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 406d <CL_DownloadsComplete+0x13d>
    406a:	00 00 00 
    406d:	e9 27 ff ff ff       	jmp    3f99 <CL_DownloadsComplete+0x69>
    4072:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    4079:	00 00 00 00 
    407d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000004080 <CL_ClearState>:
CL_ClearState():
    4080:	ba cc e0 1d 00       	mov    edx,0x1de0cc
    4085:	31 f6                	xor    esi,esi
    4087:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 408e <CL_ClearState+0xe>
    408e:	e9 00 00 00 00       	jmp    4093 <CL_ClearState+0x13>
    4093:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    409a:	00 00 00 00 
    409e:	66 90                	xchg   ax,ax

00000000000040a0 <CL_ResetOldGame>:
CL_ResetOldGame():
    40a0:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 40aa <CL_ResetOldGame+0xa>
    40a7:	00 00 00 
    40aa:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 40b1 <CL_ResetOldGame+0x11>
    40b1:	c3                   	ret    
    40b2:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    40b9:	00 00 00 00 
    40bd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000000040c0 <CL_Disconnect>:
CL_Disconnect():
    40c0:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 40c7 <CL_Disconnect+0x7>
    40c7:	53                   	push   rbx
    40c8:	31 db                	xor    ebx,ebx
    40ca:	48 85 c0             	test   rax,rax
    40cd:	0f 84 7f 01 00 00    	je     4252 <CL_Disconnect+0x192>
    40d3:	44 8b 40 30          	mov    r8d,DWORD PTR [rax+0x30]
    40d7:	45 85 c0             	test   r8d,r8d
    40da:	0f 84 72 01 00 00    	je     4252 <CL_Disconnect+0x192>
    40e0:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 40e6 <CL_Disconnect+0x26>
    40e6:	85 f6                	test   esi,esi
    40e8:	0f 85 64 01 00 00    	jne    4252 <CL_Disconnect+0x192>
    40ee:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 40f4 <CL_Disconnect+0x34>
    40f4:	89 fb                	mov    ebx,edi
    40f6:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 4100 <CL_Disconnect+0x40>
    40fd:	00 00 00 
    4100:	85 c9                	test   ecx,ecx
    4102:	0f 85 c8 01 00 00    	jne    42d0 <CL_Disconnect+0x210>
    4108:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 410e <CL_Disconnect+0x4e>
    410e:	85 ff                	test   edi,edi
    4110:	0f 85 cd 01 00 00    	jne    42e3 <CL_Disconnect+0x223>
    4116:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 411c <CL_Disconnect+0x5c>
    411c:	85 ff                	test   edi,edi
    411e:	0f 85 dc 01 00 00    	jne    4300 <CL_Disconnect+0x240>
    4124:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 412b <CL_Disconnect+0x6b>
    412b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4132 <CL_Disconnect+0x72>
    4132:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 4139 <CL_Disconnect+0x79>
    4139:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 4140 <CL_Disconnect+0x80>
    4140:	e8 00 00 00 00       	call   4145 <CL_Disconnect+0x85>
    4145:	e8 00 00 00 00       	call   414a <CL_Disconnect+0x8a>
    414a:	85 c0                	test   eax,eax
    414c:	0f 85 c6 01 00 00    	jne    4318 <CL_Disconnect+0x258>
    4152:	48 83 3d 00 00 00 00 	cmp    QWORD PTR [rip+0x0],0x0        # 415a <CL_Disconnect+0x9a>
    4159:	00 
    415a:	74 05                	je     4161 <CL_Disconnect+0xa1>
    415c:	e8 00 00 00 00       	call   4161 <CL_Disconnect+0xa1>
    4161:	e8 00 00 00 00       	call   4166 <CL_Disconnect+0xa6>
    4166:	e8 00 00 00 00       	call   416b <CL_Disconnect+0xab>
    416b:	e8 00 00 00 00       	call   4170 <CL_Disconnect+0xb0>
    4170:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 4177 <CL_Disconnect+0xb7>
    4177:	85 db                	test   ebx,ebx
    4179:	74 09                	je     4184 <CL_Disconnect+0xc4>
    417b:	48 85 ff             	test   rdi,rdi
    417e:	0f 85 dc 00 00 00    	jne    4260 <CL_Disconnect+0x1a0>
    4184:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 418b <CL_Disconnect+0xcb>
    418b:	48 89 f7             	mov    rdi,rsi
    418e:	e8 00 00 00 00       	call   4193 <CL_Disconnect+0xd3>
    4193:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 419a <CL_Disconnect+0xda>
    419a:	48 89 f7             	mov    rdi,rsi
    419d:	e8 00 00 00 00       	call   41a2 <CL_Disconnect+0xe2>
    41a2:	bf 07 00 00 00       	mov    edi,0x7
    41a7:	e8 00 00 00 00       	call   41ac <CL_Disconnect+0xec>
    41ac:	e8 00 00 00 00       	call   41b1 <CL_Disconnect+0xf1>
    41b1:	89 c3                	mov    ebx,eax
    41b3:	85 c0                	test   eax,eax
    41b5:	0f 85 05 01 00 00    	jne    42c0 <CL_Disconnect+0x200>
    41bb:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 41c1 <CL_Disconnect+0x101>
    41c1:	83 f8 04             	cmp    eax,0x4
    41c4:	76 13                	jbe    41d9 <CL_Disconnect+0x119>
    41c6:	83 f8 09             	cmp    eax,0x9
    41c9:	74 0e                	je     41d9 <CL_Disconnect+0x119>
    41cb:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 41d1 <CL_Disconnect+0x111>
    41d1:	85 d2                	test   edx,edx
    41d3:	0f 84 57 01 00 00    	je     4330 <CL_Disconnect+0x270>
    41d9:	ba cc e0 1d 00       	mov    edx,0x1de0cc
    41de:	31 f6                	xor    esi,esi
    41e0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 41e7 <CL_Disconnect+0x127>
    41e7:	e8 00 00 00 00       	call   41ec <CL_Disconnect+0x12c>
    41ec:	ba c8 f7 02 00       	mov    edx,0x2f7c8
    41f1:	31 f6                	xor    esi,esi
    41f3:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 41fa <CL_Disconnect+0x13a>
    41fa:	e8 00 00 00 00       	call   41ff <CL_Disconnect+0x13f>
    41ff:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4206 <CL_Disconnect+0x146>
    4206:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 420d <CL_Disconnect+0x14d>
    420d:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 4217 <CL_Disconnect+0x157>
    4214:	00 00 00 
    4217:	e8 00 00 00 00       	call   421c <CL_Disconnect+0x15c>
    421c:	31 f6                	xor    esi,esi
    421e:	31 ff                	xor    edi,edi
    4220:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 422a <CL_Disconnect+0x16a>
    4227:	00 00 00 
    422a:	e8 61 c8 ff ff       	call   a90 <CL_UpdateGUID>
    422f:	e8 00 00 00 00       	call   4234 <CL_Disconnect+0x174>
    4234:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 423a <CL_Disconnect+0x17a>
    423a:	85 c0                	test   eax,eax
    423c:	74 42                	je     4280 <CL_Disconnect+0x1c0>
    423e:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 4248 <CL_Disconnect+0x188>
    4245:	00 00 00 
    4248:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 4252 <CL_Disconnect+0x192>
    424f:	00 00 00 
    4252:	89 d8                	mov    eax,ebx
    4254:	5b                   	pop    rbx
    4255:	c3                   	ret    
    4256:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    425d:	00 00 00 
    4260:	31 c9                	xor    ecx,ecx
    4262:	ba 07 00 00 00       	mov    edx,0x7
    4267:	be 01 00 00 00       	mov    esi,0x1
    426c:	31 c0                	xor    eax,eax
    426e:	e8 00 00 00 00       	call   4273 <CL_Disconnect+0x1b3>
    4273:	e9 0c ff ff ff       	jmp    4184 <CL_Disconnect+0xc4>
    4278:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    427f:	00 
    4280:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 4286 <CL_Disconnect+0x1c6>
    4286:	85 db                	test   ebx,ebx
    4288:	74 be                	je     4248 <CL_Disconnect+0x188>
    428a:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4291 <CL_Disconnect+0x1d1>
    4291:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4298 <CL_Disconnect+0x1d8>
    4298:	bb 01 00 00 00       	mov    ebx,0x1
    429d:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 42a7 <CL_Disconnect+0x1e7>
    42a4:	00 00 00 
    42a7:	e8 00 00 00 00       	call   42ac <CL_Disconnect+0x1ec>
    42ac:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 42b2 <CL_Disconnect+0x1f2>
    42b2:	be 01 00 00 00       	mov    esi,0x1
    42b7:	e8 00 00 00 00       	call   42bc <CL_Disconnect+0x1fc>
    42bc:	eb 8a                	jmp    4248 <CL_Disconnect+0x188>
    42be:	66 90                	xchg   ax,ax
    42c0:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 42ca <CL_Disconnect+0x20a>
    42c7:	00 00 00 
    42ca:	31 db                	xor    ebx,ebx
    42cc:	89 d8                	mov    eax,ebx
    42ce:	5b                   	pop    rbx
    42cf:	c3                   	ret    
    42d0:	e8 00 00 00 00       	call   42d5 <CL_Disconnect+0x215>
    42d5:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 42db <CL_Disconnect+0x21b>
    42db:	85 ff                	test   edi,edi
    42dd:	0f 84 33 fe ff ff    	je     4116 <CL_Disconnect+0x56>
    42e3:	e8 00 00 00 00       	call   42e8 <CL_Disconnect+0x228>
    42e8:	8b 3d 00 00 00 00    	mov    edi,DWORD PTR [rip+0x0]        # 42ee <CL_Disconnect+0x22e>
    42ee:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 42f8 <CL_Disconnect+0x238>
    42f5:	00 00 00 
    42f8:	85 ff                	test   edi,edi
    42fa:	0f 84 24 fe ff ff    	je     4124 <CL_Disconnect+0x64>
    4300:	e8 00 00 00 00       	call   4305 <CL_Disconnect+0x245>
    4305:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 430f <CL_Disconnect+0x24f>
    430c:	00 00 00 
    430f:	e9 10 fe ff ff       	jmp    4124 <CL_Disconnect+0x64>
    4314:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    4318:	83 05 00 00 00 00 01 	add    DWORD PTR [rip+0x0],0x1        # 431f <CL_Disconnect+0x25f>
    431f:	e8 00 00 00 00       	call   4324 <CL_Disconnect+0x264>
    4324:	e8 00 00 00 00       	call   4329 <CL_Disconnect+0x269>
    4329:	e9 24 fe ff ff       	jmp    4152 <CL_Disconnect+0x92>
    432e:	66 90                	xchg   ax,ax
    4330:	be 01 00 00 00       	mov    esi,0x1
    4335:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 433c <CL_Disconnect+0x27c>
    433c:	e8 00 00 00 00       	call   4341 <CL_Disconnect+0x281>
    4341:	e8 00 00 00 00       	call   4346 <CL_Disconnect+0x286>
    4346:	e8 00 00 00 00       	call   434b <CL_Disconnect+0x28b>
    434b:	e8 00 00 00 00       	call   4350 <CL_Disconnect+0x290>
    4350:	e9 84 fe ff ff       	jmp    41d9 <CL_Disconnect+0x119>
    4355:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    435c:	00 00 00 00 

0000000000004360 <CL_DemoCompleted>:
CL_DemoCompleted():
    4360:	53                   	push   rbx
    4361:	48 81 ec 00 01 00 00 	sub    rsp,0x100
    4368:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 436f <CL_DemoCompleted+0xf>
    436f:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    4372:	85 c0                	test   eax,eax
    4374:	75 72                	jne    43e8 <CL_DemoCompleted+0x88>
    4376:	bf 01 00 00 00       	mov    edi,0x1
    437b:	48 89 e3             	mov    rbx,rsp
    437e:	e8 00 00 00 00       	call   4383 <CL_DemoCompleted+0x23>
    4383:	ba 00 01 00 00       	mov    edx,0x100
    4388:	48 89 de             	mov    rsi,rbx
    438b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4392 <CL_DemoCompleted+0x32>
    4392:	e8 00 00 00 00       	call   4397 <CL_DemoCompleted+0x37>
    4397:	31 c0                	xor    eax,eax
    4399:	48 89 de             	mov    rsi,rbx
    439c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 43a3 <CL_DemoCompleted+0x43>
    43a3:	e8 00 00 00 00       	call   43a8 <CL_DemoCompleted+0x48>
    43a8:	80 3c 24 00          	cmp    BYTE PTR [rsp],0x0
    43ac:	74 2c                	je     43da <CL_DemoCompleted+0x7a>
    43ae:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 43b5 <CL_DemoCompleted+0x55>
    43b5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 43bc <CL_DemoCompleted+0x5c>
    43bc:	e8 00 00 00 00       	call   43c1 <CL_DemoCompleted+0x61>
    43c1:	48 89 df             	mov    rdi,rbx
    43c4:	e8 00 00 00 00       	call   43c9 <CL_DemoCompleted+0x69>
    43c9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 43d0 <CL_DemoCompleted+0x70>
    43d0:	e8 00 00 00 00       	call   43d5 <CL_DemoCompleted+0x75>
    43d5:	e8 00 00 00 00       	call   43da <CL_DemoCompleted+0x7a>
    43da:	48 81 c4 00 01 00 00 	add    rsp,0x100
    43e1:	5b                   	pop    rbx
    43e2:	c3                   	ret    
    43e3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    43e8:	e8 00 00 00 00       	call   43ed <CL_DemoCompleted+0x8d>
    43ed:	2b 05 00 00 00 00    	sub    eax,DWORD PTR [rip+0x0]        # 43f3 <CL_DemoCompleted+0x93>
    43f3:	85 c0                	test   eax,eax
    43f5:	0f 8e 7b ff ff ff    	jle    4376 <CL_DemoCompleted+0x16>
    43fb:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 4401 <CL_DemoCompleted+0xa1>
    4401:	66 0f ef c9          	pxor   xmm1,xmm1
    4405:	66 0f ef d2          	pxor   xmm2,xmm2
    4409:	31 d2                	xor    edx,edx
    440b:	f2 0f 2a d0          	cvtsi2sd xmm2,eax
    440f:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 4417 <CL_DemoCompleted+0xb7>
    4416:	00 
    4417:	3d 11 27 00 00       	cmp    eax,0x2711
    441c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4423 <CL_DemoCompleted+0xc3>
    4423:	f2 0f 2a ce          	cvtsi2sd xmm1,esi
    4427:	0f 9c c2             	setl   dl
    442a:	b8 02 00 00 00       	mov    eax,0x2
    442f:	83 c2 01             	add    edx,0x1
    4432:	66 0f 28 da          	movapd xmm3,xmm2
    4436:	f2 0f 59 c8          	mulsd  xmm1,xmm0
    443a:	f2 0f 5e d8          	divsd  xmm3,xmm0
    443e:	f2 0f 5e ca          	divsd  xmm1,xmm2
    4442:	66 0f 28 c3          	movapd xmm0,xmm3
    4446:	e8 00 00 00 00       	call   444b <CL_DemoCompleted+0xeb>
    444b:	e9 26 ff ff ff       	jmp    4376 <CL_DemoCompleted+0x16>

0000000000004450 <CL_ReadDemoMessage>:
CL_ReadDemoMessage():
    4450:	41 57                	push   r15
    4452:	41 56                	push   r14
    4454:	41 55                	push   r13
    4456:	41 54                	push   r12
    4458:	55                   	push   rbp
    4459:	53                   	push   rbx
    445a:	48 81 ec b8 80 00 00 	sub    rsp,0x80b8
    4461:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 4467 <CL_ReadDemoMessage+0x17>
    4467:	85 d2                	test   edx,edx
    4469:	74 14                	je     447f <CL_ReadDemoMessage+0x2f>
    446b:	48 8d 7c 24 28       	lea    rdi,[rsp+0x28]
    4470:	be 04 00 00 00       	mov    esi,0x4
    4475:	e8 00 00 00 00       	call   447a <CL_ReadDemoMessage+0x2a>
    447a:	83 f8 04             	cmp    eax,0x4
    447d:	74 21                	je     44a0 <CL_ReadDemoMessage+0x50>
    447f:	e8 dc fe ff ff       	call   4360 <CL_DemoCompleted>
    4484:	48 81 c4 b8 80 00 00 	add    rsp,0x80b8
    448b:	5b                   	pop    rbx
    448c:	5d                   	pop    rbp
    448d:	41 5c                	pop    r12
    448f:	41 5d                	pop    r13
    4491:	41 5e                	pop    r14
    4493:	41 5f                	pop    r15
    4495:	c3                   	ret    
    4496:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    449d:	00 00 00 
    44a0:	8b 44 24 28          	mov    eax,DWORD PTR [rsp+0x28]
    44a4:	48 8d 5c 24 30       	lea    rbx,[rsp+0x30]
    44a9:	ba 00 40 00 00       	mov    edx,0x4000
    44ae:	48 8d b4 24 90 00 00 	lea    rsi,[rsp+0x90]
    44b5:	00 
    44b6:	48 89 df             	mov    rdi,rbx
    44b9:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 44bf <CL_ReadDemoMessage+0x6f>
    44bf:	e8 00 00 00 00       	call   44c4 <CL_ReadDemoMessage+0x74>
    44c4:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 44ca <CL_ReadDemoMessage+0x7a>
    44ca:	48 8d 7b 20          	lea    rdi,[rbx+0x20]
    44ce:	be 04 00 00 00       	mov    esi,0x4
    44d3:	e8 00 00 00 00       	call   44d8 <CL_ReadDemoMessage+0x88>
    44d8:	83 f8 04             	cmp    eax,0x4
    44db:	75 a2                	jne    447f <CL_ReadDemoMessage+0x2f>
    44dd:	8b 74 24 50          	mov    esi,DWORD PTR [rsp+0x50]
    44e1:	83 fe ff             	cmp    esi,0xffffffff
    44e4:	74 99                	je     447f <CL_ReadDemoMessage+0x2f>
    44e6:	3b 74 24 48          	cmp    esi,DWORD PTR [rsp+0x48]
    44ea:	0f 8f fb 04 00 00    	jg     49eb <CL_ReadDemoMessage+0x59b>
    44f0:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 44f6 <CL_ReadDemoMessage+0xa6>
    44f6:	48 8b 7c 24 40       	mov    rdi,QWORD PTR [rsp+0x40]
    44fb:	e8 00 00 00 00       	call   4500 <CL_ReadDemoMessage+0xb0>
    4500:	39 44 24 50          	cmp    DWORD PTR [rsp+0x50],eax
    4504:	74 1a                	je     4520 <CL_ReadDemoMessage+0xd0>
    4506:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 450d <CL_ReadDemoMessage+0xbd>
    450d:	31 c0                	xor    eax,eax
    450f:	e8 00 00 00 00       	call   4514 <CL_ReadDemoMessage+0xc4>
    4514:	e9 66 ff ff ff       	jmp    447f <CL_ReadDemoMessage+0x2f>
    4519:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    4520:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 4526 <CL_ReadDemoMessage+0xd6>
    4526:	48 89 df             	mov    rdi,rbx
    4529:	c7 44 24 54 00 00 00 	mov    DWORD PTR [rsp+0x54],0x0
    4530:	00 
    4531:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 4537 <CL_ReadDemoMessage+0xe7>
    4537:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 453d <CL_ReadDemoMessage+0xed>
    453d:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 4543 <CL_ReadDemoMessage+0xf3>
    4543:	e8 00 00 00 00       	call   4548 <CL_ReadDemoMessage+0xf8>
    4548:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 454e <CL_ReadDemoMessage+0xfe>
    454e:	85 f6                	test   esi,esi
    4550:	0f 84 2e ff ff ff    	je     4484 <CL_ReadDemoMessage+0x34>
    4556:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 455c <CL_ReadDemoMessage+0x10c>
    455c:	41 89 d5             	mov    r13d,edx
    455f:	41 83 e5 01          	and    r13d,0x1
    4563:	0f 85 77 02 00 00    	jne    47e0 <CL_ReadDemoMessage+0x390>
    4569:	83 e2 06             	and    edx,0x6
    456c:	0f 84 12 ff ff ff    	je     4484 <CL_ReadDemoMessage+0x34>
    4572:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 4578 <CL_ReadDemoMessage+0x128>
    4578:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 457e <CL_ReadDemoMessage+0x12e>
    457e:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 4585 <CL_ReadDemoMessage+0x135>
    4585:	89 d8                	mov    eax,ebx
    4587:	31 db                	xor    ebx,ebx
    4589:	83 e0 1f             	and    eax,0x1f
    458c:	49 89 c6             	mov    r14,rax
    458f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
    4594:	49 c1 e6 04          	shl    r14,0x4
    4598:	49 01 c6             	add    r14,rax
    459b:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 45a2 <CL_ReadDemoMessage+0x152>
    45a2:	49 c1 e6 05          	shl    r14,0x5
    45a6:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
    45ab:	4e 8d bc 35 cc 58 00 	lea    r15,[rbp+r14*1+0x58cc]
    45b2:	00 
    45b3:	85 c9                	test   ecx,ecx
    45b5:	74 03                	je     45ba <CL_ReadDemoMessage+0x16a>
    45b7:	48 89 c3             	mov    rbx,rax
    45ba:	48 8d 44 24 60       	lea    rax,[rsp+0x60]
    45bf:	ba 00 40 00 00       	mov    edx,0x4000
    45c4:	48 8d b4 24 a0 40 00 	lea    rsi,[rsp+0x40a0]
    45cb:	00 
    45cc:	49 89 c4             	mov    r12,rax
    45cf:	48 89 c7             	mov    rdi,rax
    45d2:	e8 00 00 00 00       	call   45d7 <CL_ReadDemoMessage+0x187>
    45d7:	4c 89 e7             	mov    rdi,r12
    45da:	e8 00 00 00 00       	call   45df <CL_ReadDemoMessage+0x18f>
    45df:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 45e5 <CL_ReadDemoMessage+0x195>
    45e5:	4c 89 e7             	mov    rdi,r12
    45e8:	e8 00 00 00 00       	call   45ed <CL_ReadDemoMessage+0x19d>
    45ed:	4c 89 e7             	mov    rdi,r12
    45f0:	e8 cb bc ff ff       	call   2c0 <CL_WriteServerCommands>
    45f5:	4c 89 e7             	mov    rdi,r12
    45f8:	be 07 00 00 00       	mov    esi,0x7
    45fd:	4c 89 64 24 08       	mov    QWORD PTR [rsp+0x8],r12
    4602:	e8 00 00 00 00       	call   4607 <CL_ReadDemoMessage+0x1b7>
    4607:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
    460c:	48 89 cf             	mov    rdi,rcx
    460f:	48 c1 e7 04          	shl    rdi,0x4
    4613:	49 89 fc             	mov    r12,rdi
    4616:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    461b:	49 01 cc             	add    r12,rcx
    461e:	49 c1 e4 05          	shl    r12,0x5
    4622:	49 01 ec             	add    r12,rbp
    4625:	41 8b b4 24 d4 58 00 	mov    esi,DWORD PTR [r12+0x58d4]
    462c:	00 
    462d:	e8 00 00 00 00       	call   4632 <CL_ReadDemoMessage+0x1e2>
    4632:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 4638 <CL_ReadDemoMessage+0x1e8>
    4638:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    463d:	e8 00 00 00 00       	call   4642 <CL_ReadDemoMessage+0x1f2>
    4642:	41 8b b4 24 d0 58 00 	mov    esi,DWORD PTR [r12+0x58d0]
    4649:	00 
    464a:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    464f:	e8 00 00 00 00       	call   4654 <CL_ReadDemoMessage+0x204>
    4654:	41 8b b4 24 e4 58 00 	mov    esi,DWORD PTR [r12+0x58e4]
    465b:	00 
    465c:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    4661:	e8 00 00 00 00       	call   4666 <CL_ReadDemoMessage+0x216>
    4666:	41 8b 94 24 e4 58 00 	mov    edx,DWORD PTR [r12+0x58e4]
    466d:	00 
    466e:	4c 8b 64 24 08       	mov    r12,QWORD PTR [rsp+0x8]
    4673:	4a 8d b4 35 e8 58 00 	lea    rsi,[rbp+r14*1+0x58e8]
    467a:	00 
    467b:	4c 89 e7             	mov    rdi,r12
    467e:	e8 00 00 00 00       	call   4683 <CL_ReadDemoMessage+0x233>
    4683:	4a 8d 94 35 0c 59 00 	lea    rdx,[rbp+r14*1+0x590c]
    468a:	00 
    468b:	48 85 db             	test   rbx,rbx
    468e:	0f 84 43 03 00 00    	je     49d7 <CL_ReadDemoMessage+0x587>
    4694:	48 8d 73 40          	lea    rsi,[rbx+0x40]
    4698:	4c 89 e7             	mov    rdi,r12
    469b:	e8 00 00 00 00       	call   46a0 <CL_ReadDemoMessage+0x250>
    46a0:	44 8b b3 14 02 00 00 	mov    r14d,DWORD PTR [rbx+0x214]
    46a7:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
    46ae:	00 
    46af:	41 8b 8f 14 02 00 00 	mov    ecx,DWORD PTR [r15+0x214]
    46b6:	31 db                	xor    ebx,ebx
    46b8:	45 31 e4             	xor    r12d,r12d
    46bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    46c0:	39 cb                	cmp    ebx,ecx
    46c2:	7c 5c                	jl     4720 <CL_ReadDemoMessage+0x2d0>
    46c4:	45 39 f5             	cmp    r13d,r14d
    46c7:	0f 8d 23 01 00 00    	jge    47f0 <CL_ReadDemoMessage+0x3a0>
    46cd:	ba 01 04 00 00       	mov    edx,0x401
    46d2:	49 63 f5             	movsxd rsi,r13d
    46d5:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 46dc <CL_ReadDemoMessage+0x28c>
    46dc:	48 8d 3c 76          	lea    rdi,[rsi+rsi*2]
    46e0:	4c 8d 24 be          	lea    r12,[rsi+rdi*4]
    46e4:	49 c1 e4 04          	shl    r12,0x4
    46e8:	49 01 c4             	add    r12,rax
    46eb:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
    46ef:	39 d6                	cmp    esi,edx
    46f1:	0f 84 b9 00 00 00    	je     47b0 <CL_ReadDemoMessage+0x360>
    46f7:	7f 77                	jg     4770 <CL_ReadDemoMessage+0x320>
    46f9:	7d c5                	jge    46c0 <CL_ReadDemoMessage+0x270>
    46fb:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    4700:	b9 01 00 00 00       	mov    ecx,0x1
    4705:	31 d2                	xor    edx,edx
    4707:	4c 89 e6             	mov    rsi,r12
    470a:	41 83 c5 01          	add    r13d,0x1
    470e:	e8 00 00 00 00       	call   4713 <CL_ReadDemoMessage+0x2c3>
    4713:	41 8b 8f 14 02 00 00 	mov    ecx,DWORD PTR [r15+0x214]
    471a:	eb a4                	jmp    46c0 <CL_ReadDemoMessage+0x270>
    471c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    4720:	41 8b 97 18 02 00 00 	mov    edx,DWORD PTR [r15+0x218]
    4727:	01 da                	add    edx,ebx
    4729:	89 d6                	mov    esi,edx
    472b:	c1 fe 1f             	sar    esi,0x1f
    472e:	c1 ee 13             	shr    esi,0x13
    4731:	01 f2                	add    edx,esi
    4733:	81 e2 ff 1f 00 00    	and    edx,0x1fff
    4739:	29 f2                	sub    edx,esi
    473b:	48 63 d2             	movsxd rdx,edx
    473e:	48 8d 34 52          	lea    rsi,[rdx+rdx*2]
    4742:	48 8d 14 b2          	lea    rdx,[rdx+rsi*4]
    4746:	be 01 04 00 00       	mov    esi,0x401
    474b:	48 c1 e2 04          	shl    rdx,0x4
    474f:	48 8d 84 15 cc dc 03 	lea    rax,[rbp+rdx*1+0x3dccc]
    4756:	00 
    4757:	48 63 94 15 cc dc 03 	movsxd rdx,DWORD PTR [rbp+rdx*1+0x3dccc]
    475e:	00 
    475f:	48 89 04 24          	mov    QWORD PTR [rsp],rax
    4763:	45 39 f5             	cmp    r13d,r14d
    4766:	7d 87                	jge    46ef <CL_ReadDemoMessage+0x29f>
    4768:	e9 65 ff ff ff       	jmp    46d2 <CL_ReadDemoMessage+0x282>
    476d:	0f 1f 00             	nop    DWORD PTR [rax]
    4770:	48 8d 0c 52          	lea    rcx,[rdx+rdx*2]
    4774:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    4779:	83 c3 01             	add    ebx,0x1
    477c:	48 8d 14 8a          	lea    rdx,[rdx+rcx*4]
    4780:	b9 01 00 00 00       	mov    ecx,0x1
    4785:	48 c1 e2 04          	shl    rdx,0x4
    4789:	48 8d b4 15 cc 9c 00 	lea    rsi,[rbp+rdx*1+0x9ccc]
    4790:	00 
    4791:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]
    4795:	e8 00 00 00 00       	call   479a <CL_ReadDemoMessage+0x34a>
    479a:	41 8b 8f 14 02 00 00 	mov    ecx,DWORD PTR [r15+0x214]
    47a1:	e9 1a ff ff ff       	jmp    46c0 <CL_ReadDemoMessage+0x270>
    47a6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    47ad:	00 00 00 
    47b0:	48 8b 14 24          	mov    rdx,QWORD PTR [rsp]
    47b4:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    47b9:	31 c9                	xor    ecx,ecx
    47bb:	4c 89 e6             	mov    rsi,r12
    47be:	41 83 c5 01          	add    r13d,0x1
    47c2:	83 c3 01             	add    ebx,0x1
    47c5:	e8 00 00 00 00       	call   47ca <CL_ReadDemoMessage+0x37a>
    47ca:	41 8b 8f 14 02 00 00 	mov    ecx,DWORD PTR [r15+0x214]
    47d1:	e9 ea fe ff ff       	jmp    46c0 <CL_ReadDemoMessage+0x270>
    47d6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    47dd:	00 00 00 
    47e0:	31 ff                	xor    edi,edi
    47e2:	e8 69 bb ff ff       	call   350 <CL_WriteGamestate>
    47e7:	e9 98 fc ff ff       	jmp    4484 <CL_ReadDemoMessage+0x34>
    47ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    47f0:	48 8b 5c 24 08       	mov    rbx,QWORD PTR [rsp+0x8]
    47f5:	ba 0a 00 00 00       	mov    edx,0xa
    47fa:	be ff 03 00 00       	mov    esi,0x3ff
    47ff:	48 89 df             	mov    rdi,rbx
    4802:	e8 00 00 00 00       	call   4807 <CL_ReadDemoMessage+0x3b7>
    4807:	be 08 00 00 00       	mov    esi,0x8
    480c:	48 89 df             	mov    rdi,rbx
    480f:	e8 00 00 00 00       	call   4814 <CL_ReadDemoMessage+0x3c4>
    4814:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 481a <CL_ReadDemoMessage+0x3ca>
    481a:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 4820 <CL_ReadDemoMessage+0x3d0>
    4820:	85 d2                	test   edx,edx
    4822:	74 06                	je     482a <CL_ReadDemoMessage+0x3da>
    4824:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 482a <CL_ReadDemoMessage+0x3da>
    482a:	4c 8d 64 24 2c       	lea    r12,[rsp+0x2c]
    482f:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 4835 <CL_ReadDemoMessage+0x3e5>
    4835:	be 04 00 00 00       	mov    esi,0x4
    483a:	89 44 24 2c          	mov    DWORD PTR [rsp+0x2c],eax
    483e:	4c 89 e7             	mov    rdi,r12
    4841:	e8 00 00 00 00       	call   4846 <CL_ReadDemoMessage+0x3f6>
    4846:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [rsp+0x80]
    484d:	be 04 00 00 00       	mov    esi,0x4
    4852:	4c 89 e7             	mov    rdi,r12
    4855:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 485b <CL_ReadDemoMessage+0x40b>
    485b:	89 44 24 2c          	mov    DWORD PTR [rsp+0x2c],eax
    485f:	e8 00 00 00 00       	call   4864 <CL_ReadDemoMessage+0x414>
    4864:	48 8b 7c 24 70       	mov    rdi,QWORD PTR [rsp+0x70]
    4869:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 486f <CL_ReadDemoMessage+0x41f>
    486f:	8b b4 24 80 00 00 00 	mov    esi,DWORD PTR [rsp+0x80]
    4876:	e8 00 00 00 00       	call   487b <CL_ReadDemoMessage+0x42b>
    487b:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
    4880:	48 89 c8             	mov    rax,rcx
    4883:	48 c1 e0 04          	shl    rax,0x4
    4887:	48 01 c8             	add    rax,rcx
    488a:	48 c1 e0 05          	shl    rax,0x5
    488e:	4c 8d 4c 05 00       	lea    r9,[rbp+rax*1+0x0]
    4893:	41 8b b9 e0 5a 00 00 	mov    edi,DWORD PTR [r9+0x5ae0]
    489a:	85 ff                	test   edi,edi
    489c:	0f 8e e6 00 00 00    	jle    4988 <CL_ReadDemoMessage+0x538>
    48a2:	41 8b 89 e4 5a 00 00 	mov    ecx,DWORD PTR [r9+0x5ae4]
    48a9:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 48b0 <CL_ReadDemoMessage+0x460>
    48b0:	4c 8d 05 00 00 00 00 	lea    r8,[rip+0x0]        # 48b7 <CL_ReadDemoMessage+0x467>
    48b7:	01 cf                	add    edi,ecx
    48b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    48c0:	89 ce                	mov    esi,ecx
    48c2:	48 81 c2 d0 00 00 00 	add    rdx,0xd0
    48c9:	c1 fe 1f             	sar    esi,0x1f
    48cc:	c1 ee 13             	shr    esi,0x13
    48cf:	8d 04 31             	lea    eax,[rcx+rsi*1]
    48d2:	83 c1 01             	add    ecx,0x1
    48d5:	25 ff 1f 00 00       	and    eax,0x1fff
    48da:	29 f0                	sub    eax,esi
    48dc:	48 98                	cdqe   
    48de:	48 8d 34 40          	lea    rsi,[rax+rax*2]
    48e2:	48 8d 04 b0          	lea    rax,[rax+rsi*4]
    48e6:	48 c1 e0 04          	shl    rax,0x4
    48ea:	4c 01 c0             	add    rax,r8
    48ed:	f3 0f 6f 40 0c       	movdqu xmm0,XMMWORD PTR [rax+0xc]
    48f2:	f3 0f 6f 48 1c       	movdqu xmm1,XMMWORD PTR [rax+0x1c]
    48f7:	f3 0f 6f 50 2c       	movdqu xmm2,XMMWORD PTR [rax+0x2c]
    48fc:	f3 0f 6f 58 3c       	movdqu xmm3,XMMWORD PTR [rax+0x3c]
    4901:	f3 0f 6f 60 4c       	movdqu xmm4,XMMWORD PTR [rax+0x4c]
    4906:	0f 29 82 30 ff ff ff 	movaps XMMWORD PTR [rdx-0xd0],xmm0
    490d:	f3 0f 6f 68 5c       	movdqu xmm5,XMMWORD PTR [rax+0x5c]
    4912:	0f 29 8a 40 ff ff ff 	movaps XMMWORD PTR [rdx-0xc0],xmm1
    4919:	f3 0f 6f 70 6c       	movdqu xmm6,XMMWORD PTR [rax+0x6c]
    491e:	f3 0f 6f 78 7c       	movdqu xmm7,XMMWORD PTR [rax+0x7c]
    4923:	0f 29 92 50 ff ff ff 	movaps XMMWORD PTR [rdx-0xb0],xmm2
    492a:	f3 0f 6f 80 8c 00 00 	movdqu xmm0,XMMWORD PTR [rax+0x8c]
    4931:	00 
    4932:	f3 0f 6f 88 9c 00 00 	movdqu xmm1,XMMWORD PTR [rax+0x9c]
    4939:	00 
    493a:	0f 29 9a 60 ff ff ff 	movaps XMMWORD PTR [rdx-0xa0],xmm3
    4941:	f3 0f 6f 90 ac 00 00 	movdqu xmm2,XMMWORD PTR [rax+0xac]
    4948:	00 
    4949:	f3 0f 6f 98 bc 00 00 	movdqu xmm3,XMMWORD PTR [rax+0xbc]
    4950:	00 
    4951:	0f 29 a2 70 ff ff ff 	movaps XMMWORD PTR [rdx-0x90],xmm4
    4958:	f3 0f 6f a0 cc 00 00 	movdqu xmm4,XMMWORD PTR [rax+0xcc]
    495f:	00 
    4960:	0f 29 6a 80          	movaps XMMWORD PTR [rdx-0x80],xmm5
    4964:	0f 29 72 90          	movaps XMMWORD PTR [rdx-0x70],xmm6
    4968:	0f 29 7a a0          	movaps XMMWORD PTR [rdx-0x60],xmm7
    496c:	0f 29 42 b0          	movaps XMMWORD PTR [rdx-0x50],xmm0
    4970:	0f 29 4a c0          	movaps XMMWORD PTR [rdx-0x40],xmm1
    4974:	0f 29 52 d0          	movaps XMMWORD PTR [rdx-0x30],xmm2
    4978:	0f 29 5a e0          	movaps XMMWORD PTR [rdx-0x20],xmm3
    497c:	0f 29 62 f0          	movaps XMMWORD PTR [rdx-0x10],xmm4
    4980:	39 f9                	cmp    ecx,edi
    4982:	0f 85 38 ff ff ff    	jne    48c0 <CL_ReadDemoMessage+0x470>
    4988:	48 8b 4c 24 10       	mov    rcx,QWORD PTR [rsp+0x10]
    498d:	48 8b 7c 24 18       	mov    rdi,QWORD PTR [rsp+0x18]
    4992:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 499c <CL_ReadDemoMessage+0x54c>
    4999:	00 00 00 
    499c:	83 05 00 00 00 00 01 	add    DWORD PTR [rip+0x0],0x1        # 49a3 <CL_ReadDemoMessage+0x553>
    49a3:	48 89 c8             	mov    rax,rcx
    49a6:	48 c1 e0 04          	shl    rax,0x4
    49aa:	48 01 c1             	add    rcx,rax
    49ad:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 49b4 <CL_ReadDemoMessage+0x564>
    49b4:	48 89 cb             	mov    rbx,rcx
    49b7:	b9 44 00 00 00       	mov    ecx,0x44
    49bc:	48 c1 e3 05          	shl    rbx,0x5
    49c0:	48 8d 74 18 0c       	lea    rsi,[rax+rbx*1+0xc]
    49c5:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    49c8:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 49d2 <CL_ReadDemoMessage+0x582>
    49cf:	00 00 00 
    49d2:	e9 ad fa ff ff       	jmp    4484 <CL_ReadDemoMessage+0x34>
    49d7:	48 8b 7c 24 08       	mov    rdi,QWORD PTR [rsp+0x8]
    49dc:	31 f6                	xor    esi,esi
    49de:	45 31 f6             	xor    r14d,r14d
    49e1:	e8 00 00 00 00       	call   49e6 <CL_ReadDemoMessage+0x596>
    49e6:	e9 bc fc ff ff       	jmp    46a7 <CL_ReadDemoMessage+0x257>
    49eb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 49f2 <CL_ReadDemoMessage+0x5a2>
    49f2:	bf 01 00 00 00       	mov    edi,0x1
    49f7:	31 c0                	xor    eax,eax
    49f9:	e8 00 00 00 00       	call   49fe <CL_ReadDemoMessage+0x5ae>
    49fe:	66 90                	xchg   ax,ax

0000000000004a00 <CL_MapLoading>:
CL_MapLoading():
    4a00:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 4a07 <CL_MapLoading+0x7>
    4a07:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    4a0a:	85 d2                	test   edx,edx
    4a0c:	0f 85 26 01 00 00    	jne    4b38 <CL_MapLoading+0x138>
    4a12:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 4a19 <CL_MapLoading+0x19>
    4a19:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    4a1c:	85 c0                	test   eax,eax
    4a1e:	75 08                	jne    4a28 <CL_MapLoading+0x28>
    4a20:	c3                   	ret    
    4a21:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    4a28:	48 83 ec 08          	sub    rsp,0x8
    4a2c:	e8 00 00 00 00       	call   4a31 <CL_MapLoading+0x31>
    4a31:	31 ff                	xor    edi,edi
    4a33:	e8 00 00 00 00       	call   4a38 <CL_MapLoading+0x38>
    4a38:	83 3d 00 00 00 00 04 	cmp    DWORD PTR [rip+0x0],0x4        # 4a3f <CL_MapLoading+0x3f>
    4a3f:	76 77                	jbe    4ab8 <CL_MapLoading+0xb8>
    4a41:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4a48 <CL_MapLoading+0x48>
    4a48:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4a4f <CL_MapLoading+0x4f>
    4a4f:	e8 00 00 00 00       	call   4a54 <CL_MapLoading+0x54>
    4a54:	85 c0                	test   eax,eax
    4a56:	75 60                	jne    4ab8 <CL_MapLoading+0xb8>
    4a58:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 4a5f <CL_MapLoading+0x5f>
    4a5f:	31 c0                	xor    eax,eax
    4a61:	b9 80 00 00 00       	mov    ecx,0x80
    4a66:	31 f6                	xor    esi,esi
    4a68:	c7 05 00 00 00 00 05 	mov    DWORD PTR [rip+0x0],0x5        # 4a72 <CL_MapLoading+0x72>
    4a6f:	00 00 00 
    4a72:	48 89 d7             	mov    rdi,rdx
    4a75:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 4a7c <CL_MapLoading+0x7c>
    4a7c:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    4a7f:	48 89 d7             	mov    rdi,rdx
    4a82:	b9 80 00 00 00       	mov    ecx,0x80
    4a87:	ba 84 4e 00 00       	mov    edx,0x4e84
    4a8c:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
    4a8f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4a96 <CL_MapLoading+0x96>
    4a96:	e8 00 00 00 00       	call   4a9b <CL_MapLoading+0x9b>
    4a9b:	83 05 00 00 00 00 01 	add    DWORD PTR [rip+0x0],0x1        # 4aa2 <CL_MapLoading+0xa2>
    4aa2:	c7 05 00 00 00 00 f1 	mov    DWORD PTR [rip+0x0],0xffffd8f1        # 4aac <CL_MapLoading+0xac>
    4aa9:	d8 ff ff 
    4aac:	48 83 c4 08          	add    rsp,0x8
    4ab0:	e9 00 00 00 00       	jmp    4ab5 <CL_MapLoading+0xb5>
    4ab5:	0f 1f 00             	nop    DWORD PTR [rax]
    4ab8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4abf <CL_MapLoading+0xbf>
    4abf:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4ac6 <CL_MapLoading+0xc6>
    4ac6:	e8 00 00 00 00       	call   4acb <CL_MapLoading+0xcb>
    4acb:	bf 01 00 00 00       	mov    edi,0x1
    4ad0:	e8 00 00 00 00       	call   4ad5 <CL_MapLoading+0xd5>
    4ad5:	ba 00 10 00 00       	mov    edx,0x1000
    4ada:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4ae1 <CL_MapLoading+0xe1>
    4ae1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4ae8 <CL_MapLoading+0xe8>
    4ae8:	e8 00 00 00 00       	call   4aed <CL_MapLoading+0xed>
    4aed:	31 ff                	xor    edi,edi
    4aef:	c7 05 00 00 00 00 04 	mov    DWORD PTR [rip+0x0],0x4        # 4af9 <CL_MapLoading+0xf9>
    4af6:	00 00 00 
    4af9:	e8 00 00 00 00       	call   4afe <CL_MapLoading+0xfe>
    4afe:	83 05 00 00 00 00 01 	add    DWORD PTR [rip+0x0],0x1        # 4b05 <CL_MapLoading+0x105>
    4b05:	e8 00 00 00 00       	call   4b0a <CL_MapLoading+0x10a>
    4b0a:	ba 07 00 00 00       	mov    edx,0x7
    4b0f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4b16 <CL_MapLoading+0x116>
    4b16:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4b1d <CL_MapLoading+0x11d>
    4b1d:	c7 05 00 00 00 00 48 	mov    DWORD PTR [rip+0x0],0xfffff448        # 4b27 <CL_MapLoading+0x127>
    4b24:	f4 ff ff 
    4b27:	e8 00 00 00 00       	call   4b2c <CL_MapLoading+0x12c>
    4b2c:	48 83 c4 08          	add    rsp,0x8
    4b30:	e9 9b ba ff ff       	jmp    5d0 <CL_CheckForResend>
    4b35:	0f 1f 00             	nop    DWORD PTR [rax]
    4b38:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 4b42 <CL_MapLoading+0x142>
    4b3f:	00 00 00 
    4b42:	bf 01 00 00 00       	mov    edi,0x1
    4b47:	e9 00 00 00 00       	jmp    4b4c <CL_MapLoading+0x14c>
    4b4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000004b50 <CL_Connect_f>:
CL_Connect_f():
    4b50:	41 54                	push   r12
    4b52:	55                   	push   rbp
    4b53:	53                   	push   rbx
    4b54:	48 81 ec 20 21 00 00 	sub    rsp,0x2120
    4b5b:	e8 00 00 00 00       	call   4b60 <CL_Connect_f+0x10>
    4b60:	8d 50 fe             	lea    edx,[rax-0x2]
    4b63:	83 fa 01             	cmp    edx,0x1
    4b66:	0f 87 5c 02 00 00    	ja     4dc8 <CL_Connect_f+0x278>
    4b6c:	bf 01 00 00 00       	mov    edi,0x1
    4b71:	83 f8 02             	cmp    eax,0x2
    4b74:	0f 84 36 02 00 00    	je     4db0 <CL_Connect_f+0x260>
    4b7a:	e8 00 00 00 00       	call   4b7f <CL_Connect_f+0x2f>
    4b7f:	b9 03 00 00 00       	mov    ecx,0x3
    4b84:	bd 04 00 00 00       	mov    ebp,0x4
    4b89:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4b90 <CL_Connect_f+0x40>
    4b90:	48 89 c6             	mov    rsi,rax
    4b93:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    4b95:	0f 97 c0             	seta   al
    4b98:	1c 00                	sbb    al,0x0
    4b9a:	84 c0                	test   al,al
    4b9c:	0f 85 5e 02 00 00    	jne    4e00 <CL_Connect_f+0x2b0>
    4ba2:	bf 02 00 00 00       	mov    edi,0x2
    4ba7:	e8 00 00 00 00       	call   4bac <CL_Connect_f+0x5c>
    4bac:	48 89 c6             	mov    rsi,rax
    4baf:	48 8d 5c 24 20       	lea    rbx,[rsp+0x20]
    4bb4:	ba 00 10 00 00       	mov    edx,0x1000
    4bb9:	48 89 df             	mov    rdi,rbx
    4bbc:	e8 00 00 00 00       	call   4bc1 <CL_Connect_f+0x71>
    4bc1:	ba 05 00 00 00       	mov    edx,0x5
    4bc6:	48 89 df             	mov    rdi,rbx
    4bc9:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4bd0 <CL_Connect_f+0x80>
    4bd0:	e8 00 00 00 00       	call   4bd5 <CL_Connect_f+0x85>
    4bd5:	48 8d 53 05          	lea    rdx,[rbx+0x5]
    4bd9:	85 c0                	test   eax,eax
    4bdb:	48 0f 44 da          	cmove  rbx,rdx
    4bdf:	80 3b 2f             	cmp    BYTE PTR [rbx],0x2f
    4be2:	75 0d                	jne    4bf1 <CL_Connect_f+0xa1>
    4be4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    4be8:	48 83 c3 01          	add    rbx,0x1
    4bec:	80 3b 2f             	cmp    BYTE PTR [rbx],0x2f
    4bef:	74 f7                	je     4be8 <CL_Connect_f+0x98>
    4bf1:	48 89 df             	mov    rdi,rbx
    4bf4:	e8 00 00 00 00       	call   4bf9 <CL_Connect_f+0xa9>
    4bf9:	85 c0                	test   eax,eax
    4bfb:	0f 8e 9d 01 00 00    	jle    4d9e <CL_Connect_f+0x24e>
    4c01:	48 98                	cdqe   
    4c03:	48 8d 44 03 ff       	lea    rax,[rbx+rax*1-0x1]
    4c08:	80 38 2f             	cmp    BYTE PTR [rax],0x2f
    4c0b:	75 03                	jne    4c10 <CL_Connect_f+0xc0>
    4c0d:	c6 00 00             	mov    BYTE PTR [rax],0x0
    4c10:	80 3b 00             	cmp    BYTE PTR [rbx],0x0
    4c13:	0f 84 85 01 00 00    	je     4d9e <CL_Connect_f+0x24e>
    4c19:	48 89 e6             	mov    rsi,rsp
    4c1c:	89 ea                	mov    edx,ebp
    4c1e:	48 89 df             	mov    rdi,rbx
    4c21:	e8 00 00 00 00       	call   4c26 <CL_Connect_f+0xd6>
    4c26:	85 c0                	test   eax,eax
    4c28:	0f 84 ba 01 00 00    	je     4de8 <CL_Connect_f+0x298>
    4c2e:	bf 01 00 00 00       	mov    edi,0x1
    4c33:	48 8d ac 24 20 10 00 	lea    rbp,[rsp+0x1020]
    4c3a:	00 
    4c3b:	e8 00 00 00 00       	call   4c40 <CL_Connect_f+0xf0>
    4c40:	ba 00 11 00 00       	mov    edx,0x1100
    4c45:	48 89 ef             	mov    rdi,rbp
    4c48:	48 89 c6             	mov    rsi,rax
    4c4b:	e8 00 00 00 00       	call   4c50 <CL_Connect_f+0x100>
    4c50:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4c57 <CL_Connect_f+0x107>
    4c57:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4c5e <CL_Connect_f+0x10e>
    4c5e:	e8 00 00 00 00       	call   4c63 <CL_Connect_f+0x113>
    4c63:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 4c6a <CL_Connect_f+0x11a>
    4c6a:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 4c71 <CL_Connect_f+0x121>
    4c71:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    4c74:	85 d2                	test   edx,edx
    4c76:	74 1e                	je     4c96 <CL_Connect_f+0x146>
    4c78:	b9 0a 00 00 00       	mov    ecx,0xa
    4c7d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4c84 <CL_Connect_f+0x134>
    4c84:	48 89 de             	mov    rsi,rbx
    4c87:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    4c89:	0f 97 c0             	seta   al
    4c8c:	1c 00                	sbb    al,0x0
    4c8e:	84 c0                	test   al,al
    4c90:	0f 84 f6 01 00 00    	je     4e8c <CL_Connect_f+0x33c>
    4c96:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4c9d <CL_Connect_f+0x14d>
    4c9d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4ca4 <CL_Connect_f+0x154>
    4ca4:	e8 00 00 00 00       	call   4ca9 <CL_Connect_f+0x159>
    4ca9:	31 ff                	xor    edi,edi
    4cab:	e8 00 00 00 00       	call   4cb0 <CL_Connect_f+0x160>
    4cb0:	bf 01 00 00 00       	mov    edi,0x1
    4cb5:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 4cbf <CL_Connect_f+0x16f>
    4cbc:	00 00 00 
    4cbf:	e8 00 00 00 00       	call   4cc4 <CL_Connect_f+0x174>
    4cc4:	e8 00 00 00 00       	call   4cc9 <CL_Connect_f+0x179>
    4cc9:	ba 00 10 00 00       	mov    edx,0x1000
    4cce:	48 89 de             	mov    rsi,rbx
    4cd1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4cd8 <CL_Connect_f+0x188>
    4cd8:	e8 00 00 00 00       	call   4cdd <CL_Connect_f+0x18d>
    4cdd:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
    4ce3:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
    4ce8:	0f 11 0d 00 00 00 00 	movups XMMWORD PTR [rip+0x0],xmm1        # 4cef <CL_Connect_f+0x19f>
    4cef:	66 83 3d 00 00 00 00 	cmp    WORD PTR [rip+0x0],0x0        # 4cf7 <CL_Connect_f+0x1a7>
    4cf6:	00 
    4cf7:	0f 11 05 00 00 00 00 	movups XMMWORD PTR [rip+0x0],xmm0        # 4cfe <CL_Connect_f+0x1ae>
    4cfe:	0f 84 72 01 00 00    	je     4e76 <CL_Connect_f+0x326>
    4d04:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4d0b <CL_Connect_f+0x1bb>
    4d0b:	e8 00 00 00 00       	call   4d10 <CL_Connect_f+0x1c0>
    4d10:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4d17 <CL_Connect_f+0x1c7>
    4d17:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4d1e <CL_Connect_f+0x1ce>
    4d1e:	48 89 c2             	mov    rdx,rax
    4d21:	49 89 c4             	mov    r12,rax
    4d24:	31 c0                	xor    eax,eax
    4d26:	e8 00 00 00 00       	call   4d2b <CL_Connect_f+0x1db>
    4d2b:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 4d32 <CL_Connect_f+0x1e2>
    4d32:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    4d35:	85 c0                	test   eax,eax
    4d37:	0f 84 0b 01 00 00    	je     4e48 <CL_Connect_f+0x2f8>
    4d3d:	4c 89 e7             	mov    rdi,r12
    4d40:	e8 00 00 00 00       	call   4d45 <CL_Connect_f+0x1f5>
    4d45:	4c 89 e7             	mov    rdi,r12
    4d48:	89 c6                	mov    esi,eax
    4d4a:	e8 41 bd ff ff       	call   a90 <CL_UpdateGUID>
    4d4f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4d56 <CL_Connect_f+0x206>
    4d56:	e8 00 00 00 00       	call   4d5b <CL_Connect_f+0x20b>
    4d5b:	85 c0                	test   eax,eax
    4d5d:	0f 84 f3 00 00 00    	je     4e56 <CL_Connect_f+0x306>
    4d63:	c7 05 00 00 00 00 04 	mov    DWORD PTR [rip+0x0],0x4        # 4d6d <CL_Connect_f+0x21d>
    4d6a:	00 00 00 
    4d6d:	31 ff                	xor    edi,edi
    4d6f:	e8 00 00 00 00       	call   4d74 <CL_Connect_f+0x224>
    4d74:	b8 61 79 fe ff       	mov    eax,0xfffe7961
    4d79:	48 89 ee             	mov    rsi,rbp
    4d7c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4d83 <CL_Connect_f+0x233>
    4d83:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 4d8a <CL_Connect_f+0x23a>
    4d8a:	e8 00 00 00 00       	call   4d8f <CL_Connect_f+0x23f>
    4d8f:	48 89 de             	mov    rsi,rbx
    4d92:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4d99 <CL_Connect_f+0x249>
    4d99:	e8 00 00 00 00       	call   4d9e <CL_Connect_f+0x24e>
    4d9e:	48 81 c4 20 21 00 00 	add    rsp,0x2120
    4da5:	5b                   	pop    rbx
    4da6:	5d                   	pop    rbp
    4da7:	41 5c                	pop    r12
    4da9:	c3                   	ret    
    4daa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    4db0:	e8 00 00 00 00       	call   4db5 <CL_Connect_f+0x265>
    4db5:	bd 07 00 00 00       	mov    ebp,0x7
    4dba:	48 89 c6             	mov    rsi,rax
    4dbd:	e9 ed fd ff ff       	jmp    4baf <CL_Connect_f+0x5f>
    4dc2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    4dc8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4dcf <CL_Connect_f+0x27f>
    4dcf:	31 c0                	xor    eax,eax
    4dd1:	e8 00 00 00 00       	call   4dd6 <CL_Connect_f+0x286>
    4dd6:	48 81 c4 20 21 00 00 	add    rsp,0x2120
    4ddd:	5b                   	pop    rbx
    4dde:	5d                   	pop    rbp
    4ddf:	41 5c                	pop    r12
    4de1:	c3                   	ret    
    4de2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    4de8:	48 89 de             	mov    rsi,rbx
    4deb:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4df2 <CL_Connect_f+0x2a2>
    4df2:	e8 00 00 00 00       	call   4df7 <CL_Connect_f+0x2a7>
    4df7:	eb a5                	jmp    4d9e <CL_Connect_f+0x24e>
    4df9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    4e00:	bf 01 00 00 00       	mov    edi,0x1
    4e05:	bd 05 00 00 00       	mov    ebp,0x5
    4e0a:	e8 00 00 00 00       	call   4e0f <CL_Connect_f+0x2bf>
    4e0f:	b9 03 00 00 00       	mov    ecx,0x3
    4e14:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4e1b <CL_Connect_f+0x2cb>
    4e1b:	48 89 c6             	mov    rsi,rax
    4e1e:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    4e20:	0f 97 c0             	seta   al
    4e23:	1c 00                	sbb    al,0x0
    4e25:	84 c0                	test   al,al
    4e27:	0f 84 75 fd ff ff    	je     4ba2 <CL_Connect_f+0x52>
    4e2d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4e34 <CL_Connect_f+0x2e4>
    4e34:	31 c0                	xor    eax,eax
    4e36:	bd 07 00 00 00       	mov    ebp,0x7
    4e3b:	e8 00 00 00 00       	call   4e40 <CL_Connect_f+0x2f0>
    4e40:	e9 5d fd ff ff       	jmp    4ba2 <CL_Connect_f+0x52>
    4e45:	0f 1f 00             	nop    DWORD PTR [rax]
    4e48:	31 f6                	xor    esi,esi
    4e4a:	31 ff                	xor    edi,edi
    4e4c:	e8 3f bc ff ff       	call   a90 <CL_UpdateGUID>
    4e51:	e9 f9 fe ff ff       	jmp    4d4f <CL_Connect_f+0x1ff>
    4e56:	be 04 00 00 00       	mov    esi,0x4
    4e5b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4e62 <CL_Connect_f+0x312>
    4e62:	c7 05 00 00 00 00 03 	mov    DWORD PTR [rip+0x0],0x3        # 4e6c <CL_Connect_f+0x31c>
    4e69:	00 00 00 
    4e6c:	e8 00 00 00 00       	call   4e71 <CL_Connect_f+0x321>
    4e71:	e9 f7 fe ff ff       	jmp    4d6d <CL_Connect_f+0x21d>
    4e76:	bf 38 6d 00 00       	mov    edi,0x6d38
    4e7b:	e8 00 00 00 00       	call   4e80 <CL_Connect_f+0x330>
    4e80:	66 89 05 00 00 00 00 	mov    WORD PTR [rip+0x0],ax        # 4e87 <CL_Connect_f+0x337>
    4e87:	e9 78 fe ff ff       	jmp    4d04 <CL_Connect_f+0x1b4>
    4e8c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4e93 <CL_Connect_f+0x343>
    4e93:	e8 00 00 00 00       	call   4e98 <CL_Connect_f+0x348>
    4e98:	e9 f9 fd ff ff       	jmp    4c96 <CL_Connect_f+0x146>
    4e9d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000004ea0 <CL_PlayDemo_f>:
CL_PlayDemo_f():
    4ea0:	41 54                	push   r12
    4ea2:	55                   	push   rbp
    4ea3:	53                   	push   rbx
    4ea4:	48 81 ec 10 20 00 00 	sub    rsp,0x2010
    4eab:	e8 00 00 00 00       	call   4eb0 <CL_PlayDemo_f+0x10>
    4eb0:	83 f8 02             	cmp    eax,0x2
    4eb3:	74 1b                	je     4ed0 <CL_PlayDemo_f+0x30>
    4eb5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4ebc <CL_PlayDemo_f+0x1c>
    4ebc:	31 c0                	xor    eax,eax
    4ebe:	e8 00 00 00 00       	call   4ec3 <CL_PlayDemo_f+0x23>
    4ec3:	48 81 c4 10 20 00 00 	add    rsp,0x2010
    4eca:	5b                   	pop    rbx
    4ecb:	5d                   	pop    rbp
    4ecc:	41 5c                	pop    r12
    4ece:	c3                   	ret    
    4ecf:	90                   	nop
    4ed0:	bf 01 00 00 00       	mov    edi,0x1
    4ed5:	e8 00 00 00 00       	call   4eda <CL_PlayDemo_f+0x3a>
    4eda:	be 2e 00 00 00       	mov    esi,0x2e
    4edf:	48 89 c7             	mov    rdi,rax
    4ee2:	49 89 c4             	mov    r12,rax
    4ee5:	e8 00 00 00 00       	call   4eea <CL_PlayDemo_f+0x4a>
    4eea:	48 89 c3             	mov    rbx,rax
    4eed:	48 85 c0             	test   rax,rax
    4ef0:	74 1d                	je     4f0f <CL_PlayDemo_f+0x6f>
    4ef2:	48 8d 78 01          	lea    rdi,[rax+0x1]
    4ef6:	ba 03 00 00 00       	mov    edx,0x3
    4efb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4f02 <CL_PlayDemo_f+0x62>
    4f02:	e8 00 00 00 00       	call   4f07 <CL_PlayDemo_f+0x67>
    4f07:	85 c0                	test   eax,eax
    4f09:	0f 84 49 01 00 00    	je     5058 <CL_PlayDemo_f+0x1b8>
    4f0f:	48 8d 5c 24 10       	lea    rbx,[rsp+0x10]
    4f14:	48 8d 54 24 0c       	lea    rdx,[rsp+0xc]
    4f19:	4c 89 e7             	mov    rdi,r12
    4f1c:	48 89 de             	mov    rsi,rbx
    4f1f:	e8 fc d2 ff ff       	call   2220 <CL_WalkDemoExt>
    4f24:	89 c5                	mov    ebp,eax
    4f26:	8b 7c 24 0c          	mov    edi,DWORD PTR [rsp+0xc]
    4f2a:	85 ff                	test   edi,edi
    4f2c:	0f 84 06 01 00 00    	je     5038 <CL_PlayDemo_f+0x198>
    4f32:	e8 00 00 00 00       	call   4f37 <CL_PlayDemo_f+0x97>
    4f37:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4f3e <CL_PlayDemo_f+0x9e>
    4f3e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4f45 <CL_PlayDemo_f+0xa5>
    4f45:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [rsp+0xc],0x0
    4f4c:	00 
    4f4d:	e8 00 00 00 00       	call   4f52 <CL_PlayDemo_f+0xb2>
    4f52:	bf 01 00 00 00       	mov    edi,0x1
    4f57:	e8 00 00 00 00       	call   4f5c <CL_PlayDemo_f+0xbc>
    4f5c:	ba 01 00 00 00       	mov    edx,0x1
    4f61:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 4f68 <CL_PlayDemo_f+0xc8>
    4f68:	48 89 df             	mov    rdi,rbx
    4f6b:	e8 00 00 00 00       	call   4f70 <CL_PlayDemo_f+0xd0>
    4f70:	83 f8 ff             	cmp    eax,0xffffffff
    4f73:	0f 84 cc 01 00 00    	je     5145 <CL_PlayDemo_f+0x2a5>
    4f79:	48 89 df             	mov    rdi,rbx
    4f7c:	be 2f 00 00 00       	mov    esi,0x2f
    4f81:	e8 00 00 00 00       	call   4f86 <CL_PlayDemo_f+0xe6>
    4f86:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4f8d <CL_PlayDemo_f+0xed>
    4f8d:	48 8d 50 01          	lea    rdx,[rax+0x1]
    4f91:	48 85 c0             	test   rax,rax
    4f94:	48 0f 45 da          	cmovne rbx,rdx
    4f98:	ba 00 10 00 00       	mov    edx,0x1000
    4f9d:	48 89 de             	mov    rsi,rbx
    4fa0:	e8 00 00 00 00       	call   4fa5 <CL_PlayDemo_f+0x105>
    4fa5:	e8 00 00 00 00       	call   4faa <CL_PlayDemo_f+0x10a>
    4faa:	48 89 de             	mov    rsi,rbx
    4fad:	ba 00 10 00 00       	mov    edx,0x1000
    4fb2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 4fb9 <CL_PlayDemo_f+0x119>
    4fb9:	c7 05 00 00 00 00 05 	mov    DWORD PTR [rip+0x0],0x5        # 4fc3 <CL_PlayDemo_f+0x123>
    4fc0:	00 00 00 
    4fc3:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 4fca <CL_PlayDemo_f+0x12a>
    4fca:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 4fd4 <CL_PlayDemo_f+0x134>
    4fd1:	00 00 00 
    4fd4:	e8 00 00 00 00       	call   4fd9 <CL_PlayDemo_f+0x139>
    4fd9:	31 c0                	xor    eax,eax
    4fdb:	83 fd 46             	cmp    ebp,0x46
    4fde:	0f 9e c0             	setle  al
    4fe1:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 4fe7 <CL_PlayDemo_f+0x147>
    4fe7:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 4fed <CL_PlayDemo_f+0x14d>
    4fed:	83 e8 05             	sub    eax,0x5
    4ff0:	83 f8 01             	cmp    eax,0x1
    4ff3:	76 1e                	jbe    5013 <CL_PlayDemo_f+0x173>
    4ff5:	eb 28                	jmp    501f <CL_PlayDemo_f+0x17f>
    4ff7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    4ffe:	00 00 
    5000:	e8 00 00 00 00       	call   5005 <CL_PlayDemo_f+0x165>
    5005:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 500b <CL_PlayDemo_f+0x16b>
    500b:	83 e8 05             	sub    eax,0x5
    500e:	83 f8 01             	cmp    eax,0x1
    5011:	77 0c                	ja     501f <CL_PlayDemo_f+0x17f>
    5013:	48 89 df             	mov    rdi,rbx
    5016:	e8 00 00 00 00       	call   501b <CL_PlayDemo_f+0x17b>
    501b:	85 c0                	test   eax,eax
    501d:	74 e1                	je     5000 <CL_PlayDemo_f+0x160>
    501f:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 5029 <CL_PlayDemo_f+0x189>
    5026:	00 00 00 
    5029:	48 81 c4 10 20 00 00 	add    rsp,0x2010
    5030:	5b                   	pop    rbx
    5031:	5d                   	pop    rbp
    5032:	41 5c                	pop    r12
    5034:	c3                   	ret    
    5035:	0f 1f 00             	nop    DWORD PTR [rax]
    5038:	48 89 de             	mov    rsi,rbx
    503b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5042 <CL_PlayDemo_f+0x1a2>
    5042:	31 c0                	xor    eax,eax
    5044:	e8 00 00 00 00       	call   5049 <CL_PlayDemo_f+0x1a9>
    5049:	48 81 c4 10 20 00 00 	add    rsp,0x2010
    5050:	5b                   	pop    rbx
    5051:	5d                   	pop    rbp
    5052:	41 5c                	pop    r12
    5054:	c3                   	ret    
    5055:	0f 1f 00             	nop    DWORD PTR [rax]
    5058:	ba 0a 00 00 00       	mov    edx,0xa
    505d:	48 8d 7b 04          	lea    rdi,[rbx+0x4]
    5061:	31 f6                	xor    esi,esi
    5063:	e8 00 00 00 00       	call   5068 <CL_PlayDemo_f+0x1c8>
    5068:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 506e <CL_PlayDemo_f+0x1ce>
    506e:	89 c5                	mov    ebp,eax
    5070:	85 d2                	test   edx,edx
    5072:	74 22                	je     5096 <CL_PlayDemo_f+0x1f6>
    5074:	39 d0                	cmp    eax,edx
    5076:	74 2a                	je     50a2 <CL_PlayDemo_f+0x202>
    5078:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 507f <CL_PlayDemo_f+0x1df>
    507f:	eb 0f                	jmp    5090 <CL_PlayDemo_f+0x1f0>
    5081:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    5088:	48 83 c2 04          	add    rdx,0x4
    508c:	39 e9                	cmp    ecx,ebp
    508e:	74 12                	je     50a2 <CL_PlayDemo_f+0x202>
    5090:	8b 0a                	mov    ecx,DWORD PTR [rdx]
    5092:	85 c9                	test   ecx,ecx
    5094:	75 f2                	jne    5088 <CL_PlayDemo_f+0x1e8>
    5096:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 509d <CL_PlayDemo_f+0x1fd>
    509d:	39 42 30             	cmp    DWORD PTR [rdx+0x30],eax
    50a0:	75 46                	jne    50e8 <CL_PlayDemo_f+0x248>
    50a2:	48 8d 5c 24 10       	lea    rbx,[rsp+0x10]
    50a7:	4c 89 e1             	mov    rcx,r12
    50aa:	be 00 10 00 00       	mov    esi,0x1000
    50af:	31 c0                	xor    eax,eax
    50b1:	48 89 df             	mov    rdi,rbx
    50b4:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 50bb <CL_PlayDemo_f+0x21b>
    50bb:	e8 00 00 00 00       	call   50c0 <CL_PlayDemo_f+0x220>
    50c0:	e8 00 00 00 00       	call   50c5 <CL_PlayDemo_f+0x225>
    50c5:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
    50ca:	ba 01 00 00 00       	mov    edx,0x1
    50cf:	48 89 df             	mov    rdi,rbx
    50d2:	e8 00 00 00 00       	call   50d7 <CL_PlayDemo_f+0x237>
    50d7:	e8 00 00 00 00       	call   50dc <CL_PlayDemo_f+0x23c>
    50dc:	e9 45 fe ff ff       	jmp    4f26 <CL_PlayDemo_f+0x86>
    50e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    50e8:	89 c6                	mov    esi,eax
    50ea:	4c 29 e3             	sub    rbx,r12
    50ed:	31 c0                	xor    eax,eax
    50ef:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 50f6 <CL_PlayDemo_f+0x256>
    50f6:	48 8d ac 24 10 10 00 	lea    rbp,[rsp+0x1010]
    50fd:	00 
    50fe:	e8 00 00 00 00       	call   5103 <CL_PlayDemo_f+0x263>
    5103:	b8 ff 0f 00 00       	mov    eax,0xfff
    5108:	48 89 ef             	mov    rdi,rbp
    510b:	4c 89 e6             	mov    rsi,r12
    510e:	48 81 fb ff 0f 00 00 	cmp    rbx,0xfff
    5115:	48 0f 47 d8          	cmova  rbx,rax
    5119:	8d 53 01             	lea    edx,[rbx+0x1]
    511c:	e8 00 00 00 00       	call   5121 <CL_PlayDemo_f+0x281>
    5121:	c6 84 1c 10 10 00 00 	mov    BYTE PTR [rsp+rbx*1+0x1010],0x0
    5128:	00 
    5129:	48 8d 5c 24 10       	lea    rbx,[rsp+0x10]
    512e:	48 89 ef             	mov    rdi,rbp
    5131:	48 8d 54 24 0c       	lea    rdx,[rsp+0xc]
    5136:	48 89 de             	mov    rsi,rbx
    5139:	e8 e2 d0 ff ff       	call   2220 <CL_WalkDemoExt>
    513e:	89 c5                	mov    ebp,eax
    5140:	e9 e1 fd ff ff       	jmp    4f26 <CL_PlayDemo_f+0x86>
    5145:	48 89 da             	mov    rdx,rbx
    5148:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 514f <CL_PlayDemo_f+0x2af>
    514f:	bf 01 00 00 00       	mov    edi,0x1
    5154:	31 c0                	xor    eax,eax
    5156:	e8 00 00 00 00       	call   515b <CL_PlayDemo_f+0x2bb>
    515b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000005160 <CL_Disconnect_f>:
CL_Disconnect_f():
    5160:	48 83 ec 08          	sub    rsp,0x8
    5164:	e8 00 00 00 00       	call   5169 <CL_Disconnect_f+0x9>
    5169:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5170 <CL_Disconnect_f+0x10>
    5170:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5177 <CL_Disconnect_f+0x17>
    5177:	e8 00 00 00 00       	call   517c <CL_Disconnect_f+0x1c>
    517c:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5182 <CL_Disconnect_f+0x22>
    5182:	83 e0 f7             	and    eax,0xfffffff7
    5185:	83 f8 01             	cmp    eax,0x1
    5188:	0f 84 aa 00 00 00    	je     5238 <CL_Disconnect_f+0xd8>
    518e:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5195 <CL_Disconnect_f+0x35>
    5195:	48 85 c0             	test   rax,rax
    5198:	74 0e                	je     51a8 <CL_Disconnect_f+0x48>
    519a:	8b 88 a0 00 00 00    	mov    ecx,DWORD PTR [rax+0xa0]
    51a0:	85 c9                	test   ecx,ecx
    51a2:	0f 85 b6 00 00 00    	jne    525e <CL_Disconnect_f+0xfe>
    51a8:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 51af <CL_Disconnect_f+0x4f>
    51af:	48 85 c0             	test   rax,rax
    51b2:	74 0e                	je     51c2 <CL_Disconnect_f+0x62>
    51b4:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
    51ba:	85 d2                	test   edx,edx
    51bc:	0f 85 9c 00 00 00    	jne    525e <CL_Disconnect_f+0xfe>
    51c2:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 51c9 <CL_Disconnect_f+0x69>
    51c9:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 51d0 <CL_Disconnect_f+0x70>
    51d0:	48 85 c0             	test   rax,rax
    51d3:	74 07                	je     51dc <CL_Disconnect_f+0x7c>
    51d5:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    51d8:	85 c0                	test   eax,eax
    51da:	75 74                	jne    5250 <CL_Disconnect_f+0xf0>
    51dc:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 51e3 <CL_Disconnect_f+0x83>
    51e3:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 51ea <CL_Disconnect_f+0x8a>
    51ea:	31 c0                	xor    eax,eax
    51ec:	e8 00 00 00 00       	call   51f1 <CL_Disconnect_f+0x91>
    51f1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 51f8 <CL_Disconnect_f+0x98>
    51f8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 51ff <CL_Disconnect_f+0x9f>
    51ff:	e8 00 00 00 00       	call   5204 <CL_Disconnect_f+0xa4>
    5204:	31 ff                	xor    edi,edi
    5206:	e8 00 00 00 00       	call   520b <CL_Disconnect_f+0xab>
    520b:	85 c0                	test   eax,eax
    520d:	74 31                	je     5240 <CL_Disconnect_f+0xe0>
    520f:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 5216 <CL_Disconnect_f+0xb6>
    5216:	48 85 ff             	test   rdi,rdi
    5219:	74 1d                	je     5238 <CL_Disconnect_f+0xd8>
    521b:	b9 01 00 00 00       	mov    ecx,0x1
    5220:	ba 07 00 00 00       	mov    edx,0x7
    5225:	31 c0                	xor    eax,eax
    5227:	48 83 c4 08          	add    rsp,0x8
    522b:	be 01 00 00 00       	mov    esi,0x1
    5230:	e9 00 00 00 00       	jmp    5235 <CL_Disconnect_f+0xd5>
    5235:	0f 1f 00             	nop    DWORD PTR [rax]
    5238:	48 83 c4 08          	add    rsp,0x8
    523c:	c3                   	ret    
    523d:	0f 1f 00             	nop    DWORD PTR [rax]
    5240:	e8 00 00 00 00       	call   5245 <CL_Disconnect_f+0xe5>
    5245:	eb c8                	jmp    520f <CL_Disconnect_f+0xaf>
    5247:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    524e:	00 00 
    5250:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5257 <CL_Disconnect_f+0xf7>
    5257:	e8 00 00 00 00       	call   525c <CL_Disconnect_f+0xfc>
    525c:	eb 93                	jmp    51f1 <CL_Disconnect_f+0x91>
    525e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5265 <CL_Disconnect_f+0x105>
    5265:	bf 03 00 00 00       	mov    edi,0x3
    526a:	31 c0                	xor    eax,eax
    526c:	e8 00 00 00 00       	call   5271 <CL_Disconnect_f+0x111>
    5271:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    5278:	00 00 00 00 
    527c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000005280 <CL_ForwardCommandToServer>:
CL_ForwardCommandToServer():
    5280:	55                   	push   rbp
    5281:	48 89 fd             	mov    rbp,rdi
    5284:	31 ff                	xor    edi,edi
    5286:	53                   	push   rbx
    5287:	48 83 ec 08          	sub    rsp,0x8
    528b:	e8 00 00 00 00       	call   5290 <CL_ForwardCommandToServer+0x10>
    5290:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    5293:	80 fa 2d             	cmp    dl,0x2d
    5296:	74 78                	je     5310 <CL_ForwardCommandToServer+0x90>
    5298:	48 89 c6             	mov    rsi,rax
    529b:	b9 09 00 00 00       	mov    ecx,0x9
    52a0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 52a7 <CL_ForwardCommandToServer+0x27>
    52a7:	48 89 c3             	mov    rbx,rax
    52aa:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    52ac:	0f 97 c0             	seta   al
    52af:	1c 00                	sbb    al,0x0
    52b1:	84 c0                	test   al,al
    52b3:	74 5b                	je     5310 <CL_ForwardCommandToServer+0x90>
    52b5:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 52bb <CL_ForwardCommandToServer+0x3b>
    52bb:	85 c0                	test   eax,eax
    52bd:	75 31                	jne    52f0 <CL_ForwardCommandToServer+0x70>
    52bf:	83 3d 00 00 00 00 04 	cmp    DWORD PTR [rip+0x0],0x4        # 52c6 <CL_ForwardCommandToServer+0x46>
    52c6:	76 28                	jbe    52f0 <CL_ForwardCommandToServer+0x70>
    52c8:	80 fa 2b             	cmp    dl,0x2b
    52cb:	74 23                	je     52f0 <CL_ForwardCommandToServer+0x70>
    52cd:	e8 00 00 00 00       	call   52d2 <CL_ForwardCommandToServer+0x52>
    52d2:	31 f6                	xor    esi,esi
    52d4:	83 f8 01             	cmp    eax,0x1
    52d7:	7e 47                	jle    5320 <CL_ForwardCommandToServer+0xa0>
    52d9:	48 83 c4 08          	add    rsp,0x8
    52dd:	48 89 ef             	mov    rdi,rbp
    52e0:	5b                   	pop    rbx
    52e1:	5d                   	pop    rbp
    52e2:	e9 59 e8 ff ff       	jmp    3b40 <CL_AddReliableCommand>
    52e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    52ee:	00 00 
    52f0:	48 83 c4 08          	add    rsp,0x8
    52f4:	48 89 de             	mov    rsi,rbx
    52f7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 52fe <CL_ForwardCommandToServer+0x7e>
    52fe:	31 c0                	xor    eax,eax
    5300:	5b                   	pop    rbx
    5301:	5d                   	pop    rbp
    5302:	e9 00 00 00 00       	jmp    5307 <CL_ForwardCommandToServer+0x87>
    5307:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    530e:	00 00 
    5310:	48 83 c4 08          	add    rsp,0x8
    5314:	5b                   	pop    rbx
    5315:	5d                   	pop    rbp
    5316:	c3                   	ret    
    5317:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    531e:	00 00 
    5320:	48 83 c4 08          	add    rsp,0x8
    5324:	48 89 df             	mov    rdi,rbx
    5327:	5b                   	pop    rbx
    5328:	5d                   	pop    rbp
    5329:	e9 12 e8 ff ff       	jmp    3b40 <CL_AddReliableCommand>
    532e:	66 90                	xchg   ax,ax

0000000000005330 <CL_NextDownload>:
CL_NextDownload():
    5330:	80 3d 00 00 00 00 00 	cmp    BYTE PTR [rip+0x0],0x0        # 5337 <CL_NextDownload+0x7>
    5337:	41 54                	push   r12
    5339:	55                   	push   rbp
    533a:	53                   	push   rbx
    533b:	74 2d                	je     536a <CL_NextDownload+0x3a>
    533d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5344 <CL_NextDownload+0x14>
    5344:	e8 00 00 00 00       	call   5349 <CL_NextDownload+0x19>
    5349:	31 d2                	xor    edx,edx
    534b:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5352 <CL_NextDownload+0x22>
    5352:	48 89 c7             	mov    rdi,rax
    5355:	e8 00 00 00 00       	call   535a <CL_NextDownload+0x2a>
    535a:	48 89 c7             	mov    rdi,rax
    535d:	e8 00 00 00 00       	call   5362 <CL_NextDownload+0x32>
    5362:	85 c0                	test   eax,eax
    5364:	0f 84 43 02 00 00    	je     55ad <CL_NextDownload+0x27d>
    536a:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5371 <CL_NextDownload+0x41>
    5371:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5378 <CL_NextDownload+0x48>
    5378:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 537f <CL_NextDownload+0x4f>
    537f:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 5386 <CL_NextDownload+0x56>
    5386:	e8 00 00 00 00       	call   538b <CL_NextDownload+0x5b>
    538b:	0f b6 05 00 00 00 00 	movzx  eax,BYTE PTR [rip+0x0]        # 5392 <CL_NextDownload+0x62>
    5392:	84 c0                	test   al,al
    5394:	0f 84 9e 00 00 00    	je     5438 <CL_NextDownload+0x108>
    539a:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 53a1 <CL_NextDownload+0x71>
    53a1:	3c 40                	cmp    al,0x40
    53a3:	be 40 00 00 00       	mov    esi,0x40
    53a8:	48 8d 43 01          	lea    rax,[rbx+0x1]
    53ac:	48 0f 44 d8          	cmove  rbx,rax
    53b0:	48 89 df             	mov    rdi,rbx
    53b3:	e8 00 00 00 00       	call   53b8 <CL_NextDownload+0x88>
    53b8:	48 85 c0             	test   rax,rax
    53bb:	74 7b                	je     5438 <CL_NextDownload+0x108>
    53bd:	c6 00 00             	mov    BYTE PTR [rax],0x0
    53c0:	48 8d 68 01          	lea    rbp,[rax+0x1]
    53c4:	be 40 00 00 00       	mov    esi,0x40
    53c9:	48 89 ef             	mov    rdi,rbp
    53cc:	e8 00 00 00 00       	call   53d1 <CL_NextDownload+0xa1>
    53d1:	48 85 c0             	test   rax,rax
    53d4:	0f 84 5e 01 00 00    	je     5538 <CL_NextDownload+0x208>
    53da:	c6 00 00             	mov    BYTE PTR [rax],0x0
    53dd:	4c 8d 60 01          	lea    r12,[rax+0x1]
    53e1:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 53e8 <CL_NextDownload+0xb8>
    53e8:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 53ee <CL_NextDownload+0xbe>
    53ee:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    53f1:	89 f0                	mov    eax,esi
    53f3:	83 e0 02             	and    eax,0x2
    53f6:	f6 c2 02             	test   dl,0x2
    53f9:	75 4d                	jne    5448 <CL_NextDownload+0x118>
    53fb:	85 c0                	test   eax,eax
    53fd:	0f 85 8d 01 00 00    	jne    5590 <CL_NextDownload+0x260>
    5403:	80 3d 00 00 00 00 00 	cmp    BYTE PTR [rip+0x0],0x0        # 540a <CL_NextDownload+0xda>
    540a:	0f 84 40 01 00 00    	je     5550 <CL_NextDownload+0x220>
    5410:	e8 00 00 00 00       	call   5415 <CL_NextDownload+0xe5>
    5415:	85 c0                	test   eax,eax
    5417:	0f 85 ab 01 00 00    	jne    55c8 <CL_NextDownload+0x298>
    541d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5424 <CL_NextDownload+0xf4>
    5424:	e8 00 00 00 00       	call   5429 <CL_NextDownload+0xf9>
    5429:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5430 <CL_NextDownload+0x100>
    5430:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    5433:	eb 1b                	jmp    5450 <CL_NextDownload+0x120>
    5435:	0f 1f 00             	nop    DWORD PTR [rax]
    5438:	5b                   	pop    rbx
    5439:	5d                   	pop    rbp
    543a:	41 5c                	pop    r12
    543c:	e9 ef ea ff ff       	jmp    3f30 <CL_DownloadsComplete>
    5441:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    5448:	85 c0                	test   eax,eax
    544a:	0f 84 20 01 00 00    	je     5570 <CL_NextDownload+0x240>
    5450:	f6 c2 04             	test   dl,0x4
    5453:	0f 85 97 01 00 00    	jne    55f0 <CL_NextDownload+0x2c0>
    5459:	31 c0                	xor    eax,eax
    545b:	48 89 da             	mov    rdx,rbx
    545e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5465 <CL_NextDownload+0x135>
    5465:	48 89 ee             	mov    rsi,rbp
    5468:	e8 00 00 00 00       	call   546d <CL_NextDownload+0x13d>
    546d:	ba 00 10 00 00       	mov    edx,0x1000
    5472:	48 89 ee             	mov    rsi,rbp
    5475:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 547c <CL_NextDownload+0x14c>
    547c:	e8 00 00 00 00       	call   5481 <CL_NextDownload+0x151>
    5481:	48 89 e9             	mov    rcx,rbp
    5484:	be 04 10 00 00       	mov    esi,0x1004
    5489:	31 c0                	xor    eax,eax
    548b:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 5492 <CL_NextDownload+0x162>
    5492:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5499 <CL_NextDownload+0x169>
    5499:	e8 00 00 00 00       	call   549e <CL_NextDownload+0x16e>
    549e:	48 89 de             	mov    rsi,rbx
    54a1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 54a8 <CL_NextDownload+0x178>
    54a8:	e8 00 00 00 00       	call   54ad <CL_NextDownload+0x17d>
    54ad:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 54b4 <CL_NextDownload+0x184>
    54b4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 54bb <CL_NextDownload+0x18b>
    54bb:	e8 00 00 00 00       	call   54c0 <CL_NextDownload+0x190>
    54c0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 54c7 <CL_NextDownload+0x197>
    54c7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 54ce <CL_NextDownload+0x19e>
    54ce:	e8 00 00 00 00       	call   54d3 <CL_NextDownload+0x1a3>
    54d3:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 54d9 <CL_NextDownload+0x1a9>
    54d9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 54e0 <CL_NextDownload+0x1b0>
    54e0:	e8 00 00 00 00       	call   54e5 <CL_NextDownload+0x1b5>
    54e5:	48 89 de             	mov    rsi,rbx
    54e8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 54ef <CL_NextDownload+0x1bf>
    54ef:	31 c0                	xor    eax,eax
    54f1:	48 c7 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],0x0        # 54fc <CL_NextDownload+0x1cc>
    54f8:	00 00 00 00 
    54fc:	e8 00 00 00 00       	call   5501 <CL_NextDownload+0x1d1>
    5501:	31 f6                	xor    esi,esi
    5503:	48 89 c7             	mov    rdi,rax
    5506:	e8 00 00 00 00       	call   550b <CL_NextDownload+0x1db>
    550b:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 5515 <CL_NextDownload+0x1e5>
    5512:	00 00 00 
    5515:	4c 89 e7             	mov    rdi,r12
    5518:	e8 00 00 00 00       	call   551d <CL_NextDownload+0x1ed>
    551d:	5b                   	pop    rbx
    551e:	4c 89 e6             	mov    rsi,r12
    5521:	5d                   	pop    rbp
    5522:	48 8d 50 01          	lea    rdx,[rax+0x1]
    5526:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 552d <CL_NextDownload+0x1fd>
    552d:	41 5c                	pop    r12
    552f:	e9 00 00 00 00       	jmp    5534 <CL_NextDownload+0x204>
    5534:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    5538:	48 89 ef             	mov    rdi,rbp
    553b:	e8 00 00 00 00       	call   5540 <CL_NextDownload+0x210>
    5540:	4c 8d 64 05 00       	lea    r12,[rbp+rax*1+0x0]
    5545:	e9 97 fe ff ff       	jmp    53e1 <CL_NextDownload+0xb1>
    554a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5550:	31 c0                	xor    eax,eax
    5552:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5559 <CL_NextDownload+0x229>
    5559:	e8 00 00 00 00       	call   555e <CL_NextDownload+0x22e>
    555e:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5565 <CL_NextDownload+0x235>
    5565:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    5568:	e9 e3 fe ff ff       	jmp    5450 <CL_NextDownload+0x120>
    556d:	0f 1f 00             	nop    DWORD PTR [rax]
    5570:	89 d6                	mov    esi,edx
    5572:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5579 <CL_NextDownload+0x249>
    5579:	e8 00 00 00 00       	call   557e <CL_NextDownload+0x24e>
    557e:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5585 <CL_NextDownload+0x255>
    5585:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    5588:	e9 c3 fe ff ff       	jmp    5450 <CL_NextDownload+0x120>
    558d:	0f 1f 00             	nop    DWORD PTR [rax]
    5590:	31 c0                	xor    eax,eax
    5592:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5599 <CL_NextDownload+0x269>
    5599:	e8 00 00 00 00       	call   559e <CL_NextDownload+0x26e>
    559e:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 55a5 <CL_NextDownload+0x275>
    55a5:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    55a8:	e9 a3 fe ff ff       	jmp    5450 <CL_NextDownload+0x120>
    55ad:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 55b4 <CL_NextDownload+0x284>
    55b4:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 55bb <CL_NextDownload+0x28b>
    55bb:	bf 01 00 00 00       	mov    edi,0x1
    55c0:	e8 00 00 00 00       	call   55c5 <CL_NextDownload+0x295>
    55c5:	0f 1f 00             	nop    DWORD PTR [rax]
    55c8:	48 89 da             	mov    rdx,rbx
    55cb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 55d2 <CL_NextDownload+0x2a2>
    55d2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 55d9 <CL_NextDownload+0x2a9>
    55d9:	31 c0                	xor    eax,eax
    55db:	e8 00 00 00 00       	call   55e0 <CL_NextDownload+0x2b0>
    55e0:	48 89 ef             	mov    rdi,rbp
    55e3:	48 89 c6             	mov    rsi,rax
    55e6:	e8 00 00 00 00       	call   55eb <CL_NextDownload+0x2bb>
    55eb:	e9 1b ff ff ff       	jmp    550b <CL_NextDownload+0x1db>
    55f0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 55f7 <CL_NextDownload+0x2c7>
    55f7:	bf 01 00 00 00       	mov    edi,0x1
    55fc:	31 c0                	xor    eax,eax
    55fe:	e8 00 00 00 00       	call   5603 <CL_NextDownload+0x2d3>
    5603:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    560a:	00 00 00 00 
    560e:	66 90                	xchg   ax,ax

0000000000005610 <hash_func>:
hash_func():
    5610:	8b 0f                	mov    ecx,DWORD PTR [rdi]
    5612:	83 f9 04             	cmp    ecx,0x4
    5615:	74 41                	je     5658 <hash_func+0x48>
    5617:	83 f9 05             	cmp    ecx,0x5
    561a:	75 34                	jne    5650 <hash_func+0x40>
    561c:	48 83 c7 04          	add    rdi,0x4
    5620:	b9 10 00 00 00       	mov    ecx,0x10
    5625:	48 01 f9             	add    rcx,rdi
    5628:	31 c0                	xor    eax,eax
    562a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5630:	6b c0 65             	imul   eax,eax,0x65
    5633:	48 83 c7 01          	add    rdi,0x1
    5637:	0f b6 57 ff          	movzx  edx,BYTE PTR [rdi-0x1]
    563b:	01 d0                	add    eax,edx
    563d:	48 39 cf             	cmp    rdi,rcx
    5640:	75 ee                	jne    5630 <hash_func+0x20>
    5642:	89 c2                	mov    edx,eax
    5644:	c1 ea 10             	shr    edx,0x10
    5647:	31 d0                	xor    eax,edx
    5649:	25 ff 03 00 00       	and    eax,0x3ff
    564e:	c3                   	ret    
    564f:	90                   	nop
    5650:	31 c0                	xor    eax,eax
    5652:	c3                   	ret    
    5653:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    5658:	48 83 c7 04          	add    rdi,0x4
    565c:	eb c7                	jmp    5625 <hash_func+0x15>
    565e:	66 90                	xchg   ax,ax

0000000000005660 <CL_PacketEvent>:
CL_PacketEvent():
    5660:	41 55                	push   r13
    5662:	41 54                	push   r12
    5664:	55                   	push   rbp
    5665:	48 89 fd             	mov    rbp,rdi
    5668:	53                   	push   rbx
    5669:	48 83 ec 18          	sub    rsp,0x18
    566d:	83 7e 20 04          	cmp    DWORD PTR [rsi+0x20],0x4
    5671:	7e 6d                	jle    56e0 <CL_PacketEvent+0x80>
    5673:	48 8b 46 10          	mov    rax,QWORD PTR [rsi+0x10]
    5677:	48 89 f3             	mov    rbx,rsi
    567a:	83 38 ff             	cmp    DWORD PTR [rax],0xffffffff
    567d:	0f 84 3d 01 00 00    	je     57c0 <CL_PacketEvent+0x160>
    5683:	83 3d 00 00 00 00 04 	cmp    DWORD PTR [rip+0x0],0x4        # 568a <CL_PacketEvent+0x2a>
    568a:	77 14                	ja     56a0 <CL_PacketEvent+0x40>
    568c:	48 83 c4 18          	add    rsp,0x18
    5690:	5b                   	pop    rbx
    5691:	5d                   	pop    rbp
    5692:	41 5c                	pop    r12
    5694:	41 5d                	pop    r13
    5696:	c3                   	ret    
    5697:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    569e:	00 00 
    56a0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 56a7 <CL_PacketEvent+0x47>
    56a7:	e8 00 00 00 00       	call   56ac <CL_PacketEvent+0x4c>
    56ac:	85 c0                	test   eax,eax
    56ae:	75 58                	jne    5708 <CL_PacketEvent+0xa8>
    56b0:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 56b7 <CL_PacketEvent+0x57>
    56b7:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    56ba:	85 d2                	test   edx,edx
    56bc:	74 ce                	je     568c <CL_PacketEvent+0x2c>
    56be:	48 89 ef             	mov    rdi,rbp
    56c1:	e8 00 00 00 00       	call   56c6 <CL_PacketEvent+0x66>
    56c6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 56cd <CL_PacketEvent+0x6d>
    56cd:	48 89 c6             	mov    rsi,rax
    56d0:	31 c0                	xor    eax,eax
    56d2:	e8 00 00 00 00       	call   56d7 <CL_PacketEvent+0x77>
    56d7:	eb b3                	jmp    568c <CL_PacketEvent+0x2c>
    56d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    56e0:	e8 00 00 00 00       	call   56e5 <CL_PacketEvent+0x85>
    56e5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 56ec <CL_PacketEvent+0x8c>
    56ec:	48 89 c6             	mov    rsi,rax
    56ef:	31 c0                	xor    eax,eax
    56f1:	e8 00 00 00 00       	call   56f6 <CL_PacketEvent+0x96>
    56f6:	48 83 c4 18          	add    rsp,0x18
    56fa:	5b                   	pop    rbx
    56fb:	5d                   	pop    rbp
    56fc:	41 5c                	pop    r12
    56fe:	41 5d                	pop    r13
    5700:	c3                   	ret    
    5701:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    5708:	48 89 de             	mov    rsi,rbx
    570b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5712 <CL_PacketEvent+0xb2>
    5712:	e8 00 00 00 00       	call   5717 <CL_PacketEvent+0xb7>
    5717:	85 c0                	test   eax,eax
    5719:	0f 84 6d ff ff ff    	je     568c <CL_PacketEvent+0x2c>
    571f:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
    5723:	8b 6b 24             	mov    ebp,DWORD PTR [rbx+0x24]
    5726:	48 89 df             	mov    rdi,rbx
    5729:	8b 00                	mov    eax,DWORD PTR [rax]
    572b:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 5731 <CL_PacketEvent+0xd1>
    5731:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5737 <CL_PacketEvent+0xd7>
    5737:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 573d <CL_PacketEvent+0xdd>
    573d:	e8 00 00 00 00       	call   5742 <CL_PacketEvent+0xe2>
    5742:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5748 <CL_PacketEvent+0xe8>
    5748:	85 c0                	test   eax,eax
    574a:	0f 84 3c ff ff ff    	je     568c <CL_PacketEvent+0x2c>
    5750:	48 83 3d 00 00 00 00 	cmp    QWORD PTR [rip+0x0],0x0        # 5758 <CL_PacketEvent+0xf8>
    5757:	00 
    5758:	0f 85 2e ff ff ff    	jne    568c <CL_PacketEvent+0x2c>
    575e:	4c 8d 6c 24 0c       	lea    r13,[rsp+0xc]
    5763:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5769 <CL_PacketEvent+0x109>
    5769:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 576f <CL_PacketEvent+0x10f>
    576f:	be 04 00 00 00       	mov    esi,0x4
    5774:	4c 89 ef             	mov    rdi,r13
    5777:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
    577b:	e8 00 00 00 00       	call   5780 <CL_PacketEvent+0x120>
    5780:	44 8b 63 20          	mov    r12d,DWORD PTR [rbx+0x20]
    5784:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 578a <CL_PacketEvent+0x12a>
    578a:	4c 89 ef             	mov    rdi,r13
    578d:	be 04 00 00 00       	mov    esi,0x4
    5792:	41 29 ec             	sub    r12d,ebp
    5795:	44 89 64 24 0c       	mov    DWORD PTR [rsp+0xc],r12d
    579a:	e8 00 00 00 00       	call   579f <CL_PacketEvent+0x13f>
    579f:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 57a5 <CL_PacketEvent+0x145>
    57a5:	48 63 fd             	movsxd rdi,ebp
    57a8:	44 89 e6             	mov    esi,r12d
    57ab:	48 03 7b 10          	add    rdi,QWORD PTR [rbx+0x10]
    57af:	e8 00 00 00 00       	call   57b4 <CL_PacketEvent+0x154>
    57b4:	e9 d3 fe ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    57b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    57c0:	48 89 f7             	mov    rdi,rsi
    57c3:	e8 00 00 00 00       	call   57c8 <CL_PacketEvent+0x168>
    57c8:	48 89 df             	mov    rdi,rbx
    57cb:	e8 00 00 00 00       	call   57d0 <CL_PacketEvent+0x170>
    57d0:	48 89 df             	mov    rdi,rbx
    57d3:	e8 00 00 00 00       	call   57d8 <CL_PacketEvent+0x178>
    57d8:	48 89 c7             	mov    rdi,rax
    57db:	49 89 c5             	mov    r13,rax
    57de:	e8 00 00 00 00       	call   57e3 <CL_PacketEvent+0x183>
    57e3:	31 ff                	xor    edi,edi
    57e5:	e8 00 00 00 00       	call   57ea <CL_PacketEvent+0x18a>
    57ea:	49 89 c4             	mov    r12,rax
    57ed:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 57f4 <CL_PacketEvent+0x194>
    57f4:	8b 70 30             	mov    esi,DWORD PTR [rax+0x30]
    57f7:	85 f6                	test   esi,esi
    57f9:	0f 85 e9 00 00 00    	jne    58e8 <CL_PacketEvent+0x288>
    57ff:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5806 <CL_PacketEvent+0x1a6>
    5806:	4c 89 e7             	mov    rdi,r12
    5809:	e8 00 00 00 00       	call   580e <CL_PacketEvent+0x1ae>
    580e:	41 89 c5             	mov    r13d,eax
    5811:	85 c0                	test   eax,eax
    5813:	0f 85 8f 00 00 00    	jne    58a8 <CL_PacketEvent+0x248>
    5819:	83 3d 00 00 00 00 03 	cmp    DWORD PTR [rip+0x0],0x3        # 5820 <CL_PacketEvent+0x1c0>
    5820:	75 6e                	jne    5890 <CL_PacketEvent+0x230>
    5822:	bf 02 00 00 00       	mov    edi,0x2
    5827:	e8 00 00 00 00       	call   582c <CL_PacketEvent+0x1cc>
    582c:	80 38 00             	cmp    BYTE PTR [rax],0x0
    582f:	48 89 c3             	mov    rbx,rax
    5832:	0f 85 b8 01 00 00    	jne    59f0 <CL_PacketEvent+0x390>
    5838:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 5842 <CL_PacketEvent+0x1e2>
    583f:	00 00 00 
    5842:	bf 03 00 00 00       	mov    edi,0x3
    5847:	e8 00 00 00 00       	call   584c <CL_PacketEvent+0x1ec>
    584c:	80 38 00             	cmp    BYTE PTR [rax],0x0
    584f:	0f 85 6b 01 00 00    	jne    59c0 <CL_PacketEvent+0x360>
    5855:	8b 0d 00 00 00 00    	mov    ecx,DWORD PTR [rip+0x0]        # 585b <CL_PacketEvent+0x1fb>
    585b:	85 c9                	test   ecx,ecx
    585d:	0f 85 1d 01 00 00    	jne    5980 <CL_PacketEvent+0x320>
    5863:	80 3b 00             	cmp    BYTE PTR [rbx],0x0
    5866:	74 0d                	je     5875 <CL_PacketEvent+0x215>
    5868:	44 3b 2d 00 00 00 00 	cmp    r13d,DWORD PTR [rip+0x0]        # 586f <CL_PacketEvent+0x20f>
    586f:	0f 84 9b 00 00 00    	je     5910 <CL_PacketEvent+0x2b0>
    5875:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 587c <CL_PacketEvent+0x21c>
    587c:	31 c0                	xor    eax,eax
    587e:	e8 00 00 00 00       	call   5883 <CL_PacketEvent+0x223>
    5883:	e9 04 fe ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5888:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    588f:	00 
    5890:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5897 <CL_PacketEvent+0x237>
    5897:	31 c0                	xor    eax,eax
    5899:	e8 00 00 00 00       	call   589e <CL_PacketEvent+0x23e>
    589e:	e9 e9 fd ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    58a3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    58a8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 58af <CL_PacketEvent+0x24f>
    58af:	4c 89 e7             	mov    rdi,r12
    58b2:	e8 00 00 00 00       	call   58b7 <CL_PacketEvent+0x257>
    58b7:	85 c0                	test   eax,eax
    58b9:	0f 85 51 01 00 00    	jne    5a10 <CL_PacketEvent+0x3b0>
    58bf:	83 3d 00 00 00 00 04 	cmp    DWORD PTR [rip+0x0],0x4        # 58c6 <CL_PacketEvent+0x266>
    58c6:	0f 87 84 02 00 00    	ja     5b50 <CL_PacketEvent+0x4f0>
    58cc:	0f 84 16 02 00 00    	je     5ae8 <CL_PacketEvent+0x488>
    58d2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 58d9 <CL_PacketEvent+0x279>
    58d9:	31 c0                	xor    eax,eax
    58db:	e8 00 00 00 00       	call   58e0 <CL_PacketEvent+0x280>
    58e0:	e9 a7 fd ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    58e5:	0f 1f 00             	nop    DWORD PTR [rax]
    58e8:	48 89 ef             	mov    rdi,rbp
    58eb:	e8 00 00 00 00       	call   58f0 <CL_PacketEvent+0x290>
    58f0:	4c 89 ea             	mov    rdx,r13
    58f3:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 58fa <CL_PacketEvent+0x29a>
    58fa:	48 89 c6             	mov    rsi,rax
    58fd:	31 c0                	xor    eax,eax
    58ff:	e8 00 00 00 00       	call   5904 <CL_PacketEvent+0x2a4>
    5904:	e9 f6 fe ff ff       	jmp    57ff <CL_PacketEvent+0x19f>
    5909:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    5910:	bf 01 00 00 00       	mov    edi,0x1
    5915:	e8 00 00 00 00       	call   591a <CL_PacketEvent+0x2ba>
    591a:	31 f6                	xor    esi,esi
    591c:	ba 0a 00 00 00       	mov    edx,0xa
    5921:	48 89 c7             	mov    rdi,rax
    5924:	e8 00 00 00 00       	call   5929 <CL_PacketEvent+0x2c9>
    5929:	f3 0f 6f 45 00       	movdqu xmm0,XMMWORD PTR [rbp+0x0]
    592e:	b9 61 79 fe ff       	mov    ecx,0xfffe7961
    5933:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 593a <CL_PacketEvent+0x2da>
    593a:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 5940 <CL_PacketEvent+0x2e0>
    5940:	89 c6                	mov    esi,eax
    5942:	31 c0                	xor    eax,eax
    5944:	0f 11 05 00 00 00 00 	movups XMMWORD PTR [rip+0x0],xmm0        # 594b <CL_PacketEvent+0x2eb>
    594b:	f3 0f 6f 4d 10       	movdqu xmm1,XMMWORD PTR [rbp+0x10]
    5950:	c7 05 00 00 00 00 04 	mov    DWORD PTR [rip+0x0],0x4        # 595a <CL_PacketEvent+0x2fa>
    5957:	00 00 00 
    595a:	48 89 0d 00 00 00 00 	mov    QWORD PTR [rip+0x0],rcx        # 5961 <CL_PacketEvent+0x301>
    5961:	0f 11 0d 00 00 00 00 	movups XMMWORD PTR [rip+0x0],xmm1        # 5968 <CL_PacketEvent+0x308>
    5968:	e8 00 00 00 00       	call   596d <CL_PacketEvent+0x30d>
    596d:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5973 <CL_PacketEvent+0x313>
    5973:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 5979 <CL_PacketEvent+0x319>
    5979:	e9 0e fd ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    597e:	66 90                	xchg   ax,ax
    5980:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5987 <CL_PacketEvent+0x327>
    5987:	48 89 ef             	mov    rdi,rbp
    598a:	e8 00 00 00 00       	call   598f <CL_PacketEvent+0x32f>
    598f:	85 c0                	test   eax,eax
    5991:	0f 85 79 ff ff ff    	jne    5910 <CL_PacketEvent+0x2b0>
    5997:	80 3b 00             	cmp    BYTE PTR [rbx],0x0
    599a:	74 0d                	je     59a9 <CL_PacketEvent+0x349>
    599c:	44 39 2d 00 00 00 00 	cmp    DWORD PTR [rip+0x0],r13d        # 59a3 <CL_PacketEvent+0x343>
    59a3:	0f 84 67 ff ff ff    	je     5910 <CL_PacketEvent+0x2b0>
    59a9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 59b0 <CL_PacketEvent+0x350>
    59b0:	31 c0                	xor    eax,eax
    59b2:	e8 00 00 00 00       	call   59b7 <CL_PacketEvent+0x357>
    59b7:	e9 d0 fc ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    59bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    59c0:	31 f6                	xor    esi,esi
    59c2:	ba 0a 00 00 00       	mov    edx,0xa
    59c7:	48 89 c7             	mov    rdi,rax
    59ca:	e8 00 00 00 00       	call   59cf <CL_PacketEvent+0x36f>
    59cf:	83 f8 44             	cmp    eax,0x44
    59d2:	0f 84 7d fe ff ff    	je     5855 <CL_PacketEvent+0x1f5>
    59d8:	83 f8 47             	cmp    eax,0x47
    59db:	0f 85 d5 01 00 00    	jne    5bb6 <CL_PacketEvent+0x556>
    59e1:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 59eb <CL_PacketEvent+0x38b>
    59e8:	00 00 00 
    59eb:	e9 73 fe ff ff       	jmp    5863 <CL_PacketEvent+0x203>
    59f0:	ba 0a 00 00 00       	mov    edx,0xa
    59f5:	31 f6                	xor    esi,esi
    59f7:	48 89 c7             	mov    rdi,rax
    59fa:	e8 00 00 00 00       	call   59ff <CL_PacketEvent+0x39f>
    59ff:	41 89 c5             	mov    r13d,eax
    5a02:	e9 31 fe ff ff       	jmp    5838 <CL_PacketEvent+0x1d8>
    5a07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    5a0e:	00 00 
    5a10:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5a17 <CL_PacketEvent+0x3b7>
    5a17:	4c 89 e7             	mov    rdi,r12
    5a1a:	e8 00 00 00 00       	call   5a1f <CL_PacketEvent+0x3bf>
    5a1f:	85 c0                	test   eax,eax
    5a21:	0f 84 7f 01 00 00    	je     5ba6 <CL_PacketEvent+0x546>
    5a27:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5a2e <CL_PacketEvent+0x3ce>
    5a2e:	4c 89 e7             	mov    rdi,r12
    5a31:	e8 00 00 00 00       	call   5a36 <CL_PacketEvent+0x3d6>
    5a36:	85 c0                	test   eax,eax
    5a38:	0f 84 97 01 00 00    	je     5bd5 <CL_PacketEvent+0x575>
    5a3e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5a45 <CL_PacketEvent+0x3e5>
    5a45:	4c 89 e7             	mov    rdi,r12
    5a48:	e8 00 00 00 00       	call   5a4d <CL_PacketEvent+0x3ed>
    5a4d:	85 c0                	test   eax,eax
    5a4f:	0f 84 b4 01 00 00    	je     5c09 <CL_PacketEvent+0x5a9>
    5a55:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5a5c <CL_PacketEvent+0x3fc>
    5a5c:	4c 89 e7             	mov    rdi,r12
    5a5f:	e8 00 00 00 00       	call   5a64 <CL_PacketEvent+0x404>
    5a64:	85 c0                	test   eax,eax
    5a66:	0f 84 20 fc ff ff    	je     568c <CL_PacketEvent+0x2c>
    5a6c:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5a73 <CL_PacketEvent+0x413>
    5a73:	4c 89 e7             	mov    rdi,r12
    5a76:	e8 00 00 00 00       	call   5a7b <CL_PacketEvent+0x41b>
    5a7b:	85 c0                	test   eax,eax
    5a7d:	0f 84 e1 01 00 00    	je     5c64 <CL_PacketEvent+0x604>
    5a83:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5a8a <CL_PacketEvent+0x42a>
    5a8a:	4c 89 e7             	mov    rdi,r12
    5a8d:	e8 00 00 00 00       	call   5a92 <CL_PacketEvent+0x432>
    5a92:	85 c0                	test   eax,eax
    5a94:	0f 84 4e 02 00 00    	je     5ce8 <CL_PacketEvent+0x688>
    5a9a:	ba 12 00 00 00       	mov    edx,0x12
    5a9f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5aa6 <CL_PacketEvent+0x446>
    5aa6:	4c 89 e7             	mov    rdi,r12
    5aa9:	e8 00 00 00 00       	call   5aae <CL_PacketEvent+0x44e>
    5aae:	85 c0                	test   eax,eax
    5ab0:	0f 84 94 02 00 00    	je     5d4a <CL_PacketEvent+0x6ea>
    5ab6:	ba 15 00 00 00       	mov    edx,0x15
    5abb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5ac2 <CL_PacketEvent+0x462>
    5ac2:	4c 89 e7             	mov    rdi,r12
    5ac5:	e8 00 00 00 00       	call   5aca <CL_PacketEvent+0x46a>
    5aca:	85 c0                	test   eax,eax
    5acc:	0f 84 90 02 00 00    	je     5d62 <CL_PacketEvent+0x702>
    5ad2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5ad9 <CL_PacketEvent+0x479>
    5ad9:	31 c0                	xor    eax,eax
    5adb:	e8 00 00 00 00       	call   5ae0 <CL_PacketEvent+0x480>
    5ae0:	e9 a7 fb ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5ae5:	0f 1f 00             	nop    DWORD PTR [rax]
    5ae8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5aef <CL_PacketEvent+0x48f>
    5aef:	48 89 ef             	mov    rdi,rbp
    5af2:	e8 00 00 00 00       	call   5af7 <CL_PacketEvent+0x497>
    5af7:	85 c0                	test   eax,eax
    5af9:	0f 84 e6 00 00 00    	je     5be5 <CL_PacketEvent+0x585>
    5aff:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 5b05 <CL_PacketEvent+0x4a5>
    5b05:	85 db                	test   ebx,ebx
    5b07:	75 58                	jne    5b61 <CL_PacketEvent+0x501>
    5b09:	bf 01 00 00 00       	mov    edi,0x1
    5b0e:	e8 00 00 00 00       	call   5b13 <CL_PacketEvent+0x4b3>
    5b13:	80 38 00             	cmp    BYTE PTR [rax],0x0
    5b16:	0f 84 da 00 00 00    	je     5bf6 <CL_PacketEvent+0x596>
    5b1c:	ba 0a 00 00 00       	mov    edx,0xa
    5b21:	31 f6                	xor    esi,esi
    5b23:	48 89 c7             	mov    rdi,rax
    5b26:	e8 00 00 00 00       	call   5b2b <CL_PacketEvent+0x4cb>
    5b2b:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # 5b32 <CL_PacketEvent+0x4d2>
    5b32:	8b 1d 00 00 00 00    	mov    ebx,DWORD PTR [rip+0x0]        # 5b38 <CL_PacketEvent+0x4d8>
    5b38:	41 39 c4             	cmp    r12d,eax
    5b3b:	74 2b                	je     5b68 <CL_PacketEvent+0x508>
    5b3d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5b44 <CL_PacketEvent+0x4e4>
    5b44:	31 c0                	xor    eax,eax
    5b46:	e8 00 00 00 00       	call   5b4b <CL_PacketEvent+0x4eb>
    5b4b:	e9 3c fb ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5b50:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5b57 <CL_PacketEvent+0x4f7>
    5b57:	e8 00 00 00 00       	call   5b5c <CL_PacketEvent+0x4fc>
    5b5c:	e9 2b fb ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5b61:	44 8b 25 00 00 00 00 	mov    r12d,DWORD PTR [rip+0x0]        # 5b68 <CL_PacketEvent+0x508>
    5b68:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5b6f <CL_PacketEvent+0x50f>
    5b6f:	e8 00 00 00 00       	call   5b74 <CL_PacketEvent+0x514>
    5b74:	41 89 d9             	mov    r9d,ebx
    5b77:	45 89 e0             	mov    r8d,r12d
    5b7a:	48 89 ea             	mov    rdx,rbp
    5b7d:	89 c1                	mov    ecx,eax
    5b7f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5b86 <CL_PacketEvent+0x526>
    5b86:	31 ff                	xor    edi,edi
    5b88:	e8 00 00 00 00       	call   5b8d <CL_PacketEvent+0x52d>
    5b8d:	c7 05 00 00 00 00 05 	mov    DWORD PTR [rip+0x0],0x5        # 5b97 <CL_PacketEvent+0x537>
    5b94:	00 00 00 
    5b97:	c7 05 00 00 00 00 f1 	mov    DWORD PTR [rip+0x0],0xffffd8f1        # 5ba1 <CL_PacketEvent+0x541>
    5b9e:	d8 ff ff 
    5ba1:	e9 c7 fd ff ff       	jmp    596d <CL_PacketEvent+0x30d>
    5ba6:	48 89 de             	mov    rsi,rbx
    5ba9:	48 89 ef             	mov    rdi,rbp
    5bac:	e8 ff cc ff ff       	call   28b0 <CL_ServerInfoPacket>
    5bb1:	e9 d6 fa ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5bb6:	89 c6                	mov    esi,eax
    5bb8:	b9 44 00 00 00       	mov    ecx,0x44
    5bbd:	ba 47 00 00 00       	mov    edx,0x47
    5bc2:	31 c0                	xor    eax,eax
    5bc4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5bcb <CL_PacketEvent+0x56b>
    5bcb:	e8 00 00 00 00       	call   5bd0 <CL_PacketEvent+0x570>
    5bd0:	e9 80 fc ff ff       	jmp    5855 <CL_PacketEvent+0x1f5>
    5bd5:	48 89 de             	mov    rsi,rbx
    5bd8:	48 89 ef             	mov    rdi,rbp
    5bdb:	e8 e0 b0 ff ff       	call   cc0 <CL_ServerStatusResponse>
    5be0:	e9 a7 fa ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5be5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5bec <CL_PacketEvent+0x58c>
    5bec:	e8 00 00 00 00       	call   5bf1 <CL_PacketEvent+0x591>
    5bf1:	e9 96 fa ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5bf6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5bfd <CL_PacketEvent+0x59d>
    5bfd:	31 c0                	xor    eax,eax
    5bff:	e8 00 00 00 00       	call   5c04 <CL_PacketEvent+0x5a4>
    5c04:	e9 83 fa ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5c09:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5c10 <CL_PacketEvent+0x5b0>
    5c10:	48 89 ef             	mov    rdi,rbp
    5c13:	e8 00 00 00 00       	call   5c18 <CL_PacketEvent+0x5b8>
    5c18:	41 89 c4             	mov    r12d,eax
    5c1b:	85 c0                	test   eax,eax
    5c1d:	75 17                	jne    5c36 <CL_PacketEvent+0x5d6>
    5c1f:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5c26 <CL_PacketEvent+0x5c6>
    5c26:	48 89 ef             	mov    rdi,rbp
    5c29:	e8 00 00 00 00       	call   5c2e <CL_PacketEvent+0x5ce>
    5c2e:	85 c0                	test   eax,eax
    5c30:	0f 84 56 fa ff ff    	je     568c <CL_PacketEvent+0x2c>
    5c36:	bf 01 00 00 00       	mov    edi,0x1
    5c3b:	e8 00 00 00 00       	call   5c40 <CL_PacketEvent+0x5e0>
    5c40:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 5c47 <CL_PacketEvent+0x5e7>
    5c47:	48 89 ee             	mov    rsi,rbp
    5c4a:	31 ff                	xor    edi,edi
    5c4c:	48 89 c1             	mov    rcx,rax
    5c4f:	31 c0                	xor    eax,eax
    5c51:	e8 00 00 00 00       	call   5c56 <CL_PacketEvent+0x5f6>
    5c56:	45 85 e4             	test   r12d,r12d
    5c59:	0f 85 0e fd ff ff    	jne    596d <CL_PacketEvent+0x30d>
    5c5f:	e9 28 fa ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5c64:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5c6b <CL_PacketEvent+0x60b>
    5c6b:	48 89 ef             	mov    rdi,rbp
    5c6e:	e8 00 00 00 00       	call   5c73 <CL_PacketEvent+0x613>
    5c73:	85 c0                	test   eax,eax
    5c75:	0f 84 11 fa ff ff    	je     568c <CL_PacketEvent+0x2c>
    5c7b:	bf 01 00 00 00       	mov    edi,0x1
    5c80:	e8 00 00 00 00       	call   5c85 <CL_PacketEvent+0x625>
    5c85:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5c8c <CL_PacketEvent+0x62c>
    5c8c:	48 89 c7             	mov    rdi,rax
    5c8f:	48 89 c3             	mov    rbx,rax
    5c92:	e8 00 00 00 00       	call   5c97 <CL_PacketEvent+0x637>
    5c97:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5c9e <CL_PacketEvent+0x63e>
    5c9e:	48 89 c7             	mov    rdi,rax
    5ca1:	e8 00 00 00 00       	call   5ca6 <CL_PacketEvent+0x646>
    5ca6:	85 c0                	test   eax,eax
    5ca8:	0f 85 de f9 ff ff    	jne    568c <CL_PacketEvent+0x2c>
    5cae:	48 89 df             	mov    rdi,rbx
    5cb1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5cb8 <CL_PacketEvent+0x658>
    5cb8:	e8 00 00 00 00       	call   5cbd <CL_PacketEvent+0x65d>
    5cbd:	48 89 de             	mov    rsi,rbx
    5cc0:	ba 00 04 00 00       	mov    edx,0x400
    5cc5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5ccc <CL_PacketEvent+0x66c>
    5ccc:	48 89 c5             	mov    rbp,rax
    5ccf:	e8 00 00 00 00       	call   5cd4 <CL_PacketEvent+0x674>
    5cd4:	48 89 ee             	mov    rsi,rbp
    5cd7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5cde <CL_PacketEvent+0x67e>
    5cde:	e8 00 00 00 00       	call   5ce3 <CL_PacketEvent+0x683>
    5ce3:	e9 a4 f9 ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5ce8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5cef <CL_PacketEvent+0x68f>
    5cef:	48 89 ef             	mov    rdi,rbp
    5cf2:	e8 00 00 00 00       	call   5cf7 <CL_PacketEvent+0x697>
    5cf7:	41 89 c4             	mov    r12d,eax
    5cfa:	85 c0                	test   eax,eax
    5cfc:	75 17                	jne    5d15 <CL_PacketEvent+0x6b5>
    5cfe:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 5d05 <CL_PacketEvent+0x6a5>
    5d05:	48 89 ef             	mov    rdi,rbp
    5d08:	e8 00 00 00 00       	call   5d0d <CL_PacketEvent+0x6ad>
    5d0d:	85 c0                	test   eax,eax
    5d0f:	0f 84 77 f9 ff ff    	je     568c <CL_PacketEvent+0x2c>
    5d15:	48 89 df             	mov    rdi,rbx
    5d18:	e8 00 00 00 00       	call   5d1d <CL_PacketEvent+0x6bd>
    5d1d:	ba 00 04 00 00       	mov    edx,0x400
    5d22:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5d29 <CL_PacketEvent+0x6c9>
    5d29:	48 89 c3             	mov    rbx,rax
    5d2c:	48 89 c6             	mov    rsi,rax
    5d2f:	e8 00 00 00 00       	call   5d34 <CL_PacketEvent+0x6d4>
    5d34:	48 89 de             	mov    rsi,rbx
    5d37:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5d3e <CL_PacketEvent+0x6de>
    5d3e:	31 c0                	xor    eax,eax
    5d40:	e8 00 00 00 00       	call   5d45 <CL_PacketEvent+0x6e5>
    5d45:	e9 0c ff ff ff       	jmp    5c56 <CL_PacketEvent+0x5f6>
    5d4a:	48 8d 53 20          	lea    rdx,[rbx+0x20]
    5d4e:	48 8d 73 10          	lea    rsi,[rbx+0x10]
    5d52:	31 c9                	xor    ecx,ecx
    5d54:	48 8d 7d 18          	lea    rdi,[rbp+0x18]
    5d58:	e8 e3 d4 ff ff       	call   3240 <CL_ServersResponsePacket.isra.17>
    5d5d:	e9 2a f9 ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5d62:	48 8d 53 20          	lea    rdx,[rbx+0x20]
    5d66:	48 8d 73 10          	lea    rsi,[rbx+0x10]
    5d6a:	b9 01 00 00 00       	mov    ecx,0x1
    5d6f:	48 8d 7d 18          	lea    rdi,[rbp+0x18]
    5d73:	e8 c8 d4 ff ff       	call   3240 <CL_ServersResponsePacket.isra.17>
    5d78:	e9 0f f9 ff ff       	jmp    568c <CL_PacketEvent+0x2c>
    5d7d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000005d80 <CL_CheckPaused>:
CL_CheckPaused():
    5d80:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 5d87 <CL_CheckPaused+0x7>
    5d87:	b8 01 00 00 00       	mov    eax,0x1
    5d8c:	8b 4a 30             	mov    ecx,DWORD PTR [rdx+0x30]
    5d8f:	85 c9                	test   ecx,ecx
    5d91:	75 0a                	jne    5d9d <CL_CheckPaused+0x1d>
    5d93:	8b 52 24             	mov    edx,DWORD PTR [rdx+0x24]
    5d96:	31 c0                	xor    eax,eax
    5d98:	85 d2                	test   edx,edx
    5d9a:	0f 95 c0             	setne  al
    5d9d:	c3                   	ret    
    5d9e:	66 90                	xchg   ax,ax

0000000000005da0 <CL_NoDelay>:
CL_NoDelay():
    5da0:	48 83 ec 08          	sub    rsp,0x8
    5da4:	e8 00 00 00 00       	call   5da9 <CL_NoDelay+0x9>
    5da9:	85 c0                	test   eax,eax
    5dab:	75 23                	jne    5dd0 <CL_NoDelay+0x30>
    5dad:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 5db4 <CL_NoDelay+0x14>
    5db4:	8b 4a 30             	mov    ecx,DWORD PTR [rdx+0x30]
    5db7:	85 c9                	test   ecx,ecx
    5db9:	74 0d                	je     5dc8 <CL_NoDelay+0x28>
    5dbb:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 5dc1 <CL_NoDelay+0x21>
    5dc1:	31 c0                	xor    eax,eax
    5dc3:	85 d2                	test   edx,edx
    5dc5:	0f 95 c0             	setne  al
    5dc8:	48 83 c4 08          	add    rsp,0x8
    5dcc:	c3                   	ret    
    5dcd:	0f 1f 00             	nop    DWORD PTR [rax]
    5dd0:	b8 01 00 00 00       	mov    eax,0x1
    5dd5:	48 83 c4 08          	add    rsp,0x8
    5dd9:	c3                   	ret    
    5dda:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000005de0 <CL_Frame>:
CL_Frame():
    5de0:	41 56                	push   r14
    5de2:	41 55                	push   r13
    5de4:	41 54                	push   r12
    5de6:	55                   	push   rbp
    5de7:	89 f5                	mov    ebp,esi
    5de9:	53                   	push   rbx
    5dea:	89 fb                	mov    ebx,edi
    5dec:	48 81 ec 80 10 00 00 	sub    rsp,0x1080
    5df3:	48 83 3d 00 00 00 00 	cmp    QWORD PTR [rip+0x0],0x0        # 5dfb <CL_Frame+0x1b>
    5dfa:	00 
    5dfb:	74 0c                	je     5e09 <CL_Frame+0x29>
    5dfd:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5e04 <CL_Frame+0x24>
    5e04:	e8 00 00 00 00       	call   5e09 <CL_Frame+0x29>
    5e09:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5e10 <CL_Frame+0x30>
    5e10:	44 8b 60 30          	mov    r12d,DWORD PTR [rax+0x30]
    5e14:	45 85 e4             	test   r12d,r12d
    5e17:	0f 84 1f 01 00 00    	je     5f3c <CL_Frame+0x15c>
    5e1d:	48 83 3d 00 00 00 00 	cmp    QWORD PTR [rip+0x0],0x0        # 5e25 <CL_Frame+0x45>
    5e24:	00 
    5e25:	89 2d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebp        # 5e2b <CL_Frame+0x4b>
    5e2b:	74 15                	je     5e42 <CL_Frame+0x62>
    5e2d:	e8 00 00 00 00       	call   5e32 <CL_Frame+0x52>
    5e32:	44 8b 1d 00 00 00 00 	mov    r11d,DWORD PTR [rip+0x0]        # 5e39 <CL_Frame+0x59>
    5e39:	45 85 db             	test   r11d,r11d
    5e3c:	0f 85 4e 02 00 00    	jne    6090 <CL_Frame+0x2b0>
    5e42:	44 8b 15 00 00 00 00 	mov    r10d,DWORD PTR [rip+0x0]        # 5e49 <CL_Frame+0x69>
    5e49:	45 85 d2             	test   r10d,r10d
    5e4c:	0f 85 e6 01 00 00    	jne    6038 <CL_Frame+0x258>
    5e52:	83 3d 00 00 00 00 01 	cmp    DWORD PTR [rip+0x0],0x1        # 5e59 <CL_Frame+0x79>
    5e59:	0f 84 01 03 00 00    	je     6160 <CL_Frame+0x380>
    5e5f:	e8 00 00 00 00       	call   5e64 <CL_Frame+0x84>
    5e64:	85 c0                	test   eax,eax
    5e66:	74 28                	je     5e90 <CL_Frame+0xb0>
    5e68:	85 db                	test   ebx,ebx
    5e6a:	74 24                	je     5e90 <CL_Frame+0xb0>
    5e6c:	83 3d 00 00 00 00 08 	cmp    DWORD PTR [rip+0x0],0x8        # 5e73 <CL_Frame+0x93>
    5e73:	0f 84 47 02 00 00    	je     60c0 <CL_Frame+0x2e0>
    5e79:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5e80 <CL_Frame+0xa0>
    5e80:	44 8b 40 30          	mov    r8d,DWORD PTR [rax+0x30]
    5e84:	45 85 c0             	test   r8d,r8d
    5e87:	0f 85 33 02 00 00    	jne    60c0 <CL_Frame+0x2e0>
    5e8d:	0f 1f 00             	nop    DWORD PTR [rax]
    5e90:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5e97 <CL_Frame+0xb7>
    5e97:	8b 78 30             	mov    edi,DWORD PTR [rax+0x30]
    5e9a:	85 ff                	test   edi,edi
    5e9c:	74 0e                	je     5eac <CL_Frame+0xcc>
    5e9e:	8b 35 00 00 00 00    	mov    esi,DWORD PTR [rip+0x0]        # 5ea4 <CL_Frame+0xc4>
    5ea4:	85 f6                	test   esi,esi
    5ea6:	0f 84 bc 01 00 00    	je     6068 <CL_Frame+0x288>
    5eac:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5eb3 <CL_Frame+0xd3>
    5eb3:	89 1d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebx        # 5eb9 <CL_Frame+0xd9>
    5eb9:	01 1d 00 00 00 00    	add    DWORD PTR [rip+0x0],ebx        # 5ebf <CL_Frame+0xdf>
    5ebf:	44 8b 60 30          	mov    r12d,DWORD PTR [rax+0x30]
    5ec3:	45 85 e4             	test   r12d,r12d
    5ec6:	0f 85 74 02 00 00    	jne    6140 <CL_Frame+0x360>
    5ecc:	83 3d 00 00 00 00 04 	cmp    DWORD PTR [rip+0x0],0x4        # 5ed3 <CL_Frame+0xf3>
    5ed3:	0f 86 26 01 00 00    	jbe    5fff <CL_Frame+0x21f>
    5ed9:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5ee0 <CL_Frame+0x100>
    5ee0:	44 8b 58 30          	mov    r11d,DWORD PTR [rax+0x30]
    5ee4:	45 85 db             	test   r11d,r11d
    5ee7:	75 67                	jne    5f50 <CL_Frame+0x170>
    5ee9:	44 8b 50 24          	mov    r10d,DWORD PTR [rax+0x24]
    5eed:	45 85 d2             	test   r10d,r10d
    5ef0:	75 5e                	jne    5f50 <CL_Frame+0x170>
    5ef2:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5ef8 <CL_Frame+0x118>
    5ef8:	a8 02                	test   al,0x2
    5efa:	0f 85 90 00 00 00    	jne    5f90 <CL_Frame+0x1b0>
    5f00:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 5f06 <CL_Frame+0x126>
    5f06:	85 d2                	test   edx,edx
    5f08:	74 5e                	je     5f68 <CL_Frame+0x188>
    5f0a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    5f10:	e8 00 00 00 00       	call   5f15 <CL_Frame+0x135>
    5f15:	e8 b6 a6 ff ff       	call   5d0 <CL_CheckForResend>
    5f1a:	e8 00 00 00 00       	call   5f1f <CL_Frame+0x13f>
    5f1f:	83 05 00 00 00 00 01 	add    DWORD PTR [rip+0x0],0x1        # 5f26 <CL_Frame+0x146>
    5f26:	e8 00 00 00 00       	call   5f2b <CL_Frame+0x14b>
    5f2b:	89 ef                	mov    edi,ebp
    5f2d:	e8 00 00 00 00       	call   5f32 <CL_Frame+0x152>
    5f32:	e8 00 00 00 00       	call   5f37 <CL_Frame+0x157>
    5f37:	e8 00 00 00 00       	call   5f3c <CL_Frame+0x15c>
    5f3c:	48 81 c4 80 10 00 00 	add    rsp,0x1080
    5f43:	5b                   	pop    rbx
    5f44:	5d                   	pop    rbp
    5f45:	41 5c                	pop    r12
    5f47:	41 5d                	pop    r13
    5f49:	41 5e                	pop    r14
    5f4b:	c3                   	ret    
    5f4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    5f50:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5f56 <CL_Frame+0x176>
    5f56:	85 c0                	test   eax,eax
    5f58:	75 b6                	jne    5f10 <CL_Frame+0x130>
    5f5a:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 5f61 <CL_Frame+0x181>
    5f61:	8b 70 30             	mov    esi,DWORD PTR [rax+0x30]
    5f64:	85 f6                	test   esi,esi
    5f66:	75 14                	jne    5f7c <CL_Frame+0x19c>
    5f68:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 5f6e <CL_Frame+0x18e>
    5f6e:	83 f8 09             	cmp    eax,0x9
    5f71:	74 09                	je     5f7c <CL_Frame+0x19c>
    5f73:	83 f8 04             	cmp    eax,0x4
    5f76:	0f 87 fc 02 00 00    	ja     6278 <CL_Frame+0x498>
    5f7c:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 5f86 <CL_Frame+0x1a6>
    5f83:	00 00 00 
    5f86:	eb 88                	jmp    5f10 <CL_Frame+0x130>
    5f88:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    5f8f:	00 
    5f90:	83 e0 fd             	and    eax,0xfffffffd
    5f93:	bf 02 00 00 00       	mov    edi,0x2
    5f98:	48 8d b4 24 80 00 00 	lea    rsi,[rsp+0x80]
    5f9f:	00 
    5fa0:	c7 84 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],0x0
    5fa7:	00 00 00 00 
    5fab:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 5fb1 <CL_Frame+0x1d1>
    5fb1:	e8 00 00 00 00       	call   5fb6 <CL_Frame+0x1d6>
    5fb6:	48 89 c7             	mov    rdi,rax
    5fb9:	48 89 c3             	mov    rbx,rax
    5fbc:	e8 00 00 00 00       	call   5fc1 <CL_Frame+0x1e1>
    5fc1:	48 3d f3 03 00 00    	cmp    rax,0x3f3
    5fc7:	77 0d                	ja     5fd6 <CL_Frame+0x1f6>
    5fc9:	44 8b 8c 24 80 00 00 	mov    r9d,DWORD PTR [rsp+0x80]
    5fd0:	00 
    5fd1:	45 85 c9             	test   r9d,r9d
    5fd4:	74 0e                	je     5fe4 <CL_Frame+0x204>
    5fd6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5fdd <CL_Frame+0x1fd>
    5fdd:	31 c0                	xor    eax,eax
    5fdf:	e8 00 00 00 00       	call   5fe4 <CL_Frame+0x204>
    5fe4:	48 89 de             	mov    rsi,rbx
    5fe7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 5fee <CL_Frame+0x20e>
    5fee:	31 c0                	xor    eax,eax
    5ff0:	e8 00 00 00 00       	call   5ff5 <CL_Frame+0x215>
    5ff5:	31 f6                	xor    esi,esi
    5ff7:	48 89 c7             	mov    rdi,rax
    5ffa:	e8 00 00 00 00       	call   5fff <CL_Frame+0x21f>
    5fff:	44 8b 05 00 00 00 00 	mov    r8d,DWORD PTR [rip+0x0]        # 6006 <CL_Frame+0x226>
    6006:	45 85 c0             	test   r8d,r8d
    6009:	0f 85 01 ff ff ff    	jne    5f10 <CL_Frame+0x130>
    600f:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6016 <CL_Frame+0x236>
    6016:	8b 78 30             	mov    edi,DWORD PTR [rax+0x30]
    6019:	85 ff                	test   edi,edi
    601b:	0f 85 39 ff ff ff    	jne    5f5a <CL_Frame+0x17a>
    6021:	8b 48 24             	mov    ecx,DWORD PTR [rax+0x24]
    6024:	85 c9                	test   ecx,ecx
    6026:	0f 84 3c ff ff ff    	je     5f68 <CL_Frame+0x188>
    602c:	e9 29 ff ff ff       	jmp    5f5a <CL_Frame+0x17a>
    6031:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    6038:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 6042 <CL_Frame+0x262>
    603f:	00 00 00 
    6042:	b9 03 00 00 00       	mov    ecx,0x3
    6047:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 604e <CL_Frame+0x26e>
    604e:	ba 07 00 00 00       	mov    edx,0x7
    6053:	be 01 00 00 00       	mov    esi,0x1
    6058:	31 c0                	xor    eax,eax
    605a:	e8 00 00 00 00       	call   605f <CL_Frame+0x27f>
    605f:	e9 fb fd ff ff       	jmp    5e5f <CL_Frame+0x7f>
    6064:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    6068:	83 3d 00 00 00 00 08 	cmp    DWORD PTR [rip+0x0],0x8        # 606f <CL_Frame+0x28f>
    606f:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 6075 <CL_Frame+0x295>
    6075:	0f 84 25 01 00 00    	je     61a0 <CL_Frame+0x3c0>
    607b:	85 c0                	test   eax,eax
    607d:	0f 84 29 fe ff ff    	je     5eac <CL_Frame+0xcc>
    6083:	e8 00 00 00 00       	call   6088 <CL_Frame+0x2a8>
    6088:	e9 1f fe ff ff       	jmp    5eac <CL_Frame+0xcc>
    608d:	0f 1f 00             	nop    DWORD PTR [rax]
    6090:	89 1d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebx        # 6096 <CL_Frame+0x2b6>
    6096:	01 1d 00 00 00 00    	add    DWORD PTR [rip+0x0],ebx        # 609c <CL_Frame+0x2bc>
    609c:	83 05 00 00 00 00 01 	add    DWORD PTR [rip+0x0],0x1        # 60a3 <CL_Frame+0x2c3>
    60a3:	e8 00 00 00 00       	call   60a8 <CL_Frame+0x2c8>
    60a8:	89 ef                	mov    edi,ebp
    60aa:	e8 00 00 00 00       	call   60af <CL_Frame+0x2cf>
    60af:	e8 00 00 00 00       	call   60b4 <CL_Frame+0x2d4>
    60b4:	e9 83 fe ff ff       	jmp    5f3c <CL_Frame+0x15c>
    60b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    60c0:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 60c7 <CL_Frame+0x2e7>
    60c7:	f3 0f 10 40 2c       	movss  xmm0,DWORD PTR [rax+0x2c]
    60cc:	0f 2f 05 00 00 00 00 	comiss xmm0,DWORD PTR [rip+0x0]        # 60d3 <CL_Frame+0x2f3>
    60d3:	76 2b                	jbe    6100 <CL_Frame+0x320>
    60d5:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 60dc <CL_Frame+0x2fc>
    60dc:	f3 0f 10 48 2c       	movss  xmm1,DWORD PTR [rax+0x2c]
    60e1:	f3 0f 5e c8          	divss  xmm1,xmm0
    60e5:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 60ed <CL_Frame+0x30d>
    60ec:	00 
    60ed:	0f 2f c1             	comiss xmm0,xmm1
    60f0:	76 0e                	jbe    6100 <CL_Frame+0x320>
    60f2:	f3 0f 5e c1          	divss  xmm0,xmm1
    60f6:	f3 0f 5f 05 00 00 00 	maxss  xmm0,DWORD PTR [rip+0x0]        # 60fe <CL_Frame+0x31e>
    60fd:	00 
    60fe:	eb 08                	jmp    6108 <CL_Frame+0x328>
    6100:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 6108 <CL_Frame+0x328>
    6107:	00 
    6108:	f3 0f 58 05 00 00 00 	addss  xmm0,DWORD PTR [rip+0x0]        # 6110 <CL_Frame+0x330>
    610f:	00 
    6110:	f3 0f 11 44 24 0c    	movss  DWORD PTR [rsp+0xc],xmm0
    6116:	e8 00 00 00 00       	call   611b <CL_Frame+0x33b>
    611b:	f3 0f 10 44 24 0c    	movss  xmm0,DWORD PTR [rsp+0xc]
    6121:	66 0f ef c9          	pxor   xmm1,xmm1
    6125:	f3 0f 2c d8          	cvttss2si ebx,xmm0
    6129:	f3 0f 2a cb          	cvtsi2ss xmm1,ebx
    612d:	f3 0f 5c c1          	subss  xmm0,xmm1
    6131:	f3 0f 11 05 00 00 00 	movss  DWORD PTR [rip+0x0],xmm0        # 6139 <CL_Frame+0x359>
    6138:	00 
    6139:	e9 52 fd ff ff       	jmp    5e90 <CL_Frame+0xb0>
    613e:	66 90                	xchg   ax,ax
    6140:	66 0f ef c0          	pxor   xmm0,xmm0
    6144:	f3 0f 2a c3          	cvtsi2ss xmm0,ebx
    6148:	f3 0f 59 05 00 00 00 	mulss  xmm0,DWORD PTR [rip+0x0]        # 6150 <CL_Frame+0x370>
    614f:	00 
    6150:	e8 00 00 00 00       	call   6155 <CL_Frame+0x375>
    6155:	e9 72 fd ff ff       	jmp    5ecc <CL_Frame+0xec>
    615a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    6160:	e8 00 00 00 00       	call   6165 <CL_Frame+0x385>
    6165:	a8 02                	test   al,0x2
    6167:	0f 85 f2 fc ff ff    	jne    5e5f <CL_Frame+0x7f>
    616d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6174 <CL_Frame+0x394>
    6174:	44 8b 48 30          	mov    r9d,DWORD PTR [rax+0x30]
    6178:	45 85 c9             	test   r9d,r9d
    617b:	0f 85 de fc ff ff    	jne    5e5f <CL_Frame+0x7f>
    6181:	48 83 3d 00 00 00 00 	cmp    QWORD PTR [rip+0x0],0x0        # 6189 <CL_Frame+0x3a9>
    6188:	00 
    6189:	0f 84 d0 fc ff ff    	je     5e5f <CL_Frame+0x7f>
    618f:	e8 00 00 00 00       	call   6194 <CL_Frame+0x3b4>
    6194:	b9 01 00 00 00       	mov    ecx,0x1
    6199:	e9 a9 fe ff ff       	jmp    6047 <CL_Frame+0x267>
    619e:	66 90                	xchg   ax,ax
    61a0:	85 c0                	test   eax,eax
    61a2:	0f 85 04 fd ff ff    	jne    5eac <CL_Frame+0xcc>
    61a8:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
    61ad:	e8 00 00 00 00       	call   61b2 <CL_Frame+0x3d2>
    61b2:	8b 44 24 20          	mov    eax,DWORD PTR [rsp+0x20]
    61b6:	48 83 ec 08          	sub    rsp,0x8
    61ba:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 61c1 <CL_Frame+0x3e1>
    61c1:	8d 50 01             	lea    edx,[rax+0x1]
    61c4:	8b 44 24 2c          	mov    eax,DWORD PTR [rsp+0x2c]
    61c8:	8d b0 6c 07 00 00    	lea    esi,[rax+0x76c]
    61ce:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
    61d2:	50                   	push   rax
    61d3:	44 8b 4c 24 24       	mov    r9d,DWORD PTR [rsp+0x24]
    61d8:	31 c0                	xor    eax,eax
    61da:	44 8b 44 24 28       	mov    r8d,DWORD PTR [rsp+0x28]
    61df:	8b 4c 24 2c          	mov    ecx,DWORD PTR [rsp+0x2c]
    61e3:	e8 00 00 00 00       	call   61e8 <CL_Frame+0x408>
    61e8:	4c 8d ac 24 90 00 00 	lea    r13,[rsp+0x90]
    61ef:	00 
    61f0:	ba 00 10 00 00       	mov    edx,0x1000
    61f5:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 61fc <CL_Frame+0x41c>
    61fc:	4c 89 ef             	mov    rdi,r13
    61ff:	49 89 c6             	mov    r14,rax
    6202:	e8 00 00 00 00       	call   6207 <CL_Frame+0x427>
    6207:	be 3a 00 00 00       	mov    esi,0x3a
    620c:	4c 89 ef             	mov    rdi,r13
    620f:	e8 00 00 00 00       	call   6214 <CL_Frame+0x434>
    6214:	5a                   	pop    rdx
    6215:	59                   	pop    rcx
    6216:	48 85 c0             	test   rax,rax
    6219:	74 03                	je     621e <CL_Frame+0x43e>
    621b:	c6 00 2e             	mov    BYTE PTR [rax],0x2e
    621e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6225 <CL_Frame+0x445>
    6225:	4c 8d 64 24 40       	lea    r12,[rsp+0x40]
    622a:	e8 00 00 00 00       	call   622f <CL_Frame+0x44f>
    622f:	4c 89 e7             	mov    rdi,r12
    6232:	ba 40 00 00 00       	mov    edx,0x40
    6237:	48 89 c6             	mov    rsi,rax
    623a:	e8 00 00 00 00       	call   623f <CL_Frame+0x45f>
    623f:	4c 89 e6             	mov    rsi,r12
    6242:	4c 89 e7             	mov    rdi,r12
    6245:	ba 40 00 00 00       	mov    edx,0x40
    624a:	e8 00 00 00 00       	call   624f <CL_Frame+0x46f>
    624f:	4c 89 f6             	mov    rsi,r14
    6252:	4c 89 e1             	mov    rcx,r12
    6255:	4c 89 ea             	mov    rdx,r13
    6258:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 625f <CL_Frame+0x47f>
    625f:	31 c0                	xor    eax,eax
    6261:	e8 00 00 00 00       	call   6266 <CL_Frame+0x486>
    6266:	31 ff                	xor    edi,edi
    6268:	48 89 c6             	mov    rsi,rax
    626b:	e8 00 00 00 00       	call   6270 <CL_Frame+0x490>
    6270:	e9 37 fc ff ff       	jmp    5eac <CL_Frame+0xcc>
    6275:	0f 1f 00             	nop    DWORD PTR [rax]
    6278:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 627f <CL_Frame+0x49f>
    627f:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 6285 <CL_Frame+0x4a5>
    6285:	2b 05 00 00 00 00    	sub    eax,DWORD PTR [rip+0x0]        # 628b <CL_Frame+0x4ab>
    628b:	69 52 30 e8 03 00 00 	imul   edx,DWORD PTR [rdx+0x30],0x3e8
    6292:	39 d0                	cmp    eax,edx
    6294:	0f 8e e2 fc ff ff    	jle    5f7c <CL_Frame+0x19c>
    629a:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 62a0 <CL_Frame+0x4c0>
    62a0:	83 c0 01             	add    eax,0x1
    62a3:	89 05 00 00 00 00    	mov    DWORD PTR [rip+0x0],eax        # 62a9 <CL_Frame+0x4c9>
    62a9:	83 f8 05             	cmp    eax,0x5
    62ac:	0f 8e 5e fc ff ff    	jle    5f10 <CL_Frame+0x130>
    62b2:	31 c0                	xor    eax,eax
    62b4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 62bb <CL_Frame+0x4db>
    62bb:	e8 00 00 00 00       	call   62c0 <CL_Frame+0x4e0>
    62c0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 62c7 <CL_Frame+0x4e7>
    62c7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 62ce <CL_Frame+0x4ee>
    62ce:	e8 00 00 00 00       	call   62d3 <CL_Frame+0x4f3>
    62d3:	31 ff                	xor    edi,edi
    62d5:	e8 00 00 00 00       	call   62da <CL_Frame+0x4fa>
    62da:	85 c0                	test   eax,eax
    62dc:	74 2b                	je     6309 <CL_Frame+0x529>
    62de:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 62e5 <CL_Frame+0x505>
    62e5:	48 85 ff             	test   rdi,rdi
    62e8:	0f 84 22 fc ff ff    	je     5f10 <CL_Frame+0x130>
    62ee:	b9 01 00 00 00       	mov    ecx,0x1
    62f3:	ba 07 00 00 00       	mov    edx,0x7
    62f8:	be 01 00 00 00       	mov    esi,0x1
    62fd:	31 c0                	xor    eax,eax
    62ff:	e8 00 00 00 00       	call   6304 <CL_Frame+0x524>
    6304:	e9 07 fc ff ff       	jmp    5f10 <CL_Frame+0x130>
    6309:	e8 00 00 00 00       	call   630e <CL_Frame+0x52e>
    630e:	eb ce                	jmp    62de <CL_Frame+0x4fe>

0000000000006310 <CL_StartHunkUsers>:
CL_StartHunkUsers():
    6310:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6317 <CL_StartHunkUsers+0x7>
    6317:	48 85 c0             	test   rax,rax
    631a:	74 14                	je     6330 <CL_StartHunkUsers+0x20>
    631c:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    631f:	85 c0                	test   eax,eax
    6321:	74 0d                	je     6330 <CL_StartHunkUsers+0x20>
    6323:	e9 08 d4 ff ff       	jmp    3730 <CL_StartHunkUsers.part.18>
    6328:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    632f:	00 
    6330:	c3                   	ret    
    6331:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    6338:	00 00 00 00 
    633c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000006340 <CL_GetModeInfo>:
CL_GetModeInfo():
    6340:	41 54                	push   r12
    6342:	49 89 f4             	mov    r12,rsi
    6345:	55                   	push   rbp
    6346:	48 89 d5             	mov    rbp,rdx
    6349:	53                   	push   rbx
    634a:	48 89 fb             	mov    rbx,rdi
    634d:	48 83 ec 10          	sub    rsp,0x10
    6351:	8b 54 24 38          	mov    edx,DWORD PTR [rsp+0x38]
    6355:	85 d2                	test   edx,edx
    6357:	74 06                	je     635f <CL_GetModeInfo+0x1f>
    6359:	41 80 38 00          	cmp    BYTE PTR [r8],0x0
    635d:	75 71                	jne    63d0 <CL_GetModeInfo+0x90>
    635f:	8d 51 02             	lea    edx,[rcx+0x2]
    6362:	31 c0                	xor    eax,eax
    6364:	83 fa 1a             	cmp    edx,0x1a
    6367:	76 0f                	jbe    6378 <CL_GetModeInfo+0x38>
    6369:	48 83 c4 10          	add    rsp,0x10
    636d:	5b                   	pop    rbx
    636e:	5d                   	pop    rbp
    636f:	41 5c                	pop    r12
    6371:	c3                   	ret    
    6372:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    6378:	83 f9 fe             	cmp    ecx,0xfffffffe
    637b:	0f 84 9f 00 00 00    	je     6420 <CL_GetModeInfo+0xe0>
    6381:	83 f9 ff             	cmp    ecx,0xffffffff
    6384:	74 6a                	je     63f0 <CL_GetModeInfo+0xb0>
    6386:	48 63 c9             	movsxd rcx,ecx
    6389:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 6390 <CL_GetModeInfo+0x50>
    6390:	66 0f ef c0          	pxor   xmm0,xmm0
    6394:	48 8d 14 49          	lea    rdx,[rcx+rcx*2]
    6398:	48 8d 14 d0          	lea    rdx,[rax+rdx*8]
    639c:	8b 42 0c             	mov    eax,DWORD PTR [rdx+0xc]
    639f:	8b 4a 08             	mov    ecx,DWORD PTR [rdx+0x8]
    63a2:	f3 0f 2a c0          	cvtsi2ss xmm0,eax
    63a6:	f3 0f 59 42 10       	mulss  xmm0,DWORD PTR [rdx+0x10]
    63ab:	89 0b                	mov    DWORD PTR [rbx],ecx
    63ad:	41 89 04 24          	mov    DWORD PTR [r12],eax
    63b1:	66 0f ef c9          	pxor   xmm1,xmm1
    63b5:	b8 01 00 00 00       	mov    eax,0x1
    63ba:	f3 0f 2a 0b          	cvtsi2ss xmm1,DWORD PTR [rbx]
    63be:	f3 0f 5e c8          	divss  xmm1,xmm0
    63c2:	f3 0f 11 4d 00       	movss  DWORD PTR [rbp+0x0],xmm1
    63c7:	48 83 c4 10          	add    rsp,0x10
    63cb:	5b                   	pop    rbx
    63cc:	5d                   	pop    rbp
    63cd:	41 5c                	pop    r12
    63cf:	c3                   	ret    
    63d0:	ba 0a 00 00 00       	mov    edx,0xa
    63d5:	31 f6                	xor    esi,esi
    63d7:	4c 89 c7             	mov    rdi,r8
    63da:	44 89 4c 24 0c       	mov    DWORD PTR [rsp+0xc],r9d
    63df:	e8 00 00 00 00       	call   63e4 <CL_GetModeInfo+0xa4>
    63e4:	44 8b 4c 24 0c       	mov    r9d,DWORD PTR [rsp+0xc]
    63e9:	89 c1                	mov    ecx,eax
    63eb:	e9 6f ff ff ff       	jmp    635f <CL_GetModeInfo+0x1f>
    63f0:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 63f7 <CL_GetModeInfo+0xb7>
    63f7:	66 0f ef c0          	pxor   xmm0,xmm0
    63fb:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    63fe:	89 03                	mov    DWORD PTR [rbx],eax
    6400:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6407 <CL_GetModeInfo+0xc7>
    6407:	8b 40 30             	mov    eax,DWORD PTR [rax+0x30]
    640a:	f3 0f 2a c0          	cvtsi2ss xmm0,eax
    640e:	41 89 04 24          	mov    DWORD PTR [r12],eax
    6412:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6419 <CL_GetModeInfo+0xd9>
    6419:	f3 0f 59 40 2c       	mulss  xmm0,DWORD PTR [rax+0x2c]
    641e:	eb 91                	jmp    63b1 <CL_GetModeInfo+0x71>
    6420:	45 85 c9             	test   r9d,r9d
    6423:	74 33                	je     6458 <CL_GetModeInfo+0x118>
    6425:	8b 44 24 30          	mov    eax,DWORD PTR [rsp+0x30]
    6429:	85 c0                	test   eax,eax
    642b:	74 2b                	je     6458 <CL_GetModeInfo+0x118>
    642d:	8b 44 24 30          	mov    eax,DWORD PTR [rsp+0x30]
    6431:	66 0f ef c0          	pxor   xmm0,xmm0
    6435:	44 89 0b             	mov    DWORD PTR [rbx],r9d
    6438:	f3 0f 2a c0          	cvtsi2ss xmm0,eax
    643c:	41 89 04 24          	mov    DWORD PTR [r12],eax
    6440:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6447 <CL_GetModeInfo+0x107>
    6447:	f3 0f 59 40 2c       	mulss  xmm0,DWORD PTR [rax+0x2c]
    644c:	e9 60 ff ff ff       	jmp    63b1 <CL_GetModeInfo+0x71>
    6451:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    6458:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 6460 <CL_GetModeInfo+0x120>
    645f:	00 
    6460:	b8 e0 01 00 00       	mov    eax,0x1e0
    6465:	b9 80 02 00 00       	mov    ecx,0x280
    646a:	e9 3c ff ff ff       	jmp    63ab <CL_GetModeInfo+0x6b>
    646f:	90                   	nop

0000000000006470 <CL_Init>:
CL_Init():
    6470:	48 83 ec 08          	sub    rsp,0x8
    6474:	31 c0                	xor    eax,eax
    6476:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 647d <CL_Init+0xd>
    647d:	e8 00 00 00 00       	call   6482 <CL_Init+0x12>
    6482:	e8 00 00 00 00       	call   6487 <CL_Init+0x17>
    6487:	31 f6                	xor    esi,esi
    6489:	ba cc e0 1d 00       	mov    edx,0x1de0cc
    648e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6495 <CL_Init+0x25>
    6495:	e8 00 00 00 00       	call   649a <CL_Init+0x2a>
    649a:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 64a1 <CL_Init+0x31>
    64a1:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 64ab <CL_Init+0x3b>
    64a8:	00 00 00 
    64ab:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 64b5 <CL_Init+0x45>
    64b2:	00 00 00 
    64b5:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 64bf <CL_Init+0x4f>
    64bc:	00 00 00 
    64bf:	e8 00 00 00 00       	call   64c4 <CL_Init+0x54>
    64c4:	31 d2                	xor    edx,edx
    64c6:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 64cd <CL_Init+0x5d>
    64cd:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 64d4 <CL_Init+0x64>
    64d4:	e8 00 00 00 00       	call   64d9 <CL_Init+0x69>
    64d9:	31 d2                	xor    edx,edx
    64db:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 64e2 <CL_Init+0x72>
    64e2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 64e9 <CL_Init+0x79>
    64e9:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 64f0 <CL_Init+0x80>
    64f0:	e8 00 00 00 00       	call   64f5 <CL_Init+0x85>
    64f5:	31 d2                	xor    edx,edx
    64f7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 64fe <CL_Init+0x8e>
    64fe:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6505 <CL_Init+0x95>
    6505:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 650c <CL_Init+0x9c>
    650c:	e8 00 00 00 00       	call   6511 <CL_Init+0xa1>
    6511:	b9 02 00 00 00       	mov    ecx,0x2
    6516:	31 d2                	xor    edx,edx
    6518:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 651f <CL_Init+0xaf>
    651f:	48 89 c7             	mov    rdi,rax
    6522:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6529 <CL_Init+0xb9>
    6529:	e8 00 00 00 00       	call   652e <CL_Init+0xbe>
    652e:	ba 00 01 00 00       	mov    edx,0x100
    6533:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 653a <CL_Init+0xca>
    653a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6541 <CL_Init+0xd1>
    6541:	e8 00 00 00 00       	call   6546 <CL_Init+0xd6>
    6546:	b9 01 00 00 00       	mov    ecx,0x1
    654b:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 6552 <CL_Init+0xe2>
    6552:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6559 <CL_Init+0xe9>
    6559:	48 89 c7             	mov    rdi,rax
    655c:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6563 <CL_Init+0xf3>
    6563:	e8 00 00 00 00       	call   6568 <CL_Init+0xf8>
    6568:	ba 00 01 00 00       	mov    edx,0x100
    656d:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6574 <CL_Init+0x104>
    6574:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 657b <CL_Init+0x10b>
    657b:	e8 00 00 00 00       	call   6580 <CL_Init+0x110>
    6580:	b9 02 00 00 00       	mov    ecx,0x2
    6585:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 658c <CL_Init+0x11c>
    658c:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6593 <CL_Init+0x123>
    6593:	48 89 c7             	mov    rdi,rax
    6596:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 659d <CL_Init+0x12d>
    659d:	e8 00 00 00 00       	call   65a2 <CL_Init+0x132>
    65a2:	ba 00 01 00 00       	mov    edx,0x100
    65a7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 65ae <CL_Init+0x13e>
    65ae:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 65b5 <CL_Init+0x145>
    65b5:	e8 00 00 00 00       	call   65ba <CL_Init+0x14a>
    65ba:	ba 00 01 00 00       	mov    edx,0x100
    65bf:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 65c6 <CL_Init+0x156>
    65c6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 65cd <CL_Init+0x15d>
    65cd:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 65d4 <CL_Init+0x164>
    65d4:	e8 00 00 00 00       	call   65d9 <CL_Init+0x169>
    65d9:	ba 00 01 00 00       	mov    edx,0x100
    65de:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 65e5 <CL_Init+0x175>
    65e5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 65ec <CL_Init+0x17c>
    65ec:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 65f3 <CL_Init+0x183>
    65f3:	e8 00 00 00 00       	call   65f8 <CL_Init+0x188>
    65f8:	ba 00 01 00 00       	mov    edx,0x100
    65fd:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6604 <CL_Init+0x194>
    6604:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 660b <CL_Init+0x19b>
    660b:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6612 <CL_Init+0x1a2>
    6612:	e8 00 00 00 00       	call   6617 <CL_Init+0x1a7>
    6617:	ba 01 00 00 00       	mov    edx,0x1
    661c:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6623 <CL_Init+0x1b3>
    6623:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 662a <CL_Init+0x1ba>
    662a:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6631 <CL_Init+0x1c1>
    6631:	e8 00 00 00 00       	call   6636 <CL_Init+0x1c6>
    6636:	ba 01 00 00 00       	mov    edx,0x1
    663b:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6642 <CL_Init+0x1d2>
    6642:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6649 <CL_Init+0x1d9>
    6649:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6650 <CL_Init+0x1e0>
    6650:	e8 00 00 00 00       	call   6655 <CL_Init+0x1e5>
    6655:	b9 02 00 00 00       	mov    ecx,0x2
    665a:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 6661 <CL_Init+0x1f1>
    6661:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6668 <CL_Init+0x1f8>
    6668:	48 89 c7             	mov    rdi,rax
    666b:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6672 <CL_Init+0x202>
    6672:	e8 00 00 00 00       	call   6677 <CL_Init+0x207>
    6677:	ba 01 00 00 00       	mov    edx,0x1
    667c:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6683 <CL_Init+0x213>
    6683:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 668a <CL_Init+0x21a>
    668a:	e8 00 00 00 00       	call   668f <CL_Init+0x21f>
    668f:	31 d2                	xor    edx,edx
    6691:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6698 <CL_Init+0x228>
    6698:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 669f <CL_Init+0x22f>
    669f:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 66a6 <CL_Init+0x236>
    66a6:	e8 00 00 00 00       	call   66ab <CL_Init+0x23b>
    66ab:	ba 01 00 00 00       	mov    edx,0x1
    66b0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 66b7 <CL_Init+0x247>
    66b7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 66be <CL_Init+0x24e>
    66be:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 66c5 <CL_Init+0x255>
    66c5:	e8 00 00 00 00       	call   66ca <CL_Init+0x25a>
    66ca:	31 d2                	xor    edx,edx
    66cc:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 66d3 <CL_Init+0x263>
    66d3:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 66da <CL_Init+0x26a>
    66da:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 66e1 <CL_Init+0x271>
    66e1:	e8 00 00 00 00       	call   66e6 <CL_Init+0x276>
    66e6:	ba 01 40 00 00       	mov    edx,0x4001
    66eb:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 66f2 <CL_Init+0x282>
    66f2:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 66f9 <CL_Init+0x289>
    66f9:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6700 <CL_Init+0x290>
    6700:	e8 00 00 00 00       	call   6705 <CL_Init+0x295>
    6705:	ba 01 40 00 00       	mov    edx,0x4001
    670a:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6711 <CL_Init+0x2a1>
    6711:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6718 <CL_Init+0x2a8>
    6718:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 671f <CL_Init+0x2af>
    671f:	e8 00 00 00 00       	call   6724 <CL_Init+0x2b4>
    6724:	31 d2                	xor    edx,edx
    6726:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 672d <CL_Init+0x2bd>
    672d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6734 <CL_Init+0x2c4>
    6734:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 673b <CL_Init+0x2cb>
    673b:	e8 00 00 00 00       	call   6740 <CL_Init+0x2d0>
    6740:	31 d2                	xor    edx,edx
    6742:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6749 <CL_Init+0x2d9>
    6749:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6750 <CL_Init+0x2e0>
    6750:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6757 <CL_Init+0x2e7>
    6757:	e8 00 00 00 00       	call   675c <CL_Init+0x2ec>
    675c:	31 d2                	xor    edx,edx
    675e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6765 <CL_Init+0x2f5>
    6765:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 676c <CL_Init+0x2fc>
    676c:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6773 <CL_Init+0x303>
    6773:	e8 00 00 00 00       	call   6778 <CL_Init+0x308>
    6778:	ba 01 40 00 00       	mov    edx,0x4001
    677d:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6784 <CL_Init+0x314>
    6784:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 678b <CL_Init+0x31b>
    678b:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6792 <CL_Init+0x322>
    6792:	e8 00 00 00 00       	call   6797 <CL_Init+0x327>
    6797:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 679e <CL_Init+0x32e>
    679e:	48 89 c7             	mov    rdi,rax
    67a1:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 67a8 <CL_Init+0x338>
    67a8:	e8 00 00 00 00       	call   67ad <CL_Init+0x33d>
    67ad:	31 d2                	xor    edx,edx
    67af:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 67b6 <CL_Init+0x346>
    67b6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 67bd <CL_Init+0x34d>
    67bd:	e8 00 00 00 00       	call   67c2 <CL_Init+0x352>
    67c2:	ba 01 00 00 00       	mov    edx,0x1
    67c7:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 67ce <CL_Init+0x35e>
    67ce:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 67d5 <CL_Init+0x365>
    67d5:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 67dc <CL_Init+0x36c>
    67dc:	e8 00 00 00 00       	call   67e1 <CL_Init+0x371>
    67e1:	ba 40 00 00 00       	mov    edx,0x40
    67e6:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 67ed <CL_Init+0x37d>
    67ed:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 67f4 <CL_Init+0x384>
    67f4:	e8 00 00 00 00       	call   67f9 <CL_Init+0x389>
    67f9:	ba 01 40 00 00       	mov    edx,0x4001
    67fe:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6805 <CL_Init+0x395>
    6805:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 680c <CL_Init+0x39c>
    680c:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6813 <CL_Init+0x3a3>
    6813:	e8 00 00 00 00       	call   6818 <CL_Init+0x3a8>
    6818:	ba 01 40 00 00       	mov    edx,0x4001
    681d:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6824 <CL_Init+0x3b4>
    6824:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 682b <CL_Init+0x3bb>
    682b:	e8 00 00 00 00       	call   6830 <CL_Init+0x3c0>
    6830:	ba 01 40 00 00       	mov    edx,0x4001
    6835:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 683c <CL_Init+0x3cc>
    683c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6843 <CL_Init+0x3d3>
    6843:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 684a <CL_Init+0x3da>
    684a:	e8 00 00 00 00       	call   684f <CL_Init+0x3df>
    684f:	ba 01 40 00 00       	mov    edx,0x4001
    6854:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 685b <CL_Init+0x3eb>
    685b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6862 <CL_Init+0x3f2>
    6862:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6869 <CL_Init+0x3f9>
    6869:	e8 00 00 00 00       	call   686e <CL_Init+0x3fe>
    686e:	ba 01 40 00 00       	mov    edx,0x4001
    6873:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 687a <CL_Init+0x40a>
    687a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6881 <CL_Init+0x411>
    6881:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6888 <CL_Init+0x418>
    6888:	e8 00 00 00 00       	call   688d <CL_Init+0x41d>
    688d:	b9 02 00 00 00       	mov    ecx,0x2
    6892:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 6899 <CL_Init+0x429>
    6899:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 68a0 <CL_Init+0x430>
    68a0:	48 89 c7             	mov    rdi,rax
    68a3:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 68aa <CL_Init+0x43a>
    68aa:	e8 00 00 00 00       	call   68af <CL_Init+0x43f>
    68af:	e8 00 00 00 00       	call   68b4 <CL_Init+0x444>
    68b4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 68bb <CL_Init+0x44b>
    68bb:	48 89 c6             	mov    rsi,rax
    68be:	31 c0                	xor    eax,eax
    68c0:	e8 00 00 00 00       	call   68c5 <CL_Init+0x455>
    68c5:	48 8b 3d 00 00 00 00 	mov    rdi,QWORD PTR [rip+0x0]        # 68cc <CL_Init+0x45c>
    68cc:	48 89 c6             	mov    rsi,rax
    68cf:	e8 00 00 00 00       	call   68d4 <CL_Init+0x464>
    68d4:	ba 01 40 02 00       	mov    edx,0x24001
    68d9:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 68e0 <CL_Init+0x470>
    68e0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 68e7 <CL_Init+0x477>
    68e7:	e8 00 00 00 00       	call   68ec <CL_Init+0x47c>
    68ec:	ba 03 40 00 00       	mov    edx,0x4003
    68f1:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 68f8 <CL_Init+0x488>
    68f8:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 68ff <CL_Init+0x48f>
    68ff:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 6906 <CL_Init+0x496>
    6906:	e8 00 00 00 00       	call   690b <CL_Init+0x49b>
    690b:	ba 03 00 00 00       	mov    edx,0x3
    6910:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6917 <CL_Init+0x4a7>
    6917:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 691e <CL_Init+0x4ae>
    691e:	e8 00 00 00 00       	call   6923 <CL_Init+0x4b3>
    6923:	ba 03 00 00 00       	mov    edx,0x3
    6928:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 692f <CL_Init+0x4bf>
    692f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6936 <CL_Init+0x4c6>
    6936:	e8 00 00 00 00       	call   693b <CL_Init+0x4cb>
    693b:	ba 03 40 00 00       	mov    edx,0x4003
    6940:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6947 <CL_Init+0x4d7>
    6947:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 694e <CL_Init+0x4de>
    694e:	e8 00 00 00 00       	call   6953 <CL_Init+0x4e3>
    6953:	ba 03 40 00 00       	mov    edx,0x4003
    6958:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 695f <CL_Init+0x4ef>
    695f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6966 <CL_Init+0x4f6>
    6966:	e8 00 00 00 00       	call   696b <CL_Init+0x4fb>
    696b:	ba 03 40 00 00       	mov    edx,0x4003
    6970:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6977 <CL_Init+0x507>
    6977:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 697e <CL_Init+0x50e>
    697e:	e8 00 00 00 00       	call   6983 <CL_Init+0x513>
    6983:	ba 03 40 00 00       	mov    edx,0x4003
    6988:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 698f <CL_Init+0x51f>
    698f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6996 <CL_Init+0x526>
    6996:	e8 00 00 00 00       	call   699b <CL_Init+0x52b>
    699b:	ba 03 00 00 00       	mov    edx,0x3
    69a0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 69a7 <CL_Init+0x537>
    69a7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 69ae <CL_Init+0x53e>
    69ae:	e8 00 00 00 00       	call   69b3 <CL_Init+0x543>
    69b3:	ba 03 00 00 00       	mov    edx,0x3
    69b8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 69bf <CL_Init+0x54f>
    69bf:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 69c6 <CL_Init+0x556>
    69c6:	e8 00 00 00 00       	call   69cb <CL_Init+0x55b>
    69cb:	ba 03 40 00 00       	mov    edx,0x4003
    69d0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 69d7 <CL_Init+0x567>
    69d7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 69de <CL_Init+0x56e>
    69de:	e8 00 00 00 00       	call   69e3 <CL_Init+0x573>
    69e3:	ba 03 40 00 00       	mov    edx,0x4003
    69e8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 69ef <CL_Init+0x57f>
    69ef:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 69f6 <CL_Init+0x586>
    69f6:	e8 00 00 00 00       	call   69fb <CL_Init+0x58b>
    69fb:	ba 03 40 00 00       	mov    edx,0x4003
    6a00:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6a07 <CL_Init+0x597>
    6a07:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6a0e <CL_Init+0x59e>
    6a0e:	e8 00 00 00 00       	call   6a13 <CL_Init+0x5a3>
    6a13:	ba 02 00 00 00       	mov    edx,0x2
    6a18:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6a1f <CL_Init+0x5af>
    6a1f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6a26 <CL_Init+0x5b6>
    6a26:	e8 00 00 00 00       	call   6a2b <CL_Init+0x5bb>
    6a2b:	ba 03 00 00 00       	mov    edx,0x3
    6a30:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6a37 <CL_Init+0x5c7>
    6a37:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6a3e <CL_Init+0x5ce>
    6a3e:	e8 00 00 00 00       	call   6a43 <CL_Init+0x5d3>
    6a43:	ba 01 40 00 00       	mov    edx,0x4001
    6a48:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6a4f <CL_Init+0x5df>
    6a4f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6a56 <CL_Init+0x5e6>
    6a56:	e8 00 00 00 00       	call   6a5b <CL_Init+0x5eb>
    6a5b:	ba 40 00 00 00       	mov    edx,0x40
    6a60:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6a67 <CL_Init+0x5f7>
    6a67:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6a6e <CL_Init+0x5fe>
    6a6e:	e8 00 00 00 00       	call   6a73 <CL_Init+0x603>
    6a73:	48 8d 35 a6 d1 ff ff 	lea    rsi,[rip+0xffffffffffffd1a6]        # 3c20 <CL_ForwardToServer_f>
    6a7a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6a81 <CL_Init+0x611>
    6a81:	e8 00 00 00 00       	call   6a86 <CL_Init+0x616>
    6a86:	48 8d 35 53 bb ff ff 	lea    rsi,[rip+0xffffffffffffbb53]        # 25e0 <CL_Configstrings_f>
    6a8d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6a94 <CL_Init+0x624>
    6a94:	e8 00 00 00 00       	call   6a99 <CL_Init+0x629>
    6a99:	48 8d 35 80 b2 ff ff 	lea    rsi,[rip+0xffffffffffffb280]        # 1d20 <CL_Clientinfo_f>
    6aa0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6aa7 <CL_Init+0x637>
    6aa7:	e8 00 00 00 00       	call   6aac <CL_Init+0x63c>
    6aac:	48 8d 35 1d d4 ff ff 	lea    rsi,[rip+0xffffffffffffd41d]        # 3ed0 <CL_Snd_Restart_f>
    6ab3:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6aba <CL_Init+0x64a>
    6aba:	e8 00 00 00 00       	call   6abf <CL_Init+0x64f>
    6abf:	48 8d 35 9a d3 ff ff 	lea    rsi,[rip+0xffffffffffffd39a]        # 3e60 <CL_Vid_Restart_f>
    6ac6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6acd <CL_Init+0x65d>
    6acd:	e8 00 00 00 00       	call   6ad2 <CL_Init+0x662>
    6ad2:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6ad9 <CL_Init+0x669>
    6ad9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ae0 <CL_Init+0x670>
    6ae0:	e8 00 00 00 00       	call   6ae5 <CL_Init+0x675>
    6ae5:	48 8d 35 04 b8 ff ff 	lea    rsi,[rip+0xffffffffffffb804]        # 22f0 <CL_Record_f>
    6aec:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6af3 <CL_Init+0x683>
    6af3:	e8 00 00 00 00       	call   6af8 <CL_Init+0x688>
    6af8:	48 8d 35 31 c5 ff ff 	lea    rsi,[rip+0xffffffffffffc531]        # 3030 <CL_CompleteRecordName>
    6aff:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b06 <CL_Init+0x696>
    6b06:	e8 00 00 00 00       	call   6b0b <CL_Init+0x69b>
    6b0b:	48 8d 35 8e e3 ff ff 	lea    rsi,[rip+0xffffffffffffe38e]        # 4ea0 <CL_PlayDemo_f>
    6b12:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b19 <CL_Init+0x6a9>
    6b19:	e8 00 00 00 00       	call   6b1e <CL_Init+0x6ae>
    6b1e:	48 8d 35 cb c6 ff ff 	lea    rsi,[rip+0xffffffffffffc6cb]        # 31f0 <CL_CompleteDemoName>
    6b25:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b2c <CL_Init+0x6bc>
    6b2c:	e8 00 00 00 00       	call   6b31 <CL_Init+0x6c1>
    6b31:	48 8b 35 00 00 00 00 	mov    rsi,QWORD PTR [rip+0x0]        # 6b38 <CL_Init+0x6c8>
    6b38:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b3f <CL_Init+0x6cf>
    6b3f:	e8 00 00 00 00       	call   6b44 <CL_Init+0x6d4>
    6b44:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6b4b <CL_Init+0x6db>
    6b4b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b52 <CL_Init+0x6e2>
    6b52:	e8 00 00 00 00       	call   6b57 <CL_Init+0x6e7>
    6b57:	48 8d 35 f2 df ff ff 	lea    rsi,[rip+0xffffffffffffdff2]        # 4b50 <CL_Connect_f>
    6b5e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b65 <CL_Init+0x6f5>
    6b65:	e8 00 00 00 00       	call   6b6a <CL_Init+0x6fa>
    6b6a:	48 8d 35 cf ba ff ff 	lea    rsi,[rip+0xffffffffffffbacf]        # 2640 <CL_Reconnect_f>
    6b71:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b78 <CL_Init+0x708>
    6b78:	e8 00 00 00 00       	call   6b7d <CL_Init+0x70d>
    6b7d:	48 8d 35 3c b2 ff ff 	lea    rsi,[rip+0xffffffffffffb23c]        # 1dc0 <CL_LocalServers_f>
    6b84:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b8b <CL_Init+0x71b>
    6b8b:	e8 00 00 00 00       	call   6b90 <CL_Init+0x720>
    6b90:	48 8d 35 39 b3 ff ff 	lea    rsi,[rip+0xffffffffffffb339]        # 1ed0 <CL_GlobalServers_f>
    6b97:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6b9e <CL_Init+0x72e>
    6b9e:	e8 00 00 00 00       	call   6ba3 <CL_Init+0x733>
    6ba3:	48 8d 35 76 c5 ff ff 	lea    rsi,[rip+0xffffffffffffc576]        # 3120 <CL_Rcon_f>
    6baa:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6bb1 <CL_Init+0x741>
    6bb1:	e8 00 00 00 00       	call   6bb6 <CL_Init+0x746>
    6bb6:	48 8d 35 d3 bb ff ff 	lea    rsi,[rip+0xffffffffffffbbd3]        # 2790 <CL_CompleteRcon>
    6bbd:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6bc4 <CL_Init+0x754>
    6bc4:	e8 00 00 00 00       	call   6bc9 <CL_Init+0x759>
    6bc9:	48 8d 35 20 c0 ff ff 	lea    rsi,[rip+0xffffffffffffc020]        # 2bf0 <CL_Ping_f>
    6bd0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6bd7 <CL_Init+0x767>
    6bd7:	e8 00 00 00 00       	call   6bdc <CL_Init+0x76c>
    6bdc:	48 8d 35 bd c2 ff ff 	lea    rsi,[rip+0xffffffffffffc2bd]        # 2ea0 <CL_ServerStatus_f>
    6be3:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6bea <CL_Init+0x77a>
    6bea:	e8 00 00 00 00       	call   6bef <CL_Init+0x77f>
    6bef:	48 8d 35 ba b1 ff ff 	lea    rsi,[rip+0xffffffffffffb1ba]        # 1db0 <CL_ShowIP_f>
    6bf6:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6bfd <CL_Init+0x78d>
    6bfd:	e8 00 00 00 00       	call   6c02 <CL_Init+0x792>
    6c02:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6c09 <CL_Init+0x799>
    6c09:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c10 <CL_Init+0x7a0>
    6c10:	e8 00 00 00 00       	call   6c15 <CL_Init+0x7a5>
    6c15:	48 8d 35 74 b1 ff ff 	lea    rsi,[rip+0xffffffffffffb174]        # 1d90 <CL_ReferencedPK3List_f>
    6c1c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c23 <CL_Init+0x7b3>
    6c23:	e8 00 00 00 00       	call   6c28 <CL_Init+0x7b8>
    6c28:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6c2f <CL_Init+0x7bf>
    6c2f:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c36 <CL_Init+0x7c6>
    6c36:	e8 00 00 00 00       	call   6c3b <CL_Init+0x7cb>
    6c3b:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6c42 <CL_Init+0x7d2>
    6c42:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c49 <CL_Init+0x7d9>
    6c49:	e8 00 00 00 00       	call   6c4e <CL_Init+0x7de>
    6c4e:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6c55 <CL_Init+0x7e5>
    6c55:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c5c <CL_Init+0x7ec>
    6c5c:	e8 00 00 00 00       	call   6c61 <CL_Init+0x7f1>
    6c61:	48 8d 35 98 c3 ff ff 	lea    rsi,[rip+0xffffffffffffc398]        # 3000 <CL_CompleteVideoName>
    6c68:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c6f <CL_Init+0x7ff>
    6c6f:	e8 00 00 00 00       	call   6c74 <CL_Init+0x804>
    6c74:	48 8d 35 05 9e ff ff 	lea    rsi,[rip+0xffffffffffff9e05]        # a80 <CL_StopVideo_f>
    6c7b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c82 <CL_Init+0x812>
    6c82:	e8 00 00 00 00       	call   6c87 <CL_Init+0x817>
    6c87:	48 8d 35 62 b0 ff ff 	lea    rsi,[rip+0xffffffffffffb062]        # 1cf0 <CL_Serverinfo_f>
    6c8e:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6c95 <CL_Init+0x825>
    6c95:	e8 00 00 00 00       	call   6c9a <CL_Init+0x82a>
    6c9a:	48 8d 35 1f b0 ff ff 	lea    rsi,[rip+0xffffffffffffb01f]        # 1cc0 <CL_Systeminfo_f>
    6ca1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ca8 <CL_Init+0x838>
    6ca8:	e8 00 00 00 00       	call   6cad <CL_Init+0x83d>
    6cad:	48 8d 35 9c 0a 00 00 	lea    rsi,[rip+0xa9c]        # 7750 <CL_Download_f>
    6cb4:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6cbb <CL_Init+0x84b>
    6cbb:	e8 00 00 00 00       	call   6cc0 <CL_Init+0x850>
    6cc0:	48 8d 35 89 0a 00 00 	lea    rsi,[rip+0xa89]        # 7750 <CL_Download_f>
    6cc7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6cce <CL_Init+0x85e>
    6cce:	e8 00 00 00 00       	call   6cd3 <CL_Init+0x863>
    6cd3:	48 8d 35 56 95 ff ff 	lea    rsi,[rip+0xffffffffffff9556]        # 230 <CL_ModeList_f>
    6cda:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ce1 <CL_Init+0x871>
    6ce1:	e8 00 00 00 00       	call   6ce6 <CL_Init+0x876>
    6ce6:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6ced <CL_Init+0x87d>
    6ced:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6cf4 <CL_Init+0x884>
    6cf4:	e8 00 00 00 00       	call   6cf9 <CL_Init+0x889>
    6cf9:	ba 42 20 00 00       	mov    edx,0x2042
    6cfe:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6d05 <CL_Init+0x895>
    6d05:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6d0c <CL_Init+0x89c>
    6d0c:	e8 00 00 00 00       	call   6d11 <CL_Init+0x8a1>
    6d11:	31 ff                	xor    edi,edi
    6d13:	31 f6                	xor    esi,esi
    6d15:	e8 76 9d ff ff       	call   a90 <CL_UpdateGUID>
    6d1a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6d21 <CL_Init+0x8b1>
    6d21:	31 c0                	xor    eax,eax
    6d23:	48 83 c4 08          	add    rsp,0x8
    6d27:	e9 00 00 00 00       	jmp    6d2c <CL_Init+0x8bc>
    6d2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000006d30 <CL_Shutdown>:
CL_Shutdown():
    6d30:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 6d37 <CL_Shutdown+0x7>
    6d37:	48 85 c0             	test   rax,rax
    6d3a:	74 07                	je     6d43 <CL_Shutdown+0x13>
    6d3c:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    6d3f:	85 d2                	test   edx,edx
    6d41:	75 05                	jne    6d48 <CL_Shutdown+0x18>
    6d43:	c3                   	ret    
    6d44:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    6d48:	53                   	push   rbx
    6d49:	31 c0                	xor    eax,eax
    6d4b:	89 f3                	mov    ebx,esi
    6d4d:	48 89 fe             	mov    rsi,rdi
    6d50:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6d57 <CL_Shutdown+0x27>
    6d57:	e8 00 00 00 00       	call   6d5c <CL_Shutdown+0x2c>
    6d5c:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 6d62 <CL_Shutdown+0x32>
    6d62:	85 c0                	test   eax,eax
    6d64:	0f 85 f6 01 00 00    	jne    6f60 <CL_Shutdown+0x230>
    6d6a:	31 ff                	xor    edi,edi
    6d6c:	89 1d 00 00 00 00    	mov    DWORD PTR [rip+0x0],ebx        # 6d72 <CL_Shutdown+0x42>
    6d72:	c7 05 00 00 00 00 01 	mov    DWORD PTR [rip+0x0],0x1        # 6d7c <CL_Shutdown+0x4c>
    6d79:	00 00 00 
    6d7c:	e8 00 00 00 00       	call   6d81 <CL_Shutdown+0x51>
    6d81:	e8 00 00 00 00       	call   6d86 <CL_Shutdown+0x56>
    6d86:	e8 00 00 00 00       	call   6d8b <CL_Shutdown+0x5b>
    6d8b:	e8 00 00 00 00       	call   6d90 <CL_Shutdown+0x60>
    6d90:	31 ff                	xor    edi,edi
    6d92:	85 db                	test   ebx,ebx
    6d94:	40 0f 95 c7          	setne  dil
    6d98:	83 c7 02             	add    edi,0x2
    6d9b:	e8 b0 97 ff ff       	call   550 <CL_ShutdownRef>
    6da0:	e8 00 00 00 00       	call   6da5 <CL_Shutdown+0x75>
    6da5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6dac <CL_Shutdown+0x7c>
    6dac:	e8 00 00 00 00       	call   6db1 <CL_Shutdown+0x81>
    6db1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6db8 <CL_Shutdown+0x88>
    6db8:	e8 00 00 00 00       	call   6dbd <CL_Shutdown+0x8d>
    6dbd:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6dc4 <CL_Shutdown+0x94>
    6dc4:	e8 00 00 00 00       	call   6dc9 <CL_Shutdown+0x99>
    6dc9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6dd0 <CL_Shutdown+0xa0>
    6dd0:	e8 00 00 00 00       	call   6dd5 <CL_Shutdown+0xa5>
    6dd5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ddc <CL_Shutdown+0xac>
    6ddc:	e8 00 00 00 00       	call   6de1 <CL_Shutdown+0xb1>
    6de1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6de8 <CL_Shutdown+0xb8>
    6de8:	e8 00 00 00 00       	call   6ded <CL_Shutdown+0xbd>
    6ded:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6df4 <CL_Shutdown+0xc4>
    6df4:	e8 00 00 00 00       	call   6df9 <CL_Shutdown+0xc9>
    6df9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e00 <CL_Shutdown+0xd0>
    6e00:	e8 00 00 00 00       	call   6e05 <CL_Shutdown+0xd5>
    6e05:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e0c <CL_Shutdown+0xdc>
    6e0c:	e8 00 00 00 00       	call   6e11 <CL_Shutdown+0xe1>
    6e11:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e18 <CL_Shutdown+0xe8>
    6e18:	e8 00 00 00 00       	call   6e1d <CL_Shutdown+0xed>
    6e1d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e24 <CL_Shutdown+0xf4>
    6e24:	e8 00 00 00 00       	call   6e29 <CL_Shutdown+0xf9>
    6e29:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e30 <CL_Shutdown+0x100>
    6e30:	e8 00 00 00 00       	call   6e35 <CL_Shutdown+0x105>
    6e35:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e3c <CL_Shutdown+0x10c>
    6e3c:	e8 00 00 00 00       	call   6e41 <CL_Shutdown+0x111>
    6e41:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e48 <CL_Shutdown+0x118>
    6e48:	e8 00 00 00 00       	call   6e4d <CL_Shutdown+0x11d>
    6e4d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e54 <CL_Shutdown+0x124>
    6e54:	e8 00 00 00 00       	call   6e59 <CL_Shutdown+0x129>
    6e59:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e60 <CL_Shutdown+0x130>
    6e60:	e8 00 00 00 00       	call   6e65 <CL_Shutdown+0x135>
    6e65:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e6c <CL_Shutdown+0x13c>
    6e6c:	e8 00 00 00 00       	call   6e71 <CL_Shutdown+0x141>
    6e71:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e78 <CL_Shutdown+0x148>
    6e78:	e8 00 00 00 00       	call   6e7d <CL_Shutdown+0x14d>
    6e7d:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e84 <CL_Shutdown+0x154>
    6e84:	e8 00 00 00 00       	call   6e89 <CL_Shutdown+0x159>
    6e89:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e90 <CL_Shutdown+0x160>
    6e90:	e8 00 00 00 00       	call   6e95 <CL_Shutdown+0x165>
    6e95:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6e9c <CL_Shutdown+0x16c>
    6e9c:	e8 00 00 00 00       	call   6ea1 <CL_Shutdown+0x171>
    6ea1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ea8 <CL_Shutdown+0x178>
    6ea8:	e8 00 00 00 00       	call   6ead <CL_Shutdown+0x17d>
    6ead:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6eb4 <CL_Shutdown+0x184>
    6eb4:	e8 00 00 00 00       	call   6eb9 <CL_Shutdown+0x189>
    6eb9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ec0 <CL_Shutdown+0x190>
    6ec0:	e8 00 00 00 00       	call   6ec5 <CL_Shutdown+0x195>
    6ec5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ecc <CL_Shutdown+0x19c>
    6ecc:	e8 00 00 00 00       	call   6ed1 <CL_Shutdown+0x1a1>
    6ed1:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ed8 <CL_Shutdown+0x1a8>
    6ed8:	e8 00 00 00 00       	call   6edd <CL_Shutdown+0x1ad>
    6edd:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ee4 <CL_Shutdown+0x1b4>
    6ee4:	e8 00 00 00 00       	call   6ee9 <CL_Shutdown+0x1b9>
    6ee9:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6ef0 <CL_Shutdown+0x1c0>
    6ef0:	e8 00 00 00 00       	call   6ef5 <CL_Shutdown+0x1c5>
    6ef5:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6efc <CL_Shutdown+0x1cc>
    6efc:	e8 00 00 00 00       	call   6f01 <CL_Shutdown+0x1d1>
    6f01:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6f08 <CL_Shutdown+0x1d8>
    6f08:	e8 00 00 00 00       	call   6f0d <CL_Shutdown+0x1dd>
    6f0d:	e8 00 00 00 00       	call   6f12 <CL_Shutdown+0x1e2>
    6f12:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 6f19 <CL_Shutdown+0x1e9>
    6f19:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6f20 <CL_Shutdown+0x1f0>
    6f20:	e8 00 00 00 00       	call   6f25 <CL_Shutdown+0x1f5>
    6f25:	ba 08 f5 0d 00       	mov    edx,0xdf508
    6f2a:	31 f6                	xor    esi,esi
    6f2c:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6f33 <CL_Shutdown+0x203>
    6f33:	c7 05 00 00 00 00 00 	mov    DWORD PTR [rip+0x0],0x0        # 6f3d <CL_Shutdown+0x20d>
    6f3a:	00 00 00 
    6f3d:	e8 00 00 00 00       	call   6f42 <CL_Shutdown+0x212>
    6f42:	31 ff                	xor    edi,edi
    6f44:	e8 00 00 00 00       	call   6f49 <CL_Shutdown+0x219>
    6f49:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6f50 <CL_Shutdown+0x220>
    6f50:	31 c0                	xor    eax,eax
    6f52:	5b                   	pop    rbx
    6f53:	e9 00 00 00 00       	jmp    6f58 <CL_Shutdown+0x228>
    6f58:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    6f5f:	00 
    6f60:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 6f67 <CL_Shutdown+0x237>
    6f67:	31 c0                	xor    eax,eax
    6f69:	5b                   	pop    rbx
    6f6a:	e9 00 00 00 00       	jmp    6f6f <CL_Shutdown+0x23f>
    6f6f:	90                   	nop

0000000000006f70 <CL_ServerStatus>:
CL_ServerStatus():
    6f70:	48 85 ff             	test   rdi,rdi
    6f73:	0f 84 bf 00 00 00    	je     7038 <CL_ServerStatus+0xc8>
    6f79:	41 55                	push   r13
    6f7b:	41 54                	push   r12
    6f7d:	41 89 d4             	mov    r12d,edx
    6f80:	ba 07 00 00 00       	mov    edx,0x7
    6f85:	55                   	push   rbp
    6f86:	48 89 f5             	mov    rbp,rsi
    6f89:	53                   	push   rbx
    6f8a:	48 83 ec 28          	sub    rsp,0x28
    6f8e:	48 89 e3             	mov    rbx,rsp
    6f91:	48 89 de             	mov    rsi,rbx
    6f94:	e8 00 00 00 00       	call   6f99 <CL_ServerStatus+0x29>
    6f99:	85 c0                	test   eax,eax
    6f9b:	75 13                	jne    6fb0 <CL_ServerStatus+0x40>
    6f9d:	31 c0                	xor    eax,eax
    6f9f:	48 83 c4 28          	add    rsp,0x28
    6fa3:	5b                   	pop    rbx
    6fa4:	5d                   	pop    rbp
    6fa5:	41 5c                	pop    r12
    6fa7:	41 5d                	pop    r13
    6fa9:	c3                   	ret    
    6faa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    6fb0:	48 89 df             	mov    rdi,rbx
    6fb3:	e8 08 be ff ff       	call   2dc0 <CL_GetServerStatus>
    6fb8:	49 89 c5             	mov    r13,rax
    6fbb:	48 85 ed             	test   rbp,rbp
    6fbe:	0f 84 1c 01 00 00    	je     70e0 <CL_ServerStatus+0x170>
    6fc4:	48 8d b0 00 20 00 00 	lea    rsi,[rax+0x2000]
    6fcb:	48 89 df             	mov    rdi,rbx
    6fce:	e8 00 00 00 00       	call   6fd3 <CL_ServerStatus+0x63>
    6fd3:	85 c0                	test   eax,eax
    6fd5:	0f 84 95 00 00 00    	je     7070 <CL_ServerStatus+0x100>
    6fdb:	41 8b 95 28 20 00 00 	mov    edx,DWORD PTR [r13+0x2028]
    6fe2:	85 d2                	test   edx,edx
    6fe4:	0f 84 0d 01 00 00    	je     70f7 <CL_ServerStatus+0x187>
    6fea:	e8 00 00 00 00       	call   6fef <CL_ServerStatus+0x7f>
    6fef:	48 8b 15 00 00 00 00 	mov    rdx,QWORD PTR [rip+0x0]        # 6ff6 <CL_ServerStatus+0x86>
    6ff6:	41 2b 85 24 20 00 00 	sub    eax,DWORD PTR [r13+0x2024]
    6ffd:	3b 42 30             	cmp    eax,DWORD PTR [rdx+0x30]
    7000:	7e 9b                	jle    6f9d <CL_ServerStatus+0x2d>
    7002:	49 c7 85 28 20 00 00 	mov    QWORD PTR [r13+0x2028],0x1
    7009:	01 00 00 00 
    700d:	41 c7 85 30 20 00 00 	mov    DWORD PTR [r13+0x2030],0x0
    7014:	00 00 00 00 
    7018:	41 c7 85 20 20 00 00 	mov    DWORD PTR [r13+0x2020],0x0
    701f:	00 00 00 00 
    7023:	e8 00 00 00 00       	call   7028 <CL_ServerStatus+0xb8>
    7028:	41 89 85 24 20 00 00 	mov    DWORD PTR [r13+0x2024],eax
    702f:	e9 93 00 00 00       	jmp    70c7 <CL_ServerStatus+0x157>
    7034:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
    7038:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 703f <CL_ServerStatus+0xcf>
    703f:	48 8d 90 80 03 02 00 	lea    rdx,[rax+0x20380]
    7046:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    704d:	00 00 00 
    7050:	31 c9                	xor    ecx,ecx
    7052:	c7 40 1c 01 00 00 00 	mov    DWORD PTR [rax+0x1c],0x1
    7059:	48 05 38 20 00 00    	add    rax,0x2038
    705f:	66 89 88 c8 df ff ff 	mov    WORD PTR [rax-0x2038],cx
    7066:	48 39 c2             	cmp    rdx,rax
    7069:	75 e5                	jne    7050 <CL_ServerStatus+0xe0>
    706b:	31 c0                	xor    eax,eax
    706d:	c3                   	ret    
    706e:	66 90                	xchg   ax,ax
    7070:	41 8b 85 30 20 00 00 	mov    eax,DWORD PTR [r13+0x2030]
    7077:	85 c0                	test   eax,eax
    7079:	0f 84 1e ff ff ff    	je     6f9d <CL_ServerStatus+0x2d>
    707f:	66 0f 6f 04 24       	movdqa xmm0,XMMWORD PTR [rsp]
    7084:	66 0f 6f 4c 24 10    	movdqa xmm1,XMMWORD PTR [rsp+0x10]
    708a:	49 c7 85 28 20 00 00 	mov    QWORD PTR [r13+0x2028],0x1
    7091:	01 00 00 00 
    7095:	41 c7 85 30 20 00 00 	mov    DWORD PTR [r13+0x2030],0x0
    709c:	00 00 00 00 
    70a0:	41 0f 11 85 00 20 00 	movups XMMWORD PTR [r13+0x2000],xmm0
    70a7:	00 
    70a8:	41 0f 11 8d 10 20 00 	movups XMMWORD PTR [r13+0x2010],xmm1
    70af:	00 
    70b0:	e8 00 00 00 00       	call   70b5 <CL_ServerStatus+0x145>
    70b5:	41 c7 85 20 20 00 00 	mov    DWORD PTR [r13+0x2020],0x0
    70bc:	00 00 00 00 
    70c0:	41 89 85 24 20 00 00 	mov    DWORD PTR [r13+0x2024],eax
    70c7:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 70ce <CL_ServerStatus+0x15e>
    70ce:	48 89 de             	mov    rsi,rbx
    70d1:	31 ff                	xor    edi,edi
    70d3:	31 c0                	xor    eax,eax
    70d5:	e8 00 00 00 00       	call   70da <CL_ServerStatus+0x16a>
    70da:	e9 be fe ff ff       	jmp    6f9d <CL_ServerStatus+0x2d>
    70df:	90                   	nop
    70e0:	c7 80 30 20 00 00 01 	mov    DWORD PTR [rax+0x2030],0x1
    70e7:	00 00 00 
    70ea:	48 83 c4 28          	add    rsp,0x28
    70ee:	31 c0                	xor    eax,eax
    70f0:	5b                   	pop    rbx
    70f1:	5d                   	pop    rbp
    70f2:	41 5c                	pop    r12
    70f4:	41 5d                	pop    r13
    70f6:	c3                   	ret    
    70f7:	44 89 e2             	mov    edx,r12d
    70fa:	4c 89 ee             	mov    rsi,r13
    70fd:	48 89 ef             	mov    rdi,rbp
    7100:	e8 00 00 00 00       	call   7105 <CL_ServerStatus+0x195>
    7105:	b8 01 00 00 00       	mov    eax,0x1
    710a:	41 c7 85 30 20 00 00 	mov    DWORD PTR [r13+0x2030],0x1
    7111:	01 00 00 00 
    7115:	41 c7 85 24 20 00 00 	mov    DWORD PTR [r13+0x2024],0x0
    711c:	00 00 00 00 
    7120:	e9 7a fe ff ff       	jmp    6f9f <CL_ServerStatus+0x2f>
    7125:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    712c:	00 00 00 00 

0000000000007130 <CL_GetPing>:
CL_GetPing():
    7130:	83 ff 1f             	cmp    edi,0x1f
    7133:	77 1a                	ja     714f <CL_GetPing+0x1f>
    7135:	48 63 c7             	movsxd rax,edi
    7138:	4c 8d 05 00 00 00 00 	lea    r8,[rip+0x0]        # 713f <CL_GetPing+0xf>
    713f:	48 69 c0 28 04 00 00 	imul   rax,rax,0x428
    7146:	66 41 83 7c 00 14 00 	cmp    WORD PTR [r8+rax*1+0x14],0x0
    714d:	75 11                	jne    7160 <CL_GetPing+0x30>
    714f:	c6 06 00             	mov    BYTE PTR [rsi],0x0
    7152:	c7 01 00 00 00 00    	mov    DWORD PTR [rcx],0x0
    7158:	c3                   	ret    
    7159:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    7160:	e9 db c7 ff ff       	jmp    3940 <CL_GetPing.part.21>
    7165:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    716c:	00 00 00 00 

0000000000007170 <CL_GetPingInfo>:
CL_GetPingInfo():
    7170:	48 89 f1             	mov    rcx,rsi
    7173:	83 ff 1f             	cmp    edi,0x1f
    7176:	77 19                	ja     7191 <CL_GetPingInfo+0x21>
    7178:	48 63 c7             	movsxd rax,edi
    717b:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 7182 <CL_GetPingInfo+0x12>
    7182:	48 69 c0 28 04 00 00 	imul   rax,rax,0x428
    7189:	66 83 7c 06 14 00    	cmp    WORD PTR [rsi+rax*1+0x14],0x0
    718f:	75 17                	jne    71a8 <CL_GetPingInfo+0x38>
    7191:	85 d2                	test   edx,edx
    7193:	74 0b                	je     71a0 <CL_GetPingInfo+0x30>
    7195:	c6 01 00             	mov    BYTE PTR [rcx],0x0
    7198:	c3                   	ret    
    7199:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    71a0:	c3                   	ret    
    71a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    71a8:	48 8d 74 06 28       	lea    rsi,[rsi+rax*1+0x28]
    71ad:	48 89 cf             	mov    rdi,rcx
    71b0:	e9 00 00 00 00       	jmp    71b5 <CL_GetPingInfo+0x45>
    71b5:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    71bc:	00 00 00 00 

00000000000071c0 <CL_ClearPing>:
CL_ClearPing():
    71c0:	83 ff 1f             	cmp    edi,0x1f
    71c3:	77 18                	ja     71dd <CL_ClearPing+0x1d>
    71c5:	48 63 ff             	movsxd rdi,edi
    71c8:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 71cf <CL_ClearPing+0xf>
    71cf:	31 d2                	xor    edx,edx
    71d1:	48 69 ff 28 04 00 00 	imul   rdi,rdi,0x428
    71d8:	66 89 54 38 14       	mov    WORD PTR [rax+rdi*1+0x14],dx
    71dd:	c3                   	ret    
    71de:	66 90                	xchg   ax,ax

00000000000071e0 <CL_GetPingQueueCount>:
CL_GetPingQueueCount():
    71e0:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 71e7 <CL_GetPingQueueCount+0x7>
    71e7:	31 c0                	xor    eax,eax
    71e9:	48 8d 8a 00 85 00 00 	lea    rcx,[rdx+0x8500]
    71f0:	66 83 7a 14 01       	cmp    WORD PTR [rdx+0x14],0x1
    71f5:	83 d8 ff             	sbb    eax,0xffffffff
    71f8:	48 81 c2 28 04 00 00 	add    rdx,0x428
    71ff:	48 39 ca             	cmp    rdx,rcx
    7202:	75 ec                	jne    71f0 <CL_GetPingQueueCount+0x10>
    7204:	c3                   	ret    
    7205:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    720c:	00 00 00 00 

0000000000007210 <CL_UpdateVisiblePings_f>:
CL_UpdateVisiblePings_f():
    7210:	41 57                	push   r15
    7212:	41 56                	push   r14
    7214:	41 55                	push   r13
    7216:	41 54                	push   r12
    7218:	55                   	push   rbp
    7219:	53                   	push   rbx
    721a:	31 db                	xor    ebx,ebx
    721c:	48 81 ec 28 04 00 00 	sub    rsp,0x428
    7223:	83 ff 03             	cmp    edi,0x3
    7226:	0f 87 a3 00 00 00    	ja     72cf <CL_UpdateVisiblePings_f+0xbf>
    722c:	89 3d 00 00 00 00    	mov    DWORD PTR [rip+0x0],edi        # 7232 <CL_UpdateVisiblePings_f+0x22>
    7232:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 7239 <CL_UpdateVisiblePings_f+0x29>
    7239:	45 31 ff             	xor    r15d,r15d
    723c:	4c 8d a8 00 85 00 00 	lea    r13,[rax+0x8500]
    7243:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    7248:	66 83 78 14 01       	cmp    WORD PTR [rax+0x14],0x1
    724d:	41 83 df ff          	sbb    r15d,0xffffffff
    7251:	48 05 28 04 00 00    	add    rax,0x428
    7257:	4c 39 e8             	cmp    rax,r13
    725a:	75 ec                	jne    7248 <CL_UpdateVisiblePings_f+0x38>
    725c:	89 7c 24 04          	mov    DWORD PTR [rsp+0x4],edi
    7260:	41 83 ff 1f          	cmp    r15d,0x1f
    7264:	0f 8e 7e 00 00 00    	jle    72e8 <CL_UpdateVisiblePings_f+0xd8>
    726a:	0f b7 05 00 00 00 00 	movzx  eax,WORD PTR [rip+0x0]        # 7271 <CL_UpdateVisiblePings_f+0x61>
    7271:	bb 01 00 00 00       	mov    ebx,0x1
    7276:	4c 8d 25 00 00 00 00 	lea    r12,[rip+0x0]        # 727d <CL_UpdateVisiblePings_f+0x6d>
    727d:	31 ed                	xor    ebp,ebp
    727f:	4c 8d 74 24 1c       	lea    r14,[rsp+0x1c]
    7284:	4c 8d 6c 24 20       	lea    r13,[rsp+0x20]
    7289:	eb 0a                	jmp    7295 <CL_UpdateVisiblePings_f+0x85>
    728b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    7290:	41 0f b7 04 24       	movzx  eax,WORD PTR [r12]
    7295:	66 85 c0             	test   ax,ax
    7298:	74 26                	je     72c0 <CL_UpdateVisiblePings_f+0xb0>
    729a:	ba 00 04 00 00       	mov    edx,0x400
    729f:	4c 89 f1             	mov    rcx,r14
    72a2:	4c 89 ee             	mov    rsi,r13
    72a5:	89 ef                	mov    edi,ebp
    72a7:	e8 94 c6 ff ff       	call   3940 <CL_GetPing.part.21>
    72ac:	8b 54 24 1c          	mov    edx,DWORD PTR [rsp+0x1c]
    72b0:	85 d2                	test   edx,edx
    72b2:	74 0c                	je     72c0 <CL_UpdateVisiblePings_f+0xb0>
    72b4:	31 c0                	xor    eax,eax
    72b6:	bb 01 00 00 00       	mov    ebx,0x1
    72bb:	66 41 89 04 24       	mov    WORD PTR [r12],ax
    72c0:	83 c5 01             	add    ebp,0x1
    72c3:	49 81 c4 28 04 00 00 	add    r12,0x428
    72ca:	83 fd 20             	cmp    ebp,0x20
    72cd:	75 c1                	jne    7290 <CL_UpdateVisiblePings_f+0x80>
    72cf:	48 81 c4 28 04 00 00 	add    rsp,0x428
    72d6:	89 d8                	mov    eax,ebx
    72d8:	5b                   	pop    rbx
    72d9:	5d                   	pop    rbp
    72da:	41 5c                	pop    r12
    72dc:	41 5d                	pop    r13
    72de:	41 5e                	pop    r14
    72e0:	41 5f                	pop    r15
    72e2:	c3                   	ret    
    72e3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    72e8:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
    72ec:	83 f8 02             	cmp    eax,0x2
    72ef:	0f 84 6d 02 00 00    	je     7562 <CL_UpdateVisiblePings_f+0x352>
    72f5:	83 f8 03             	cmp    eax,0x3
    72f8:	0f 84 52 02 00 00    	je     7550 <CL_UpdateVisiblePings_f+0x340>
    72fe:	31 db                	xor    ebx,ebx
    7300:	85 c0                	test   eax,eax
    7302:	75 cb                	jne    72cf <CL_UpdateVisiblePings_f+0xbf>
    7304:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 730a <CL_UpdateVisiblePings_f+0xfa>
    730a:	4c 8d 0d 00 00 00 00 	lea    r9,[rip+0x0]        # 7311 <CL_UpdateVisiblePings_f+0x101>
    7311:	0f b7 05 00 00 00 00 	movzx  eax,WORD PTR [rip+0x0]        # 7318 <CL_UpdateVisiblePings_f+0x108>
    7318:	85 d2                	test   edx,edx
    731a:	0f 8e 4e 01 00 00    	jle    746e <CL_UpdateVisiblePings_f+0x25e>
    7320:	83 ea 01             	sub    edx,0x1
    7323:	4d 89 ce             	mov    r14,r9
    7326:	31 db                	xor    ebx,ebx
    7328:	48 8d 34 92          	lea    rsi,[rdx+rdx*4]
    732c:	48 8d 14 72          	lea    rdx,[rdx+rsi*2]
    7330:	48 c1 e2 04          	shl    rdx,0x4
    7334:	4d 8d a4 11 b0 00 00 	lea    r12,[r9+rdx*1+0xb0]
    733b:	00 
    733c:	eb 22                	jmp    7360 <CL_UpdateVisiblePings_f+0x150>
    733e:	66 90                	xchg   ax,ax
    7340:	85 d2                	test   edx,edx
    7342:	75 0c                	jne    7350 <CL_UpdateVisiblePings_f+0x140>
    7344:	83 7c 24 04 02       	cmp    DWORD PTR [rsp+0x4],0x2
    7349:	0f 84 31 01 00 00    	je     7480 <CL_UpdateVisiblePings_f+0x270>
    734f:	90                   	nop
    7350:	49 81 c6 b0 00 00 00 	add    r14,0xb0
    7357:	4d 39 e6             	cmp    r14,r12
    735a:	0f 84 10 01 00 00    	je     7470 <CL_UpdateVisiblePings_f+0x260>
    7360:	41 8b 8e 9c 00 00 00 	mov    ecx,DWORD PTR [r14+0x9c]
    7367:	85 c9                	test   ecx,ecx
    7369:	74 e5                	je     7350 <CL_UpdateVisiblePings_f+0x140>
    736b:	41 8b 96 98 00 00 00 	mov    edx,DWORD PTR [r14+0x98]
    7372:	83 fa ff             	cmp    edx,0xffffffff
    7375:	75 c9                	jne    7340 <CL_UpdateVisiblePings_f+0x130>
    7377:	41 83 ff 1f          	cmp    r15d,0x1f
    737b:	0f 8f fd 01 00 00    	jg     757e <CL_UpdateVisiblePings_f+0x36e>
    7381:	48 8d 2d 00 00 00 00 	lea    rbp,[rip+0x0]        # 7388 <CL_UpdateVisiblePings_f+0x178>
    7388:	eb 0a                	jmp    7394 <CL_UpdateVisiblePings_f+0x184>
    738a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    7390:	0f b7 45 14          	movzx  eax,WORD PTR [rbp+0x14]
    7394:	66 85 c0             	test   ax,ax
    7397:	74 13                	je     73ac <CL_UpdateVisiblePings_f+0x19c>
    7399:	4c 89 f6             	mov    rsi,r14
    739c:	48 89 ef             	mov    rdi,rbp
    739f:	e8 00 00 00 00       	call   73a4 <CL_UpdateVisiblePings_f+0x194>
    73a4:	85 c0                	test   eax,eax
    73a6:	0f 85 98 01 00 00    	jne    7544 <CL_UpdateVisiblePings_f+0x334>
    73ac:	48 81 c5 28 04 00 00 	add    rbp,0x428
    73b3:	4c 39 ed             	cmp    rbp,r13
    73b6:	75 d8                	jne    7390 <CL_UpdateVisiblePings_f+0x180>
    73b8:	0f b7 05 00 00 00 00 	movzx  eax,WORD PTR [rip+0x0]        # 73bf <CL_UpdateVisiblePings_f+0x1af>
    73bf:	66 85 c0             	test   ax,ax
    73c2:	0f 84 c0 01 00 00    	je     7588 <CL_UpdateVisiblePings_f+0x378>
    73c8:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 73cf <CL_UpdateVisiblePings_f+0x1bf>
    73cf:	ba 01 00 00 00       	mov    edx,0x1
    73d4:	eb 1d                	jmp    73f3 <CL_UpdateVisiblePings_f+0x1e3>
    73d6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    73dd:	00 00 00 
    73e0:	83 c2 01             	add    edx,0x1
    73e3:	48 81 c6 28 04 00 00 	add    rsi,0x428
    73ea:	83 fa 20             	cmp    edx,0x20
    73ed:	0f 84 81 01 00 00    	je     7574 <CL_UpdateVisiblePings_f+0x364>
    73f3:	66 83 3e 00          	cmp    WORD PTR [rsi],0x0
    73f7:	75 e7                	jne    73e0 <CL_UpdateVisiblePings_f+0x1d0>
    73f9:	48 63 da             	movsxd rbx,edx
    73fc:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 7403 <CL_UpdateVisiblePings_f+0x1f3>
    7403:	48 69 f3 28 04 00 00 	imul   rsi,rbx,0x428
    740a:	48 01 c6             	add    rsi,rax
    740d:	f3 41 0f 6f 16       	movdqu xmm2,XMMWORD PTR [r14]
    7412:	f3 41 0f 6f 5e 10    	movdqu xmm3,XMMWORD PTR [r14+0x10]
    7418:	48 89 74 24 08       	mov    QWORD PTR [rsp+0x8],rsi
    741d:	41 83 c7 01          	add    r15d,0x1
    7421:	0f 11 16             	movups XMMWORD PTR [rsi],xmm2
    7424:	0f 11 5e 10          	movups XMMWORD PTR [rsi+0x10],xmm3
    7428:	e8 00 00 00 00       	call   742d <CL_UpdateVisiblePings_f+0x21d>
    742d:	48 69 d3 28 04 00 00 	imul   rdx,rbx,0x428
    7434:	48 8d 1d 00 00 00 00 	lea    rbx,[rip+0x0]        # 743b <CL_UpdateVisiblePings_f+0x22b>
    743b:	31 ff                	xor    edi,edi
    743d:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
    7442:	48 01 da             	add    rdx,rbx
    7445:	bb 01 00 00 00       	mov    ebx,0x1
    744a:	89 42 20             	mov    DWORD PTR [rdx+0x20],eax
    744d:	31 c0                	xor    eax,eax
    744f:	c7 42 24 00 00 00 00 	mov    DWORD PTR [rdx+0x24],0x0
    7456:	48 8d 15 00 00 00 00 	lea    rdx,[rip+0x0]        # 745d <CL_UpdateVisiblePings_f+0x24d>
    745d:	e8 00 00 00 00       	call   7462 <CL_UpdateVisiblePings_f+0x252>
    7462:	0f b7 05 00 00 00 00 	movzx  eax,WORD PTR [rip+0x0]        # 7469 <CL_UpdateVisiblePings_f+0x259>
    7469:	e9 e2 fe ff ff       	jmp    7350 <CL_UpdateVisiblePings_f+0x140>
    746e:	31 db                	xor    ebx,ebx
    7470:	45 85 ff             	test   r15d,r15d
    7473:	ba 01 00 00 00       	mov    edx,0x1
    7478:	0f 45 da             	cmovne ebx,edx
    747b:	e9 f6 fd ff ff       	jmp    7276 <CL_UpdateVisiblePings_f+0x66>
    7480:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 7486 <CL_UpdateVisiblePings_f+0x276>
    7486:	85 d2                	test   edx,edx
    7488:	0f 8e c2 fe ff ff    	jle    7350 <CL_UpdateVisiblePings_f+0x140>
    748e:	83 ea 01             	sub    edx,0x1
    7491:	48 8d 0d 00 00 00 00 	lea    rcx,[rip+0x0]        # 7498 <CL_UpdateVisiblePings_f+0x288>
    7498:	89 15 00 00 00 00    	mov    DWORD PTR [rip+0x0],edx        # 749e <CL_UpdateVisiblePings_f+0x28e>
    749e:	48 63 d2             	movsxd rdx,edx
    74a1:	48 81 c2 42 5b 00 00 	add    rdx,0x5b42
    74a8:	48 c1 e2 05          	shl    rdx,0x5
    74ac:	48 01 ca             	add    rdx,rcx
    74af:	f3 0f 6f 42 08       	movdqu xmm0,XMMWORD PTR [rdx+0x8]
    74b4:	41 0f 11 06          	movups XMMWORD PTR [r14],xmm0
    74b8:	f3 0f 6f 4a 18       	movdqu xmm1,XMMWORD PTR [rdx+0x18]
    74bd:	41 c7 86 88 00 00 00 	mov    DWORD PTR [r14+0x88],0x0
    74c4:	00 00 00 00 
    74c8:	41 0f 11 4e 10       	movups XMMWORD PTR [r14+0x10],xmm1
    74cd:	41 c6 46 20 00       	mov    BYTE PTR [r14+0x20],0x0
    74d2:	41 c6 46 40 00       	mov    BYTE PTR [r14+0x40],0x0
    74d7:	41 c7 86 8c 00 00 00 	mov    DWORD PTR [r14+0x8c],0x0
    74de:	00 00 00 00 
    74e2:	41 c7 86 94 00 00 00 	mov    DWORD PTR [r14+0x94],0x0
    74e9:	00 00 00 00 
    74ed:	41 c7 86 90 00 00 00 	mov    DWORD PTR [r14+0x90],0x0
    74f4:	00 00 00 00 
    74f8:	41 c7 86 98 00 00 00 	mov    DWORD PTR [r14+0x98],0xffffffff
    74ff:	ff ff ff ff 
    7503:	41 c6 46 60 00       	mov    BYTE PTR [r14+0x60],0x0
    7508:	41 c7 86 84 00 00 00 	mov    DWORD PTR [r14+0x84],0x0
    750f:	00 00 00 00 
    7513:	41 c7 86 80 00 00 00 	mov    DWORD PTR [r14+0x80],0x0
    751a:	00 00 00 00 
    751e:	41 c7 86 a0 00 00 00 	mov    DWORD PTR [r14+0xa0],0x0
    7525:	00 00 00 00 
    7529:	41 c7 86 a4 00 00 00 	mov    DWORD PTR [r14+0xa4],0x0
    7530:	00 00 00 00 
    7534:	41 c7 86 a8 00 00 00 	mov    DWORD PTR [r14+0xa8],0x0
    753b:	00 00 00 00 
    753f:	e9 0c fe ff ff       	jmp    7350 <CL_UpdateVisiblePings_f+0x140>
    7544:	0f b7 05 00 00 00 00 	movzx  eax,WORD PTR [rip+0x0]        # 754b <CL_UpdateVisiblePings_f+0x33b>
    754b:	e9 00 fe ff ff       	jmp    7350 <CL_UpdateVisiblePings_f+0x140>
    7550:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 7556 <CL_UpdateVisiblePings_f+0x346>
    7556:	4c 8d 0d 00 00 00 00 	lea    r9,[rip+0x0]        # 755d <CL_UpdateVisiblePings_f+0x34d>
    755d:	e9 af fd ff ff       	jmp    7311 <CL_UpdateVisiblePings_f+0x101>
    7562:	8b 15 00 00 00 00    	mov    edx,DWORD PTR [rip+0x0]        # 7568 <CL_UpdateVisiblePings_f+0x358>
    7568:	4c 8d 0d 00 00 00 00 	lea    r9,[rip+0x0]        # 756f <CL_UpdateVisiblePings_f+0x35f>
    756f:	e9 9d fd ff ff       	jmp    7311 <CL_UpdateVisiblePings_f+0x101>
    7574:	bb 01 00 00 00       	mov    ebx,0x1
    7579:	e9 d2 fd ff ff       	jmp    7350 <CL_UpdateVisiblePings_f+0x140>
    757e:	bb 01 00 00 00       	mov    ebx,0x1
    7583:	e9 ee fc ff ff       	jmp    7276 <CL_UpdateVisiblePings_f+0x66>
    7588:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 758f <CL_UpdateVisiblePings_f+0x37f>
    758f:	31 db                	xor    ebx,ebx
    7591:	e9 77 fe ff ff       	jmp    740d <CL_UpdateVisiblePings_f+0x1fd>
    7596:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    759d:	00 00 00 

00000000000075a0 <CL_Download>:
CL_Download():
    75a0:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 75a7 <CL_Download+0x7>
    75a7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    75ab:	80 38 00             	cmp    BYTE PTR [rax],0x0
    75ae:	74 08                	je     75b8 <CL_Download+0x18>
    75b0:	e9 3b c4 ff ff       	jmp    39f0 <CL_Download.part.22>
    75b5:	0f 1f 00             	nop    DWORD PTR [rax]
    75b8:	48 83 ec 08          	sub    rsp,0x8
    75bc:	31 c0                	xor    eax,eax
    75be:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 75c5 <CL_Download+0x25>
    75c5:	e8 00 00 00 00       	call   75ca <CL_Download+0x2a>
    75ca:	31 c0                	xor    eax,eax
    75cc:	48 83 c4 08          	add    rsp,0x8
    75d0:	c3                   	ret    
    75d1:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
    75d8:	00 00 00 00 
    75dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000075e0 <CL_InitDownloads>:
CL_InitDownloads():
    75e0:	53                   	push   rbx
    75e1:	48 81 ec 00 20 00 00 	sub    rsp,0x2000
    75e8:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 75ef <CL_InitDownloads+0xf>
    75ef:	f6 40 30 01          	test   BYTE PTR [rax+0x30],0x1
    75f3:	0f 85 97 00 00 00    	jne    7690 <CL_InitDownloads+0xb0>
    75f9:	48 89 e3             	mov    rbx,rsp
    75fc:	31 d2                	xor    edx,edx
    75fe:	be 00 20 00 00       	mov    esi,0x2000
    7603:	48 89 df             	mov    rdi,rbx
    7606:	e8 00 00 00 00       	call   760b <CL_InitDownloads+0x2b>
    760b:	85 c0                	test   eax,eax
    760d:	0f 85 f5 00 00 00    	jne    7708 <CL_InitDownloads+0x128>
    7613:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 761a <CL_InitDownloads+0x3a>
    761a:	8b 50 30             	mov    edx,DWORD PTR [rax+0x30]
    761d:	85 d2                	test   edx,edx
    761f:	74 59                	je     767a <CL_InitDownloads+0x9a>
    7621:	f6 05 00 00 00 00 01 	test   BYTE PTR [rip+0x0],0x1        # 7628 <CL_InitDownloads+0x48>
    7628:	74 0a                	je     7634 <CL_InitDownloads+0x54>
    762a:	8b 05 00 00 00 00    	mov    eax,DWORD PTR [rip+0x0]        # 7630 <CL_InitDownloads+0x50>
    7630:	85 c0                	test   eax,eax
    7632:	74 46                	je     767a <CL_InitDownloads+0x9a>
    7634:	48 63 3d 00 00 00 00 	movsxd rdi,DWORD PTR [rip+0x0]        # 763b <CL_InitDownloads+0x5b>
    763b:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 7642 <CL_InitDownloads+0x62>
    7642:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 7649 <CL_InitDownloads+0x69>
    7649:	48 01 c7             	add    rdi,rax
    764c:	e8 00 00 00 00       	call   7651 <CL_InitDownloads+0x71>
    7651:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 7658 <CL_InitDownloads+0x78>
    7658:	48 89 c6             	mov    rsi,rax
    765b:	48 89 c3             	mov    rbx,rax
    765e:	31 c0                	xor    eax,eax
    7660:	e8 00 00 00 00       	call   7665 <CL_InitDownloads+0x85>
    7665:	31 d2                	xor    edx,edx
    7667:	31 f6                	xor    esi,esi
    7669:	48 89 c7             	mov    rdi,rax
    766c:	e8 00 00 00 00       	call   7671 <CL_InitDownloads+0x91>
    7671:	83 f8 ff             	cmp    eax,0xffffffff
    7674:	0f 84 a6 00 00 00    	je     7720 <CL_InitDownloads+0x140>
    767a:	e8 b1 c8 ff ff       	call   3f30 <CL_DownloadsComplete>
    767f:	48 81 c4 00 20 00 00 	add    rsp,0x2000
    7686:	5b                   	pop    rbx
    7687:	c3                   	ret    
    7688:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    768f:	00 
    7690:	ba 01 00 00 00       	mov    edx,0x1
    7695:	be 00 20 00 00       	mov    esi,0x2000
    769a:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 76a1 <CL_InitDownloads+0xc1>
    76a1:	e8 00 00 00 00       	call   76a6 <CL_InitDownloads+0xc6>
    76a6:	85 c0                	test   eax,eax
    76a8:	0f 84 65 ff ff ff    	je     7613 <CL_InitDownloads+0x33>
    76ae:	31 c0                	xor    eax,eax
    76b0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 76b7 <CL_InitDownloads+0xd7>
    76b7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 76be <CL_InitDownloads+0xde>
    76be:	e8 00 00 00 00       	call   76c3 <CL_InitDownloads+0xe3>
    76c3:	80 3d 00 00 00 00 00 	cmp    BYTE PTR [rip+0x0],0x0        # 76ca <CL_InitDownloads+0xea>
    76ca:	0f 84 43 ff ff ff    	je     7613 <CL_InitDownloads+0x33>
    76d0:	48 8d 35 00 00 00 00 	lea    rsi,[rip+0x0]        # 76d7 <CL_InitDownloads+0xf7>
    76d7:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 76de <CL_InitDownloads+0xfe>
    76de:	c7 05 00 00 00 00 05 	mov    DWORD PTR [rip+0x0],0x5        # 76e8 <CL_InitDownloads+0x108>
    76e5:	00 00 00 
    76e8:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 76ef <CL_InitDownloads+0x10f>
    76ef:	c6 05 00 00 00 00 00 	mov    BYTE PTR [rip+0x0],0x0        # 76f6 <CL_InitDownloads+0x116>
    76f6:	e8 00 00 00 00       	call   76fb <CL_InitDownloads+0x11b>
    76fb:	e8 00 00 00 00       	call   7700 <CL_InitDownloads+0x120>
    7700:	e9 7a ff ff ff       	jmp    767f <CL_InitDownloads+0x9f>
    7705:	0f 1f 00             	nop    DWORD PTR [rax]
    7708:	48 89 de             	mov    rsi,rbx
    770b:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 7712 <CL_InitDownloads+0x132>
    7712:	31 c0                	xor    eax,eax
    7714:	e8 00 00 00 00       	call   7719 <CL_InitDownloads+0x139>
    7719:	e9 f5 fe ff ff       	jmp    7613 <CL_InitDownloads+0x33>
    771e:	66 90                	xchg   ax,ax
    7720:	ba 01 00 00 00       	mov    edx,0x1
    7725:	48 89 de             	mov    rsi,rbx
    7728:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 772f <CL_InitDownloads+0x14f>
    772f:	e8 00 00 00 00       	call   7734 <CL_InitDownloads+0x154>
    7734:	85 c0                	test   eax,eax
    7736:	0f 84 3e ff ff ff    	je     767a <CL_InitDownloads+0x9a>
    773c:	c7 05 00 00 00 00 05 	mov    DWORD PTR [rip+0x0],0x5        # 7746 <CL_InitDownloads+0x166>
    7743:	00 00 00 
    7746:	e9 34 ff ff ff       	jmp    767f <CL_InitDownloads+0x9f>
    774b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000007750 <CL_Download_f>:
CL_Download_f():
    7750:	53                   	push   rbx
    7751:	e8 00 00 00 00       	call   7756 <CL_Download_f+0x6>
    7756:	83 f8 01             	cmp    eax,0x1
    7759:	7e 0f                	jle    776a <CL_Download_f+0x1a>
    775b:	bf 01 00 00 00       	mov    edi,0x1
    7760:	e8 00 00 00 00       	call   7765 <CL_Download_f+0x15>
    7765:	80 38 00             	cmp    BYTE PTR [rax],0x0
    7768:	75 1e                	jne    7788 <CL_Download_f+0x38>
    776a:	31 ff                	xor    edi,edi
    776c:	e8 00 00 00 00       	call   7771 <CL_Download_f+0x21>
    7771:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 7778 <CL_Download_f+0x28>
    7778:	5b                   	pop    rbx
    7779:	48 89 c6             	mov    rsi,rax
    777c:	31 c0                	xor    eax,eax
    777e:	e9 00 00 00 00       	jmp    7783 <CL_Download_f+0x33>
    7783:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
    7788:	bf 01 00 00 00       	mov    edi,0x1
    778d:	e8 00 00 00 00       	call   7792 <CL_Download_f+0x42>
    7792:	b9 02 00 00 00       	mov    ecx,0x2
    7797:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 779e <CL_Download_f+0x4e>
    779e:	48 89 c6             	mov    rsi,rax
    77a1:	f3 a6                	repz cmps BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
    77a3:	0f 97 c0             	seta   al
    77a6:	1c 00                	sbb    al,0x0
    77a8:	84 c0                	test   al,al
    77aa:	74 24                	je     77d0 <CL_Download_f+0x80>
    77ac:	bf 01 00 00 00       	mov    edi,0x1
    77b1:	e8 00 00 00 00       	call   77b6 <CL_Download_f+0x66>
    77b6:	31 ff                	xor    edi,edi
    77b8:	48 89 c3             	mov    rbx,rax
    77bb:	e8 00 00 00 00       	call   77c0 <CL_Download_f+0x70>
    77c0:	48 89 de             	mov    rsi,rbx
    77c3:	31 d2                	xor    edx,edx
    77c5:	5b                   	pop    rbx
    77c6:	48 89 c7             	mov    rdi,rax
    77c9:	e9 d2 fd ff ff       	jmp    75a0 <CL_Download>
    77ce:	66 90                	xchg   ax,ax
    77d0:	48 8d 3d 00 00 00 00 	lea    rdi,[rip+0x0]        # 77d7 <CL_Download_f+0x87>
    77d7:	5b                   	pop    rbx
    77d8:	e9 00 00 00 00       	jmp    77dd <CL_Download_f+0x8d>

Disassembly of section .bss:

0000000000000000 <hash_count>:
	...

0000000000000008 <cgvm>:
	...

0000000000000010 <recursive.21938>:
      10:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000014 <cl_disconnecting.21573>:
	...

0000000000000020 <saved_ents.21467>:
	...

000000000000d020 <saved_snap.21466>:
	...

000000000000d240 <rendererLib>:
	...

000000000000d248 <noGameRestart>:
    d248:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .rodata.str1.1:

0000000000000000 <.LC4>:
.LC4():
       0:	25 73 2e 74 6d       	and    eax,0x6d742e73
       5:	70 00                	jo     7 <.LC5>

0000000000000007 <.LC5>:
.LC5():
       7:	64 6d                	fs ins DWORD PTR es:[rdi],dx
       9:	5f                   	pop    rdi
	...

000000000000000b <.LC6>:
.LC6():
       b:	25 73 2e 25 73       	and    eax,0x73252e73
      10:	25 64 00         	and    eax,0x73250064

0000000000000013 <.LC7>:
.LC7():
      13:	25 73 2d 25 30       	and    eax,0x30252d73
      18:	32 64 2e 25          	xor    ah,BYTE PTR [rsi+rbp*1+0x25]
      1c:	73 25                	jae    43 <.LC9+0xc>
      1e:	64 00            	add    BYTE PTR fs:[rsi+0x6f],cl

0000000000000020 <.LC8>:
.LC8():
      20:	4e 6f                	rex.WRX outs dx,DWORD PTR ds:[rsi]
      22:	74 20                	je     44 <.LC9+0xd>
      24:	72 65                	jb     8b <.LC16+0xf>
      26:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
      29:	64 69 6e 67 20 61 20 	imul   ebp,DWORD PTR fs:[rsi+0x67],0x64206120
      30:	64 
      31:	65 6d                	gs ins DWORD PTR es:[rdi],dx
      33:	6f                   	outs   dx,DWORD PTR ds:[rsi]
      34:	2e 0a 00             	or     al,BYTE PTR cs:[rax]

0000000000000037 <.LC9>:
.LC9():
      37:	53                   	push   rbx
      38:	74 6f                	je     a9 <.LC18+0x5>
      3a:	70 70                	jo     ac <.LC18+0x8>
      3c:	65 64 20 64 65 6d    	gs and BYTE PTR fs:[rbp+riz*2+0x6d],ah
      42:	6f                   	outs   dx,DWORD PTR ds:[rsi]
      43:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
      46:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
      49:	64 69 6e 67 2e 0a 00 	imul   ebp,DWORD PTR fs:[rsi+0x67],0x4d000a2e
      50:	 

0000000000000050 <.LC10>:
.LC10():
      50:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
      52:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
      56:	30 3a                	xor    BYTE PTR [rdx],bh
      58:	20 33                	and    BYTE PTR [rbx],dh
      5a:	32 30                	xor    dh,BYTE PTR [rax]
      5c:	78 32                	js     90 <.LC16+0x14>
      5e:	34 30                	xor    al,0x30
	...

0000000000000061 <.LC11>:
.LC11():
      61:	0a 00                	or     al,BYTE PTR [rax]

0000000000000063 <.LC12>:
.LC12():
      63:	25 73 0a 00        	and    eax,0x36000a73

0000000000000067 <.LC13>:
.LC13():
      67:	36 38 00             	cmp    BYTE PTR ss:[rax],al

000000000000006a <.LC14>:
.LC14():
      6a:	37                   	(bad)  
      6b:	31 00                	xor    DWORD PTR [rax],eax

000000000000006d <.LC15>:
.LC15():
      6d:	63 6f 6d             	movsxd ebp,DWORD PTR [rdi+0x6d]
      70:	5f                   	pop    rdi
      71:	73 74                	jae    e7 <.LC23+0x4>
      73:	61                   	(bad)  
      74:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      75:	64 61                	fs (bad) 
      77:	6c                   	ins    BYTE PTR es:[rdi],dx
      78:	6f                   	outs   dx,DWORD PTR ds:[rsi]
      79:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      7a:	65 00            	add    BYTE PTR gs:[rcx+0x75],ah

000000000000007c <.LC16>:
.LC16():
      7c:	61                   	(bad)  
      7d:	75 74                	jne    f3 <.LC24+0x4>
      7f:	68 6f 72 69 7a       	push   0x7a69726f
      84:	65 2e 71 75          	gs cs jno fd <.LC24+0xe>
      88:	61                   	(bad)  
      89:	6b 65 33 61          	imul   esp,DWORD PTR [rbp+0x33],0x61
      8d:	72 65                	jb     f4 <.LC24+0x5>
      8f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      90:	61                   	(bad)  
      91:	2e 63 6f 6d          	movsxd ebp,DWORD PTR cs:[rdi+0x6d]
	...

0000000000000096 <.LC17>:
.LC17():
      96:	52                   	push   rdx
      97:	65 73 6f             	gs jae 109 <.LC25+0x7>
      9a:	6c                   	ins    BYTE PTR es:[rdi],dx
      9b:	76 69                	jbe    106 <.LC25+0x4>
      9d:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      9e:	67 20 25 73 0a 00  	and    BYTE PTR [eip+0x43000a73],ah        # 43000b18 <noGameRestart+0x42ff38d0>

00000000000000a4 <.LC18>:
.LC18():
      a4:	43 6f                	rex.XB outs dx,DWORD PTR ds:[rsi]
      a6:	75 6c                	jne    114 <.LC27>
      a8:	64 6e                	outs   dx,BYTE PTR fs:[rsi]
      aa:	27                   	(bad)  
      ab:	74 20                	je     cd <.LC22>
      ad:	72 65                	jb     114 <.LC27>
      af:	73 6f                	jae    120 <.LC28+0x1>
      b1:	6c                   	ins    BYTE PTR es:[rdi],dx
      b2:	76 65                	jbe    119 <.LC27+0x5>
      b4:	20 61 64             	and    BYTE PTR [rcx+0x64],ah
      b7:	64 72 65             	fs jb  11f <.LC28>
      ba:	73 73                	jae    12f <.LC30+0x4>
      bc:	0a 00                	or     al,BYTE PTR [rax]

00000000000000be <.LC20>:
.LC20():
      be:	30 00                	xor    BYTE PTR [rax],al

00000000000000c0 <.LC21>:
.LC21():
      c0:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
      c4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      c5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
      c6:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      c7:	79 6d                	jns    136 <.LC31+0x5>
      c9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
      ca:	75 73                	jne    13f <.LC32+0x4>
	...

00000000000000cd <.LC22>:
.LC22():
      cd:	67 65 74 4b          	addr32 gs je 11c <.LC27+0x8>
      d1:	65 79 41             	gs jns 115 <.LC27+0x1>
      d4:	75 74                	jne    14a <.LC33+0x6>
      d6:	68 6f 72 69 7a       	push   0x7a69726f
      db:	65 20 25 69 20 25 73 	and    BYTE PTR gs:[rip+0x73252069],ah        # 7325214b <noGameRestart+0x73244f03>
	...

00000000000000e3 <.LC23>:
.LC23():
      e3:	51                   	push   rcx
      e4:	75 61                	jne    147 <.LC33+0x3>
      e6:	6b 65 33 41          	imul   esp,DWORD PTR [rbp+0x33],0x41
      ea:	72 65                	jb     151 <.LC35+0x6>
      ec:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      ed:	61                   	(bad)  
	...

00000000000000ef <.LC24>:
.LC24():
      ef:	67 65 74 63          	addr32 gs je 156 <.LC35+0xb>
      f3:	68 61 6c 6c 65       	push   0x656c6c61
      f8:	6e                   	outs   dx,BYTE PTR ds:[rsi]
      f9:	67 65 20 25 64 20 25 	and    BYTE PTR gs:[eip+0x73252064],ah        # 73252165 <noGameRestart+0x73244f1d>
     100:	73 
	...

0000000000000102 <.LC25>:
.LC25():
     102:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     103:	65 74 5f             	gs je  165 <.LC37+0x5>
     106:	71 70                	jno    178 <.LC38+0x2>
     108:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     109:	72 74                	jb     17f <.LC39+0x1>
	...

000000000000010c <.LC26>:
.LC26():
     10c:	78 70                	js     17e <.LC39>
     10e:	5f                   	pop    rdi
     10f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     110:	61                   	(bad)  
     111:	6d                   	ins    DWORD PTR es:[rdi],dx
     112:	65 00            	add    BYTE PTR gs:[rax+0x70],bh

0000000000000114 <.LC27>:
.LC27():
     114:	78 70                	js     186 <.LC39+0x8>
     116:	5f                   	pop    rdi
     117:	63 6f 75             	movsxd ebp,DWORD PTR [rdi+0x75]
     11a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     11b:	74 72                	je     18f <.LC41>
     11d:	79 00                	jns    11f <.LC28>

000000000000011f <.LC28>:
.LC28():
     11f:	70 72                	jo     193 <.LC41+0x4>
     121:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     122:	74 6f                	je     193 <.LC41+0x4>
     124:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
	...

0000000000000128 <.LC29>:
.LC29():
     128:	25 69 00         	and    eax,0x70710069

000000000000012b <.LC30>:
.LC30():
     12b:	71 70                	jno    19d <.LC42>
     12d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     12e:	72 74                	jb     1a4 <.LC43+0x2>
	...

0000000000000131 <.LC31>:
.LC31():
     131:	63 68 61             	movsxd ebp,DWORD PTR [rax+0x61]
     134:	6c                   	ins    BYTE PTR es:[rdi],dx
     135:	6c                   	ins    BYTE PTR es:[rdi],dx
     136:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
     138:	67 65 00         	add    BYTE PTR gs:[ecx+0x33],dl

000000000000013b <.LC32>:
.LC32():
     13b:	51                   	push   rcx
     13c:	33 20                	xor    esp,DWORD PTR [rax]
     13e:	31 2e                	xor    DWORD PTR [rsi],ebp
     140:	33 32                	xor    esi,DWORD PTR [rdx]
     142:	65 00            	add    BYTE PTR gs:[rbx+0x6c],ah

0000000000000144 <.LC33>:
.LC33():
     144:	63 6c 69 65          	movsxd ebp,DWORD PTR [rcx+rbp*2+0x65]
     148:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     149:	74 00                	je     14b <.LC35>

000000000000014b <.LC35>:
.LC35():
     14b:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     14e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     14f:	65 63 74 20 22       	movsxd esi,DWORD PTR gs:[rax+riz*1+0x22]
     154:	25 73 22 00        	and    eax,0x63002273

0000000000000158 <.LC36>:
.LC36():
     158:	63 6c 5f 67          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x67]
     15c:	75 69                	jne    1c7 <.LC47+0x4>
     15e:	64 00            	add    BYTE PTR fs:[rdi+0x70],cl

0000000000000160 <.LC37>:
.LC37():
     160:	4f 70 65             	rex.WRXB jo 1c8 <.LC47+0x5>
     163:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     164:	65 64 20 50 4b       	gs and BYTE PTR fs:[rax+0x4b],dl
     169:	33 20                	xor    esp,DWORD PTR [rax]
     16b:	4e 61                	rex.WRX (bad) 
     16d:	6d                   	ins    DWORD PTR es:[rdi],dx
     16e:	65 73 3a             	gs jae 1ab <.LC44>
     171:	20 25 73 0a 00     	and    BYTE PTR [rip+0x63000a73],ah        # 63000bea <noGameRestart+0x62ff39a2>

0000000000000176 <.LC38>:
.LC38():
     176:	63 6c 69 65          	movsxd ebp,DWORD PTR [rcx+rbp*2+0x65]
     17a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     17b:	74 73                	je     1f0 <.LC51>
	...

000000000000017e <.LC39>:
.LC39():
     17e:	68 6f 73 74 6e       	push   0x6e74736f
     183:	61                   	(bad)  
     184:	6d                   	ins    DWORD PTR es:[rdi],dx
     185:	65 00            	add    BYTE PTR gs:[rbp+0x61],ch

0000000000000187 <.LC40>:
.LC40():
     187:	6d                   	ins    DWORD PTR es:[rdi],dx
     188:	61                   	(bad)  
     189:	70 6e                	jo     1f9 <.LC53+0x4>
     18b:	61                   	(bad)  
     18c:	6d                   	ins    DWORD PTR es:[rdi],dx
     18d:	65 00            	add    BYTE PTR gs:[rbx+0x76],dh

000000000000018f <.LC41>:
.LC41():
     18f:	73 76                	jae    207 <.LC54>
     191:	5f                   	pop    rdi
     192:	6d                   	ins    DWORD PTR es:[rdi],dx
     193:	61                   	(bad)  
     194:	78 63                	js     1f9 <.LC53+0x4>
     196:	6c                   	ins    BYTE PTR es:[rdi],dx
     197:	69 65 6e 74 73 00  	imul   esp,DWORD PTR [rbp+0x6e],0x67007374

000000000000019d <.LC42>:
.LC42():
     19d:	67 61                	addr32 (bad) 
     19f:	6d                   	ins    DWORD PTR es:[rdi],dx
     1a0:	65 00            	add    BYTE PTR gs:[rdi+0x61],ah

00000000000001a2 <.LC43>:
.LC43():
     1a2:	67 61                	addr32 (bad) 
     1a4:	6d                   	ins    DWORD PTR es:[rdi],dx
     1a5:	65 74 79             	gs je  221 <.LC56+0x9>
     1a8:	70 65                	jo     20f <.LC55+0x2>
	...

00000000000001ab <.LC44>:
.LC44():
     1ab:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     1ac:	65 74 74             	gs je  223 <.LC56+0xb>
     1af:	79 70                	jns    221 <.LC56+0x9>
     1b1:	65 00            	add    BYTE PTR gs:[rbp+0x69],ch

00000000000001b3 <.LC45>:
.LC45():
     1b3:	6d                   	ins    DWORD PTR es:[rdi],dx
     1b4:	69 6e 70 69 6e 67 00 	imul   ebp,DWORD PTR [rsi+0x70],0x676e69

00000000000001bb <.LC46>:
.LC46():
     1bb:	6d                   	ins    DWORD PTR es:[rdi],dx
     1bc:	61                   	(bad)  
     1bd:	78 70                	js     22f <.LC56+0x17>
     1bf:	69 6e 67 00    	imul   ebp,DWORD PTR [rsi+0x67],0x6e757000

00000000000001c3 <.LC47>:
.LC47():
     1c3:	70 75                	jo     23a <.LC58+0x5>
     1c5:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     1c6:	6b 62 75 73          	imul   esp,DWORD PTR [rdx+0x75],0x73
     1ca:	74 65                	je     231 <.LC57>
     1cc:	72 00                	jb     1ce <.LC48>

00000000000001ce <.LC48>:
.LC48():
     1ce:	67 5f                	addr32 pop rdi
     1d0:	68 75 6d 61 6e       	push   0x6e616d75
     1d5:	70 6c                	jo     243 <.LC58+0xe>
     1d7:	61                   	(bad)  
     1d8:	79 65                	jns    23f <.LC58+0xa>
     1da:	72 73                	jb     24f <.LC59>
	...

00000000000001dd <.LC49>:
.LC49():
     1dd:	67 5f                	addr32 pop rdi
     1df:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     1e0:	65 65 64 70 61       	gs gs fs jo 246 <.LC58+0x11>
     1e5:	73 73                	jae    25a <.LC59+0xb>
	...

00000000000001e8 <.LC50>:
.LC50():
     1e8:	75 6e                	jne    258 <.LC59+0x9>
     1ea:	6b 6e 6f 77          	imul   ebp,DWORD PTR [rsi+0x6f],0x77
     1ee:	6e                   	outs   dx,BYTE PTR ds:[rsi]
	...

00000000000001f0 <.LC51>:
.LC51():
     1f0:	25 73 00         	and    eax,0x5c0073

00000000000001f3 <.LC52>:
.LC52():
     1f3:	5c                   	pop    rsp
	...

00000000000001f5 <.LC53>:
.LC53():
     1f5:	53                   	push   rbx
     1f6:	65 72 76             	gs jb  26f <.LC60+0xe>
     1f9:	65 72 20             	gs jb  21c <.LC56+0x4>
     1fc:	73 65                	jae    263 <.LC60+0x2>
     1fe:	74 74                	je     274 <.LC61+0x4>
     200:	69 6e 67 73 3a 0a 00 	imul   ebp,DWORD PTR [rsi+0x67],0xa3a73

0000000000000207 <.LC54>:
.LC54():
     207:	25 2d 32 34 73       	and    eax,0x7334322d
	...

000000000000020d <.LC55>:
.LC55():
     20d:	0a 50 6c             	or     dl,BYTE PTR [rax+0x6c]
     210:	61                   	(bad)  
     211:	79 65                	jns    278 <.LC61+0x8>
     213:	72 73                	jb     288 <.LC63+0x2>
     215:	3a 0a                	cmp    cl,BYTE PTR [rdx]
	...

0000000000000218 <.LC56>:
.LC56():
     218:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     219:	75 6d                	jne    288 <.LC63+0x2>
     21b:	3a 20                	cmp    ah,BYTE PTR [rax]
     21d:	73 63                	jae    282 <.LC62+0x7>
     21f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     220:	72 65                	jb     287 <.LC63+0x1>
     222:	3a 20                	cmp    ah,BYTE PTR [rax]
     224:	70 69                	jo     28f <.LC63+0x9>
     226:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     227:	67 3a 20             	cmp    ah,BYTE PTR [eax]
     22a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     22b:	61                   	(bad)  
     22c:	6d                   	ins    DWORD PTR es:[rdi],dx
     22d:	65 3a 0a             	cmp    cl,BYTE PTR gs:[rdx]
	...

0000000000000231 <.LC57>:
.LC57():
     231:	5c                   	pop    rsp
     232:	25 73 00         	and    eax,0x2d250073

0000000000000235 <.LC58>:
.LC58():
     235:	25 2d 32 64 20       	and    eax,0x2064322d
     23a:	20 20                	and    BYTE PTR [rax],ah
     23c:	25 2d 33 64 20       	and    eax,0x2064332d
     241:	20 20                	and    BYTE PTR [rax],ah
     243:	20 25 2d 33 64 20    	and    BYTE PTR [rip+0x2064332d],ah        # 20643576 <noGameRestart+0x2063632e>
     249:	20 20                	and    BYTE PTR [rax],ah
     24b:	25 73 0a 00        	and    eax,0x72000a73

000000000000024f <.LC59>:
.LC59():
     24f:	72 5f                	jb     2b0 <.LC69+0x7>
     251:	61                   	(bad)  
     252:	6c                   	ins    BYTE PTR es:[rdi],dx
     253:	6c                   	ins    BYTE PTR es:[rdi],dx
     254:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     255:	77 53                	ja     2aa <.LC69+0x1>
     257:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     258:	66 74 77             	data16 je 2d2 <.LC74+0x9>
     25b:	61                   	(bad)  
     25c:	72 65                	jb     2c3 <.LC73+0x1>
     25e:	47                   	rex.RXB
     25f:	4c 00            	rex.WR add BYTE PTR [rdx+0x5f],r14b

0000000000000261 <.LC60>:
.LC60():
     261:	72 5f                	jb     2c2 <.LC73>
     263:	73 77                	jae    2dc <.LC77+0x2>
     265:	61                   	(bad)  
     266:	70 49                	jo     2b1 <.LC69+0x8>
     268:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     269:	74 65                	je     2d0 <.LC74+0x7>
     26b:	72 76                	jb     2e3 <.LC77+0x9>
     26d:	61                   	(bad)  
     26e:	6c                   	ins    BYTE PTR es:[rdi],dx
	...

0000000000000270 <.LC61>:
.LC61():
     270:	6c                   	ins    BYTE PTR es:[rdi],dx
     271:	69 62 47 4c 2e 73 6f 	imul   esp,DWORD PTR [rdx+0x47],0x6f732e4c
     278:	2e 31 00             	xor    DWORD PTR cs:[rax],eax

000000000000027b <.LC62>:
.LC62():
     27b:	72 5f                	jb     2dc <.LC77+0x2>
     27d:	67 6c                	ins    BYTE PTR es:[edi],dx
     27f:	44 72 69             	rex.R jb 2eb <.LC78+0x4>
     282:	76 65                	jbe    2e9 <.LC78+0x2>
     284:	72 00                	jb     286 <.LC63>

0000000000000286 <.LC63>:
.LC63():
     286:	72 5f                	jb     2e7 <.LC78>
     288:	64 69 73 70 6c 61 79 	imul   esi,DWORD PTR fs:[rbx+0x70],0x5279616c
     28f:	52 
     290:	65 66 72 65          	gs data16 jb 2f9 <.LC78+0x12>
     294:	73 68                	jae    2fe <.LC79+0x3>
	...

0000000000000297 <.LC64>:
.LC64():
     297:	33 36                	xor    esi,DWORD PTR [rsi]
     299:	30 00                	xor    BYTE PTR [rax],al

000000000000029b <.LC66>:
.LC66():
     29b:	33 00                	xor    eax,DWORD PTR [rax]

000000000000029d <.LC67>:
.LC67():
     29d:	76 69                	jbe    308 <.LC80+0x8>
     29f:	64 5f                	fs pop rdi
     2a1:	78 70                	js     313 <.LC82>
     2a3:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     2a4:	73 00                	jae    2a6 <.LC68>

00000000000002a6 <.LC68>:
.LC68():
     2a6:	32 32                	xor    dh,BYTE PTR [rdx]
	...

00000000000002a9 <.LC69>:
.LC69():
     2a9:	76 69                	jbe    314 <.LC82+0x1>
     2ab:	64 5f                	fs pop rdi
     2ad:	79 70                	jns    31f <.LC82+0xc>
     2af:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     2b0:	73 00                	jae    2b2 <.LC70>

00000000000002b2 <.LC70>:
.LC70():
     2b2:	72 5f                	jb     313 <.LC82>
     2b4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     2b5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     2b6:	62                   	(bad)  
     2b7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     2b8:	72 64                	jb     31e <.LC82+0xb>
     2ba:	65 72 00             	gs jb  2bd <.LC71>

00000000000002bd <.LC71>:
.LC71():
     2bd:	31 00                	xor    DWORD PTR [rax],eax

00000000000002bf <.LC72>:
.LC72():
     2bf:	2d 32 00         	sub    eax,0x5f720032

00000000000002c2 <.LC73>:
.LC73():
     2c2:	72 5f                	jb     323 <.LC83+0x1>
     2c4:	6d                   	ins    DWORD PTR es:[rdi],dx
     2c5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     2c6:	64 65 00         	fs add BYTE PTR gs:[rdx+0x5f],dh

00000000000002c9 <.LC74>:
.LC74():
     2c9:	72 5f                	jb     32a <.LC86+0x6>
     2cb:	6d                   	ins    DWORD PTR es:[rdi],dx
     2cc:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     2cd:	64 65 46 75 6c       	fs gs rex.RX jne 33e <.LC89+0x9>
     2d2:	6c                   	ins    BYTE PTR es:[rdi],dx
     2d3:	73 63                	jae    338 <.LC89+0x3>
     2d5:	72 65                	jb     33c <.LC89+0x7>
     2d7:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
	...

00000000000002da <.LC77>:
.LC77():
     2da:	72 5f                	jb     33b <.LC89+0x6>
     2dc:	66 75 6c             	data16 jne 34b <.LC90+0x8>
     2df:	6c                   	ins    BYTE PTR es:[rdi],dx
     2e0:	73 63                	jae    345 <.LC90+0x2>
     2e2:	72 65                	jb     349 <.LC90+0x6>
     2e4:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
	...

00000000000002e7 <.LC78>:
.LC78():
     2e7:	72 5f                	jb     348 <.LC90+0x5>
     2e9:	63 75 73             	movsxd esi,DWORD PTR [rbp+0x73]
     2ec:	74 6f                	je     35d <.LC92+0x6>
     2ee:	6d                   	ins    DWORD PTR es:[rdi],dx
     2ef:	50                   	push   rax
     2f0:	69 78 65 6c 41 73 70 	imul   edi,DWORD PTR [rax+0x65],0x7073416c
     2f7:	65 63 74 00        	movsxd esi,DWORD PTR gs:[rax+rax*1+0x31]

00000000000002fb <.LC79>:
.LC79():
     2fb:	31 36                	xor    DWORD PTR [rsi],esi
     2fd:	30 30                	xor    BYTE PTR [rax],dh
	...

0000000000000300 <.LC80>:
.LC80():
     300:	72 5f                	jb     361 <.LC92+0xa>
     302:	63 75 73             	movsxd esi,DWORD PTR [rbp+0x73]
     305:	74 6f                	je     376 <.LC94+0xb>
     307:	6d                   	ins    DWORD PTR es:[rdi],dx
     308:	57                   	push   rdi
     309:	69 64 74 68 00   	imul   esp,DWORD PTR [rsp+rsi*2+0x68],0x32303100
     310:	 

000000000000030e <.LC81>:
.LC81():
     30e:	31 30                	xor    DWORD PTR [rax],esi
     310:	32 34 00             	xor    dh,BYTE PTR [rax+rax*1]

0000000000000313 <.LC82>:
.LC82():
     313:	72 5f                	jb     374 <.LC94+0x9>
     315:	63 75 73             	movsxd esi,DWORD PTR [rbp+0x73]
     318:	74 6f                	je     389 <.LC96+0x12>
     31a:	6d                   	ins    DWORD PTR es:[rdi],dx
     31b:	48                   	rex.W
     31c:	65 69 67 68 74 00  	imul   esp,DWORD PTR gs:[rdi+0x68],0x340074
     323:	 

0000000000000322 <.LC83>:
.LC83():
     322:	34 00                	xor    al,0x0

0000000000000324 <.LC86>:
.LC86():
     324:	72 5f                	jb     385 <.LC96+0xe>
     326:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
     329:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     32a:	72 62                	jb     38e <.LC97+0x2>
     32c:	69 74 73 00    	imul   esi,DWORD PTR [rbx+rsi*2+0x0],0x38003233
     333:	 

0000000000000330 <.LC87>:
.LC87():
     330:	33 32                	xor    esi,DWORD PTR [rdx]
	...

0000000000000333 <.LC88>:
.LC88():
     333:	38 00                	cmp    BYTE PTR [rax],al

0000000000000335 <.LC89>:
.LC89():
     335:	72 5f                	jb     396 <.LC97+0xa>
     337:	73 74                	jae    3ad <.LC98+0x6>
     339:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
     33b:	63 69 6c             	movsxd ebp,DWORD PTR [rcx+0x6c]
     33e:	62                   	(bad)  
     33f:	69 74 73 00    	imul   esi,DWORD PTR [rbx+rsi*2+0x0],0x65645f72
     346:	 

0000000000000343 <.LC90>:
.LC90():
     343:	72 5f                	jb     3a4 <.LC97+0x18>
     345:	64 65 70 74          	fs gs jo 3bd <.LC99+0xc>
     349:	68 62 69 74 73       	push   0x73746962
	...

000000000000034f <.LC91>:
.LC91():
     34f:	47                   	rex.RXB
     350:	4c 5f                	rex.WR pop rdi
     352:	42                   	rex.X
     353:	41                   	rex.B
     354:	43                   	rex.XB
     355:	4b 00            	rex.WXB add BYTE PTR [r10+0x5f],sil

0000000000000357 <.LC92>:
.LC92():
     357:	72 5f                	jb     3b8 <.LC99+0x7>
     359:	64 72 61             	fs jb  3bd <.LC99+0xc>
     35c:	77 42                	ja     3a0 <.LC97+0x14>
     35e:	75 66                	jne    3c6 <.LC99+0x15>
     360:	66 65 72 00          	data16 gs jb 364 <.LC93>

0000000000000364 <.LC93>:
.LC93():
     364:	76 75                	jbe    3db <.LC101+0xe>
     366:	6c                   	ins    BYTE PTR es:[rdi],dx
     367:	6b 61 6e 00          	imul   esp,DWORD PTR [rcx+0x6e],0x0

000000000000036b <.LC94>:
.LC94():
     36b:	63 6c 5f 72          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x72]
     36f:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
     371:	64 65 72 65          	fs gs jb 3da <.LC101+0xd>
     375:	72 00                	jb     377 <.LC96>

0000000000000377 <.LC96>:
.LC96():
     377:	71 75                	jno    3ee <.LC102+0x5>
     379:	61                   	(bad)  
     37a:	6b 65 33 65          	imul   esp,DWORD PTR [rbp+0x33],0x65
     37e:	5f                   	pop    rdi
     37f:	25 73 5f 78 38       	and    eax,0x38785f73
     384:	36 5f                	ss pop rdi
     386:	36 34 2e             	ss xor al,0x2e
     389:	73 6f                	jae    3fa <.LC104+0x2>
	...

000000000000038c <.LC97>:
.LC97():
     38c:	46 61                	rex.RX (bad) 
     38e:	69 6c 65 64 20 74 6f 	imul   ebp,DWORD PTR [rbp+riz*2+0x64],0x206f7420
     395:	20 
     396:	6c                   	ins    BYTE PTR es:[rdi],dx
     397:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     398:	61                   	(bad)  
     399:	64 20 72 65          	and    BYTE PTR fs:[rdx+0x65],dh
     39d:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     39e:	64 65 72 65          	fs gs jb 407 <.LC108+0x2>
     3a2:	72 20                	jb     3c4 <.LC99+0x13>
     3a4:	25 73 00         	and    eax,0x65470073

00000000000003a7 <.LC98>:
.LC98():
     3a7:	47                   	rex.RXB
     3a8:	65 74 52             	gs je  3fd <.LC105>
     3ab:	65 66 41 50          	gs push r8w
     3af:	49 00            	rex.WB add BYTE PTR [r11+0x61],al

00000000000003b1 <.LC99>:
.LC99():
     3b1:	43 61                	rex.XB (bad) 
     3b3:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     3b4:	27                   	(bad)  
     3b5:	74 20                	je     3d7 <.LC101+0xa>
     3b7:	6c                   	ins    BYTE PTR es:[rdi],dx
     3b8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     3b9:	61                   	(bad)  
     3ba:	64 20 73 79          	and    BYTE PTR fs:[rbx+0x79],dh
     3be:	6d                   	ins    DWORD PTR es:[rdi],dx
     3bf:	62                   	(bad)  
     3c0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     3c1:	6c                   	ins    BYTE PTR es:[rdi],dx
     3c2:	20 47 65             	and    BYTE PTR [rdi+0x65],al
     3c5:	74 52                	je     419 <.LC109+0x9>
     3c7:	65 66 41 50          	gs push r8w
     3cb:	49 00            	rex.WB add BYTE PTR [r11+0x6f],al

00000000000003cd <.LC101>:
.LC101():
     3cd:	43 6f                	rex.XB outs dx,DWORD PTR ds:[rsi]
     3cf:	75 6c                	jne    43d <.LC113+0x2>
     3d1:	64 6e                	outs   dx,BYTE PTR fs:[rsi]
     3d3:	27                   	(bad)  
     3d4:	74 20                	je     3f6 <.LC103+0x3>
     3d6:	69 6e 69 74 69 61 6c 	imul   ebp,DWORD PTR [rsi+0x69],0x6c616974
     3dd:	69 7a 65 20 72 65 66 	imul   edi,DWORD PTR [rdx+0x65],0x66657220
     3e4:	72 65                	jb     44b <.LC114+0x6>
     3e6:	73 68                	jae    450 <.LC114+0xb>
	...

00000000000003e9 <.LC102>:
.LC102():
     3e9:	63 6c 5f 70          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x70]
     3ed:	61                   	(bad)  
     3ee:	75 73                	jne    463 <.LC115+0x7>
     3f0:	65 64 00         	gs add BYTE PTR fs:[rsi+0x33],bl

00000000000003f3 <.LC103>:
.LC103():
     3f3:	5e                   	pop    rsi
     3f4:	33 25 73 00      	xor    esp,DWORD PTR [rip+0x315e0073]        # 315e046d <noGameRestart+0x315d3225>

00000000000003f8 <.LC104>:
.LC104():
     3f8:	5e                   	pop    rsi
     3f9:	31 25 73 00      	xor    DWORD PTR [rip+0x706d0073],esp        # 706d0472 <noGameRestart+0x706c322a>

00000000000003fd <.LC105>:
.LC105():
     3fd:	6d                   	ins    DWORD PTR es:[rdi],dx
     3fe:	70 34                	jo     434 <.LC112+0xa>
	...

0000000000000401 <.LC106>:
.LC106():
     401:	61                   	(bad)  
     402:	76 69                	jbe    46d <.LC115+0x11>
	...

0000000000000405 <.LC108>:
.LC108():
     405:	76 69                	jbe    470 <.LC115+0x14>
     407:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
     40a:	2d 70 69 70 65       	sub    eax,0x65706970
	...

0000000000000410 <.LC109>:
.LC109():
     410:	76 69                	jbe    47b <.LC117+0x8>
     412:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
     415:	73 2f                	jae    446 <.LC114+0x1>
     417:	76 69                	jbe    482 <.LC118+0x4>
     419:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
     41c:	25 30 34 64 2e       	and    eax,0x2e643430
     421:	25 73 00         	and    eax,0x73250073

0000000000000424 <.LC110>:
.LC110():
     424:	25 73 2e 25 73       	and    eax,0x73252e73
	...

000000000000042a <.LC112>:
.LC112():
     42a:	76 69                	jbe    495 <.LC119+0xb>
     42c:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
     42f:	73 2f                	jae    460 <.LC115+0x4>
     431:	76 69                	jbe    49c <.LC119+0x12>
     433:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
     436:	25 30 34 64 00       	and    eax,0x643430

000000000000043b <.LC113>:
.LC113():
     43b:	76 69                	jbe    4a6 <.LC121+0x7>
     43d:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
     440:	73 2f                	jae    471 <.LC115+0x15>
     442:	25 73 00         	and    eax,0x79530073

0000000000000445 <.LC114>:
.LC114():
     445:	53                   	push   rbx
     446:	79 73                	jns    4bb <.LC123+0x2>
     448:	74 65                	je     4af <.LC121+0x10>
     44a:	6d                   	ins    DWORD PTR es:[rdi],dx
     44b:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
     44e:	66 6f                	outs   dx,WORD PTR ds:[rsi]
     450:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
     453:	74 74                	je     4c9 <.LC125>
     455:	69 6e 67 73 3a 0a 00 	imul   ebp,DWORD PTR [rsi+0x67],0xa3a73

000000000000045c <.LC115>:
.LC115():
     45c:	53                   	push   rbx
     45d:	65 72 76             	gs jb  4d6 <.LC126+0x1>
     460:	65 72 20             	gs jb  483 <.LC118+0x5>
     463:	69 6e 66 6f 20 73 65 	imul   ebp,DWORD PTR [rsi+0x66],0x6573206f
     46a:	74 74                	je     4e0 <.LC126+0xb>
     46c:	69 6e 67 73 3a 0a 00 	imul   ebp,DWORD PTR [rsi+0x67],0xa3a73

0000000000000473 <.LC117>:
.LC117():
     473:	73 74                	jae    4e9 <.LC126+0x14>
     475:	61                   	(bad)  
     476:	74 65                	je     4dd <.LC126+0x8>
     478:	3a 20                	cmp    ah,BYTE PTR [rax]
     47a:	25 69 0a 00        	and    eax,0x53000a69

000000000000047e <.LC118>:
.LC118():
     47e:	53                   	push   rbx
     47f:	65 72 76             	gs jb  4f8 <.LC131+0xb>
     482:	65 72 3a             	gs jb  4bf <.LC123+0x6>
     485:	20 25 73 0a 00     	and    BYTE PTR [rip+0x55000a73],ah        # 55000efe <noGameRestart+0x54ff3cb6>

000000000000048a <.LC119>:
.LC119():
     48a:	55                   	push   rbp
     48b:	73 65                	jae    4f2 <.LC131+0x5>
     48d:	72 20                	jb     4af <.LC121+0x10>
     48f:	69 6e 66 6f 20 73 65 	imul   ebp,DWORD PTR [rsi+0x66],0x6573206f
     496:	74 74                	je     50c <.LC132+0x13>
     498:	69 6e 67 73 3a 0a 00 	imul   ebp,DWORD PTR [rsi+0x67],0xa3a73

000000000000049f <.LC121>:
.LC121():
     49f:	52                   	push   rdx
     4a0:	65 66 65 72 65       	gs data16 gs jb 50a <.LC132+0x11>
     4a5:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     4a6:	63 65 64             	movsxd esp,DWORD PTR [rbp+0x64]
     4a9:	20 50 4b             	and    BYTE PTR [rax+0x4b],dl
     4ac:	33 20                	xor    esp,DWORD PTR [rax]
     4ae:	4e 61                	rex.WRX (bad) 
     4b0:	6d                   	ins    DWORD PTR es:[rdi],dx
     4b1:	65 73 3a             	gs jae 4ee <.LC131+0x1>
     4b4:	20 25 73 0a 00     	and    BYTE PTR [rip+0xffffffffff000a73],ah        # ffffffffff000f2d <noGameRestart+0xfffffffffeff3ce5>

00000000000004b9 <.LC123>:
.LC123():
     4b9:	ff                   	(bad)  
     4ba:	ff                   	(bad)  
     4bb:	ff                   	(bad)  
     4bc:	ff 67 65             	jmp    QWORD PTR [rdi+0x65]
     4bf:	74 69                	je     52a <.LC134+0x4>
     4c1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     4c2:	66 6f                	outs   dx,WORD PTR ds:[rsi]
     4c4:	20 78 78             	and    BYTE PTR [rax+0x78],bh
     4c7:	78 00                	js     4c9 <.LC125>

00000000000004c9 <.LC125>:
.LC125():
     4c9:	73 76                	jae    541 <.LC137+0x6>
     4cb:	5f                   	pop    rdi
     4cc:	6d                   	ins    DWORD PTR es:[rdi],dx
     4cd:	61                   	(bad)  
     4ce:	73 74                	jae    544 <.LC137+0x9>
     4d0:	65 72 25             	gs jb  4f8 <.LC131+0xb>
     4d3:	64 00            	add    BYTE PTR fs:[rdi+0x6c],ah

00000000000004d5 <.LC126>:
.LC126():
     4d5:	67 6c                	ins    BYTE PTR es:[edi],dx
     4d7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     4d8:	62 61 6c 73 65       	(bad)  {k3}
     4dd:	72 76                	jb     555 <.LC138+0xb>
     4df:	65 72 73             	gs jb  555 <.LC138+0xb>
     4e2:	20 25 64 20 25 73    	and    BYTE PTR [rip+0x73252064],ah        # 7325254c <noGameRestart+0x73245304>
     4e8:	20 25 73 0a 00     	and    BYTE PTR [rip+0x6e000a73],ah        # 6e000f61 <noGameRestart+0x6dff3d19>

00000000000004ed <.LC131>:
.LC131():
     4ed:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     4ee:	65 74 5f             	gs je  550 <.LC138+0x6>
     4f1:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
     4f3:	61                   	(bad)  
     4f4:	62                   	(bad)  
     4f5:	6c                   	ins    BYTE PTR es:[rdi],dx
     4f6:	65 64 00         	gs add BYTE PTR fs:[rdi+0x65],ah

00000000000004f9 <.LC132>:
.LC132():
     4f9:	67 65 74 73          	addr32 gs je 570 <.LC140+0x8>
     4fd:	65 72 76             	gs jb  576 <.LC140+0xe>
     500:	65 72 73             	gs jb  576 <.LC140+0xe>
     503:	45 78 74             	rex.RB js 57a <.LC140+0x12>
     506:	20 25 73 20 25 73    	and    BYTE PTR [rip+0x73252073],ah        # 7325257f <noGameRestart+0x73245337>
	...

000000000000050d <.LC133>:
.LC133():
     50d:	67 65 74 73          	addr32 gs je 584 <.LC141+0x9>
     511:	65 72 76             	gs jb  58a <.LC141+0xf>
     514:	65 72 73             	gs jb  58a <.LC141+0xf>
     517:	45 78 74             	rex.RB js 58e <.LC141+0x13>
     51a:	20 25 73 20 25 73    	and    BYTE PTR [rip+0x73252073],ah        # 73252593 <noGameRestart+0x7324534b>
     520:	20 69 70             	and    BYTE PTR [rcx+0x70],ch
     523:	76 36                	jbe    55b <.LC139+0x2>
	...

0000000000000526 <.LC134>:
.LC134():
     526:	67 65 74 73          	addr32 gs je 59d <.LC143+0xe>
     52a:	65 72 76             	gs jb  5a3 <.LC143+0x14>
     52d:	65 72 73             	gs jb  5a3 <.LC143+0x14>
     530:	20 25 73 00      	and    BYTE PTR [rip+0x200073],ah        # 2005a9 <noGameRestart+0x1f3361>

0000000000000534 <.LC135>:
.LC135():
     534:	20 00                	and    BYTE PTR [rax],al

0000000000000536 <.LC136>:
.LC136():
     536:	2e 64 6d             	cs fs ins DWORD PTR es:[rdi],dx
     539:	5f                   	pop    rdi
	...

000000000000053b <.LC137>:
.LC137():
     53b:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
     53e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     53f:	73 2f                	jae    570 <.LC140+0x8>
     541:	25 73 2e 64 6d       	and    eax,0x6d642e73
     546:	5f                   	pop    rdi
     547:	25 64 00         	and    eax,0x65440064

000000000000054a <.LC138>:
.LC138():
     54a:	44                   	rex.R
     54b:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     54d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     54e:	20 66 69             	and    BYTE PTR [rsi+0x69],ah
     551:	6c                   	ins    BYTE PTR es:[rdi],dx
     552:	65 3a 20             	cmp    ah,BYTE PTR gs:[rax]
     555:	25 73 0a 00        	and    eax,0x4e000a73

0000000000000559 <.LC139>:
.LC139():
     559:	4e 6f                	rex.WRX outs dx,DWORD PTR ds:[rsi]
     55b:	74 20                	je     57d <.LC141+0x2>
     55d:	66 6f                	outs   dx,WORD PTR ds:[rsi]
     55f:	75 6e                	jne    5cf <.LC150+0x6>
     561:	64 3a 20             	cmp    ah,BYTE PTR fs:[rax]
     564:	25 73 0a 00        	and    eax,0x72000a73

0000000000000568 <.LC140>:
.LC140():
     568:	72 65                	jb     5cf <.LC150+0x6>
     56a:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
     56d:	64 20 3c 64          	and    BYTE PTR fs:[rsp+riz*2],bh
     571:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     573:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     574:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     575:	61                   	(bad)  
     576:	6d                   	ins    DWORD PTR es:[rdi],dx
     577:	65 3e 0a 00          	gs or  al,BYTE PTR ds:[rax]

000000000000057b <.LC141>:
.LC141():
     57b:	41 6c                	rex.B ins BYTE PTR es:[rdi],dx
     57d:	72 65                	jb     5e4 <.LC151+0x4>
     57f:	61                   	(bad)  
     580:	64 79 20             	fs jns 5a3 <.LC143+0x14>
     583:	72 65                	jb     5ea <.LC151+0xa>
     585:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
     588:	64 69 6e 67 2e 0a 00 	imul   ebp,DWORD PTR fs:[rsi+0x67],0x67000a2e
     58f:	 

000000000000058f <.LC143>:
.LC143():
     58f:	67 5f                	addr32 pop rdi
     591:	73 79                	jae    60c <.LC153>
     593:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     594:	63 68 72             	movsxd ebp,DWORD PTR [rax+0x72]
     597:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     598:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     599:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     59a:	75 73                	jne    60f <.LC153+0x3>
     59c:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
     59e:	69 65 6e 74 73 00  	imul   esp,DWORD PTR [rbp+0x6e],0x25007374

00000000000005a4 <.LC145>:
.LC145():
     5a4:	25 73 25 64 00       	and    eax,0x642573

00000000000005a9 <.LC146>:
.LC146():
     5a9:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
     5ac:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     5ad:	73 2f                	jae    5de <.LC150+0x15>
     5af:	25 73 00         	and    eax,0x65720073

00000000000005b2 <.LC148>:
.LC148():
     5b2:	72 65                	jb     619 <.LC154+0x4>
     5b4:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
     5b7:	64 69 6e 67 20 74 6f 	imul   ebp,DWORD PTR fs:[rsi+0x67],0x206f7420
     5be:	20 
     5bf:	25 73 2e 0a 00       	and    eax,0xa2e73

00000000000005c4 <.LC149>:
.LC149():
     5c4:	2e 74 6d             	cs je  634 <.LC155+0x15>
     5c7:	70 00                	jo     5c9 <.LC150>

00000000000005c9 <.LC150>:
.LC150():
     5c9:	45 52                	rex.RB push r10
     5cb:	52                   	push   rdx
     5cc:	4f 52                	rex.WRXB push r10
     5ce:	3a 20                	cmp    ah,BYTE PTR [rax]
     5d0:	63 6f 75             	movsxd ebp,DWORD PTR [rdi+0x75]
     5d3:	6c                   	ins    BYTE PTR es:[rdi],dx
     5d4:	64 6e                	outs   dx,BYTE PTR fs:[rsi]
     5d6:	27                   	(bad)  
     5d7:	74 20                	je     5f9 <.LC152+0x9>
     5d9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     5da:	70 65                	jo     641 <.LC157>
     5dc:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     5dd:	2e 0a 00             	or     al,BYTE PTR cs:[rax]

00000000000005e0 <.LC151>:
.LC151():
     5e0:	75 69                	jne    64b <.LC158+0x4>
     5e2:	5f                   	pop    rdi
     5e3:	72 65                	jb     64a <.LC158+0x3>
     5e5:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
     5e8:	64 53                	fs push rbx
     5ea:	50                   	push   rax
     5eb:	44                   	rex.R
     5ec:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     5ee:	6f                   	outs   dx,DWORD PTR ds:[rsi]
	...

00000000000005f0 <.LC152>:
.LC152():
     5f0:	4e 6f                	rex.WRX outs dx,DWORD PTR ds:[rsi]
     5f2:	74 20                	je     614 <.LC153+0x8>
     5f4:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     5f7:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     5f8:	65 63 74 65 64       	movsxd esi,DWORD PTR gs:[rbp+riz*2+0x64]
     5fd:	20 74 6f 20          	and    BYTE PTR [rdi+rbp*2+0x20],dh
     601:	61                   	(bad)  
     602:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
     605:	72 76                	jb     67d <.LC162>
     607:	65 72 2e             	gs jb  638 <.LC156+0x3>
     60a:	0a 00                	or     al,BYTE PTR [rax]

000000000000060c <.LC153>:
.LC153():
     60c:	25 34 69 3a 20       	and    eax,0x203a6934
     611:	25 73 0a 00        	and    eax,0x6c000a73

0000000000000615 <.LC154>:
.LC154():
     615:	6c                   	ins    BYTE PTR es:[rdi],dx
     616:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     617:	63 61 6c             	movsxd esp,DWORD PTR [rcx+0x6c]
     61a:	68 6f 73 74 00       	push   0x74736f

000000000000061f <.LC155>:
.LC155():
     61f:	75 69                	jne    68a <.LC165+0x2>
     621:	5f                   	pop    rdi
     622:	73 69                	jae    68d <.LC165+0x5>
     624:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     625:	67 6c                	ins    BYTE PTR es:[edi],dx
     627:	65 50                	gs push rax
     629:	6c                   	ins    BYTE PTR es:[rdi],dx
     62a:	61                   	(bad)  
     62b:	79 65                	jns    692 <.LC165+0xa>
     62d:	72 41                	jb     670 <.LC161+0xb>
     62f:	63 74 69 76          	movsxd esi,DWORD PTR [rcx+rbp*2+0x76]
     633:	65 00            	add    BYTE PTR gs:[rbx+0x6f],ah

0000000000000635 <.LC156>:
.LC156():
     635:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     638:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     639:	65 63 74 20 25       	movsxd esi,DWORD PTR gs:[rax+riz*1+0x25]
     63e:	73 0a                	jae    64a <.LC158+0x3>
	...

0000000000000641 <.LC157>:
.LC157():
     641:	6d                   	ins    DWORD PTR es:[rdi],dx
     642:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     643:	64 65 6c             	fs gs ins BYTE PTR es:[rdi],dx
	...

0000000000000647 <.LC158>:
.LC158():
     647:	68 65 61 64 6d       	push   0x6d646165
     64c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     64d:	64 65 6c             	fs gs ins BYTE PTR es:[rdi],dx
	...

0000000000000651 <.LC159>:
.LC159():
     651:	6d                   	ins    DWORD PTR es:[rdi],dx
     652:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     653:	64 65 6c             	fs gs ins BYTE PTR es:[rdi],dx
     656:	20 69 73             	and    BYTE PTR [rcx+0x73],ch
     659:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
     65c:	74 20                	je     67e <.LC162+0x1>
     65e:	74 6f                	je     6cf <.LC174+0x1>
     660:	20 25 73 0a 00     	and    BYTE PTR [rip+0x70000a73],ah        # 700010d9 <noGameRestart+0x6fff3e91>

0000000000000665 <.LC161>:
.LC161():
     665:	70 69                	jo     6d0 <.LC174+0x2>
     667:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     668:	67 20 74 69 6d       	and    BYTE PTR [ecx+ebp*2+0x6d],dh
     66d:	65 20 25 64 6d 73 20 	and    BYTE PTR gs:[rip+0x20736d64],ah        # 207373d8 <noGameRestart+0x2072a190>
     674:	66 72 6f             	data16 jb 6e6 <.LC176+0xb>
     677:	6d                   	ins    DWORD PTR es:[rdi],dx
     678:	20 25 73 0a 00     	and    BYTE PTR [rip+0x25000a73],ah        # 250010f1 <noGameRestart+0x24ff3ea9>

000000000000067d <.LC162>:
.LC162():
     67d:	25 64 00         	and    eax,0x73250064

0000000000000680 <.LC163>:
.LC163():
     680:	25 73 3a 20 25       	and    eax,0x25203a73
     685:	73 0a                	jae    691 <.LC165+0x9>
	...

0000000000000688 <.LC165>:
.LC165():
     688:	75 73                	jne    6fd <.LC182+0x3>
     68a:	61                   	(bad)  
     68b:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[eax]
     68f:	70 69                	jo     6fa <.LC182>
     691:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     692:	67 20 5b 2d          	and    BYTE PTR [ebx+0x2d],bl
     696:	34 7c                	xor    al,0x7c
     698:	2d 36 5d 20 3c       	sub    eax,0x3c205d36
     69d:	73 65                	jae    704 <.LC182+0xa>
     69f:	72 76                	jb     717 <.LC184+0x7>
     6a1:	65 72 3e             	gs jb  6e2 <.LC176+0x7>
     6a4:	0a 00                	or     al,BYTE PTR [rax]

00000000000006a6 <.LC166>:
.LC166():
     6a6:	2d 34 00         	sub    eax,0x362d0034

00000000000006a9 <.LC167>:
.LC167():
     6a9:	2d 36 00         	sub    eax,0x65670036

00000000000006ac <.LC169>:
.LC169():
     6ac:	67 65 74 69          	addr32 gs je 719 <.LC190+0x1>
     6b0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     6b1:	66 6f                	outs   dx,WORD PTR ds:[rsi]
     6b3:	20 78 78             	and    BYTE PTR [rax+0x78],bh
     6b6:	78 00                	js     6b8 <.LC171>

00000000000006b8 <.LC171>:
.LC171():
     6b8:	67 65 74 73          	addr32 gs je 72f <.LC191+0xc>
     6bc:	74 61                	je     71f <.LC190+0x7>
     6be:	74 75                	je     735 <.LC191+0x12>
     6c0:	73 00                	jae    6c2 <.LC172>

00000000000006c2 <.LC172>:
.LC172():
     6c2:	2e 61                	cs (bad) 
     6c4:	76 69                	jbe    72f <.LC191+0xc>
	...

00000000000006c7 <.LC173>:
.LC173():
     6c7:	76 69                	jbe    732 <.LC191+0xf>
     6c9:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
     6cc:	73 00                	jae    6ce <.LC174>

00000000000006ce <.LC174>:
.LC174():
     6ce:	2e 64 6d             	cs fs ins DWORD PTR es:[rdi],dx
     6d1:	5f                   	pop    rdi
     6d2:	25 64 00         	and    eax,0x65640064

00000000000006d5 <.LC175>:
.LC175():
     6d5:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
     6d8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     6d9:	73 00                	jae    6db <.LC176>

00000000000006db <.LC176>:
.LC176():
     6db:	72 63                	jb     740 <.LC192+0x1>
     6dd:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     6de:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     6df:	20 22                	and    BYTE PTR [rdx],ah
     6e1:	25 73 22 20 25       	and    eax,0x25202273
     6e6:	73 00                	jae    6e8 <.LC177>

00000000000006e8 <.LC177>:
.LC177():
     6e8:	72 63                	jb     74d <.LC194+0x3>
     6ea:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     6eb:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     6ec:	20 25 73 20 25 73    	and    BYTE PTR [rip+0x73252073],ah        # 73252765 <noGameRestart+0x7324551d>
	...

00000000000006f3 <.LC180>:
.LC180():
     6f3:	2e 64 6d             	cs fs ins DWORD PTR es:[rdi],dx
     6f6:	5f                   	pop    rdi
     6f7:	3f                   	(bad)  
     6f8:	3f                   	(bad)  
	...

00000000000006fa <.LC182>:
.LC182():
     6fa:	67 66 78 2f          	addr32 data16 js 72d <.LC191+0xa>
     6fe:	32 64 2f 62          	xor    ah,BYTE PTR [rdi+rbp*1+0x62]
     702:	69 67 63 68 61 72 73 	imul   esp,DWORD PTR [rdi+0x63],0x73726168
	...

000000000000070a <.LC183>:
.LC183():
     70a:	77 68                	ja     774 <.LC197+0x6>
     70c:	69 74 65 00    	imul   esi,DWORD PTR [rbp+riz*2+0x0],0x736e6f63
     713:	 

0000000000000710 <.LC184>:
.LC184():
     710:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     713:	73 6f                	jae    784 <.LC200+0x2>
     715:	6c                   	ins    BYTE PTR es:[rdi],dx
     716:	65 00            	add    BYTE PTR gs:[rbx+0x6c],ah

0000000000000718 <.LC190>:
.LC190():
     718:	63 6c 5f 6d          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x6d]
     71c:	61                   	(bad)  
     71d:	78 50                	js     76f <.LC197+0x1>
     71f:	69 6e 67 00    	imul   ebp,DWORD PTR [rsi+0x67],0x69335e00

0000000000000723 <.LC191>:
.LC191():
     723:	5e                   	pop    rsi
     724:	33 69 6e             	xor    ebp,DWORD PTR [rcx+0x6e]
     727:	76 61                	jbe    78a <.LC200+0x8>
     729:	6c                   	ins    BYTE PTR es:[rdi],dx
     72a:	69 64 20 66 69 6c 65 	imul   esp,DWORD PTR [rax+riz*1+0x66],0x20656c69
     731:	20 
     732:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     733:	61                   	(bad)  
     734:	6d                   	ins    DWORD PTR es:[rdi],dx
     735:	65 3a 20             	cmp    ah,BYTE PTR gs:[rax]
     738:	27                   	(bad)  
     739:	25 73 27 2e 0a       	and    eax,0xa2e2773
	...

000000000000073f <.LC192>:
.LC192():
     73f:	64 6c                	fs ins BYTE PTR es:[rdi],dx
     741:	6d                   	ins    DWORD PTR es:[rdi],dx
     742:	61                   	(bad)  
     743:	70 00                	jo     745 <.LC193>

0000000000000745 <.LC193>:
.LC193():
     745:	2e 70 6b             	cs jo  7b3 <.LC205+0x4>
     748:	33 00                	xor    eax,DWORD PTR [rax]

000000000000074a <.LC194>:
.LC194():
     74a:	6d                   	ins    DWORD PTR es:[rdi],dx
     74b:	61                   	(bad)  
     74c:	70 73                	jo     7c1 <.LC206+0x7>
     74e:	2f                   	(bad)  
     74f:	25 73 2e 62 73       	and    eax,0x73622e73
     754:	70 00                	jo     756 <.LC196>

0000000000000756 <.LC196>:
.LC196():
     756:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
     758:	69 65 6e 74 20 63 6f 	imul   esp,DWORD PTR [rbp+0x6e],0x6f632074
     75f:	6d                   	ins    DWORD PTR es:[rdi],dx
     760:	6d                   	ins    DWORD PTR es:[rdi],dx
     761:	61                   	(bad)  
     762:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     763:	64 20 6f 76          	and    BYTE PTR fs:[rdi+0x76],ch
     767:	65 72 66             	gs jb  7d0 <.LC210+0x4>
     76a:	6c                   	ins    BYTE PTR es:[rdi],dx
     76b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     76c:	77 00                	ja     76e <.LC197>

000000000000076e <.LC197>:
.LC197():
     76e:	63 70 20             	movsxd esi,DWORD PTR [rax+0x20]
     771:	25 64 20 00        	and    eax,0x75002064

0000000000000775 <.LC198>:
.LC198():
     775:	75 73                	jne    7ea <.LC213+0x4>
     777:	65 72 69             	gs jb  7e3 <.LC211+0xe>
     77a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     77b:	66 6f                	outs   dx,WORD PTR ds:[rsi]
	...

000000000000077e <.LC199>:
.LC199():
     77e:	76 64                	jbe    7e4 <.LC211+0xf>
     780:	72 00                	jb     782 <.LC200>

0000000000000782 <.LC200>:
.LC200():
     782:	6b 65 65 70          	imul   esp,DWORD PTR [rbp+0x65],0x70
     786:	5f                   	pop    rdi
     787:	77 69                	ja     7f2 <.LC213+0xc>
     789:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     78a:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
     78c:	77 00                	ja     78e <.LC201>

000000000000078e <.LC201>:
.LC201():
     78e:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
     790:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     791:	65 64 6c             	gs fs ins BYTE PTR es:[rdi],dx
	...

0000000000000795 <.LC202>:
.LC202():
     795:	63 61 6c             	movsxd esp,DWORD PTR [rcx+0x6c]
     798:	6c                   	ins    BYTE PTR es:[rdi],dx
     799:	76 6f                	jbe    80a <.LC217+0x2>
     79b:	74 65                	je     802 <.LC214+0x2>
	...

000000000000079e <.LC203>:
	...

000000000000079f <.LC204>:
.LC204():
     79f:	63 6c 5f 64          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x64]
     7a3:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     7a4:	77 6e                	ja     814 <.LC218+0x6>
     7a6:	6c                   	ins    BYTE PTR es:[rdi],dx
     7a7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     7a8:	61                   	(bad)  
     7a9:	64 4e 61             	fs rex.WRX (bad) 
     7ac:	6d                   	ins    DWORD PTR es:[rdi],dx
     7ad:	65 00          	add    BYTE PTR gs:[rcx+rbp*2+0x73],ah

00000000000007af <.LC205>:
.LC205():
     7af:	64 69 73 63 6f 6e 6e 	imul   esi,DWORD PTR fs:[rbx+0x63],0x656e6e6f
     7b6:	65 
     7b7:	63 74 00           	movsxd esi,DWORD PTR [rax+rax*1+0x73]

00000000000007ba <.LC206>:
.LC206():
     7ba:	73 76                	jae    832 <.LC219+0x9>
     7bc:	5f                   	pop    rdi
     7bd:	63 68 65             	movsxd ebp,DWORD PTR [rax+0x65]
     7c0:	61                   	(bad)  
     7c1:	74 73                	je     836 <.LC220+0x1>
	...

00000000000007c4 <.LC207>:
.LC207():
     7c4:	66 73 5f             	data16 jae 826 <.LC218+0x18>
     7c7:	67 61                	addr32 (bad) 
     7c9:	6d                   	ins    DWORD PTR es:[rdi],dx
     7ca:	65 00            	add    BYTE PTR gs:[rsi+0x65],ch

00000000000007cc <.LC210>:
.LC210():
     7cc:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     7cd:	65 78 74             	gs js  844 <.LC221+0x1>
     7d0:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
     7d3:	6f                   	outs   dx,DWORD PTR ds:[rsi]
	...

00000000000007d5 <.LC211>:
.LC211():
     7d5:	43                   	rex.XB
     7d6:	4c 5f                	rex.WR pop rdi
     7d8:	4e                   	rex.WRX
     7d9:	65 78 74             	gs js  850 <.LC221+0xd>
     7dc:	44                   	rex.R
     7dd:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     7df:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     7e0:	3a 20                	cmp    ah,BYTE PTR [rax]
     7e2:	25 73 0a 00        	and    eax,0x44000a73

00000000000007e6 <.LC213>:
.LC213():
     7e6:	44                   	rex.R
     7e7:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     7e9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     7ea:	20 66 69             	and    BYTE PTR [rsi+0x69],ah
     7ed:	6c                   	ins    BYTE PTR es:[rdi],dx
     7ee:	65 20 77 61          	and    BYTE PTR gs:[rdi+0x61],dh
     7f2:	73 20                	jae    814 <.LC218+0x6>
     7f4:	74 72                	je     868 <.LC223+0x1>
     7f6:	75 6e                	jne    866 <.LC222+0x10>
     7f8:	63 61 74             	movsxd esp,DWORD PTR [rcx+0x74]
     7fb:	65 64 2e 0a 00       	gs fs or al,BYTE PTR cs:[rax]

0000000000000800 <.LC214>:
.LC214():
     800:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     801:	65 78 74             	gs js  878 <.LC223+0x11>
     804:	6d                   	ins    DWORD PTR es:[rdi],dx
     805:	61                   	(bad)  
     806:	70 00                	jo     808 <.LC217>

0000000000000808 <.LC217>:
.LC217():
     808:	71 33                	jno    83d <.LC220+0x8>
     80a:	61                   	(bad)  
     80b:	3a 2f                	cmp    ch,BYTE PTR [rdi]
	...

000000000000080e <.LC218>:
.LC218():
     80e:	5e                   	pop    rsi
     80f:	33 42 61             	xor    eax,DWORD PTR [rdx+0x61]
     812:	64 20 73 65          	and    BYTE PTR fs:[rbx+0x65],dh
     816:	72 76                	jb     88e <.LC224+0xf>
     818:	65 72 20             	gs jb  83b <.LC220+0x6>
     81b:	61                   	(bad)  
     81c:	64 64 72 65          	fs fs jb 885 <.LC224+0x6>
     820:	73 73                	jae    895 <.LC226+0x5>
     822:	20 2d 20 25 73 0a    	and    BYTE PTR [rip+0xa732520],ch        # a732d48 <noGameRestart+0xa725b00>
	...

0000000000000829 <.LC219>:
.LC219():
     829:	53                   	push   rbx
     82a:	65 72 76             	gs jb  8a3 <.LC226+0x13>
     82d:	65 72 20             	gs jb  850 <.LC221+0xd>
     830:	71 75                	jno    8a7 <.LC228+0x1>
     832:	69 74 00     	imul   esi,DWORD PTR [rax+rax*1+0x73],0x696b5f76
     839:	 

0000000000000835 <.LC220>:
.LC220():
     835:	73 76                	jae    8ad <.LC228+0x7>
     837:	5f                   	pop    rdi
     838:	6b 69 6c 6c          	imul   ebp,DWORD PTR [rcx+0x6c],0x6c
     83c:	73 65                	jae    8a3 <.LC226+0x13>
     83e:	72 76                	jb     8b6 <.LC228+0x10>
     840:	65 72 00             	gs jb  843 <.LC221>

0000000000000843 <.LC221>:
.LC221():
     843:	25 73 20 72 65       	and    eax,0x65722073
     848:	73 6f                	jae    8b9 <.LC229+0x1>
     84a:	6c                   	ins    BYTE PTR es:[rdi],dx
     84b:	76 65                	jbe    8b2 <.LC228+0xc>
     84d:	64 20 74 6f 20       	and    BYTE PTR fs:[rdi+rbp*2+0x20],dh
     852:	25 73 0a 00        	and    eax,0x63000a73

0000000000000856 <.LC222>:
.LC222():
     856:	63 6c 5f 72          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x72]
     85a:	65 63 6f 6e          	movsxd ebp,DWORD PTR gs:[rdi+0x6e]
     85e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     85f:	65 63 74 41 72       	movsxd esi,DWORD PTR gs:[rcx+rax*2+0x72]
     864:	67 73 00             	addr32 jae 867 <.LC223>

0000000000000867 <.LC223>:
.LC223():
     867:	63 6c 5f 63          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x63]
     86b:	75 72                	jne    8df <.LC230+0xe>
     86d:	72 65                	jb     8d4 <.LC230+0x3>
     86f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     870:	74 53                	je     8c5 <.LC229+0xd>
     872:	65 72 76             	gs jb  8eb <.LC231+0x4>
     875:	65 72 41             	gs jb  8b9 <.LC229+0x1>
     878:	64 64 72 65          	fs fs jb 8e1 <.LC230+0x10>
     87c:	73 73                	jae    8f1 <.LC231+0xa>
	...

000000000000087f <.LC224>:
.LC224():
     87f:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
     882:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     883:	20 3c 64             	and    BYTE PTR [rsp+riz*2],bh
     886:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     888:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     889:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     88a:	61                   	(bad)  
     88b:	6d                   	ins    DWORD PTR es:[rdi],dx
     88c:	65 3e 0a 00          	gs or  al,BYTE PTR ds:[rax]

0000000000000890 <.LC226>:
.LC226():
     890:	5e                   	pop    rsi
     891:	33 63 6f             	xor    esp,DWORD PTR [rbx+0x6f]
     894:	75 6c                	jne    902 <.LC232+0xa>
     896:	64 6e                	outs   dx,BYTE PTR fs:[rsi]
     898:	27                   	(bad)  
     899:	74 20                	je     8bb <.LC229+0x3>
     89b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     89c:	70 65                	jo     903 <.LC232+0xb>
     89e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     89f:	20 25 73 0a 00     	and    BYTE PTR [rip+0x32000a73],ah        # 32001318 <noGameRestart+0x31ff40d0>

00000000000008a4 <.LC227>:
.LC227():
     8a4:	32 00                	xor    al,BYTE PTR [rax]

00000000000008a6 <.LC228>:
.LC228():
     8a6:	63 6f 75             	movsxd ebp,DWORD PTR [rdi+0x75]
     8a9:	6c                   	ins    BYTE PTR es:[rdi],dx
     8aa:	64 6e                	outs   dx,BYTE PTR fs:[rsi]
     8ac:	27                   	(bad)  
     8ad:	74 20                	je     8cf <.LC229+0x17>
     8af:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     8b0:	70 65                	jo     917 <.LC233+0x7>
     8b2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     8b3:	20 25 73 0a 00     	and    BYTE PTR [rip+0x44000a73],ah        # 4400132c <noGameRestart+0x43ff40e4>

00000000000008b8 <.LC229>:
.LC229():
     8b8:	44 69 73 63 6f 6e 6e 	imul   r14d,DWORD PTR [rbx+0x63],0x656e6e6f
     8bf:	65 
     8c0:	63 74 65 64          	movsxd esi,DWORD PTR [rbp+riz*2+0x64]
     8c4:	20 66 72             	and    BYTE PTR [rsi+0x72],ah
     8c7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     8c8:	6d                   	ins    DWORD PTR es:[rdi],dx
     8c9:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
     8cc:	72 76                	jb     944 <.LC244+0x1>
     8ce:	65 72 00             	gs jb  8d1 <.LC230>

00000000000008d1 <.LC230>:
.LC230():
     8d1:	44 69 73 63 6f 6e 6e 	imul   r14d,DWORD PTR [rbx+0x63],0x656e6e6f
     8d8:	65 
     8d9:	63 74 65 64          	movsxd esi,DWORD PTR [rbp+riz*2+0x64]
     8dd:	20 66 72             	and    BYTE PTR [rsi+0x72],ah
     8e0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     8e1:	6d                   	ins    DWORD PTR es:[rdi],dx
     8e2:	20 25 73 0a 00     	and    BYTE PTR [rip+0x63000a73],ah        # 6300135b <noGameRestart+0x62ff4113>

00000000000008e7 <.LC231>:
.LC231():
     8e7:	63 6f 6d             	movsxd ebp,DWORD PTR [rdi+0x6d]
     8ea:	5f                   	pop    rdi
     8eb:	65 72 72             	gs jb  960 <.LC246+0x1>
     8ee:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     8ef:	72 4d                	jb     93e <.LC243+0xc>
     8f1:	65 73 73             	gs jae 967 <.LC246+0x8>
     8f4:	61                   	(bad)  
     8f5:	67 65 00         	add    BYTE PTR gs:[ebp+0x6e],dl

00000000000008f8 <.LC232>:
.LC232():
     8f8:	55                   	push   rbp
     8f9:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     8fa:	6b 6e 6f 77          	imul   ebp,DWORD PTR [rsi+0x6f],0x77
     8fe:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     8ff:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
     902:	6d                   	ins    DWORD PTR es:[rdi],dx
     903:	6d                   	ins    DWORD PTR es:[rdi],dx
     904:	61                   	(bad)  
     905:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     906:	64 20 22             	and    BYTE PTR fs:[rdx],ah
     909:	25 73 5e 37 22       	and    eax,0x22375e73
     90e:	0a 00                	or     al,BYTE PTR [rax]

0000000000000910 <.LC233>:
.LC233():
     910:	66 73 5f             	data16 jae 972 <.LC247+0x2>
     913:	68 6f 6d 65 70       	push   0x70656d6f
     918:	61                   	(bad)  
     919:	74 68                	je     983 <.LC248+0x1>
	...

000000000000091c <.LC238>:
.LC238():
     91c:	25 73 2f 25 73       	and    eax,0x73252f73
	...

0000000000000922 <.LC242>:
.LC242():
     922:	63 6c 5f 64          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x64]
     926:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     927:	77 6e                	ja     997 <.LC253+0x3>
     929:	6c                   	ins    BYTE PTR es:[rdi],dx
     92a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     92b:	61                   	(bad)  
     92c:	64 53                	fs push rbx
     92e:	69 7a 65 00    	imul   edi,DWORD PTR [rdx+0x65],0x5f6c6300

0000000000000932 <.LC243>:
.LC243():
     932:	63 6c 5f 64          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x64]
     936:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     937:	77 6e                	ja     9a7 <.LC253+0x13>
     939:	6c                   	ins    BYTE PTR es:[rdi],dx
     93a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     93b:	61                   	(bad)  
     93c:	64 43 6f             	rex.XB outs dx,DWORD PTR fs:[rsi]
     93f:	75 6e                	jne    9af <.LC254+0x4>
     941:	74 00                	je     943 <.LC244>

0000000000000943 <.LC244>:
.LC244():
     943:	63 6c 5f 64          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x64]
     947:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     948:	77 6e                	ja     9b8 <.LC254+0xd>
     94a:	6c                   	ins    BYTE PTR es:[rdi],dx
     94b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     94c:	61                   	(bad)  
     94d:	64 54                	fs push rsp
     94f:	69 6d 65 00    	imul   ebp,DWORD PTR [rbp+0x65],0x776f6400

0000000000000953 <.LC245>:
.LC245():
     953:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
     955:	77 6e                	ja     9c5 <.LC260+0xa>
     957:	6c                   	ins    BYTE PTR es:[rdi],dx
     958:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     959:	61                   	(bad)  
     95a:	64 20 25 73 00   	and    BYTE PTR fs:[rip+0x73250073],ah        # 732509d4 <noGameRestart+0x7324378c>

000000000000095f <.LC246>:
.LC246():
     95f:	25 73 3a 20 52       	and    eax,0x52203a73
     964:	75 6e                	jne    9d4 <.LC261+0xc>
     966:	74 20                	je     988 <.LC248+0x6>
     968:	70 61                	jo     9cb <.LC261+0x3>
     96a:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
     96d:	74 0a                	je     979 <.LC247+0x9>
	...

0000000000000970 <.LC247>:
.LC247():
     970:	43                   	rex.XB
     971:	4c 20 70 61          	rex.WR and BYTE PTR [rax+0x61],r14b
     975:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
     978:	74 20                	je     99a <.LC253+0x6>
     97a:	25 73 3a 20 25       	and    eax,0x25203a73
     97f:	73 0a                	jae    98b <.LC248+0x9>
	...

0000000000000982 <.LC248>:
.LC248():
     982:	63 68 61             	movsxd ebp,DWORD PTR [rax+0x61]
     985:	6c                   	ins    BYTE PTR es:[rdi],dx
     986:	6c                   	ins    BYTE PTR es:[rdi],dx
     987:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
     989:	67 65 52             	addr32 gs push rdx
     98c:	65 73 70             	gs jae 9ff <.LC266+0x3>
     98f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     990:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     991:	73 65                	jae    9f8 <.LC265+0xa>
	...

0000000000000994 <.LC253>:
.LC253():
     994:	63 68 61             	movsxd ebp,DWORD PTR [rax+0x61]
     997:	6c                   	ins    BYTE PTR es:[rdi],dx
     998:	6c                   	ins    BYTE PTR es:[rdi],dx
     999:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
     99b:	67 65 52             	addr32 gs push rdx
     99e:	65 73 70             	gs jae a11 <.LC267+0xf>
     9a1:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     9a2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     9a3:	73 65                	jae    a0a <.LC267+0x8>
     9a5:	3a 20                	cmp    ah,BYTE PTR [rax]
     9a7:	25 64 0a 00        	and    eax,0x63000a64

00000000000009ab <.LC254>:
.LC254():
     9ab:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     9ae:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     9af:	65 63 74 52 65       	movsxd esi,DWORD PTR gs:[rdx+rdx*2+0x65]
     9b4:	73 70                	jae    a26 <.LC268+0x11>
     9b6:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     9b7:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     9b8:	73 65                	jae    a1f <.LC268+0xa>
	...

00000000000009bb <.LC260>:
.LC260():
     9bb:	69 6e 66 6f 52 65 73 	imul   ebp,DWORD PTR [rsi+0x66],0x7365526f
     9c2:	70 6f                	jo     a33 <.LC273+0x8>
     9c4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     9c5:	73 65                	jae    a2c <.LC273+0x1>
	...

00000000000009c8 <.LC261>:
.LC261():
     9c8:	73 74                	jae    a3e <.LC273+0x13>
     9ca:	61                   	(bad)  
     9cb:	74 75                	je     a42 <.LC273+0x17>
     9cd:	73 52                	jae    a21 <.LC268+0xc>
     9cf:	65 73 70             	gs jae a42 <.LC273+0x17>
     9d2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     9d3:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     9d4:	73 65                	jae    a3b <.LC273+0x10>
	...

00000000000009d7 <.LC262>:
.LC262():
     9d7:	65 63 68 6f          	movsxd ebp,DWORD PTR gs:[rax+0x6f]
	...

00000000000009dc <.LC263>:
.LC263():
     9dc:	6b 65 79 41          	imul   esp,DWORD PTR [rbp+0x79],0x41
     9e0:	75 74                	jne    a56 <.LC277+0x2>
     9e2:	68 6f 72 69 7a       	push   0x7a69726f
     9e7:	65 00            	add    BYTE PTR gs:[rbp+0x6f],ch

00000000000009e9 <.LC264>:
.LC264():
     9e9:	6d                   	ins    DWORD PTR es:[rdi],dx
     9ea:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     9eb:	74 64                	je     a51 <.LC274+0xd>
	...

00000000000009ee <.LC265>:
.LC265():
     9ee:	63 6c 5f 6d          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x6d]
     9f2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     9f3:	74 64                	je     a59 <.LC277+0x5>
     9f5:	53                   	push   rbx
     9f6:	74 72                	je     a6a <.LC279+0x8>
     9f8:	69 6e 67 00    	imul   ebp,DWORD PTR [rsi+0x67],0x69727000

00000000000009fc <.LC266>:
.LC266():
     9fc:	70 72                	jo     a70 <.LC279+0xe>
     9fe:	69 6e 74 00    	imul   ebp,DWORD PTR [rsi+0x74],0x74656700

0000000000000a02 <.LC267>:
.LC267():
     a02:	67 65 74 73          	addr32 gs je a79 <.LC279+0x17>
     a06:	65 72 76             	gs jb  a7f <.LC282>
     a09:	65 72 73             	gs jb  a7f <.LC282>
     a0c:	52                   	push   rdx
     a0d:	65 73 70             	gs jae a80 <.LC282+0x1>
     a10:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     a11:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     a12:	73 65                	jae    a79 <.LC279+0x17>
	...

0000000000000a15 <.LC268>:
.LC268():
     a15:	67 65 74 73          	addr32 gs je a8c <.LC283+0x2>
     a19:	65 72 76             	gs jb  a92 <.LC284>
     a1c:	65 72 73             	gs jb  a92 <.LC284>
     a1f:	45 78 74             	rex.RB js a96 <.LC285>
     a22:	52                   	push   rdx
     a23:	65 73 70             	gs jae a96 <.LC285>
     a26:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     a27:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     a28:	73 65                	jae    a8f <.LC283+0x5>
	...

0000000000000a2b <.LC273>:
.LC273():
     a2b:	25 30 34 64 25       	and    eax,0x25643430
     a30:	30 32                	xor    BYTE PTR [rdx],dh
     a32:	64 25 30 32 64 25    	fs and eax,0x25643230
     a38:	30 32                	xor    BYTE PTR [rdx],dh
     a3a:	64 25 30 32 64 25    	fs and eax,0x25643230
     a40:	30 32                	xor    BYTE PTR [rdx],dh
     a42:	64 00            	add    BYTE PTR fs:[rdx+0x65],dh

0000000000000a44 <.LC274>:
.LC274():
     a44:	72 65                	jb     aab <.LC287+0x8>
     a46:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
     a49:	64 20 25 73 2d 25 73 	and    BYTE PTR fs:[rip+0x73252d73],ah        # 732537c3 <noGameRestart+0x7324657b>
     a50:	2d 25 73 00        	sub    eax,0x75007325

0000000000000a54 <.LC277>:
.LC277():
     a54:	75 73                	jne    ac9 <.LC291+0x5>
     a56:	65 72 69             	gs jb  ac2 <.LC290+0x2>
     a59:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     a5a:	66 6f                	outs   dx,WORD PTR ds:[rsi]
     a5c:	20 22                	and    BYTE PTR [rdx],ah
     a5e:	25 73 22 00        	and    eax,0x53002273

0000000000000a62 <.LC279>:
.LC279():
     a62:	53                   	push   rbx
     a63:	65 72 76             	gs jb  adc <.LC292+0xd>
     a66:	65 72 20             	gs jb  a89 <.LC282+0xa>
     a69:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     a6c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     a6d:	65 63 74 69 6f       	movsxd esi,DWORD PTR gs:[rcx+rbp*2+0x6f]
     a72:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     a73:	20 74 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],dh
     a77:	65 64 20 6f 75       	gs and BYTE PTR fs:[rdi+0x75],ch
     a7c:	74 2e                	je     aac <.LC287+0x9>
	...

0000000000000a7f <.LC282>:
.LC282():
     a7f:	63 6c 5f 6e          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x6e]
     a83:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     a84:	70 72                	jo     af8 <.LC294+0xb>
     a86:	69 6e 74 00    	imul   ebp,DWORD PTR [rsi+0x74],0x5f6c6300

0000000000000a8a <.LC283>:
.LC283():
     a8a:	63 6c 5f 6d          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x6d]
     a8e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     a8f:	74 64                	je     af5 <.LC294+0x8>
	...

0000000000000a92 <.LC284>:
.LC284():
     a92:	32 30                	xor    dh,BYTE PTR [rax]
     a94:	30 00                	xor    BYTE PTR [rax],al

0000000000000a96 <.LC285>:
.LC285():
     a96:	63 6c 5f 74          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x74]
     a9a:	69 6d 65 6f 75 74 00 	imul   ebp,DWORD PTR [rbp+0x65],0x74756f

0000000000000aa1 <.LC286>:
.LC286():
     aa1:	35 00          	xor    eax,0x5f6c6300

0000000000000aa3 <.LC287>:
.LC287():
     aa3:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
     aa7:	75 74                	jne    b1d <.LC297+0xe>
     aa9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     aaa:	4e 75 64             	rex.WRX jne b11 <.LC297+0x2>
     aad:	67 65 00         	add    BYTE PTR gs:[ebx+0x6c],ah

0000000000000ab0 <.LC288>:
.LC288():
     ab0:	63 6c 5f 74          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x74]
     ab4:	69 6d 65 4e 75 64 67 	imul   ebp,DWORD PTR [rbp+0x65],0x6764754e
     abb:	65 00              	add    BYTE PTR gs:[rbx],dh

0000000000000abd <.LC289>:
.LC289():
     abd:	33 30                	xor    esi,DWORD PTR [rax]
	...

0000000000000ac0 <.LC290>:
.LC290():
     ac0:	2d 33 30 00        	sub    eax,0x63003033

0000000000000ac4 <.LC291>:
.LC291():
     ac4:	63 6c 5f 73          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x73]
     ac8:	68 6f 77 6e 65       	push   0x656e776f
     acd:	74 00                	je     acf <.LC292>

0000000000000acf <.LC292>:
.LC292():
     acf:	63 6c 5f 73          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x73]
     ad3:	68 6f 77 54 69       	push   0x6954776f
     ad8:	6d                   	ins    DWORD PTR es:[rdi],dx
     ad9:	65 44                	gs rex.R
     adb:	65 6c                	gs ins BYTE PTR es:[rdi],dx
     add:	74 61                	je     b40 <.LC300+0xb>
	...

0000000000000ae0 <.LC293>:
.LC293():
     ae0:	72 63                	jb     b45 <.LC302>
     ae2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     ae3:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     ae4:	50                   	push   rax
     ae5:	61                   	(bad)  
     ae6:	73 73                	jae    b5b <.LC303+0x5>
     ae8:	77 6f                	ja     b59 <.LC303+0x3>
     aea:	72 64                	jb     b50 <.LC302+0xb>
	...

0000000000000aed <.LC294>:
.LC294():
     aed:	61                   	(bad)  
     aee:	63 74 69 76          	movsxd esi,DWORD PTR [rcx+rbp*2+0x76]
     af2:	65 41 63 74 69 6f    	movsxd esi,DWORD PTR gs:[r9+rbp*2+0x6f]
     af8:	6e                   	outs   dx,BYTE PTR ds:[rsi]
	...

0000000000000afa <.LC295>:
.LC295():
     afa:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
     afe:	75 74                	jne    b74 <.LC305+0x1>
     b00:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b01:	52                   	push   rdx
     b02:	65 63 6f 72          	movsxd ebp,DWORD PTR gs:[rdi+0x72]
     b06:	64 44                	fs rex.R
     b08:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     b0a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
	...

0000000000000b0c <.LC296>:
.LC296():
     b0c:	32 35 00       	xor    dh,BYTE PTR [rip+0x5f6c6300]        # 5f6c6e12 <noGameRestart+0x5f6b9bca>

0000000000000b0f <.LC297>:
.LC297():
     b0f:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
     b13:	76 69                	jbe    b7e <.LC305+0xb>
     b15:	46 72 61             	rex.RX jb b79 <.LC305+0x6>
     b18:	6d                   	ins    DWORD PTR es:[rdi],dx
     b19:	65 52                	gs push rdx
     b1b:	61                   	(bad)  
     b1c:	74 65                	je     b83 <.LC305+0x10>
	...

0000000000000b1f <.LC298>:
.LC298():
     b1f:	31 30                	xor    DWORD PTR [rax],esi
     b21:	30 30                	xor    BYTE PTR [rax],dh
	...

0000000000000b24 <.LC299>:
.LC299():
     b24:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
     b28:	76 69                	jbe    b93 <.LC307>
     b2a:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     b2c:	74 69                	je     b97 <.LC307+0x4>
     b2e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b2f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     b30:	4a 70 65             	rex.WX jo b98 <.LC307+0x5>
     b33:	67 00            	add    BYTE PTR [ebx+0x6c],ah

0000000000000b35 <.LC300>:
.LC300():
     b35:	63 6c 5f 66          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x66]
     b39:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b3a:	72 63                	jb     b9f <.LC308+0x1>
     b3c:	65 61                	gs (bad) 
     b3e:	76 69                	jbe    ba9 <.LC308+0xb>
     b40:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
     b43:	6f                   	outs   dx,DWORD PTR ds:[rsi]
	...

0000000000000b45 <.LC302>:
.LC302():
     b45:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
     b49:	76 69                	jbe    bb4 <.LC309+0x8>
     b4b:	50                   	push   rax
     b4c:	69 70 65 46 6f 72 6d 	imul   esi,DWORD PTR [rax+0x65],0x6d726f46
     b53:	61                   	(bad)  
     b54:	74 00                	je     b56 <.LC303>

0000000000000b56 <.LC303>:
.LC303():
     b56:	72 63                	jb     bbb <.LC310+0x3>
     b58:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b59:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     b5a:	41                   	rex.B
     b5b:	64 64 72 65          	fs fs jb bc4 <.LC310+0xc>
     b5f:	73 73                	jae    bd4 <.LC313+0xa>
	...

0000000000000b62 <.LC304>:
.LC304():
     b62:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
     b66:	6c                   	ins    BYTE PTR es:[rdi],dx
     b67:	6c                   	ins    BYTE PTR es:[rdi],dx
     b68:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b69:	77 44                	ja     baf <.LC309+0x3>
     b6b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b6c:	77 6e                	ja     bdc <.LC313+0x12>
     b6e:	6c                   	ins    BYTE PTR es:[rdi],dx
     b6f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b70:	61                   	(bad)  
     b71:	64 00            	add    BYTE PTR fs:[rbx+0x6c],ah

0000000000000b73 <.LC305>:
.LC305():
     b73:	63 6c 5f 6d          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x6d]
     b77:	61                   	(bad)  
     b78:	70 41                	jo     bbb <.LC310+0x3>
     b7a:	75 74                	jne    bf0 <.LC314+0xc>
     b7c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b7d:	44 6f                	rex.R outs dx,DWORD PTR ds:[rsi]
     b7f:	77 6e                	ja     bef <.LC314+0xb>
     b81:	6c                   	ins    BYTE PTR es:[rdi],dx
     b82:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     b83:	61                   	(bad)  
     b84:	64 00          	add    BYTE PTR fs:[rcx+rbp*2+0x62],ch

0000000000000b86 <.LC306>:
.LC306():
     b86:	6c                   	ins    BYTE PTR es:[rdi],dx
     b87:	69 62 63 75 72 6c 2e 	imul   esp,DWORD PTR [rdx+0x63],0x2e6c7275
     b8e:	73 6f                	jae    bff <.LC316+0x9>
     b90:	2e 34 00             	cs xor al,0x0

0000000000000b93 <.LC307>:
.LC307():
     b93:	63 6c 5f 63          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x63]
     b97:	55                   	push   rbp
     b98:	52                   	push   rdx
     b99:	4c                   	rex.WR
     b9a:	4c 69 62 00    	imul   r12,QWORD PTR [rdx+0x0],0x635f6c63
     ba1:	 

0000000000000b9e <.LC308>:
.LC308():
     b9e:	63 6c 5f 63          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x63]
     ba2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     ba3:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     ba4:	58                   	pop    rax
     ba5:	4f                   	rex.WRXB
     ba6:	66 66 73 65          	data16 data16 jae c0f <.LC317+0x6>
     baa:	74 00                	je     bac <.LC309>

0000000000000bac <.LC309>:
.LC309():
     bac:	63 6c 5f 63          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x63]
     bb0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     bb1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     bb2:	43 6f                	rex.XB outs dx,DWORD PTR ds:[rsi]
     bb4:	6c                   	ins    BYTE PTR es:[rdi],dx
     bb5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     bb6:	72 00                	jb     bb8 <.LC310>

0000000000000bb8 <.LC310>:
.LC310():
     bb8:	72 5f                	jb     c19 <.LC317+0x10>
     bba:	69 6e 47 61 6d 65 56 	imul   ebp,DWORD PTR [rsi+0x47],0x56656d61
     bc1:	69 64 65 6f 00   	imul   esp,DWORD PTR [rbp+riz*2+0x6f],0x30353700
     bc8:	 

0000000000000bc6 <.LC312>:
.LC312():
     bc6:	37                   	(bad)  
     bc7:	35 30 00         	xor    eax,0x6c630030

0000000000000bca <.LC313>:
.LC313():
     bca:	63 6c 5f 73          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x73]
     bce:	65 72 76             	gs jb  c47 <.LC324+0x1>
     bd1:	65 72 53             	gs jb  c27 <.LC320+0x3>
     bd4:	74 61                	je     c37 <.LC322+0x4>
     bd6:	74 75                	je     c4d <.LC325+0x1>
     bd8:	73 52                	jae    c2c <.LC320+0x8>
     bda:	65 73 65             	gs jae c42 <.LC323+0x1>
     bdd:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     bde:	64 54                	fs push rsp
     be0:	69 6d 65 00    	imul   ebp,DWORD PTR [rbp+0x65],0x5f676300

0000000000000be4 <.LC314>:
.LC314():
     be4:	63 67 5f             	movsxd esp,DWORD PTR [rdi+0x5f]
     be7:	61                   	(bad)  
     be8:	75 74                	jne    c5e <.LC328+0x4>
     bea:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     beb:	73 77                	jae    c64 <.LC329+0x4>
     bed:	69 74 63 68 00   	imul   esi,DWORD PTR [rbx+riz*2+0x68],0x30303800
     bf4:	 

0000000000000bf2 <.LC315>:
.LC315():
     bf2:	38 30                	cmp    BYTE PTR [rax],dh
     bf4:	30 00                	xor    BYTE PTR [rax],al

0000000000000bf6 <.LC316>:
.LC316():
     bf6:	63 6c 5f 6c          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x6c]
     bfa:	61                   	(bad)  
     bfb:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     bfc:	46 6f                	rex.RX outs dx,DWORD PTR ds:[rsi]
     bfe:	72 63                	jb     c63 <.LC329+0x3>
     c00:	65 50                	gs push rax
     c02:	61                   	(bad)  
     c03:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
     c06:	74 73                	je     c7b <.LC331+0x1>
	...

0000000000000c09 <.LC317>:
.LC317():
     c09:	63 6c 5f 67          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x67]
     c0d:	75 69                	jne    c78 <.LC330+0xd>
     c0f:	64 53                	fs push rbx
     c11:	65 72 76             	gs jb  c8a <.LC333+0x2>
     c14:	65 72 55             	gs jb  c6c <.LC330+0x1>
     c17:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     c18:	69 71 00     	imul   esi,DWORD PTR [rcx+0x0],0x645f6c63

0000000000000c1b <.LC319>:
.LC319():
     c1b:	63 6c 5f 64          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x64]
     c1f:	6c                   	ins    BYTE PTR es:[rdi],dx
     c20:	55                   	push   rbp
     c21:	52                   	push   rdx
     c22:	4c 00            	rex.WR add BYTE PTR [rbx+0x6c],r12b

0000000000000c24 <.LC320>:
.LC320():
     c24:	63 6c 5f 64          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x64]
     c28:	6c                   	ins    BYTE PTR es:[rdi],dx
     c29:	44 69 72 65 63 74 6f 	imul   r14d,DWORD PTR [rdx+0x65],0x726f7463
     c30:	72 
     c31:	79 00                	jns    c33 <.LC322>

0000000000000c33 <.LC322>:
.LC322():
     c33:	55                   	push   rbp
     c34:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     c35:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     c36:	61                   	(bad)  
     c37:	6d                   	ins    DWORD PTR es:[rdi],dx
     c38:	65 64 50             	gs fs push rax
     c3b:	6c                   	ins    BYTE PTR es:[rdi],dx
     c3c:	61                   	(bad)  
     c3d:	79 65                	jns    ca4 <.LC337+0x6>
     c3f:	72 00                	jb     c41 <.LC323>

0000000000000c41 <.LC323>:
.LC323():
     c41:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     c42:	61                   	(bad)  
     c43:	6d                   	ins    DWORD PTR es:[rdi],dx
     c44:	65 00              	add    BYTE PTR gs:[rdx],dh

0000000000000c46 <.LC324>:
.LC324():
     c46:	32 35 30 30 30 00    	xor    dh,BYTE PTR [rip+0x303030]        # 303c7c <noGameRestart+0x2f6a34>

0000000000000c4c <.LC325>:
.LC325():
     c4c:	72 61                	jb     caf <.LC338+0x8>
     c4e:	74 65                	je     cb5 <.LC338+0xe>
	...

0000000000000c51 <.LC326>:
.LC326():
     c51:	34 30                	xor    al,0x30
	...

0000000000000c54 <.LC327>:
.LC327():
     c54:	73 6e                	jae    cc4 <.LC340+0x1>
     c56:	61                   	(bad)  
     c57:	70 73                	jo     ccc <.LC340+0x9>
	...

0000000000000c5a <.LC328>:
.LC328():
     c5a:	73 61                	jae    cbd <.LC339+0x6>
     c5c:	72 67                	jb     cc5 <.LC340+0x2>
     c5e:	65 00          	add    BYTE PTR gs:[rbp+riz*2+0x61],dh

0000000000000c60 <.LC329>:
.LC329():
     c60:	74 65                	je     cc7 <.LC340+0x4>
     c62:	61                   	(bad)  
     c63:	6d                   	ins    DWORD PTR es:[rdi],dx
     c64:	5f                   	pop    rdi
     c65:	6d                   	ins    DWORD PTR es:[rdi],dx
     c66:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     c67:	64 65 6c             	fs gs ins BYTE PTR es:[rdi],dx
	...

0000000000000c6b <.LC330>:
.LC330():
     c6b:	74 65                	je     cd2 <.LC340+0xf>
     c6d:	61                   	(bad)  
     c6e:	6d                   	ins    DWORD PTR es:[rdi],dx
     c6f:	5f                   	pop    rdi
     c70:	68 65 61 64 6d       	push   0x6d646165
     c75:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     c76:	64 65 6c             	fs gs ins BYTE PTR es:[rdi],dx
	...

0000000000000c7a <.LC331>:
.LC331():
     c7a:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
     c7d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     c7e:	72 31                	jb     cb1 <.LC338+0xa>
	...

0000000000000c81 <.LC332>:
.LC332():
     c81:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
     c84:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     c85:	72 32                	jb     cb9 <.LC339+0x2>
	...

0000000000000c88 <.LC333>:
.LC333():
     c88:	31 30                	xor    DWORD PTR [rax],esi
     c8a:	30 00                	xor    BYTE PTR [rax],al

0000000000000c8c <.LC334>:
.LC334():
     c8c:	68 61 6e 64 69       	push   0x69646e61
     c91:	63 61 70             	movsxd esp,DWORD PTR [rcx+0x70]
	...

0000000000000c95 <.LC335>:
.LC335():
     c95:	6d                   	ins    DWORD PTR es:[rdi],dx
     c96:	61                   	(bad)  
     c97:	6c                   	ins    BYTE PTR es:[rdi],dx
     c98:	65 00            	add    BYTE PTR gs:[rbx+0x65],dh

0000000000000c9a <.LC336>:
.LC336():
     c9a:	73 65                	jae    d01 <.LC345+0x1>
     c9c:	78 00                	js     c9e <.LC337>

0000000000000c9e <.LC337>:
.LC337():
     c9e:	70 61                	jo     d01 <.LC345+0x1>
     ca0:	73 73                	jae    d15 <.LC347+0x2>
     ca2:	77 6f                	ja     d13 <.LC347>
     ca4:	72 64                	jb     d0a <.LC345+0xa>
	...

0000000000000ca7 <.LC338>:
.LC338():
     ca7:	63 67 5f             	movsxd esp,DWORD PTR [rdi+0x5f]
     caa:	70 72                	jo     d1e <.LC348+0x6>
     cac:	65 64 69 63 74 49 74 	gs imul esp,DWORD PTR fs:[rbx+0x74],0x6d657449
     cb3:	65 6d 
     cb5:	73 00                	jae    cb7 <.LC339>

0000000000000cb7 <.LC339>:
.LC339():
     cb7:	63 67 5f             	movsxd esp,DWORD PTR [rdi+0x5f]
     cba:	76 69                	jbe    d25 <.LC349+0x3>
     cbc:	65 77 73             	gs ja  d32 <.LC350+0x5>
     cbf:	69 7a 65 00    	imul   edi,DWORD PTR [rdx+0x65],0x5f676300

0000000000000cc3 <.LC340>:
.LC340():
     cc3:	63 67 5f             	movsxd esp,DWORD PTR [rdi+0x5f]
     cc6:	73 74                	jae    d3c <.LC351+0x7>
     cc8:	65 72 65             	gs jb  d30 <.LC350+0x3>
     ccb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     ccc:	53                   	push   rbx
     ccd:	65 70 61             	gs jo  d31 <.LC350+0x4>
     cd0:	72 61                	jb     d33 <.LC350+0x6>
     cd2:	74 69                	je     d3d <.LC351+0x8>
     cd4:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     cd5:	6e                   	outs   dx,BYTE PTR ds:[rsi]
	...

0000000000000cd7 <.LC341>:
.LC341():
     cd7:	63 6d 64             	movsxd ebp,DWORD PTR [rbp+0x64]
	...

0000000000000cdb <.LC342>:
.LC342():
     cdb:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     cde:	66 69 67 73 74 72    	imul   sp,WORD PTR [rdi+0x73],0x7274
     ce4:	69 6e 67 73 00   	imul   ebp,DWORD PTR [rsi+0x67],0x6c630073

0000000000000ce9 <.LC343>:
.LC343():
     ce9:	63 6c 69 65          	movsxd ebp,DWORD PTR [rcx+rbp*2+0x65]
     ced:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     cee:	74 69                	je     d59 <.LC353+0xd>
     cf0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     cf1:	66 6f                	outs   dx,WORD PTR ds:[rsi]
	...

0000000000000cf4 <.LC344>:
.LC344():
     cf4:	73 6e                	jae    d64 <.LC356>
     cf6:	64 5f                	fs pop rdi
     cf8:	72 65                	jb     d5f <.LC355>
     cfa:	73 74                	jae    d70 <.LC356+0xc>
     cfc:	61                   	(bad)  
     cfd:	72 74                	jb     d73 <.LC357+0x2>
	...

0000000000000d00 <.LC345>:
.LC345():
     d00:	76 69                	jbe    d6b <.LC356+0x7>
     d02:	64 5f                	fs pop rdi
     d04:	72 65                	jb     d6b <.LC356+0x7>
     d06:	73 74                	jae    d7c <.LC358+0x4>
     d08:	61                   	(bad)  
     d09:	72 74                	jb     d7f <.LC358+0x7>
	...

0000000000000d0c <.LC346>:
.LC346():
     d0c:	72 65                	jb     d73 <.LC357+0x2>
     d0e:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
     d11:	64 00          	add    BYTE PTR fs:[rbp+riz*2+0x6d],ah

0000000000000d13 <.LC347>:
.LC347():
     d13:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
     d16:	6f                   	outs   dx,DWORD PTR ds:[rsi]
	...

0000000000000d18 <.LC348>:
.LC348():
     d18:	63 69 6e             	movsxd ebp,DWORD PTR [rcx+0x6e]
     d1b:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     d1d:	61                   	(bad)  
     d1e:	74 69                	je     d89 <.LC359+0x3>
     d20:	63 00                	movsxd eax,DWORD PTR [rax]

0000000000000d22 <.LC349>:
.LC349():
     d22:	73 74                	jae    d98 <.LC360>
     d24:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     d25:	70 72                	jo     d99 <.LC360+0x1>
     d27:	65 63 6f 72          	movsxd ebp,DWORD PTR gs:[rdi+0x72]
     d2b:	64 00            	add    BYTE PTR fs:[rbx+0x6f],ah

0000000000000d2d <.LC350>:
.LC350():
     d2d:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     d30:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     d31:	65 63 74 00        	movsxd esi,DWORD PTR gs:[rax+rax*1+0x72]

0000000000000d35 <.LC351>:
.LC351():
     d35:	72 65                	jb     d9c <.LC360+0x4>
     d37:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
     d3a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     d3b:	65 63 74 00        	movsxd esi,DWORD PTR gs:[rax+rax*1+0x6c]

0000000000000d3f <.LC352>:
.LC352():
     d3f:	6c                   	ins    BYTE PTR es:[rdi],dx
     d40:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     d41:	63 61 6c             	movsxd esp,DWORD PTR [rcx+0x6c]
     d44:	73 65                	jae    dab <.LC362+0x3>
     d46:	72 76                	jb     dbe <.LC364>
     d48:	65 72 73             	gs jb  dbe <.LC364>
	...

0000000000000d4c <.LC353>:
.LC353():
     d4c:	67 6c                	ins    BYTE PTR es:[edi],dx
     d4e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     d4f:	62 61 6c 73 65       	(bad)  {k3}
     d54:	72 76                	jb     dcc <.LC365+0x5>
     d56:	65 72 73             	gs jb  dcc <.LC365+0x5>
	...

0000000000000d5a <.LC354>:
.LC354():
     d5a:	72 63                	jb     dbf <.LC364+0x1>
     d5c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     d5d:	6e                   	outs   dx,BYTE PTR ds:[rsi]
	...

0000000000000d5f <.LC355>:
.LC355():
     d5f:	70 69                	jo     dca <.LC365+0x3>
     d61:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     d62:	67 00            	add    BYTE PTR [ebx+0x65],dh

0000000000000d64 <.LC356>:
.LC356():
     d64:	73 65                	jae    dcb <.LC365+0x4>
     d66:	72 76                	jb     dde <.LC370+0x3>
     d68:	65 72 73             	gs jb  dde <.LC370+0x3>
     d6b:	74 61                	je     dce <.LC365+0x7>
     d6d:	74 75                	je     de4 <.LC370+0x9>
     d6f:	73 00                	jae    d71 <.LC357>

0000000000000d71 <.LC357>:
.LC357():
     d71:	73 68                	jae    ddb <.LC370>
     d73:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     d74:	77 69                	ja     ddf <.LC370+0x4>
     d76:	70 00                	jo     d78 <.LC358>

0000000000000d78 <.LC358>:
.LC358():
     d78:	66 73 5f             	data16 jae dda <.LC366+0xa>
     d7b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     d7c:	70 65                	jo     de3 <.LC370+0x8>
     d7e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     d7f:	65 64 4c 69 73 74 00 	gs imul r14,QWORD PTR fs:[rbx+0x74],0x5f736600
     d86:	   

0000000000000d86 <.LC359>:
.LC359():
     d86:	66 73 5f             	data16 jae de8 <.LC370+0xd>
     d89:	72 65                	jb     df0 <.LC370+0x15>
     d8b:	66 65 72 65          	data16 gs jb df4 <.LC371>
     d8f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     d90:	63 65 64             	movsxd esp,DWORD PTR [rbp+0x64]
     d93:	4c 69 73 74 00   	imul   r14,QWORD PTR [rbx+0x74],0x64697600
     d9a:	 

0000000000000d98 <.LC360>:
.LC360():
     d98:	76 69                	jbe    e03 <.LC371+0xf>
     d9a:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
	...

0000000000000d9e <.LC361>:
.LC361():
     d9e:	73 74                	jae    e14 <.LC373+0x4>
     da0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     da1:	70 76                	jo     e19 <.LC373+0x9>
     da3:	69 64 65 6f 00   	imul   esp,DWORD PTR [rbp+riz*2+0x6f],0x72657300
     daa:	 

0000000000000da8 <.LC362>:
.LC362():
     da8:	73 65                	jae    e0f <.LC371+0x1b>
     daa:	72 76                	jb     e22 <.LC374+0x3>
     dac:	65 72 69             	gs jb  e18 <.LC373+0x8>
     daf:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     db0:	66 6f                	outs   dx,WORD PTR ds:[rsi]
	...

0000000000000db3 <.LC363>:
.LC363():
     db3:	73 79                	jae    e2e <.LC374+0xf>
     db5:	73 74                	jae    e2b <.LC374+0xc>
     db7:	65 6d                	gs ins DWORD PTR es:[rdi],dx
     db9:	69 6e 66 6f 00   	imul   ebp,DWORD PTR [rsi+0x66],0x6f64006f

0000000000000dbe <.LC364>:
.LC364():
     dbe:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
     dc0:	77 6e                	ja     e30 <.LC374+0x11>
     dc2:	6c                   	ins    BYTE PTR es:[rdi],dx
     dc3:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     dc4:	61                   	(bad)  
     dc5:	64 00            	add    BYTE PTR fs:[rbp+0x6f],ch

0000000000000dc7 <.LC365>:
.LC365():
     dc7:	6d                   	ins    DWORD PTR es:[rdi],dx
     dc8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     dc9:	64 65 6c             	fs gs ins BYTE PTR es:[rdi],dx
     dcc:	69 73 74 00    	imul   esi,DWORD PTR [rbx+0x74],0x5f6c6300

0000000000000dd0 <.LC366>:
.LC366():
     dd0:	63 6c 5f 72          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x72]
     dd4:	75 6e                	jne    e44 <.LC375+0x10>
     dd6:	6e                   	outs   dx,BYTE PTR ds:[rsi]
     dd7:	69 6e 67 00    	imul   ebp,DWORD PTR [rsi+0x67],0x2d2d2d00

0000000000000ddb <.LC370>:
.LC370():
     ddb:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
     de0:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
     de5:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
     dea:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
     def:	2d 2d 2d 0a 00       	sub    eax,0xa2d2d

0000000000000df4 <.LC371>:
.LC371():
     df4:	5e                   	pop    rsi
     df5:	33 63 6c             	xor    esp,DWORD PTR [rbx+0x6c]
     df8:	5f                   	pop    rdi
     df9:	64 6c                	fs ins BYTE PTR es:[rdi],dx
     dfb:	55                   	push   rbp
     dfc:	52                   	push   rdx
     dfd:	4c 20 63 76          	rex.WR and BYTE PTR [rbx+0x76],r12b
     e01:	61                   	(bad)  
     e02:	72 20                	jb     e24 <.LC374+0x5>
     e04:	69 73 20 6e 6f 74 20 	imul   esi,DWORD PTR [rbx+0x20],0x20746f6e
     e0b:	73 65                	jae    e72 <.LC375+0x3e>
     e0d:	74 0a                	je     e19 <.LC373+0x9>
	...

0000000000000e10 <.LC373>:
.LC373():
     e10:	4e                   	rex.WRX
     e11:	65 65 64 20 70 61    	gs gs and BYTE PTR fs:[rax+0x61],dh
     e17:	6b 73 3a 20          	imul   esi,DWORD PTR [rbx+0x3a],0x20
     e1b:	25 73 0a 00        	and    eax,0x75000a73

0000000000000e1f <.LC374>:
.LC374():
     e1f:	75 73                	jne    e94 <.LC375+0x60>
     e21:	61                   	(bad)  
     e22:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[eax]
     e26:	25 73 20 3c 6d       	and    eax,0x6d3c2073
     e2b:	61                   	(bad)  
     e2c:	70 6e                	jo     e9c <.LC375+0x68>
     e2e:	61                   	(bad)  
     e2f:	6d                   	ins    DWORD PTR es:[rdi],dx
     e30:	65 3e 0a 00          	gs or  al,BYTE PTR ds:[rax]

0000000000000e34 <.LC375>:
.LC375():
     e34:	2d 00 4d 6f 64       	sub    eax,0x646f4d00
     e39:	65 20 20             	and    BYTE PTR gs:[rax],ah
     e3c:	31 3a                	xor    DWORD PTR [rdx],edi
     e3e:	20 34 30             	and    BYTE PTR [rax+rsi*1],dh
     e41:	30 78 33             	xor    BYTE PTR [rax+0x33],bh
     e44:	30 30                	xor    BYTE PTR [rax],dh
     e46:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     e49:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     e4d:	32 3a                	xor    bh,BYTE PTR [rdx]
     e4f:	20 35 31 32 78 33    	and    BYTE PTR [rip+0x33783231],dh        # 33784086 <noGameRestart+0x33776e3e>
     e55:	38 34 00             	cmp    BYTE PTR [rax+rax*1],dh
     e58:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     e5a:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     e5e:	33 3a                	xor    edi,DWORD PTR [rdx]
     e60:	20 36                	and    BYTE PTR [rsi],dh
     e62:	34 30                	xor    al,0x30
     e64:	78 34                	js     e9a <.LC375+0x66>
     e66:	38 30                	cmp    BYTE PTR [rax],dh
     e68:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     e6b:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     e6f:	34 3a                	xor    al,0x3a
     e71:	20 38                	and    BYTE PTR [rax],bh
     e73:	30 30                	xor    BYTE PTR [rax],dh
     e75:	78 36                	js     ead <.LC375+0x79>
     e77:	30 30                	xor    BYTE PTR [rax],dh
     e79:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     e7c:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     e80:	35 3a 20 39 36       	xor    eax,0x3639203a
     e85:	30 78 37             	xor    BYTE PTR [rax+0x37],bh
     e88:	32 30                	xor    dh,BYTE PTR [rax]
     e8a:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     e8d:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     e91:	36 3a 20             	cmp    ah,BYTE PTR ss:[rax]
     e94:	31 30                	xor    DWORD PTR [rax],esi
     e96:	32 34 78             	xor    dh,BYTE PTR [rax+rdi*2]
     e99:	37                   	(bad)  
     e9a:	36 38 00             	cmp    BYTE PTR ss:[rax],al
     e9d:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     e9f:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     ea3:	37                   	(bad)  
     ea4:	3a 20                	cmp    ah,BYTE PTR [rax]
     ea6:	31 31                	xor    DWORD PTR [rcx],esi
     ea8:	35 32 78 38 36       	xor    eax,0x36387832
     ead:	34 00                	xor    al,0x0
     eaf:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     eb1:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     eb5:	38 3a                	cmp    BYTE PTR [rdx],bh
     eb7:	20 31                	and    BYTE PTR [rcx],dh
     eb9:	32 38                	xor    bh,BYTE PTR [rax]
     ebb:	30 78 31             	xor    BYTE PTR [rax+0x31],bh
     ebe:	30 32                	xor    BYTE PTR [rdx],dh
     ec0:	34 20                	xor    al,0x20
     ec2:	28 35 3a 34 29 00    	sub    BYTE PTR [rip+0x29343a],dh        # 294302 <noGameRestart+0x2870ba>
     ec8:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     eca:	64 65 20 20          	fs and BYTE PTR gs:[rax],ah
     ece:	39 3a                	cmp    DWORD PTR [rdx],edi
     ed0:	20 31                	and    BYTE PTR [rcx],dh
     ed2:	36 30 30             	xor    BYTE PTR ss:[rax],dh
     ed5:	78 31                	js     f08 <.LC375+0xd4>
     ed7:	32 30                	xor    dh,BYTE PTR [rax]
     ed9:	30 00                	xor    BYTE PTR [rax],al
     edb:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     edd:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     ee1:	30 3a                	xor    BYTE PTR [rdx],bh
     ee3:	20 32                	and    BYTE PTR [rdx],dh
     ee5:	30 34 38             	xor    BYTE PTR [rax+rdi*1],dh
     ee8:	78 31                	js     f1b <.LC375+0xe7>
     eea:	35 33 36 00 4d       	xor    eax,0x4d003633
     eef:	6f                   	outs   dx,DWORD PTR ds:[rsi]
     ef0:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     ef4:	31 3a                	xor    DWORD PTR [rdx],edi
     ef6:	20 38                	and    BYTE PTR [rax],bh
     ef8:	35 36 78 34 38       	xor    eax,0x38347836
     efd:	30 20                	xor    BYTE PTR [rax],ah
     eff:	28 77 69             	sub    BYTE PTR [rdi+0x69],dh
     f02:	64 65 29 00          	fs sub DWORD PTR gs:[rax],eax
     f06:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     f08:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     f0c:	32 3a                	xor    bh,BYTE PTR [rdx]
     f0e:	20 31                	and    BYTE PTR [rcx],dh
     f10:	32 38                	xor    bh,BYTE PTR [rax]
     f12:	30 78 39             	xor    BYTE PTR [rax+0x39],bh
     f15:	36 30 00             	xor    BYTE PTR ss:[rax],al
     f18:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     f1a:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     f1e:	33 3a                	xor    edi,DWORD PTR [rdx]
     f20:	20 31                	and    BYTE PTR [rcx],dh
     f22:	32 38                	xor    bh,BYTE PTR [rax]
     f24:	30 78 37             	xor    BYTE PTR [rax+0x37],bh
     f27:	32 30                	xor    dh,BYTE PTR [rax]
     f29:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     f2c:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     f30:	34 3a                	xor    al,0x3a
     f32:	20 31                	and    BYTE PTR [rcx],dh
     f34:	32 38                	xor    bh,BYTE PTR [rax]
     f36:	30 78 38             	xor    BYTE PTR [rax+0x38],bh
     f39:	30 30                	xor    BYTE PTR [rax],dh
     f3b:	20 28                	and    BYTE PTR [rax],ch
     f3d:	31 36                	xor    DWORD PTR [rsi],esi
     f3f:	3a 31                	cmp    dh,BYTE PTR [rcx]
     f41:	30 29                	xor    BYTE PTR [rcx],ch
     f43:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     f46:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     f4a:	35 3a 20 31 33       	xor    eax,0x3331203a
     f4f:	36 36 78 37          	ss ss js f8a <.LC375+0x156>
     f53:	36 38 00             	cmp    BYTE PTR ss:[rax],al
     f56:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     f58:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     f5c:	36 3a 20             	cmp    ah,BYTE PTR ss:[rax]
     f5f:	31 34 34             	xor    DWORD PTR [rsp+rsi*1],esi
     f62:	30 78 39             	xor    BYTE PTR [rax+0x39],bh
     f65:	30 30                	xor    BYTE PTR [rax],dh
     f67:	20 28                	and    BYTE PTR [rax],ch
     f69:	31 36                	xor    DWORD PTR [rsi],esi
     f6b:	3a 31                	cmp    dh,BYTE PTR [rcx]
     f6d:	30 29                	xor    BYTE PTR [rcx],ch
     f6f:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     f72:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     f76:	37                   	(bad)  
     f77:	3a 20                	cmp    ah,BYTE PTR [rax]
     f79:	31 36                	xor    DWORD PTR [rsi],esi
     f7b:	30 30                	xor    BYTE PTR [rax],dh
     f7d:	78 39                	js     fb8 <.LC375+0x184>
     f7f:	30 30                	xor    BYTE PTR [rax],dh
     f81:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     f84:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     f88:	38 3a                	cmp    BYTE PTR [rdx],bh
     f8a:	20 31                	and    BYTE PTR [rcx],dh
     f8c:	36 38 30             	cmp    BYTE PTR ss:[rax],dh
     f8f:	78 31                	js     fc2 <.LC375+0x18e>
     f91:	30 35 30 20 28 31    	xor    BYTE PTR [rip+0x31282030],dh        # 31282fc7 <noGameRestart+0x31275d7f>
     f97:	36 3a 31             	cmp    dh,BYTE PTR ss:[rcx]
     f9a:	30 29                	xor    BYTE PTR [rcx],ch
     f9c:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     f9f:	64 65 20 31          	fs and BYTE PTR gs:[rcx],dh
     fa3:	39 3a                	cmp    DWORD PTR [rdx],edi
     fa5:	20 31                	and    BYTE PTR [rcx],dh
     fa7:	39 32                	cmp    DWORD PTR [rdx],esi
     fa9:	30 78 31             	xor    BYTE PTR [rax+0x31],bh
     fac:	30 38                	xor    BYTE PTR [rax],bh
     fae:	30 00                	xor    BYTE PTR [rax],al
     fb0:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
     fb2:	64 65 20 32          	fs and BYTE PTR gs:[rdx],dh
     fb6:	30 3a                	xor    BYTE PTR [rdx],bh
     fb8:	20 31                	and    BYTE PTR [rcx],dh
     fba:	39 32                	cmp    DWORD PTR [rdx],esi
     fbc:	30 78 31             	xor    BYTE PTR [rax+0x31],bh
     fbf:	32 30                	xor    dh,BYTE PTR [rax]
     fc1:	30 20                	xor    BYTE PTR [rax],ah
     fc3:	28 31                	sub    BYTE PTR [rcx],dh
     fc5:	36 3a 31             	cmp    dh,BYTE PTR ss:[rcx]
     fc8:	30 29                	xor    BYTE PTR [rcx],ch
     fca:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     fcd:	64 65 20 32          	fs and BYTE PTR gs:[rdx],dh
     fd1:	31 3a                	xor    DWORD PTR [rdx],edi
     fd3:	20 32                	and    BYTE PTR [rdx],dh
     fd5:	35 36 30 78 31       	xor    eax,0x31783036
     fda:	30 38                	xor    BYTE PTR [rax],bh
     fdc:	30 20                	xor    BYTE PTR [rax],ah
     fde:	28 32                	sub    BYTE PTR [rdx],dh
     fe0:	31 3a                	xor    DWORD PTR [rdx],edi
     fe2:	39 29                	cmp    DWORD PTR [rcx],ebp
     fe4:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
     fe7:	64 65 20 32          	fs and BYTE PTR gs:[rdx],dh
     feb:	32 3a                	xor    bh,BYTE PTR [rdx]
     fed:	20 33                	and    BYTE PTR [rbx],dh
     fef:	34 34                	xor    al,0x34
     ff1:	30 78 31             	xor    BYTE PTR [rax+0x31],bh
     ff4:	34 34                	xor    al,0x34
     ff6:	30 20                	xor    BYTE PTR [rax],ah
     ff8:	28 32                	sub    BYTE PTR [rdx],dh
     ffa:	31 3a                	xor    DWORD PTR [rdx],edi
     ffc:	39 29                	cmp    DWORD PTR [rcx],ebp
     ffe:	00 4d 6f             	add    BYTE PTR [rbp+0x6f],cl
    1001:	64 65 20 32          	fs and BYTE PTR gs:[rdx],dh
    1005:	33 3a                	xor    edi,DWORD PTR [rdx]
    1007:	20 33                	and    BYTE PTR [rbx],dh
    1009:	38 34 30             	cmp    BYTE PTR [rax+rsi*1],dh
    100c:	78 32                	js     1040 <.LC372+0x1f8>
    100e:	31 36                	xor    DWORD PTR [rsi],esi
    1010:	30 00                	xor    BYTE PTR [rax],al
    1012:	4d 6f                	rex.WRB outs dx,DWORD PTR ds:[rsi]
    1014:	64 65 20 32          	fs and BYTE PTR gs:[rdx],dh
    1018:	34 3a                	xor    al,0x3a
    101a:	20 34 30             	and    BYTE PTR [rax+rsi*1],dh
    101d:	39 36                	cmp    DWORD PTR [rsi],esi
    101f:	78 32                	js     1053 <.LC372+0x20b>
    1021:	31 36                	xor    DWORD PTR [rsi],esi
    1023:	30 20                	xor    BYTE PTR [rax],ah
    1025:	28 34 4b             	sub    BYTE PTR [rbx+rcx*2],dh
    1028:	29 00                	sub    DWORD PTR [rax],eax

Disassembly of section .rodata.str1.8:

0000000000000000 <.LC19>:
.LC19():
   0:	25 73 20 72 65       	and    eax,0x65722073
   5:	73 6f                	jae    76 <.LC65+0x6>
   7:	6c                   	ins    BYTE PTR es:[rdi],dx
   8:	76 65                	jbe    6f <.LC34+0x4f>
   a:	64 20 74 6f 20       	and    BYTE PTR fs:[rdi+rbp*2+0x20],dh
   f:	25 69 2e 25 69       	and    eax,0x69252e69
  14:	2e 25 69 2e 25 69    	cs and eax,0x69252e69
  1a:	3a 25 69 0a 00 00    	cmp    ah,BYTE PTR [rip+0xa69]        # a89 <.LC252+0x29>

0000000000000020 <.LC34>:
.LC34():
  20:	5e                   	pop    rsi
  21:	33 57 41             	xor    edx,DWORD PTR [rdi+0x41]
  24:	52                   	push   rdx
  25:	4e                   	rex.WRX
  26:	49                   	rex.WB
  27:	4e                   	rex.WRX
  28:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
  2b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  2c:	76 65                	jbe    93 <.LC65+0x23>
  2e:	72 73                	jb     a3 <.LC65+0x33>
  30:	69 7a 65 20 75 73 65 	imul   edi,DWORD PTR [rdx+0x65],0x65737520
  37:	72 69                	jb     a2 <.LC65+0x32>
  39:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  3a:	66 6f                	outs   dx,WORD PTR ds:[rsi]
  3c:	2c 20                	sub    al,0x20
  3e:	79 6f                	jns    af <.LC65+0x3f>
  40:	75 20                	jne    62 <.LC34+0x42>
  42:	6d                   	ins    DWORD PTR es:[rdi],dx
  43:	69 67 68 74 20 62 65 	imul   esp,DWORD PTR [rdi+0x68],0x65622074
  4a:	20 6e 6f             	and    BYTE PTR [rsi+0x6f],ch
  4d:	74 20                	je     6f <.LC34+0x4f>
  4f:	61                   	(bad)  
  50:	62                   	(bad)  
  51:	6c                   	ins    BYTE PTR es:[rdi],dx
  52:	65 20 74 6f 20       	and    BYTE PTR gs:[rdi+rbp*2+0x20],dh
  57:	6a 6f                	push   0x6f
  59:	69 6e 20 72 65 6d 6f 	imul   ebp,DWORD PTR [rsi+0x20],0x6f6d6572
  60:	74 65                	je     c7 <.LC65+0x57>
  62:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
  65:	72 76                	jb     dd <.LC65+0x6d>
  67:	65 72 21             	gs jb  8b <.LC65+0x1b>
  6a:	0a 00                	or     al,BYTE PTR [rax]
  6c:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000070 <.LC65>:
.LC65():
  70:	4f 76 65             	rex.WRXB jbe d8 <.LC65+0x68>
  73:	72 72                	jb     e7 <.LC65+0x77>
  75:	69 64 65 20 6d 6f 6e 	imul   esp,DWORD PTR [rbp+riz*2+0x20],0x696e6f6d
  7c:	69 
  7d:	74 6f                	je     ee <.LC75+0x6>
  7f:	72 20                	jb     a1 <.LC65+0x31>
  81:	72 65                	jb     e8 <.LC75>
  83:	66 72 65             	data16 jb eb <.LC75+0x3>
  86:	73 68                	jae    f0 <.LC75+0x8>
  88:	20 72 61             	and    BYTE PTR [rdx+0x61],dh
  8b:	74 65                	je     f2 <.LC75+0xa>
  8d:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
  90:	20 66 75             	and    BYTE PTR [rsi+0x75],ah
  93:	6c                   	ins    BYTE PTR es:[rdi],dx
  94:	6c                   	ins    BYTE PTR es:[rdi],dx
  95:	73 63                	jae    fa <.LC75+0x12>
  97:	72 65                	jb     fe <.LC75+0x16>
  99:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  9b:	20 6d 6f             	and    BYTE PTR [rbp+0x6f],ch
  9e:	64 65 3a 0a          	fs cmp cl,BYTE PTR gs:[rdx]
  a2:	20 20                	and    BYTE PTR [rax],ah
  a4:	30 20                	xor    BYTE PTR [rax],ah
  a6:	2d 20 75 73 65       	sub    eax,0x65737520
  ab:	20 63 75             	and    BYTE PTR [rbx+0x75],ah
  ae:	72 72                	jb     122 <.LC75+0x3a>
  b0:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
  b2:	74 20                	je     d4 <.LC65+0x64>
  b4:	6d                   	ins    DWORD PTR es:[rdi],dx
  b5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  b6:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  b7:	69 74 6f 72 20 72 65 	imul   esi,DWORD PTR [rdi+rbp*2+0x72],0x66657220
  be:	66 
  bf:	72 65                	jb     126 <.LC75+0x3e>
  c1:	73 68                	jae    12b <.LC75+0x43>
  c3:	20 72 61             	and    BYTE PTR [rdx+0x61],dh
  c6:	74 65                	je     12d <.LC75+0x45>
  c8:	0a 20                	or     ah,BYTE PTR [rax]
  ca:	3e 30 20             	xor    BYTE PTR ds:[rax],ah
  cd:	2d 20 75 73 65       	sub    eax,0x65737520
  d2:	20 63 75             	and    BYTE PTR [rbx+0x75],ah
  d5:	73 74                	jae    14b <.LC75+0x63>
  d7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  d8:	6d                   	ins    DWORD PTR es:[rdi],dx
  d9:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
  dc:	66 72 65             	data16 jb 144 <.LC75+0x5c>
  df:	73 68                	jae    149 <.LC75+0x61>
  e1:	20 72 61             	and    BYTE PTR [rdx+0x61],dh
  e4:	74 65                	je     14b <.LC75+0x63>
	...

00000000000000e8 <.LC75>:
.LC75():
  e8:	53                   	push   rbx
  e9:	65 74 20             	gs je  10c <.LC75+0x24>
  ec:	76 69                	jbe    157 <.LC75+0x6f>
  ee:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
  f1:	20 6d 6f             	and    BYTE PTR [rbp+0x6f],ch
  f4:	64 65 3a 0a          	fs cmp cl,BYTE PTR gs:[rdx]
  f8:	20 2d 32 20 2d 20    	and    BYTE PTR [rip+0x202d2032],ch        # 202d2130 <noGameRestart+0x202c4ee8>
  fe:	75 73                	jne    173 <.LC76+0x3>
 100:	65 20 63 75          	and    BYTE PTR gs:[rbx+0x75],ah
 104:	72 72                	jb     178 <.LC76+0x8>
 106:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 108:	74 20                	je     12a <.LC75+0x42>
 10a:	64 65 73 6b          	fs gs jae 179 <.LC76+0x9>
 10e:	74 6f                	je     17f <.LC76+0xf>
 110:	70 20                	jo     132 <.LC75+0x4a>
 112:	72 65                	jb     179 <.LC76+0x9>
 114:	73 6f                	jae    185 <.LC76+0x15>
 116:	6c                   	ins    BYTE PTR es:[rdi],dx
 117:	75 74                	jne    18d <.LC76+0x1d>
 119:	69 6f 6e 0a 20 2d 31 	imul   ebp,DWORD PTR [rdi+0x6e],0x312d200a
 120:	20 2d 20 75 73 65    	and    BYTE PTR [rip+0x65737520],ch        # 65737646 <noGameRestart+0x6572a3fe>
 126:	20 5c 72 5f          	and    BYTE PTR [rdx+rsi*2+0x5f],bl
 12a:	63 75 73             	movsxd esi,DWORD PTR [rbp+0x73]
 12d:	74 6f                	je     19e <.LC76+0x2e>
 12f:	6d                   	ins    DWORD PTR es:[rdi],dx
 130:	57                   	push   rdi
 131:	69 64 74 68 20 61 6e 	imul   esp,DWORD PTR [rsp+rsi*2+0x68],0x646e6120
 138:	64 
 139:	20 5c 72 5f          	and    BYTE PTR [rdx+rsi*2+0x5f],bl
 13d:	63 75 73             	movsxd esi,DWORD PTR [rbp+0x73]
 140:	74 6f                	je     1b1 <.LC76+0x41>
 142:	6d                   	ins    DWORD PTR es:[rdi],dx
 143:	48                   	rex.W
 144:	65 69 67 68 74 0a 20 	imul   esp,DWORD PTR gs:[rdi+0x68],0x20200a74
 14b:	20 
 14c:	30 2e                	xor    BYTE PTR [rsi],ch
 14e:	2e 4e 20 2d 20 65 6e 	rex.WRX and BYTE PTR cs:[rip+0x746e6520],r13b        # 746e6676 <noGameRestart+0x746d942e>
 155:	74 
 156:	65 72 20             	gs jb  179 <.LC76+0x9>
 159:	5c                   	pop    rsp
 15a:	6d                   	ins    DWORD PTR es:[rdi],dx
 15b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 15c:	64 65 6c             	fs gs ins BYTE PTR es:[rdi],dx
 15f:	69 73 74 20 66 6f 72 	imul   esi,DWORD PTR [rbx+0x74],0x726f6620
 166:	20 64 65 74          	and    BYTE PTR [rbp+riz*2+0x74],ah
 16a:	61                   	(bad)  
 16b:	69 6c 73 00 00   	imul   ebp,DWORD PTR [rbx+rsi*2+0x0],0x64654400
 172:	 

0000000000000170 <.LC76>:
.LC76():
 170:	44                   	rex.R
 171:	65 64 69 63 61 74 65 	gs imul esp,DWORD PTR fs:[rbx+0x61],0x20646574
 178:	64 20 
 17a:	66 75 6c             	data16 jne 1e9 <.LC85+0x9>
 17d:	6c                   	ins    BYTE PTR es:[rdi],dx
 17e:	73 63                	jae    1e3 <.LC85+0x3>
 180:	72 65                	jb     1e7 <.LC85+0x7>
 182:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 184:	20 6d 6f             	and    BYTE PTR [rbp+0x6f],ch
 187:	64 65 2c 20          	fs gs sub al,0x20
 18b:	73 65                	jae    1f2 <.LC85+0x12>
 18d:	74 20                	je     1af <.LC76+0x3f>
 18f:	74 6f                	je     200 <.LC85+0x20>
 191:	20 22                	and    BYTE PTR [rdx],ah
 193:	22 20                	and    ah,BYTE PTR [rax]
 195:	74 6f                	je     206 <.LC85+0x26>
 197:	20 75 73             	and    BYTE PTR [rbp+0x73],dh
 19a:	65 20 5c 72 5f       	and    BYTE PTR gs:[rdx+rsi*2+0x5f],bl
 19f:	6d                   	ins    DWORD PTR es:[rdi],dx
 1a0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1a1:	64 65 20 69 6e       	fs and BYTE PTR gs:[rcx+0x6e],ch
 1a6:	20 61 6c             	and    BYTE PTR [rcx+0x6c],ah
 1a9:	6c                   	ins    BYTE PTR es:[rdi],dx
 1aa:	20 63 61             	and    BYTE PTR [rbx+0x61],ah
 1ad:	73 65                	jae    214 <.LC95+0xc>
 1af:	73 00                	jae    1b1 <.LC76+0x41>
 1b1:	00 00                	add    BYTE PTR [rax],al
 1b3:	00 00                	add    BYTE PTR [rax],al
 1b5:	00 00                	add    BYTE PTR [rax],al
	...

00000000000001b8 <.LC84>:
.LC84():
 1b8:	43 75 73             	rex.XB jne 22e <.LC95+0x26>
 1bb:	74 6f                	je     22c <.LC95+0x24>
 1bd:	6d                   	ins    DWORD PTR es:[rdi],dx
 1be:	20 77 69             	and    BYTE PTR [rdi+0x69],dh
 1c1:	64 74 68             	fs je  22c <.LC95+0x24>
 1c4:	20 74 6f 20          	and    BYTE PTR [rdi+rbp*2+0x20],dh
 1c8:	75 73                	jne    23d <.LC100+0xd>
 1ca:	65 20 77 69          	and    BYTE PTR gs:[rdi+0x69],dh
 1ce:	74 68                	je     238 <.LC100+0x8>
 1d0:	20 5c 72 5f          	and    BYTE PTR [rdx+rsi*2+0x5f],bl
 1d4:	6d                   	ins    DWORD PTR es:[rdi],dx
 1d5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1d6:	64 65 20 2d 31 00 00 	fs and BYTE PTR gs:[rip+0x31],ch        # 20f <.LC95+0x7>
 1dd:	00 
	...

00000000000001e0 <.LC85>:
.LC85():
 1e0:	43 75 73             	rex.XB jne 256 <.LC100+0x26>
 1e3:	74 6f                	je     254 <.LC100+0x24>
 1e5:	6d                   	ins    DWORD PTR es:[rdi],dx
 1e6:	20 68 65             	and    BYTE PTR [rax+0x65],ch
 1e9:	69 67 68 74 20 74 6f 	imul   esp,DWORD PTR [rdi+0x68],0x6f742074
 1f0:	20 75 73             	and    BYTE PTR [rbp+0x73],dh
 1f3:	65 20 77 69          	and    BYTE PTR gs:[rdi+0x69],dh
 1f7:	74 68                	je     261 <.LC107+0x9>
 1f9:	20 5c 72 5f          	and    BYTE PTR [rdx+rsi*2+0x5f],bl
 1fd:	6d                   	ins    DWORD PTR es:[rdi],dx
 1fe:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 1ff:	64 65 20 2d 31 00 00 	fs and BYTE PTR gs:[rip+0x31],ch        # 238 <.LC100+0x8>
 206:	00 
	...

0000000000000208 <.LC95>:
.LC95():
 208:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 20d:	20 49 6e             	and    BYTE PTR [rcx+0x6e],cl
 210:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [rcx+rbp*2+0x61],0x697a696c
 217:	69 
 218:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 219:	67 20 52 65          	and    BYTE PTR [edx+0x65],dl
 21d:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 21e:	64 65 72 65          	fs gs jb 287 <.LC107+0x2f>
 222:	72 20                	jb     244 <.LC100+0x14>
 224:	2d 2d 2d 2d 0a       	sub    eax,0xa2d2d2d
 229:	00 00                	add    BYTE PTR [rax],al
 22b:	00 00                	add    BYTE PTR [rax],al
 22d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000230 <.LC100>:
.LC100():
 230:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 235:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 23a:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 23f:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 244:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 249:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 24e:	2d 0a 00 00 00       	sub    eax,0xa
 253:	00 00                	add    BYTE PTR [rax],al
 255:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000258 <.LC107>:
.LC107():
 258:	54                   	push   rsp
 259:	68 65 20 25 73       	push   0x73252065
 25e:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 261:	6d                   	ins    DWORD PTR es:[rdi],dx
 262:	6d                   	ins    DWORD PTR es:[rdi],dx
 263:	61                   	(bad)  
 264:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 265:	64 20 63 61          	and    BYTE PTR fs:[rbx+0x61],ah
 269:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 26a:	20 6f 6e             	and    BYTE PTR [rdi+0x6e],ch
 26d:	6c                   	ins    BYTE PTR es:[rdi],dx
 26e:	79 20                	jns    290 <.LC107+0x38>
 270:	62                   	(bad)  
 271:	65 20 75 73          	and    BYTE PTR gs:[rbp+0x73],dh
 275:	65 64 20 77 68       	gs and BYTE PTR fs:[rdi+0x68],dh
 27a:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 27c:	20 70 6c             	and    BYTE PTR [rax+0x6c],dh
 27f:	61                   	(bad)  
 280:	79 69                	jns    2eb <.LC116+0x23>
 282:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 283:	67 20 62 61          	and    BYTE PTR [edx+0x61],ah
 287:	63 6b 20             	movsxd ebp,DWORD PTR [rbx+0x20]
 28a:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
 28d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 28e:	73 0a                	jae    29a <.LC111+0x2>
	...

0000000000000298 <.LC111>:
.LC111():
 298:	5e                   	pop    rsi
 299:	31 45 52             	xor    DWORD PTR [rbp+0x52],eax
 29c:	52                   	push   rdx
 29d:	4f 52                	rex.WRXB push r10
 29f:	3a 20                	cmp    ah,BYTE PTR [rax]
 2a1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 2a2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 2a3:	20 66 72             	and    BYTE PTR [rsi+0x72],ah
 2a6:	65 65 20 66 69       	gs and BYTE PTR gs:[rsi+0x69],ah
 2ab:	6c                   	ins    BYTE PTR es:[rdi],dx
 2ac:	65 20 6e 61          	and    BYTE PTR gs:[rsi+0x61],ch
 2b0:	6d                   	ins    DWORD PTR es:[rdi],dx
 2b1:	65 73 20             	gs jae 2d4 <.LC116+0xc>
 2b4:	74 6f                	je     325 <.LC122+0xd>
 2b6:	20 63 72             	and    BYTE PTR [rbx+0x72],ah
 2b9:	65 61                	gs (bad) 
 2bb:	74 65                	je     322 <.LC122+0xa>
 2bd:	20 76 69             	and    BYTE PTR [rsi+0x69],dh
 2c0:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
 2c3:	0a 00                	or     al,BYTE PTR [rax]
 2c5:	00 00                	add    BYTE PTR [rax],al
	...

00000000000002c8 <.LC116>:
.LC116():
 2c8:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 2cd:	2d 2d 2d 2d 20       	sub    eax,0x202d2d2d
 2d2:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 2d4:	69 65 6e 74 20 49 6e 	imul   esp,DWORD PTR [rbp+0x6e],0x6e492074
 2db:	66 6f                	outs   dx,WORD PTR ds:[rsi]
 2dd:	72 6d                	jb     34c <.LC124+0x4>
 2df:	61                   	(bad)  
 2e0:	74 69                	je     34b <.LC124+0x3>
 2e2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 2e3:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 2e4:	20 2d 2d 2d 2d 2d    	and    BYTE PTR [rip+0x2d2d2d2d],ch        # 2d2d3017 <noGameRestart+0x2d2c5dcf>
 2ea:	2d 2d 2d 2d 0a       	sub    eax,0xa2d2d2d
	...

00000000000002f0 <.LC120>:
.LC120():
 2f0:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 2f5:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 2fa:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 2ff:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 304:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 309:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 30e:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 313:	2d 2d 2d 0a 00       	sub    eax,0xa2d2d

0000000000000318 <.LC122>:
.LC122():
 318:	53                   	push   rbx
 319:	63 61 6e             	movsxd esp,DWORD PTR [rcx+0x6e]
 31c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 31d:	69 6e 67 20 66 6f 72 	imul   ebp,DWORD PTR [rsi+0x67],0x726f6620
 324:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
 327:	72 76                	jb     39f <.LC127+0x17>
 329:	65 72 73             	gs jb  39f <.LC127+0x17>
 32c:	20 6f 6e             	and    BYTE PTR [rdi+0x6e],ch
 32f:	20 74 68 65          	and    BYTE PTR [rax+rbp*2+0x65],dh
 333:	20 6c 6f 63          	and    BYTE PTR [rdi+rbp*2+0x63],ch
 337:	61                   	(bad)  
 338:	6c                   	ins    BYTE PTR es:[rdi],dx
 339:	20 6e 65             	and    BYTE PTR [rsi+0x65],ch
 33c:	74 77                	je     3b5 <.LC127+0x2d>
 33e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 33f:	72 6b                	jb     3ac <.LC127+0x24>
 341:	2e 2e 2e 0a 00       	cs cs or al,BYTE PTR cs:[rax]
	...

0000000000000348 <.LC124>:
.LC124():
 348:	75 73                	jne    3bd <.LC127+0x35>
 34a:	61                   	(bad)  
 34b:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[eax]
 34f:	67 6c                	ins    BYTE PTR es:[edi],dx
 351:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 352:	62 61 6c 73 65       	(bad)  {k3}
 357:	72 76                	jb     3cf <.LC128+0xf>
 359:	65 72 73             	gs jb  3cf <.LC128+0xf>
 35c:	20 3c 6d 61 73 74 65 	and    BYTE PTR [rbp*2+0x65747361],bh
 363:	72 23                	jb     388 <.LC127>
 365:	20 30                	and    BYTE PTR [rax],dh
 367:	2d 25 64 3e 20       	sub    eax,0x203e6425
 36c:	3c 70                	cmp    al,0x70
 36e:	72 6f                	jb     3df <.LC128+0x1f>
 370:	74 6f                	je     3e1 <.LC128+0x21>
 372:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
 375:	3e 20 5b 6b          	and    BYTE PTR ds:[rbx+0x6b],bl
 379:	65 79 77             	gs jns 3f3 <.LC128+0x33>
 37c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 37d:	72 64                	jb     3e3 <.LC128+0x23>
 37f:	73 5d                	jae    3de <.LC128+0x1e>
 381:	0a 00                	or     al,BYTE PTR [rax]
 383:	00 00                	add    BYTE PTR [rax],al
 385:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000388 <.LC127>:
.LC127():
 388:	43                   	rex.XB
 389:	4c 5f                	rex.WR pop rdi
 38b:	47 6c                	rex.RXB ins BYTE PTR es:[rdi],dx
 38d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 38e:	62 61 6c 53 65       	(bad)  {k3}
 393:	72 76                	jb     40b <.LC129+0xb>
 395:	65 72 73             	gs jb  40b <.LC129+0xb>
 398:	5f                   	pop    rdi
 399:	66 3a 20             	data16 cmp ah,BYTE PTR [rax]
 39c:	45 72 72             	rex.RB jb 411 <.LC129+0x11>
 39f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 3a0:	72 3a                	jb     3dc <.LC128+0x1c>
 3a2:	20 4e 6f             	and    BYTE PTR [rsi+0x6f],cl
 3a5:	20 6d 61             	and    BYTE PTR [rbp+0x61],ch
 3a8:	73 74                	jae    41e <.LC129+0x1e>
 3aa:	65 72 20             	gs jb  3cd <.LC128+0xd>
 3ad:	73 65                	jae    414 <.LC129+0x14>
 3af:	72 76                	jb     427 <.LC129+0x27>
 3b1:	65 72 20             	gs jb  3d4 <.LC128+0x14>
 3b4:	61                   	(bad)  
 3b5:	64 64 72 65          	fs fs jb 41e <.LC129+0x1e>
 3b9:	73 73                	jae    42e <.LC129+0x2e>
 3bb:	65 73 2e             	gs jae 3ec <.LC128+0x2c>
 3be:	0a 00                	or     al,BYTE PTR [rax]

00000000000003c0 <.LC128>:
.LC128():
 3c0:	43                   	rex.XB
 3c1:	4c 5f                	rex.WR pop rdi
 3c3:	47 6c                	rex.RXB ins BYTE PTR es:[rdi],dx
 3c5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 3c6:	62 61 6c 53 65       	(bad)  {k3}
 3cb:	72 76                	jb     443 <.LC129+0x43>
 3cd:	65 72 73             	gs jb  443 <.LC129+0x43>
 3d0:	5f                   	pop    rdi
 3d1:	66 3a 20             	data16 cmp ah,BYTE PTR [rax]
 3d4:	45 72 72             	rex.RB jb 449 <.LC130+0x1>
 3d7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 3d8:	72 3a                	jb     414 <.LC129+0x14>
 3da:	20 4e 6f             	and    BYTE PTR [rsi+0x6f],cl
 3dd:	20 6d 61             	and    BYTE PTR [rbp+0x61],ch
 3e0:	73 74                	jae    456 <.LC130+0xe>
 3e2:	65 72 20             	gs jb  405 <.LC129+0x5>
 3e5:	73 65                	jae    44c <.LC130+0x4>
 3e7:	72 76                	jb     45f <.LC130+0x17>
 3e9:	65 72 20             	gs jb  40c <.LC129+0xc>
 3ec:	61                   	(bad)  
 3ed:	64 64 72 65          	fs fs jb 456 <.LC130+0xe>
 3f1:	73 73                	jae    466 <.LC130+0x1e>
 3f3:	20 67 69             	and    BYTE PTR [rdi+0x69],ah
 3f6:	76 65                	jbe    45d <.LC130+0x15>
 3f8:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 3f9:	2e 0a 00             	or     al,BYTE PTR cs:[rax]
 3fc:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000400 <.LC129>:
.LC129():
 400:	43                   	rex.XB
 401:	4c 5f                	rex.WR pop rdi
 403:	47 6c                	rex.RXB ins BYTE PTR es:[rdi],dx
 405:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 406:	62 61 6c 53 65       	(bad)  {k3}
 40b:	72 76                	jb     483 <.LC142+0x13>
 40d:	65 72 73             	gs jb  483 <.LC142+0x13>
 410:	5f                   	pop    rdi
 411:	66 3a 20             	data16 cmp ah,BYTE PTR [rax]
 414:	45 72 72             	rex.RB jb 489 <.LC142+0x19>
 417:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 418:	72 3a                	jb     454 <.LC130+0xc>
 41a:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 41d:	75 6c                	jne    48b <.LC142+0x1b>
 41f:	64 20 6e 6f          	and    BYTE PTR fs:[rsi+0x6f],ch
 423:	74 20                	je     445 <.LC129+0x45>
 425:	72 65                	jb     48c <.LC142+0x1c>
 427:	73 6f                	jae    498 <.LC144>
 429:	6c                   	ins    BYTE PTR es:[rdi],dx
 42a:	76 65                	jbe    491 <.LC142+0x21>
 42c:	20 61 64             	and    BYTE PTR [rcx+0x64],ah
 42f:	64 72 65             	fs jb  497 <.LC142+0x27>
 432:	73 73                	jae    4a7 <.LC144+0xf>
 434:	20 6f 66             	and    BYTE PTR [rdi+0x66],ch
 437:	20 6d 61             	and    BYTE PTR [rbp+0x61],ch
 43a:	73 74                	jae    4b0 <.LC144+0x18>
 43c:	65 72 20             	gs jb  45f <.LC130+0x17>
 43f:	25 73 0a 00 00       	and    eax,0xa73
 444:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000448 <.LC130>:
.LC130():
 448:	52                   	push   rdx
 449:	65 71 75             	gs jno 4c1 <.LC144+0x29>
 44c:	65 73 74             	gs jae 4c3 <.LC144+0x2b>
 44f:	69 6e 67 20 73 65 72 	imul   ebp,DWORD PTR [rsi+0x67],0x72657320
 456:	76 65                	jbe    4bd <.LC144+0x25>
 458:	72 73                	jb     4cd <.LC144+0x35>
 45a:	20 66 72             	and    BYTE PTR [rsi+0x72],ah
 45d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 45e:	6d                   	ins    DWORD PTR es:[rdi],dx
 45f:	20 25 73 20 28 25    	and    BYTE PTR [rip+0x25282073],ah        # 252824d8 <noGameRestart+0x25275290>
 465:	73 29                	jae    490 <.LC142+0x20>
 467:	2e 2e 2e 0a 00       	cs cs or al,BYTE PTR cs:[rax]
 46c:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000470 <.LC142>:
.LC142():
 470:	59                   	pop    rcx
 471:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 472:	75 20                	jne    494 <.LC142+0x24>
 474:	6d                   	ins    DWORD PTR es:[rdi],dx
 475:	75 73                	jne    4ea <.LC147+0x2>
 477:	74 20                	je     499 <.LC144+0x1>
 479:	62                   	(bad)  
 47a:	65 20 69 6e          	and    BYTE PTR gs:[rcx+0x6e],ch
 47e:	20 61 20             	and    BYTE PTR [rcx+0x20],ah
 481:	6c                   	ins    BYTE PTR es:[rdi],dx
 482:	65 76 65             	gs jbe 4ea <.LC147+0x2>
 485:	6c                   	ins    BYTE PTR es:[rdi],dx
 486:	20 74 6f 20          	and    BYTE PTR [rdi+rbp*2+0x20],dh
 48a:	72 65                	jb     4f1 <.LC147+0x9>
 48c:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
 48f:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
 493:	00 00                	add    BYTE PTR [rax],al
 495:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000498 <.LC144>:
.LC144():
 498:	5e                   	pop    rsi
 499:	33 57 41             	xor    edx,DWORD PTR [rdi+0x41]
 49c:	52                   	push   rdx
 49d:	4e                   	rex.WRX
 49e:	49                   	rex.WB
 49f:	4e                   	rex.WRX
 4a0:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 4a3:	59                   	pop    rcx
 4a4:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4a5:	75 20                	jne    4c7 <.LC144+0x2f>
 4a7:	73 68                	jae    511 <.LC160+0x1>
 4a9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4aa:	75 6c                	jne    518 <.LC160+0x8>
 4ac:	64 20 73 65          	and    BYTE PTR fs:[rbx+0x65],dh
 4b0:	74 20                	je     4d2 <.LC144+0x3a>
 4b2:	27                   	(bad)  
 4b3:	67 5f                	addr32 pop rdi
 4b5:	73 79                	jae    530 <.LC160+0x20>
 4b7:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 4b8:	63 68 72             	movsxd ebp,DWORD PTR [rax+0x72]
 4bb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4bc:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 4bd:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4be:	75 73                	jne    533 <.LC160+0x23>
 4c0:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 4c2:	69 65 6e 74 73 20 31 	imul   esp,DWORD PTR [rbp+0x6e],0x31207374
 4c9:	27                   	(bad)  
 4ca:	20 66 6f             	and    BYTE PTR [rsi+0x6f],ah
 4cd:	72 20                	jb     4ef <.LC147+0x7>
 4cf:	73 6d                	jae    53e <.LC164+0x6>
 4d1:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4d2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4d3:	74 68                	je     53d <.LC164+0x5>
 4d5:	65 72 20             	gs jb  4f8 <.LC147+0x10>
 4d8:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
 4db:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4dc:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
 4df:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
 4e2:	64 69 6e 67 0a 00  	imul   ebp,DWORD PTR fs:[rsi+0x67],0x6564000a
 4e9:	 

00000000000004e8 <.LC147>:
.LC147():
 4e8:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
 4eb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4ec:	73 2f                	jae    51d <.LC160+0xd>
 4ee:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
 4f1:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 4f2:	2d 25 30 34 64       	sub    eax,0x64343025
 4f7:	25 30 32 64 25       	and    eax,0x25643230
 4fc:	30 32                	xor    BYTE PTR [rdx],dh
 4fe:	64 2d 25 30 32 64    	fs sub eax,0x64323025
 504:	25 30 32 64 25       	and    eax,0x25643230
 509:	30 32                	xor    BYTE PTR [rdx],dh
 50b:	64 00 00             	add    BYTE PTR fs:[rax],al
	...

0000000000000510 <.LC160>:
.LC160():
 510:	44 69 66 66 65 72 65 	imul   r12d,DWORD PTR [rsi+0x66],0x6e657265
 517:	6e 
 518:	74 20                	je     53a <.LC164+0x2>
 51a:	70 72                	jo     58e <.LC168+0x26>
 51c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 51d:	74 6f                	je     58e <.LC168+0x26>
 51f:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
 522:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
 525:	66 6f                	outs   dx,WORD PTR ds:[rsi]
 527:	20 70 61             	and    BYTE PTR [rax+0x61],dh
 52a:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 52d:	74 3a                	je     569 <.LC168+0x1>
 52f:	20 25 73 0a 00 00    	and    BYTE PTR [rip+0xa73],ah        # fa8 <.LC372+0x160>
 535:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000538 <.LC164>:
.LC164():
 538:	4d                   	rex.WRB
 539:	41 58                	pop    r8
 53b:	5f                   	pop    rdi
 53c:	4f 54                	rex.WRXB push r12
 53e:	48                   	rex.W
 53f:	45 52                	rex.RB push r10
 541:	5f                   	pop    rdi
 542:	53                   	push   rbx
 543:	45 52                	rex.RB push r10
 545:	56                   	push   rsi
 546:	45 52                	rex.RB push r10
 548:	53                   	push   rbx
 549:	20 68 69             	and    BYTE PTR [rax+0x69],ch
 54c:	74 2c                	je     57a <.LC168+0x12>
 54e:	20 64 72 6f          	and    BYTE PTR [rdx+rsi*2+0x6f],ah
 552:	70 70                	jo     5c4 <.LC170+0x24>
 554:	69 6e 67 20 69 6e 66 	imul   ebp,DWORD PTR [rsi+0x67],0x666e6920
 55b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 55c:	52                   	push   rdx
 55d:	65 73 70             	gs jae 5d0 <.LC178+0x8>
 560:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 561:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 562:	73 65                	jae    5c9 <.LC178+0x1>
 564:	0a 00                	or     al,BYTE PTR [rax]
	...

0000000000000568 <.LC168>:
.LC168():
 568:	77 61                	ja     5cb <.LC178+0x3>
 56a:	72 6e                	jb     5da <.LC178+0x12>
 56c:	69 6e 67 3a 20 6f 6e 	imul   ebp,DWORD PTR [rsi+0x67],0x6e6f203a
 573:	6c                   	ins    BYTE PTR es:[rdi],dx
 574:	79 20                	jns    596 <.LC168+0x2e>
 576:	2d 34 20 6f 72       	sub    eax,0x726f2034
 57b:	20 2d 36 20 61 73    	and    BYTE PTR [rip+0x73612036],ch        # 736125b7 <noGameRestart+0x7360536f>
 581:	20 61 64             	and    BYTE PTR [rcx+0x64],ah
 584:	64 72 65             	fs jb  5ec <.LC178+0x24>
 587:	73 73                	jae    5fc <.LC178+0x34>
 589:	20 74 79 70          	and    BYTE PTR [rcx+rdi*2+0x70],dh
 58d:	65 20 75 6e          	and    BYTE PTR gs:[rbp+0x6e],dh
 591:	64 65 72 73          	fs gs jb 608 <.LC179>
 595:	74 6f                	je     606 <.LC178+0x3e>
 597:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 598:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
 59c:	00 00                	add    BYTE PTR [rax],al
	...

00000000000005a0 <.LC170>:
.LC170():
 5a0:	75 73                	jne    615 <.LC179+0xd>
 5a2:	61                   	(bad)  
 5a3:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[eax]
 5a7:	73 65                	jae    60e <.LC179+0x6>
 5a9:	72 76                	jb     621 <.LC179+0x19>
 5ab:	65 72 73             	gs jb  621 <.LC179+0x19>
 5ae:	74 61                	je     611 <.LC179+0x9>
 5b0:	74 75                	je     627 <.LC179+0x1f>
 5b2:	73 20                	jae    5d4 <.LC178+0xc>
 5b4:	5b                   	pop    rbx
 5b5:	2d 34 7c 2d 36       	sub    eax,0x362d7c34
 5ba:	5d                   	pop    rbp
 5bb:	20 3c 73             	and    BYTE PTR [rbx+rsi*2],bh
 5be:	65 72 76             	gs jb  637 <.LC179+0x2f>
 5c1:	65 72 3e             	gs jb  602 <.LC178+0x3a>
 5c4:	0a 00                	or     al,BYTE PTR [rax]
	...

00000000000005c8 <.LC178>:
.LC178():
 5c8:	59                   	pop    rcx
 5c9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 5ca:	75 20                	jne    5ec <.LC178+0x24>
 5cc:	6d                   	ins    DWORD PTR es:[rdi],dx
 5cd:	75 73                	jne    642 <.LC179+0x3a>
 5cf:	74 20                	je     5f1 <.LC178+0x29>
 5d1:	73 65                	jae    638 <.LC179+0x30>
 5d3:	74 20                	je     5f5 <.LC178+0x2d>
 5d5:	27                   	(bad)  
 5d6:	72 63                	jb     63b <.LC179+0x33>
 5d8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 5d9:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 5da:	70 61                	jo     63d <.LC179+0x35>
 5dc:	73 73                	jae    651 <.LC179+0x49>
 5de:	77 6f                	ja     64f <.LC179+0x47>
 5e0:	72 64                	jb     646 <.LC179+0x3e>
 5e2:	27                   	(bad)  
 5e3:	20 62 65             	and    BYTE PTR [rdx+0x65],ah
 5e6:	66 6f                	outs   dx,WORD PTR ds:[rsi]
 5e8:	72 65                	jb     64f <.LC179+0x47>
 5ea:	0a 69 73             	or     ch,BYTE PTR [rcx+0x73]
 5ed:	73 75                	jae    664 <.LC181+0x4>
 5ef:	69 6e 67 20 61 6e 20 	imul   ebp,DWORD PTR [rsi+0x67],0x206e6120
 5f6:	72 63                	jb     65b <.LC179+0x53>
 5f8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 5f9:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 5fa:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 5fd:	6d                   	ins    DWORD PTR es:[rdi],dx
 5fe:	6d                   	ins    DWORD PTR es:[rdi],dx
 5ff:	61                   	(bad)  
 600:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 601:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
 605:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000608 <.LC179>:
.LC179():
 608:	59                   	pop    rcx
 609:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 60a:	75 20                	jne    62c <.LC179+0x24>
 60c:	6d                   	ins    DWORD PTR es:[rdi],dx
 60d:	75 73                	jne    682 <.LC181+0x22>
 60f:	74 20                	je     631 <.LC179+0x29>
 611:	65 69 74 68 65 72 20 	imul   esi,DWORD PTR gs:[rax+rbp*2+0x65],0x65622072
 618:	62 65 
 61a:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 61d:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 61e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 61f:	65 63 74 65 64       	movsxd esi,DWORD PTR gs:[rbp+riz*2+0x64]
 624:	2c 0a                	sub    al,0xa
 626:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 627:	72 20                	jb     649 <.LC179+0x41>
 629:	73 65                	jae    690 <.LC181+0x30>
 62b:	74 20                	je     64d <.LC179+0x45>
 62d:	74 68                	je     697 <.LC181+0x37>
 62f:	65 20 27             	and    BYTE PTR gs:[rdi],ah
 632:	72 63                	jb     697 <.LC181+0x37>
 634:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 635:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 636:	41                   	rex.B
 637:	64 64 72 65          	fs fs jb 6a0 <.LC195+0x8>
 63b:	73 73                	jae    6b0 <.LC195+0x18>
 63d:	27                   	(bad)  
 63e:	20 63 76             	and    BYTE PTR [rbx+0x76],ah
 641:	61                   	(bad)  
 642:	72 0a                	jb     64e <.LC179+0x46>
 644:	74 6f                	je     6b5 <.LC195+0x1d>
 646:	20 69 73             	and    BYTE PTR [rcx+0x73],ch
 649:	73 75                	jae    6c0 <.LC209>
 64b:	65 20 72 63          	and    BYTE PTR gs:[rdx+0x63],dh
 64f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 650:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 651:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 654:	6d                   	ins    DWORD PTR es:[rdi],dx
 655:	6d                   	ins    DWORD PTR es:[rdi],dx
 656:	61                   	(bad)  
 657:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 658:	64 73 0a             	fs jae 665 <.LC181+0x5>
 65b:	00 00                	add    BYTE PTR [rax],al
 65d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000660 <.LC181>:
.LC181():
 660:	67 65 74 73          	addr32 gs je 6d7 <.LC209+0x17>
 664:	65 72 76             	gs jb  6dd <.LC209+0x1d>
 667:	65 72 73             	gs jb  6dd <.LC209+0x1d>
 66a:	52                   	push   rdx
 66b:	65 73 70             	gs jae 6de <.LC209+0x1e>
 66e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 66f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 670:	73 65                	jae    6d7 <.LC209+0x17>
 672:	3a 25 33 64 20 73    	cmp    ah,BYTE PTR [rip+0x73206433]        # 73206aab <noGameRestart+0x731f9863>
 678:	65 72 76             	gs jb  6f1 <.LC212+0x9>
 67b:	65 72 73             	gs jb  6f1 <.LC212+0x9>
 67e:	20 70 61             	and    BYTE PTR [rax+0x61],dh
 681:	72 73                	jb     6f6 <.LC212+0xe>
 683:	65 64 20 28          	gs and BYTE PTR fs:[rax],ch
 687:	74 6f                	je     6f8 <.LC212+0x10>
 689:	74 61                	je     6ec <.LC212+0x4>
 68b:	6c                   	ins    BYTE PTR es:[rdi],dx
 68c:	20 25 64 29 0a 00    	and    BYTE PTR [rip+0xa2964],ah        # a2ff6 <noGameRestart+0x95dae>
 692:	00 00                	add    BYTE PTR [rax],al
 694:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000698 <.LC195>:
.LC195():
 698:	5e                   	pop    rsi
 699:	33 20                	xor    esp,DWORD PTR [rax]
 69b:	6d                   	ins    DWORD PTR es:[rdi],dx
 69c:	61                   	(bad)  
 69d:	70 20                	jo     6bf <.LC195+0x27>
 69f:	25 73 20 61 6c       	and    eax,0x6c612073
 6a4:	72 65                	jb     70b <.LC212+0x23>
 6a6:	61                   	(bad)  
 6a7:	64 79 20             	fs jns 6ca <.LC209+0xa>
 6aa:	65 78 69             	gs js  716 <.LC212+0x2e>
 6ad:	73 74                	jae    723 <.LC215+0xb>
 6af:	73 20                	jae    6d1 <.LC209+0x11>
 6b1:	69 6e 20 25 73 2e 70 	imul   ebp,DWORD PTR [rsi+0x20],0x702e7325
 6b8:	6b 33 0a             	imul   esi,DWORD PTR [rbx],0xa
 6bb:	00 00                	add    BYTE PTR [rax],al
 6bd:	00 00                	add    BYTE PTR [rax],al
	...

00000000000006c0 <.LC209>:
.LC209():
 6c0:	25 69 20 66 72       	and    eax,0x72662069
 6c5:	61                   	(bad)  
 6c6:	6d                   	ins    DWORD PTR es:[rdi],dx
 6c7:	65 73 2c             	gs jae 6f6 <.LC212+0xe>
 6ca:	20 25 33 2e 2a 66    	and    BYTE PTR [rip+0x662a2e33],ah        # 662a3503 <noGameRestart+0x662962bb>
 6d0:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
 6d3:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 6d6:	64 73 3a             	fs jae 713 <.LC212+0x2b>
 6d9:	20 25 33 2e 31 66    	and    BYTE PTR [rip+0x66312e33],ah        # 66313512 <noGameRestart+0x663062ca>
 6df:	20 66 70             	and    BYTE PTR [rsi+0x70],ah
 6e2:	73 0a                	jae    6ee <.LC212+0x6>
 6e4:	00 00                	add    BYTE PTR [rax],al
	...

00000000000006e8 <.LC212>:
.LC212():
 6e8:	43                   	rex.XB
 6e9:	4c 5f                	rex.WR pop rdi
 6eb:	52                   	push   rdx
 6ec:	65 61                	gs (bad) 
 6ee:	64 44                	fs rex.R
 6f0:	65 6d                	gs ins DWORD PTR es:[rdi],dx
 6f2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 6f3:	4d                   	rex.WRB
 6f4:	65 73 73             	gs jae 76a <.LC216+0x2a>
 6f7:	61                   	(bad)  
 6f8:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[eax]
 6fc:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
 6ff:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 700:	4d 73 67             	rex.WRB jae 76a <.LC216+0x2a>
 703:	6c                   	ins    BYTE PTR es:[rdi],dx
 704:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 706:	20 3e                	and    BYTE PTR [rsi],bh
 708:	20 4d 41             	and    BYTE PTR [rbp+0x41],cl
 70b:	58                   	pop    rax
 70c:	5f                   	pop    rdi
 70d:	4d 53                	rex.WRB push r11
 70f:	47                   	rex.RXB
 710:	4c                   	rex.WR
 711:	45                   	rex.RB
 712:	4e 00 00             	rex.WRX add BYTE PTR [rax],r8b
 715:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000718 <.LC215>:
.LC215():
 718:	75 73                	jne    78d <.LC225+0x15>
 71a:	61                   	(bad)  
 71b:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[eax]
 71f:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 722:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 723:	65 63 74 20 5b       	movsxd esi,DWORD PTR gs:[rax+riz*1+0x5b]
 728:	2d 34 7c 2d 36       	sub    eax,0x362d7c34
 72d:	5d                   	pop    rbp
 72e:	20 3c 73             	and    BYTE PTR [rbx+rsi*2],bh
 731:	65 72 76             	gs jb  7aa <.LC234+0xa>
 734:	65 72 3e             	gs jb  775 <.LC216+0x35>
 737:	0a 00                	or     al,BYTE PTR [rax]
 739:	00 00                	add    BYTE PTR [rax],al
 73b:	00 00                	add    BYTE PTR [rax],al
 73d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000740 <.LC216>:
.LC216():
 740:	5e                   	pop    rsi
 741:	33 77 61             	xor    esi,DWORD PTR [rdi+0x61]
 744:	72 6e                	jb     7b4 <.LC234+0x14>
 746:	69 6e 67 3a 20 6f 6e 	imul   ebp,DWORD PTR [rsi+0x67],0x6e6f203a
 74d:	6c                   	ins    BYTE PTR es:[rdi],dx
 74e:	79 20                	jns    770 <.LC216+0x30>
 750:	2d 34 20 6f 72       	sub    eax,0x726f2034
 755:	20 2d 36 20 61 73    	and    BYTE PTR [rip+0x73612036],ch        # 73612791 <noGameRestart+0x73605549>
 75b:	20 61 64             	and    BYTE PTR [rcx+0x64],ah
 75e:	64 72 65             	fs jb  7c6 <.LC235+0x6>
 761:	73 73                	jae    7d6 <.LC235+0x16>
 763:	20 74 79 70          	and    BYTE PTR [rcx+rdi*2+0x70],dh
 767:	65 20 75 6e          	and    BYTE PTR gs:[rbp+0x6e],dh
 76b:	64 65 72 73          	fs gs jb 7e2 <.LC235+0x22>
 76f:	74 6f                	je     7e0 <.LC235+0x20>
 771:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 772:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
	...

0000000000000778 <.LC225>:
.LC225():
 778:	50                   	push   rax
 779:	72 6f                	jb     7ea <.LC235+0x2a>
 77b:	74 6f                	je     7ec <.LC235+0x2c>
 77d:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
 780:	20 25 64 20 6e 6f    	and    BYTE PTR [rip+0x6f6e2064],ah        # 6f6e27ea <noGameRestart+0x6f6d55a2>
 786:	74 20                	je     7a8 <.LC234+0x8>
 788:	73 75                	jae    7ff <.LC235+0x3f>
 78a:	70 70                	jo     7fc <.LC235+0x3c>
 78c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 78d:	72 74                	jb     803 <.LC235+0x43>
 78f:	65 64 20 66 6f       	gs and BYTE PTR fs:[rsi+0x6f],ah
 794:	72 20                	jb     7b6 <.LC234+0x16>
 796:	64 65 6d             	fs gs ins DWORD PTR es:[rdi],dx
 799:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 79a:	73 0a                	jae    7a6 <.LC234+0x6>
 79c:	00 00                	add    BYTE PTR [rax],al
	...

00000000000007a0 <.LC234>:
.LC234():
 7a0:	49 6e                	rex.WB outs dx,BYTE PTR ds:[rsi]
 7a2:	63 6f 72             	movsxd ebp,DWORD PTR [rdi+0x72]
 7a5:	72 65                	jb     80c <.LC235+0x4c>
 7a7:	63 74 20 63          	movsxd esi,DWORD PTR [rax+riz*1+0x63]
 7ab:	68 65 63 6b 73       	push   0x736b6365
 7b0:	75 6d                	jne    81f <.LC236+0xf>
 7b2:	20 66 6f             	and    BYTE PTR [rsi+0x6f],ah
 7b5:	72 20                	jb     7d7 <.LC235+0x17>
 7b7:	66 69 6c 65 3a 20 25 	imul   bp,WORD PTR [rbp+riz*2+0x3a],0x2520
 7be:	73 00                	jae    7c0 <.LC235>

00000000000007c0 <.LC235>:
.LC235():
 7c0:	57                   	push   rdi
 7c1:	41 52                	push   r10
 7c3:	4e                   	rex.WRX
 7c4:	49                   	rex.WB
 7c5:	4e                   	rex.WRX
 7c6:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 7c9:	73 65                	jae    830 <.LC236+0x20>
 7cb:	72 76                	jb     843 <.LC236+0x33>
 7cd:	65 72 20             	gs jb  7f0 <.LC235+0x30>
 7d0:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
 7d2:	65 73 20             	gs jae 7f5 <.LC235+0x35>
 7d5:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 7d6:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 7d7:	74 20                	je     7f9 <.LC235+0x39>
 7d9:	61                   	(bad)  
 7da:	6c                   	ins    BYTE PTR es:[rdi],dx
 7db:	6c                   	ins    BYTE PTR es:[rdi],dx
 7dc:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 7dd:	77 20                	ja     7ff <.LC235+0x3f>
 7df:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
 7e1:	77 6e                	ja     851 <.LC236+0x41>
 7e3:	6c                   	ins    BYTE PTR es:[rdi],dx
 7e4:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 7e5:	61                   	(bad)  
 7e6:	64 20 72 65          	and    BYTE PTR fs:[rdx+0x65],dh
 7ea:	64 69 72 65 63 74 69 	imul   esi,DWORD PTR fs:[rdx+0x65],0x6f697463
 7f1:	6f 
 7f2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 7f3:	20 28                	and    BYTE PTR [rax],ch
 7f5:	73 76                	jae    86d <.LC237+0xd>
 7f7:	5f                   	pop    rdi
 7f8:	61                   	(bad)  
 7f9:	6c                   	ins    BYTE PTR es:[rdi],dx
 7fa:	6c                   	ins    BYTE PTR es:[rdi],dx
 7fb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 7fc:	77 44                	ja     842 <.LC236+0x32>
 7fe:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 7ff:	77 6e                	ja     86f <.LC237+0xf>
 801:	6c                   	ins    BYTE PTR es:[rdi],dx
 802:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 803:	61                   	(bad)  
 804:	64 20 69 73          	and    BYTE PTR fs:[rcx+0x73],ch
 808:	20 25 64 29 0a 00    	and    BYTE PTR [rip+0xa2964],ah        # a3172 <noGameRestart+0x95f2a>
	...

0000000000000810 <.LC236>:
.LC236():
 810:	57                   	push   rdi
 811:	41 52                	push   r10
 813:	4e                   	rex.WRX
 814:	49                   	rex.WB
 815:	4e                   	rex.WRX
 816:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 819:	73 65                	jae    880 <.LC237+0x20>
 81b:	72 76                	jb     893 <.LC239+0xb>
 81d:	65 72 20             	gs jb  840 <.LC236+0x30>
 820:	61                   	(bad)  
 821:	6c                   	ins    BYTE PTR es:[rdi],dx
 822:	6c                   	ins    BYTE PTR es:[rdi],dx
 823:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 824:	77 73                	ja     899 <.LC239+0x11>
 826:	20 64 6f 77          	and    BYTE PTR [rdi+rbp*2+0x77],ah
 82a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 82b:	6c                   	ins    BYTE PTR es:[rdi],dx
 82c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 82d:	61                   	(bad)  
 82e:	64 20 72 65          	and    BYTE PTR fs:[rdx+0x65],dh
 832:	64 69 72 65 63 74 69 	imul   esi,DWORD PTR fs:[rdx+0x65],0x6f697463
 839:	6f 
 83a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 83b:	2c 20                	sub    al,0x20
 83d:	62                   	(bad)  
 83e:	75 74                	jne    8b4 <.LC239+0x2c>
 840:	20 64 6f 65          	and    BYTE PTR [rdi+rbp*2+0x65],ah
 844:	73 20                	jae    866 <.LC237+0x6>
 846:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 847:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 848:	74 20                	je     86a <.LC237+0xa>
 84a:	68 61 76 65 20       	push   0x20657661
 84f:	73 76                	jae    8c7 <.LC239+0x3f>
 851:	5f                   	pop    rdi
 852:	64 6c                	fs ins BYTE PTR es:[rdi],dx
 854:	55                   	push   rbp
 855:	52                   	push   rdx
 856:	4c 20 73 65          	rex.WR and BYTE PTR [rbx+0x65],r14b
 85a:	74 0a                	je     866 <.LC237+0x6>
 85c:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000860 <.LC237>:
.LC237():
 860:	57                   	push   rdi
 861:	41 52                	push   r10
 863:	4e                   	rex.WRX
 864:	49                   	rex.WB
 865:	4e                   	rex.WRX
 866:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 869:	63 6f 75             	movsxd ebp,DWORD PTR [rdi+0x75]
 86c:	6c                   	ins    BYTE PTR es:[rdi],dx
 86d:	64 20 6e 6f          	and    BYTE PTR fs:[rsi+0x6f],ch
 871:	74 20                	je     893 <.LC239+0xb>
 873:	6c                   	ins    BYTE PTR es:[rdi],dx
 874:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 875:	61                   	(bad)  
 876:	64 20 63 55          	and    BYTE PTR fs:[rbx+0x55],ah
 87a:	52                   	push   rdx
 87b:	4c 20 6c 69 62       	rex.WR and BYTE PTR [rcx+rbp*2+0x62],r13b
 880:	72 61                	jb     8e3 <.LC239+0x5b>
 882:	72 79                	jb     8fd <.LC240+0x5>
 884:	0a 00                	or     al,BYTE PTR [rax]
	...

0000000000000888 <.LC239>:
.LC239():
 888:	57                   	push   rdi
 889:	41 52                	push   r10
 88b:	4e                   	rex.WRX
 88c:	49                   	rex.WB
 88d:	4e                   	rex.WRX
 88e:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 891:	73 65                	jae    8f8 <.LC240>
 893:	72 76                	jb     90b <.LC240+0x13>
 895:	65 72 20             	gs jb  8b8 <.LC239+0x30>
 898:	61                   	(bad)  
 899:	6c                   	ins    BYTE PTR es:[rdi],dx
 89a:	6c                   	ins    BYTE PTR es:[rdi],dx
 89b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 89c:	77 73                	ja     911 <.LC240+0x19>
 89e:	20 64 6f 77          	and    BYTE PTR [rdi+rbp*2+0x77],ah
 8a2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 8a3:	6c                   	ins    BYTE PTR es:[rdi],dx
 8a4:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 8a5:	61                   	(bad)  
 8a6:	64 20 72 65          	and    BYTE PTR fs:[rdx+0x65],dh
 8aa:	64 69 72 65 63 74 69 	imul   esi,DWORD PTR fs:[rdx+0x65],0x6f697463
 8b1:	6f 
 8b2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 8b3:	2c 20                	sub    al,0x20
 8b5:	62                   	(bad)  
 8b6:	75 74                	jne    92c <.LC240+0x34>
 8b8:	20 69 74             	and    BYTE PTR [rcx+0x74],ch
 8bb:	20 64 69 73          	and    BYTE PTR [rcx+rbp*2+0x73],ah
 8bf:	61                   	(bad)  
 8c0:	62                   	(bad)  
 8c1:	6c                   	ins    BYTE PTR es:[rdi],dx
 8c2:	65 64 20 62 79       	gs and BYTE PTR fs:[rdx+0x79],ah
 8c7:	20 63 6c             	and    BYTE PTR [rbx+0x6c],ah
 8ca:	69 65 6e 74 20 63 6f 	imul   esp,DWORD PTR [rbp+0x6e],0x6f632074
 8d1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 8d2:	66 69 67 75 72 61    	imul   sp,WORD PTR [rdi+0x75],0x6172
 8d8:	74 69                	je     943 <.LC241+0x3>
 8da:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 8db:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 8dc:	20 28                	and    BYTE PTR [rax],ch
 8de:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
 8e2:	6c                   	ins    BYTE PTR es:[rdi],dx
 8e3:	6c                   	ins    BYTE PTR es:[rdi],dx
 8e4:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 8e5:	77 44                	ja     92b <.LC240+0x33>
 8e7:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 8e8:	77 6e                	ja     958 <.LC241+0x18>
 8ea:	6c                   	ins    BYTE PTR es:[rdi],dx
 8eb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 8ec:	61                   	(bad)  
 8ed:	64 20 69 73          	and    BYTE PTR fs:[rcx+0x73],ch
 8f1:	20 25 64 29 0a 00    	and    BYTE PTR [rip+0xa2964],ah        # a325b <noGameRestart+0x96013>
	...

00000000000008f8 <.LC240>:
.LC240():
 8f8:	55                   	push   rbp
 8f9:	44 50                	rex.R push rax
 8fb:	20 44 6f 77          	and    BYTE PTR [rdi+rbp*2+0x77],al
 8ff:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 900:	6c                   	ins    BYTE PTR es:[rdi],dx
 901:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 902:	61                   	(bad)  
 903:	64 73 20             	fs jae 926 <.LC240+0x2e>
 906:	61                   	(bad)  
 907:	72 65                	jb     96e <.LC241+0x2e>
 909:	20 64 69 73          	and    BYTE PTR [rcx+rbp*2+0x73],ah
 90d:	61                   	(bad)  
 90e:	62                   	(bad)  
 90f:	6c                   	ins    BYTE PTR es:[rdi],dx
 910:	65 64 20 6f 6e       	gs and BYTE PTR fs:[rdi+0x6e],ch
 915:	20 79 6f             	and    BYTE PTR [rcx+0x6f],bh
 918:	75 72                	jne    98c <.LC241+0x4c>
 91a:	20 63 6c             	and    BYTE PTR [rbx+0x6c],ah
 91d:	69 65 6e 74 2e 20 28 	imul   esp,DWORD PTR [rbp+0x6e],0x28202e74
 924:	63 6c 5f 61          	movsxd ebp,DWORD PTR [rdi+rbx*2+0x61]
 928:	6c                   	ins    BYTE PTR es:[rdi],dx
 929:	6c                   	ins    BYTE PTR es:[rdi],dx
 92a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 92b:	77 44                	ja     971 <.LC241+0x31>
 92d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 92e:	77 6e                	ja     99e <.LC249+0x6>
 930:	6c                   	ins    BYTE PTR es:[rdi],dx
 931:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 932:	61                   	(bad)  
 933:	64 20 69 73          	and    BYTE PTR fs:[rcx+0x73],ch
 937:	20 25 64 29 00 00    	and    BYTE PTR [rip+0x2964],ah        # 32a1 <CL_ServersResponsePacket.isra.17+0x61>
 93d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000940 <.LC241>:
.LC241():
 940:	2a 2a                	sub    ch,BYTE PTR [rdx]
 942:	2a 2a                	sub    ch,BYTE PTR [rdx]
 944:	2a 20                	sub    ah,BYTE PTR [rax]
 946:	43                   	rex.XB
 947:	4c 5f                	rex.WR pop rdi
 949:	42                   	rex.X
 94a:	65 67 69 6e 44 6f 77 	imul   ebp,DWORD PTR gs:[esi+0x44],0x6c6e776f
 951:	6e 6c 
 953:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 954:	61                   	(bad)  
 955:	64 20 2a             	and    BYTE PTR fs:[rdx],ch
 958:	2a 2a                	sub    ch,BYTE PTR [rdx]
 95a:	2a 2a                	sub    ch,BYTE PTR [rdx]
 95c:	0a 4c 6f 63          	or     cl,BYTE PTR [rdi+rbp*2+0x63]
 960:	61                   	(bad)  
 961:	6c                   	ins    BYTE PTR es:[rdi],dx
 962:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 963:	61                   	(bad)  
 964:	6d                   	ins    DWORD PTR es:[rdi],dx
 965:	65 3a 20             	cmp    ah,BYTE PTR gs:[rax]
 968:	25 73 0a 52 65       	and    eax,0x65520a73
 96d:	6d                   	ins    DWORD PTR es:[rdi],dx
 96e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 96f:	74 65                	je     9d6 <.LC250+0xe>
 971:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 972:	61                   	(bad)  
 973:	6d                   	ins    DWORD PTR es:[rdi],dx
 974:	65 3a 20             	cmp    ah,BYTE PTR gs:[rax]
 977:	25 73 0a 2a 2a       	and    eax,0x2a2a0a73
 97c:	2a 2a                	sub    ch,BYTE PTR [rdx]
 97e:	2a 2a                	sub    ch,BYTE PTR [rdx]
 980:	2a 2a                	sub    ch,BYTE PTR [rdx]
 982:	2a 2a                	sub    ch,BYTE PTR [rdx]
 984:	2a 2a                	sub    ch,BYTE PTR [rdx]
 986:	2a 2a                	sub    ch,BYTE PTR [rdx]
 988:	2a 2a                	sub    ch,BYTE PTR [rdx]
 98a:	2a 2a                	sub    ch,BYTE PTR [rdx]
 98c:	2a 2a                	sub    ch,BYTE PTR [rdx]
 98e:	2a 2a                	sub    ch,BYTE PTR [rdx]
 990:	2a 2a                	sub    ch,BYTE PTR [rdx]
 992:	2a 2a                	sub    ch,BYTE PTR [rdx]
 994:	2a 2a                	sub    ch,BYTE PTR [rdx]
 996:	0a 00                	or     al,BYTE PTR [rax]

0000000000000998 <.LC249>:
.LC249():
 998:	55                   	push   rbp
 999:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 99a:	77 61                	ja     9fd <.LC250+0x35>
 99c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 99d:	74 65                	je     a04 <.LC250+0x3c>
 99f:	64 20 63 68          	and    BYTE PTR fs:[rbx+0x68],ah
 9a3:	61                   	(bad)  
 9a4:	6c                   	ins    BYTE PTR es:[rdi],dx
 9a5:	6c                   	ins    BYTE PTR es:[rdi],dx
 9a6:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 9a8:	67 65 20 72 65       	and    BYTE PTR gs:[edx+0x65],dh
 9ad:	73 70                	jae    a1f <.LC250+0x57>
 9af:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 9b0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 9b1:	73 65                	jae    a18 <.LC250+0x50>
 9b3:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
 9b6:	63 65 69             	movsxd esp,DWORD PTR [rbp+0x69]
 9b9:	76 65                	jbe    a20 <.LC251>
 9bb:	64 2e 20 49 67       	fs and BYTE PTR cs:[rcx+0x67],cl
 9c0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 9c1:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 9c2:	72 65                	jb     a29 <.LC251+0x9>
 9c4:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]

00000000000009c8 <.LC250>:
.LC250():
 9c8:	5e                   	pop    rsi
 9c9:	33 57 61             	xor    edx,DWORD PTR [rdi+0x61]
 9cc:	72 6e                	jb     a3c <.LC251+0x1c>
 9ce:	69 6e 67 3a 20 53 65 	imul   ebp,DWORD PTR [rsi+0x67],0x6553203a
 9d5:	72 76                	jb     a4d <.LC251+0x2d>
 9d7:	65 72 20             	gs jb  9fa <.LC250+0x32>
 9da:	72 65                	jb     a41 <.LC251+0x21>
 9dc:	70 6f                	jo     a4d <.LC251+0x2d>
 9de:	72 74                	jb     a54 <.LC251+0x34>
 9e0:	73 20                	jae    a02 <.LC250+0x3a>
 9e2:	70 72                	jo     a56 <.LC251+0x36>
 9e4:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 9e5:	74 6f                	je     a56 <.LC251+0x36>
 9e7:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
 9ea:	20 76 65             	and    BYTE PTR [rsi+0x65],dh
 9ed:	72 73                	jb     a62 <.LC252+0x2>
 9ef:	69 6f 6e 20 25 64 2c 	imul   ebp,DWORD PTR [rdi+0x6e],0x2c642520
 9f6:	20 77 65             	and    BYTE PTR [rdi+0x65],dh
 9f9:	20 68 61             	and    BYTE PTR [rax+0x61],ch
 9fc:	76 65                	jbe    a63 <.LC252+0x3>
 9fe:	20 25 64 2e 20 54    	and    BYTE PTR [rip+0x54202e64],ah        # 54203868 <noGameRestart+0x541f6620>
 a04:	72 79                	jb     a7f <.LC252+0x1f>
 a06:	69 6e 67 20 6c 65 67 	imul   ebp,DWORD PTR [rsi+0x67],0x67656c20
 a0d:	61                   	(bad)  
 a0e:	63 79 20             	movsxd edi,DWORD PTR [rcx+0x20]
 a11:	70 72                	jo     a85 <.LC252+0x25>
 a13:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 a14:	74 6f                	je     a85 <.LC252+0x25>
 a16:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
 a19:	20 25 64 2e 0a 00    	and    BYTE PTR [rip+0xa2e64],ah        # a3883 <noGameRestart+0x9663b>
	...

0000000000000a20 <.LC251>:
.LC251():
 a20:	43 68 61 6c 6c 65    	rex.XB push 0x656c6c61
 a26:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 a27:	67 65 20 72 65       	and    BYTE PTR gs:[edx+0x65],dh
 a2c:	73 70                	jae    a9e <.LC255+0xe>
 a2e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 a2f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 a30:	73 65                	jae    a97 <.LC255+0x7>
 a32:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
 a35:	63 65 69             	movsxd esp,DWORD PTR [rbp+0x69]
 a38:	76 65                	jbe    a9f <.LC255+0xf>
 a3a:	64 20 66 72          	and    BYTE PTR fs:[rsi+0x72],ah
 a3e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 a3f:	6d                   	ins    DWORD PTR es:[rdi],dx
 a40:	20 75 6e             	and    BYTE PTR [rbp+0x6e],dh
 a43:	65 78 70             	gs js  ab6 <.LC256+0x6>
 a46:	65 63 74 65 64       	movsxd esi,DWORD PTR gs:[rbp+riz*2+0x64]
 a4b:	20 73 6f             	and    BYTE PTR [rbx+0x6f],dh
 a4e:	75 72                	jne    ac2 <.LC256+0x12>
 a50:	63 65 2e             	movsxd esp,DWORD PTR [rbp+0x2e]
 a53:	20 49 67             	and    BYTE PTR [rcx+0x67],cl
 a56:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 a57:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 a58:	72 65                	jb     abf <.LC256+0xf>
 a5a:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
	...

0000000000000a60 <.LC252>:
.LC252():
 a60:	42 61                	rex.X (bad) 
 a62:	64 20 63 68          	and    BYTE PTR fs:[rbx+0x68],ah
 a66:	61                   	(bad)  
 a67:	6c                   	ins    BYTE PTR es:[rdi],dx
 a68:	6c                   	ins    BYTE PTR es:[rdi],dx
 a69:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 a6b:	67 65 20 66 6f       	and    BYTE PTR gs:[esi+0x6f],ah
 a70:	72 20                	jb     a92 <.LC255+0x2>
 a72:	63 68 61             	movsxd ebp,DWORD PTR [rax+0x61]
 a75:	6c                   	ins    BYTE PTR es:[rdi],dx
 a76:	6c                   	ins    BYTE PTR es:[rdi],dx
 a77:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 a79:	67 65 52             	addr32 gs push rdx
 a7c:	65 73 70             	gs jae aef <.LC257+0x7>
 a7f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 a80:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 a81:	73 65                	jae    ae8 <.LC257>
 a83:	2e 20 49 67          	and    BYTE PTR cs:[rcx+0x67],cl
 a87:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 a88:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 a89:	72 65                	jb     af0 <.LC257+0x8>
 a8b:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
	...

0000000000000a90 <.LC255>:
.LC255():
 a90:	44 75 70             	rex.R jne b03 <.LC257+0x1b>
 a93:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 a96:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 a97:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 a98:	65 63 74 20 72       	movsxd esi,DWORD PTR gs:[rax+riz*1+0x72]
 a9d:	65 63 65 69          	movsxd esp,DWORD PTR gs:[rbp+0x69]
 aa1:	76 65                	jbe    b08 <.LC257+0x20>
 aa3:	64 2e 20 49 67       	fs and BYTE PTR cs:[rcx+0x67],cl
 aa8:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 aa9:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 aaa:	72 65                	jb     b11 <.LC257+0x29>
 aac:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]

0000000000000ab0 <.LC256>:
.LC256():
 ab0:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 ab3:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 ab4:	65 63 74 52 65       	movsxd esi,DWORD PTR gs:[rdx+rdx*2+0x65]
 ab9:	73 70                	jae    b2b <.LC258+0x13>
 abb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 abc:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 abd:	73 65                	jae    b24 <.LC258+0xc>
 abf:	20 70 61             	and    BYTE PTR [rax+0x61],dh
 ac2:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 ac5:	74 20                	je     ae7 <.LC256+0x37>
 ac7:	77 68                	ja     b31 <.LC258+0x19>
 ac9:	69 6c 65 20 6e 6f 74 	imul   ebp,DWORD PTR [rbp+riz*2+0x20],0x20746f6e
 ad0:	20 
 ad1:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 ad4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 ad5:	65 63 74 69 6e       	movsxd esi,DWORD PTR gs:[rcx+rbp*2+0x6e]
 ada:	67 2e 20 49 67       	and    BYTE PTR cs:[ecx+0x67],cl
 adf:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 ae0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 ae1:	72 65                	jb     b48 <.LC259+0x8>
 ae3:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
	...

0000000000000ae8 <.LC257>:
.LC257():
 ae8:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 aeb:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 aec:	65 63 74 52 65       	movsxd esi,DWORD PTR gs:[rdx+rdx*2+0x65]
 af1:	73 70                	jae    b63 <.LC259+0x23>
 af3:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 af4:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 af5:	73 65                	jae    b5c <.LC259+0x1c>
 af7:	20 66 72             	and    BYTE PTR [rsi+0x72],ah
 afa:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 afb:	6d                   	ins    DWORD PTR es:[rdi],dx
 afc:	20 77 72             	and    BYTE PTR [rdi+0x72],dh
 aff:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 b00:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b01:	67 20 61 64          	and    BYTE PTR [ecx+0x64],ah
 b05:	64 72 65             	fs jb  b6d <.LC259+0x2d>
 b08:	73 73                	jae    b7d <.LC269+0x5>
 b0a:	2e 20 49 67          	and    BYTE PTR cs:[rcx+0x67],cl
 b0e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b0f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 b10:	72 65                	jb     b77 <.LC259+0x37>
 b12:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
	...

0000000000000b18 <.LC258>:
.LC258():
 b18:	42 61                	rex.X (bad) 
 b1a:	64 20 63 6f          	and    BYTE PTR fs:[rbx+0x6f],ah
 b1e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b1f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b20:	65 63 74 52 65       	movsxd esi,DWORD PTR gs:[rdx+rdx*2+0x65]
 b25:	73 70                	jae    b97 <.LC269+0x1f>
 b27:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 b28:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b29:	73 65                	jae    b90 <.LC269+0x18>
 b2b:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
 b2e:	63 65 69             	movsxd esp,DWORD PTR [rbp+0x69]
 b31:	76 65                	jbe    b98 <.LC269+0x20>
 b33:	64 2e 20 49 67       	fs and BYTE PTR cs:[rcx+0x67],cl
 b38:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b39:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 b3a:	72 65                	jb     ba1 <.LC270+0x1>
 b3c:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]

0000000000000b40 <.LC259>:
.LC259():
 b40:	43 6f                	rex.XB outs dx,DWORD PTR ds:[rsi]
 b42:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b43:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b44:	65 63 74 52 65       	movsxd esi,DWORD PTR gs:[rdx+rdx*2+0x65]
 b49:	73 70                	jae    bbb <.LC270+0x1b>
 b4b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 b4c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b4d:	73 65                	jae    bb4 <.LC270+0x14>
 b4f:	20 77 69             	and    BYTE PTR [rdi+0x69],dh
 b52:	74 68                	je     bbc <.LC270+0x1c>
 b54:	20 62 61             	and    BYTE PTR [rdx+0x61],ah
 b57:	64 20 63 68          	and    BYTE PTR fs:[rbx+0x68],ah
 b5b:	61                   	(bad)  
 b5c:	6c                   	ins    BYTE PTR es:[rdi],dx
 b5d:	6c                   	ins    BYTE PTR es:[rdi],dx
 b5e:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 b60:	67 65 20 72 65       	and    BYTE PTR gs:[edx+0x65],dh
 b65:	63 65 69             	movsxd esp,DWORD PTR [rbp+0x69]
 b68:	76 65                	jbe    bcf <.LC276+0x7>
 b6a:	64 2e 20 49 67       	fs and BYTE PTR cs:[rcx+0x67],cl
 b6f:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b70:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 b71:	72 65                	jb     bd8 <.LC276+0x10>
 b73:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]
	...

0000000000000b78 <.LC269>:
.LC269():
 b78:	55                   	push   rbp
 b79:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b7a:	6b 6e 6f 77          	imul   ebp,DWORD PTR [rsi+0x6f],0x77
 b7e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b7f:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 b82:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b83:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b84:	65 63 74 69 6f       	movsxd esi,DWORD PTR gs:[rcx+rbp*2+0x6f]
 b89:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b8a:	6c                   	ins    BYTE PTR es:[rdi],dx
 b8b:	65 73 73             	gs jae c01 <.LC276+0x39>
 b8e:	20 70 61             	and    BYTE PTR [rax+0x61],dh
 b91:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 b94:	74 20                	je     bb6 <.LC270+0x16>
 b96:	63 6f 6d             	movsxd ebp,DWORD PTR [rdi+0x6d]
 b99:	6d                   	ins    DWORD PTR es:[rdi],dx
 b9a:	61                   	(bad)  
 b9b:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 b9c:	64 2e 0a 00          	fs or  al,BYTE PTR cs:[rax]

0000000000000ba0 <.LC270>:
.LC270():
 ba0:	25 73 3a 73 65       	and    eax,0x65733a73
 ba5:	71 75                	jno    c1c <.LC278+0x4>
 ba7:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
 ba9:	63 65 64             	movsxd esp,DWORD PTR [rbp+0x64]
 bac:	20 70 61             	and    BYTE PTR [rax+0x61],dh
 baf:	63 6b 65             	movsxd ebp,DWORD PTR [rbx+0x65]
 bb2:	74 20                	je     bd4 <.LC276+0xc>
 bb4:	77 69                	ja     c1f <.LC278+0x7>
 bb6:	74 68                	je     c20 <.LC278+0x8>
 bb8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 bb9:	75 74                	jne    c2f <.LC278+0x17>
 bbb:	20 63 6f             	and    BYTE PTR [rbx+0x6f],ah
 bbe:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 bbf:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 bc0:	65 63 74 69 6f       	movsxd esi,DWORD PTR gs:[rcx+rbp*2+0x6f]
 bc5:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 bc6:	0a 00                	or     al,BYTE PTR [rax]

0000000000000bc8 <.LC276>:
.LC276():
 bc8:	5e                   	pop    rsi
 bc9:	33 57 41             	xor    edx,DWORD PTR [rdi+0x41]
 bcc:	52                   	push   rdx
 bcd:	4e                   	rex.WRX
 bce:	49                   	rex.WB
 bcf:	4e                   	rex.WRX
 bd0:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 bd3:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 bd4:	76 65                	jbe    c3b <.LC281+0x3>
 bd6:	72 73                	jb     c4b <.LC281+0x13>
 bd8:	69 7a 65 20 75 73 65 	imul   edi,DWORD PTR [rdx+0x65],0x65737520
 bdf:	72 69                	jb     c4a <.LC281+0x12>
 be1:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 be2:	66 6f                	outs   dx,WORD PTR ds:[rsi]
 be4:	2c 20                	sub    al,0x20
 be6:	79 6f                	jns    c57 <.LC281+0x1f>
 be8:	75 20                	jne    c0a <.LC276+0x42>
 bea:	6d                   	ins    DWORD PTR es:[rdi],dx
 beb:	69 67 68 74 20 62 65 	imul   esp,DWORD PTR [rdi+0x68],0x65622074
 bf2:	20 6e 6f             	and    BYTE PTR [rsi+0x6f],ch
 bf5:	74 20                	je     c17 <.LC276+0x4f>
 bf7:	61                   	(bad)  
 bf8:	62                   	(bad)  
 bf9:	6c                   	ins    BYTE PTR es:[rdi],dx
 bfa:	65 20 74 6f 20       	and    BYTE PTR gs:[rdi+rbp*2+0x20],dh
 bff:	70 6c                	jo     c6d <.LC301+0xd>
 c01:	61                   	(bad)  
 c02:	79 20                	jns    c24 <.LC278+0xc>
 c04:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 c05:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 c06:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
 c09:	6d                   	ins    DWORD PTR es:[rdi],dx
 c0a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 c0b:	74 65                	je     c72 <.LC301+0x12>
 c0d:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
 c10:	72 76                	jb     c88 <.LC301+0x28>
 c12:	65 72 21             	gs jb  c36 <.LC278+0x1e>
 c15:	0a 00                	or     al,BYTE PTR [rax]
	...

0000000000000c18 <.LC278>:
.LC278():
 c18:	0a 53 65             	or     dl,BYTE PTR [rbx+0x65]
 c1b:	72 76                	jb     c93 <.LC301+0x33>
 c1d:	65 72 20             	gs jb  c40 <.LC281+0x8>
 c20:	63 6f 6e             	movsxd ebp,DWORD PTR [rdi+0x6e]
 c23:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 c24:	65 63 74 69 6f       	movsxd esi,DWORD PTR gs:[rcx+rbp*2+0x6f]
 c29:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 c2a:	20 74 69 6d          	and    BYTE PTR [rcx+rbp*2+0x6d],dh
 c2e:	65 64 20 6f 75       	gs and BYTE PTR fs:[rdi+0x75],ch
 c33:	74 2e                	je     c63 <.LC301+0x3>
 c35:	0a 00                	or     al,BYTE PTR [rax]
	...

0000000000000c38 <.LC281>:
.LC281():
 c38:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 c3d:	20 43 6c             	and    BYTE PTR [rbx+0x6c],al
 c40:	69 65 6e 74 20 49 6e 	imul   esp,DWORD PTR [rbp+0x6e],0x6e492074
 c47:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [rcx+rbp*2+0x61],0x617a696c
 c4e:	61 
 c4f:	74 69                	je     cba <.LC301+0x5a>
 c51:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 c52:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 c53:	20 2d 2d 2d 2d 2d    	and    BYTE PTR [rip+0x2d2d2d2d],ch        # 2d2d3986 <noGameRestart+0x2d2c673e>
 c59:	0a 00                	or     al,BYTE PTR [rax]
 c5b:	00 00                	add    BYTE PTR [rax],al
 c5d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000c60 <.LC301>:
.LC301():
 c60:	2d 70 72 65 73       	sub    eax,0x73657270
 c65:	65 74 20             	gs je  c88 <.LC301+0x28>
 c68:	6d                   	ins    DWORD PTR es:[rdi],dx
 c69:	65 64 69 75 6d 20 2d 	gs imul esi,DWORD PTR fs:[rbp+0x6d],0x72632d20
 c70:	63 72 
 c72:	66 20 32             	data16 and BYTE PTR [rdx],dh
 c75:	33 20                	xor    esp,DWORD PTR [rax]
 c77:	2d 76 63 6f 64       	sub    eax,0x646f6376
 c7c:	65 63 20             	movsxd esp,DWORD PTR gs:[rax]
 c7f:	6c                   	ins    BYTE PTR es:[rdi],dx
 c80:	69 62 78 32 36 34 20 	imul   esp,DWORD PTR [rdx+0x78],0x20343632
 c87:	2d 66 6c 61 67       	sub    eax,0x67616c66
 c8c:	73 20                	jae    cae <.LC301+0x4e>
 c8e:	2b 63 67             	sub    esp,DWORD PTR [rbx+0x67]
 c91:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 c92:	70 20                	jo     cb4 <.LC301+0x54>
 c94:	2d 70 69 78 5f       	sub    eax,0x5f786970
 c99:	66 6d                	ins    WORD PTR es:[rdi],dx
 c9b:	74 20                	je     cbd <.LC301+0x5d>
 c9d:	79 75                	jns    d14 <.LC311+0x24>
 c9f:	76 34                	jbe    cd5 <.LC301+0x75>
 ca1:	32 30                	xor    dh,BYTE PTR [rax]
 ca3:	70 20                	jo     cc5 <.LC301+0x65>
 ca5:	2d 62 66 20 32       	sub    eax,0x32206662
 caa:	20 2d 63 6f 64 65    	and    BYTE PTR [rip+0x65646f63],ch        # 65647c13 <noGameRestart+0x6563a9cb>
 cb0:	63 3a                	movsxd edi,DWORD PTR [rdx]
 cb2:	61                   	(bad)  
 cb3:	20 61 61             	and    BYTE PTR [rcx+0x61],ah
 cb6:	63 20                	movsxd esp,DWORD PTR [rax]
 cb8:	2d 73 74 72 69       	sub    eax,0x69727473
 cbd:	63 74 20 2d          	movsxd esi,DWORD PTR [rax+riz*1+0x2d]
 cc1:	32 20                	xor    ah,BYTE PTR [rax]
 cc3:	2d 62 3a 61 20       	sub    eax,0x20613a62
 cc8:	31 36                	xor    DWORD PTR [rsi],esi
 cca:	30 6b 20             	xor    BYTE PTR [rbx+0x20],ch
 ccd:	2d 72 3a 61 20       	sub    eax,0x20613a72
 cd2:	32 32                	xor    dh,BYTE PTR [rdx]
 cd4:	30 35 30 20 2d 6d    	xor    BYTE PTR [rip+0x6d2d2030],dh        # 6d2d2d0a <noGameRestart+0x6d2c5ac2>
 cda:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 cdb:	76 66                	jbe    d43 <.LC318+0x23>
 cdd:	6c                   	ins    BYTE PTR es:[rdi],dx
 cde:	61                   	(bad)  
 cdf:	67 73 20             	addr32 jae d02 <.LC311+0x12>
 ce2:	66 61                	data16 (bad) 
 ce4:	73 74                	jae    d5a <.LC321+0x12>
 ce6:	73 74                	jae    d5c <.LC321+0x14>
 ce8:	61                   	(bad)  
 ce9:	72 74                	jb     d5f <.LC321+0x17>
 ceb:	00 00                	add    BYTE PTR [rax],al
 ced:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000cf0 <.LC311>:
.LC311():
 cf0:	43 6f                	rex.XB outs dx,DWORD PTR ds:[rsi]
 cf2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 cf3:	74 72                	je     d67 <.LC321+0x1f>
 cf5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 cf6:	6c                   	ins    BYTE PTR es:[rdi],dx
 cf7:	73 20                	jae    d19 <.LC311+0x29>
 cf9:	77 68                	ja     d63 <.LC321+0x1b>
 cfb:	65 74 68             	gs je  d66 <.LC321+0x1e>
 cfe:	65 72 20             	gs jb  d21 <.LC318+0x1>
 d01:	69 6e 20 67 61 6d 65 	imul   ebp,DWORD PTR [rsi+0x20],0x656d6167
 d08:	20 76 69             	and    BYTE PTR [rsi+0x69],dh
 d0b:	64 65 6f             	fs outs dx,DWORD PTR gs:[rsi]
 d0e:	20 73 68             	and    BYTE PTR [rbx+0x68],dh
 d11:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 d12:	75 6c                	jne    d80 <.LC321+0x38>
 d14:	64 20 62 65          	and    BYTE PTR fs:[rdx+0x65],ah
 d18:	20 64 72 61          	and    BYTE PTR [rdx+rsi*2+0x61],ah
 d1c:	77 00                	ja     d1e <.LC311+0x2e>
	...

0000000000000d20 <.LC318>:
.LC318():
 d20:	68 74 74 70 3a       	push   0x3a707474
 d25:	2f                   	(bad)  
 d26:	2f                   	(bad)  
 d27:	77 73                	ja     d9c <.LC321+0x54>
 d29:	2e 71 33             	cs jno d5f <.LC321+0x17>
 d2c:	64 66 2e 6f          	fs outs dx,WORD PTR cs:[rsi]
 d30:	72 67                	jb     d99 <.LC321+0x51>
 d32:	2f                   	(bad)  
 d33:	6d                   	ins    DWORD PTR es:[rdi],dx
 d34:	61                   	(bad)  
 d35:	70 73                	jo     daa <.LC321+0x62>
 d37:	2f                   	(bad)  
 d38:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
 d3a:	77 6e                	ja     daa <.LC321+0x62>
 d3c:	6c                   	ins    BYTE PTR es:[rdi],dx
 d3d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 d3e:	61                   	(bad)  
 d3f:	64 2f                	fs (bad) 
 d41:	25 31 00 00 00       	and    eax,0x31
	...

0000000000000d48 <.LC321>:
.LC321():
 d48:	53                   	push   rbx
 d49:	61                   	(bad)  
 d4a:	76 65                	jbe    db1 <.LC321+0x69>
 d4c:	20 64 6f 77          	and    BYTE PTR [rdi+rbp*2+0x77],ah
 d50:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 d51:	6c                   	ins    BYTE PTR es:[rdi],dx
 d52:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 d53:	61                   	(bad)  
 d54:	64 73 20             	fs jae d77 <.LC321+0x2f>
 d57:	69 6e 69 74 69 61 74 	imul   ebp,DWORD PTR [rsi+0x69],0x74616974
 d5e:	65 64 20 62 79       	gs and BYTE PTR fs:[rdx+0x79],ah
 d63:	20 5c 64 6c          	and    BYTE PTR [rsp+riz*2+0x6c],bl
 d67:	6d                   	ins    DWORD PTR es:[rdi],dx
 d68:	61                   	(bad)  
 d69:	70 20                	jo     d8b <.LC321+0x43>
 d6b:	61                   	(bad)  
 d6c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 d6d:	64 20 5c 64 6f       	and    BYTE PTR fs:[rsp+riz*2+0x6f],bl
 d72:	77 6e                	ja     de2 <.LC367+0x1a>
 d74:	6c                   	ins    BYTE PTR es:[rdi],dx
 d75:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 d76:	61                   	(bad)  
 d77:	64 20 63 6f          	and    BYTE PTR fs:[rbx+0x6f],ah
 d7b:	6d                   	ins    DWORD PTR es:[rdi],dx
 d7c:	6d                   	ins    DWORD PTR es:[rdi],dx
 d7d:	61                   	(bad)  
 d7e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 d7f:	64 73 20             	fs jae da2 <.LC321+0x5a>
 d82:	69 6e 3a 0a 20 30 20 	imul   ebp,DWORD PTR [rsi+0x3a],0x2030200a
 d89:	2d 20 63 75 72       	sub    eax,0x72756320
 d8e:	72 65                	jb     df5 <.LC367+0x2d>
 d90:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 d91:	74 20                	je     db3 <.LC321+0x6b>
 d93:	67 61                	addr32 (bad) 
 d95:	6d                   	ins    DWORD PTR es:[rdi],dx
 d96:	65 20 64 69 72       	and    BYTE PTR gs:[rcx+rbp*2+0x72],ah
 d9b:	65 63 74 6f 72       	movsxd esi,DWORD PTR gs:[rdi+rbp*2+0x72]
 da0:	79 0a                	jns    dac <.LC321+0x64>
 da2:	20 31                	and    BYTE PTR [rcx],dh
 da4:	20 2d 20 66 73 5f    	and    BYTE PTR [rip+0x5f736620],ch        # 5f7373ca <noGameRestart+0x5f72a182>
 daa:	62 61                	(bad)  
 dac:	73 65                	jae    e13 <.LC368+0x1b>
 dae:	67 61                	addr32 (bad) 
 db0:	6d                   	ins    DWORD PTR es:[rdi],dx
 db1:	65 20 28             	and    BYTE PTR gs:[rax],ch
 db4:	25 73 29 20 64       	and    eax,0x64202973
 db9:	69 72 65 63 74 6f 72 	imul   esi,DWORD PTR [rdx+0x65],0x726f7463
 dc0:	79 0a                	jns    dcc <.LC367+0x4>
 dc2:	00 00                	add    BYTE PTR [rax],al
 dc4:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000dc8 <.LC367>:
.LC367():
 dc8:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 dcd:	20 43 6c             	and    BYTE PTR [rbx+0x6c],al
 dd0:	69 65 6e 74 20 49 6e 	imul   esp,DWORD PTR [rbp+0x6e],0x6e492074
 dd7:	69 74 69 61 6c 69 7a 	imul   esi,DWORD PTR [rcx+rbp*2+0x61],0x617a696c
 dde:	61 
 ddf:	74 69                	je     e4a <.LC372+0x2>
 de1:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 de2:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 de3:	20 43 6f             	and    BYTE PTR [rbx+0x6f],al
 de6:	6d                   	ins    DWORD PTR es:[rdi],dx
 de7:	70 6c                	jo     e55 <.LC372+0xd>
 de9:	65 74 65             	gs je  e51 <.LC372+0x9>
 dec:	20 2d 2d 2d 2d 2d    	and    BYTE PTR [rip+0x2d2d2d2d],ch        # 2d2d3b1f <noGameRestart+0x2d2c68d7>
 df2:	0a 00                	or     al,BYTE PTR [rax]
 df4:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000df8 <.LC368>:
.LC368():
 df8:	2d 2d 2d 2d 2d       	sub    eax,0x2d2d2d2d
 dfd:	20 43 6c             	and    BYTE PTR [rbx+0x6c],al
 e00:	69 65 6e 74 20 53 68 	imul   esp,DWORD PTR [rbp+0x6e],0x68532074
 e07:	75 74                	jne    e7d <.LC372+0x35>
 e09:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
 e0b:	77 6e                	ja     e7b <.LC372+0x33>
 e0d:	20 28                	and    BYTE PTR [rax],ch
 e0f:	25 73 29 20 2d       	and    eax,0x2d202973
 e14:	2d 2d 2d 2d 0a       	sub    eax,0xa2d2d2d
 e19:	00 00                	add    BYTE PTR [rax],al
 e1b:	00 00                	add    BYTE PTR [rax],al
 e1d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000e20 <.LC369>:
.LC369():
 e20:	57                   	push   rdi
 e21:	41 52                	push   r10
 e23:	4e                   	rex.WRX
 e24:	49                   	rex.WB
 e25:	4e                   	rex.WRX
 e26:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 e29:	52                   	push   rdx
 e2a:	65 63 75 72          	movsxd esi,DWORD PTR gs:[rbp+0x72]
 e2e:	73 69                	jae    e99 <.LC372+0x51>
 e30:	76 65                	jbe    e97 <.LC372+0x4f>
 e32:	20 43 4c             	and    BYTE PTR [rbx+0x4c],al
 e35:	5f                   	pop    rdi
 e36:	53                   	push   rbx
 e37:	68 75 74 64 6f       	push   0x6f647475
 e3c:	77 6e                	ja     eac <.LC372+0x64>
 e3e:	28 29                	sub    BYTE PTR [rcx],ch
 e40:	0a 00                	or     al,BYTE PTR [rax]
 e42:	00 00                	add    BYTE PTR [rax],al
 e44:	00 00                	add    BYTE PTR [rax],al
	...

0000000000000e48 <.LC372>:
.LC372():
 e48:	0a 57 41             	or     dl,BYTE PTR [rdi+0x41]
 e4b:	52                   	push   rdx
 e4c:	4e                   	rex.WRX
 e4d:	49                   	rex.WB
 e4e:	4e                   	rex.WRX
 e4f:	47 3a 20             	rex.RXB cmp r12b,BYTE PTR [r8]
 e52:	59                   	pop    rcx
 e53:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 e54:	75 20                	jne    e76 <.LC372+0x2e>
 e56:	61                   	(bad)  
 e57:	72 65                	jb     ebe <.LC372+0x76>
 e59:	20 6d 69             	and    BYTE PTR [rbp+0x69],ch
 e5c:	73 73                	jae    ed1 <.LC372+0x89>
 e5e:	69 6e 67 20 73 6f 6d 	imul   ebp,DWORD PTR [rsi+0x67],0x6d6f7320
 e65:	65 20 66 69          	and    BYTE PTR gs:[rsi+0x69],ah
 e69:	6c                   	ins    BYTE PTR es:[rdi],dx
 e6a:	65 73 20             	gs jae e8d <.LC372+0x45>
 e6d:	72 65                	jb     ed4 <.LC372+0x8c>
 e6f:	66 65 72 65          	data16 gs jb ed8 <.LC372+0x90>
 e73:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 e74:	63 65 64             	movsxd esp,DWORD PTR [rbp+0x64]
 e77:	20 62 79             	and    BYTE PTR [rdx+0x79],ah
 e7a:	20 74 68 65          	and    BYTE PTR [rax+rbp*2+0x65],dh
 e7e:	20 73 65             	and    BYTE PTR [rbx+0x65],dh
 e81:	72 76                	jb     ef9 <.LC372+0xb1>
 e83:	65 72 3a             	gs jb  ec0 <.LC372+0x78>
 e86:	0a 25 73 59 6f 75    	or     ah,BYTE PTR [rip+0x756f5973]        # 756f67ff <noGameRestart+0x756e95b7>
 e8c:	20 6d 69             	and    BYTE PTR [rbp+0x69],ch
 e8f:	67 68 74 20 6e 6f    	addr32 push 0x6f6e2074
 e95:	74 20                	je     eb7 <.LC372+0x6f>
 e97:	62                   	(bad)  
 e98:	65 20 61 62          	and    BYTE PTR gs:[rcx+0x62],ah
 e9c:	6c                   	ins    BYTE PTR es:[rdi],dx
 e9d:	65 20 74 6f 20       	and    BYTE PTR gs:[rdi+rbp*2+0x20],dh
 ea2:	6a 6f                	push   0x6f
 ea4:	69 6e 20 74 68 65 20 	imul   ebp,DWORD PTR [rsi+0x20],0x20656874
 eab:	67 61                	addr32 (bad) 
 ead:	6d                   	ins    DWORD PTR es:[rdi],dx
 eae:	65 0a 47 6f          	or     al,BYTE PTR gs:[rdi+0x6f]
 eb2:	20 74 6f 20          	and    BYTE PTR [rdi+rbp*2+0x20],dh
 eb6:	74 68                	je     f20 <.LC372+0xd8>
 eb8:	65 20 73 65          	and    BYTE PTR gs:[rbx+0x65],dh
 ebc:	74 74                	je     f32 <.LC372+0xea>
 ebe:	69 6e 67 20 6d 65 6e 	imul   ebp,DWORD PTR [rsi+0x67],0x6e656d20
 ec5:	75 20                	jne    ee7 <.LC372+0x9f>
 ec7:	74 6f                	je     f38 <.LC372+0xf0>
 ec9:	20 74 75 72          	and    BYTE PTR [rbp+rsi*2+0x72],dh
 ecd:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 ece:	20 6f 6e             	and    BYTE PTR [rdi+0x6e],ch
 ed1:	20 61 75             	and    BYTE PTR [rcx+0x75],ah
 ed4:	74 6f                	je     f45 <.LC372+0xfd>
 ed6:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
 ed8:	77 6e                	ja     f48 <.LC372+0x100>
 eda:	6c                   	ins    BYTE PTR es:[rdi],dx
 edb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 edc:	61                   	(bad)  
 edd:	64 2c 20             	fs sub al,0x20
 ee0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 ee1:	72 20                	jb     f03 <.LC372+0xbb>
 ee3:	67 65 74 20          	addr32 gs je f07 <.LC372+0xbf>
 ee7:	74 68                	je     f51 <.LC372+0x109>
 ee9:	65 20 66 69          	and    BYTE PTR gs:[rsi+0x69],ah
 eed:	6c                   	ins    BYTE PTR es:[rdi],dx
 eee:	65 20 65 6c          	and    BYTE PTR gs:[rbp+0x6c],ah
 ef2:	73 65                	jae    f59 <.LC372+0x111>
 ef4:	77 68                	ja     f5e <.LC372+0x116>
 ef6:	65 72 65             	gs jb  f5e <.LC372+0x116>
 ef9:	0a 0a                	or     cl,BYTE PTR [rdx]
	...

Disassembly of section .data.rel.ro.local:

0000000000000000 <cl_vidModes>:
	...
   8:	40 01 00             	rex add DWORD PTR [rax],eax
   b:	00 f0                	add    al,dh
   d:	00 00                	add    BYTE PTR [rax],al
   f:	00 00                	add    BYTE PTR [rax],al
  11:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
  1f:	00 90 01 00 00 2c    	add    BYTE PTR [rax+0x2c000001],dl
  25:	01 00                	add    DWORD PTR [rax],eax
  27:	00 00                	add    BYTE PTR [rax],al
  29:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
  37:	00 00                	add    BYTE PTR [rax],al
  39:	02 00                	add    al,BYTE PTR [rax]
  3b:	00 80 01 00 00 00    	add    BYTE PTR [rax+0x1],al
  41:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
  4f:	00 80 02 00 00 e0    	add    BYTE PTR [rax-0x1ffffffe],al
  55:	01 00                	add    DWORD PTR [rax],eax
  57:	00 00                	add    BYTE PTR [rax],al
  59:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
  67:	00 20                	add    BYTE PTR [rax],ah
  69:	03 00                	add    eax,DWORD PTR [rax]
  6b:	00 58 02             	add    BYTE PTR [rax+0x2],bl
  6e:	00 00                	add    BYTE PTR [rax],al
  70:	00 00                	add    BYTE PTR [rax],al
  72:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
  7d:	00 00                	add    BYTE PTR [rax],al
  7f:	00 c0                	add    al,al
  81:	03 00                	add    eax,DWORD PTR [rax]
  83:	00 d0                	add    al,dl
  85:	02 00                	add    al,BYTE PTR [rax]
  87:	00 00                	add    BYTE PTR [rax],al
  89:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
  97:	00 00                	add    BYTE PTR [rax],al
  99:	04 00                	add    al,0x0
  9b:	00 00                	add    BYTE PTR [rax],al
  9d:	03 00                	add    eax,DWORD PTR [rax]
  9f:	00 00                	add    BYTE PTR [rax],al
  a1:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
  af:	00 80 04 00 00 60    	add    BYTE PTR [rax+0x60000004],al
  b5:	03 00                	add    eax,DWORD PTR [rax]
  b7:	00 00                	add    BYTE PTR [rax],al
  b9:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
  c7:	00 00                	add    BYTE PTR [rax],al
  c9:	05 00 00 00 04       	add    eax,0x4000000
  ce:	00 00                	add    BYTE PTR [rax],al
  d0:	00 00                	add    BYTE PTR [rax],al
  d2:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
  dd:	00 00                	add    BYTE PTR [rax],al
  df:	00 40 06             	add    BYTE PTR [rax+0x6],al
  e2:	00 00                	add    BYTE PTR [rax],al
  e4:	b0 04                	mov    al,0x4
  e6:	00 00                	add    BYTE PTR [rax],al
  e8:	00 00                	add    BYTE PTR [rax],al
  ea:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
  f9:	08 00                	or     BYTE PTR [rax],al
  fb:	00 00                	add    BYTE PTR [rax],al
  fd:	06                   	(bad)  
  fe:	00 00                	add    BYTE PTR [rax],al
 100:	00 00                	add    BYTE PTR [rax],al
 102:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 10d:	00 00                	add    BYTE PTR [rax],al
 10f:	00 58 03             	add    BYTE PTR [rax+0x3],bl
 112:	00 00                	add    BYTE PTR [rax],al
 114:	e0 01                	loopne 117 <cl_vidModes+0x117>
 116:	00 00                	add    BYTE PTR [rax],al
 118:	00 00                	add    BYTE PTR [rax],al
 11a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 129:	05 00 00 c0 03       	add    eax,0x3c00000
 12e:	00 00                	add    BYTE PTR [rax],al
 130:	00 00                	add    BYTE PTR [rax],al
 132:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 141:	05 00 00 d0 02       	add    eax,0x2d00000
 146:	00 00                	add    BYTE PTR [rax],al
 148:	00 00                	add    BYTE PTR [rax],al
 14a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 159:	05 00 00 20 03       	add    eax,0x3200000
 15e:	00 00                	add    BYTE PTR [rax],al
 160:	00 00                	add    BYTE PTR [rax],al
 162:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 16d:	00 00                	add    BYTE PTR [rax],al
 16f:	00 56 05             	add    BYTE PTR [rsi+0x5],dl
 172:	00 00                	add    BYTE PTR [rax],al
 174:	00 03                	add    BYTE PTR [rbx],al
 176:	00 00                	add    BYTE PTR [rax],al
 178:	00 00                	add    BYTE PTR [rax],al
 17a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 185:	00 00                	add    BYTE PTR [rax],al
 187:	00 a0 05 00 00 84    	add    BYTE PTR [rax-0x7bfffffb],ah
 18d:	03 00                	add    eax,DWORD PTR [rax]
 18f:	00 00                	add    BYTE PTR [rax],al
 191:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
 19f:	00 40 06             	add    BYTE PTR [rax+0x6],al
 1a2:	00 00                	add    BYTE PTR [rax],al
 1a4:	84 03                	test   BYTE PTR [rbx],al
 1a6:	00 00                	add    BYTE PTR [rax],al
 1a8:	00 00                	add    BYTE PTR [rax],al
 1aa:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 1b5:	00 00                	add    BYTE PTR [rax],al
 1b7:	00 90 06 00 00 1a    	add    BYTE PTR [rax+0x1a000006],dl
 1bd:	04 00                	add    al,0x0
 1bf:	00 00                	add    BYTE PTR [rax],al
 1c1:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
 1cf:	00 80 07 00 00 38    	add    BYTE PTR [rax+0x38000007],al
 1d5:	04 00                	add    al,0x0
 1d7:	00 00                	add    BYTE PTR [rax],al
 1d9:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
 1e7:	00 80 07 00 00 b0    	add    BYTE PTR [rax-0x4ffffff9],al
 1ed:	04 00                	add    al,0x0
 1ef:	00 00                	add    BYTE PTR [rax],al
 1f1:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
 1ff:	00 00                	add    BYTE PTR [rax],al
 201:	0a 00                	or     al,BYTE PTR [rax]
 203:	00 38                	add    BYTE PTR [rax],bh
 205:	04 00                	add    al,0x0
 207:	00 00                	add    BYTE PTR [rax],al
 209:	00 80 3f 00 00 00    	add    BYTE PTR [rax+0x3f],al
	...
 217:	00 70 0d             	add    BYTE PTR [rax+0xd],dh
 21a:	00 00                	add    BYTE PTR [rax],al
 21c:	a0 05 00 00 00 00 80 	movabs al,ds:0x3f800000000005
 223:	3f 00 
	...
 231:	0f 00 00             	sldt   WORD PTR [rax]
 234:	70 08                	jo     23e <cl_vidModes+0x23e>
 236:	00 00                	add    BYTE PTR [rax],al
 238:	00 00                	add    BYTE PTR [rax],al
 23a:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
	...
 249:	10 00                	adc    BYTE PTR [rax],al
 24b:	00 70 08             	add    BYTE PTR [rax+0x8],dh
 24e:	00 00                	add    BYTE PTR [rax],al
 250:	00 00                	add    BYTE PTR [rax],al
 252:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
 255:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .rodata.cst4:

0000000000000000 <.LC0>:
.LC0():
   0:	00 00                	add    BYTE PTR [rax],al
   2:	80 3d      	cmp    BYTE PTR [rip+0x3f800000],0x0        # 3f800009 <noGameRestart+0x3f7f2dc1>

0000000000000004 <.LC1>:
.LC1():
   4:	00 00                	add    BYTE PTR [rax],al
   6:	80 3f              	cmp    BYTE PTR [rdi],0x0

0000000000000008 <.LC2>:
.LC2():
   8:	00 00                	add    BYTE PTR [rax],al
   a:	00 41              	add    BYTE PTR [rcx+0x0],al

000000000000000c <.LC3>:
.LC3():
   c:	00 00                	add    BYTE PTR [rax],al
   e:	80 41            	add    BYTE PTR [rcx+0x17],0xb7

0000000000000010 <.LC271>:
.LC271():
  10:	17                   	(bad)  
  11:	b7 d1                	mov    bh,0xd1
  13:	38                 	cmp    BYTE PTR [rax],al

0000000000000014 <.LC272>:
.LC272():
  14:	00 00                	add    BYTE PTR [rax],al
  16:	7a 44                	jp     5c <.LC10+0xc>

0000000000000018 <.LC275>:
.LC275():
  18:	00 00                	add    BYTE PTR [rax],al
  1a:	80 3e              	cmp    BYTE PTR [rsi],0x0

000000000000001c <.LC280>:
.LC280():
  1c:	00 00                	add    BYTE PTR [rax],al
  1e:	f0                   	lock
  1f:	43                   	rex.XB

Disassembly of section .rodata.cst8:

0000000000000000 <.LC185>:
.LC185():
   0:	11 11                	adc    DWORD PTR [rcx],edx
   2:	11 11                	adc    DWORD PTR [rcx],edx
   4:	11 11                	adc    DWORD PTR [rcx],edx
   6:	61                   	(bad)  
   7:	3f                   	(bad)  

0000000000000008 <.LC186>:
.LC186():
   8:	55                   	push   rbp
   9:	55                   	push   rbp
   a:	55                   	push   rbp
   b:	55                   	push   rbp
   c:	55                   	push   rbp
   d:	55                   	push   rbp
   e:	f5                   	cmc    
   f:	3f                   	(bad)  

0000000000000010 <.LC187>:
.LC187():
  10:	00 00                	add    BYTE PTR [rax],al
  12:	00 00                	add    BYTE PTR [rax],al
  14:	00 00                	add    BYTE PTR [rax],al
  16:	e0 3f                	loopne 57 <.LC10+0x7>

0000000000000018 <.LC188>:
.LC188():
  18:	9a                   	(bad)  
  19:	99                   	cdq    
  1a:	99                   	cdq    
  1b:	99                   	cdq    
  1c:	99                   	cdq    
  1d:	99                   	cdq    
  1e:	59                   	pop    rcx
  1f:	3f                   	(bad)  

0000000000000020 <.LC189>:
.LC189():
  20:	00 00                	add    BYTE PTR [rax],al
  22:	00 00                	add    BYTE PTR [rax],al
  24:	00 00                	add    BYTE PTR [rax],al
  26:	e8 3f          	call   6a <.LC14>

0000000000000028 <.LC208>:
.LC208():
  28:	00 00                	add    BYTE PTR [rax],al
  2a:	00 00                	add    BYTE PTR [rax],al
  2c:	00 40 8f             	add    BYTE PTR [rax-0x71],al
  2f:	40                   	rex

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	00 47 43             	add    BYTE PTR [rdi+0x43],al
   3:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
   6:	28 44 65 62          	sub    BYTE PTR [rbp+riz*2+0x62],al
   a:	69 61 6e 20 38 2e 33 	imul   esp,DWORD PTR [rcx+0x6e],0x332e3820
  11:	2e 30 2d 36 29 20 38 	xor    BYTE PTR cs:[rip+0x38202936],ch        # 3820294e <noGameRestart+0x381f5706>
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
  13:	08 90 01 00 00 10    	or     BYTE PTR [rax+0x10000001],dl
  19:	00 00                	add    BYTE PTR [rax],al
  1b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
  1e:	00 00                	add    BYTE PTR [rax],al
  20:	00 00                	add    BYTE PTR [rax],al
  22:	00 00                	add    BYTE PTR [rax],al
  24:	07                   	(bad)  
  25:	00 00                	add    BYTE PTR [rax],al
  27:	00 00                	add    BYTE PTR [rax],al
  29:	00 00                	add    BYTE PTR [rax],al
  2b:	00 10                	add    BYTE PTR [rax],dl
  2d:	00 00                	add    BYTE PTR [rax],al
  2f:	00 30                	add    BYTE PTR [rax],dh
  31:	00 00                	add    BYTE PTR [rax],al
  33:	00 00                	add    BYTE PTR [rax],al
  35:	00 00                	add    BYTE PTR [rax],al
  37:	00 7a 00             	add    BYTE PTR [rdx+0x0],bh
  3a:	00 00                	add    BYTE PTR [rax],al
  3c:	00 00                	add    BYTE PTR [rax],al
  3e:	00 00                	add    BYTE PTR [rax],al
  40:	50                   	push   rax
  41:	00 00                	add    BYTE PTR [rax],al
  43:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
  47:	00 00                	add    BYTE PTR [rax],al
  49:	00 00                	add    BYTE PTR [rax],al
  4b:	00 98 01 00 00 00    	add    BYTE PTR [rax+0x1],bl
  51:	42 0e                	rex.X (bad) 
  53:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
  59:	8d 03                	lea    eax,[rbx]
  5b:	42 0e                	rex.X (bad) 
  5d:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
  64:	05 41 0e 30 83       	add    eax,0x83300e41
  69:	06                   	(bad)  
  6a:	47 0e                	rex.RXB (bad) 
  6c:	c0 40 74 0a          	rol    BYTE PTR [rax+0x74],0xa
  70:	0e                   	(bad)  
  71:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
  74:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
  77:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
  7a:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
  7d:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
  80:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
  83:	02 e7                	add    ah,bh
  85:	0e                   	(bad)  
  86:	c8 40 4e 0e          	enter  0x4e40,0xe
  8a:	d0 40 58             	rol    BYTE PTR [rax+0x58],1
  8d:	0e                   	(bad)  
  8e:	c8 40 41 0e          	enter  0x4140,0xe
  92:	c0 40 28 00          	rol    BYTE PTR [rax+0x28],0x0
  96:	00 00                	add    BYTE PTR [rax],al
  98:	98                   	cwde   
  99:	00 00                	add    BYTE PTR [rax],al
  9b:	00 00                	add    BYTE PTR [rax],al
  9d:	00 00                	add    BYTE PTR [rax],al
  9f:	00 58 00             	add    BYTE PTR [rax+0x0],bl
  a2:	00 00                	add    BYTE PTR [rax],al
  a4:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
  a7:	10 8c 02 4a 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1b6],cl
  ae:	03 48 0e             	add    ecx,DWORD PTR [rax+0xe]
  b1:	20 83 04 73 0e 18    	and    BYTE PTR [rbx+0x180e7304],al
  b7:	48 0e                	rex.W (bad) 
  b9:	10 44 0e 08          	adc    BYTE PTR [rsi+rcx*1+0x8],al
  bd:	00 00                	add    BYTE PTR [rax],al
  bf:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
  c2:	00 00                	add    BYTE PTR [rax],al
  c4:	c4                   	(bad)  
  c5:	00 00                	add    BYTE PTR [rax],al
  c7:	00 00                	add    BYTE PTR [rax],al
  c9:	00 00                	add    BYTE PTR [rax],al
  cb:	00 26                	add    BYTE PTR [rsi],ah
  cd:	00 00                	add    BYTE PTR [rax],al
  cf:	00 00                	add    BYTE PTR [rax],al
  d1:	44 0e                	rex.R (bad) 
  d3:	10 5d 0e             	adc    BYTE PTR [rbp+0xe],bl
  d6:	08 00                	or     BYTE PTR [rax],al
  d8:	28 00                	sub    BYTE PTR [rax],al
  da:	00 00                	add    BYTE PTR [rax],al
  dc:	dc 00                	fadd   QWORD PTR [rax]
  de:	00 00                	add    BYTE PTR [rax],al
  e0:	00 00                	add    BYTE PTR [rax],al
  e2:	00 00                	add    BYTE PTR [rax],al
  e4:	88 00                	mov    BYTE PTR [rax],al
  e6:	00 00                	add    BYTE PTR [rax],al
  e8:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
  eb:	10 8c 02 47 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1b9],cl
  f2:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
  f5:	20 83 04 02 74 0e    	and    BYTE PTR [rbx+0xe740204],al
  fb:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
  fe:	10 48 0e             	adc    BYTE PTR [rax+0xe],cl
 101:	08 00                	or     BYTE PTR [rax],al
 103:	00 44 00 00          	add    BYTE PTR [rax+rax*1+0x0],al
 107:	00 08                	add    BYTE PTR [rax],cl
 109:	01 00                	add    DWORD PTR [rax],eax
 10b:	00 00                	add    BYTE PTR [rax],al
 10d:	00 00                	add    BYTE PTR [rax],al
 10f:	00 f1                	add    cl,dh
 111:	01 00                	add    DWORD PTR [rax],eax
 113:	00 00                	add    BYTE PTR [rax],al
 115:	42 0e                	rex.X (bad) 
 117:	10 8e 02 47 0e 18    	adc    BYTE PTR [rsi+0x180e4702],cl
 11d:	8d 03                	lea    eax,[rbx]
 11f:	42 0e                	rex.X (bad) 
 121:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
 128:	05 41 0e 30 83       	add    eax,0x83300e41
 12d:	06                   	(bad)  
 12e:	49 0e                	rex.WB (bad) 
 130:	d0 82 01 03 ba 01    	rol    BYTE PTR [rdx+0x1ba0301],1
 136:	0a 0e                	or     cl,BYTE PTR [rsi]
 138:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 13b:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 13e:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 141:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 144:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 147:	08 41 0b             	or     BYTE PTR [rcx+0xb],al
 14a:	00 00                	add    BYTE PTR [rax],al
 14c:	1c 00                	sbb    al,0x0
 14e:	00 00                	add    BYTE PTR [rax],al
 150:	50                   	push   rax
 151:	01 00                	add    DWORD PTR [rax],eax
 153:	00 00                	add    BYTE PTR [rax],al
 155:	00 00                	add    BYTE PTR [rax],al
 157:	00 77 00             	add    BYTE PTR [rdi+0x0],dh
 15a:	00 00                	add    BYTE PTR [rax],al
 15c:	00 48 0e             	add    BYTE PTR [rax+0xe],cl
 15f:	10 83 02 02 63 0a    	adc    BYTE PTR [rbx+0xa630202],al
 165:	0e                   	(bad)  
 166:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 169:	00 00                	add    BYTE PTR [rax],al
 16b:	00 60 00             	add    BYTE PTR [rax+0x0],ah
 16e:	00 00                	add    BYTE PTR [rax],al
 170:	70 01                	jo     173 <.eh_frame+0x173>
 172:	00 00                	add    BYTE PTR [rax],al
 174:	00 00                	add    BYTE PTR [rax],al
 176:	00 00                	add    BYTE PTR [rax],al
 178:	af                   	scas   eax,DWORD PTR es:[rdi]
 179:	04 00                	add    al,0x0
 17b:	00 00                	add    BYTE PTR [rax],al
 17d:	7e 0e                	jle    18d <.eh_frame+0x18d>
 17f:	10 8c 02 41 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bf],cl
 186:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
 189:	20 83 04 47 0e b0    	and    BYTE PTR [rbx-0x4ff1b8fc],al
 18f:	18 03                	sbb    BYTE PTR [rbx],al
 191:	a6                   	cmps   BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
 192:	01 0e                	add    DWORD PTR [rsi],ecx
 194:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 197:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 19a:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 19d:	08 47 c3             	or     BYTE PTR [rdi-0x3d],al
 1a0:	c6                   	(bad)  
 1a1:	cc                   	int3   
 1a2:	48 0e                	rex.W (bad) 
 1a4:	b0 18                	mov    al,0x18
 1a6:	83 04 86 03          	add    DWORD PTR [rsi+rax*4],0x3
 1aa:	8c 02                	mov    WORD PTR [rdx],es
 1ac:	02 46 0a             	add    al,BYTE PTR [rsi+0xa]
 1af:	0e                   	(bad)  
 1b0:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 1b3:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 1b6:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 1b9:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 1bc:	03 2c 02             	add    ebp,DWORD PTR [rdx+rax*1]
 1bf:	0e                   	(bad)  
 1c0:	b8 18 41 0e c0       	mov    eax,0xc00e4118
 1c5:	18 50 0e             	sbb    BYTE PTR [rax+0xe],dl
 1c8:	b8 18 42 0e b0       	mov    eax,0xb00e4218
 1cd:	18 00                	sbb    BYTE PTR [rax],al
 1cf:	00 10                	add    BYTE PTR [rax],dl
 1d1:	00 00                	add    BYTE PTR [rax],al
 1d3:	00 d4                	add    ah,dl
 1d5:	01 00                	add    DWORD PTR [rax],eax
 1d7:	00 00                	add    BYTE PTR [rax],al
 1d9:	00 00                	add    BYTE PTR [rax],al
 1db:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 1e1 <.eh_frame+0x1e1>
 1e1:	00 00                	add    BYTE PTR [rax],al
 1e3:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
 1e6:	00 00                	add    BYTE PTR [rax],al
 1e8:	e8 01 00 00 00       	call   1ee <.eh_frame+0x1ee>
 1ed:	00 00                	add    BYTE PTR [rax],al
 1ef:	00 2d 00 00 00 00    	add    BYTE PTR [rip+0x0],ch        # 1f5 <.eh_frame+0x1f5>
 1f5:	44 0e                	rex.R (bad) 
 1f7:	10 61 0e             	adc    BYTE PTR [rcx+0xe],ah
 1fa:	08 00                	or     BYTE PTR [rax],al
 1fc:	14 00                	adc    al,0x0
 1fe:	00 00                	add    BYTE PTR [rax],al
 200:	00 02                	add    BYTE PTR [rdx],al
 202:	00 00                	add    BYTE PTR [rax],al
 204:	00 00                	add    BYTE PTR [rax],al
 206:	00 00                	add    BYTE PTR [rax],al
 208:	1e                   	(bad)  
 209:	00 00                	add    BYTE PTR [rax],al
 20b:	00 00                	add    BYTE PTR [rax],al
 20d:	44 0e                	rex.R (bad) 
 20f:	10 50 0e             	adc    BYTE PTR [rax+0xe],dl
 212:	08 00                	or     BYTE PTR [rax],al
 214:	2c 00                	sub    al,0x0
 216:	00 00                	add    BYTE PTR [rax],al
 218:	18 02                	sbb    BYTE PTR [rdx],al
 21a:	00 00                	add    BYTE PTR [rax],al
 21c:	00 00                	add    BYTE PTR [rax],al
 21e:	00 00                	add    BYTE PTR [rax],al
 220:	d1 01                	rol    DWORD PTR [rcx],1
 222:	00 00                	add    BYTE PTR [rax],al
 224:	00 4b 0e             	add    BYTE PTR [rbx+0xe],cl
 227:	10 8c 02 44 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bc],cl
 22e:	03 44 0e 20          	add    eax,DWORD PTR [rsi+rcx*1+0x20]
 232:	83 04 03 b8          	add    DWORD PTR [rbx+rax*1],0xffffffb8
 236:	01 0e                	add    DWORD PTR [rsi],ecx
 238:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 23b:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 23e:	08 42 c3             	or     BYTE PTR [rdx-0x3d],al
 241:	c6                   	(bad)  
 242:	cc                   	int3   
 243:	00 48 00             	add    BYTE PTR [rax+0x0],cl
 246:	00 00                	add    BYTE PTR [rax],al
 248:	48 02 00             	rex.W add al,BYTE PTR [rax]
 24b:	00 00                	add    BYTE PTR [rax],al
 24d:	00 00                	add    BYTE PTR [rax],al
 24f:	00 4c 04 00          	add    BYTE PTR [rsp+rax*1+0x0],cl
 253:	00 00                	add    BYTE PTR [rax],al
 255:	42 0e                	rex.X (bad) 
 257:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
 25d:	8e 03                	mov    es,WORD PTR [rbx]
 25f:	45 0e                	rex.RB (bad) 
 261:	20 8d 04 45 0e 28    	and    BYTE PTR [rbp+0x280e4504],cl
 267:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff863010ae <noGameRestart+0xffffffff862f3e66>
 26d:	06                   	(bad)  
 26e:	48 0e                	rex.W (bad) 
 270:	38 83 07 49 0e d0    	cmp    BYTE PTR [rbx-0x2ff1b6f9],al
 276:	09 77 0a             	or     DWORD PTR [rdi+0xa],esi
 279:	0e                   	(bad)  
 27a:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
 27d:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 280:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 283:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 286:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 289:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 28c:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 28f:	00 24 00             	add    BYTE PTR [rax+rax*1],ah
 292:	00 00                	add    BYTE PTR [rax],al
 294:	94                   	xchg   esp,eax
 295:	02 00                	add    al,BYTE PTR [rax]
 297:	00 00                	add    BYTE PTR [rax],al
 299:	00 00                	add    BYTE PTR [rax],al
 29b:	00 4c 08 00          	add    BYTE PTR [rax+rcx*1+0x0],cl
 29f:	00 00                	add    BYTE PTR [rax],al
 2a1:	41 0e                	rex.B (bad) 
 2a3:	10 83 02 5a 0e d0    	adc    BYTE PTR [rbx-0x2ff1a5fe],al
 2a9:	23 03                	and    eax,DWORD PTR [rbx]
 2ab:	9c                   	pushf  
 2ac:	07                   	(bad)  
 2ad:	0a 0e                	or     cl,BYTE PTR [rsi]
 2af:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 2b2:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
 2b5:	00 00                	add    BYTE PTR [rax],al
 2b7:	00 10                	add    BYTE PTR [rax],dl
 2b9:	00 00                	add    BYTE PTR [rax],al
 2bb:	00 bc 02 00 00 00 00 	add    BYTE PTR [rdx+rax*1+0x0],bh
 2c2:	00 00                	add    BYTE PTR [rax],al
 2c4:	0a 00                	or     al,BYTE PTR [rax]
 2c6:	00 00                	add    BYTE PTR [rax],al
 2c8:	00 00                	add    BYTE PTR [rax],al
 2ca:	00 00                	add    BYTE PTR [rax],al
 2cc:	10 00                	adc    BYTE PTR [rax],al
 2ce:	00 00                	add    BYTE PTR [rax],al
 2d0:	d0 02                	rol    BYTE PTR [rdx],1
 2d2:	00 00                	add    BYTE PTR [rax],al
 2d4:	00 00                	add    BYTE PTR [rax],al
 2d6:	00 00                	add    BYTE PTR [rax],al
 2d8:	0a 00                	or     al,BYTE PTR [rax]
 2da:	00 00                	add    BYTE PTR [rax],al
 2dc:	00 00                	add    BYTE PTR [rax],al
 2de:	00 00                	add    BYTE PTR [rax],al
 2e0:	40 00 00             	add    BYTE PTR [rax],al
 2e3:	00 e4                	add    ah,ah
 2e5:	02 00                	add    al,BYTE PTR [rax]
 2e7:	00 00                	add    BYTE PTR [rax],al
 2e9:	00 00                	add    BYTE PTR [rax],al
 2eb:	00 1b                	add    BYTE PTR [rbx],bl
 2ed:	01 00                	add    DWORD PTR [rax],eax
 2ef:	00 00                	add    BYTE PTR [rax],al
 2f1:	41 0e                	rex.B (bad) 
 2f3:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
 2f9:	83 03 49             	add    DWORD PTR [rbx],0x49
 2fc:	0e                   	(bad)  
 2fd:	f0 41 02 cf          	lock add cl,r15b
 301:	0a 0e                	or     cl,BYTE PTR [rsi]
 303:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 306:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 309:	08 44 0b 55          	or     BYTE PTR [rbx+rcx*1+0x55],al
 30d:	0a 0e                	or     cl,BYTE PTR [rsi]
 30f:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 312:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 315:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 318:	4c 0a 0e             	rex.WR or r9b,BYTE PTR [rsi]
 31b:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 31e:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 321:	08 42 0b             	or     BYTE PTR [rdx+0xb],al
 324:	6c                   	ins    BYTE PTR es:[rdi],dx
 325:	00 00                	add    BYTE PTR [rax],al
 327:	00 28                	add    BYTE PTR [rax],ch
 329:	03 00                	add    eax,DWORD PTR [rax]
 32b:	00 00                	add    BYTE PTR [rax],al
 32d:	00 00                	add    BYTE PTR [rax],al
 32f:	00 20                	add    BYTE PTR [rax],ah
 331:	02 00                	add    al,BYTE PTR [rax]
 333:	00 00                	add    BYTE PTR [rax],al
 335:	42 0e                	rex.X (bad) 
 337:	10 8e 02 44 0e 18    	adc    BYTE PTR [rsi+0x180e4402],cl
 33d:	8d 03                	lea    eax,[rbx]
 33f:	42 0e                	rex.X (bad) 
 341:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
 348:	05 41 0e 30 83       	add    eax,0x83300e41
 34d:	06                   	(bad)  
 34e:	47 0e                	rex.RXB (bad) 
 350:	b0 20                	mov    al,0x20
 352:	02 fa                	add    bh,dl
 354:	0a 0e                	or     cl,BYTE PTR [rsi]
 356:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 359:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 35c:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 35f:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 362:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 365:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 368:	02 a5 0a 0e 30 41    	add    ah,BYTE PTR [rbp+0x41300e0a]
 36e:	0e                   	(bad)  
 36f:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 372:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 375:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 378:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 37b:	08 4b 0b             	or     BYTE PTR [rbx+0xb],cl
 37e:	55                   	push   rbp
 37f:	0a 0e                	or     cl,BYTE PTR [rsi]
 381:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 384:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 387:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 38a:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 38d:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 390:	08 41 0b             	or     BYTE PTR [rcx+0xb],al
 393:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
 396:	00 00                	add    BYTE PTR [rax],al
 398:	98                   	cwde   
 399:	03 00                	add    eax,DWORD PTR [rax]
 39b:	00 00                	add    BYTE PTR [rax],al
 39d:	00 00                	add    BYTE PTR [rax],al
 39f:	00 2e                	add    BYTE PTR [rsi],ch
 3a1:	00 00                	add    BYTE PTR [rax],al
 3a3:	00 00                	add    BYTE PTR [rax],al
 3a5:	41 0e                	rex.B (bad) 
 3a7:	10 83 02 4c 0a 0e    	adc    BYTE PTR [rbx+0xe0a4c02],al
 3ad:	08 43 0b             	or     BYTE PTR [rbx+0xb],al
 3b0:	59                   	pop    rcx
 3b1:	0e                   	(bad)  
 3b2:	08 00                	or     BYTE PTR [rax],al
 3b4:	1c 00                	sbb    al,0x0
 3b6:	00 00                	add    BYTE PTR [rax],al
 3b8:	b8 03 00 00 00       	mov    eax,0x3
 3bd:	00 00                	add    BYTE PTR [rax],al
 3bf:	00 2e                	add    BYTE PTR [rsi],ch
 3c1:	00 00                	add    BYTE PTR [rax],al
 3c3:	00 00                	add    BYTE PTR [rax],al
 3c5:	41 0e                	rex.B (bad) 
 3c7:	10 83 02 4c 0a 0e    	adc    BYTE PTR [rbx+0xe0a4c02],al
 3cd:	08 43 0b             	or     BYTE PTR [rbx+0xb],al
 3d0:	59                   	pop    rcx
 3d1:	0e                   	(bad)  
 3d2:	08 00                	or     BYTE PTR [rax],al
 3d4:	14 00                	adc    al,0x0
 3d6:	00 00                	add    BYTE PTR [rax],al
 3d8:	d8 03                	fadd   DWORD PTR [rbx]
 3da:	00 00                	add    BYTE PTR [rax],al
 3dc:	00 00                	add    BYTE PTR [rax],al
 3de:	00 00                	add    BYTE PTR [rax],al
 3e0:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 3e1:	00 00                	add    BYTE PTR [rax],al
 3e3:	00 00                	add    BYTE PTR [rax],al
 3e5:	44 0e                	rex.R (bad) 
 3e7:	10 02                	adc    BYTE PTR [rdx],al
 3e9:	66 0e                	data16 (bad) 
 3eb:	08 14 00             	or     BYTE PTR [rax+rax*1],dl
 3ee:	00 00                	add    BYTE PTR [rax],al
 3f0:	f0 03 00             	lock add eax,DWORD PTR [rax]
 3f3:	00 00                	add    BYTE PTR [rax],al
 3f5:	00 00                	add    BYTE PTR [rax],al
 3f7:	00 1e                	add    BYTE PTR [rsi],bl
 3f9:	00 00                	add    BYTE PTR [rax],al
 3fb:	00 00                	add    BYTE PTR [rax],al
 3fd:	44 0e                	rex.R (bad) 
 3ff:	10 50 0e             	adc    BYTE PTR [rax+0xe],dl
 402:	08 00                	or     BYTE PTR [rax],al
 404:	10 00                	adc    BYTE PTR [rax],al
 406:	00 00                	add    BYTE PTR [rax],al
 408:	08 04 00             	or     BYTE PTR [rax+rax*1],al
 40b:	00 00                	add    BYTE PTR [rax],al
 40d:	00 00                	add    BYTE PTR [rax],al
 40f:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 415 <.eh_frame+0x415>
 415:	00 00                	add    BYTE PTR [rax],al
 417:	00 34 00             	add    BYTE PTR [rax+rax*1],dh
 41a:	00 00                	add    BYTE PTR [rax],al
 41c:	1c 04                	sbb    al,0x4
 41e:	00 00                	add    BYTE PTR [rax],al
 420:	00 00                	add    BYTE PTR [rax],al
 422:	00 00                	add    BYTE PTR [rax],al
 424:	02 01                	add    al,BYTE PTR [rcx]
 426:	00 00                	add    BYTE PTR [rax],al
 428:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
 42b:	10 8d 02 4b 0e 18    	adc    BYTE PTR [rbp+0x180e4b02],cl
 431:	8c 03                	mov    WORD PTR [rbx],es
 433:	41 0e                	rex.B (bad) 
 435:	20 86 04 41 0e 28    	and    BYTE PTR [rsi+0x280e4104],al
 43b:	83 05 44 0e 50 02 e8 	add    DWORD PTR [rip+0x2500e44],0xffffffe8        # 2501286 <noGameRestart+0x24f403e>
 442:	0e                   	(bad)  
 443:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 446:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 449:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 44c:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 44f:	08 40 00             	or     BYTE PTR [rax+0x0],al
 452:	00 00                	add    BYTE PTR [rax],al
 454:	54                   	push   rsp
 455:	04 00                	add    al,0x0
 457:	00 00                	add    BYTE PTR [rax],al
 459:	00 00                	add    BYTE PTR [rax],al
 45b:	00 dc                	add    ah,bl
 45d:	02 00                	add    al,BYTE PTR [rax]
 45f:	00 00                	add    BYTE PTR [rax],al
 461:	42 0e                	rex.X (bad) 
 463:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
 469:	8d 03                	lea    eax,[rbx]
 46b:	42 0e                	rex.X (bad) 
 46d:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
 474:	05 41 0e 30 83       	add    eax,0x83300e41
 479:	06                   	(bad)  
 47a:	47 0e                	rex.RXB (bad) 
 47c:	d0 08                	ror    BYTE PTR [rax],1
 47e:	02 44 0a 0e          	add    al,BYTE PTR [rdx+rcx*1+0xe]
 482:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 485:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 488:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 48b:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 48e:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 491:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 494:	30 00                	xor    BYTE PTR [rax],al
 496:	00 00                	add    BYTE PTR [rax],al
 498:	98                   	cwde   
 499:	04 00                	add    al,0x0
 49b:	00 00                	add    BYTE PTR [rax],al
 49d:	00 00                	add    BYTE PTR [rax],al
 49f:	00 69 00             	add    BYTE PTR [rcx+0x0],ch
 4a2:	00 00                	add    BYTE PTR [rax],al
 4a4:	00 51 0e             	add    BYTE PTR [rcx+0xe],dl
 4a7:	10 86 02 49 0e 18    	adc    BYTE PTR [rsi+0x180e4902],al
 4ad:	83 03 53             	add    DWORD PTR [rbx],0x53
 4b0:	0e                   	(bad)  
 4b1:	20 67 0a             	and    BYTE PTR [rdi+0xa],ah
 4b4:	0e                   	(bad)  
 4b5:	18 44 0e 10          	sbb    BYTE PTR [rsi+rcx*1+0x10],al
 4b9:	41 0e                	rex.B (bad) 
 4bb:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 4be:	44 0e                	rex.R (bad) 
 4c0:	18 43 0e             	sbb    BYTE PTR [rbx+0xe],al
 4c3:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 4c6:	08 00                	or     BYTE PTR [rax],al
 4c8:	44 00 00             	add    BYTE PTR [rax],r8b
 4cb:	00 cc                	add    ah,cl
 4cd:	04 00                	add    al,0x0
 4cf:	00 00                	add    BYTE PTR [rax],al
 4d1:	00 00                	add    BYTE PTR [rax],al
 4d3:	00 c6                	add    dh,al
 4d5:	00 00                	add    BYTE PTR [rax],al
 4d7:	00 00                	add    BYTE PTR [rax],al
 4d9:	42 0e                	rex.X (bad) 
 4db:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
 4e1:	8e 03                	mov    es,WORD PTR [rbx]
 4e3:	42 0e                	rex.X (bad) 
 4e5:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
 4eb:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff86301332 <noGameRestart+0xffffffff862f40ea>
 4f1:	06                   	(bad)  
 4f2:	41 0e                	rex.B (bad) 
 4f4:	38 83 07 44 0e 40    	cmp    BYTE PTR [rbx+0x400e4407],al
 4fa:	02 ab 0e 38 43 0e    	add    ch,BYTE PTR [rbx+0xe43380e]
 500:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 503:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 506:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 509:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 50c:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 50f:	08 64 00 00          	or     BYTE PTR [rax+rax*1+0x0],ah
 513:	00 14 05 00 00 00 00 	add    BYTE PTR [rax*1+0x0],dl
 51a:	00 00                	add    BYTE PTR [rax],al
 51c:	e6 02                	out    0x2,al
 51e:	00 00                	add    BYTE PTR [rax],al
 520:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
 523:	10 8c 02 41 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bf],cl
 52a:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
 52d:	20 83 04 47 0e e0    	and    BYTE PTR [rbx-0x1ff1b8fc],al
 533:	40 7a 0a             	rex jp 540 <.eh_frame+0x540>
 536:	0e                   	(bad)  
 537:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 53a:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 53d:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 540:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 543:	7c 0e                	jl     553 <.eh_frame+0x553>
 545:	e8 40 5a 0e f0       	call   fffffffff00e5f8a <noGameRestart+0xfffffffff00d8d42>
 54a:	40                   	rex
 54b:	45 0e                	rex.RB (bad) 
 54d:	f8                   	clc    
 54e:	40                   	rex
 54f:	45 0e                	rex.RB (bad) 
 551:	80 41 58 0e          	add    BYTE PTR [rcx+0x58],0xe
 555:	e0 40                	loopne 597 <.eh_frame+0x597>
 557:	02 b5 0a 0e 20 41    	add    dh,BYTE PTR [rbp+0x41200e0a]
 55d:	0e                   	(bad)  
 55e:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 561:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 564:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 567:	7d 0a                	jge    573 <.eh_frame+0x573>
 569:	0e                   	(bad)  
 56a:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 56d:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 570:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 573:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 576:	00 00                	add    BYTE PTR [rax],al
 578:	2c 00                	sub    al,0x0
 57a:	00 00                	add    BYTE PTR [rax],al
 57c:	7c 05                	jl     583 <.eh_frame+0x583>
 57e:	00 00                	add    BYTE PTR [rax],al
 580:	00 00                	add    BYTE PTR [rax],al
 582:	00 00                	add    BYTE PTR [rax],al
 584:	5c                   	pop    rsp
 585:	00 00                	add    BYTE PTR [rax],al
 587:	00 00                	add    BYTE PTR [rax],al
 589:	4b 0e                	rex.WXB (bad) 
 58b:	10 8c 02 41 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bf],cl
 592:	03 48 0e             	add    ecx,DWORD PTR [rax+0xe]
 595:	20 83 04 76 0e 18    	and    BYTE PTR [rbx+0x180e7604],al
 59b:	41 0e                	rex.B (bad) 
 59d:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 5a0:	08 41 c3             	or     BYTE PTR [rcx-0x3d],al
 5a3:	c6                   	(bad)  
 5a4:	cc                   	int3   
 5a5:	00 00                	add    BYTE PTR [rax],al
 5a7:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
 5aa:	00 00                	add    BYTE PTR [rax],al
 5ac:	ac                   	lods   al,BYTE PTR ds:[rsi]
 5ad:	05 00 00 00 00       	add    eax,0x0
 5b2:	00 00                	add    BYTE PTR [rax],al
 5b4:	6d                   	ins    DWORD PTR es:[rdi],dx
 5b5:	00 00                	add    BYTE PTR [rax],al
 5b7:	00 00                	add    BYTE PTR [rax],al
 5b9:	5c                   	pop    rsp
 5ba:	0e                   	(bad)  
 5bb:	10 02                	adc    BYTE PTR [rdx],al
 5bd:	40 0a 0e             	or     cl,BYTE PTR [rsi]
 5c0:	08 4c 0b 44          	or     BYTE PTR [rbx+rcx*1+0x44],cl
 5c4:	0e                   	(bad)  
 5c5:	08 00                	or     BYTE PTR [rax],al
 5c7:	00 28                	add    BYTE PTR [rax],ch
 5c9:	00 00                	add    BYTE PTR [rax],al
 5cb:	00 cc                	add    ah,cl
 5cd:	05 00 00 00 00       	add    eax,0x0
 5d2:	00 00                	add    BYTE PTR [rax],al
 5d4:	79 00                	jns    5d6 <.eh_frame+0x5d6>
 5d6:	00 00                	add    BYTE PTR [rax],al
 5d8:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 5db:	10 83 02 4c 0e 90    	adc    BYTE PTR [rbx-0x6ff1b3fe],al
 5e1:	02 72 0a             	add    dh,BYTE PTR [rdx+0xa]
 5e4:	0e                   	(bad)  
 5e5:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 5e8:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
 5eb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 5ec:	0e                   	(bad)  
 5ed:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 5f0:	08 00                	or     BYTE PTR [rax],al
 5f2:	00 00                	add    BYTE PTR [rax],al
 5f4:	1c 00                	sbb    al,0x0
 5f6:	00 00                	add    BYTE PTR [rax],al
 5f8:	f8                   	clc    
 5f9:	05 00 00 00 00       	add    eax,0x0
 5fe:	00 00                	add    BYTE PTR [rax],al
 600:	33 00                	xor    eax,DWORD PTR [rax]
 602:	00 00                	add    BYTE PTR [rax],al
 604:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 607:	10 83 02 5a 0a 0e    	adc    BYTE PTR [rbx+0xe0a5a02],al
 60d:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 610:	4e 0e                	rex.WRX (bad) 
 612:	08 00                	or     BYTE PTR [rax],al
 614:	10 00                	adc    BYTE PTR [rax],al
 616:	00 00                	add    BYTE PTR [rax],al
 618:	18 06                	sbb    BYTE PTR [rsi],al
 61a:	00 00                	add    BYTE PTR [rax],al
 61c:	00 00                	add    BYTE PTR [rax],al
 61e:	00 00                	add    BYTE PTR [rax],al
 620:	12 00                	adc    al,BYTE PTR [rax]
 622:	00 00                	add    BYTE PTR [rax],al
 624:	00 00                	add    BYTE PTR [rax],al
 626:	00 00                	add    BYTE PTR [rax],al
 628:	10 00                	adc    BYTE PTR [rax],al
 62a:	00 00                	add    BYTE PTR [rax],al
 62c:	2c 06                	sub    al,0x6
 62e:	00 00                	add    BYTE PTR [rax],al
 630:	00 00                	add    BYTE PTR [rax],al
 632:	00 00                	add    BYTE PTR [rax],al
 634:	12 00                	adc    al,BYTE PTR [rax]
 636:	00 00                	add    BYTE PTR [rax],al
 638:	00 00                	add    BYTE PTR [rax],al
 63a:	00 00                	add    BYTE PTR [rax],al
 63c:	38 00                	cmp    BYTE PTR [rax],al
 63e:	00 00                	add    BYTE PTR [rax],al
 640:	40 06                	rex (bad) 
 642:	00 00                	add    BYTE PTR [rax],al
 644:	00 00                	add    BYTE PTR [rax],al
 646:	00 00                	add    BYTE PTR [rax],al
 648:	f6 00 00             	test   BYTE PTR [rax],0x0
 64b:	00 00                	add    BYTE PTR [rax],al
 64d:	42 0e                	rex.X (bad) 
 64f:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
 655:	8d 03                	lea    eax,[rbx]
 657:	45 0e                	rex.RB (bad) 
 659:	20 8c 04 44 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bc],cl
 660:	05 44 0e 30 83       	add    eax,0x83300e44
 665:	06                   	(bad)  
 666:	02 dd                	add    bl,ch
 668:	0e                   	(bad)  
 669:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 66c:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 66f:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 672:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 675:	08 00                	or     BYTE PTR [rax],al
 677:	00 4c 00 00          	add    BYTE PTR [rax+rax*1+0x0],cl
 67b:	00 7c 06 00          	add    BYTE PTR [rsi+rax*1+0x0],bh
 67f:	00 00                	add    BYTE PTR [rax],al
 681:	00 00                	add    BYTE PTR [rax],al
 683:	00 3b                	add    BYTE PTR [rbx],bh
 685:	03 00                	add    eax,DWORD PTR [rax]
 687:	00 00                	add    BYTE PTR [rax],al
 689:	42 0e                	rex.X (bad) 
 68b:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
 691:	8e 03                	mov    es,WORD PTR [rbx]
 693:	42 0e                	rex.X (bad) 
 695:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
 69b:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff863014e2 <noGameRestart+0xffffffff862f429a>
 6a1:	06                   	(bad)  
 6a2:	41 0e                	rex.B (bad) 
 6a4:	38 83 07 4d 0e d0    	cmp    BYTE PTR [rbx-0x2ff1b2f9],al
 6aa:	08 03                	or     BYTE PTR [rbx],al
 6ac:	47 01 0a             	rex.RXB add DWORD PTR [r10],r9d
 6af:	0e                   	(bad)  
 6b0:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
 6b3:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 6b6:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 6b9:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 6bc:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 6bf:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 6c2:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
 6c5:	00 00                	add    BYTE PTR [rax],al
 6c7:	00 34 00             	add    BYTE PTR [rax+rax*1],dh
 6ca:	00 00                	add    BYTE PTR [rax],al
 6cc:	cc                   	int3   
 6cd:	06                   	(bad)  
 6ce:	00 00                	add    BYTE PTR [rax],al
 6d0:	00 00                	add    BYTE PTR [rax],al
 6d2:	00 00                	add    BYTE PTR [rax],al
 6d4:	c7 01 00 00 00 41    	mov    DWORD PTR [rcx],0x41000000
 6da:	0e                   	(bad)  
 6db:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
 6e1:	83 03 44             	add    DWORD PTR [rbx],0x44
 6e4:	0e                   	(bad)  
 6e5:	40 02 f5             	add    sil,bpl
 6e8:	0a 0e                	or     cl,BYTE PTR [rsi]
 6ea:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 6ed:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 6f0:	08 43 0b             	or     BYTE PTR [rbx+0xb],al
 6f3:	62                   	(bad)  
 6f4:	0a 0e                	or     cl,BYTE PTR [rsi]
 6f6:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 6f9:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 6fc:	08 44 0b 00          	or     BYTE PTR [rbx+rcx*1+0x0],al
 700:	58                   	pop    rax
 701:	00 00                	add    BYTE PTR [rax],al
 703:	00 04 07             	add    BYTE PTR [rdi+rax*1],al
 706:	00 00                	add    BYTE PTR [rax],al
 708:	00 00                	add    BYTE PTR [rax],al
 70a:	00 00                	add    BYTE PTR [rax],al
 70c:	d8 00                	fadd   DWORD PTR [rax]
 70e:	00 00                	add    BYTE PTR [rax],al
 710:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
 713:	10 8d 02 45 0e 18    	adc    BYTE PTR [rbp+0x180e4502],cl
 719:	8c 03                	mov    WORD PTR [rbx],es
 71b:	41 0e                	rex.B (bad) 
 71d:	20 86 04 48 0e 28    	and    BYTE PTR [rsi+0x280e4804],al
 723:	83 05 4d 0e 30 02 7f 	add    DWORD PTR [rip+0x2300e4d],0x7f        # 2301577 <noGameRestart+0x22f432f>
 72a:	0a 0e                	or     cl,BYTE PTR [rsi]
 72c:	28 48 0e             	sub    BYTE PTR [rax+0xe],cl
 72f:	20 44 0e 18          	and    BYTE PTR [rsi+rcx*1+0x18],al
 733:	42 0e                	rex.X (bad) 
 735:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 738:	08 44 0b 44          	or     BYTE PTR [rbx+rcx*1+0x44],al
 73c:	0a 0e                	or     cl,BYTE PTR [rsi]
 73e:	28 46 0e             	sub    BYTE PTR [rsi+0xe],al
 741:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 744:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 747:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 74a:	08 41 0b             	or     BYTE PTR [rcx+0xb],al
 74d:	47 0e                	rex.RXB (bad) 
 74f:	28 48 0e             	sub    BYTE PTR [rax+0xe],cl
 752:	20 44 0e 18          	and    BYTE PTR [rsi+rcx*1+0x18],al
 756:	42 0e                	rex.X (bad) 
 758:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 75b:	08 34 00             	or     BYTE PTR [rax+rax*1],dh
 75e:	00 00                	add    BYTE PTR [rax],al
 760:	60                   	(bad)  
 761:	07                   	(bad)  
 762:	00 00                	add    BYTE PTR [rax],al
 764:	00 00                	add    BYTE PTR [rax],al
 766:	00 00                	add    BYTE PTR [rax],al
 768:	5e                   	pop    rsi
 769:	01 00                	add    DWORD PTR [rax],eax
 76b:	00 00                	add    BYTE PTR [rax],al
 76d:	41 0e                	rex.B (bad) 
 76f:	10 86 02 41 0e 18    	adc    BYTE PTR [rsi+0x180e4102],al
 775:	83 03 44             	add    DWORD PTR [rbx],0x44
 778:	0e                   	(bad)  
 779:	40 02 72 0a          	add    sil,BYTE PTR [rdx+0xa]
 77d:	0e                   	(bad)  
 77e:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 781:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 784:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 787:	60                   	(bad)  
 788:	0a 0e                	or     cl,BYTE PTR [rsi]
 78a:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 78d:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 790:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 793:	00 10                	add    BYTE PTR [rax],dl
 795:	00 00                	add    BYTE PTR [rax],al
 797:	00 98 07 00 00 00    	add    BYTE PTR [rax+0x7],bl
 79d:	00 00                	add    BYTE PTR [rax],al
 79f:	00 2d 00 00 00 00    	add    BYTE PTR [rip+0x0],ch        # 7a5 <.eh_frame+0x7a5>
 7a5:	00 00                	add    BYTE PTR [rax],al
 7a7:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
 7aa:	00 00                	add    BYTE PTR [rax],al
 7ac:	ac                   	lods   al,BYTE PTR ds:[rsi]
 7ad:	07                   	(bad)  
 7ae:	00 00                	add    BYTE PTR [rax],al
 7b0:	00 00                	add    BYTE PTR [rax],al
 7b2:	00 00                	add    BYTE PTR [rax],al
 7b4:	52                   	push   rdx
 7b5:	00 00                	add    BYTE PTR [rax],al
 7b7:	00 00                	add    BYTE PTR [rax],al
 7b9:	51                   	push   rcx
 7ba:	0e                   	(bad)  
 7bb:	10 83 02 57 0e 20    	adc    BYTE PTR [rbx+0x200e5702],al
 7c1:	68 0e 10 41 0e       	push   0xe41100e
 7c6:	08 00                	or     BYTE PTR [rax],al
 7c8:	20 00                	and    BYTE PTR [rax],al
 7ca:	00 00                	add    BYTE PTR [rax],al
 7cc:	cc                   	int3   
 7cd:	07                   	(bad)  
 7ce:	00 00                	add    BYTE PTR [rax],al
 7d0:	00 00                	add    BYTE PTR [rax],al
 7d2:	00 00                	add    BYTE PTR [rax],al
 7d4:	85 00                	test   DWORD PTR [rax],eax
 7d6:	00 00                	add    BYTE PTR [rax],al
 7d8:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 7db:	10 83 02 4c 0e a0    	adc    BYTE PTR [rbx-0x5ff1b3fe],al
 7e1:	08 02                	or     BYTE PTR [rdx],al
 7e3:	76 0e                	jbe    7f3 <.eh_frame+0x7f3>
 7e5:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 7e8:	08 00                	or     BYTE PTR [rax],al
 7ea:	00 00                	add    BYTE PTR [rax],al
 7ec:	20 00                	and    BYTE PTR [rax],al
 7ee:	00 00                	add    BYTE PTR [rax],al
 7f0:	f0 07                	lock (bad) 
 7f2:	00 00                	add    BYTE PTR [rax],al
 7f4:	00 00                	add    BYTE PTR [rax],al
 7f6:	00 00                	add    BYTE PTR [rax],al
 7f8:	c3                   	ret    
 7f9:	00 00                	add    BYTE PTR [rax],al
 7fb:	00 00                	add    BYTE PTR [rax],al
 7fd:	6d                   	ins    DWORD PTR es:[rdi],dx
 7fe:	0e                   	(bad)  
 7ff:	10 63 0e             	adc    BYTE PTR [rbx+0xe],ah
 802:	08 02                	or     BYTE PTR [rdx],al
 804:	40 0e                	rex (bad) 
 806:	10 44 0e 08          	adc    BYTE PTR [rsi+rcx*1+0x8],al
 80a:	5c                   	pop    rsp
 80b:	0e                   	(bad)  
 80c:	10 00                	adc    BYTE PTR [rax],al
 80e:	00 00                	add    BYTE PTR [rax],al
 810:	14 00                	adc    al,0x0
 812:	00 00                	add    BYTE PTR [rax],al
 814:	14 08                	adc    al,0x8
 816:	00 00                	add    BYTE PTR [rax],al
 818:	00 00                	add    BYTE PTR [rax],al
 81a:	00 00                	add    BYTE PTR [rax],al
 81c:	45 00 00             	add    BYTE PTR [r8],r8b
 81f:	00 00                	add    BYTE PTR [rax],al
 821:	54                   	push   rsp
 822:	0e                   	(bad)  
 823:	10 6c 0e 08          	adc    BYTE PTR [rsi+rcx*1+0x8],ch
 827:	00 4c 00 00          	add    BYTE PTR [rax+rax*1+0x0],cl
 82b:	00 2c 08             	add    BYTE PTR [rax+rcx*1],ch
 82e:	00 00                	add    BYTE PTR [rax],al
 830:	00 00                	add    BYTE PTR [rax],al
 832:	00 00                	add    BYTE PTR [rax],al
 834:	ee                   	out    dx,al
 835:	04 00                	add    al,0x0
 837:	00 00                	add    BYTE PTR [rax],al
 839:	42 0e                	rex.X (bad) 
 83b:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
 841:	8e 03                	mov    es,WORD PTR [rbx]
 843:	42 0e                	rex.X (bad) 
 845:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
 84b:	8c 05 44 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e44],es        # ffffffff86301695 <noGameRestart+0xffffffff862f444d>
 851:	06                   	(bad)  
 852:	44 0e                	rex.R (bad) 
 854:	38 83 07 4a 0e e0    	cmp    BYTE PTR [rbx-0x1ff1b5f9],al
 85a:	40 03 a3 02 0a 0e 38 	rex add esp,DWORD PTR [rbx+0x380e0a02]
 861:	41 0e                	rex.B (bad) 
 863:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 866:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 869:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 86c:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 86f:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 872:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 875:	00 00                	add    BYTE PTR [rax],al
 877:	00 20                	add    BYTE PTR [rax],ah
 879:	00 00                	add    BYTE PTR [rax],al
 87b:	00 7c 08 00          	add    BYTE PTR [rax+rcx*1+0x0],bh
 87f:	00 00                	add    BYTE PTR [rax],al
 881:	00 00                	add    BYTE PTR [rax],al
 883:	00 02                	add    BYTE PTR [rdx],al
 885:	02 00                	add    al,BYTE PTR [rax]
 887:	00 00                	add    BYTE PTR [rax],al
 889:	44 0e                	rex.R (bad) 
 88b:	10 02                	adc    BYTE PTR [rdx],al
 88d:	46 0a 0e             	rex.RX or r9b,BYTE PTR [rsi]
 890:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 893:	03 42 01             	add    eax,DWORD PTR [rdx+0x1]
 896:	0a 0e                	or     cl,BYTE PTR [rsi]
 898:	08 4e 0b             	or     BYTE PTR [rsi+0xb],cl
 89b:	00 48 00             	add    BYTE PTR [rax+0x0],cl
 89e:	00 00                	add    BYTE PTR [rax],al
 8a0:	a0 08 00 00 00 00 00 	movabs al,ds:0xa300000000000008
 8a7:	00 a3 
 8a9:	00 00                	add    BYTE PTR [rax],al
 8ab:	00 00                	add    BYTE PTR [rax],al
 8ad:	45 0e                	rex.RB (bad) 
 8af:	10 8f 02 49 0e 18    	adc    BYTE PTR [rdi+0x180e4902],cl
 8b5:	8e 03                	mov    es,WORD PTR [rbx]
 8b7:	45 0e                	rex.RB (bad) 
 8b9:	20 8d 04 45 0e 28    	and    BYTE PTR [rbp+0x280e4504],cl
 8bf:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff86301706 <noGameRestart+0xffffffff862f44be>
 8c5:	06                   	(bad)  
 8c6:	44 0e                	rex.R (bad) 
 8c8:	38 83 07 4f 0e 40    	cmp    BYTE PTR [rbx+0x400e4f07],al
 8ce:	76 0a                	jbe    8da <.eh_frame+0x8da>
 8d0:	0e                   	(bad)  
 8d1:	38 41 0e             	cmp    BYTE PTR [rcx+0xe],al
 8d4:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 8d7:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 8da:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 8dd:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 8e0:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 8e3:	08 44 0b 00          	or     BYTE PTR [rbx+rcx*1+0x0],al
 8e7:	00 40 00             	add    BYTE PTR [rax+0x0],al
 8ea:	00 00                	add    BYTE PTR [rax],al
 8ec:	ec                   	in     al,dx
 8ed:	08 00                	or     BYTE PTR [rax],al
 8ef:	00 00                	add    BYTE PTR [rax],al
 8f1:	00 00                	add    BYTE PTR [rax],al
 8f3:	00 36                	add    BYTE PTR [rsi],dh
 8f5:	01 00                	add    DWORD PTR [rax],eax
 8f7:	00 00                	add    BYTE PTR [rax],al
 8f9:	42 0e                	rex.X (bad) 
 8fb:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
 901:	8d 03                	lea    eax,[rbx]
 903:	45 0e                	rex.RB (bad) 
 905:	20 8c 04 44 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bc],cl
 90c:	05 41 0e 30 83       	add    eax,0x83300e41
 911:	06                   	(bad)  
 912:	4a 0e                	rex.WX (bad) 
 914:	b0 22                	mov    al,0x22
 916:	02 82 0a 0e 30 43    	add    al,BYTE PTR [rdx+0x43300e0a]
 91c:	0e                   	(bad)  
 91d:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 920:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 923:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 926:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 929:	08 44 0b 10          	or     BYTE PTR [rbx+rcx*1+0x10],al
 92d:	00 00                	add    BYTE PTR [rax],al
 92f:	00 30                	add    BYTE PTR [rax],dh
 931:	09 00                	or     DWORD PTR [rax],eax
 933:	00 00                	add    BYTE PTR [rax],al
 935:	00 00                	add    BYTE PTR [rax],al
 937:	00 0b                	add    BYTE PTR [rbx],cl
 939:	00 00                	add    BYTE PTR [rax],al
 93b:	00 00                	add    BYTE PTR [rax],al
 93d:	00 00                	add    BYTE PTR [rax],al
 93f:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
 942:	00 00                	add    BYTE PTR [rax],al
 944:	44 09 00             	or     DWORD PTR [rax],r8d
 947:	00 00                	add    BYTE PTR [rax],al
 949:	00 00                	add    BYTE PTR [rax],al
 94b:	00 7c 00 00          	add    BYTE PTR [rax+rax*1+0x0],bh
 94f:	00 00                	add    BYTE PTR [rax],al
 951:	02 69 0e             	add    ch,BYTE PTR [rcx+0xe]
 954:	10 00                	adc    BYTE PTR [rax],al
 956:	00 00                	add    BYTE PTR [rax],al
 958:	24 00                	and    al,0x0
 95a:	00 00                	add    BYTE PTR [rax],al
 95c:	5c                   	pop    rsp
 95d:	09 00                	or     DWORD PTR [rax],eax
 95f:	00 00                	add    BYTE PTR [rax],al
 961:	00 00                	add    BYTE PTR [rax],al
 963:	00 53 00             	add    BYTE PTR [rbx+0x0],dl
 966:	00 00                	add    BYTE PTR [rax],al
 968:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 96b:	10 86 02 4a 0e 18    	adc    BYTE PTR [rsi+0x180e4a02],al
 971:	83 03 47             	add    DWORD PTR [rbx],0x47
 974:	0e                   	(bad)  
 975:	a0 08 7e 0e 18 41 0e 	movabs al,ds:0x41100e41180e7e08
 97c:	10 41 
 97e:	0e                   	(bad)  
 97f:	08 1c 00             	or     BYTE PTR [rax+rax*1],bl
 982:	00 00                	add    BYTE PTR [rax],al
 984:	84 09                	test   BYTE PTR [rcx],cl
 986:	00 00                	add    BYTE PTR [rax],al
 988:	00 00                	add    BYTE PTR [rax],al
 98a:	00 00                	add    BYTE PTR [rax],al
 98c:	7d 00                	jge    98e <.eh_frame+0x98e>
 98e:	00 00                	add    BYTE PTR [rax],al
 990:	00 6c 0e 10          	add    BYTE PTR [rsi+rcx*1+0x10],ch
 994:	7e 0a                	jle    9a0 <.eh_frame+0x9a0>
 996:	0e                   	(bad)  
 997:	08 4e 0b             	or     BYTE PTR [rsi+0xb],cl
 99a:	44 0e                	rex.R (bad) 
 99c:	08 00                	or     BYTE PTR [rax],al
 99e:	00 00                	add    BYTE PTR [rax],al
 9a0:	18 00                	sbb    BYTE PTR [rax],al
 9a2:	00 00                	add    BYTE PTR [rax],al
 9a4:	a4                   	movs   BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
 9a5:	09 00                	or     DWORD PTR [rax],eax
 9a7:	00 00                	add    BYTE PTR [rax],al
 9a9:	00 00                	add    BYTE PTR [rax],al
 9ab:	00 5c 00 00          	add    BYTE PTR [rax+rax*1+0x0],bl
 9af:	00 00                	add    BYTE PTR [rax],al
 9b1:	44 0e                	rex.R (bad) 
 9b3:	10 02                	adc    BYTE PTR [rdx],al
 9b5:	47 0a 0e             	rex.RXB or r9b,BYTE PTR [r14]
 9b8:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 9bb:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
 9be:	00 00                	add    BYTE PTR [rax],al
 9c0:	c0 09 00             	ror    BYTE PTR [rcx],0x0
 9c3:	00 00                	add    BYTE PTR [rax],al
 9c5:	00 00                	add    BYTE PTR [rax],al
 9c7:	00 25 00 00 00 00    	add    BYTE PTR [rip+0x0],ah        # 9cd <.eh_frame+0x9cd>
 9cd:	52                   	push   rdx
 9ce:	0e                   	(bad)  
 9cf:	10 49 0e             	adc    BYTE PTR [rcx+0xe],cl
 9d2:	08 00                	or     BYTE PTR [rax],al
 9d4:	1c 00                	sbb    al,0x0
 9d6:	00 00                	add    BYTE PTR [rax],al
 9d8:	d8 09                	fmul   DWORD PTR [rcx]
 9da:	00 00                	add    BYTE PTR [rax],al
 9dc:	00 00                	add    BYTE PTR [rax],al
 9de:	00 00                	add    BYTE PTR [rax],al
 9e0:	22 01                	and    al,BYTE PTR [rcx]
 9e2:	00 00                	add    BYTE PTR [rax],al
 9e4:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 9e7:	10 83 02 02 ec 0a    	adc    BYTE PTR [rbx+0xaec0202],al
 9ed:	0e                   	(bad)  
 9ee:	08 43 0b             	or     BYTE PTR [rbx+0xb],al
 9f1:	00 00                	add    BYTE PTR [rax],al
 9f3:	00 24 00             	add    BYTE PTR [rax+rax*1],ah
 9f6:	00 00                	add    BYTE PTR [rax],al
 9f8:	f8                   	clc    
 9f9:	09 00                	or     DWORD PTR [rax],eax
 9fb:	00 00                	add    BYTE PTR [rax],al
 9fd:	00 00                	add    BYTE PTR [rax],al
 9ff:	00 62 00             	add    BYTE PTR [rdx+0x0],ah
 a02:	00 00                	add    BYTE PTR [rax],al
 a04:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 a07:	10 83 02 02 45 0a    	adc    BYTE PTR [rbx+0xa450202],al
 a0d:	0e                   	(bad)  
 a0e:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 a11:	43 0a 0e             	rex.XB or cl,BYTE PTR [r14]
 a14:	08 4d 0b             	or     BYTE PTR [rbp+0xb],cl
 a17:	41 0e                	rex.B (bad) 
 a19:	08 00                	or     BYTE PTR [rax],al
 a1b:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
 a1e:	00 00                	add    BYTE PTR [rax],al
 a20:	20 0a                	and    BYTE PTR [rdx],cl
 a22:	00 00                	add    BYTE PTR [rax],al
 a24:	00 00                	add    BYTE PTR [rax],al
 a26:	00 00                	add    BYTE PTR [rax],al
 a28:	17                   	(bad)  
 a29:	00 00                	add    BYTE PTR [rax],al
 a2b:	00 00                	add    BYTE PTR [rax],al
 a2d:	44 0e                	rex.R (bad) 
 a2f:	10 4e 0e             	adc    BYTE PTR [rsi+0xe],cl
 a32:	08 00                	or     BYTE PTR [rax],al
 a34:	1c 00                	sbb    al,0x0
 a36:	00 00                	add    BYTE PTR [rax],al
 a38:	38 0a                	cmp    BYTE PTR [rdx],cl
 a3a:	00 00                	add    BYTE PTR [rax],al
 a3c:	00 00                	add    BYTE PTR [rax],al
 a3e:	00 00                	add    BYTE PTR [rax],al
 a40:	35 00 00 00 00       	xor    eax,0x0
 a45:	44 0e                	rex.R (bad) 
 a47:	10 61 0a             	adc    BYTE PTR [rcx+0xa],ah
 a4a:	0e                   	(bad)  
 a4b:	08 4b 0b             	or     BYTE PTR [rbx+0xb],cl
 a4e:	44 0e                	rex.R (bad) 
 a50:	08 00                	or     BYTE PTR [rax],al
 a52:	00 00                	add    BYTE PTR [rax],al
 a54:	2c 00                	sub    al,0x0
 a56:	00 00                	add    BYTE PTR [rax],al
 a58:	58                   	pop    rax
 a59:	0a 00                	or     al,BYTE PTR [rax]
 a5b:	00 00                	add    BYTE PTR [rax],al
 a5d:	00 00                	add    BYTE PTR [rax],al
 a5f:	00 42 01             	add    BYTE PTR [rdx+0x1],al
 a62:	00 00                	add    BYTE PTR [rax],al
 a64:	00 44 0e 10          	add    BYTE PTR [rsi+rcx*1+0x10],al
 a68:	72 0a                	jb     a74 <.eh_frame+0xa74>
 a6a:	0e                   	(bad)  
 a6b:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 a6e:	77 0a                	ja     a7a <.eh_frame+0xa7a>
 a70:	0e                   	(bad)  
 a71:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 a74:	62                   	(bad)  
 a75:	0a 0e                	or     cl,BYTE PTR [rsi]
 a77:	08 4e 0b             	or     BYTE PTR [rsi+0xb],cl
 a7a:	02 45 0a             	add    al,BYTE PTR [rbp+0xa]
 a7d:	0e                   	(bad)  
 a7e:	08 4b 0b             	or     BYTE PTR [rbx+0xb],cl
 a81:	00 00                	add    BYTE PTR [rax],al
 a83:	00 10                	add    BYTE PTR [rax],dl
 a85:	00 00                	add    BYTE PTR [rax],al
 a87:	00 88 0a 00 00 00    	add    BYTE PTR [rax+0xa],cl
 a8d:	00 00                	add    BYTE PTR [rax],al
 a8f:	00 13                	add    BYTE PTR [rbx],dl
 a91:	00 00                	add    BYTE PTR [rax],al
 a93:	00 00                	add    BYTE PTR [rax],al
 a95:	00 00                	add    BYTE PTR [rax],al
 a97:	00 10                	add    BYTE PTR [rax],dl
 a99:	00 00                	add    BYTE PTR [rax],al
 a9b:	00 9c 0a 00 00 00 00 	add    BYTE PTR [rdx+rcx*1+0x0],bl
 aa2:	00 00                	add    BYTE PTR [rax],al
 aa4:	12 00                	adc    al,BYTE PTR [rax]
 aa6:	00 00                	add    BYTE PTR [rax],al
 aa8:	00 00                	add    BYTE PTR [rax],al
 aaa:	00 00                	add    BYTE PTR [rax],al
 aac:	24 00                	and    al,0x0
 aae:	00 00                	add    BYTE PTR [rax],al
 ab0:	b0 0a                	mov    al,0xa
 ab2:	00 00                	add    BYTE PTR [rax],al
 ab4:	00 00                	add    BYTE PTR [rax],al
 ab6:	00 00                	add    BYTE PTR [rax],al
 ab8:	95                   	xchg   ebp,eax
 ab9:	02 00                	add    al,BYTE PTR [rax]
 abb:	00 00                	add    BYTE PTR [rax],al
 abd:	48 0e                	rex.W (bad) 
 abf:	10 83 02 03 8d 01    	adc    BYTE PTR [rbx+0x18d0302],al
 ac5:	0a 0e                	or     cl,BYTE PTR [rsi]
 ac7:	08 4b 0b             	or     BYTE PTR [rbx+0xb],cl
 aca:	02 6f 0a             	add    ch,BYTE PTR [rdi+0xa]
 acd:	0e                   	(bad)  
 ace:	08 41 0b             	or     BYTE PTR [rcx+0xb],al
 ad1:	00 00                	add    BYTE PTR [rax],al
 ad3:	00 20                	add    BYTE PTR [rax],ah
 ad5:	00 00                	add    BYTE PTR [rax],al
 ad7:	00 d8                	add    al,bl
 ad9:	0a 00                	or     al,BYTE PTR [rax]
 adb:	00 00                	add    BYTE PTR [rax],al
 add:	00 00                	add    BYTE PTR [rax],al
 adf:	00 f0                	add    al,dh
 ae1:	00 00                	add    BYTE PTR [rax],al
 ae3:	00 00                	add    BYTE PTR [rax],al
 ae5:	41 0e                	rex.B (bad) 
 ae7:	10 83 02 47 0e 90    	adc    BYTE PTR [rbx-0x6ff1b8fe],al
 aed:	02 02                	add    al,BYTE PTR [rdx]
 aef:	79 0a                	jns    afb <.eh_frame+0xafb>
 af1:	0e                   	(bad)  
 af2:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 af5:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 af8:	48 00 00             	rex.W add BYTE PTR [rax],al
 afb:	00 fc                	add    ah,bh
 afd:	0a 00                	or     al,BYTE PTR [rax]
 aff:	00 00                	add    BYTE PTR [rax],al
 b01:	00 00                	add    BYTE PTR [rax],al
 b03:	00 ae 05 00 00 00    	add    BYTE PTR [rsi+0x5],ch
 b09:	42 0e                	rex.X (bad) 
 b0b:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
 b11:	8e 03                	mov    es,WORD PTR [rbx]
 b13:	42 0e                	rex.X (bad) 
 b15:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
 b1b:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff86301962 <noGameRestart+0xffffffff862f471a>
 b21:	06                   	(bad)  
 b22:	41 0e                	rex.B (bad) 
 b24:	38 83 07 47 0e f0    	cmp    BYTE PTR [rbx-0xff1b8f9],al
 b2a:	81 02 6a 0a 0e 38    	add    DWORD PTR [rdx],0x380e0a6a
 b30:	41 0e                	rex.B (bad) 
 b32:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 b35:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 b38:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 b3b:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 b3e:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 b41:	08 4b 0b             	or     BYTE PTR [rbx+0xb],cl
 b44:	1c 00                	sbb    al,0x0
 b46:	00 00                	add    BYTE PTR [rax],al
 b48:	48 0b 00             	or     rax,QWORD PTR [rax]
 b4b:	00 00                	add    BYTE PTR [rax],al
 b4d:	00 00                	add    BYTE PTR [rax],al
 b4f:	00 4c 01 00          	add    BYTE PTR [rcx+rax*1+0x0],cl
 b53:	00 00                	add    BYTE PTR [rax],al
 b55:	6c                   	ins    BYTE PTR es:[rdi],dx
 b56:	0e                   	(bad)  
 b57:	10 02                	adc    BYTE PTR [rdx],al
 b59:	84 0a                	test   BYTE PTR [rdx],cl
 b5b:	0e                   	(bad)  
 b5c:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
 b5f:	02 78 0e             	add    bh,BYTE PTR [rax+0xe]
 b62:	08 00                	or     BYTE PTR [rax],al
 b64:	40 00 00             	add    BYTE PTR [rax],al
 b67:	00 68 0b             	add    BYTE PTR [rax+0xb],ch
 b6a:	00 00                	add    BYTE PTR [rax],al
 b6c:	00 00                	add    BYTE PTR [rax],al
 b6e:	00 00                	add    BYTE PTR [rax],al
 b70:	4d 03 00             	add    r8,QWORD PTR [r8]
 b73:	00 00                	add    BYTE PTR [rax],al
 b75:	42 0e                	rex.X (bad) 
 b77:	10 8c 02 41 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bf],cl
 b7e:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
 b81:	20 83 04 47 0e c0    	and    BYTE PTR [rbx-0x3ff1b8fc],al
 b87:	42 03 4a 02          	rex.X add ecx,DWORD PTR [rdx+0x2]
 b8b:	0a 0e                	or     cl,BYTE PTR [rsi]
 b8d:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 b90:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 b93:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 b96:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 b99:	6d                   	ins    DWORD PTR es:[rdi],dx
 b9a:	0a 0e                	or     cl,BYTE PTR [rsi]
 b9c:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 b9f:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 ba2:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 ba5:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 ba8:	50                   	push   rax
 ba9:	00 00                	add    BYTE PTR [rax],al
 bab:	00 ac 0b 00 00 00 00 	add    BYTE PTR [rbx+rcx*1+0x0],ch
 bb2:	00 00                	add    BYTE PTR [rax],al
 bb4:	bb 02 00 00 00       	mov    ebx,0x2
 bb9:	42 0e                	rex.X (bad) 
 bbb:	10 8c 02 41 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bf],cl
 bc2:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
 bc5:	20 83 04 47 0e b0    	and    BYTE PTR [rbx-0x4ff1b8fc],al
 bcb:	40 5f                	rex pop rdi
 bcd:	0a 0e                	or     cl,BYTE PTR [rsi]
 bcf:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 bd2:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 bd5:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 bd8:	08 42 0b             	or     BYTE PTR [rdx+0xb],al
 bdb:	03 60 01             	add    esp,DWORD PTR [rax+0x1]
 bde:	0a 0e                	or     cl,BYTE PTR [rsi]
 be0:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 be3:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 be6:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 be9:	08 44 0b 58          	or     BYTE PTR [rbx+rcx*1+0x58],al
 bed:	0a 0e                	or     cl,BYTE PTR [rsi]
 bef:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 bf2:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 bf5:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 bf8:	08 44 0b 00          	or     BYTE PTR [rbx+rcx*1+0x0],al
 bfc:	20 00                	and    BYTE PTR [rax],al
 bfe:	00 00                	add    BYTE PTR [rax],al
 c00:	00 0c 00             	add    BYTE PTR [rax+rax*1],cl
 c03:	00 00                	add    BYTE PTR [rax],al
 c05:	00 00                	add    BYTE PTR [rax],al
 c07:	00 11                	add    BYTE PTR [rcx],dl
 c09:	01 00                	add    DWORD PTR [rax],eax
 c0b:	00 00                	add    BYTE PTR [rax],al
 c0d:	44 0e                	rex.R (bad) 
 c0f:	10 02                	adc    BYTE PTR [rdx],al
 c11:	c7                   	(bad)  
 c12:	0a 0e                	or     cl,BYTE PTR [rsi]
 c14:	08 4d 0b             	or     BYTE PTR [rbp+0xb],cl
 c17:	44 0a 0e             	or     r9b,BYTE PTR [rsi]
 c1a:	08 44 0b 00          	or     BYTE PTR [rbx+rcx*1+0x0],al
 c1e:	00 00                	add    BYTE PTR [rax],al
 c20:	48 00 00             	rex.W add BYTE PTR [rax],al
 c23:	00 24 0c             	add    BYTE PTR [rsp+rcx*1],ah
 c26:	00 00                	add    BYTE PTR [rax],al
 c28:	00 00                	add    BYTE PTR [rax],al
 c2a:	00 00                	add    BYTE PTR [rax],al
 c2c:	ae                   	scas   al,BYTE PTR es:[rdi]
 c2d:	00 00                	add    BYTE PTR [rax],al
 c2f:	00 00                	add    BYTE PTR [rax],al
 c31:	41 0e                	rex.B (bad) 
 c33:	10 86 02 46 0e 18    	adc    BYTE PTR [rsi+0x180e4602],al
 c39:	83 03 44             	add    DWORD PTR [rbx],0x44
 c3c:	0e                   	(bad)  
 c3d:	20 02                	and    BYTE PTR [rdx],al
 c3f:	52                   	push   rdx
 c40:	0a 0e                	or     cl,BYTE PTR [rsi]
 c42:	18 44 0e 10          	sbb    BYTE PTR [rsi+rcx*1+0x10],al
 c46:	41 0e                	rex.B (bad) 
 c48:	08 4e 0b             	or     BYTE PTR [rsi+0xb],cl
 c4b:	44 0a 0e             	or     r9b,BYTE PTR [rsi]
 c4e:	18 4d 0e             	sbb    BYTE PTR [rbp+0xe],cl
 c51:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 c54:	08 4e 0b             	or     BYTE PTR [rsi+0xb],cl
 c57:	44 0a 0e             	or     r9b,BYTE PTR [rsi]
 c5a:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 c5d:	10 41 0e             	adc    BYTE PTR [rcx+0xe],al
 c60:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 c63:	44 0e                	rex.R (bad) 
 c65:	18 44 0e 10          	sbb    BYTE PTR [rsi+rcx*1+0x10],al
 c69:	41 0e                	rex.B (bad) 
 c6b:	08 38                	or     BYTE PTR [rax],bh
 c6d:	00 00                	add    BYTE PTR [rax],al
 c6f:	00 70 0c             	add    BYTE PTR [rax+0xc],dh
 c72:	00 00                	add    BYTE PTR [rax],al
 c74:	00 00                	add    BYTE PTR [rax],al
 c76:	00 00                	add    BYTE PTR [rax],al
 c78:	d3 02                	rol    DWORD PTR [rdx],cl
 c7a:	00 00                	add    BYTE PTR [rax],al
 c7c:	00 49 0e             	add    BYTE PTR [rcx+0xe],cl
 c7f:	10 8c 02 41 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bf],cl
 c86:	03 41 0e             	add    eax,DWORD PTR [rcx+0xe]
 c89:	20 83 04 02 fe 0a    	and    BYTE PTR [rbx+0xafe0204],al
 c8f:	0e                   	(bad)  
 c90:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 c93:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 c96:	08 4c 0b 02          	or     BYTE PTR [rbx+rcx*1+0x2],cl
 c9a:	d6                   	(bad)  
 c9b:	0a 0e                	or     cl,BYTE PTR [rsi]
 c9d:	18 44 0e 10          	sbb    BYTE PTR [rsi+rcx*1+0x10],al
 ca1:	4d 0e                	rex.WRB (bad) 
 ca3:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 ca6:	00 00                	add    BYTE PTR [rax],al
 ca8:	10 00                	adc    BYTE PTR [rax],al
 caa:	00 00                	add    BYTE PTR [rax],al
 cac:	ac                   	lods   al,BYTE PTR ds:[rsi]
 cad:	0c 00                	or     al,0x0
 caf:	00 00                	add    BYTE PTR [rax],al
 cb1:	00 00                	add    BYTE PTR [rax],al
 cb3:	00 4e 00             	add    BYTE PTR [rsi+0x0],cl
 cb6:	00 00                	add    BYTE PTR [rax],al
 cb8:	00 00                	add    BYTE PTR [rax],al
 cba:	00 00                	add    BYTE PTR [rax],al
 cbc:	4c 00 00             	rex.WR add BYTE PTR [rax],r8b
 cbf:	00 c0                	add    al,al
 cc1:	0c 00                	or     al,0x0
 cc3:	00 00                	add    BYTE PTR [rax],al
 cc5:	00 00                	add    BYTE PTR [rax],al
 cc7:	00 1d 07 00 00 00    	add    BYTE PTR [rip+0x7],bl        # cd4 <.eh_frame+0xcd4>
 ccd:	42 0e                	rex.X (bad) 
 ccf:	10 8d 02 42 0e 18    	adc    BYTE PTR [rbp+0x180e4202],cl
 cd5:	8c 03                	mov    WORD PTR [rbx],es
 cd7:	41 0e                	rex.B (bad) 
 cd9:	20 86 04 44 0e 28    	and    BYTE PTR [rsi+0x280e4404],al
 cdf:	83 05 44 0e 40 63 0a 	add    DWORD PTR [rip+0x63400e44],0xa        # 63401b2a <noGameRestart+0x633f48e2>
 ce6:	0e                   	(bad)  
 ce7:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 cea:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 ced:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 cf0:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 cf3:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 cf6:	02 5a 0a             	add    bl,BYTE PTR [rdx+0xa]
 cf9:	0e                   	(bad)  
 cfa:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 cfd:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 d00:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 d03:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 d06:	08 48 0b             	or     BYTE PTR [rax+0xb],cl
 d09:	00 00                	add    BYTE PTR [rax],al
 d0b:	00 10                	add    BYTE PTR [rax],dl
 d0d:	00 00                	add    BYTE PTR [rax],al
 d0f:	00 10                	add    BYTE PTR [rax],dl
 d11:	0d 00 00 00 00       	or     eax,0x0
 d16:	00 00                	add    BYTE PTR [rax],al
 d18:	1e                   	(bad)  
 d19:	00 00                	add    BYTE PTR [rax],al
 d1b:	00 00                	add    BYTE PTR [rax],al
 d1d:	00 00                	add    BYTE PTR [rax],al
 d1f:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
 d22:	00 00                	add    BYTE PTR [rax],al
 d24:	24 0d                	and    al,0xd
 d26:	00 00                	add    BYTE PTR [rax],al
 d28:	00 00                	add    BYTE PTR [rax],al
 d2a:	00 00                	add    BYTE PTR [rax],al
 d2c:	3a 00                	cmp    al,BYTE PTR [rax]
 d2e:	00 00                	add    BYTE PTR [rax],al
 d30:	00 44 0e 10          	add    BYTE PTR [rsi+rcx*1+0x10],al
 d34:	68 0a 0e 08 44       	push   0x44080e0a
 d39:	0b 49 0e             	or     ecx,DWORD PTR [rcx+0xe]
 d3c:	08 00                	or     BYTE PTR [rax],al
 d3e:	00 00                	add    BYTE PTR [rax],al
 d40:	54                   	push   rsp
 d41:	00 00                	add    BYTE PTR [rax],al
 d43:	00 44 0d 00          	add    BYTE PTR [rbp+rcx*1+0x0],al
 d47:	00 00                	add    BYTE PTR [rax],al
 d49:	00 00                	add    BYTE PTR [rax],al
 d4b:	00 30                	add    BYTE PTR [rax],dh
 d4d:	05 00 00 00 42       	add    eax,0x42000000
 d52:	0e                   	(bad)  
 d53:	10 8e 02 42 0e 18    	adc    BYTE PTR [rsi+0x180e4202],cl
 d59:	8d 03                	lea    eax,[rbx]
 d5b:	42 0e                	rex.X (bad) 
 d5d:	20 8c 04 41 0e 28 86 	and    BYTE PTR [rsp+rax*1-0x79d7f1bf],cl
 d64:	05 43 0e 30 83       	add    eax,0x83300e43
 d69:	06                   	(bad)  
 d6a:	49 0e                	rex.WB (bad) 
 d6c:	b0 21                	mov    al,0x21
 d6e:	03 50 01             	add    edx,DWORD PTR [rax+0x1]
 d71:	0a 0e                	or     cl,BYTE PTR [rsi]
 d73:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 d76:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 d79:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 d7c:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 d7f:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 d82:	08 45 0b             	or     BYTE PTR [rbp+0xb],al
 d85:	03 6a 02             	add    ebp,DWORD PTR [rdx+0x2]
 d88:	0e                   	(bad)  
 d89:	b8 21 59 0e c0       	mov    eax,0xc00e5921
 d8e:	21 02                	and    DWORD PTR [rdx],eax
 d90:	42 0e                	rex.X (bad) 
 d92:	b8 21 41 0e b0       	mov    eax,0xb00e4121
 d97:	21 10                	and    DWORD PTR [rax],edx
 d99:	00 00                	add    BYTE PTR [rax],al
 d9b:	00 9c 0d 00 00 00 00 	add    BYTE PTR [rbp+rcx*1+0x0],bl
 da2:	00 00                	add    BYTE PTR [rax],al
 da4:	21 00                	and    DWORD PTR [rax],eax
 da6:	00 00                	add    BYTE PTR [rax],al
 da8:	00 00                	add    BYTE PTR [rax],al
 daa:	00 00                	add    BYTE PTR [rax],al
 dac:	40 00 00             	add    BYTE PTR [rax],al
 daf:	00 b0 0d 00 00 00    	add    BYTE PTR [rax+0xd],dh
 db5:	00 00                	add    BYTE PTR [rax],al
 db7:	00 2f                	add    BYTE PTR [rdi],ch
 db9:	01 00                	add    DWORD PTR [rax],eax
 dbb:	00 00                	add    BYTE PTR [rax],al
 dbd:	42 0e                	rex.X (bad) 
 dbf:	10 8c 02 44 0e 18 86 	adc    BYTE PTR [rdx+rax*1-0x79e7f1bc],cl
 dc6:	03 44 0e 20          	add    eax,DWORD PTR [rsi+rcx*1+0x20]
 dca:	83 04 47 0e          	add    DWORD PTR [rdi+rax*2],0xe
 dce:	30 5c 0a 0e          	xor    BYTE PTR [rdx+rcx*1+0xe],bl
 dd2:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 dd5:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 dd8:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 ddb:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 dde:	02 53 0a             	add    dl,BYTE PTR [rbx+0xa]
 de1:	0e                   	(bad)  
 de2:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 de5:	18 41 0e             	sbb    BYTE PTR [rcx+0xe],al
 de8:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 deb:	08 41 0b             	or     BYTE PTR [rcx+0xb],al
 dee:	00 00                	add    BYTE PTR [rax],al
 df0:	18 00                	sbb    BYTE PTR [rax],al
 df2:	00 00                	add    BYTE PTR [rax],al
 df4:	f4                   	hlt    
 df5:	0d 00 00 00 00       	or     eax,0x0
 dfa:	00 00                	add    BYTE PTR [rax],al
 dfc:	bc 08 00 00 00       	mov    esp,0x8
 e01:	44 0e                	rex.R (bad) 
 e03:	10 03                	adc    BYTE PTR [rbx],al
 e05:	b3 08                	mov    bl,0x8
 e07:	0e                   	(bad)  
 e08:	08 00                	or     BYTE PTR [rax],al
 e0a:	00 00                	add    BYTE PTR [rax],al
 e0c:	20 00                	and    BYTE PTR [rax],al
 e0e:	00 00                	add    BYTE PTR [rax],al
 e10:	10 0e                	adc    BYTE PTR [rsi],cl
 e12:	00 00                	add    BYTE PTR [rax],al
 e14:	00 00                	add    BYTE PTR [rax],al
 e16:	00 00                	add    BYTE PTR [rax],al
 e18:	3f                   	(bad)  
 e19:	02 00                	add    al,BYTE PTR [rax]
 e1b:	00 00                	add    BYTE PTR [rax],al
 e1d:	59                   	pop    rcx
 e1e:	0e                   	(bad)  
 e1f:	10 83 02 03 0a 02    	adc    BYTE PTR [rbx+0x20a0302],al
 e25:	0a c3                	or     al,bl
 e27:	0e                   	(bad)  
 e28:	08 4d 0b             	or     BYTE PTR [rbp+0xb],cl
 e2b:	4a c3                	rex.WX ret 
 e2d:	0e                   	(bad)  
 e2e:	08 00                	or     BYTE PTR [rax],al
 e30:	5c                   	pop    rsp
 e31:	00 00                	add    BYTE PTR [rax],al
 e33:	00 34 0e             	add    BYTE PTR [rsi+rcx*1],dh
 e36:	00 00                	add    BYTE PTR [rax],al
 e38:	00 00                	add    BYTE PTR [rax],al
 e3a:	00 00                	add    BYTE PTR [rax],al
 e3c:	b5 01                	mov    ch,0x1
 e3e:	00 00                	add    BYTE PTR [rax],al
 e40:	00 4b 0e             	add    BYTE PTR [rbx+0xe],cl
 e43:	10 8d 02 42 0e 18    	adc    BYTE PTR [rbp+0x180e4202],cl
 e49:	8c 03                	mov    WORD PTR [rbx],es
 e4b:	49 0e                	rex.WB (bad) 
 e4d:	20 86 04 44 0e 28    	and    BYTE PTR [rsi+0x280e4404],al
 e53:	83 05 44 0e 50 55 0a 	add    DWORD PTR [rip+0x55500e44],0xa        # 55501c9e <noGameRestart+0x554f4a56>
 e5a:	0e                   	(bad)  
 e5b:	28 41 0e             	sub    BYTE PTR [rcx+0xe],al
 e5e:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 e61:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 e64:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 e67:	08 47 0b             	or     BYTE PTR [rdi+0xb],al
 e6a:	02 88 0e 08 c3 c6    	add    cl,BYTE PTR [rax-0x393cf7f2]
 e70:	cc                   	int3   
 e71:	cd 78                	int    0x78
 e73:	0e                   	(bad)  
 e74:	50                   	push   rax
 e75:	83 05 86 04 8c 03 8d 	add    DWORD PTR [rip+0x38c0486],0xffffff8d        # 38c1302 <noGameRestart+0x38b40ba>
 e7c:	02 02                	add    al,BYTE PTR [rdx]
 e7e:	7e 0a                	jle    e8a <.eh_frame+0xe8a>
 e80:	0e                   	(bad)  
 e81:	28 43 0e             	sub    BYTE PTR [rbx+0xe],al
 e84:	20 41 0e             	and    BYTE PTR [rcx+0xe],al
 e87:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 e8a:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 e8d:	08 41 0b             	or     BYTE PTR [rcx+0xb],al
 e90:	10 00                	adc    BYTE PTR [rax],al
 e92:	00 00                	add    BYTE PTR [rax],al
 e94:	94                   	xchg   esp,eax
 e95:	0e                   	(bad)  
 e96:	00 00                	add    BYTE PTR [rax],al
 e98:	00 00                	add    BYTE PTR [rax],al
 e9a:	00 00                	add    BYTE PTR [rax],al
 e9c:	35 00 00 00 00       	xor    eax,0x0
 ea1:	00 00                	add    BYTE PTR [rax],al
 ea3:	00 10                	add    BYTE PTR [rax],dl
 ea5:	00 00                	add    BYTE PTR [rax],al
 ea7:	00 a8 0e 00 00 00    	add    BYTE PTR [rax+0xe],ch
 ead:	00 00                	add    BYTE PTR [rax],al
 eaf:	00 45 00             	add    BYTE PTR [rbp+0x0],al
 eb2:	00 00                	add    BYTE PTR [rax],al
 eb4:	00 00                	add    BYTE PTR [rax],al
 eb6:	00 00                	add    BYTE PTR [rax],al
 eb8:	10 00                	adc    BYTE PTR [rax],al
 eba:	00 00                	add    BYTE PTR [rax],al
 ebc:	bc 0e 00 00 00       	mov    esp,0xe
 ec1:	00 00                	add    BYTE PTR [rax],al
 ec3:	00 1e                	add    BYTE PTR [rsi],bl
 ec5:	00 00                	add    BYTE PTR [rax],al
 ec7:	00 00                	add    BYTE PTR [rax],al
 ec9:	00 00                	add    BYTE PTR [rax],al
 ecb:	00 10                	add    BYTE PTR [rax],dl
 ecd:	00 00                	add    BYTE PTR [rax],al
 ecf:	00 d0                	add    al,dl
 ed1:	0e                   	(bad)  
 ed2:	00 00                	add    BYTE PTR [rax],al
 ed4:	00 00                	add    BYTE PTR [rax],al
 ed6:	00 00                	add    BYTE PTR [rax],al
 ed8:	25 00 00 00 00       	and    eax,0x0
 edd:	00 00                	add    BYTE PTR [rax],al
 edf:	00 48 00             	add    BYTE PTR [rax+0x0],cl
 ee2:	00 00                	add    BYTE PTR [rax],al
 ee4:	e4 0e                	in     al,0xe
 ee6:	00 00                	add    BYTE PTR [rax],al
 ee8:	00 00                	add    BYTE PTR [rax],al
 eea:	00 00                	add    BYTE PTR [rax],al
 eec:	86 03                	xchg   BYTE PTR [rbx],al
 eee:	00 00                	add    BYTE PTR [rax],al
 ef0:	00 42 0e             	add    BYTE PTR [rdx+0xe],al
 ef3:	10 8f 02 42 0e 18    	adc    BYTE PTR [rdi+0x180e4202],cl
 ef9:	8e 03                	mov    es,WORD PTR [rbx]
 efb:	42 0e                	rex.X (bad) 
 efd:	20 8d 04 42 0e 28    	and    BYTE PTR [rbp+0x280e4204],cl
 f03:	8c 05 41 0e 30 86    	mov    WORD PTR [rip+0xffffffff86300e41],es        # ffffffff86301d4a <noGameRestart+0xffffffff862f4b02>
 f09:	06                   	(bad)  
 f0a:	41 0e                	rex.B (bad) 
 f0c:	38 83 07 49 0e e0    	cmp    BYTE PTR [rbx-0x1ff1b6f9],al
 f12:	08 02                	or     BYTE PTR [rdx],al
 f14:	b3 0a                	mov    bl,0xa
 f16:	0e                   	(bad)  
 f17:	38 43 0e             	cmp    BYTE PTR [rbx+0xe],al
 f1a:	30 41 0e             	xor    BYTE PTR [rcx+0xe],al
 f1d:	28 42 0e             	sub    BYTE PTR [rdx+0xe],al
 f20:	20 42 0e             	and    BYTE PTR [rdx+0xe],al
 f23:	18 42 0e             	sbb    BYTE PTR [rdx+0xe],al
 f26:	10 42 0e             	adc    BYTE PTR [rdx+0xe],al
 f29:	08 46 0b             	or     BYTE PTR [rsi+0xb],al
 f2c:	14 00                	adc    al,0x0
 f2e:	00 00                	add    BYTE PTR [rax],al
 f30:	30 0f                	xor    BYTE PTR [rdi],cl
 f32:	00 00                	add    BYTE PTR [rax],al
 f34:	00 00                	add    BYTE PTR [rax],al
 f36:	00 00                	add    BYTE PTR [rax],al
 f38:	31 00                	xor    DWORD PTR [rax],eax
 f3a:	00 00                	add    BYTE PTR [rax],al
 f3c:	00 5c 0e 10          	add    BYTE PTR [rsi+rcx*1+0x10],bl
 f40:	54                   	push   rsp
 f41:	0e                   	(bad)  
 f42:	08 00                	or     BYTE PTR [rax],al
 f44:	20 00                	and    BYTE PTR [rax],al
 f46:	00 00                	add    BYTE PTR [rax],al
 f48:	48 0f 00 00          	rex.W sldt WORD PTR [rax]
 f4c:	00 00                	add    BYTE PTR [rax],al
 f4e:	00 00                	add    BYTE PTR [rax],al
 f50:	6b 01 00             	imul   eax,DWORD PTR [rcx],0x0
 f53:	00 00                	add    BYTE PTR [rax],al
 f55:	41 0e                	rex.B (bad) 
 f57:	10 83 02 47 0e 90    	adc    BYTE PTR [rbx-0x6ff1b8fe],al
 f5d:	40 02 9e 0a 0e 10 41 	add    bl,BYTE PTR [rsi+0x41100e0a]
 f64:	0e                   	(bad)  
 f65:	08 49 0b             	or     BYTE PTR [rcx+0xb],cl
 f68:	24 00                	and    al,0x0
 f6a:	00 00                	add    BYTE PTR [rax],al
 f6c:	6c                   	ins    BYTE PTR es:[rdi],dx
 f6d:	0f 00 00             	sldt   WORD PTR [rax]
 f70:	00 00                	add    BYTE PTR [rax],al
 f72:	00 00                	add    BYTE PTR [rax],al
 f74:	8d 00                	lea    eax,[rax]
 f76:	00 00                	add    BYTE PTR [rax],al
 f78:	00 41 0e             	add    BYTE PTR [rcx+0xe],al
 f7b:	10 83 02 68 0a 0e    	adc    BYTE PTR [rbx+0xe0a6802],al
 f81:	08 4f 0b             	or     BYTE PTR [rdi+0xb],cl
 f84:	7e 0a                	jle    f90 <.LC372+0x148>
 f86:	0e                   	(bad)  
 f87:	08 4a 0b             	or     BYTE PTR [rdx+0xb],cl
 f8a:	48 0e                	rex.W (bad) 
 f8c:	08 00                	or     BYTE PTR [rax],al
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

00000018 0000000000000010 0000001c FDE cie=00000000 pc=0000000000000000..0000000000000007
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0000002c 0000000000000010 00000030 FDE cie=00000000 pc=0000000000000010..000000000000008a
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000040 0000000000000050 00000044 FDE cie=00000000 pc=0000000000000090..0000000000000228
  DW_CFA_advance_loc: 2 to 0000000000000092
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000000094
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000000096
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 1 to 0000000000000097
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000000098
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc: 7 to 000000000000009f
  DW_CFA_def_cfa_offset: 8256
  DW_CFA_advance_loc: 52 to 00000000000000d3
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 00000000000000d4
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 00000000000000d5
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000000d7
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000000d9
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000000db
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 00000000000000e0
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 231 to 00000000000001c7
  DW_CFA_def_cfa_offset: 8264
  DW_CFA_advance_loc: 14 to 00000000000001d5
  DW_CFA_def_cfa_offset: 8272
  DW_CFA_advance_loc: 24 to 00000000000001ed
  DW_CFA_def_cfa_offset: 8264
  DW_CFA_advance_loc: 1 to 00000000000001ee
  DW_CFA_def_cfa_offset: 8256

00000094 0000000000000028 00000098 FDE cie=00000000 pc=0000000000000230..0000000000000288
  DW_CFA_advance_loc: 2 to 0000000000000232
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 10 to 000000000000023c
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 8 to 0000000000000244
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 51 to 0000000000000277
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 8 to 000000000000027f
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 4 to 0000000000000283
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000000c0 0000000000000014 000000c4 FDE cie=00000000 pc=0000000000000290..00000000000002b6
  DW_CFA_advance_loc: 4 to 0000000000000294
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 29 to 00000000000002b1
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000000d8 0000000000000028 000000dc FDE cie=00000000 pc=00000000000002c0..0000000000000348
  DW_CFA_advance_loc: 2 to 00000000000002c2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 7 to 00000000000002c9
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 1 to 00000000000002ca
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc1: 116 to 000000000000033e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 000000000000033f
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 8 to 0000000000000347
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop

00000104 0000000000000044 00000108 FDE cie=00000000 pc=0000000000000350..0000000000000541
  DW_CFA_advance_loc: 2 to 0000000000000352
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 7 to 0000000000000359
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 2 to 000000000000035b
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 1 to 000000000000035c
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 1 to 000000000000035d
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc: 9 to 0000000000000366
  DW_CFA_def_cfa_offset: 16720
  DW_CFA_advance_loc2: 442 to 0000000000000520
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000000521
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000000522
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000000524
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000000526
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000528
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 0000000000000529
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop

0000014c 000000000000001c 00000150 FDE cie=00000000 pc=0000000000000550..00000000000005c7
  DW_CFA_advance_loc: 8 to 0000000000000558
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc1: 99 to 00000000000005bb
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 00000000000005c0
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0000016c 0000000000000060 00000170 FDE cie=00000000 pc=00000000000005d0..0000000000000a7f
  DW_CFA_advance_loc: 62 to 000000000000060e
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 1 to 000000000000060f
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000000610
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 7 to 0000000000000617
  DW_CFA_def_cfa_offset: 3120
  DW_CFA_advance_loc2: 422 to 00000000000007bd
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 00000000000007be
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 00000000000007bf
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000007c1
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 00000000000007c8
  DW_CFA_restore: r3 (rbx)
  DW_CFA_restore: r6 (rbp)
  DW_CFA_restore: r12 (r12)
  DW_CFA_advance_loc: 8 to 00000000000007d0
  DW_CFA_def_cfa_offset: 3120
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc1: 70 to 0000000000000816
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000000817
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000000818
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 000000000000081a
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000000820
  DW_CFA_restore_state
  DW_CFA_advance_loc2: 556 to 0000000000000a4c
  DW_CFA_def_cfa_offset: 3128
  DW_CFA_advance_loc: 1 to 0000000000000a4d
  DW_CFA_def_cfa_offset: 3136
  DW_CFA_advance_loc: 16 to 0000000000000a5d
  DW_CFA_def_cfa_offset: 3128
  DW_CFA_advance_loc: 2 to 0000000000000a5f
  DW_CFA_def_cfa_offset: 3120
  DW_CFA_nop
  DW_CFA_nop

000001d0 0000000000000010 000001d4 FDE cie=00000000 pc=0000000000000a80..0000000000000a85
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000001e4 0000000000000014 000001e8 FDE cie=00000000 pc=0000000000000a90..0000000000000abd
  DW_CFA_advance_loc: 4 to 0000000000000a94
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 33 to 0000000000000ab5
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000001fc 0000000000000014 00000200 FDE cie=00000000 pc=0000000000000ac0..0000000000000ade
  DW_CFA_advance_loc: 4 to 0000000000000ac4
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 16 to 0000000000000ad4
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000214 000000000000002c 00000218 FDE cie=00000000 pc=0000000000000ae0..0000000000000cb1
  DW_CFA_advance_loc: 11 to 0000000000000aeb
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 4 to 0000000000000aef
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 4 to 0000000000000af3
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc2: 440 to 0000000000000cab
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000000cac
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000cae
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 2 to 0000000000000cb0
  DW_CFA_restore: r3 (rbx)
  DW_CFA_restore: r6 (rbp)
  DW_CFA_restore: r12 (r12)
  DW_CFA_nop

00000244 0000000000000048 00000248 FDE cie=00000000 pc=0000000000000cc0..000000000000110c
  DW_CFA_advance_loc: 2 to 0000000000000cc2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000000cc4
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 5 to 0000000000000cc9
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 5 to 0000000000000cce
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000000ccf
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 8 to 0000000000000cd7
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 9 to 0000000000000ce0
  DW_CFA_def_cfa_offset: 1232
  DW_CFA_advance_loc: 55 to 0000000000000d17
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 0000000000000d18
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000000d19
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000000d1b
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000000d1d
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000000d1f
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000000d21
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000000d28
  DW_CFA_restore_state
  DW_CFA_nop

00000290 0000000000000024 00000294 FDE cie=00000000 pc=0000000000001110..000000000000195c
  DW_CFA_advance_loc: 1 to 0000000000001111
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 26 to 000000000000112b
  DW_CFA_def_cfa_offset: 4560
  DW_CFA_advance_loc2: 1948 to 00000000000018c7
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 00000000000018c8
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 00000000000018d0
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000002b8 0000000000000010 000002bc FDE cie=00000000 pc=0000000000001960..000000000000196a
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000002cc 0000000000000010 000002d0 FDE cie=00000000 pc=0000000000001970..000000000000197a
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000002e0 0000000000000040 000002e4 FDE cie=00000000 pc=0000000000001980..0000000000001a9b
  DW_CFA_advance_loc: 1 to 0000000000001981
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000001982
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 9 to 000000000000198b
  DW_CFA_def_cfa_offset: 8432
  DW_CFA_advance_loc1: 207 to 0000000000001a5a
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000001a5b
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000001a5c
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000001a60
  DW_CFA_restore_state
  DW_CFA_advance_loc: 21 to 0000000000001a75
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000001a76
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000001a77
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000001a80
  DW_CFA_restore_state
  DW_CFA_advance_loc: 12 to 0000000000001a8c
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000001a8d
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000001a8e
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 2 to 0000000000001a90
  DW_CFA_restore_state

00000324 000000000000006c 00000328 FDE cie=00000000 pc=0000000000001aa0..0000000000001cc0
  DW_CFA_advance_loc: 2 to 0000000000001aa2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 4 to 0000000000001aa6
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000001aa8
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 1 to 0000000000001aa9
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000001aaa
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc: 7 to 0000000000001ab1
  DW_CFA_def_cfa_offset: 4144
  DW_CFA_advance_loc1: 250 to 0000000000001bab
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001bac
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001bad
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001baf
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001bb1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001bb3
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001bb8
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 165 to 0000000000001c5d
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001c5e
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001c5f
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001c61
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001c63
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001c65
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 11 to 0000000000001c70
  DW_CFA_restore_state
  DW_CFA_advance_loc: 21 to 0000000000001c85
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001c86
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001c87
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001c89
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001c8b
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001c8d
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 0000000000001c8e
  DW_CFA_restore_state
  DW_CFA_nop

00000394 000000000000001c 00000398 FDE cie=00000000 pc=0000000000001cc0..0000000000001cee
  DW_CFA_advance_loc: 1 to 0000000000001cc1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 12 to 0000000000001ccd
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 3 to 0000000000001cd0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 25 to 0000000000001ce9
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000003b4 000000000000001c 000003b8 FDE cie=00000000 pc=0000000000001cf0..0000000000001d1e
  DW_CFA_advance_loc: 1 to 0000000000001cf1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 12 to 0000000000001cfd
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 3 to 0000000000001d00
  DW_CFA_restore_state
  DW_CFA_advance_loc: 25 to 0000000000001d19
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000003d4 0000000000000014 000003d8 FDE cie=00000000 pc=0000000000001d20..0000000000001d8f
  DW_CFA_advance_loc: 4 to 0000000000001d24
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc1: 102 to 0000000000001d8a
  DW_CFA_def_cfa_offset: 8

000003ec 0000000000000014 000003f0 FDE cie=00000000 pc=0000000000001d90..0000000000001dae
  DW_CFA_advance_loc: 4 to 0000000000001d94
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 16 to 0000000000001da4
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000404 0000000000000010 00000408 FDE cie=00000000 pc=0000000000001db0..0000000000001db5
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000418 0000000000000034 0000041c FDE cie=00000000 pc=0000000000001dc0..0000000000001ec2
  DW_CFA_advance_loc: 2 to 0000000000001dc2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r13 (r13) at cfa-16
  DW_CFA_advance_loc: 11 to 0000000000001dcd
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r12 (r12) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000001dce
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r6 (rbp) at cfa-32
  DW_CFA_advance_loc: 1 to 0000000000001dcf
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r3 (rbx) at cfa-40
  DW_CFA_advance_loc: 4 to 0000000000001dd3
  DW_CFA_def_cfa_offset: 80
  DW_CFA_advance_loc1: 232 to 0000000000001ebb
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001ebc
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000001ebd
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001ebf
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001ec1
  DW_CFA_def_cfa_offset: 8

00000450 0000000000000040 00000454 FDE cie=00000000 pc=0000000000001ed0..00000000000021ac
  DW_CFA_advance_loc: 2 to 0000000000001ed2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000001ed4
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000001ed6
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 1 to 0000000000001ed7
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000001ed8
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc: 7 to 0000000000001edf
  DW_CFA_def_cfa_offset: 1104
  DW_CFA_advance_loc1: 68 to 0000000000001f23
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000001f24
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000001f25
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000001f27
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000001f29
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000001f2b
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000001f30
  DW_CFA_restore_state

00000494 0000000000000030 00000498 FDE cie=00000000 pc=00000000000021b0..0000000000002219
  DW_CFA_advance_loc: 17 to 00000000000021c1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 9 to 00000000000021ca
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 19 to 00000000000021dd
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 39 to 0000000000002204
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 4 to 0000000000002208
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000002209
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000002210
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000002214
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 3 to 0000000000002217
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000002218
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000004c8 0000000000000044 000004cc FDE cie=00000000 pc=0000000000002220..00000000000022e6
  DW_CFA_advance_loc: 2 to 0000000000002222
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000002224
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000002226
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 0000000000002228
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000002229
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 1 to 000000000000222a
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 4 to 000000000000222e
  DW_CFA_def_cfa_offset: 64
  DW_CFA_advance_loc1: 171 to 00000000000022d9
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 3 to 00000000000022dc
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 00000000000022dd
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 00000000000022df
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000022e1
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000022e3
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000022e5
  DW_CFA_def_cfa_offset: 8

00000510 0000000000000064 00000514 FDE cie=00000000 pc=00000000000022f0..00000000000025d6
  DW_CFA_advance_loc: 2 to 00000000000022f2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 1 to 00000000000022f3
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 1 to 00000000000022f4
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 7 to 00000000000022fb
  DW_CFA_def_cfa_offset: 8288
  DW_CFA_advance_loc: 58 to 0000000000002335
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000002336
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000002337
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000002339
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000002340
  DW_CFA_restore_state
  DW_CFA_advance_loc: 60 to 000000000000237c
  DW_CFA_def_cfa_offset: 8296
  DW_CFA_advance_loc: 26 to 0000000000002396
  DW_CFA_def_cfa_offset: 8304
  DW_CFA_advance_loc: 5 to 000000000000239b
  DW_CFA_def_cfa_offset: 8312
  DW_CFA_advance_loc: 5 to 00000000000023a0
  DW_CFA_def_cfa_offset: 8320
  DW_CFA_advance_loc: 24 to 00000000000023b8
  DW_CFA_def_cfa_offset: 8288
  DW_CFA_advance_loc1: 181 to 000000000000246d
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 000000000000246e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 000000000000246f
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000002471
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000002478
  DW_CFA_restore_state
  DW_CFA_advance_loc: 61 to 00000000000024b5
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 00000000000024b6
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 00000000000024b7
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000024b9
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 00000000000024c0
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop

00000578 000000000000002c 0000057c FDE cie=00000000 pc=00000000000025e0..000000000000263c
  DW_CFA_advance_loc: 11 to 00000000000025eb
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 1 to 00000000000025ec
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 8 to 00000000000025f4
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 54 to 000000000000262a
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 000000000000262b
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 000000000000262d
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 000000000000262e
  DW_CFA_restore: r3 (rbx)
  DW_CFA_restore: r6 (rbp)
  DW_CFA_restore: r12 (r12)
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000005a8 000000000000001c 000005ac FDE cie=00000000 pc=0000000000002640..00000000000026ad
  DW_CFA_advance_loc: 28 to 000000000000265c
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc1: 64 to 000000000000269c
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 12 to 00000000000026a8
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 00000000000026ac
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop

000005c8 0000000000000028 000005cc FDE cie=00000000 pc=00000000000026b0..0000000000002729
  DW_CFA_advance_loc: 1 to 00000000000026b1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 12 to 00000000000026bd
  DW_CFA_def_cfa_offset: 272
  DW_CFA_advance_loc: 50 to 00000000000026ef
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 00000000000026f0
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 00000000000026f8
  DW_CFA_restore_state
  DW_CFA_advance_loc: 47 to 0000000000002727
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000002728
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000005f4 000000000000001c 000005f8 FDE cie=00000000 pc=0000000000002730..0000000000002763
  DW_CFA_advance_loc: 1 to 0000000000002731
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 26 to 000000000000274b
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000002750
  DW_CFA_restore_state
  DW_CFA_advance_loc: 14 to 000000000000275e
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000614 0000000000000010 00000618 FDE cie=00000000 pc=0000000000002770..0000000000002782
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000628 0000000000000010 0000062c FDE cie=00000000 pc=0000000000002790..00000000000027a2
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0000063c 0000000000000038 00000640 FDE cie=00000000 pc=00000000000027b0..00000000000028a6
  DW_CFA_advance_loc: 2 to 00000000000027b2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 2 to 00000000000027b4
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 5 to 00000000000027b9
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 4 to 00000000000027bd
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 4 to 00000000000027c1
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc1: 221 to 000000000000289e
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 000000000000289f
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000028a1
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000028a3
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000028a5
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop

00000678 000000000000004c 0000067c FDE cie=00000000 pc=00000000000028b0..0000000000002beb
  DW_CFA_advance_loc: 2 to 00000000000028b2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 00000000000028b4
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 00000000000028b6
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 00000000000028b8
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 00000000000028b9
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 1 to 00000000000028ba
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 13 to 00000000000028c7
  DW_CFA_def_cfa_offset: 1104
  DW_CFA_advance_loc2: 327 to 0000000000002a0e
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 0000000000002a0f
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000002a10
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000002a12
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000002a14
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000002a16
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000002a18
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 0000000000002a20
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000006c8 0000000000000034 000006cc FDE cie=00000000 pc=0000000000002bf0..0000000000002db7
  DW_CFA_advance_loc: 1 to 0000000000002bf1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000002bf2
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 4 to 0000000000002bf6
  DW_CFA_def_cfa_offset: 64
  DW_CFA_advance_loc1: 245 to 0000000000002ceb
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000002cec
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000002ced
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 3 to 0000000000002cf0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 34 to 0000000000002d12
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000002d13
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000002d14
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000002d18
  DW_CFA_restore_state
  DW_CFA_nop

00000700 0000000000000058 00000704 FDE cie=00000000 pc=0000000000002dc0..0000000000002e98
  DW_CFA_advance_loc: 2 to 0000000000002dc2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r13 (r13) at cfa-16
  DW_CFA_advance_loc: 5 to 0000000000002dc7
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r12 (r12) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000002dc8
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r6 (rbp) at cfa-32
  DW_CFA_advance_loc: 8 to 0000000000002dd0
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r3 (rbx) at cfa-40
  DW_CFA_advance_loc: 13 to 0000000000002ddd
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc1: 127 to 0000000000002e5c
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 8 to 0000000000002e64
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 4 to 0000000000002e68
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000002e6a
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000002e6c
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000002e70
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000002e74
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 6 to 0000000000002e7a
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000002e7b
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000002e7d
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000002e7f
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 0000000000002e80
  DW_CFA_restore_state
  DW_CFA_advance_loc: 7 to 0000000000002e87
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 8 to 0000000000002e8f
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 4 to 0000000000002e93
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000002e95
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000002e97
  DW_CFA_def_cfa_offset: 8

0000075c 0000000000000034 00000760 FDE cie=00000000 pc=0000000000002ea0..0000000000002ffe
  DW_CFA_advance_loc: 1 to 0000000000002ea1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000002ea2
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 4 to 0000000000002ea6
  DW_CFA_def_cfa_offset: 64
  DW_CFA_advance_loc1: 114 to 0000000000002f18
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000002f19
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000002f1a
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000002f20
  DW_CFA_restore_state
  DW_CFA_advance_loc: 32 to 0000000000002f40
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000002f41
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000002f42
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000002f48
  DW_CFA_restore_state
  DW_CFA_nop

00000794 0000000000000010 00000798 FDE cie=00000000 pc=0000000000003000..000000000000302d
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000007a8 000000000000001c 000007ac FDE cie=00000000 pc=0000000000003030..0000000000003082
  DW_CFA_advance_loc: 17 to 0000000000003041
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 23 to 0000000000003058
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 40 to 0000000000003080
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000003081
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000007c8 0000000000000020 000007cc FDE cie=00000000 pc=0000000000003090..0000000000003115
  DW_CFA_advance_loc: 1 to 0000000000003091
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 12 to 000000000000309d
  DW_CFA_def_cfa_offset: 1056
  DW_CFA_advance_loc1: 118 to 0000000000003113
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000003114
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000007ec 0000000000000020 000007f0 FDE cie=00000000 pc=0000000000003120..00000000000031e3
  DW_CFA_advance_loc: 45 to 000000000000314d
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 35 to 0000000000003170
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc1: 64 to 00000000000031b0
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 4 to 00000000000031b4
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 28 to 00000000000031d0
  DW_CFA_def_cfa_offset: 16
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000810 0000000000000014 00000814 FDE cie=00000000 pc=00000000000031f0..0000000000003235
  DW_CFA_advance_loc: 20 to 0000000000003204
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 44 to 0000000000003230
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000828 000000000000004c 0000082c FDE cie=00000000 pc=0000000000003240..000000000000372e
  DW_CFA_advance_loc: 2 to 0000000000003242
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000003244
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000003246
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 0000000000003248
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 4 to 000000000000324c
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 4 to 0000000000003250
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 10 to 000000000000325a
  DW_CFA_def_cfa_offset: 8288
  DW_CFA_advance_loc2: 675 to 00000000000034fd
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 00000000000034fe
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 00000000000034ff
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 0000000000003501
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000003503
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000003505
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000003507
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000003510
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000878 0000000000000020 0000087c FDE cie=00000000 pc=0000000000003730..0000000000003932
  DW_CFA_advance_loc: 4 to 0000000000003734
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc1: 70 to 000000000000377a
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 0000000000003780
  DW_CFA_restore_state
  DW_CFA_advance_loc2: 322 to 00000000000038c2
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 14 to 00000000000038d0
  DW_CFA_restore_state
  DW_CFA_nop

0000089c 0000000000000048 000008a0 FDE cie=00000000 pc=0000000000003940..00000000000039e3
  DW_CFA_advance_loc: 5 to 0000000000003945
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 9 to 000000000000394e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 5 to 0000000000003953
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 5 to 0000000000003958
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000003959
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 4 to 000000000000395d
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 15 to 000000000000396c
  DW_CFA_def_cfa_offset: 64
  DW_CFA_advance_loc: 54 to 00000000000039a2
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 00000000000039a3
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 00000000000039a4
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 00000000000039a6
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000039a8
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000039aa
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000039ac
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 00000000000039b0
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop

000008e8 0000000000000040 000008ec FDE cie=00000000 pc=00000000000039f0..0000000000003b26
  DW_CFA_advance_loc: 2 to 00000000000039f2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 2 to 00000000000039f4
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 5 to 00000000000039f9
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 4 to 00000000000039fd
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 1 to 00000000000039fe
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc: 10 to 0000000000003a08
  DW_CFA_def_cfa_offset: 4400
  DW_CFA_advance_loc1: 130 to 0000000000003a8a
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 3 to 0000000000003a8d
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000003a8e
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000003a90
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000003a92
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000003a94
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000003a98
  DW_CFA_restore_state

0000092c 0000000000000010 00000930 FDE cie=00000000 pc=0000000000003b30..0000000000003b3b
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000940 0000000000000014 00000944 FDE cie=00000000 pc=0000000000003b40..0000000000003bbc
  DW_CFA_advance_loc1: 105 to 0000000000003ba9
  DW_CFA_def_cfa_offset: 16
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000958 0000000000000024 0000095c FDE cie=00000000 pc=0000000000003bc0..0000000000003c13
  DW_CFA_advance_loc: 1 to 0000000000003bc1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 10 to 0000000000003bcb
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 7 to 0000000000003bd2
  DW_CFA_def_cfa_offset: 1056
  DW_CFA_advance_loc: 62 to 0000000000003c10
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000003c11
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000003c12
  DW_CFA_def_cfa_offset: 8

00000980 000000000000001c 00000984 FDE cie=00000000 pc=0000000000003c20..0000000000003c9d
  DW_CFA_advance_loc: 44 to 0000000000003c4c
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 62 to 0000000000003c8a
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 14 to 0000000000003c98
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000003c9c
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000009a0 0000000000000018 000009a4 FDE cie=00000000 pc=0000000000003ca0..0000000000003cfc
  DW_CFA_advance_loc: 4 to 0000000000003ca4
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc1: 71 to 0000000000003ceb
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000003cf0
  DW_CFA_restore_state
  DW_CFA_nop

000009bc 0000000000000014 000009c0 FDE cie=00000000 pc=0000000000003d00..0000000000003d25
  DW_CFA_advance_loc: 18 to 0000000000003d12
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 9 to 0000000000003d1b
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

000009d4 000000000000001c 000009d8 FDE cie=00000000 pc=0000000000003d30..0000000000003e52
  DW_CFA_advance_loc: 1 to 0000000000003d31
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc1: 236 to 0000000000003e1d
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 3 to 0000000000003e20
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

000009f4 0000000000000024 000009f8 FDE cie=00000000 pc=0000000000003e60..0000000000003ec2
  DW_CFA_advance_loc: 1 to 0000000000003e61
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc1: 69 to 0000000000003ea6
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 0000000000003eb0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 3 to 0000000000003eb3
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 13 to 0000000000003ec0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 1 to 0000000000003ec1
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop

00000a1c 0000000000000014 00000a20 FDE cie=00000000 pc=0000000000003ed0..0000000000003ee7
  DW_CFA_advance_loc: 4 to 0000000000003ed4
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 14 to 0000000000003ee2
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000a34 000000000000001c 00000a38 FDE cie=00000000 pc=0000000000003ef0..0000000000003f25
  DW_CFA_advance_loc: 4 to 0000000000003ef4
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 33 to 0000000000003f15
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 11 to 0000000000003f20
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000003f24
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000a54 000000000000002c 00000a58 FDE cie=00000000 pc=0000000000003f30..0000000000004072
  DW_CFA_advance_loc: 4 to 0000000000003f34
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 50 to 0000000000003f66
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 0000000000003f70
  DW_CFA_restore_state
  DW_CFA_advance_loc: 55 to 0000000000003fa7
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000003fb0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 34 to 0000000000003fd2
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 14 to 0000000000003fe0
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 69 to 0000000000004025
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 11 to 0000000000004030
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000a84 0000000000000010 00000a88 FDE cie=00000000 pc=0000000000004080..0000000000004093
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000a98 0000000000000010 00000a9c FDE cie=00000000 pc=00000000000040a0..00000000000040b2
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000aac 0000000000000024 00000ab0 FDE cie=00000000 pc=00000000000040c0..0000000000004355
  DW_CFA_advance_loc: 8 to 00000000000040c8
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc2: 397 to 0000000000004255
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 11 to 0000000000004260
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 111 to 00000000000042cf
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 00000000000042d0
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000ad4 0000000000000020 00000ad8 FDE cie=00000000 pc=0000000000004360..0000000000004450
  DW_CFA_advance_loc: 1 to 0000000000004361
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 7 to 0000000000004368
  DW_CFA_def_cfa_offset: 272
  DW_CFA_advance_loc1: 121 to 00000000000043e1
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 00000000000043e2
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 00000000000043e8
  DW_CFA_restore_state

00000af8 0000000000000048 00000afc FDE cie=00000000 pc=0000000000004450..00000000000049fe
  DW_CFA_advance_loc: 2 to 0000000000004452
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000004454
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000004456
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 0000000000004458
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000004459
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 1 to 000000000000445a
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 7 to 0000000000004461
  DW_CFA_def_cfa_offset: 33008
  DW_CFA_advance_loc: 42 to 000000000000448b
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 1 to 000000000000448c
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 000000000000448d
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 000000000000448f
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000004491
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000004493
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000004495
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 11 to 00000000000044a0
  DW_CFA_restore_state

00000b44 000000000000001c 00000b48 FDE cie=00000000 pc=0000000000004a00..0000000000004b4c
  DW_CFA_advance_loc: 44 to 0000000000004a2c
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc1: 132 to 0000000000004ab0
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 0000000000004ab8
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 120 to 0000000000004b30
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000b64 0000000000000040 00000b68 FDE cie=00000000 pc=0000000000004b50..0000000000004e9d
  DW_CFA_advance_loc: 2 to 0000000000004b52
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000004b53
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000004b54
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 7 to 0000000000004b5b
  DW_CFA_def_cfa_offset: 8512
  DW_CFA_advance_loc2: 586 to 0000000000004da5
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000004da6
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000004da7
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000004da9
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000004db0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 45 to 0000000000004ddd
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000004dde
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000004ddf
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000004de1
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000004de8
  DW_CFA_restore_state

00000ba8 0000000000000050 00000bac FDE cie=00000000 pc=0000000000004ea0..000000000000515b
  DW_CFA_advance_loc: 2 to 0000000000004ea2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 1 to 0000000000004ea3
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000004ea4
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 7 to 0000000000004eab
  DW_CFA_def_cfa_offset: 8240
  DW_CFA_advance_loc: 31 to 0000000000004eca
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000004ecb
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000004ecc
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000004ece
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 2 to 0000000000004ed0
  DW_CFA_restore_state
  DW_CFA_advance_loc2: 352 to 0000000000005030
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000005031
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000005032
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000005034
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000005038
  DW_CFA_restore_state
  DW_CFA_advance_loc: 24 to 0000000000005050
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000005051
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000005052
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000005054
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000005058
  DW_CFA_restore_state
  DW_CFA_nop

00000bfc 0000000000000020 00000c00 FDE cie=00000000 pc=0000000000005160..0000000000005271
  DW_CFA_advance_loc: 4 to 0000000000005164
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc1: 199 to 000000000000522b
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 13 to 0000000000005238
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 000000000000523c
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000005240
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000c20 0000000000000048 00000c24 FDE cie=00000000 pc=0000000000005280..000000000000532e
  DW_CFA_advance_loc: 1 to 0000000000005281
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r6 (rbp) at cfa-16
  DW_CFA_advance_loc: 6 to 0000000000005287
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r3 (rbx) at cfa-24
  DW_CFA_advance_loc: 4 to 000000000000528b
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc1: 82 to 00000000000052dd
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 4 to 00000000000052e1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 00000000000052e2
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 14 to 00000000000052f0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 00000000000052f4
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 13 to 0000000000005301
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000005302
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 14 to 0000000000005310
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000005314
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 0000000000005315
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000005316
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 0000000000005320
  DW_CFA_restore_state
  DW_CFA_advance_loc: 4 to 0000000000005324
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 4 to 0000000000005328
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000005329
  DW_CFA_def_cfa_offset: 8

00000c6c 0000000000000038 00000c70 FDE cie=00000000 pc=0000000000005330..0000000000005603
  DW_CFA_advance_loc: 9 to 0000000000005339
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 1 to 000000000000533a
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 1 to 000000000000533b
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc1: 254 to 0000000000005439
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 000000000000543a
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 000000000000543c
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 12 to 0000000000005448
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 214 to 000000000000551e
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 4 to 0000000000005522
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 13 to 000000000000552f
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000005538
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop

00000ca8 0000000000000010 00000cac FDE cie=00000000 pc=0000000000005610..000000000000565e
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000cbc 000000000000004c 00000cc0 FDE cie=00000000 pc=0000000000005660..0000000000005d7d
  DW_CFA_advance_loc: 2 to 0000000000005662
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r13 (r13) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000005664
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r12 (r12) at cfa-24
  DW_CFA_advance_loc: 1 to 0000000000005665
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r6 (rbp) at cfa-32
  DW_CFA_advance_loc: 4 to 0000000000005669
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r3 (rbx) at cfa-40
  DW_CFA_advance_loc: 4 to 000000000000566d
  DW_CFA_def_cfa_offset: 64
  DW_CFA_advance_loc: 35 to 0000000000005690
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000005691
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000005692
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000005694
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000005696
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 00000000000056a0
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 90 to 00000000000056fa
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 00000000000056fb
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 00000000000056fc
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000056fe
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000005700
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 8 to 0000000000005708
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000d0c 0000000000000010 00000d10 FDE cie=00000000 pc=0000000000005d80..0000000000005d9e
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000d20 000000000000001c 00000d24 FDE cie=00000000 pc=0000000000005da0..0000000000005dda
  DW_CFA_advance_loc: 4 to 0000000000005da4
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 40 to 0000000000005dcc
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 4 to 0000000000005dd0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 9 to 0000000000005dd9
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000d40 0000000000000054 00000d44 FDE cie=00000000 pc=0000000000005de0..0000000000006310
  DW_CFA_advance_loc: 2 to 0000000000005de2
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r14 (r14) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000005de4
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r13 (r13) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000005de6
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r12 (r12) at cfa-32
  DW_CFA_advance_loc: 1 to 0000000000005de7
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r6 (rbp) at cfa-40
  DW_CFA_advance_loc: 3 to 0000000000005dea
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r3 (rbx) at cfa-48
  DW_CFA_advance_loc: 9 to 0000000000005df3
  DW_CFA_def_cfa_offset: 4272
  DW_CFA_advance_loc2: 336 to 0000000000005f43
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 0000000000005f44
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000005f45
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 0000000000005f47
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000005f49
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000005f4b
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 5 to 0000000000005f50
  DW_CFA_restore_state
  DW_CFA_advance_loc2: 618 to 00000000000061ba
  DW_CFA_def_cfa_offset: 4280
  DW_CFA_advance_loc: 25 to 00000000000061d3
  DW_CFA_def_cfa_offset: 4288
  DW_CFA_advance_loc1: 66 to 0000000000006215
  DW_CFA_def_cfa_offset: 4280
  DW_CFA_advance_loc: 1 to 0000000000006216
  DW_CFA_def_cfa_offset: 4272

00000d98 0000000000000010 00000d9c FDE cie=00000000 pc=0000000000006310..0000000000006331
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000dac 0000000000000040 00000db0 FDE cie=00000000 pc=0000000000006340..000000000000646f
  DW_CFA_advance_loc: 2 to 0000000000006342
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r12 (r12) at cfa-16
  DW_CFA_advance_loc: 4 to 0000000000006346
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r6 (rbp) at cfa-24
  DW_CFA_advance_loc: 4 to 000000000000634a
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r3 (rbx) at cfa-32
  DW_CFA_advance_loc: 7 to 0000000000006351
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 28 to 000000000000636d
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 000000000000636e
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 000000000000636f
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000006371
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000006378
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 83 to 00000000000063cb
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 00000000000063cc
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 1 to 00000000000063cd
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000063cf
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 00000000000063d0
  DW_CFA_restore_state
  DW_CFA_nop
  DW_CFA_nop

00000df0 0000000000000018 00000df4 FDE cie=00000000 pc=0000000000006470..0000000000006d2c
  DW_CFA_advance_loc: 4 to 0000000000006474
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc2: 2227 to 0000000000006d27
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000e0c 0000000000000020 00000e10 FDE cie=00000000 pc=0000000000006d30..0000000000006f6f
  DW_CFA_advance_loc: 25 to 0000000000006d49
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc2: 522 to 0000000000006f53
  DW_CFA_remember_state
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 13 to 0000000000006f60
  DW_CFA_restore_state
  DW_CFA_advance_loc: 10 to 0000000000006f6a
  DW_CFA_restore: r3 (rbx)
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000e30 000000000000005c 00000e34 FDE cie=00000000 pc=0000000000006f70..0000000000007125
  DW_CFA_advance_loc: 11 to 0000000000006f7b
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r13 (r13) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000006f7d
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r12 (r12) at cfa-24
  DW_CFA_advance_loc: 9 to 0000000000006f86
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r6 (rbp) at cfa-32
  DW_CFA_advance_loc: 4 to 0000000000006f8a
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r3 (rbx) at cfa-40
  DW_CFA_advance_loc: 4 to 0000000000006f8e
  DW_CFA_def_cfa_offset: 80
  DW_CFA_advance_loc: 21 to 0000000000006fa3
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 1 to 0000000000006fa4
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 0000000000006fa5
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 0000000000006fa7
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 0000000000006fa9
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 7 to 0000000000006fb0
  DW_CFA_restore_state
  DW_CFA_advance_loc1: 136 to 0000000000007038
  DW_CFA_def_cfa_offset: 8
  DW_CFA_restore: r3 (rbx)
  DW_CFA_restore: r6 (rbp)
  DW_CFA_restore: r12 (r12)
  DW_CFA_restore: r13 (r13)
  DW_CFA_advance_loc: 56 to 0000000000007070
  DW_CFA_def_cfa_offset: 80
  DW_CFA_offset: r3 (rbx) at cfa-40
  DW_CFA_offset: r6 (rbp) at cfa-32
  DW_CFA_offset: r12 (r12) at cfa-24
  DW_CFA_offset: r13 (r13) at cfa-16
  DW_CFA_advance_loc1: 126 to 00000000000070ee
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 3 to 00000000000070f1
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 1 to 00000000000070f2
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000070f4
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000070f6
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 1 to 00000000000070f7
  DW_CFA_restore_state

00000e90 0000000000000010 00000e94 FDE cie=00000000 pc=0000000000007130..0000000000007165
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000ea4 0000000000000010 00000ea8 FDE cie=00000000 pc=0000000000007170..00000000000071b5
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000eb8 0000000000000010 00000ebc FDE cie=00000000 pc=00000000000071c0..00000000000071de
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000ecc 0000000000000010 00000ed0 FDE cie=00000000 pc=00000000000071e0..0000000000007205
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

00000ee0 0000000000000048 00000ee4 FDE cie=00000000 pc=0000000000007210..0000000000007596
  DW_CFA_advance_loc: 2 to 0000000000007212
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r15 (r15) at cfa-16
  DW_CFA_advance_loc: 2 to 0000000000007214
  DW_CFA_def_cfa_offset: 24
  DW_CFA_offset: r14 (r14) at cfa-24
  DW_CFA_advance_loc: 2 to 0000000000007216
  DW_CFA_def_cfa_offset: 32
  DW_CFA_offset: r13 (r13) at cfa-32
  DW_CFA_advance_loc: 2 to 0000000000007218
  DW_CFA_def_cfa_offset: 40
  DW_CFA_offset: r12 (r12) at cfa-40
  DW_CFA_advance_loc: 1 to 0000000000007219
  DW_CFA_def_cfa_offset: 48
  DW_CFA_offset: r6 (rbp) at cfa-48
  DW_CFA_advance_loc: 1 to 000000000000721a
  DW_CFA_def_cfa_offset: 56
  DW_CFA_offset: r3 (rbx) at cfa-56
  DW_CFA_advance_loc: 9 to 0000000000007223
  DW_CFA_def_cfa_offset: 1120
  DW_CFA_advance_loc1: 179 to 00000000000072d6
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 56
  DW_CFA_advance_loc: 3 to 00000000000072d9
  DW_CFA_def_cfa_offset: 48
  DW_CFA_advance_loc: 1 to 00000000000072da
  DW_CFA_def_cfa_offset: 40
  DW_CFA_advance_loc: 2 to 00000000000072dc
  DW_CFA_def_cfa_offset: 32
  DW_CFA_advance_loc: 2 to 00000000000072de
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 2 to 00000000000072e0
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 2 to 00000000000072e2
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 6 to 00000000000072e8
  DW_CFA_restore_state

00000f2c 0000000000000014 00000f30 FDE cie=00000000 pc=00000000000075a0..00000000000075d1
  DW_CFA_advance_loc: 28 to 00000000000075bc
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 20 to 00000000000075d0
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

00000f44 0000000000000020 00000f48 FDE cie=00000000 pc=00000000000075e0..000000000000774b
  DW_CFA_advance_loc: 1 to 00000000000075e1
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 7 to 00000000000075e8
  DW_CFA_def_cfa_offset: 8208
  DW_CFA_advance_loc1: 158 to 0000000000007686
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 1 to 0000000000007687
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 9 to 0000000000007690
  DW_CFA_restore_state

00000f68 0000000000000024 00000f6c FDE cie=00000000 pc=0000000000007750..00000000000077dd
  DW_CFA_advance_loc: 1 to 0000000000007751
  DW_CFA_def_cfa_offset: 16
  DW_CFA_offset: r3 (rbx) at cfa-16
  DW_CFA_advance_loc: 40 to 0000000000007779
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 15 to 0000000000007788
  DW_CFA_restore_state
  DW_CFA_advance_loc: 62 to 00000000000077c6
  DW_CFA_remember_state
  DW_CFA_def_cfa_offset: 8
  DW_CFA_advance_loc: 10 to 00000000000077d0
  DW_CFA_restore_state
  DW_CFA_advance_loc: 8 to 00000000000077d8
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

