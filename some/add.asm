
; ----------------------------------------------------------------------------
; triangle.asm
;
; A very simple *Windows* OpenGL application using the GLUT library.  It
; draws a nicely colored triangle in a top-level application window.  One
; interesting thing is that the Windows GL and GLUT functions do NOT use the
; C calling convention; instead they use the "stdcall" convention which is
; like C except that the callee pops the parameters.
; ----------------------------------------------------------------------------

        global  main
        extern  puts
        extern  glClear
        extern  glBegin
        extern  glEnd
        extern  glColor3f
        extern  glVertex3f
        extern  glFlush
        extern  glutInit
        extern  glutInitDisplayMode
        extern  glutInitWindowPosition
        extern  glutInitWindowSize
        extern  glutCreateWindow
        extern  glutDisplayFunc
        extern  glutKeyboardFunc
        extern  glutPostRedisplay
        extern  glutReshapeFunc
        extern  glutMainLoop

        section .text
title:  db      'A Simple Triangle', 0
message:  db    'glutKeyboardFunc - key pressed!', 0
zero:   dd      0.0
one:    dd      1.0
half:   dd      0.5
neghalf:dd      -0.5


display:
        push    dword 16384
        call    glClear              ; glClear(GL_COLOR_BUFFER_BIT)
	  add     esp,4 
        push    dword 9
        call    glBegin              ; glBegin(GL_POLYGON)
	  add     esp,4 
;	  pop	    eax
        push    dword 0
        push    dword 0
        push    dword [one]
        call    glColor3f           ; glColor3f(1, 0, 0)
;	  pop	    eax
;	  pop	    eax
;	  pop	    eax
	  add     esp,12 
        push    dword 0
        push    dword [neghalf]
        push    dword [neghalf]
        call    glVertex3f          ; glVertex(-.5, -.5, 0)
	  add     esp,12 
;	  pop	    eax
;	  pop	    eax
;	  pop	    eax
        push    dword 0
        push    dword [one]
        push    dword 0
        call    glColor3f           ; glColor3f(0, 1, 0)
	  add     esp,12 
;	  pop	    eax
;	  pop	    eax
;	  pop	    eax
        push    dword 0
        push    dword [neghalf]
        push    dword [half]
        call    glVertex3f          ; glVertex(.5, -.5, 0)
	  add     esp,12 
;	  pop	    eax
;	  pop	    eax
;	  pop	    eax
        push    dword [one]
        push    dword 0
        push    dword 0
        call    glColor3f           ; glColor3f(0, 0, 1)
	  add     esp,12 
;	  pop	    eax
;	  pop	    eax
;	  pop	    eax
        push    dword 0
        push    dword [half]
        push    dword 0
        call    glVertex3f          ; glVertex(0, .5, 0)
	  add     esp,12 
;	  pop	    eax
;	  pop	    eax
;	  pop	    eax
        call    glEnd                ; glEnd()
        call    glFlush              ; glFlush()
        ret

keyboard:
;	  pop    ebx;
;	  pop    ebx;
;	  pop    ebx;
	  push message
	  call puts
	  add esp,4
	  call   glutPostRedisplay
	  ret
	  
reshape:
;	  pop    ebx;
;	  pop    ebx;
	  ret

main:
        push    dword [esp+8]           ; push argv
        lea     eax, [esp+8]            ; get addr of argc (offset changed :-)
        push    eax
        call    glutInit             ; glutInit(&argc, argv)
        push    dword 0
        call    glutInitDisplayMode
        push    dword 80
        push    dword 80
        call    glutInitWindowPosition
        push    dword 300
        push    dword 400
        call    glutInitWindowSize
        push    title
        call    glutCreateWindow
        push    display
        call    glutDisplayFunc
	  push    reshape
	  call    glutReshapeFunc
	  push    keyboard
	  call    glutKeyboardFunc
        call    glutMainLoop
        ret