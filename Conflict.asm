;���ӳ���Ŀ�ʼ���ӳ����������õ��ļĴ����е����ݶ���������
;���ӳ��򷵻�ǰ�ָ�������ӳ�����üĴ�����ͻ
;ʹ��ջ�����

;�ӳ���ʼ
   ;1.�ӳ�����ʹ�õļĴ�����ջ
   ;2.�ӳ�������
   ;3.�ӳ�����ʹ�õļĴ�����ջ
   ;4.����(ret,retf)
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
    JCXZ OK  ;jcxzָ����CX����0������ת,��������ִ��
    AND BYTE PTR [SI],11011111B
    INC SI
    JMP SHORT CAPITAL
 OK:
    POP SI
    POP CX
    RET       
CODES ENDS
    END START


