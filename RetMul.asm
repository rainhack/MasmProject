;汇编，CALL和ret指令应用
DATAS SEGMENT
    dw 1,2,3,4,5,6,7,8
    dd 0,0,0,0,0,0,0,0  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV CX,8
    MOV SI,0
    MOV DI,16
  S:
    MOV BX, DS:[SI]
    ADD SI,2
    CALL CUBE
    MOV DS:[DI],AX
    MOV [DI].2,AX
    ADD DI,4
    LOOP S
CUBE: 
    mov ax,bx
    mul bx
    mul bx
    ret
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
