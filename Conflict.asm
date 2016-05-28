;在子程序的开始将子程序中所有用到的寄存器中的内容都保存起来
;在子程序返回前恢复，解决子程序调用寄存器冲突
;使用栈来解决

;子程序开始
   ;1.子程序中使用的寄存器入栈
   ;2.子程序内容
   ;3.子程序中使用的寄存器出栈
   ;4.返回(ret,retf)
DATAS SEGMENT
    DB 'conversation',0 
DATAS ENDS
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV SI,0
    CALL CAPITAL
CODENDS:
    MOV AH,4CH
    INT 21H
CAPITAL:
    PUSH CX
    PUSH SI
CHANGE:
    MOV CL,[SI]
    MOV CH,0
    JCXZ OK  ;jcxz指令，如果CX等于0进行跳转,否则向下执行
    AND BYTE PTR [SI],11011111B
    INC SI
    JMP SHORT CAPITAL
 OK:
    POP SI
    POP CX
    RET       
CODES ENDS
    END START


