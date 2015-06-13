/*
 *  BASIC mapping
 */

.label /* $A000 - 40960 */ BASIC_A000_cold_start_entry_point = $A000
// .:A000 94 E3                    BASIC cold start entry point

.label /* $A002 - 40962 */ BASIC_A002_warm_start_entry_point = $a002
// .:A002 7B E3                    BASIC warm start entry point

.label /* $A004 - 40964 */ BASIC_A004_cbmbasic_identifier = $A004
// .:A004 43 42 4D 42 41 53 49 43  'cbmbasic', ROM name, unreferenced

.label /* $A00C - 40972 */ BASIC_A00C_basic_command_vectors = $A00C
// these are called by pushing the address onto the stack and doing an RTS so the
// actual address -1 needs to be pushed
// .:A00C 30 A8                    perform END     $80
// .:A00E 41 A7                    perform FOR     $81
// .:A010 1D AD                    perform NEXT    $82
// .:A012 F7 A8                    perform DATA    $83
// .:A014 A4 AB                    perform INPUT#  $84
// .:A016 BE AB                    perform INPUT   $85
// .:A018 80 B0                    perform DIM     $86
// .:A01A 05 AC                    perform READ    $87
// .:A01C A4 A9                    perform LET     $88
// .:A01E 9F A8                    perform GOTO    $89
// .:A020 70 A8                    perform RUN     $8A
// .:A022 27 A9                    perform IF      $8B
// .:A024 1C A8                    perform RESTORE $8C
// .:A026 82 A8                    perform GOSUB   $8D
// .:A028 D1 A8                    perform RETURN  $8E
// .:A02A 3A A9                    perform REM     $8F
// .:A02C 2E A8                    perform STOP    $90
// .:A02E 4A A9                    perform ON      $91
// .:A030 2C B8                    perform WAIT    $92
// .:A032 67 E1                    perform LOAD    $93
// .:A034 55 E1                    perform SAVE    $94
// .:A036 64 E1                    perform VERIFY  $95
// .:A038 B2 B3                    perform DEF     $96
// .:A03A 23 B8                    perform POKE    $97
// .:A03C 7F AA                    perform PRINT#  $98
// .:A03E 9F AA                    perform PRINT   $99
// .:A040 56 A8                    perform CONT    $9A
// .:A042 9B A6                    perform LIST    $9B
// .:A044 5D A6                    perform CLR     $9C
// .:A046 85 AA                    perform CMD     $9D
// .:A048 29 E1                    perform SYS     $9E
// .:A04A BD E1                    perform OPEN    $9F
// .:A04C C6 E1                    perform CLOSE   $A0
// .:A04E 7A AB                    perform GET     $A1
// .:A050 41 A6                    perform NEW     $A2
.label /* $A052 - 41042 */ BASIC_A052_basic_function_vectors = $A052
// action adresses for functions
// .:A052 39 BC                    perform SGN     $B4
// .:A054 CC BC                    perform INT     $B5
// .:A056 58 BC                    perform ABS     $B6
// .:A058 10 03                    perform USR     $B7
// .:A05A 7D B3                    perform FRE     $B8
// .:A05C 9E B3                    perform POS     $B9
// .:A05E 71 BF                    perform SQR     $BA
// .:A060 97 E0                    perform RND     $BB
// .:A062 EA B9                    perform LOG     $BC
// .:A064 ED BF                    perform EXP     $BD
// .:A066 64 E2                    perform COS     $BE
// .:A068 6B E2                    perform SIN     $BF
// .:A06A B4 E2                    perform TAN     $C0
// .:A06C 0E E3                    perform ATN     $C1
// .:A06E 0D B8                    perform PEEK    $C2
// .:A070 7C B7                    perform LEN     $C3
// .:A072 65 B4                    perform STR$    $C4
// .:A074 AD B7                    perform VAL     $C5
// .:A076 8B B7                    perform ASC     $C6
// .:A078 EC B6                    perform CHR$    $C7
// .:A07A 00 B7                    perform LEFT$   $C8
// .:A07C 2C B7                    perform RIGHT$  $C9
// .:A07E 37 B7                    perform MID$    $CA
.label /* $A080 - 41088 */ BASIC_A080_basic_operator_vectors = $A080
// precedence byte and action addresses for operators
// like the primary commands these are called by pushing the address onto the stack
// and doing an RTS, so again the actual address -1 needs to be pushed
// .:A080 79 69 B8                 +
// .:A083 79 52 B8                 -
// .:A086 7B 2A BA                 *
// .:A089 7B 11 BB                 /
// .:A08C 7F 7A BF                 ^
// .:A08F 50 E8 AF                 AND
// .:A092 46 E5 AF                 OR
// .:A095 7D B3 BF                 >
// .:A098 5A D3 AE                 =
// .:A09B 64 15 B0                 <
.label /* $A09E - 41118 */ BASIC_A09E_basic_command_keyword_table = $A09E
// each word has b7 set in it's last character as an end marker, even
// the one character keywords such as "<" or "="
// first are the primary command keywords, only these can start a statement
// .:A09E 45 4E                    end
// .:A0A0 C4 46 4F D2 4E 45 58 D4  for next
// .:A0A8 44 41 54 C1 49 4E 50 55  data input#
// .:A0B0 54 A3 49 4E 50 55 D4 44  input dim
// .:A0B8 49 CD 52 45 41 C4 4C 45  read let
// .:A0C0 D4 47 4F 54 CF 52 55 CE  goto run
// .:A0C8 49 C6 52 45 53 54 4F 52  if restore
// .:A0D0 C5 47 4F 53 55 C2 52 45  gosub return
// .:A0D8 54 55 52 CE 52 45 CD 53  rem stop
// .:A0E0 54 4F D0 4F CE 57 41 49  on wait
// .:A0E8 D4 4C 4F 41 C4 53 41 56  load save
// .:A0F0 C5 56 45 52 49 46 D9 44  verify def
// .:A0F8 45 C6 50 4F 4B C5 50 52  poke print#
// .:A100 49 4E 54 A3 50 52 49 4E  print
// .:A108 D4 43 4F 4E D4 4C 49 53  cont list
// .:A110 D4 43 4C D2 43 4D C4 53  clr cmd sys
// .:A118 59 D3 4F 50 45 CE 43 4C  open close
// .:A120 4F 53 C5 47 45 D4 4E 45  get new
//

.label /* $A128 - 41256 */ BASIC_A129_basic_misc_keyword_table = $A128
// next are the secondary command keywords, these can not start a statement
//
// .:A128 D7 54 41 42 A8 54 CF 46  tab( to
// .:A130 CE 53 50 43 A8 54 48 45  spc( then
// .:A138 CE 4E 4F D4 53 54 45 D0  not stop
//

.label /* $A140 - 41280 */ BASIC_A140_basic_operator_keyword_table = $A140
// next are the operators
//
// .:A140 AB AD AA AF DE 41 4E C4  + - * / ' and
// .:A148 4F D2 BE BD BC           or <=>

.label /* $A14D - 41293 */ BASIC_A14D_basic_function_keyword_table = $A14D
// and finally the functions
// .:A14D                53 47 CE  sgn
// .:A150 49 4E D4 41 42 D3 55 53  int abs usr
// .:A158 D2 46 52 C5 50 4F D3 53  fre pos sqr
// .:A160 51 D2 52 4E C4 4C 4F C7  rnd log
// .:A168 45 58 D0 43 4F D3 53 49  exp cos sin
// .:A170 CE 54 41 CE 41 54 CE 50  tan atn peek
// .:A178 45 45 CB 4C 45 CE 53 54  len str$
// .:A180 52 A4 56 41 CC 41 53 C3  val asc
// .:A188 43 48 52 A4 4C 45 46 54  chr$ left$
// .:A190 A4 52 49 47 48 54 A4 4D  right$ mid$
//
// lastly is GO, this is an add on so that GO TO, as well as GOTO, will work
//
// .:A198 49 44 A4 47 CF           go
// .:A19F 00                       end marker

.label /* $A1A0 - 41376 */ BASIC_A19E_error_message_table = $A1A0
// basic error messages
// .:A1A0 54 4F                    1 too many files
// .:A1A0 4F 20 4D 41 4E 59 20 46
// .:A1A8 49 4C 45 D3 46 49 4C 45  2 file open
// .:A1B0 20 4F 50 45 CE 46 49 4C  3 file not open
// .:A1B8 45 20 4E 4F 54 20 4F 50
// .:A1C0 45 CE 46 49 4C 45 20 4E  4 file not found
// .:A1C8 4F 54 20 46 4F 55 4E C4  5 device not present
// .:A1D0 44 45 56 49 43 45 20 4E
// .:A1D8 4F 54 20 50 52 45 53 45
// .:A1E0 4E D4 4E 4F 54 20 49 4E  6 not input file
// .:A1E8 50 55 54 20 46 49 4C C5
// .:A1F0 4E 4F 54 20 4F 55 54 50  7 not output file
// .:A1F8 55 54 20 46 49 4C C5 4D
// .:A200 49 53 53 49 4E 47 20 46  8 missing filename
// .:A208 49 4C 45 20 4E 41 4D C5
// .:A210 49 4C 4C 45 47 41 4C 20  9 illegal device number
// .:A218 44 45 56 49 43 45 20 4E
// .:A220 55 4D 42 45 D2 4E 45 58  10 next without for
// .:A228 54 20 57 49 54 48 4F 55
// .:A230 54 20 46 4F D2 53 59 4E  11 syntax
// .:A238 54 41 D8 52 45 54 55 52  12 return without gosub
// .:A240 4E 20 57 49 54 48 4F 55
// .:A248 54 20 47 4F 53 55 C2 4F  13 out of data
// .:A250 55 54 20 4F 46 20 44 41
// .:A258 54 C1 49 4C 4C 45 47 41  14 illegal quantity
// .:A260 4C 20 51 55 41 4E 54 49
// .:A268 54 D9 4F 56 45 52 46 4C  15 overflow
// .:A270 4F D7 4F 55 54 20 4F 46  16 out of memory
// .:A278 20 4D 45 4D 4F 52 D9 55  17 undef'd statement
// .:A280 4E 44 45 46 27 44 20 53
// .:A288 54 41 54 45 4D 45 4E D4
// .:A290 42 41 44 20 53 55 42 53  18 bad subscript
// .:A298 43 52 49 50 D4 52 45 44  19 redim'd array
// .:A2A0 49 4D 27 44 20 41 52 52
// .:A2A8 41 D9 44 49 56 49 53 49  20 division by zero
// .:A2B0 4F 4E 20 42 59 20 5A 45
// .:A2B8 52 CF 49 4C 4C 45 47 41  21 illegal direct
// .:A2C0 4C 20 44 49 52 45 43 D4
// .:A2C8 54 59 50 45 20 4D 49 53  22 type mismatch
// .:A2D0 4D 41 54 43 C8 53 54 52  23 string too long
// .:A2D8 49 4E 47 20 54 4F 4F 20
// .:A2E0 4C 4F 4E C7 46 49 4C 45  24 file data
// .:A2E8 20 44 41 54 C1 46 4F 52  25 formula too complex
// .:A2F0 4D 55 4C 41 20 54 4F 4F
// .:A2F8 20 43 4F 4D 50 4C 45 D8
// .:A300 43 41 4E 27 54 20 43 4F  26 can't continue
// .:A308 4E 54 49 4E 55 C5 55 4E  27 undef'd function
// .:A310 44 45 46 27 44 20 46 55
// .:A318 4E 43 54 49 4F CE 56 45  28 verify
// .:A320 52 49 46 D9 4C 4F 41 C4  29 load

.label /* $A328 - 41768 */ BASIC_A328_error_message_pointers = $A328
// error message pointer table
// .:A328 9E A1 AC A1 B5 A1 C2 A1
// .:A330 D0 A1 E2 A1 F0 A1 FF A1
// .:A338 10 A2 25 A2 35 A2 3B A2
// .:A340 4F A2 5A A2 6A A2 72 A2
// .:A348 7F A2 90 A2 9D A2 AA A2
// .:A350 BA A2 C8 A2 D5 A2 E4 A2
// .:A358 ED A2 00 A3 0E A3 1E A3
// .:A360 24 A3 83 A3

.label /* $A364 - 41828 */ BASIC_A364_misc_messages = $A364
// basic messages
// .:A364 0D 4F 4B 0D              OK
// .:A368 00 20 20 45 52 52 4F 52  ERROR
// .:A370 00 20 49 4E 20 00 0D 0A  IN
// .:A378 52 45 41 44 59 2E 0D 0A  READY.
// .:A380 00 0D 0A 42 52 45 41 4B  BREAK
// .:A388 00
// spare byte, not referenced
// .:A389 A0                       unused

.label /* $A38A - 41866 */ BASIC_A38A_find_for_gosub_entry_on_stack = $A38A
// search the stack for FOR or GOSUB activity
// .:A38A BA       TSX             copy stack pointer
// .:A38B E8       INX             +1 pass return address
// .:A38C E8       INX             +2 pass return address
// .:A38D E8       INX             +3 pass calling routine return address
// .:A38E E8       INX             +4 pass calling routine return address
// .:A38F BD 01 01 LDA $0101,X     get the token byte from the stack
// .:A392 C9 81    CMP #$81        is it the FOR token
// .:A394 D0 21    BNE $A3B7       if not FOR token just exit
//                                 it was the FOR token
// .:A396 A5 4A    LDA $4A         get FOR/NEXT variable pointer high byte
// .:A398 D0 0A    BNE $A3A4       branch if not null
// .:A39A BD 02 01 LDA $0102,X     get FOR variable pointer low byte
// .:A39D 85 49    STA $49         save FOR/NEXT variable pointer low byte
// .:A39F BD 03 01 LDA $0103,X     get FOR variable pointer high byte
// .:A3A2 85 4A    STA $4A         save FOR/NEXT variable pointer high byte
// .:A3A4 DD 03 01 CMP $0103,X     compare variable pointer with stacked variable pointer
//                                 high byte
// .:A3A7 D0 07    BNE $A3B0       branch if no match
// .:A3A9 A5 49    LDA $49         get FOR/NEXT variable pointer low byte
// .:A3AB DD 02 01 CMP $0102,X     compare variable pointer with stacked variable pointer
//                                 low byte
// .:A3AE F0 07    BEQ $A3B7       exit if match found
// .:A3B0 8A       TXA             copy index
// .:A3B1 18       CLC             clear carry for add
// .:A3B2 69 12    ADC #$12        add FOR stack use size
// .:A3B4 AA       TAX             copy back to index
// .:A3B5 D0 D8    BNE $A38F       loop if not at start of stack
// .:A3B7 60       RTS

.label /* $A3B8 - 41912 */ BASIC_A3B8_open_space_in_memory = $A3B8
// open up a space in the memory, set the end of arrays
// .:A3B8 20 08 A4 JSR $A408       check available memory, do out of memory error if no room
// .:A3BB 85 31    STA $31         set end of arrays low byte
// .:A3BD 84 32    STY $32         set end of arrays high byte
//                                 open up a space in the memory, don't set the array end
// .:A3BF 38       SEC             set carry for subtract
// .:A3C0 A5 5A    LDA $5A         get block end low byte
// .:A3C2 E5 5F    SBC $5F         subtract block start low byte
// .:A3C4 85 22    STA $22         save MOD(block length/$100) byte
// .:A3C6 A8       TAY             copy MOD(block length/$100) byte to Y
// .:A3C7 A5 5B    LDA $5B         get block end high byte
// .:A3C9 E5 60    SBC $60         subtract block start high byte
// .:A3CB AA       TAX             copy block length high byte to X
// .:A3CC E8       INX             +1 to allow for count=0 exit
// .:A3CD 98       TYA             copy block length low byte to A
// .:A3CE F0 23    BEQ $A3F3       branch if length low byte=0
//                                 block is (X-1)*256+Y bytes, do the Y bytes first
// .:A3D0 A5 5A    LDA $5A         get block end low byte
// .:A3D2 38       SEC             set carry for subtract
// .:A3D3 E5 22    SBC $22         subtract MOD(block length/$100) byte
// .:A3D5 85 5A    STA $5A         save corrected old block end low byte
// .:A3D7 B0 03    BCS $A3DC       branch if no underflow
// .:A3D9 C6 5B    DEC $5B         else decrement block end high byte
// .:A3DB 38       SEC             set carry for subtract
// .:A3DC A5 58    LDA $58         get destination end low byte
// .:A3DE E5 22    SBC $22         subtract MOD(block length/$100) byte
// .:A3E0 85 58    STA $58         save modified new block end low byte
// .:A3E2 B0 08    BCS $A3EC       branch if no underflow
// .:A3E4 C6 59    DEC $59         else decrement block end high byte
// .:A3E6 90 04    BCC $A3EC       branch always
// .:A3E8 B1 5A    LDA ($5A),Y     get byte from source
// .:A3EA 91 58    STA ($58),Y     copy byte to destination
// .:A3EC 88       DEY             decrement index
// .:A3ED D0 F9    BNE $A3E8       loop until Y=0
//                                 now do Y=0 indexed byte
// .:A3EF B1 5A    LDA ($5A),Y     get byte from source
// .:A3F1 91 58    STA ($58),Y     save byte to destination
// .:A3F3 C6 5B    DEC $5B         decrement source pointer high byte
// .:A3F5 C6 59    DEC $59         decrement destination pointer high byte
// .:A3F7 CA       DEX             decrement block count
// .:A3F8 D0 F2    BNE $A3EC       loop until count = $0
// .:A3FA 60       RTS

.label /* $A3FB - 41979 */ BASIC_A3FB_check_stack_depth = $A3FB
// check room on stack for A bytes
// .:A3FB 0A       ASL             *2
// .:A3FC 69 3E    ADC #$3E        need at least $3E bytes free
// .:A3FE B0 35    BCS $A435       if overflow go do out of memory error then warm start
// .:A400 85 22    STA $22         save result in temp byte
// .:A402 BA       TSX             copy stack
// .:A403 E4 22    CPX $22         compare new limit with stack
// .:A405 90 2E    BCC $A435       if stack < limit do out of memory error then warm start
// .:A407 60       RTS

.label /* $A408 - 41992 */ BASIC_A408_check_memory_overlap = $A408
// check available memory, do out of memory error if no room
// .:A408 C4 34    CPY $34         compare with bottom of string space high byte
// .:A40A 90 28    BCC $A434       if less then exit (is ok)
// .:A40C D0 04    BNE $A412       skip next test if greater (tested <)
//                                 high byte was =, now do low byte
// .:A40E C5 33    CMP $33         compare with bottom of string space low byte
// .:A410 90 22    BCC $A434       if less then exit (is ok)
//                                 address is > string storage ptr (oops!)
// .:A412 48       PHA             push address low byte
// .:A413 A2 09    LDX #$09        set index to save $57 to $60 inclusive
// .:A415 98       TYA             copy address high byte (to push on stack)
//                                 save misc numeric work area
// .:A416 48       PHA             push byte
// .:A417 B5 57    LDA $57,X       get byte from $57 to $60
// .:A419 CA       DEX             decrement index
// .:A41A 10 FA    BPL $A416       loop until all done
// .:A41C 20 26 B5 JSR $B526       do garbage collection routine
//                                 restore misc numeric work area
// .:A41F A2 F7    LDX #$F7        set index to restore bytes
// .:A421 68       PLA             pop byte
// .:A422 95 61    STA $61,X       save byte to $57 to $60
// .:A424 E8       INX             increment index
// .:A425 30 FA    BMI $A421       loop while -ve
// .:A427 68       PLA             pop address high byte
// .:A428 A8       TAY             copy back to Y
// .:A429 68       PLA             pop address low byte
// .:A42A C4 34    CPY $34         compare with bottom of string space high byte
// .:A42C 90 06    BCC $A434       if less then exit (is ok)
// .:A42E D0 05    BNE $A435       if greater do out of memory error then warm start
//                                 high byte was =, now do low byte
// .:A430 C5 33    CMP $33         compare with bottom of string space low byte
// .:A432 B0 01    BCS $A435       if >= do out of memory error then warm start
//                                 ok exit, carry clear
// .:A434 60       RTS

.label /* $A435 - 42037 */ BASIC_A435_output_out_of_memory_error = $A435
// do out of memory error then warm start
// .:A435 A2 10    LDX #$10        error code $10, out of memory error
//	                               do error #X then warm start

.label /* $A437 - 42039 */ BASIC_A437_error_routine = $A437
// .:A437 6C 00 03 JMP ($0300)     do error message
//
// do error #X then warm start, the error message vector is initialised to point here
// .:A43A 8A       TXA             copy error number
// .:A43B 0A       ASL             *2
// .:A43C AA       TAX             copy to index
// .:A43D BD 26 A3 LDA $A326,X     get error message pointer low byte
// .:A440 85 22    STA $22         save it
// .:A442 BD 27 A3 LDA $A327,X     get error message pointer high byte
// .:A445 85 23    STA $23         save it
// .:A447 20 CC FF JSR $FFCC       close input and output channels
// .:A44A A9 00    LDA #$00        clear A
// .:A44C 85 13    STA $13         clear current I/O channel, flag default
// .:A44E 20 D7 AA JSR $AAD7       print CR/LF
// .:A451 20 45 AB JSR $AB45       print "?"
// .:A454 A0 00    LDY #$00        clear index
// .:A456 B1 22    LDA ($22),Y     get byte from message
// .:A458 48       PHA             save status
// .:A459 29 7F    AND #$7F        mask 0xxx xxxx, clear b7
// .:A45B 20 47 AB JSR $AB47       output character
// .:A45E C8       INY             increment index
// .:A45F 68       PLA             restore status
// .:A460 10 F4    BPL $A456       loop if character was not end marker
// .:A462 20 7A A6 JSR $A67A       flush BASIC stack and clear continue pointer
// .:A465 A9 69    LDA #$69        set " ERROR" pointer low byte
// .:A467 A0 A3    LDY #$A3        set " ERROR" pointer high byte

.label /* $A469 - 42089 */ BASIC_A469_break_entry = $A469
// print string and do warm start, break entry
// .:A469 20 1E AB JSR $AB1E       print null terminated string
// .:A46C A4 3A    LDY $3A         get current line number high byte
// .:A46E C8       INY             increment it
// .:A46F F0 03    BEQ $A474       branch if was in immediate mode
// .:A471 20 C2 BD JSR $BDC2       do " IN " line number message

.label /* $A474 - 42100 */ BASIC_A474_restart_basic = $A474
// do warm start
// .:A474 A9 76    LDA #$76        set "READY." pointer low byte
// .:A476 A0 A3    LDY #$A3        set "READY." pointer high byte
// .:A478 20 1E AB JSR $AB1E       print null terminated string
// .:A47B A9 80    LDA #$80        set for control messages only
// .:A47D 20 90 FF JSR $FF90       control kernal messages

.label /* $A480 - 42112 */ BASIC_A480_input_identify_basic_line = $A480
// .:A480 6C 02 03 JMP ($0302)     do BASIC warm start

.label /* $A483 - 42115 */ BASIC_A483_basic_warm_start = $A483
// BASIC warm start, the warm start vector is initialised to point here
// .:A483 20 60 A5 JSR $A560       call for BASIC input
// .:A486 86 7A    STX $7A         save BASIC execute pointer low byte
// .:A488 84 7B    STY $7B         save BASIC execute pointer high byte
// .:A48A 20 73 00 JSR $0073       increment and scan memory
// .:A48D AA       TAX             copy byte to set flags
// .:A48E F0 F0    BEQ $A480       loop if no input
//                                 got to interpret the input line now ....
// .:A490 A2 FF    LDX #$FF        current line high byte to -1, indicates immediate mode
// .:A492 86 3A    STX $3A         set current line number high byte
// .:A494 90 06    BCC $A49C       if numeric character go handle new BASIC line
//                                 no line number .. immediate mode
// .:A496 20 79 A5 JSR $A579       crunch keywords into BASIC tokens
// .:A499 4C E1 A7 JMP $A7E1       go scan and interpret code

.label /* $A49C - 42140 */ BASIC_A49C_get_line_number_tokenise_text = $A49C
// handle new BASIC line
//
// .:A49C 20 6B A9 JSR $A96B       get fixed-point number into temporary integer
// .:A49F 20 79 A5 JSR $A579       crunch keywords into BASIC tokens

.label /* $A4A2 - 42146 */ BASIC_A4A2_insert_basic_text = $A4A2
// .:A4A2 84 0B    STY $0B         save index pointer to end of crunched line
// .:A4A4 20 13 A6 JSR $A613       search BASIC for temporary integer line number
// .:A4A7 90 44    BCC $A4ED       if not found skip the line delete
//                                line # already exists so delete it
// .:A4A9 A0 01    LDY #$01        set index to next line pointer high byte
// .:A4AB B1 5F    LDA ($5F),Y     get next line pointer high byte
// .:A4AD 85 23    STA $23         save it
// .:A4AF A5 2D    LDA $2D         get start of variables low byte
// .:A4B1 85 22    STA $22         save it
// .:A4B3 A5 60    LDA $60         get found line pointer high byte
// .:A4B5 85 25    STA $25         save it
// .:A4B7 A5 5F    LDA $5F         get found line pointer low byte
// .:A4B9 88       DEY             decrement index
// .:A4BA F1 5F    SBC ($5F),Y     subtract next line pointer low byte
// .:A4BC 18       CLC             clear carry for add
// .:A4BD 65 2D    ADC $2D         add start of variables low byte
// .:A4BF 85 2D    STA $2D         set start of variables low byte
// .:A4C1 85 24    STA $24         save destination pointer low byte
// .:A4C3 A5 2E    LDA $2E         get start of variables high byte
// .:A4C5 69 FF    ADC #$FF        -1 + carry
// .:A4C7 85 2E    STA $2E         set start of variables high byte
// .:A4C9 E5 60    SBC $60         subtract found line pointer high byte
// .:A4CB AA       TAX             copy to block count
// .:A4CC 38       SEC             set carry for subtract
// .:A4CD A5 5F    LDA $5F         get found line pointer low byte
// .:A4CF E5 2D    SBC $2D         subtract start of variables low byte
// .:A4D1 A8       TAY             copy to bytes in first block count
// .:A4D2 B0 03    BCS $A4D7       branch if no underflow
// .:A4D4 E8       INX             increment block count, correct for = 0 loop exit
// .:A4D5 C6 25    DEC $25         decrement destination high byte
// .:A4D7 18       CLC             clear carry for add
// .:A4D8 65 22    ADC $22         add source pointer low byte
// .:A4DA 90 03    BCC $A4DF       branch if no overflow
// .:A4DC C6 23    DEC $23         else decrement source pointer high byte
// .:A4DE 18       CLC             clear carry
//                                 close up memory to delete old line
// .:A4DF B1 22    LDA ($22),Y     get byte from source
// .:A4E1 91 24    STA ($24),Y     copy to destination
// .:A4E3 C8       INY             increment index
// .:A4E4 D0 F9    BNE $A4DF       while <> 0 do this block
// .:A4E6 E6 23    INC $23         increment source pointer high byte
// .:A4E8 E6 25    INC $25         increment destination pointer high byte
// .:A4EA CA       DEX             decrement block count
// .:A4EB D0 F2    BNE $A4DF       loop until all done
//                                 got new line in buffer and no existing same #
// .:A4ED 20 59 A6 JSR $A659       reset execution to start, clear variables, flush stack
//                                 and return
// .:A4F0 20 33 A5 JSR $A533       rebuild BASIC line chaining
// .:A4F3 AD 00 02 LDA $0200       get first byte from buffer
// .:A4F6 F0 88    BEQ $A480       if no line go do BASIC warm start
//                                 else insert line into memory
// .:A4F8 18       CLC             clear carry for add
// .:A4F9 A5 2D    LDA $2D         get start of variables low byte
// .:A4FB 85 5A    STA $5A         save as source end pointer low byte
// .:A4FD 65 0B    ADC $0B         add index pointer to end of crunched line
// .:A4FF 85 58    STA $58         save as destination end pointer low byte
// .:A501 A4 2E    LDY $2E         get start of variables high byte
// .:A503 84 5B    STY $5B         save as source end pointer high byte
// .:A505 90 01    BCC $A508       branch if no carry to high byte
// .:A507 C8       INY             else increment high byte
// .:A508 84 59    STY $59         save as destination end pointer high byte
// .:A50A 20 B8 A3 JSR $A3B8       open up space in memory
//                                 most of what remains to do is copy the crunched line into
//                                 the space opened up in memory, however, before the crunched line
//                                 comes the next line pointer and the line number. the
//                                 line number is retrieved from the temporary integer and stored
//                                 in memory, this overwrites the bottom two bytes on the stack.
//                                 next the line is copied and the next line pointer is filled with
//                                 whatever was in two bytes above the line number in the stack.
//                                 this is ok because the line pointer gets fixed in the line
//                                 chain re-build.
// .:A50D A5 14    LDA $14         get line number low byte
// .:A50F A4 15    LDY $15         get line number high byte
// .:A511 8D FE 01 STA $01FE       save line number low byte before crunched line
// .:A514 8C FF 01 STY $01FF       save line number high byte before crunched line
// .:A517 A5 31    LDA $31         get end of arrays low byte
// .:A519 A4 32    LDY $32         get end of arrays high byte
// .:A51B 85 2D    STA $2D         set start of variables low byte
// .:A51D 84 2E    STY $2E         set start of variables high byte
// .:A51F A4 0B    LDY $0B         get index to end of crunched line
// .:A521 88       DEY             -1
// .:A522 B9 FC 01 LDA $01FC,Y     get byte from crunched line
// .:A525 91 5F    STA ($5F),Y     save byte to memory
// .:A527 88       DEY             decrement index
// .:A528 10 F8    BPL $A522       loop while more to do
//                                 reset execution, clear variables, flush stack, rebuild BASIC
//                                 chain and do warm start
// .:A52A 20 59 A6 JSR $A659       reset execution to start, clear variables and flush stack
// .:A52D 20 33 A5 JSR $A533       rebuild BASIC line chaining
// .:A530 4C 80 A4 JMP $A480       go do BASIC warm start

.label /* $A533 - 42291 */ BASIC_A533_rechain_lines = $A533
// rebuild BASIC line chaining
// .:A533 A5 2B    LDA $2B         get start of memory low byte
// .:A535 A4 2C    LDY $2C         get start of memory high byte
// .:A537 85 22    STA $22         set line start pointer low byte
// .:A539 84 23    STY $23         set line start pointer high byte
// .:A53B 18       CLC             clear carry for add
// .:A53C A0 01    LDY #$01        set index to pointer to next line high byte
// .:A53E B1 22    LDA ($22),Y     get pointer to next line high byte
// .:A540 F0 1D    BEQ $A55F       exit if null, [EOT]
// .:A542 A0 04    LDY #$04        point to first code byte of line
//                                 there is always 1 byte + [EOL] as null entries are deleted
// .:A544 C8       INY             next code byte
// .:A545 B1 22    LDA ($22),Y     get byte
// .:A547 D0 FB    BNE $A544       loop if not [EOL]
// .:A549 C8       INY             point to byte past [EOL], start of next line
// .:A54A 98       TYA             copy it
// .:A54B 65 22    ADC $22         add line start pointer low byte
// .:A54D AA       TAX             copy to X
// .:A54E A0 00    LDY #$00        clear index, point to this line's next line pointer
// .:A550 91 22    STA ($22),Y     set next line pointer low byte
// .:A552 A5 23    LDA $23         get line start pointer high byte
// .:A554 69 00    ADC #$00        add any overflow
// .:A556 C8       INY             increment index to high byte
// .:A557 91 22    STA ($22),Y     set next line pointer high byte
// .:A559 86 22    STX $22         set line start pointer low byte
// .:A55B 85 23    STA $23         set line start pointer high byte
// .:A55D 90 DD    BCC $A53C       go do next line, branch always
// .:A55F 60       RTS


.label /* $A560 - 42336 */ BASIC_A560_input_line_into_buffer = $A560
// call for BASIC input
// .:A560 A2 00    LDX #$00        set channel $00, keyboard
// .:A562 20 12 E1 JSR $E112       input character from channel with error check
// .:A565 C9 0D    CMP #$0D        compare with [CR]
// .:A567 F0 0D    BEQ $A576       if [CR] set XY to $200 - 1, print [CR] and exit
//                                character was not [CR]
// .:A569 9D 00 02 STA $0200,X     save character to buffer
// .:A56C E8       INX             increment buffer index
// .:A56D E0 59    CPX #$59        compare with max+1
// .:A56F 90 F1    BCC $A562       branch if < max+1
// .:A571 A2 17    LDX #$17        error $17, string too long error
// .:A573 4C 37 A4 JMP $A437       do error #X then warm start
// .:A576 4C CA AA JMP $AACA       set XY to $200 - 1 and print [CR]

.label /* $A579 - 42361 */ BASIC_A579_tokenise_input_buffer = $A579
// crunch BASIC tokens vector
// .:A579 6C 04 03 JMP ($0304)     do crunch BASIC tokens
//
// crunch BASIC tokens, the crunch BASIC tokens vector is initialised to point here
//
// .:A57C A6 7A    LDX $7A         get BASIC execute pointer low byte
// .:A57E A0 04    LDY #$04        set save index
// .:A580 84 0F    STY $0F         clear open quote/DATA flag
// .:A582 BD 00 02 LDA $0200,X     get a byte from the input buffer
// .:A585 10 07    BPL $A58E       if b7 clear go do crunching
// .:A587 C9 FF    CMP #$FF        compare with the token for PI, this toke is input
//                                 directly from the keyboard as the PI character
// .:A589 F0 3E    BEQ $A5C9       if PI save byte then continue crunching
//                                 this is the bit of code that stops you being able to enter
//                                 some keywords as just single shifted characters. If this
//                                 dropped through you would be able to enter GOTO as just
//                                 [SHIFT]G
// .:A58B E8       INX             increment read index
// .:A58C D0 F4    BNE $A582       loop if more to do, branch always
// .:A58E C9 20    CMP #$20        compare with [SPACE]
// .:A590 F0 37    BEQ $A5C9       if [SPACE] save byte then continue crunching
// .:A592 85 08    STA $08         save buffer byte as search character
// .:A594 C9 22    CMP #$22        compare with quote character
// .:A596 F0 56    BEQ $A5EE       if quote go copy quoted string
// .:A598 24 0F    BIT $0F         get open quote/DATA token flag
// .:A59A 70 2D    BVS $A5C9       branch if b6 of Oquote set, was DATA
//                                 go save byte then continue crunching
// .:A59C C9 3F    CMP #$3F        compare with "?" character
// .:A59E D0 04    BNE $A5A4       if not "?" continue crunching
// .:A5A0 A9 99    LDA #$99        else the keyword token is $99, PRINT
// .:A5A2 D0 25    BNE $A5C9       go save byte then continue crunching, branch always
// .:A5A4 C9 30    CMP #$30        compare with "0"
// .:A5A6 90 04    BCC $A5AC       branch if <, continue crunching
// .:A5A8 C9 3C    CMP #$3C        compare with "<"
// .:A5AA 90 1D    BCC $A5C9       if <, 0123456789:; go save byte then continue crunching
//                                 gets here with next character not numeric, ";" or ":"
// .:A5AC 84 71    STY $71         copy save index
// .:A5AE A0 00    LDY #$00        clear table pointer
// .:A5B0 84 0B    STY $0B         clear word index
// .:A5B2 88       DEYadjust for pre increment loop
// .:A5B3 86 7A    STX $7A         save BASIC execute pointer low byte, buffer index
// .:A5B5 CA       DEX             adjust for pre increment loop
// .:A5B6 C8       INY             next table byte
// .:A5B7 E8       INX             next buffer byte
// .:A5B8 BD 00 02 LDA $0200,X     get byte from input buffer
// .:A5BB 38       SEC             set carry for subtract
// .:A5BC F9 9E A0 SBC $A09E,Y     subtract table byte
// .:A5BF F0 F5    BEQ $A5B6       go compare next if match
// .:A5C1 C9 80    CMP #$80        was it end marker match ?
// .:A5C3 D0 30    BNE $A5F5       branch if not, not found keyword
//                                 actually this works even if the input buffer byte is the
//                                 end marker, i.e. a shifted character. As you can't enter
//                                 any keywords as a single shifted character, see above,
//                                 you can enter keywords in shorthand by shifting any
//                                 character after the first. so RETURN can be entered as
//                                 R[SHIFT]E, RE[SHIFT]T, RET[SHIFT]U or RETU[SHIFT]R.
//                                 RETUR[SHIFT]N however will not work because the [SHIFT]N
//                                 will match the RETURN end marker so the routine will try
//                                 to match the next character.
//                                 else found keyword
// .:A5C5 05 0B    ORA $0B         OR with word index, +$80 in A makes token
// .:A5C7 A4 71    LDY $71         restore save index
//                                 save byte then continue crunching
// .:A5C9 E8       INX             increment buffer read index
// .:A5CA C8       INY             increment save index
// .:A5CB 99 FB 01 STA $01FB,Y     save byte to output
// .:A5CE B9 FB 01 LDA $01FB,Y     get byte from output, set flags
// .:A5D1 F0 36    BEQ $A609       branch if was null [EOL]
//                                 A holds the token here
// .:A5D3 38       SEC             set carry for subtract
// .:A5D4 E9 3A    SBC #$3A        subtract ":"
// .:A5D6 F0 04    BEQ $A5DC       branch if it was (is now $00)
//                                 A now holds token-':'
// .:A5D8 C9 49    CMP #$49        compare with the token for DATA-':'
// .:A5DA D0 02    BNE $A5DE       if not DATA go try REM
//                                 token was : or DATA
// .:A5DC 85 0F    STA $0F         save the token-$3A
// .:A5DE 38       SEC             set carry for subtract
// .:A5DF E9 55    SBC #$55        subtract the token for REM-':'
// .:A5E1 D0 9F    BNE $A582       if wasn't REM crunch next bit of line
// .:A5E3 85 08    STA $08         else was REM so set search for [EOL]
//                                 loop for "..." etc.
// .:A5E5 BD 00 02 LDA $0200,X     get byte from input buffer
// .:A5E8 F0 DF    BEQ $A5C9       if null [EOL] save byte then continue crunching
// .:A5EA C5 08    CMP $08         compare with stored character
// .:A5EC F0 DB    BEQ $A5C9       if match save byte then continue crunching
// .:A5EE C8       INY             increment save index
// .:A5EF 99 FB 01 STA $01FB,Y     save byte to output
// .:A5F2 E8       INX             increment buffer index
// .:A5F3 D0 F0    BNE $A5E5       loop while <> 0, should never reach 0
//                                 not found keyword this go
// .:A5F5 A6 7A    LDX $7A         restore BASIC execute pointer low byte
// .:A5F7 E6 0B    INC $0B         increment word index (next word)
//                                 now find end of this word in the table
// .:A5F9 C8       INY             increment table index
// .:A5FA B9 9D A0 LDA $A09D,Y     get table byte
// .:A5FD 10 FA    BPL $A5F9       loop if not end of word yet
// .:A5FF B9 9E A0 LDA $A09E,Y     get byte from keyword table
// .:A602 D0 B4    BNE $A5B8       go test next word if not zero byte, end of table
//                                 reached end of table with no match
// .:A604 BD 00 02 LDA $0200,X     restore byte from input buffer
// .:A607 10 BE    BPL $A5C7       branch always, all unmatched bytes in the buffer are
//                                 $00 to $7F, go save byte in output and continue crunching
//                                 reached [EOL]
// .:A609 99 FD 01 STA $01FD,Y     save [EOL]
// .:A60C C6 7B    DEC $7B         decrement BASIC execute pointer high byte
// .:A60E A9 FF    LDA #$FF        point to start of buffer-1
// .:A610 85 7A    STA $7A         set BASIC execute pointer low byte
// .:A612 60       RTS

.label /* $A613 - 42515 */ BASIC_A613_search_for_line_number = $A613
// search BASIC for temporary integer line number
// .:A613 A5 2B    LDA $2B         get start of memory low byte
// .:A615 A6 2C    LDX $2C         get start of memory high byte
//
// search Basic for temp integer line number from AX
//                                 returns carry set if found
// .:A617 A0 01    LDY #$01        set index to next line pointer high byte
// .:A619 85 5F    STA $5F         save low byte as current
// .:A61B 86 60    STX $60         save high byte as current
// .:A61D B1 5F    LDA ($5F),Y     get next line pointer high byte from address
// .:A61F F0 1F    BEQ $A640       pointer was zero so done, exit
// .:A621 C8       INY             increment index ...
// .:A622 C8       INY             ... to line # high byte
// .:A623 A5 15    LDA $15         get temporary integer high byte
// .:A625 D1 5F    CMP ($5F),Y     compare with line # high byte
// .:A627 90 18    BCC $A641       exit if temp < this line, target line passed
// .:A629 F0 03    BEQ $A62E       go check low byte if =
// .:A62B 88       DEY             else decrement index
// .:A62C D0 09    BNE $A637       branch always
// .:A62E A5 14    LDA $14         get temporary integer low byte
// .:A630 88       DEY             decrement index to line # low byte
// .:A631 D1 5F    CMP ($5F),Y     compare with line # low byte
// .:A633 90 0C    BCC $A641       exit if temp < this line, target line passed
// .:A635 F0 0A    BEQ $A641       exit if temp = (found line#)
//                                 not quite there yet
// .:A637 88       DEY             decrement index to next line pointer high byte
// .:A638 B1 5F    LDA ($5F),Y     get next line pointer high byte
// .:A63A AA       TAX             copy to X
// .:A63B 88       DEY             decrement index to next line pointer low byte
// .:A63C B1 5F    LDA ($5F),Y     get next line pointer low byte
// .:A63E B0 D7    BCS $A617       go search for line # in temporary integer
//                                 from AX, carry always set
// .:A640 18       CLC             clear found flag
// .:A641 60       RTS

.label /* $A642 - 42562 */ BASIC_A642_perform_new = $A642
// perform NEW
// .:A642 D0 FD    BNE $A641       exit if following byte to allow syntax error
// .:A644 A9 00    LDA #$00        clear A
// .:A646 A8       TAY             clear index
// .:A647 91 2B    STA ($2B),Y     clear pointer to next line low byte
// .:A649 C8       INY             increment index
// .:A64A 91 2B    STA ($2B),Y     clear pointer to next line high byte, erase program
// .:A64C A5 2B    LDA $2B         get start of memory low byte
// .:A64E 18       CLC             clear carry for add
// .:A64F 69 02    ADC #$02        add null program length
// .:A651 85 2D    STA $2D         set start of variables low byte
// .:A653 A5 2C    LDA $2C         get start of memory high byte
// .:A655 69 00    ADC #$00        add carry
// .:A657 85 2E    STA $2E         set start of variables high byte

.label /* $A65E - 42590 */ BASIC_A65E_perform_clr = $A65E
// perform CLR
// .:A65E D0 2D    BNE $A68D       exit if following byte to allow syntax error
// .:A660 20 E7 FF JSR $FFE7       close all channels and files
// .:A663 A5 37    LDA $37         get end of memory low byte
// .:A665 A4 38    LDY $38         get end of memory high byte
// .:A667 85 33    STA $33         set bottom of string space low byte, clear strings
// .:A669 84 34    STY $34         set bottom of string space high byte
// .:A66B A5 2D    LDA $2D         get start of variables low byte
// .:A66D A4 2E    LDY $2E         get start of variables high byte
// .:A66F 85 2F    STA $2F         set end of variables low byte, clear variables
// .:A671 84 30    STY $30         set end of variables high byte
// .:A673 85 31    STA $31         set end of arrays low byte, clear arrays
// .:A675 84 32    STY $32         set end of arrays high byte

.label /* $A677 - 42615 */ BASIC_A677_perform_restore = $A677
// do RESTORE and clear stack
// .:A677 20 1D A8 JSR $A81D       perform RESTORE
// flush BASIC stack and clear the continue pointer
// .:A67A A2 19    LDX #$19        get the descriptor stack start
// .:A67C 86 16    STX $16         set the descriptor stack pointer
// .:A67E 68       PLA             pull the return address low byte
// .:A67F A8       TAY             copy it
// .:A680 68       PLA             pull the return address high byte
// .:A681 A2 FA    LDX #$FA        set the cleared stack pointer
// .:A683 9A       TXS             set the stack
// .:A684 48       PHA             push the return address high byte
// .:A685 98       TYA             restore the return address low byte
// .:A686 48       PHA             push the return address low byte
// .:A687 A9 00    LDA #$00        clear A
// .:A689 85 3E    STA $3E         clear the continue pointer high byte
// .:A68B 85 10    STA $10         clear the subscript/FNX flag
// .:A68D 60       RTS

.label /* $A68E - 42638 */ BASIC_A68E_reset_txtptr = $A68E
// set BASIC execute pointer to start of memory - 1
// .:A68E 18       CLC             clear carry for add
// .:A68F A5 2B    LDA $2B         get start of memory low byte
// .:A691 69 FF    ADC #$FF        add -1 low byte
// .:A693 85 7A    STA $7A         set BASIC execute pointer low byte
// .:A695 A5 2C    LDA $2C         get start of memory high byte
// .:A697 69 FF    ADC #$FF        add -1 high byte
// .:A699 85 7B    STA $7B         save BASIC execute pointer high byte
// .:A69B 60       RTS

.label /* $A69C - 42652 */ BASIC_A69C_perform_list = $A69C
// perform LIST
// .:A69C 90 06    BCC $A6A4       branch if next character not token (LIST n...)
// .:A69E F0 04    BEQ $A6A4       branch if next character [NULL] (LIST)
// .:A6A0 C9 AB    CMP #$AB        compare with token for -
// .:A6A2 D0 E9    BNE $A68D       exit if not - (LIST -m)
//                                 LIST [[n][-m]]
//                                 this bit sets the n , if present, as the start and end
// .:A6A4 20 6B A9 JSR $A96B       get fixed-point number into temporary integer
// .:A6A7 20 13 A6 JSR $A613       search BASIC for temporary integer line number
// .:A6AA 20 79 00 JSR $0079       scan memory
// .:A6AD F0 0C    BEQ $A6BB       branch if no more chrs
//                                 this bit checks the - is present
// .:A6AF C9 AB    CMP #$AB        compare with token for -
// .:A6B1 D0 8E    BNE $A641       return if not "-" (will be SN error)
//                                 LIST [n]-m
//                                 the - was there so set m as the end value
// .:A6B3 20 73 00 JSR $0073       increment and scan memory
// .:A6B6 20 6B A9 JSR $A96B       get fixed-point number into temporary integer
// .:A6B9 D0 86    BNE $A641       exit if not ok
// .:A6BB 68       PLA             dump return address low byte, exit via warm start
// .:A6BC 68       PLA             dump return address high byte
// .:A6BD A5 14    LDA $14         get temporary integer low byte
// .:A6BF 05 15    ORA $15         OR temporary integer high byte
// .:A6C1 D0 06    BNE $A6C9       branch if start set
// .:A6C3 A9 FF    LDA #$FF        set for -1
// .:A6C5 85 14    STA $14         set temporary integer low byte
// .:A6C7 85 15    STA $15         set temporary integer high byte
// .:A6C9 A0 01    LDY #$01        set index for line
// .:A6CB 84 0F    STY $0F         clear open quote flag
// .:A6CD B1 5F    LDA ($5F),Y     get next line pointer high byte
// .:A6CF F0 43    BEQ $A714       if null all done so exit
// .:A6D1 20 2C A8 JSR $A82C       do CRTL-C check vector
// .:A6D4 20 D7 AA JSR $AAD7       print CR/LF
// .:A6D7 C8       INY             increment index for line
// .:A6D8 B1 5F    LDA ($5F),Y     get line number low byte
// .:A6DA AA       TAX             copy to X
// .:A6DB C8       INY             increment index
// .:A6DC B1 5F    LDA ($5F),Y     get line number high byte
// .:A6DE C5 15    CMP $15         compare with temporary integer high byte
// .:A6E0 D0 04    BNE $A6E6       branch if no high byte match
// .:A6E2 E4 14    CPX $14         compare with temporary integer low byte
// .:A6E4 F0 02    BEQ $A6E8       branch if = last line to do, < will pass next branch
//                                 else
// .:A6E6 B0 2C    BCS $A714       if greater all done so exit
// .:A6E8 84 49    STY $49         save index for line
// .:A6EA 20 CD BD JSR $BDCD       print XA as unsigned integer
// .:A6ED A9 20    LDA #$20        space is the next character
// .:A6EF A4 49    LDY $49         get index for line
// .:A6F1 29 7F    AND #$7F        mask top out bit of character
// .:A6F3 20 47 AB JSR $AB47       go print the character
// .:A6F6 C9 22    CMP #$22        was it " character
// .:A6F8 D0 06    BNE $A700       if not skip the quote handle
//                                 we are either entering or leaving a pair of quotes
// .:A6FA A5 0F    LDA $0F         get open quote flag
// .:A6FC 49 FF    EOR #$FF        toggle it
// .:A6FE 85 0F    STA $0F         save it back
// .:A700 C8       INY             increment index
// .:A701 F0 11    BEQ $A714       line too long so just bail out and do a warm start
// .:A703 B1 5F    LDA ($5F),Y     get next byte
// .:A705 D0 10    BNE $A717       if not [EOL] (go print character)
//                                 was [EOL]
// .:A707 A8       TAY             else clear index
// .:A708 B1 5F    LDA ($5F),Y     get next line pointer low byte
// .:A70A AA       TAX             copy to X
// .:A70B C8       INY             increment index
// .:A70C B1 5F    LDA ($5F),Y     get next line pointer high byte
// .:A70E 86 5F    STX $5F         set pointer to line low byte
// .:A710 85 60    STA $60         set pointer to line high byte
// .:A712 D0 B5    BNE $A6C9       go do next line if not [EOT]
//                                 else ...
// .:A714 4C 86 E3 JMP $E386       do warm start

.label /* $A717 - 42775 */ BASIC_A717_handle_list_character = $A717
// .:A717 6C 06 03 JMP ($0306)     do uncrunch BASIC tokens
// uncrunch BASIC tokens, the uncrunch BASIC tokens vector is initialised to point here
// .:A71A 10 D7    BPL $A6F3       just go print it if not token byte
//                                 else was token byte so uncrunch it
// .:A71C C9 FF    CMP #$FF        compare with the token for PI. in this case the token
//                                 is the same as the PI character so it just needs printing
// .:A71E F0 D3    BEQ $A6F3       just print it if so
// .:A720 24 0F    BIT $0F         test the open quote flag
// .:A722 30 CF    BMI $A6F3       just go print character if open quote set
// .:A724 38       SEC             else set carry for subtract
// .:A725 E9 7F    SBC #$7F        reduce token range to 1 to whatever
// .:A727 AA       TAX             copy token # to X
// .:A728 84 49    STY $49         save index for line
// .:A72A A0 FF    LDY #$FF        start from -1, adjust for pre increment
// .:A72C CA       DEX             decrement token #
// .:A72D F0 08    BEQ $A737       if now found go do printing
// .:A72F C8       INY             else increment index
// .:A730 B9 9E A0 LDA $A09E,Y     get byte from keyword table
// .:A733 10 FA    BPL $A72F       loop until keyword end marker
// .:A735 30 F5    BMI $A72C       go test if this is required keyword, branch always
//                                 found keyword, it's the next one
// .:A737 C8       INY             increment keyword table index
// .:A738 B9 9E A0 LDA $A09E,Y     get byte from table
// .:A73B 30 B2    BMI $A6EF       go restore index, mask byte and print if
//                                 byte was end marker
// .:A73D 20 47 AB JSR $AB47       else go print the character
// .:A740 D0 F5    BNE $A737       go get next character, branch always

.label /* $A742 - 42818 */ BASIC_A742_perform_for = $A742
// perform FOR
// .:A742 A9 80    LDA #$80        set FNX
// .:A744 85 10    STA $10         set subscript/FNX flag
// .:A746 20 A5 A9 JSR $A9A5       perform LET
// .:A749 20 8A A3 JSR $A38A       search the stack for FOR or GOSUB activity
// .:A74C D0 05    BNE $A753       branch if FOR, this variable, not found
//                                 FOR, this variable, was found so first we dump the old one
// .:A74E 8A       TXA             copy index
// .:A74F 69 0F    ADC #$0F        add FOR structure size-2
// .:A751 AA       TAX             copy to index
// .:A752 9A       TXS             set stack (dump FOR structure (-2 bytes))
// .:A753 68       PLA             pull return address
// .:A754 68       PLA             pull return address
// .:A755 A9 09    LDA #$09        we need 18d bytes !
// .:A757 20 FB A3 JSR $A3FB       check room on stack for 2*A bytes
// .:A75A 20 06 A9 JSR $A906       scan for next BASIC statement ([:] or [EOL])
// .:A75D 18       CLC             clear carry for add
// .:A75E 98       TYA             copy index to A
// .:A75F 65 7A    ADC $7A         add BASIC execute pointer low byte
// .:A761 48       PHA             push onto stack
// .:A762 A5 7B    LDA $7B         get BASIC execute pointer high byte
// .:A764 69 00    ADC #$00        add carry
// .:A766 48       PHA             push onto stack
// .:A767 A5 3A    LDA $3A         get current line number high byte
// .:A769 48       PHA             push onto stack
// .:A76A A5 39    LDA $39         get current line number low byte
// .:A76C 48       PHA             push onto stack
// .:A76D A9 A4    LDA #$A4        set "TO" token
// .:A76F 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:A772 20 8D AD JSR $AD8D       check if source is numeric, else do type mismatch
// .:A775 20 8A AD JSR $AD8A       evaluate expression and check is numeric, else do
//                                 type mismatch
// .:A778 A5 66    LDA $66         get FAC1 sign (b7)
// .:A77A 09 7F    ORA #$7F        set all non sign bits
// .:A77C 25 62    AND $62         and FAC1 mantissa 1
// .:A77E 85 62    STA $62         save FAC1 mantissa 1
// .:A780 A9 8B    LDA #$8B        set return address low byte
// .:A782 A0 A7    LDY #$A7        set return address high byte
// .:A784 85 22    STA $22         save return address low byte
// .:A786 84 23    STY $23         save return address high byte
// .:A788 4C 43 AE JMP $AE43       round FAC1 and put on stack, returns to next instruction
// .:A78B A9 BC    LDA #$BC        set 1 pointer low address, default step size
// .:A78D A0 B9    LDY #$B9        set 1 pointer high address
// .:A78F 20 A2 BB JSR $BBA2       unpack memory (AY) into FAC1
// .:A792 20 79 00 JSR $0079       scan memory
// .:A795 C9 A9    CMP #$A9        compare with STEP token
// .:A797 D0 06    BNE $A79F       if not "STEP" continue
//                                 was step so ....
// .:A799 20 73 00 JSR $0073       increment and scan memory
// .:A79C 20 8A AD JSR $AD8A       evaluate expression and check is numeric, else do
//                                 type mismatch
// .:A79F 20 2B BC JSR $BC2B       get FAC1 sign, return A = $FF -ve, A = $01 +ve
// .:A7A2 20 38 AE JSR $AE38       push sign, round FAC1 and put on stack
// .:A7A5 A5 4A    LDA $4A         get FOR/NEXT variable pointer high byte
// .:A7A7 48       PHA             push on stack
// .:A7A8 A5 49    LDA $49         get FOR/NEXT variable pointer low byte
// .:A7AA 48       PHA             push on stack
// .:A7AB A9 81    LDA #$81        get FOR token
// .:A7AD 48       PHA             push on stack

.label /* $A7AE - 42926 */ BASIC_A7AE_basic_warm_start = $A7AE
// interpreter inner loop
// .:A7AE 20 2C A8 JSR $A82C       do CRTL-C check vector
// .:A7B1 A5 7A    LDA $7A         get the BASIC execute pointer low byte
// .:A7B3 A4 7B    LDY $7B         get the BASIC execute pointer high byte
// .:A7B5 C0 02    CPY #$02        compare the high byte with $02xx
// .:A7B7 EA       NOP             unused byte
// .:A7B8 F0 04    BEQ $A7BE       if immediate mode skip the continue pointer save
// .:A7BA 85 3D    STA $3D         save the continue pointer low byte
// .:A7BC 84 3E    STY $3E         save the continue pointer high byte
// .:A7BE A0 00    LDY #$00        clear the index
// .:A7C0 B1 7A    LDA ($7A),Y     get a BASIC byte
// .:A7C2 D0 43    BNE $A807       if not [EOL] go test for ":"

.label /* $A7C4 - 42948 */ BASIC_A7C4_check_end_of_program = $A7C4
// .:A7C4 A0 02    LDY #$02        else set the index
// .:A7C6 B1 7A    LDA ($7A),Y     get next line pointer high byte
// .:A7C8 18       CLC             clear carry for no "BREAK" message
// .:A7C9 D0 03    BNE $A7CE       branch if not end of program
// .:A7CB 4C 4B A8 JMP $A84B       else go to immediate mode,was immediate or [EOT] marker
// .:A7CE C8       INY             increment index
// .:A7CF B1 7A    LDA ($7A),Y     get line number low byte
// .:A7D1 85 39    STA $39         save current line number low byte
// .:A7D3 C8       INY             increment index
// .:A7D4 B1 7A    LDA ($7A),Y     get line # high byte
// .:A7D6 85 3A    STA $3A         save current line number high byte
// .:A7D8 98       TYA             A now = 4
// .:A7D9 65 7A    ADC $7A         add BASIC execute pointer low byte, now points to code
// .:A7DB 85 7A    STA $7A         save BASIC execute pointer low byte
// .:A7DD 90 02    BCC $A7E1       branch if no overflow
// .:A7DF E6 7B    INC $7B         else increment BASIC execute pointer high byte

.label /* $A7E1 - 42977 */ BASIC_A7E1_prepare_to_execute_statement = $A7E1
// .:A7E1 6C 08 03 JMP ($0308)     do start new BASIC code
// start new BASIC code, the start new BASIC code vector is initialised to point here
// .:A7E4 20 73 00 JSR $0073       increment and scan memory
// .:A7E7 20 ED A7 JSR $A7ED       go interpret BASIC code from BASIC execute pointer
// .:A7EA 4C AE A7 JMP $A7AE       loop

.label /* $A7ED - 42989 */ BASIC_A7ED_perform_basic_keyword = $A7ED
// go interpret BASIC code from BASIC execute pointer
// .:A7ED F0 3C    BEQ $A82B       if the first byte is null just exit
// .:A7EF E9 80    SBC #$80        normalise the token
// .:A7F1 90 11    BCC $A804       if wasn't token go do LET
// .:A7F3 C9 23    CMP #$23        compare with token for TAB(-$80
// .:A7F5 B0 17    BCS $A80E       branch if >= TAB(
// .:A7F7 0A       ASL             *2 bytes per vector
// .:A7F8 A8       TAY             copy to index
// .:A7F9 B9 0D A0 LDA $A00D,Y     get vector high byte
// .:A7FC 48       PHA             push on stack
// .:A7FD B9 0C A0 LDA $A00C,Y     get vector low byte
// .:A800 48       PHA             push on stack
// .:A801 4C 73 00 JMP $0073       increment and scan memory and return. the return in
//                                 this case calls the command code, the return from
//                                 that will eventually return to the interpreter inner
//                                 loop above
// .:A804 4C A5 A9 JMP $A9A5       perform LET
//                                 was not [EOL]
// .:A807 C9 3A    CMP #$3A        comapre with ":"
// .:A809 F0 D6    BEQ $A7E1       if ":" go execute new code
//                                 else ...
// .:A80B 4C 08 AF JMP $AF08       do syntax error then warm start
//                                 token was >= TAB(
// .:A80E C9 4B    CMP #$4B        compare with the token for GO
// .:A810 D0 F9    BNE $A80B       if not "GO" do syntax error then warm start
//                                 else was "GO"
// .:A812 20 73 00 JSR $0073       increment and scan memory
// .:A815 A9 A4    LDA #$A4        set "TO" token
// .:A817 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:A81A 4C A0 A8 JMP $A8A0       perform GOTO

.label /* $A81D - 43037 */ BASIC_A81D_perform_restore = $A81D
// perform RESTORE
// .:A81D 38       SEC             set carry for subtract
// .:A81E A5 2B    LDA $2B         get start of memory low byte
// .:A820 E9 01    SBC #$01        -1
// .:A822 A4 2C    LDY $2C         get start of memory high byte
// .:A824 B0 01    BCS $A827branch if no rollunder
// .:A826 88       DEY             else decrement high byte
// .:A827 85 41    STA $41         set DATA pointer low byte
// .:A829 84 42    STY $42         set DATA pointer high byte
// .:A82B 60       RTS

.label /* $A82C - 43052 */ BASIC_A82C_scan_stop_key = $A82C
// do CRTL-C check vector
// .:A82C 20 E1 FF JSR $FFE1       scan stop key

.label /* $A82F - 43055 */ BASIC_A82F_perform_stop = $A82F
// perform stop
// .:A82F B0 01    BCS $A832       if carry set do BREAK instead of just END

.label /* $A831 - 43057 */ BASIC_A831_perform_break = $A831
// perform END
// .:A831 18       CLC             clear carry
// .:A832 D0 3C    BNE $A870       return if wasn't CTRL-C
// .:A834 A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:A836 A4 7B    LDY $7B         get BASIC execute pointer high byte
// .:A838 A6 3A    LDX $3A         get current line number high byte
// .:A83A E8       INX             increment it
// .:A83B F0 0C    BEQ $A849       branch if was immediate mode
// .:A83D 85 3D    STA $3D         save continue pointer low byte
// .:A83F 84 3E    STY $3E         save continue pointer high byte
// .:A841 A5 39    LDA $39         get current line number low byte
// .:A843 A4 3A    LDY $3A         get current line number high byte
// .:A845 85 3B    STA $3B         save break line number low byte
// .:A847 84 3C    STY $3C         save break line number high byte
// .:A849 68       PLA             dump return address low byte
// .:A84A 68       PLA             dump return address high byte
// .:A84B A9 81    LDA #$81        set [CR][LF]"BREAK" pointer low byte
// .:A84D A0 A3    LDY #$A3        set [CR][LF]"BREAK" pointer high byte
// .:A84F 90 03    BCC $A854       if was program end skip the print string
// .:A851 4C 69 A4 JMP $A469       print string and do warm start
// .:A854 4C 86 E3 JMP $E386       do warm start


.label /* $A857 - 43095 */ BASIC_A857_perform_cont = $A857
// perform CONT
// .:A857 D0 17    BNE $A870       exit if following byte to allow syntax error
// .:A859 A2 1A    LDX #$1A        error code $1A, can't continue error
// .:A85B A4 3E    LDY $3E         get continue pointer high byte
// .:A85D D0 03    BNE $A862       go do continue if we can
// .:A85F 4C 37 A4 JMP $A437       else do error #X then warm start
//                                 we can continue so ...
// .:A862 A5 3D    LDA $3D         get continue pointer low byte
// .:A864 85 7A    STA $7A         save BASIC execute pointer low byte
// .:A866 84 7B    STY $7B         save BASIC execute pointer high byte
// .:A868 A5 3B    LDA $3B         get break line low byte
// .:A86A A4 3C    LDY $3C         get break line high byte
// .:A86C 85 39    STA $39         set current line number low byte
// .:A86E 84 3A    STY $3A         set current line number high byte
// .:A870 60       RTS

.label /* $A871 - 43121 */ BASIC_A871_perform_run = $A871
// perform RUN
// .:A871 08       PHP             save status
// .:A872 A9 00    LDA #$00        no control or kernal messages
// .:A874 20 90 FF JSR $FF90       control kernal messages
// .:A877 28       PLP             restore status
// .:A878 D0 03    BNE $A87D       branch if RUN n
// .:A87A 4C 59 A6 JMP $A659       reset execution to start, clear variables, flush stack
//                                 and return
// .:A87D 20 60 A6 JSR $A660       go do "CLEAR"
// .:A880 4C 97 A8 JMP $A897       get n and do GOTO n

.label /* $A883 - 43139 */ BASIC_A883_perform_gosub = $A883
// perform GOSUB
// .:A883 A9 03    LDA #$03        need 6 bytes for GOSUB
// .:A885 20 FB A3 JSR $A3FB       check room on stack for 2*A bytes
// .:A888 A5 7B    LDA $7B         get BASIC execute pointer high byte
// .:A88A 48       PHA             save it
// .:A88B A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:A88D 48       PHA             save it
// .:A88E A5 3A    LDA $3A         get current line number high byte
// .:A890 48       PHA             save it
// .:A891 A5 39    LDA $39         get current line number low byte
// .:A893 48       PHA             save it
// .:A894 A9 8D    LDA #$8D        token for GOSUB
// .:A896 48       PHA             save it
// .:A897 20 79 00 JSR $0079       scan memory
// .:A89A 20 A0 A8 JSR $A8A0       perform GOTO
// .:A89D 4C AE A7 JMP $A7AE       go do interpreter inner loop

.label /* $A8A0 - 43168 */ BASIC_A8A0_perform_goto = $A8A0
// perform GOTO
// .:A8A0 20 6B A9 JSR $A96B       get fixed-point number into temporary integer
// .:A8A3 20 09 A9 JSR $A909       scan for next BASIC line
// .:A8A6 38       SEC             set carry for subtract
// .:A8A7 A5 39    LDA $39         get current line number low byte
// .:A8A9 E5 14    SBC $14         subtract temporary integer low byte
// .:A8AB A5 3A    LDA $3A         get current line number high byte
// .:A8AD E5 15    SBC $15         subtract temporary integer high byte
// .:A8AF B0 0B    BCS $A8BC       if current line number >= temporary integer, go search
//                                 from the start of memory
// .:A8B1 98       TYA             else copy line index to A
// .:A8B2 38       SEC             set carry (+1)
// .:A8B3 65 7A    ADC $7A         add BASIC execute pointer low byte
// .:A8B5 A6 7B    LDX $7B         get BASIC execute pointer high byte
// .:A8B7 90 07    BCC $A8C0       branch if no overflow to high byte
// .:A8B9 E8       INX             increment high byte
// .:A8BA B0 04    BCS $A8C0       branch always (can never be carry)
//
// search for line number in temporary integer from start of memory pointer
// .:A8BC A5 2B    LDA $2B         get start of memory low byte
// .:A8BE A6 2C    LDX $2C         get start of memory high byte
//
// search for line # in temporary integer from (AX)
// .:A8C0 20 17 A6 JSR $A617       search Basic for temp integer line number from AX
// .:A8C3 90 1E    BCC $A8E3       if carry clear go do unsdefined statement error
//	                               carry all ready set for subtract
// .:A8C5 A5 5F    LDA $5F         get pointer low byte
// .:A8C7 E9 01    SBC #$01        -1
// .:A8C9 85 7A    STA $7A         save BASIC execute pointer low byte
// .:A8CB A5 60    LDA $60         get pointer high byte
// .:A8CD E9 00    SBC #$00        subtract carry
// .:A8CF 85 7B    STA $7B         save BASIC execute pointer high byte
// .:A8D1 60       RTS

.label /* $A8D2 - 43218 */ BASIC_A8D2_perform_return = $A8D2
// perform RETURN
//
// .:A8D2 D0 FD    BNE $A8D1       exit if following token to allow syntax error
// .:A8D4 A9 FF    LDA #$FF        set byte so no match possible
// .:A8D6 85 4A    STA $4A         save FOR/NEXT variable pointer high byte
// .:A8D8 20 8A A3 JSR $A38A       search the stack for FOR or GOSUB activity,
//                                 get token off stack
// .:A8DB 9A       TXScorrect the stack
// .:A8DC C9 8D    CMP #$8D        compare with GOSUB token
// .:A8DE F0 0B    BEQ $A8EB       if matching GOSUB go continue RETURN
// .:A8E0 A2 0C    LDX #$0C        else error code $04, return without gosub error
// .:A8E2 2C       .BYTE $2C       makes next line BIT $11A2
// .:A8E3 A2 11    LDX #$02        error code $11, undefined statement error
// .:A8E5 4C 37 A4 JMP $A437       do error #X then warm start
// .:A8E8 4C 08 AF JMP $AF08       do syntax error then warm start
//                                 was matching GOSUB token
// .:A8EB 68       PLA             dump token byte
// .:A8EC 68       PLA             pull return line low byte
// .:A8ED 85 39    STA $39         save current line number low byte
// .:A8EF 68       PLA             pull return line high byte
// .:A8F0 85 3A    STA $3A         save current line number high byte
// .:A8F2 68       PLA             pull return address low byte
// .:A8F3 85 7A    STA $7A         save BASIC execute pointer low byte
// .:A8F5 68       PLA             pull return address high byte
// .:A8F6 85 7B    STA $7B         save BASIC execute pointer high byte

.label /* $A8F8 - 43256 */ BASIC_A8F8_perform_data = $A8F8
// perform DATA
//
// .:A8F8 20 06 A9 JSR $A906       scan for next BASIC statement ([:] or [EOL])
//
// add Y to the BASIC execute pointer
//
// .:A8FB 98       TYA             copy index to A
// .:A8FC 18       CLC             clear carry for add
// .:A8FD 65 7A    ADC $7A         add BASIC execute pointer low byte
// .:A8FF 85 7A    STA $7A         save BASIC execute pointer low byte
// .:A901 90 02    BCC $A905       skip increment if no carry
// .:A903 E6 7B    INC $7B         else increment BASIC execute pointer high byte
// .:A905 60       RTS

.label /* $A906 - 43270 */ BASIC_A906_search_for_next_statement_line = $A906
// scan for next BASIC statement ([:] or [EOL])
//
//                                 returns Y as index to [:] or [EOL]
// .:A906 A2 3A    LDX #$3A        set look for character = ":"
// .:A908 2C       .BYTE $2C       makes next line BIT $00A2
//
// scan for next BASIC line
//
//                                 returns Y as index to [EOL]
// .:A909 A2 00    LDX #$00        set alternate search character = [EOL]
// .:A90B 86 07    STX $07         store alternate search character
// .:A90D A0 00    LDY #$00        set search character = [EOL]
// .:A90F 84 08    STY $08         save the search character
// .:A911 A5 08    LDA $08         get search character
// .:A913 A6 07    LDX $07         get alternate search character
// .:A915 85 07    STA $07         make search character = alternate search character
// .:A917 86 08    STX $08         make alternate search character = search character
// .:A919 B1 7A    LDA ($7A),Y     get BASIC byte
// .:A91B F0 E8    BEQ $A905       exit if null [EOL]
// .:A91D C5 08    CMP $08         compare with search character
// .:A91F F0 E4    BEQ $A905       exit if found
// .:A921 C8       INY             else increment index
// .:A922 C9 22    CMP #$22        compare current character with open quote
// .:A924 D0 F3    BNE $A919       if found go swap search character for alternate search
//                                 character
// .:A926 F0 E9    BEQ $A911       loop for next character, branch always

.label /* $A928 - 43304 */ BASIC_A928_perform_if = $A928
// perform IF
//
// .:A928 20 9E AD JSR $AD9E       evaluate expression
// .:A92B 20 79 00 JSR $0079       scan memory
// .:A92E C9 89    CMP #$89        compare with "GOTO" token
// .:A930 F0 05    BEQ $A937       if it was  the token for GOTO go do IF ... GOTO
//                                 wasn't IF ... GOTO so must be IF ... THEN
// .:A932 A9 A7    LDA #$A7        set "THEN" token
// .:A934 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:A937 A5 61    LDA $61         get FAC1 exponent
// .:A939 D0 05    BNE $A940       if result was non zero continue execution
//                                 else REM rest of line

.label /* $A93B - 43323 */ BASIC_A93B_perform_rem = $A93B
// perform REM
//
// .:A93B 20 09 A9 JSR $A909       scan for next BASIC line
// .:A93E F0 BB    BEQ $A8FB       add Y to the BASIC execute pointer and return, branch
//	                               always
//	                               result was non zero so do rest of line
// .:A940 20 79 00 JSR $0079       scan memory
// .:A943 B0 03    BCS $A948       branch if not numeric character, is variable or keyword
// .:A945 4C A0 A8 JMP $A8A0       else perform GOTO n
//	                               is variable or keyword
// .:A948 4C ED A7 JMP $A7ED       interpret BASIC code from BASIC execute pointer

.label /* $A94B - 43339 */ BASIC_A94B_perform_on = $A94B
// perform ON
//
// .:A94B 20 9E B7 JSR $B79E       get byte parameter
// .:A94E 48       PHA             push next character
// .:A94F C9 8D    CMP #$8D        compare with GOSUB token
// .:A951 F0 04    BEQ $A957       if GOSUB go see if it should be executed
// .:A953 C9 89    CMP #$89        compare with GOTO token
// .:A955 D0 91    BNE $A8E8       if not GOTO do syntax error then warm start
//                                 next character was GOTO or GOSUB, see if it should be executed
// .:A957 C6 65    DEC $65         decrement the byte value
// .:A959 D0 04    BNE $A95F       if not zero go see if another line number exists
// .:A95B 68       PLA             pull keyword token
// .:A95C 4C EF A7 JMP $A7EF       go execute it
// .:A95F 20 73 00 JSR $0073       increment and scan memory
// .:A962 20 6B A9 JSR $A96B       get fixed-point number into temporary integer
//                                 skip this n
// .:A965 C9 2C    CMP #$2C        compare next character with ","
// .:A967 F0 EE    BEQ $A957       loop if ","
// .:A969 68       PLA             else pull keyword token, ran out of options
// .:A96A 60       RTS

.label /* $A96B - 43371 */ BASIC_A96B_fetch_linnum_from_basic = $A96B
// get fixed-point number into temporary integer
//
// .:A96B A2 00    LDX #$00        clear X
// .:A96D 86 14    STX $14         clear temporary integer low byte
// .:A96F 86 15    STX $15         clear temporary integer high byte
// .:A971 B0 F7    BCS $A96A       return if carry set, end of scan, character was not 0-9
// .:A973 E9 2F    SBC #$2F        subtract $30, $2F+carry, from byte
// .:A975 85 07    STA $07         store #
// .:A977 A5 15    LDA $15         get temporary integer high byte
// .:A979 85 22    STA $22         save it for now
// .:A97B C9 19    CMP #$19        compare with $19
// .:A97D B0 D4    BCS $A953       branch if >= this makes the maximum line number 63999
//                                 because the next bit does $1900 * $0A = $FA00 = 64000
//                                 decimal. the branch target is really the SYNTAX error
//                                 at $A8E8 but that is too far so an intermediate
//                                 compare and branch to that location is used. the problem
//                                 with this is that line number that gives a partial result
//                                 from $8900 to $89FF, 35072x to 35327x, will pass the new
//                                 target compare and will try to execute the remainder of
//                                 the ON n GOTO/GOSUB. a solution to this is to copy the
//                                 byte in A before the branch to X and then branch to
//                                 $A955 skipping the second compare
// .:A97F A5 14    LDA $14         get temporary integer low byte
// .:A981 0A       ASL             *2 low byte
// .:A982 26 22    ROL $22         *2 high byte
// .:A984 0A       ASL             *2 low byte
// .:A985 26 22    ROL $22         *2 high byte (*4)
// .:A987 65 14    ADC $14         + low byte (*5)
// .:A989 85 14    STA $14         save it
// .:A98B A5 22    LDA $22         get high byte temp
// .:A98D 65 15    ADC $15         + high byte (*5)
// .:A98F 85 15    STA $15         save it
// .:A991 06 14    ASL $14         *2 low byte (*10d)
// .:A993 26 15    ROL $15         *2 high byte (*10d)
// .:A995 A5 14    LDA $14         get low byte
// .:A997 65 07    ADC $07         add #
// .:A999 85 14    STA $14         save low byte
// .:A99B 90 02    BCC $A99F       branch if no overflow to high byte
// .:A99D E6 15    INC $15         else increment high byte
// .:A99F 20 73 00 JSR $0073       increment and scan memory
// .:A9A2 4C 71 A9 JMP $A971       loop for next character

.label /* $A9A5 - 43429 */ BASIC_A9A5_perform_let = $A9A5
//perform LET
//
// .:A9A5 20 8B B0 JSR $B08B       get variable address
// .:A9A8 85 49    STA $49         save variable address low byte
// .:A9AA 84 4A    STY $4A         save variable address high byte
// .:A9AC A9 B2    LDA #$B2        $B2 is "=" token
// .:A9AE 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:A9B1 A5 0E    LDA $0E         get data type flag, $80 = integer, $00 = float
// .:A9B3 48       PHA             push data type flag
// .:A9B4 A5 0D    LDA $0D         get data type flag, $FF = string, $00 = numeric
// .:A9B6 48       PHA             push data type flag
// .:A9B7 20 9E AD JSR $AD9E       evaluate expression
// .:A9BA 68       PLA             pop data type flag
// .:A9BB 2A       ROL             string bit into carry
// .:A9BC 20 90 AD JSR $AD90       do type match check
// .:A9BF D0 18    BNE $A9D9       branch if string
// .:A9C1 68       PLA             pop integer/float data type flag
//                                 assign value to numeric variable
// .:A9C2 10 12    BPL $A9D6       branch if float
//                                 expression is numeric integer

.label /* $A9C4 - 43460 */ BASIC_A9C4_assign_integer = $A9C4
// .:A9C4 20 1B BC JSR $BC1B       round FAC1
// .:A9C7 20 BF B1 JSR $B1BF       evaluate integer expression, no sign check
// .:A9CA A0 00    LDY #$00        clear index
// .:A9CC A5 64    LDA $64         get FAC1 mantissa 3
// .:A9CE 91 49    STA ($49),Y     save as integer variable low byte
// .:A9D0 C8       INY             increment index
// .:A9D1 A5 65    LDA $65         get FAC1 mantissa 4
// .:A9D3 91 49    STA ($49),Y     save as integer variable high byte
// .:A9D5 60       RTS

.label /* $A9D6 - 43478 */ BASIC_A9D6_assign_floating_point = $A9D6
// .:A9D6 4C D0 BB JMP $BBD0       pack FAC1 into variable pointer and return
//                                 assign value to numeric variable

.label /* $A9D9 - 43481 */ BASIC_A9D9_assign_string = $A9D9
// .:A9D9 68       PLA             dump integer/float data type flag
// .:A9DA A4 4A    LDY $4A         get variable pointer high byte
// .:A9DC C0 BF    CPY #$BF        was it TI$ pointer
// .:A9DE D0 4C    BNE $AA2C       branch if not
//                                 else it's TI$ =
// .:A9E0 20 A6 B6 JSR $B6A6       pop string off descriptor stack, or from top of string
//                                 space returns with A = length, X = pointer low byte,
//                                 Y = pointer high byte

.label /* $A9E3 - 43491 */ BASIC_A9E3_assign_ti = $A9E3
// .:A9E3 C9 06    CMP #$06        compare length with 6
// .:A9E5 D0 3D    BNE $AA24       if length not 6 do illegal quantity error then warm start
// .:A9E7 A0 00    LDY #$00        clear index
// .:A9E9 84 61    STY $61         clear FAC1 exponent
// .:A9EB 84 66    STY $66         clear FAC1 sign (b7)
// .:A9ED 84 71    STY $71         save index
// .:A9EF 20 1D AA JSR $AA1D       check and evaluate numeric digit
// .:A9F2 20 E2 BA JSR $BAE2       multiply FAC1 by 10
// .:A9F5 E6 71    INC $71         increment index
// .:A9F7 A4 71    LDY $71         restore index
// .:A9F9 20 1D AA JSR $AA1D       check and evaluate numeric digit
// .:A9FC 20 0C BC JSR $BC0C       round and copy FAC1 to FAC2
// .:A9FF AA       TAX             copy FAC1 exponent
// .:AA00 F0 05    BEQ $AA07       branch if FAC1 zero
// .:AA02 E8       INX             increment index, * 2
// .:AA03 8A       TXA             copy back to A
// .:AA04 20 ED BA JSR $BAED       FAC1 = (FAC1 + (FAC2 * 2)) * 2 = FAC1 * 6
// .:AA07 A4 71    LDY $71         get index
// .:AA09 C8       INY             increment index
// .:AA0A C0 06    CPY #$06        compare index with 6
// .:AA0C D0 DF    BNE $A9ED       loop if not 6
// .:AA0E 20 E2 BA JSR $BAE2       multiply FAC1 by 10
// .:AA11 20 9B BC JSR $BC9B       convert FAC1 floating to fixed
// .:AA14 A6 64    LDX $64         get FAC1 mantissa 3
// .:AA16 A4 63    LDY $63         get FAC1 mantissa 2
// .:AA18 A5 65    LDA $65         get FAC1 mantissa 4
// .:AA1A 4C DB FF JMP $FFDB       set real time clock and return
//
// check and evaluate numeric digit
//
// .:AA1D B1 22    LDA ($22),Y     get byte from string
// .:AA1F 20 80 00 JSR $0080       clear Cb if numeric. this call should be to $84
//                                 as the code from $80 first comapres the byte with
//                                 [SPACE] and does a BASIC increment and get if it is
// .:AA22 90 03    BCC $AA27       branch if numeric
// .:AA24 4C 48 B2 JMP $B248       do illegal quantity error then warm start
// .:AA27 E9 2F    SBC #$2F        subtract $2F + carry to convert ASCII to binary
// .:AA29 4C 7E BD JMP $BD7E       evaluate new ASCII digit and return

.label /* $AA2C - 43564 */ BASIC_AA2C_add_digit_to_fac_1 = $AA2C
// assign value to numeric variable, but not TI$
//
// .:AA2C A0 02    LDY #$02        index to string pointer high byte
// .:AA2E B1 64    LDA ($64),Y     get string pointer high byte
// .:AA30 C5 34    CMP $34         compare with bottom of string space high byte
// .:AA32 90 17    BCC $AA4B       branch if string pointer high byte is less than bottom
//                                 of string space high byte
// .:AA34 D0 07    BNE $AA3D       branch if string pointer high byte is greater than
//                                 bottom of string space high byte
//                                 else high bytes were equal
// .:AA36 88       DEY             decrement index to string pointer low byte
// .:AA37 B1 64    LDA ($64),Y     get string pointer low byte
// .:AA39 C5 33    CMP $33         compare with bottom of string space low byte
// .:AA3B 90 0E    BCC $AA4B       branch if string pointer low byte is less than bottom
//                                 of string space low byte
// .:AA3D A4 65    LDY $65         get descriptor pointer high byte
// .:AA3F C4 2E    CPY $2E         compare with start of variables high byte
// .:AA41 90 08    BCC $AA4B       branch if less, is on string stack
// .:AA43 D0 0D    BNE $AA52       if greater make space and copy string
//                                 else high bytes were equal
// .:AA45 A5 64    LDA $64         get descriptor pointer low byte
// .:AA47 C5 2D    CMP $2D         compare with start of variables low byte
// .:AA49 B0 07    BCS $AA52       if greater or equal make space and copy string
// .:AA4B A5 64    LDA $64         get descriptor pointer low byte
// .:AA4D A4 65    LDY $65         get descriptor pointer high byte
// .:AA4F 4C 68 AA JMP $AA68       go copy descriptor to variable
// .:AA52 A0 00    LDY #$00        clear index
// .:AA54 B1 64    LDA ($64),Y     get string length
// .:AA56 20 75 B4 JSR $B475       copy descriptor pointer and make string space A bytes long
// .:AA59 A5 50    LDA $50         copy old descriptor pointer low byte
// .:AA5B A4 51    LDY $51         copy old descriptor pointer high byte
// .:AA5D 85 6F    STA $6F         save old descriptor pointer low byte
// .:AA5F 84 70    STY $70         save old descriptor pointer high byte
// .:AA61 20 7A B6 JSR $B67A       copy string from descriptor to utility pointer
// .:AA64 A9 61    LDA #$61        get descriptor pointer low byte
// .:AA66 A0 00    LDY #$00        get descriptor pointer high byte
// .:AA68 85 50    STA $50         save descriptor pointer low byte
// .:AA6A 84 51    STY $51         save descriptor pointer high byte
// .:AA6C 20 DB B6 JSR $B6DB       clean descriptor stack, YA = pointer
// .:AA6F A0 00    LDY #$00        clear index
// .:AA71 B1 50    LDA ($50),Y     get string length from new descriptor
// .:AA73 91 49    STA ($49),Y     copy string length to variable
// .:AA75 C8       INY             increment index
// .:AA76 B1 50    LDA ($50),Y     get string pointer low byte from new descriptor
// .:AA78 91 49    STA ($49),Y     copy string pointer low byte to variable
// .:AA7A C8       INY             increment index
// .:AA7B B1 50    LDA ($50),Y     get string pointer high byte from new descriptor
// .:AA7D 91 49    STA ($49),Y     copy string pointer high byte to variable
// .:AA7F 60

.label /* $AA80 - 43648 */ BASIC_AA80_perform_print_sharp = $AA80
// perform PRINT#
//
// .:AA80 20 86 AA JSR $AA86       perform CMD
// .:AA83 4C B5 AB JMP $ABB5       close input and output channels and return

.label /* $AA86 - 43654 */ BASIC_AA86_perform_cmd = $AA86
// perform CMD
//
// .:AA86 20 9E B7 JSR $B79E       get byte parameter
// .:AA89 F0 05    BEQ $AA90       branch if following byte is ":" or [EOT]
// .:AA8B A9 2C    LDA #$2C        set ","
// .:AA8D 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:AA90 08       PHP             save status
// .:AA91 86 13    STX $13         set current I/O channel
// .:AA93 20 18 E1 JSR $E118       open channel for output with error check
// .:AA96 28       PLP             restore status
// .:AA97 4C A0 AA JMP $AAA0       perform PRINT

.label /* $AA9A - 43674 */ BASIC_AA9A_print_string_from_memory = $AA9A
// .:AA9A 20 21 AB JSR $AB21       print string from utility pointer
// .:AA9D 20 79 00 JSR $0079       scan memory

.label /* $AAA0 - 43680 */ BASIC_AAA0_perform_print = $AAA0
// perform PRINT
//
// .:AAA0 F0 35    BEQ $AAD7       if nothing following just print CR/LF
// .:AAA2 F0 43    BEQ $AAE7       exit if nothing following, end of PRINT branch
// .:AAA4 C9 A3    CMP #$A3        compare with token for TAB(
// .:AAA6 F0 50    BEQ $AAF8       if TAB( go handle it
// .:AAA8 C9 A6    CMP #$A6        compare with token for SPC(
// .:AAAA 18       CLC             flag SPC(
// .:AAAB F0 4B    BEQ $AAF8       if SPC( go handle it
// .:AAAD C9 2C    CMP #$2C        compare with ","
// .:AAAF F0 37    BEQ $AAE8       if "," go skip to the next TAB position
// .:AAB1 C9 3B    CMP #$3B        compare with ";"
// .:AAB3 F0 5E    BEQ $AB13       if ";" go continue the print loop
// .:AAB5 20 9E AD JSR $AD9E       evaluate expression

.label /* $AAB8 - 43704 */ BASIC_AAB8_output_variable = $AAB8
// .:AAB8 24 0D    BIT $0D         test data type flag, $FF = string, $00 = numeric
// .:AABA 30 DE    BMI $AA9A       if string go print string, scan memory and continue PRINT
// .:AABC 20 DD BD JSR $BDDD       convert FAC1 to ASCII string result in (AY)
// .:AABF 20 87 B4 JSR $B487       print " terminated string to utility pointer
// .:AAC2 20 21 AB JSR $AB21       print string from utility pointer
// .:AAC5 20 3B AB JSR $AB3B       print [SPACE] or [CURSOR RIGHT]
// .:AAC8 D0 D3    BNE $AA9D       go scan memory and continue PRINT, branch always

.label /* $AACA - 43722 */ BASIC_AACA_add_zero_terminator_to_string = $AACA
//set XY to $0200 - 1 and print [CR]
//
// .:AACA A9 00    LDA #$00        clear A
// .:AACC 9D 00 02 STA $0200,X     clear first byte of input buffer
// .:AACF A2 FF    LDX #$FF        $0200 - 1 low byte
// .:AAD1 A0 01    LDY #$01        $0200 - 1 high byte
// .:AAD3 A5 13    LDA $13         get current I/O channel
// .:AAD5 D0 10    BNE $AAE7       exit if not default channel

.label /* $AAD7 - 43735 */ BASIC_AAD7_output_cr_lf = $AAD7
// print CR/LF
//
// .:AAD7 A9 0D    LDA #$0D        set [CR]
// .:AAD9 20 47 AB JSR $AB47       print the character
// .:AADC 24 13    BIT $13         test current I/O channel
// .:AADE 10 05    BPL $AAE5       if ?? toggle A, EOR #$FF and return
// .:AAE0 A9 0A    LDA #$0A        set [LF]
// .:AAE2 20 47 AB JSR $AB47       print the character
//                                 toggle A
// .:AAE5 49 FF    EOR #$FF        invert A
// .:AAE7 60       RTS
//                                  was ","

.label /* $AAE8 - 43752 */ BASIC_AAE8_handle_comma = $AAE8
// .:AAE8 38       SEC             set Cb for read cursor position
// .:AAE9 20 F0 FF JSR $FFF0       read/set X,Y cursor position
// .:AAEC 98       TYA             copy cursor Y
// .:AAED 38       SEC             set carry for subtract
// .:AAEE E9 0A    SBC #$0A        subtract one TAB length
// .:AAF0 B0 FC    BCS $AAEE       loop if result was +ve
// .:AAF2 49 FF    EOR #$FF        complement it
// .:AAF4 69 01    ADC #$01        +1, twos complement
// .:AAF6 D0 16    BNE $AB0E       always print A spaces, result is never $00
// .:AAF8 08       PHP             save TAB( or SPC( status
// .:AAF9 38       SEC             set Cb for read cursor position
// .:AAFA 20 F0 FF JSR $FFF0       read/set X,Y cursor position
// .:AAFD 84 09    STY $09         save current cursor position
// .:AAFF 20 9B B7 JSR $B79B       scan and get byte parameter
// .:AB02 C9 29    CMP #$29        compare with ")"
// .:AB04 D0 59    BNE $AB5F       if not ")" do syntax error
// .:AB06 28       PLP             restore TAB( or SPC( status
// .:AB07 90 06    BCC $AB0F       branch if was SPC(
//                                 else was TAB(
// .:AB09 8A       TXA             copy TAB() byte to A
// .:AB0A E5 09    SBC $09         subtract current cursor position
// .:AB0C 90 05    BCC $AB13       go loop for next if already past requited position
// .:AB0E AA       TAX             copy [SPACE] count to X
// .:AB0F E8       INX             increment count
// .:AB10 CA       DEX             decrement count
// .:AB11 D0 06    BNE $AB19       branch if count was not zero
//                                 was ";" or [SPACES] printed
// .:AB13 20 73 00 JSR $0073       increment and scan memory
// .:AB16 4C A2 AA JMP $AAA2       continue print loop
// .:AB19 20 3B AB JSR $AB3B       print [SPACE] or [CURSOR RIGHT]
// .:AB1C D0 F2    BNE $AB10       loop, branch always

.label /* $AB1E - 43806 */ BASIC_AB1E_output_string = $AB1E
// print null terminated string
//
// .:AB1E 20 87 B4 JSR $B487       print " terminated string to utility pointer

.label /* $AB3B - 43835 */ BASIC_AB3B_output_format_character = $AB3B
// print string from utility pointer
//
// .:AB21 20 A6 B6 JSR $B6A6       pop string off descriptor stack, or from top of string
//                                 space returns with A = length, X = pointer low byte,
//                                 Y = pointer high byte
// .:AB24 AA       TAX             copy length
// .:AB25 A0 00    LDY #$00        clear index
// .:AB27 E8       INX             increment length, for pre decrement loop
// .:AB28 CA       DEX             decrement length
// .:AB29 F0 BC    BEQ $AAE7       exit if done
// .:AB2B B1 22    LDA ($22),Y     get byte from string
// .:AB2D 20 47 AB JSR $AB47       print the character
// .:AB30 C8       INY             increment index
// .:AB31 C9 0D    CMP #$0D        compare byte with [CR]
// .:AB33 D0 F3    BNE $AB28       loop if not [CR]
// .:AB35 20 E5 AA JSR $AAE5       toggle A, EOR #$FF. what is the point of this ??
// .:AB38 4C 28 AB JMP $AB28       loop
//
// print [SPACE] or [CURSOR RIGHT]
//
// .:AB3B A5 13    LDA $13         get current I/O channel
// .:AB3D F0 03    BEQ $AB42       if default channel go output [CURSOR RIGHT]
// .:AB3F A9 20    LDA #$20        else output [SPACE]
// .:AB41 2C       .BYTE $2C       makes next line BIT $1DA9
// .:AB42 A9 1D    LDA #$1D        set [CURSOR RIGHT]
// .:AB44 2C       .BYTE $2C       makes next line BIT $3FA9
//
// print "?"
//
// .:AB45 A9 3F    LDA #$3F        set "?"
//
// print character
//
// .:AB47 20 0C E1 JSR $E10C       output character to channel with error check
// .:AB4A 29 FF    AND #$FF        set the flags on A
// .:AB4C 60       RTS

.label /* $AB4D - 43853 */ BASIC_AB4D_handle_bad_data = $AB4D
// bad input routine
//
// .:AB4D A5 11    LDA $11         get INPUT mode flag, $00 = INPUT, $40 = GET, $98 = READ
// .:AB4F F0 11    BEQ $AB62       branch if INPUT
// .:AB51 30 04    BMI $AB57       branch if READ
//                                 else was GET
// .:AB53 A0 FF    LDY #$FF        set current line high byte to -1, indicate immediate mode
// .:AB55 D0 04    BNE $AB5B       branch always
// .:AB57 A5 3F    LDA $3F         get current DATA line number low byte
// .:AB59 A4 40    LDY $40         get current DATA line number high byte
// .:AB5B 85 39    STA $39         set current line number low byte
// .:AB5D 84 3A    STY $3A         set current line number high byte
// .:AB5F 4C 08 AF JMP $AF08       do syntax error then warm start
//                                 was INPUT
// .:AB62 A5 13    LDA $13         get current I/O channel
// .:AB64 F0 05    BEQ $AB6B       branch if default channel
// .:AB66 A2 18    LDX #$18        else error $18, file data error
// .:AB68 4C 37 A4 JMP $A437       do error #X then warm start
// .:AB6B A9 0C    LDA #$0C        set "?REDO FROM START" pointer low byte
// .:AB6D A0 AD    LDY #$AD        set "?REDO FROM START" pointer high byte
// .:AB6F 20 1E AB JSR $AB1E       print null terminated string
// .:AB72 A5 3D    LDA $3D         get continue pointer low byte
// .:AB74 A4 3E    LDY $3E         get continue pointer high byte
// .:AB76 85 7A    STA $7A         save BASIC execute pointer low byte
// .:AB78 84 7B    STY $7B         save BASIC execute pointer high byte
// .:AB7A 60       RTS

.label /* $AB7B - 43899 */ BASIC_AB7B_perform_get = $AB7B
// perform GET

// .:AB7B 20 A6 B3 JSR $B3A6       check not Direct, back here if ok
// .:AB7E C9 23    CMP #$23        compare with "#"
// .:AB80 D0 10    BNE $AB92       branch if not GET#
// .:AB82 20 73 00 JSR $0073       increment and scan memory
// .:AB85 20 9E B7 JSR $B79E       get byte parameter
// .:AB88 A9 2C    LDA #$2C        set ","
// .:AB8A 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:AB8D 86 13    STX $13         set current I/O channel
// .:AB8F 20 1E E1 JSR $E11E       open channel for input with error check
// .:AB92 A2 01    LDX #$01        set pointer low byte
// .:AB94 A0 02    LDY #$02        set pointer high byte
// .:AB96 A9 00    LDA #$00        clear A
// .:AB98 8D 01 02 STA $0201       ensure null terminator
// .:AB9B A9 40    LDA #$40        input mode = GET
// .:AB9D 20 0F AC JSR $AC0F       perform the GET part of READ
// .:ABA0 A6 13    LDX $13         get current I/O channel
// .:ABA2 D0 13    BNE $ABB7       if not default channel go do channel close and return
// .:ABA4 60       RTS

.label /* $ABA5 - 43941 */ BASIC_ABA5_perform_input_sharp = $ABA5
// perform INPUT#
//
// .:ABA5 20 9E B7 JSR $B79E       get byte parameter
// .:ABA8 A9 2C    LDA #$2C        set ","
// .:ABAA 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:ABAD 86 13    STX $13         set current I/O channel
// .:ABAF 20 1E E1 JSR $E11E       open channel for input with error check
// .:ABB2 20 CE AB JSR $ABCE       perform INPUT with no prompt string
//
// close input and output channels
//
// .:ABB5 A5 13    LDA $13         get current I/O channel
// .:ABB7 20 CC FF JSR $FFCC       close input and output channels
// .:ABBA A2 00    LDX #$00        clear X
// .:ABBC 86 13    STX $13         clear current I/O channel, flag default
// .:ABBE 60       RTS

.label /* $ABBF - 43967 */ BASIC_ABBF_perform_input = $ABBF
// perform INPUT
//
// .:ABBF C9 22    CMP #$22        compare next byte with open quote
// .:ABC1 D0 0B    BNE $ABCE       if no prompt string just do INPUT
// .:ABC3 20 BD AE JSR $AEBD       print "..." string
// .:ABC6 A9 3B    LDA #$3B        load A with ";"
// .:ABC8 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:ABCB 20 21 AB JSR $AB21       print string from utility pointer
//                                 done with prompt, now get data
// .:ABCE 20 A6 B3 JSR $B3A6       check not Direct, back here if ok
// .:ABD1 A9 2C    LDA #$2C        set ","
// .:ABD3 8D FF 01 STA $01FF       save to start of buffer - 1
// .:ABD6 20 F9 AB JSR $ABF9       print "? " and get BASIC input
// .:ABD9 A5 13    LDA $13         get current I/O channel
// .:ABDB F0 0D    BEQ $ABEA       branch if default I/O channel
// .:ABDD 20 B7 FF JSR $FFB7       read I/O status word
// .:ABE0 29 02    AND #$02        mask no DSR/timeout
// .:ABE2 F0 06    BEQ $ABEA       branch if not error
// .:ABE4 20 B5 AB JSR $ABB5       close input and output channels
// .:ABE7 4C F8 A8 JMP $A8F8       perform DATA

.label /* $ABEA - 44010 */ BASIC_ABEA_read_input_buffer = $ABEA
// .:ABEA AD 00 02 LDA $0200       get first byte in input buffer
// .:ABED D0 1E    BNE $AC0D       branch if not null
//                                 else ..
// .:ABEF A5 13    LDA $13         get current I/O channel
// .:ABF1 D0 E3    BNE $ABD6       if not default channel go get BASIC input
// .:ABF3 20 06 A9 JSR $A906       scan for next BASIC statement ([:] or [EOL])
// .:ABF6 4C FB A8 JMP $A8FB       add Y to the BASIC execute pointer and return

.label /* $ABF9 - 44025 */ BASIC_ABF9_do_input_prompt = $ABF9
// print "? " and get BASIC input
//
// .:ABF9 A5 13    LDA $13         get current I/O channel
// .:ABFB D0 06    BNE $AC03       skip "?" prompt if not default channel
// .:ABFD 20 45 AB JSR $AB45       print "?"
// .:AC00 20 3B AB JSR $AB3B       print [SPACE] or [CURSOR RIGHT]
// .:AC03 4C 60 A5 JMP $A560       call for BASIC input and return

.label /* $AC06 - 44038 */ BASIC_AC06_perform_read = $AC06
// perform READ

// .:AC06 A6 41    LDX $41         get DATA pointer low byte
// .:AC08 A4 42    LDY $42         get DATA pointer high byte
// .:AC0A A9 98    LDA #$98        set input mode = READ
// .:AC0C 2C       .BYTE $2C       makes next line BIT $00A9
// .:AC0D A9 00    LDA #$00        set input mode = INPUT

.label /* $AC0F - 44047 */ BASIC_AC0F_perform_get = $AC0F
// perform GET
//
// .:AC0F 85 11    STA $11         set input mode flag, $00 = INPUT, $40 = GET, $98 = READ
// .:AC11 86 43    STX $43         save READ pointer low byte
// .:AC13 84 44    STY $44         save READ pointer high byte
//                                 READ, GET or INPUT next variable from list
// .:AC15 20 8B B0 JSR $B08B       get variable address
// .:AC18 85 49    STA $49         save address low byte
// .:AC1A 84 4A    STY $4A         save address high byte
// .:AC1C A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:AC1E A4 7B    LDY $7B         get BASIC execute pointer high byte
// .:AC20 85 4B    STA $4B         save BASIC execute pointer low byte
// .:AC22 84 4C    STY $4C         save BASIC execute pointer high byte
// .:AC24 A6 43    LDX $43         get READ pointer low byte
// .:AC26 A4 44    LDY $44         get READ pointer high byte
// .:AC28 86 7A    STX $7A         save as BASIC execute pointer low byte
// .:AC2A 84 7B    STY $7B         save as BASIC execute pointer high byte
// .:AC2C 20 79 00 JSR $0079       scan memory
// .:AC2F D0 20    BNE $AC51       branch if not null
//                                 pointer was to null entry
// .:AC31 24 11    BIT $11         test input mode flag, $00 = INPUT, $40 = GET, $98 = READ
// .:AC33 50 0C    BVC $AC41       branch if not GET
//                                 else was GET

.label /* $AC35 - 44085 */ BASIC_AC35_general_purpose_read_routine = $AC35
// .:AC35 20 24 E1 JSR $E124       get character from input device with error check
// .:AC38 8D 00 02 STA $0200       save to buffer
// .:AC3B A2 FF    LDX #$FF        set pointer low byte
// .:AC3D A0 01    LDY #$01        set pointer high byte
// .:AC3F D0 0C    BNE $AC4D       go interpret single character
// .:AC41 30 75    BMI $ACB8       branch if READ
//                                 else was INPUT
// .:AC43 A5 13    LDA $13         get current I/O channel
// .:AC45 D0 03    BNE $AC4A       skip "?" prompt if not default channel
// .:AC47 20 45 AB JSR $AB45       print "?"
// .:AC4A 20 F9 AB JSR $ABF9       print "? " and get BASIC input
// .:AC4D 86 7A    STX $7A         save BASIC execute pointer low byte
// .:AC4F 84 7B    STY $7B         save BASIC execute pointer high byte
// .:AC51 20 73 00 JSR $0073       increment and scan memory, execute pointer now points to
//                                 start of next data or null terminator
// .:AC54 24 0D    BIT $0D         test data type flag, $FF = string, $00 = numeric
// .:AC56 10 31    BPL $AC89       branch if numeric
//                                 type is string
// .:AC58 24 11    BIT $11         test INPUT mode flag, $00 = INPUT, $40 = GET, $98 = READ
// .:AC5A 50 09    BVC $AC65       branch if not GET
//                                 else do string GET
// .:AC5C E8       INX             clear X ??
// .:AC5D 86 7A    STX $7A         save BASIC execute pointer low byte
// .:AC5F A9 00    LDA #$00        clear A
// .:AC61 85 07    STA $07         clear search character
// .:AC63 F0 0C    BEQ $AC71       branch always
//                                 is string INPUT or string READ
// .:AC65 85 07    STA $07         save search character
// .:AC67 C9 22    CMP #$22        compare with "
// .:AC69 F0 07    BEQ $AC72       branch if quote
//                                 string is not in quotes so ":", "," or $00 are the
//                                 termination characters
// .:AC6B A9 3A    LDA #$3A        set ":"
// .:AC6D 85 07    STA $07         set search character
// .:AC6F A9 2C    LDA #$2C        set ","
// .:AC71 18       CLC             clear carry for add
// .:AC72 85 08    STA $08         set scan quotes flag
// .:AC74 A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:AC76 A4 7B    LDY $7B         get BASIC execute pointer high byte
// .:AC78 69 00    ADC #$00        add to pointer low byte. this add increments the pointer
//                                 if the mode is INPUT or READ and the data is a "..."
//                                 string
// .:AC7A 90 01    BCC $AC7D       branch if no rollover
// .:AC7C C8       INY             else increment pointer high byte
// .:AC7D 20 8D B4 JSR $B48D       print string to utility pointer
// .:AC80 20 E2 B7 JSR $B7E2       restore BASIC execute pointer from temp
// .:AC83 20 DA A9 JSR $A9DA       perform string LET
// .:AC86 4C 91 AC JMP $AC91       continue processing command
//                                 GET, INPUT or READ is numeric
// .:AC89 20 F3 BC JSR $BCF3       get FAC1 from string
// .:AC8C A5 0E    LDA $0E         get data type flag, $80 = integer, $00 = float
// .:AC8E 20 C2 A9 JSR $A9C2       assign value to numeric variable
// .:AC91 20 79 00 JSR $0079       scan memory
// .:AC94 F0 07    BEQ $AC9D       branch if ":" or [EOL]
// .:AC96 C9 2C    CMP #$2C        comparte with ","
// .:AC98 F0 03    BEQ $AC9D       branch if ","
// .:AC9A 4C 4D AB JMP $AB4D       else go do bad input routine
//                                 string terminated with ":", "," or $00
// .:AC9D A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:AC9F A4 7B    LDY $7B         get BASIC execute pointer high byte
// .:ACA1 85 43    STA $43         save READ pointer low byte
// .:ACA3 84 44    STY $44         save READ pointer high byte
// .:ACA5 A5 4B    LDA $4B         get saved BASIC execute pointer low byte
// .:ACA7 A4 4C    LDY $4C         get saved BASIC execute pointer high byte
// .:ACA9 85 7A    STA $7A         restore BASIC execute pointer low byte
// .:ACAB 84 7B    STY $7B         restore BASIC execute pointer high byte
// .:ACAD 20 79 00 JSR $0079       scan memory
// .:ACB0 F0 2D    BEQ $ACDF       branch if ":" or [EOL]
// .:ACB2 20 FD AE JSR $AEFD       scan for ",", else do syntax error then warm start
// .:ACB5 4C 15 AC JMP $AC15       go READ or INPUT next variable from list
//                                 was READ
// .:ACB8 20 06 A9 JSR $A906       scan for next BASIC statement ([:] or [EOL])
// .:ACBB C8       INY             increment index to next byte
// .:ACBC AA       TAX             copy byte to X
// .:ACBD D0 12    BNE $ACD1       branch if ":"
// .:ACBF A2 0D    LDX #$0D        else set error $0D, out of data error
// .:ACC1 C8       INY             increment index to next line pointer high byte
// .:ACC2 B1 7A    LDA ($7A),Y     get next line pointer high byte
// .:ACC4 F0 6C    BEQ $AD32       branch if program end, eventually does error X
// .:ACC6 C8       INY             increment index
// .:ACC7 B1 7A    LDA ($7A),Y     get next line # low byte
// .:ACC9 85 3F    STA $3F         save current DATA line low byte
// .:ACCB C8       INY             increment index
// .:ACCC B1 7A    LDA ($7A),Y     get next line # high byte
// .:ACCE C8       INY             increment index
// .:ACCF 85 40    STA $40         save current DATA line high byte
// .:ACD1 20 FB A8 JSR $A8FB       add Y to the BASIC execute pointer
// .:ACD4 20 79 00 JSR $0079       scan memory
// .:ACD7 AA       TAX             copy the byte
// .:ACD8 E0 83    CPX #$83        compare it with token for DATA
// .:ACDA D0 DC    BNE $ACB8       loop if not DATA
// .:ACDC 4C 51 AC JMP $AC51       continue evaluating READ
// .:ACDF A5 43    LDA $43         get READ pointer low byte
// .:ACE1 A4 44    LDY $44         get READ pointer high byte
// .:ACE3 A6 11    LDX $11         get INPUT mode flag, $00 = INPUT, $40 = GET, $98 = READ
// .:ACE5 10 03    BPL $ACEA       branch if INPUT or GET
// .:ACE7 4C 27 A8 JMP $A827       else set data pointer and exit
// .:ACEA A0 00    LDY #$00        clear index
// .:ACEC B1 43    LDA ($43),Y     get READ byte
// .:ACEE F0 0B    BEQ $ACFB       exit if [EOL]
// .:ACF0 A5 13    LDA $13         get current I/O channel
// .:ACF2 D0 07    BNE $ACFB       exit if not default channel
// .:ACF4 A9 FC    LDA #$FC        set "?EXTRA IGNORED" pointer low byte
// .:ACF6 A0 AC    LDY #$AC        set "?EXTRA IGNORED" pointer high byte
// .:ACF8 4C 1E AB JMP $AB1E       print null terminated string
// .:ACFB 60       RTS

.label /* $ACFC - 44284 */ BASIC_ACFC_input_error_messages = $ACFC
// input error messages
//
// .:ACFC 3F 45 58 54 52 41 20 49  '?extra ignored'
// .:AD04 47 4E 4F 52 45 44 0D 00
// .:AD0C 3F 52 45 44 4F 20 46 52  '?redo from start'
// .:AD14 4F 4D 20 53 54 41 52 54
// .:AD1C 0D 00

.label /* $AD1E - 44318 */ BASIC_AD1E_perform_next = $AD1E
// perform NEXT
//
// .:AD1E D0 04    BNE $AD24       branch if NEXT variable
// .:AD20 A0 00    LDY #$00        else clear Y
// .:AD22 F0 03    BEQ $AD27       branch always
//                                 NEXT variable
// .:AD24 20 8B B0 JSR $B08B       get variable address
// .:AD27 85 49    STA $49         save FOR/NEXT variable pointer low byte
// .:AD29 84 4A    STY $4A         save FOR/NEXT variable pointer high byte
//                                 (high byte cleared if no variable defined)
// .:AD2B 20 8A A3 JSR $A38A       search the stack for FOR or GOSUB activity
// .:AD2E F0 05    BEQ $AD35       branch if FOR, this variable, found
// .:AD30 A2 0A    LDX #$0A        else set error $0A, next without for error
// .:AD32 4C 37 A4 JMP $A437       do error #X then warm start
//                                 found this FOR variable
// .:AD35 9A       TXS             update stack pointer
// .:AD36 8A       TXA             copy stack pointer
// .:AD37 18       CLC             clear carry for add
// .:AD38 69 04    ADC #$04        point to STEP value
// .:AD3A 48       PHA             save it
// .:AD3B 69 06    ADC #$06        point to TO value
// .:AD3D 85 24    STA $24         save pointer to TO variable for compare
// .:AD3F 68       PLA             restore pointer to STEP value
// .:AD40 A0 01    LDY #$01        point to stack page
// .:AD42 20 A2 BB JSR $BBA2       unpack memory (AY) into FAC1
// .:AD45 BA       TSX             get stack pointer back
// .:AD46 BD 09 01 LDA $0109,X     get step sign
// .:AD49 85 66    STA $66         save FAC1 sign (b7)
// .:AD4B A5 49    LDA $49         get FOR/NEXT variable pointer low byte
// .:AD4D A4 4A    LDY $4A         get FOR/NEXT variable pointer high byte
// .:AD4F 20 67 B8 JSR $B867       add FOR variable to FAC1
// .:AD52 20 D0 BB JSR $BBD0       pack FAC1 into FOR variable
// .:AD55 A0 01    LDY #$01        point to stack page
// .:AD57 20 5D BC JSR $BC5D       compare FAC1 with TO value
// .:AD5A BA       TSX             get stack pointer back
// .:AD5B 38       SEC             set carry for subtract
// .:AD5C FD 09 01 SBC $0109,X     subtract step sign
// .:AD5F F0 17    BEQ $AD78       branch if =, loop complete
//                                 loop back and do it all again

.label /* $AD61 - 44385 */ BASIC_AD61_check_valid_loop = $AD61
// .:AD61 BD 0F 01 LDA $010F,X     get FOR line low byte
// .:AD64 85 39    STA $39         save current line number low byte
// .:AD66 BD 10 01 LDA $0110,X     get FOR line high byte
// .:AD69 85 3A    STA $3A         save current line number high byte
// .:AD6B BD 12 01 LDA $0112,X     get BASIC execute pointer low byte
// .:AD6E 85 7A    STA $7A         save BASIC execute pointer low byte
// .:AD70 BD 11 01 LDA $0111,X     get BASIC execute pointer high byte
// .:AD73 85 7B    STA $7B         save BASIC execute pointer high byte
// .:AD75 4C AE A7 JMP $A7AE       go do interpreter inner loop
//                                 NEXT loop comlete
// .:AD78 8A       TXA             stack copy to A
// .:AD79 69 11    ADC #$11        add $12, $11 + carry, to dump FOR structure
// .:AD7B AA       TAX             copy back to index
// .:AD7C 9A       TXS             copy to stack pointer
// .:AD7D 20 79 00 JSR $0079       scan memory
// .:AD80 C9 2C    CMP #$2C        compare with ","
// .:AD82 D0 F1    BNE $AD75       if not "," go do interpreter inner loop
//                                 was "," so another NEXT variable to do
// .:AD84 20 73 00 JSR $0073       increment and scan memory
// .:AD87 20 24 AD JSR $AD24       do NEXT variable

.label /* $AD8A - 44426 */ BASIC_AD8A_confirm_result = $AD8A
// evaluate expression and check type mismatch
//
// .:AD8A 20 9E AD JSR $AD9E       evaluate expression
//                                 check if source and destination are numeric
// .:AD8D 18       CLC
// .:AD8E 24       .BYTE $24       makes next line BIT $38
//                                 check if source and destination are string
// .:AD8F 38       SEC             destination is string
//                                 type match check, set C for string, clear C for numeric
// .:AD90 24 0D    BIT $0D         test data type flag, $FF = string, $00 = numeric
// .:AD92 30 03    BMI $AD97       branch if string
// .:AD94 B0 03    BCS $AD99       if destiantion is numeric do type missmatch error
// .:AD96 60       RTS
// .:AD97 B0 FD    BCS $AD96       exit if destination is string
//                                 do type missmatch error
// .:AD99 A2 16    LDX #$16        error code $16, type missmatch error
// .:AD9B 4C 37 A4 JMP $A437       do error #X then warm start

.label /* $AD9E - 44446 */ BASIC_AD9E_evaluate_expression_in_text = $AD9E
// evaluate expression
//
// .:AD9E A6 7A    LDX $7A         get BASIC execute pointer low byte
// .:ADA0 D0 02    BNE $ADA4       skip next if not zero
// .:ADA2 C6 7B    DEC $7B         else decrement BASIC execute pointer high byte
// .:ADA4 C6 7A    DEC $7A         decrement BASIC execute pointer low byte
// .:ADA6 A2 00    LDX #$00        set null precedence, flag done
// .:ADA8 24       .BYTE $24       makes next line BIT $48
// .:ADA9 48       PHA             push compare evaluation byte if branch to here
// .:ADAA 8A       TXA             copy precedence byte
// .:ADAB 48       PHA             push precedence byte
// .:ADAC A9 01    LDA #$01        2 bytes
// .:ADAE 20 FB A3 JSR $A3FB       check room on stack for A*2 bytes
// .:ADB1 20 83 AE JSR $AE83       get value from line
// .:ADB4 A9 00    LDA #$00        clear A
// .:ADB6 85 4D    STA $4D         clear comparrison evaluation flag
// .:ADB8 20 79 00 JSR $0079       scan memory
// .:ADBB 38       SEC             set carry for subtract
// .:ADBC E9 B1    SBC #$B1        subtract the token for ">"
// .:ADBE 90 17    BCC $ADD7       branch if < ">"
// .:ADC0 C9 03    CMP #$03        compare with ">" to +3
// .:ADC2 B0 13    BCS $ADD7       branch if >= 3
//                                 was token for ">" "=" or "<"
// .:ADC4 C9 01    CMP #$01compare with token for =
// .:ADC6 2A       ROL             *2, b0 = carry (=1 if token was = or <)
// .:ADC7 49 01    EOR #$01        toggle b0
// .:ADC9 45 4D    EOR $4D         EOR with comparrison evaluation flag
// .:ADCB C5 4D    CMP $4D         compare with comparrison evaluation flag
// .:ADCD 90 61    BCC $AE30       if < saved flag do syntax error then warm start
// .:ADCF 85 4D    STA $4D         save new comparrison evaluation flag
// .:ADD1 20 73 00 JSR $0073       increment and scan memory
// .:ADD4 4C BB AD JMP $ADBB       go do next character
// .:ADD7 A6 4D    LDX $4D         get comparrison evaluation flag
// .:ADD9 D0 2C    BNE $AE07       branch if compare function
// .:ADDB B0 7B    BCS $AE58       go do functions
//                                 else was < TK_GT so is operator or lower
// .:ADDD 69 07    ADC #$07        add # of operators (+, -, *, /, ^, AND or OR)
// .:ADDF 90 77    BCC $AE58       branch if < + operator
//                                 carry was set so token was +, -, *, /, ^, AND or OR
// .:ADE1 65 0D    ADC $0D         add data type flag, $FF = string, $00 = numeric
// .:ADE3 D0 03    BNE $ADE8       branch if not string or not + token
//                                 will only be $00 if type is string and token was +
// .:ADE5 4C 3D B6 JMP $B63D       add strings, string 1 is in the descriptor, string 2
//                                 is in line, and return
// .:ADE8 69 FF    ADC #$FF        -1 (corrects for carry add)
// .:ADEA 85 22    STA $22         save it
// .:ADEC 0A       ASL             *2
// .:ADED 65 22    ADC $22         *3
// .:ADEF A8       TAY             copy to index
// .:ADF0 68       PLA             pull previous precedence
// .:ADF1 D9 80 A0 CMP $A080,Y     compare with precedence byte
// .:ADF4 B0 67    BCS $AE5D       branch if A >=
// .:ADF6 20 8D AD JSR $AD8D       check if source is numeric, else do type mismatch
// .:ADF9 48       PHA             save precedence
// .:ADFA 20 20 AE JSR $AE20       get vector, execute function then continue evaluation
// .:ADFD 68       PLArestore precedence
// .:ADFE A4 4B    LDY $4B         get precedence stacked flag
// .:AE00 10 17    BPL $AE19       branch if stacked values
// .:AE02 AA       TAX             copy precedence, set flags
// .:AE03 F0 56    BEQ $AE5B       exit if done
// .:AE05 D0 5F    BNE $AE66       else pop FAC2 and return, branch always
// .:AE07 46 0D    LSR $0D         clear data type flag, $FF = string, $00 = numeric
// .:AE09 8A       TXA             copy compare function flag
// .:AE0A 2A       ROL             <<1, shift data type flag into b0, 1 = string, 0 = num
// .:AE0B A6 7A    LDX $7A         get BASIC execute pointer low byte
// .:AE0D D0 02    BNE $AE11       branch if no underflow
// .:AE0F C6 7B    DEC $7B         else decrement BASIC execute pointer high byte
// .:AE11 C6 7A    DEC $7A         decrement BASIC execute pointer low byte
// .:AE13 A0 1B    LDY #$1B
//                                 set offset to = operator precedence entry
// .:AE15 85 4D    STA $4D         save new comparrison evaluation flag
// .:AE17 D0 D7    BNE $ADF0       branch always
// .:AE19 D9 80 A0 CMP $A080,Y     compare with stacked function precedence
// .:AE1C B0 48    BCS $AE66       if A >=, pop FAC2 and return
// .:AE1E 90 D9    BCC $ADF9       else go stack this one and continue, branch always
//
// get vector, execute function then continue evaluation
//
// .:AE20 B9 82 A0 LDA $A082,Y     get function vector high byte
// .:AE23 48       PHA             onto stack
// .:AE24 B9 81 A0 LDA $A081,Y     get function vector low byte
// .:AE27 48       PHA             onto stack
//                                 now push sign, round FAC1 and put on stack
// .:AE28 20 33 AE JSR $AE33       function will return here, then the next RTS will call
//                                 the function
// .:AE2B A5 4D    LDA $4D         get comparrison evaluation flag
// .:AE2D 4C A9 AD JMP $ADA9       continue evaluating expression
// .:AE30 4C 08 AF JMP $AF08       do syntax error then warm start
// .:AE33 A5 66    LDA $66         get FAC1 sign (b7)
// .:AE35 BE 80 A0 LDX $A080,Y     get precedence byte

.label /* $AE83 - 44675 */ BASIC_AE83_evaluate_single_term = $AE83
// push sign, round FAC1 and put on stack
//
// .:AE38 A8       TAY             copy sign
// .:AE39 68       PLA             get return address low byte
// .:AE3A 85 22    STA $22         save it
// .:AE3C E6 22    INC $22         increment it as return-1 is pushed
//                                 note, no check is made on the high byte so if the calling
//                                 routine ever assembles to a page edge then this all goes
//                                 horribly wrong!
// .:AE3E 68       PLA             get return address high byte
// .:AE3F 85 23    STA $23         save it
// .:AE41 98       TYA             restore sign
// .:AE42 48       PHA             push sign
//
// round FAC1 and put on stack
//
// .:AE43 20 1B BC JSR $BC1B       round FAC1
// .:AE46 A5 65    LDA $65         get FAC1 mantissa 4
// .:AE48 48       PHA             save it
// .:AE49 A5 64    LDA $64         get FAC1 mantissa 3
// .:AE4B 48       PHA             save it
// .:AE4C A5 63    LDA $63         get FAC1 mantissa 2
// .:AE4E 48       PHA             save it
// .:AE4F A5 62    LDA $62         get FAC1 mantissa 1
// .:AE51 48       PHA             save it
// .:AE52 A5 61    LDA $61         get FAC1 exponent
// .:AE54 48       PHA             save it
// .:AE55 6C 22 00 JMP ($0022)     return, sort of
//
// do functions

// .:AE58 A0 FF    LDY #$FF        flag function
// .:AE5A 68       PLA             pull precedence byte
// .:AE5B F0 23    BEQ $AE80       exit if done
// .:AE5D C9 64    CMP #$64        compare previous precedence with $64
// .:AE5F F0 03    BEQ $AE64       branch if was $64 (< function)
// .:AE61 20 8D AD JSR $AD8D       check if source is numeric, else do type mismatch
// .:AE64 84 4B    STY $4B         save precedence stacked flag
//                                 pop FAC2 and return
// .:AE66 68       PLA             pop byte
// .:AE67 4A       LSR             shift out comparison evaluation lowest bit
// .:AE68 85 12    STA $12         save the comparison evaluation flag
// .:AE6A 68       PLA             pop exponent
// .:AE6B 85 69    STA $69         save FAC2 exponent
// .:AE6D 68       PLA             pop mantissa 1
// .:AE6E 85 6A    STA $6A         save FAC2 mantissa 1
// .:AE70 68       PLA             pop mantissa 2
// .:AE71 85 6B    STA $6B         save FAC2 mantissa 2
// .:AE73 68       PLA             pop mantissa 3
// .:AE74 85 6C    STA $6C         save FAC2 mantissa 3
// .:AE76 68       PLA             pop mantissa 4
// .:AE77 85 6D    STA $6D         save FAC2 mantissa 4
// .:AE79 68       PLA             pop sign
// .:AE7A 85 6E    STA $6E         save FAC2 sign (b7)
// .:AE7C 45 66    EOR $66         EOR FAC1 sign (b7)
// .:AE7E 85 6F    STA $6F         save sign compare (FAC1 EOR FAC2)
// .:AE80 A5 61    LDA $61         get FAC1 exponent
// .:AE82 60       RTS
//
// get value from line
//
// .:AE83 6C 0A 03 JMP ($030A)     get arithmetic element
//
// get arithmetic element, the get arithmetic element vector is initialised to point here
//
// .:AE86 A9 00    LDA #$00        clear byte
// .:AE88 85 0D    STA $0D         clear data type flag, $FF = string, $00 = numeric
// .:AE8A 20 73 00 JSR $0073       increment and scan memory
// .:AE8D B0 03    BCS $AE92       branch if not numeric character
//                                 else numeric string found (e.g. 123)
// .:AE8F 4C F3 BC JMP $BCF3       get FAC1 from string and return
//                                 get value from line .. continued
//                                 wasn't a number so ...
// .:AE92 20 13 B1 JSR $B113       check byte, return Cb = 0 if<"A" or >"Z"
// .:AE95 90 03    BCC $AE9A       branch if not variable name
// .:AE97 4C 28 AF JMP $AF28       variable name set-up and return
// .:AE9A C9 FF    CMP #$FF        compare with token for PI
// .:AE9C D0 0F    BNE $AEAD       branch if not PI
// .:AE9E A9 A8    LDA #$A8        get PI pointer low byte
// .:AEA0 A0 AE    LDY #$AE        get PI pointer high byte
// .:AEA2 20 A2 BB JSR $BBA2       unpack memory (AY) into FAC1
// .:AEA5 4C 73 00 JMP $0073       increment and scan memory and return

.label /* $AEA8 - 44712 */ BASIC_AEA8_constant_pi = $AEA8
// PI as floating number
//
// .:AEA8 82 49 0F DA A1           3.141592653

.label /* $AEAD - 44717 */ BASIC_AEAD_continue_expression = $AEAD
// get value from line .. continued
//
//                                 wasn't variable name so ...
// .:AEAD C9 2E    CMP #$2E        compare with "."
// .:AEAF F0 DE    BEQ $AE8F       if so get FAC1 from string and return, e.g. was .123
//                                 wasn't .123 so ...
// .:AEB1 C9 AB    CMP #$AB        compare with token for -
// .:AEB3 F0 58    BEQ $AF0D       branch if - token, do set-up for functions
//                                 wasn't -123 so ...
// .:AEB5 C9 AA    CMP #$AA        compare with token for +
// .:AEB7 F0 D1    BEQ $AE8A       branch if + token, +1 = 1 so ignore leading +
//                                 it wasn't any sort of number so ...
// .:AEB9 C9 22    CMP #$22        compare with "
// .:AEBB D0 0F    BNE $AECC       branch if not open quote
//                                 was open quote so get the enclosed string
//
// print "..." string to string utility area
//
// .:AEBD A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:AEBF A4 7B    LDY $7B         get BASIC execute pointer high byte
// .:AEC1 69 00    ADC #$00        add carry to low byte
// .:AEC3 90 01    BCC $AEC6       branch if no overflow
// .:AEC5 C8       INY             increment high byte
// .:AEC6 20 87 B4 JSR $B487       print " terminated string to utility pointer
// .:AEC9 4C E2 B7 JMP $B7E2       restore BASIC execute pointer from temp and return
//                                 get value from line .. continued
//                                 wasn't a string so ...
// .:AECC C9 A8    CMP #$A8        compare with token for NOT
// .:AECE D0 13    BNE $AEE3       branch if not token for NOT
//                                 was NOT token
// .:AED0 A0 18    LDY #$18        offset to NOT function
// .:AED2 D0 3B    BNE $AF0F       do set-up for function then execute, branch always
//                                 do = compare
// .:AED4 20 BF B1 JSR $B1BF       evaluate integer expression, no sign check
// .:AED7 A5 65    LDA $65         get FAC1 mantissa 4
// .:AED9 49 FF    EOR #$FF        invert it
// .:AEDB A8       TAY             copy it
// .:AEDC A5 64    LDA $64         get FAC1 mantissa 3
// .:AEDE 49 FF    EOR #$FF        invert it
// .:AEE0 4C 91 B3 JMP $B391       convert fixed integer AY to float FAC1 and return
//                                 get value from line .. continued
//                                 wasn't a string or NOT so ...
// .:AEE3 C9 A5    CMP #$A5        compare with token for FN
// .:AEE5 D0 03    BNE $AEEA       branch if not token for FN
// .:AEE7 4C F4 B3 JMP $B3F4       else go evaluate FNx
//                                 get value from line .. continued
//                                 wasn't a string, NOT or FN so ...
// .:AEEA C9 B4    CMP #$B4        compare with token for SGN
// .:AEEC 90 03    BCC $AEF1       if less than SGN token evaluate expression in parentheses
//                                 else was a function token
// .:AEEE 4C A7 AF JMP $AFA7       go set up function references, branch always
//                                 get value from line .. continued
//                                 if here it can only be something in brackets so ....
//                                 evaluate expression within parentheses

.label /* $AEF1 - 44785 */ BASIC_AEF1_expression_in_brackets = $AEF1
// .:AEF1 20 FA AE JSR $AEFA       scan for "(", else do syntax error then warm start
// .:AEF4 20 9E AD JSR $AD9E       evaluate expression
//                                 all the 'scan for' routines return the character after the sought character
//                                 scan for ")", else do syntax error then warm start

.label /* $AEF7 - 44791 */ BASIC_AEF7_test = $AEF7
// .:AEF7 A9 29    LDA #$29        load A with ")"
// .:AEF9 2C       .BYTE $2C       makes next line BIT $28A9
//                                 scan for "(", else do syntax error then warm start

.label /* $AEFA - 44794 */ BASIC_AEFA_test = $AEFA
// .:AEFA A9 28    LDA #$28        load A with "("
// .:AEFC 2C       .BYTE $2C       makes next line BIT $2CA9
//                                 scan for ",", else do syntax error then warm start

.label /* $AEFD - 44797 */ BASIC_AEFD_test = $AEFD
// .:AEFD A9 2C    LDA #$2C        load A with ","
//                                 scan for CHR$(A), else do syntax error then warm start
// .:AEFF A0 00    LDY #$00        clear index
// .:AF01 D1 7A    CMP ($7A),Y     compare with BASIC byte
// .:AF03 D0 03    BNE $AF08       if not expected byte do syntax error then warm start
// .:AF05 4C 73 00 JMP $0073       else increment and scan memory and return
//                                 syntax error then warm start

.label /* $AF08 - 44808 */ BASIC_AF08_output_syntax_error = $AF08
// .:AF08 A2 0B    LDX #$0B        error code $0B, syntax error
// .:AF0A 4C 37 A4 JMP $A437       do error #X then warm start

.label /* $AF0D - 44813 */ BASIC_AF0D_set_up_not_function = $AF0D
// .:AF0D A0 15    LDY #$15        set offset from base to > operator
// .:AF0F 68       PLA             dump return address low byte
// .:AF10 68       PLA             dump return address high byte
// .:AF11 4C FA AD JMP $ADFA       execute function then continue evaluation

.label /* $AF14 - 44820 */ BASIC_AF14_identify_reserved_variable = $AF14
// check address range, return Cb = 1 if address in BASIC ROM
//
// .:AF14 38       SEC             set carry for subtract
// .:AF15 A5 64    LDA $64         get variable address low byte
// .:AF17 E9 00    SBC #$00        subtract $A000 low byte
// .:AF19 A5 65    LDA $65         get variable address high byte
// .:AF1B E9 A0    SBC #$A0        subtract $A000 high byte
// .:AF1D 90 08    BCC $AF27       exit if address < $A000
// .:AF1F A9 A2    LDA #$A2        get end of BASIC marker low byte
// .:AF21 E5 64    SBC $64         subtract variable address low byte
// .:AF23 A9 E3    LDA #$E3        get end of BASIC marker high byte
// .:AF25 E5 65    SBC $65         subtract variable address high byte
// .:AF27 60       RTS

.label /* $AF28 - 44840 */ BASIC_AF28_search_for_variable = $AF28
// variable name set-up
//
// .:AF28 20 8B B0 JSR $B08B       get variable address
// .:AF2B 85 64    STA $64         save variable pointer low byte
// .:AF2D 84 65    STY $65         save variable pointer high byte
// .:AF2F A6 45    LDX $45         get current variable name first character
// .:AF31 A4 46    LDY $46         get current variable name second character
// .:AF33 A5 0D    LDA $0D         get data type flag, $FF = string, $00 = numeric
// .:AF35 F0 26    BEQ $AF5D       branch if numeric
//                                 variable is string
// .:AF37 A9 00    LDA #$00        else clear A
// .:AF39 85 70    STA $70         clear FAC1 rounding byte
// .:AF3B 20 14 AF JSR $AF14       check address range
// .:AF3E 90 1C    BCC $AF5C       exit if not in BASIC ROM
// .:AF40 E0 54    CPX #$54        compare variable name first character with "T"
// .:AF42 D0 18    BNE $AF5C       exit if not "T"
// .:AF44 C0 C9    CPY #$C9        compare variable name second character with "I$"
// .:AF46 D0 14    BNE $AF5C       exit if not "I$"
//                                 variable name was "TI$"
// .:AF48 20 84 AF JSR $AF84       read real time clock into FAC1 mantissa, 0HML

.label /* $AF48 - 44872 */ BASIC_AF48_convert_ti_to_ascii_string = $AF48
// .:AF4B 84 5E    STY $5E         clear exponent count adjust
// .:AF4D 88       DEY             Y = $FF
// .:AF4E 84 71    STY $71         set output string index, -1 to allow for pre increment
// .:AF50 A0 06    LDY #$06        HH:MM:SS is six digits
// .:AF52 84 5D    STY $5D         set number of characters before the decimal point
// .:AF54 A0 24    LDY #$24
//                                 index to jiffy conversion table
// .:AF56 20 68 BE JSR $BE68       convert jiffy count to string
// .:AF59 4C 6F B4 JMP $B46F       exit via STR$() code tail
// .:AF5C 60       RTS
//                                 variable name set-up, variable is numeric
// .:AF5D 24 0E    BIT $0E         test data type flag, $80 = integer, $00 = float
// .:AF5F 10 0D    BPL $AF6E       branch if float
// .:AF61 A0 00    LDY #$00        clear index
// .:AF63 B1 64    LDA ($64),Y     get integer variable low byte
// .:AF65 AA       TAX             copy to X
// .:AF66 C8       INY             increment index
// .:AF67 B1 64    LDA ($64),Y     get integer variable high byte
// .:AF69 A8       TAY             copy to Y
// .:AF6A 8A       TXA             copy loa byte to A
// .:AF6B 4C 91 B3 JMP $B391       convert fixed integer AY to float FAC1 and return
//                                 variable name set-up, variable is float
// .:AF6E 20 14 AF JSR $AF14       check address range
// .:AF71 90 2D    BCC $AFA0       if not in BASIC ROM get pointer and unpack into FAC1
// .:AF73 E0 54    CPX #$54        compare variable name first character with "T"
// .:AF75 D0 1B    BNE $AF92       branch if not "T"
// .:AF77 C0 49    CPY #$49        compare variable name second character with "I"
// .:AF79 D0 25    BNE $AFA0       branch if not "I"
//                                 variable name was "TI"
// .:AF7B 20 84 AF JSR $AF84       read real time clock into FAC1 mantissa, 0HML
// .:AF7E 98       TYA             clear A
// .:AF7F A2 A0    LDX #$A0        set exponent to 32 bit value
// .:AF81 4C 4F BC JMP $BC4F       set exponent = X and normalise FAC1
//
// read real time clock into FAC1 mantissa, 0HML
//
// .:AF84 20 DE FF JSR $FFDE       read real time clock
// .:AF87 86 64    STX $64         save jiffy clock mid byte as  FAC1 mantissa 3
// .:AF89 84 63    STY $63         save jiffy clock high byte as  FAC1 mantissa 2
// .:AF8B 85 65    STA $65         save jiffy clock low byte as  FAC1 mantissa 4
// .:AF8D A0 00    LDY #$00        clear Y
// .:AF8F 84 62    STY $62         clear FAC1 mantissa 1
// .:AF91 60       RTS
//                                 variable name set-up, variable is float and not "Tx"
// .:AF92 E0 53    CPX #$53        compare variable name first character with "S"
// .:AF94 D0 0A    BNE $AFA0       if not "S" go do normal floating variable
// .:AF96 C0 54    CPY #$54        compare variable name second character with "
// .:AF98 D0 06    BNE $AFA0       if not "T" go do normal floating variable
//                                 variable name was "ST"
// .:AF9A 20 B7 FF JSR $FFB7       read I/O status word
// .:AF9D 4C 3C BC JMP $BC3C       save A as integer byte and return
//                                 variable is float
// .:AFA0 A5 64    LDA $64         get variable pointer low byte
// .:AFA2 A4 65    LDY $65         get variable pointer high byte
// .:AFA4 4C A2 BB JMP $BBA2       unpack memory (AY) into FAC1

.label /* $AFA7 - 44967 */ BASIC_AFA7_identify_function_type = $AFA7
// get value from line continued
//
//                                 only functions left so ..
//                                 set up function references
// .:AFA7 0A       ASL             *2 (2 bytes per function address)
// .:AFA8 48       PHA             save function offset
// .:AFA9 AA       TAX             copy function offset
// .:AFAA 20 73 00 JSR $0073       increment and scan memory
// .:AFAD E0 8F    CPX #$8F        compare function offset to CHR$ token offset+1
// .:AFAF 90 20    BCC $AFD1       branch if < LEFT$ (can not be =)
//                                 get value from line .. continued
//                                 was LEFT$, RIGHT$ or MID$ so..

.label /* $AFB1 - 44977 */ BASIC_AFB1_evaluate_string_function = $AFB1
// .:AFB1 20 FA AE JSR $AEFA       scan for "(", else do syntax error then warm start
// .:AFB4 20 9E AD JSR $AD9E       evaluate, should be string, expression
// .:AFB7 20 FD AE JSR $AEFD       scan for ",", else do syntax error then warm start
// .:AFBA 20 8F AD JSR $AD8F       check if source is string, else do type mismatch
// .:AFBD 68       PLA             restore function offset
// .:AFBE AA       TAX             copy it
// .:AFBF A5 65    LDA $65         get descriptor pointer high byte
// .:AFC1 48       PHA             push string pointer high byte
// .:AFC2 A5 64    LDA $64         get descriptor pointer low byte
// .:AFC4 48       PHA             push string pointer low byte
// .:AFC5 8A       TXA             restore function offset
// .:AFC6 48       PHA             save function offset
// .:AFC7 20 9E B7 JSR $B79E       get byte parameter
// .:AFCA 68       PLA             restore function offset
// .:AFCB A8       TAY             copy function offset
// .:AFCC 8A       TXA             copy byte parameter to A
// .:AFCD 48       PHA             push byte parameter
// .:AFCE 4C D6 AF JMP $AFD6       go call function
//                                 get value from line .. continued
//                                 was SGN() to CHR$() so..

.label /* $AFD1 - 45009 */ BASIC_AFD1_evaluate_numeric_function = $AFD1
// .:AFD1 20 F1 AE JSR $AEF1       evaluate expression within parentheses
// .:AFD4 68       PLA             restore function offset
// .:AFD5 A8       TAY             copy to index
// .:AFD6 B9 EA 9F LDA $9FEA,Y     get function jump vector low byte
// .:AFD9 85 55    STA $55         save functions jump vector low byte
// .:AFDB B9 EB 9F LDA $9FEB,Y     get function jump vector high byte
// .:AFDE 85 56    STA $56         save functions jump vector high byte
// .:AFE0 20 54 00 JSR $0054       do function call
// .:AFE3 4C 8D AD JMP $AD8D       check if source is numeric and RTS, else do type mismatch
//                                 string functions avoid this by dumping the return address

.label /* $AFE6 - 45030 */ BASIC_AFE6_perform_or = $AFE6
// perform OR
//
//                                this works because NOT(NOT(x) AND NOT(y)) = x OR y
// .:AFE6 A0 FF    LDY #$FF        set Y for OR
// .:AFE8 2C       .BYTE $2C       makes next line BIT $00A0

.label /* $AFE9 - 45033 */ BASIC_AFE9_perform_and = $AFE9
// perform AND
//
// .:AFE9 A0 00    LDY #$00        clear Y for AND
// .:AFEB 84 0B    STY $0B         set AND/OR invert value
// .:AFED 20 BF B1 JSR $B1BF       evaluate integer expression, no sign check
// .:AFF0 A5 64    LDA $64         get FAC1 mantissa 3
// .:AFF2 45 0B    EOR $0B         EOR low byte
// .:AFF4 85 07    STA $07         save it
// .:AFF6 A5 65    LDA $65         get FAC1 mantissa 4
// .:AFF8 45 0B    EOR $0B         EOR high byte
// .:AFFA 85 08    STA $08         save it
// .:AFFC 20 FC BB JSR $BBFC       copy FAC2 to FAC1, get 2nd value in expression
// .:AFFF 20 BF B1 JSR $B1BF       evaluate integer expression, no sign check
// .:B002 A5 65    LDA $65         get FAC1 mantissa 4
// .:B004 45 0B    EOR $0B         EOR high byte
// .:B006 25 08    AND $08         AND with expression 1 high byte
// .:B008 45 0B    EOR $0B         EOR result high byte
// .:B00A A8       TAY             save in Y
// .:B00B A5 64    LDA $64         get FAC1 mantissa 3
// .:B00D 45 0B    EOR $0B         EOR low byte
// .:B00F 25 07    AND $07         AND with expression 1 low byte
// .:B011 45 0B    EOR $0B         EOR result low byte
// .:B013 4C 91 B3 JMP $B391       convert fixed integer AY to float FAC1 and return

.label /* $B016 - 45078 */ BASIC_B016_perform_comparison = $B016
// perform comparisons
//
//                                 do < compare
// .:B016 20 90 AD JSR $AD90       type match check, set C for string
// .:B019 B0 13    BCS $B02E       branch if string

.label /* $B01B - 45083 */ BASIC_B01B_numeric_comparison = $B01B
//                                 do numeric < compare
// .:B01B A5 6E    LDA $6E         get FAC2 sign (b7)
// .:B01D 09 7F    ORA #$7F        set all non sign bits
// .:B01F 25 6A    AND $6A         and FAC2 mantissa 1 (AND in sign bit)
// .:B021 85 6A    STA $6A         save FAC2 mantissa 1
// .:B023 A9 69    LDA #$69        set pointer low byte to FAC2
// .:B025 A0 00    LDY #$00        set pointer high byte to FAC2
// .:B027 20 5B BC JSR $BC5B       compare FAC1 with (AY)
// .:B02A AA       TAX             copy the result
// .:B02B 4C 61 B0 JMP $B061       go evaluate result

.label /* $B02E - 45102 */ BASIC_B02E_string_comparison = $B02E
//                                 do string < compare
// .:B02E A9 00    LDA #$00        clear byte
// .:B030 85 0D    STA $0D         clear data type flag, $FF = string, $00 = numeric
// .:B032 C6 4D    DEC $4D         clear < bit in comparrison evaluation flag
// .:B034 20 A6 B6 JSR $B6A6       pop string off descriptor stack, or from top of string
//                                 space returns with A = length, X = pointer low byte,
//                                 Y = pointer high byte
// .:B037 85 61    STA $61         save length
// .:B039 86 62    STX $62         save string pointer low byte
// .:B03B 84 63    STY $63         save string pointer high byte
// .:B03D A5 6C    LDA $6C         get descriptor pointer low byte
// .:B03F A4 6D    LDY $6D         get descriptor pointer high byte
// .:B041 20 AA B6 JSR $B6AA       pop (YA) descriptor off stack or from top of string space
//                                 returns with A = length, X = pointer low byte,
//                                 Y = pointer high byte
// .:B044 86 6C    STX $6C         save string pointer low byte
// .:B046 84 6D    STY $6D         save string pointer high byte
// .:B048 AA       TAX             copy length
// .:B049 38       SEC             set carry for subtract
// .:B04A E5 61    SBC $61         subtract string 1 length
// .:B04C F0 08    BEQ $B056       branch if str 1 length = string 2 length
// .:B04E A9 01    LDA #$01        set str 1 length > string 2 length
// .:B050 90 04    BCC $B056       branch if so
// .:B052 A6 61    LDX $61         get string 1 length
// .:B054 A9 FF    LDA #$FF        set str 1 length < string 2 length
// .:B056 85 66    STA $66         save length compare
// .:B058 A0 FF    LDY #$FF        set index
// .:B05A E8       INX             adjust for loop
// .:B05B C8       INY             increment index
// .:B05C CA       DEX             decrement count
// .:B05D D0 07    BNE $B066       branch if still bytes to do
// .:B05F A6 66    LDX $66         get length compare back
// .:B061 30 0F    BMI $B072       branch if str 1 < str 2
// .:B063 18       CLC             flag str 1 <= str 2
// .:B064 90 0C    BCC $B072       go evaluate result
// .:B066 B1 6C    LDA ($6C),Y     get string 2 byte
// .:B068 D1 62    CMP ($62),Y     compare with string 1 byte
// .:B06A F0 EF    BEQ $B05B       loop if bytes =
// .:B06C A2 FF    LDX #$FF        set str 1 < string 2
// .:B06E B0 02    BCS $B072       branch if so
// .:B070 A2 01    LDX #$01        set str 1 > string 2
// .:B072 E8       INX             x = 0, 1 or 2
// .:B073 8A       TXA             copy to A
// .:B074 2A       ROL             * 2 (1, 2 or 4)
// .:B075 25 12    AND $12         AND with the comparison evaluation flag
// .:B077 F0 02    BEQ $B07B       branch if 0 (compare is false)
// .:B079 A9 FF    LDA #$FF        else set result true
// .:B07B 4C 3C BC JMP $BC3C       save A as integer byte and return

.label /* $B07E - 45182 */ BASIC_B07E_perform_dim = $B07E
// .:B07E 20 FD AE JSR $AEFD       scan for ",", else do syntax error then warm start

.label /* $B08B - 45195 */ BASIC_B08B_identify_variable = $B08B
// search for variable
//
// .:B08B A2 00    LDX #$00        set DIM flag = $00
// .:B08D 20 79 00 JSR $0079       scan memory, 1st character
// .:B090 86 0C    STX $0C         save DIM flag
// .:B092 85 45    STA $45         save 1st character
// .:B094 20 79 00 JSR $0079       scan memory
// .:B097 20 13 B1 JSR $B113       check byte, return Cb = 0 if<"A" or >"Z"
// .:B09A B0 03    BCS $B09F       branch if ok
// .:B09C 4C 08 AF JMP $AF08       else syntax error then warm start
//                                 was variable name so ...
// .:B09F A2 00    LDX #$00        clear 2nd character temp
// .:B0A1 86 0D    STX $0D         clear data type flag, $FF = string, $00 = numeric
// .:B0A3 86 0E    STX $0E         clear data type flag, $80 = integer, $00 = float
// .:B0A5 20 73 00 JSR $0073       increment and scan memory, 2nd character
// .:B0A8 90 05    BCC $B0AF       if character = "0"-"9" (ok) go save 2nd character
//                                 2nd character wasn't "0" to "9" so ...
// .:B0AA 20 13 B1 JSR $B113       check byte, return Cb = 0 if<"A" or >"Z"
// .:B0AD 90 0B    BCC $B0BA       branch if <"A" or >"Z" (go check if string)
// .:B0AF AA       TAX             copy 2nd character
//                                 ignore further (valid) characters in the variable name
// .:B0B0 20 73 00 JSR $0073       increment and scan memory, 3rd character
// .:B0B3 90 FB    BCC $B0B0       loop if character = "0"-"9" (ignore)
// .:B0B5 20 13 B1 JSR $B113       check byte, return Cb = 0 if<"A" or >"Z"
// .:B0B8 B0 F6    BCS $B0B0       loop if character = "A"-"Z" (ignore)
//                                 check if string variable
// .:B0BA C9 24    CMP #$24        compare with "$"
// .:B0BC D0 06    BNE $B0C4       branch if not string
//                                 type is string
// .:B0BE A9 FF    LDA #$FF        set data type = string
// .:B0C0 85 0D    STA $0D         set data type flag, $FF = string, $00 = numeric
// .:B0C2 D0 10    BNE $B0D4       branch always
// .:B0C4 C9 25    CMP #$25        compare with "%"
// .:B0C6 D0 13    BNE $B0DB       branch if not integer
// .:B0C8 A5 10    LDA $10         get subscript/FNX flag
// .:B0CA D0 D0    BNE $B09C       if ?? do syntax error then warm start
// .:B0CC A9 80    LDA #$80        set integer type
// .:B0CE 85 0E    STA $0E         set data type = integer
// .:B0D0 05 45    ORA $45         OR current variable name first byte
// .:B0D2 85 45    STA $45         save current variable name first byte
// .:B0D4 8A       TXA             get 2nd character back
// .:B0D5 09 80    ORA #$80        set top bit, indicate string or integer variable
// .:B0D7 AA       TAX             copy back to 2nd character temp
// .:B0D8 20 73 00 JSR $0073       increment and scan memory
// .:B0DB 86 46    STX $46         save 2nd character
// .:B0DD 38       SEC             set carry for subtract
// .:B0DE 05 10    ORA $10         or with subscript/FNX flag - or FN name
// .:B0E0 E9 28    SBC #$28        subtract "("
// .:B0E2 D0 03    BNE $B0E7       branch if not "("
// .:B0E4 4C D1 B1 JMP $B1D1       go find, or make, array
//                                 either find or create variable
//                                 variable name wasn't xx(.... so look for plain variable

.label /* $B0E7 - 45287 */ BASIC_B0E7_locate_ordinary_variable = $B0E7
// .:B0E7 A0 00    LDY #$00        clear A
// .:B0E9 84 10    STY $10         clear subscript/FNX flag
// .:B0EB A5 2D    LDA $2D         get start of variables low byte
// .:B0ED A6 2E    LDX $2E         get start of variables high byte
// .:B0EF 86 60    STX $60         save search address high byte
// .:B0F1 85 5F    STA $5F         save search address low byte
// .:B0F3 E4 30    CPX $30         compare with end of variables high byte
// .:B0F5 D0 04    BNE $B0FB       skip next compare if <>
//                                 high addresses were = so compare low addresses
// .:B0F7 C5 2F    CMP $2F         compare low address with end of variables low byte
// .:B0F9 F0 22    BEQ $B11D       if not found go make new variable
// .:B0FB A5 45    LDA $45         get 1st character of variable to find
// .:B0FD D1 5F    CMP ($5F),Y     compare with variable name 1st character
// .:B0FF D0 08    BNE $B109       branch if no match
//                                 1st characters match so compare 2nd character
// .:B101 A5 46    LDA $46         get 2nd character of variable to find
// .:B103 C8       INY             index to point to variable name 2nd character
// .:B104 D1 5F    CMP ($5F),Y     compare with variable name 2nd character
// .:B106 F0 7D    BEQ $B185       branch if match (found variable)
// .:B108 88       DEY             else decrement index (now = $00)
// .:B109 18       CLC             clear carry for add
// .:B10A A5 5F    LDA $5F         get search address low byte
// .:B10C 69 07    ADC #$07        +7, offset to next variable name
// .:B10E 90 E1    BCC $B0F1       loop if no overflow to high byte
// .:B110 E8       INX             else increment high byte
// .:B111 D0 DC    BNE $B0EF       loop always, RAM doesn't extend to $FFFF
//                                 check byte, return Cb = 0 if<"A" or >"Z"

.label /* $B113 - 45331 */ BASIC_B113_does_a_hold_an_alphabetic_character = $B113
// .:B113 C9 41    CMP #$41        compare with "A"
// .:B115 90 05    BCC $B11C       exit if less
//                                 carry is set
// .:B117 E9 5B    SBC #$5B        subtract "Z"+1
// .:B119 38       SEC             set carry
// .:B11A E9 A5    SBC #$A5        subtract $A5 (restore byte)
//                                 carry clear if byte > $5A
// .:B11C 60       RTS
//                                 reached end of variable memory without match
//                                 ... so create new variable

.label /* $B11D - 45341 */ BASIC_B11D_create_new_variable = $B11D
// .:B11D 68       PLApop return address low byte
// .:B11E 48       PHA             push return address low byte
// .:B11F C9 2A    CMP #$2A        compare with expected calling routine return low byte
// .:B121 D0 05    BNE $B128       if not get variable go create new variable
//                                 this will only drop through if the call was from $AF28 and is only called
//                                 from there if it is searching for a variable from the right hand side of a LET a=b
//                                 statement, it prevents the creation of variables not assigned a value.
//                                 value returned by this is either numeric zero, exponent byte is $00, or null string,
//                                 descriptor length byte is $00. in fact a pointer to any $00 byte would have done.
//                                 else return dummy null value
// .:B123 A9 13    LDA #$13        set result pointer low byte
// .:B125 A0 BF    LDY #$BF        set result pointer high byte
// .:B127 60       RTS

.label /* $B128 - 45352 */ BASIC_B128_create_variable = $B128
//                                 create new numeric variable
// .:B128 A5 45    LDA $45         get variable name first character
// .:B12A A4 46    LDY $46         get variable name second character
// .:B12C C9 54    CMP #$54        compare first character with "T"
// .:B12E D0 0B    BNE $B13B       branch if not "T"
// .:B130 C0 C9    CPY #$C9        compare second character with "I$"
// .:B132 F0 EF    BEQ $B123       if "I$" return null value
// .:B134 C0 49    CPY #$49        compare second character with "I"
// .:B136 D0 03    BNE $B13B       branch if not "I"
//                                 if name is "TI" do syntax error
// .:B138 4C 08 AF JMP $AF08       do syntax error then warm start
// .:B13B C9 53    CMP #$53        compare first character with "S"
// .:B13D D0 04    BNE $B143       branch if not "S"
// .:B13F C0 54    CPY #$54        compare second character with "T"
// .:B141 F0 F5    BEQ $B138       if name is "ST" do syntax error
// .:B143 A5 2F    LDA $2F         get end of variables low byte
// .:B145 A4 30    LDY $30         get end of variables high byte
// .:B147 85 5F    STA $5F         save old block start low byte
// .:B149 84 60    STY $60         save old block start high byte
// .:B14B A5 31    LDA $31         get end of arrays low byte
// .:B14D A4 32    LDY $32         get end of arrays high byte
// .:B14F 85 5A    STA $5A         save old block end low byte
// .:B151 84 5B    STY $5B         save old block end high byte
// .:B153 18       CLC             clear carry for add
// .:B154 69 07    ADC #$07        +7, space for one variable
// .:B156 90 01    BCC $B159       branch if no overflow to high byte
// .:B158 C8       INY             else increment high byte
// .:B159 85 58    STA $58         set new block end low byte
// .:B15B 84 59    STY $59         set new block end high byte
// .:B15D 20 B8 A3 JSR $A3B8       open up space in memory
// .:B160 A5 58    LDA $58         get new start low byte
// .:B162 A4 59    LDY $59         get new start high byte (-$100)
// .:B164 C8       INY             correct high byte
// .:B165 85 2F    STA $2F         set end of variables low byte
// .:B167 84 30    STY $30         set end of variables high byte
// .:B169 A0 00    LDY #$00        clear index
// .:B16B A5 45    LDA $45         get variable name 1st character
// .:B16D 91 5F    STA ($5F),Y     save variable name 1st character
// .:B16F C8       INY             increment index
// .:B170 A5 46    LDA $46         get variable name 2nd character
// .:B172 91 5F    STA ($5F),Y     save variable name 2nd character
// .:B174 A9 00    LDA #$00        clear A
// .:B176 C8       INY             increment index
// .:B177 91 5F    STA ($5F),Y     initialise variable byte
// .:B179 C8       INY             increment index
// .:B17A 91 5F    STA ($5F),Y     initialise variable byte
// .:B17C C8       INY             increment index
// .:B17D 91 5F    STA ($5F),Y     initialise variable byte
// .:B17F C8       INY             increment index
// .:B180 91 5F    STA ($5F),Y     initialise variable byte
// .:B182 C8       INY             increment index
// .:B183 91 5F    STA ($5F),Y     initialise variable byte
//                                 found a match for variable
// .:B185 A5 5F    LDA $5F         get variable address low byte
// .:B187 18       CLC             clear carry for add
// .:B188 69 02    ADC #$02        +2, offset past variable name bytes
// .:B18A A4 60    LDY $60         get variable address high byte
// .:B18C 90 01    BCC $B18F       branch if no overflow from add
// .:B18E C8       INYelse increment high byte
// .:B18F 85 47    STA $47         save current variable pointer low byte
// .:B191 84 48    STY $48         save current variable pointer high byte
// .:B193 60       RTS

.label /* $B194 - 45460 */ BASIC_B194_allocate_array_pointer_space = $B194
//                                 set-up array pointer to first element in array
// .:B194 A5 0B    LDA $0B         get # of dimensions (1, 2 or 3)
// .:B196 0A       ASL             *2 (also clears the carry !)
// .:B197 69 05    ADC #$05        +5 (result is 7, 9 or 11 here)
// .:B199 65 5F    ADC $5F         add array start pointer low byte
// .:B19B A4 60    LDY $60         get array pointer high byte
// .:B19D 90 01    BCC $B1A0       branch if no overflow
// .:B19F C8       INY             else increment high byte
// .:B1A0 85 58    STA $58         save array data pointer low byte
// .:B1A2 84 59    STY $59         save array data pointer high byte
// .:B1A4 60       RTS

.label /* $B1A5 - 45477 */ BASIC_B1A5_constant_32768_in_flpt = $B1A5
// -32768 as floating value
// .:B1A5 90 80 00 00 00           -32768

.label /* $B1AA - 45482 */ BASIC_B1AA_fac_1_to_integer_in_a_y = $B1AA
// convert float to fixed
//
// .:B1AA 20 BF B1 JSR $B1BF       evaluate integer expression, no sign check
// .:B1AD A5 64    LDA $64         get result low byte
// .:B1AF A4 65    LDY $65         get result high byte
// .:B1B1 60       RTS

.label /* $B1B2 - 45490 */ BASIC_B1B2_evaluate_text_for_integer = $B1B2
// evaluate integer expression
//
// .:B1B2 20 73 00 JSR $0073       increment and scan memory
// .:B1B5 20 9E AD JSR $AD9E       evaluate expression
//                                 evaluate integer expression, sign check
// .:B1B8 20 8D AD JSR $AD8D       check if source is numeric, else do type mismatch
// .:B1BB A5 66    LDA $66         get FAC1 sign (b7)
// .:B1BD 30 0D    BMI $B1CC       do illegal quantity error if -ve

.label /* $B1BF - 45503 */ BASIC_B1BF_fac_1_to_positive_integer = $B1BF
//                                 evaluate integer expression, no sign check
// .:B1BF A5 61    LDA $61         get FAC1 exponent
// .:B1C1 C9 90    CMP #$90        compare with exponent = 2^16 (n>2^15)
// .:B1C3 90 09    BCC $B1CE       if n<2^16 go convert FAC1 floating to fixed and return
// .:B1C5 A9 A5    LDA #$A5        set pointer low byte to -32768
// .:B1C7 A0 B1    LDY #$B1        set pointer high byte to -32768
// .:B1C9 20 5B BC JSR $BC5B       compare FAC1 with (AY)
// .:B1CC D0 7A    BNE $B248       if <> do illegal quantity error then warm start
// .:B1CE 4C 9B BC JMP $BC9B       convert FAC1 floating to fixed and return

.label /* $B1D1 - 45521 */ BASIC_B1D1_get_array_parameters = $B1D1
// find or make array
//
//                                 an array is stored as follows
//
//                                 array name             two bytes with the following patterns for different types
//                                                        1st char    2nd char
//                                                           b7          b7       type             element size
//                                                        --------    --------    -----            ------------
//                                                           0           0        floating point   5
//                                                           0           1        string           3
//                                                           1           1        integer          2
//                                 offset to next array   word
//                                 dimension count        byte
//                                 1st dimension size     word, this is the number of elements including 0
//                                 2nd dimension size     word, only here if the array has a second dimension
//                                 2nd dimension size     word, only here if the array has a third dimension
//                                                        note: the dimension size word is in high byte low byte
//                                                        format, not like most 6502 words
//                                 then for each element the required number of bytes given as the element size above
// .:B1D1 A5 0C    LDA $0C         get DIM flag
// .:B1D3 05 0E    ORA $0E         OR with data type flag
// .:B1D5 48       PHA             push it
// .:B1D6 A5 0D    LDA $0D         get data type flag, $FF = string, $00 = numeric
// .:B1D8 48       PHA             push it
// .:B1D9 A0 00    LDY #$00        clear dimensions count
//                                 now get the array dimension(s) and stack it (them) before the data type and DIM flag
// .:B1DB 98       TYA             copy dimensions count
// .:B1DC 48       PHA             save it
// .:B1DD A5 46    LDA $46         get array name 2nd byte
// .:B1DF 48       PHA             save it
// .:B1E0 A5 45    LDA $45         get array name 1st byte
// .:B1E2 48       PHA             save it
// .:B1E3 20 B2 B1 JSR $B1B2       evaluate integer expression
// .:B1E6 68       PLA             pull array name 1st byte
// .:B1E7 85 45    STA $45         restore array name 1st byte
// .:B1E9 68       PLA             pull array name 2nd byte
// .:B1EA 85 46    STA $46         restore array name 2nd byte
// .:B1EC 68       PLA             pull dimensions count
// .:B1ED A8       TAY             restore it
// .:B1EE BA       TSX             copy stack pointer
// .:B1EF BD 02 01 LDA $0102,X     get DIM flag
// .:B1F2 48       PHA             push it
// .:B1F3 BD 01 01 LDA $0101,X     get data type flag
// .:B1F6 48       PHA             push it
// .:B1F7 A5 64    LDA $64         get this dimension size high byte
// .:B1F9 9D 02 01 STA $0102,X     stack before flag bytes
// .:B1FC A5 65    LDA $65         get this dimension size low byte
// .:B1FE 9D 01 01 STA $0101,X     stack before flag bytes
// .:B201 C8       INY             increment dimensions count
// .:B202 20 79 00 JSR $0079       scan memory
// .:B205 C9 2C    CMP #$2C        compare with ","
// .:B207 F0 D2    BEQ $B1DB       if found go do next dimension
// .:B209 84 0B    STY $0B         store dimensions count
// .:B20B 20 F7 AE JSR $AEF7       scan for ")", else do syntax error then warm start
// .:B20E 68       PLA             pull data type flag
// .:B20F 85 0D    STA $0D         restore data type flag, $FF = string, $00 = numeric
// .:B211 68       PLA             pull data type flag
// .:B212 85 0E    STA $0E         restore data type flag, $80 = integer, $00 = float
// .:B214 29 7F    AND #$7F        mask dim flag
// .:B216 85 0C    STA $0C         restore DIM flag

.label /* $B218 - 45592 */ BASIC_B218_find_array = $B218
// .:B218 A6 2F    LDX $2F         set end of variables low byte
//                                 (array memory start low byte)
// .:B21A A5 30    LDA $30         set end of variables high byte
//                                 (array memory start high byte)
//                                 now check to see if we are at the end of array memory, we would be if there were
//                                 no arrays.
// .:B21C 86 5F    STX $5F         save as array start pointer low byte
// .:B21E 85 60    STA $60         save as array start pointer high byte
// .:B220 C5 32    CMP $32         compare with end of arrays high byte
// .:B222 D0 04    BNE $B228       branch if not reached array memory end
// .:B224 E4 31    CPX $31         else compare with end of arrays low byte
// .:B226 F0 39    BEQ $B261       go build array if not found
//                                 search for array
// .:B228 A0 00    LDY #$00        clear index
// .:B22A B1 5F    LDA ($5F),Y     get array name first byte
// .:B22C C8       INY             increment index to second name byte
// .:B22D C5 45    CMP $45         compare with this array name first byte
// .:B22F D0 06    BNE $B237       branch if no match
// .:B231 A5 46    LDA $46         else get this array name second byte
// .:B233 D1 5F    CMP ($5F),Y     compare with array name second byte
// .:B235 F0 16    BEQ $B24D       array found so branch
//                                 no match
// .:B237 C8       INY             increment index
// .:B238 B1 5F    LDA ($5F),Y     get array size low byte
// .:B23A 18       CLC             clear carry for add
// .:B23B 65 5F    ADC $5F         add array start pointer low byte
// .:B23D AA       TAX             copy low byte to X
// .:B23E C8       INY             increment index
// .:B23F B1 5F    LDA ($5F),Y     get array size high byte
// .:B241 65 60    ADC $60         add array memory pointer high byte
// .:B243 90 D7    BCC $B21C       if no overflow go check next array

.label /* $B245 - 45637 */ BASIC_B245_bad_subscript = $B245
// do bad subscript error
//
// .:B245 A2 12    LDX #$12        error $12, bad subscript error
// .:B247 2C       .BYTE $2C       makes next line BIT $0EA2

.label /* $B248 - 45640 */ BASIC_B248_illegal_quantity = $B248
// do illegal quantity error
//
// .:B248 A2 0E    LDX #$0E        error $0E, illegal quantity error
// .:B24A 4C 37 A4 JMP $A437       do error #X then warm start

.label /* $B24D - 45645 */ BASIC_B24D_redim_d_array = $B24D
// found the array
//
// .:B24D A2 13    LDX #$13        set error $13, double dimension error
// .:B24F A5 0C    LDA $0C         get DIM flag
// .:B251 D0 F7    BNE $B24A       if we are trying to dimension it do error #X then warm
//                                 start
//                                 found the array and we're not dimensioning it so we must find an element in it
// .:B253 20 94 B1 JSR $B194       set-up array pointer to first element in array
// .:B256 A5 0B    LDA $0B         get dimensions count
// .:B258 A0 04    LDY #$04        set index to array's # of dimensions
// .:B25A D1 5F    CMP ($5F),Y     compare with no of dimensions
// .:B25C D0 E7    BNE $B245       if wrong do bad subscript error
// .:B25E 4C EA B2 JMP $B2EA       found array so go get element

.label /* $B261 - 45665 */ BASIC_B261_create_array = $B261
//                                 array not found, so build it
// .:B261 20 94 B1 JSR $B194       set-up array pointer to first element in array
// .:B264 20 08 A4 JSR $A408       check available memory, do out of memory error if no room
// .:B267 A0 00    LDY #$00        clear Y
// .:B269 84 72    STY $72         clear array data size high byte
// .:B26B A2 05    LDX #$05        set default element size
// .:B26D A5 45    LDA $45         get variable name 1st byte
// .:B26F 91 5F    STA ($5F),Y     save array name 1st byte
// .:B271 10 01    BPL $B274       branch if not string or floating point array
// .:B273 CA       DEX             decrement element size, $04
// .:B274 C8       INY             increment index
// .:B275 A5 46    LDA $46         get variable name 2nd byte
// .:B277 91 5F    STA ($5F),Y     save array name 2nd byte
// .:B279 10 02    BPL $B27D       branch if not integer or string
// .:B27B CA       DEX             decrement element size, $03
// .:B27C CA       DEX             decrement element size, $02
// .:B27D 86 71    STX $71         save element size
// .:B27F A5 0B    LDA $0B         get dimensions count
// .:B281 C8       INY             increment index ..
// .:B282 C8       INY             .. to array  ..
// .:B283 C8       INY             .. dimension count
// .:B284 91 5F    STA ($5F),Y     save array dimension count
// .:B286 A2 0B    LDX #$0B        set default dimension size low byte
// .:B288 A9 00    LDA #$00        set default dimension size high byte
// .:B28A 24 0C    BIT $0C         test DIM flag
// .:B28C 50 08    BVC $B296       branch if default to be used
// .:B28E 68       PLA             pull dimension size low byte
// .:B28F 18       CLC             clear carry for add
// .:B290 69 01    ADC #$01        add 1, allow for zeroeth element
// .:B292 AA       TAX             copy low byte to X
// .:B293 68       PLA             pull dimension size high byte
// .:B294 69 00    ADC #$00        add carry to high byte
// .:B296 C8       INY             incement index to dimension size high byte
// .:B297 91 5F    STA ($5F),Y     save dimension size high byte
// .:B299 C8       INY             incement index to dimension size low byte
// .:B29A 8A       TXA             copy dimension size low byte
// .:B29B 91 5F    STA ($5F),Y     save dimension size low byte
// .:B29D 20 4C B3 JSR $B34C       compute array size
// .:B2A0 86 71    STX $71         save result low byte
// .:B2A2 85 72    STA $72         save result high byte
// .:B2A4 A4 22    LDY $22         restore index
// .:B2A6 C6 0B    DEC $0B         decrement dimensions count
// .:B2A8 D0 DC    BNE $B286       loop if not all done
// .:B2AA 65 59    ADC $59         add array data pointer high byte
// .:B2AC B0 5D    BCS $B30B       if overflow do out of memory error then warm start
// .:B2AE 85 59    STA $59         save array data pointer high byte
// .:B2B0 A8       TAY             copy array data pointer high byte
// .:B2B1 8A       TXA             copy array size low byte
// .:B2B2 65 58    ADC $58         add array data pointer low byte
// .:B2B4 90 03    BCC $B2B9       branch if no rollover
// .:B2B6 C8       INY             else increment next array pointer high byte
// .:B2B7 F0 52    BEQ $B30B       if rolled over do out of memory error then warm start
// .:B2B9 20 08 A4 JSR $A408       check available memory, do out of memory error if no room
// .:B2BC 85 31    STA $31         set end of arrays low byte
// .:B2BE 84 32    STY $32         set end of arrays high byte
//                                 now the aray is created we need to zero all the elements in it
// .:B2C0 A9 00    LDA #$00        clear A for array clear
// .:B2C2 E6 72    INC $72increment array size high byte, now block count
// .:B2C4 A4 71    LDY $71         get array size low byte, now index to block
// .:B2C6 F0 05    BEQ $B2CD       branch if $00
// .:B2C8 88       DEY             decrement index, do 0 to n-1
// .:B2C9 91 58    STA ($58),Y     clear array element byte
// .:B2CB D0 FB    BNE $B2C8       loop until this block done
// .:B2CD C6 59    DEC $59decrement array pointer high byte
// .:B2CF C6 72    DEC $72decrement block count high byte
// .:B2D1 D0 F5    BNE $B2C8loop until all blocks done
// .:B2D3 E6 59    INC $59correct for last loop
// .:B2D5 38       SEC             set carry for subtract
// .:B2D6 A5 31    LDA $31         get end of arrays low byte
// .:B2D8 E5 5F    SBC $5F         subtract array start low byte
// .:B2DA A0 02    LDY #$02        index to array size low byte
// .:B2DC 91 5F    STA ($5F),Y     save array size low byte
// .:B2DE A5 32    LDA $32         get end of arrays high byte
// .:B2E0 C8       INY             index to array size high byte
// .:B2E1 E5 60    SBC $60         subtract array start high byte
// .:B2E3 91 5F    STA ($5F),Y     save array size high byte
// .:B2E5 A5 0C    LDA $0C         get default DIM flag
// .:B2E7 D0 62    BNE $B34B       exit if this was a DIM command
//                                 else, find element
// .:B2E9 C8       INY             set index to # of dimensions, the dimension indeces
//                                 are on the stack and will be removed as the position
//                                 of the array element is calculated
// .:B2EA B1 5F    LDA ($5F),Y     get array's dimension count
// .:B2EC 85 0B    STA $0B         save it
// .:B2EE A9 00    LDA #$00        clear byte
// .:B2F0 85 71    STA $71         clear array data pointer low byte
// .:B2F2 85 72    STA $72         save array data pointer high byte
// .:B2F4 C8       INY             increment index, point to array bound high byte
// .:B2F5 68       PLA             pull array index low byte
// .:B2F6 AA       TAX             copy to X
// .:B2F7 85 64    STA $64         save index low byte to FAC1 mantissa 3
// .:B2F9 68       PLA             pull array index high byte
// .:B2FA 85 65    STA $65         save index high byte to FAC1 mantissa 4
// .:B2FC D1 5F    CMP ($5F),Y     compare with array bound high byte
// .:B2FE 90 0E    BCC $B30E       branch if within bounds
// .:B300 D0 06    BNE $B308       if outside bounds do bad subscript error
//                                 else high byte was = so test low bytes
// .:B302 C8       INY             index to array bound low byte
// .:B303 8A       TXA             get array index low byte
// .:B304 D1 5F    CMP ($5F),Y     compare with array bound low byte
// .:B306 90 07    BCC $B30F       branch if within bounds
// .:B308 4C 45 B2 JMP $B245       do bad subscript error
// .:B30B 4C 35 A4 JMP $A435       do out of memory error then warm start

.label /* $B30E - 45838 */ BASIC_B30E_locate_element_in_array = $B30E
// .:B30E C8       INY             index to array bound low byte
// .:B30F A5 72    LDA $72         get array data pointer high byte
// .:B311 05 71    ORA $71         OR with array data pointer low byte
// .:B313 18       CLC             clear carry for either add, carry always clear here ??
// .:B314 F0 0A    BEQ $B320       branch if array data pointer = null, skip multiply
// .:B316 20 4C B3 JSR $B34C       compute array size
// .:B319 8A       TXA             get result low byte
// .:B31A 65 64    ADC $64add index low byte from FAC1 mantissa 3
// .:B31C AA       TAX             save result low byte
// .:B31D 98       TYAget result high byte
// .:B31E A4 22    LDY $22         restore index
// .:B320 65 65    ADC $65add index high byte from FAC1 mantissa 4
// .:B322 86 71    STX $71save array data pointer low byte
// .:B324 C6 0B    DEC $0B         decrement dimensions count
// .:B326 D0 CA    BNE $B2F2       loop if dimensions still to do
// .:B328 85 72    STA $72save array data pointer high byte
// .:B32A A2 05    LDX #$05        set default element size
// .:B32C A5 45    LDA $45         get variable name 1st byte
// .:B32E 10 01    BPL $B331       branch if not string or floating point array
// .:B330 CA       DEX             decrement element size, $04
// .:B331 A5 46    LDA $46         get variable name 2nd byte
// .:B333 10 02    BPL $B337       branch if not integer or string
// .:B335 CA       DEX             decrement element size, $03
// .:B336 CA       DEX             decrement element size, $02
// .:B337 86 28    STX $28         save dimension size low byte
// .:B339 A9 00    LDA #$00        clear dimension size high byte
// .:B33B 20 55 B3 JSR $B355       compute array size
// .:B33E 8A       TXA             copy array size low byte
// .:B33F 65 58    ADC $58         add array data start pointer low byte
// .:B341 85 47    STA $47         save as current variable pointer low byte
// .:B343 98       TYA             copy array size high byte
// .:B344 65 59    ADC $59         add array data start pointer high byte
// .:B346 85 48    STA $48         save as current variable pointer high byte
// .:B348 A8       TAY             copy high byte to Y
// .:B349 A5 47    LDA $47         get current variable pointer low byte
//                                 pointer to element is now in AY
// .:B34B 60       RTS

.label /* $B34C - 45900 */ BASIC_B34C_number_of_bytes_in_subscript = $B34C
//                                 compute array size, result in XY
// .:B34C 84 22    STY $22         save index
// .:B34E B1 5F    LDA ($5F),Y     get dimension size low byte
// .:B350 85 28    STA $28         save dimension size low byte
// .:B352 88       DEY             decrement index
// .:B353 B1 5F    LDA ($5F),Y     get dimension size high byte
// .:B355 85 29    STA $29         save dimension size high byte
// .:B357 A9 10    LDA #$10        count = $10 (16 bit multiply)
// .:B359 85 5D    STA $5D         save bit count
// .:B35B A2 00    LDX #$00        clear result low byte
// .:B35D A0 00    LDY #$00        clear result high byte
// .:B35F 8A       TXA             get result low byte
// .:B360 0A       ASL             *2
// .:B361 AA       TAX             save result low byte
// .:B362 98       TYA             get result high byte
// .:B363 2A       ROL             *2
// .:B364 A8       TAY             save result high byte
// .:B365 B0 A4    BCS $B30B       if overflow go do "Out of memory" error
// .:B367 06 71    ASL $71         shift element size low byte
// .:B369 26 72    ROL $72         shift element size high byte
// .:B36B 90 0B    BCC $B378       skip add if no carry
// .:B36D 18       CLC             else clear carry for add
// .:B36E 8A       TXA             get result low byte
// .:B36F 65 28    ADC $28         add dimension size low byte
// .:B371 AA       TAX             save result low byte
// .:B372 98       TYA             get result high byte
// .:B373 65 29    ADC $29         add dimension size high byte
// .:B375 A8       TAY             save result high byte
// .:B376 B0 93    BCS $B30B       if overflow go do "Out of memory" error
// .:B378 C6 5D    DEC $5D         decrement bit count
// .:B37A D0 E3    BNE $B35F       loop until all done
// .:B37C 60       RTS

.label /* $B37D - 45949 */ BASIC_B37D_evaluate_fre = $B37D
//                                 perform FRE()
// .:B37D A5 0D    LDA $0D         get data type flag, $FF = string, $00 = numeric
// .:B37F F0 03    BEQ $B384       branch if numeric
// .:B381 20 A6 B6 JSR $B6A6       pop string off descriptor stack, or from top of string
//                                 space returns with A = length, X=$71=pointer low byte,
//                                 Y=$72=pointer high byte
//                                 FRE(n) was numeric so do this
// .:B384 20 26 B5 JSR $B526       go do garbage collection
// .:B387 38       SEC             set carry for subtract
// .:B388 A5 33    LDA $33         get bottom of string space low byte
// .:B38A E5 31    SBC $31         subtract end of arrays low byte
// .:B38C A8       TAY             copy result to Y
// .:B38D A5 34    LDA $34         get bottom of string space high byte
// .:B38F E5 32    SBC $32         subtract end of arrays high byte

.label /* $B391 - 45969 */ BASIC_B391_convert_integer_in_ac_yr_to_flpt = $B391
// convert fixed integer AY to float FAC1
//
// .:B391 A2 00    LDX #$00        set type = numeric
// .:B393 86 0D    STX $0D         clear data type flag, $FF = string, $00 = numeric
// .:B395 85 62    STA $62         save FAC1 mantissa 1
// .:B397 84 63    STY $63         save FAC1 mantissa 2
// .:B399 A2 90    LDX #$90        set exponent=2^16 (integer)
// .:B39B 4C 44 BC JMP $BC44       set exp = X, clear FAC1 3 and 4, normalise and return

.label /* $B39E - 45982 */ BASIC_B39E_evaluate_pos = $B39E
// perform POS()

// .:B39E 38       SEC             set Cb for read cursor position
// .:B39F 20 F0 FF JSR $FFF0       read/set X,Y cursor position
// .:B3A2 A9 00    LDA #$00        clear high byte
// .:B3A4 F0 EB    BEQ $B391       convert fixed integer AY to float FAC1, branch always

.label /* $B3A6 - 45990 */ BASIC_B3A6_confirm_program_mode = $B3A6
//	                               check not Direct, used by DEF and INPUT
// .:B3A6 A6 3A    LDX $3A         get current line number high byte
// .:B3A8 E8       INX             increment it
// .:B3A9 D0 A0    BNE $B34B       return if not direct mode
//                                 else do illegal direct error
// .:B3AB A2 15    LDX #$15        error $15, illegal direct error
// .:B3AD 2C       .BYTE $2C       makes next line BIT $1BA2

.label /* $B3AE - 45998 */ BASIC_B3AE_undef_d_function = $B3AE
// .:B3AE A2 1B    LDX #$1B        error $1B, undefined function error
// .:B3B0 4C 37 A4 JMP $A437       do error #X then warm start

.label /* $B3B3 - 46003 */ BASIC_B3B3_perform_def_fn = $B3B3
// perform DEF
//
// .:B3B3 20 E1 B3 JSR $B3E1       check FNx syntax
// .:B3B6 20 A6 B3 JSR $B3A6       check not direct, back here if ok
// .:B3B9 20 FA AE JSR $AEFA       scan for "(", else do syntax error then warm start
// .:B3BC A9 80    LDA #$80        set flag for FNx
// .:B3BE 85 10    STA $10         save subscript/FNx flag
// .:B3C0 20 8B B0 JSR $B08B       get variable address
// .:B3C3 20 8D AD JSR $AD8D       check if source is numeric, else do type mismatch
// .:B3C6 20 F7 AE JSR $AEF7       scan for ")", else do syntax error then warm start
// .:B3C9 A9 B2    LDA #$B2        get = token
// .:B3CB 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:B3CE 48       PHA             push next character
// .:B3CF A5 48    LDA $48         get current variable pointer high byte
// .:B3D1 48       PHA             push it
// .:B3D2 A5 47    LDA $47         get current variable pointer low byte
// .:B3D4 48       PHA             push it
// .:B3D5 A5 7B    LDA $7B         get BASIC execute pointer high byte
// .:B3D7 48       PHA             push it
// .:B3D8 A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:B3DA 48       PHA             push it
// .:B3DB 20 F8 A8 JSR $A8F8       perform DATA
// .:B3DE 4C 4F B4 JMP $B44F       put execute pointer and variable pointer into function
//                                 and return

.label /* $B3E1 - 46049 */ BASIC_B3E1_check_syntax_of_fn = $B3E1
// check FNx syntax
//
// .:B3E1 A9 A5    LDA #$A5        set FN token
// .:B3E3 20 FF AE JSR $AEFF       scan for CHR$(A), else do syntax error then warm start
// .:B3E6 09 80    ORA #$80        set FN flag bit
// .:B3E8 85 10    STA $10         save FN name
// .:B3EA 20 92 B0 JSR $B092       search for FN variable
// .:B3ED 85 4E    STA $4E         save function pointer low byte
// .:B3EF 84 4F    STY $4F         save function pointer high byte
// .:B3F1 4C 8D AD JMP $AD8D       check if source is numeric and return, else do type
//                                 mismatch

.label /* $B3F4 - 46068 */ BASIC_B3F4_perform_fn = $B3F4
//
// Evaluate FNx
//
// .:B3F4 20 E1 B3 JSR $B3E1       check FNx syntax
// .:B3F7 A5 4F    LDA $4F         get function pointer high byte
// .:B3F9 48       PHA             push it
// .:B3FA A5 4E    LDA $4E         get function pointer low byte
// .:B3FC 48       PHA             push it
// .:B3FD 20 F1 AE JSR $AEF1       evaluate expression within parentheses
// .:B400 20 8D AD JSR $AD8D       check if source is numeric, else do type mismatch
// .:B403 68       PLA             pop function pointer low byte
// .:B404 85 4E    STA $4E         restore it
// .:B406 68       PLA             pop function pointer high byte
// .:B407 85 4F    STA $4F         restore it
// .:B409 A0 02    LDY #$02        index to variable pointer high byte
// .:B40B B1 4E    LDA ($4E),Y     get variable address low byte
// .:B40D 85 47    STA $47         save current variable pointer low byte
// .:B40F AA       TAX             copy address low byte
// .:B410 C8       INY             index to variable address high byte
// .:B411 B1 4E    LDA ($4E),Y     get variable pointer high byte
// .:B413 F0 99    BEQ $B3AE       branch if high byte zero
// .:B415 85 48    STA $48         save current variable pointer high byte
// .:B417 C8       INY             index to mantissa 3
//                                 now stack the function variable value before use
// .:B418 B1 47    LDA ($47),Y     get byte from variable
// .:B41A 48       PHA             stack it
// .:B41B 88       DEY             decrement index
// .:B41C 10 FA    BPL $B418       loop until variable stacked
// .:B41E A4 48    LDY $48         get current variable pointer high byte
// .:B420 20 D4 BB JSR $BBD4       pack FAC1 into (XY)
// .:B423 A5 7B    LDA $7B         get BASIC execute pointer high byte
// .:B425 48       PHA             push it
// .:B426 A5 7A    LDA $7A         get BASIC execute pointer low byte
// .:B428 48       PHA             push it
// .:B429 B1 4E    LDA ($4E),Y     get function execute pointer low byte
// .:B42B 85 7A    STA $7A         save BASIC execute pointer low byte
// .:B42D C8       INY             index to high byte
// .:B42E B1 4E    LDA ($4E),Y     get function execute pointer high byte
// .:B430 85 7B    STA $7B         save BASIC execute pointer high byte
// .:B432 A5 48    LDA $48         get current variable pointer high byte
// .:B434 48       PHA             push it
// .:B435 A5 47    LDA $47         get current variable pointer low byte
// .:B437 48       PHA             push it
// .:B438 20 8A AD JSR $AD8A       evaluate expression and check is numeric, else do
//                                 type mismatch
// .:B43B 68       PLA             pull variable address low byte
// .:B43C 85 4E    STA $4E         save variable address low byte
// .:B43E 68       PLA             pull variable address high byte
// .:B43F 85 4F    STA $4F         save variable address high byte
// .:B441 20 79 00 JSR $0079       scan memory
// .:B444 F0 03    BEQ $B449       branch if null (should be [EOL] marker)
// .:B446 4C 08 AF JMP $AF08       else syntax error then warm start
//
// restore BASIC execute pointer and function variable from stack
// .:B449 68       PLA             pull BASIC execute pointer low byte
// .:B44A 85 7A    STA $7A         save BASIC execute pointer low byte
// .:B44C 68       PLA             pull BASIC execute pointer high byte
// .:B44D 85 7B    STA $7B         save BASIC execute pointer high byte
//                                 put execute pointer and variable pointer into function
// .:B44F A0 00    LDY #$00        clear index
// .:B451 68       PLA             pull BASIC execute pointer low byte
// .:B452 91 4E    STA ($4E),Y     save to function
// .:B454 68       PLA             pull BASIC execute pointer high byte
// .:B455 C8       INY             increment index
// .:B456 91 4E    STA ($4E),Y     save to function
// .:B458 68       PLA             pull current variable address low byte
// .:B459 C8       INY             increment index
// .:B45A 91 4E    STA ($4E),Y     save to function
// .:B45C 68       PLA             pull current variable address high byte
// .:B45D C8       INY             increment index
// .:B45E 91 4E    STA ($4E),Y     save to function
// .:B460 68       PLA             pull ??
// .:B461 C8       INY             increment index
// .:B462 91 4E    STA ($4E),Y     save to function
// .:B464 60       RTS

.label /* $B465 - 46181 */ BASIC_B465_evaluate_str = $B465
// perform STR$()
//
// .:B465 20 8D AD JSR $AD8D       check if source is numeric, else do type mismatch
// .:B468 A0 00    LDY #$00        set string index
// .:B46A 20 DF BD JSR $BDDF       convert FAC1 to string
// .:B46D 68       PLA             dump return address (skip type check)
// .:B46E 68       PLA             dump return address (skip type check)
// .:B46F A9 FF    LDA #$FF        set result string low pointer
// .:B471 A0 00    LDY #$00        set result string high pointer
// .:B473 F0 12    BEQ $B487       print null terminated string to utility pointer
//
// do string vector
//                                 copy descriptor pointer and make string space A bytes long
// .:B475 A6 64    LDX $64         get descriptor pointer low byte
// .:B477 A4 65    LDY $65         get descriptor pointer high byte
// .:B479 86 50    STX $50         save descriptor pointer low byte
// .:B47B 84 51    STY $51         save descriptor pointer high byte
//
// make string space A bytes long
//
// .:B47D 20 F4 B4 JSR $B4F4       make space in string memory for string A long
// .:B480 86 62    STX $62         save string pointer low byte
// .:B482 84 63    STY $63         save string pointer high byte
// .:B484 85 61    STA $61         save length
// .:B486 60       RTS

.label /* $B487 - 46215 */ BASIC_B487_set_up_string = $B487
// scan, set up string
//
//                                 print " terminated string to utility pointer
// .:B487 A2 22    LDX #$22        set terminator to "
// .:B489 86 07    STX $07         set search character, terminator 1
// .:B48B 86 08    STX $08         set terminator 2
//                                 print search or alternate terminated string to utility pointer
//                                  source is AY
// .:B48D 85 6F    STA $6F         store string start low byte
// .:B48F 84 70    STY $70         store string start high byte
// .:B491 85 62    STA $62         save string pointer low byte
// .:B493 84 63    STY $63         save string pointer high byte
// .:B495 A0 FF    LDY #$FF        set length to -1
// .:B497 C8       INY             increment length
// .:B498 B1 6F    LDA ($6F),Y     get byte from string
// .:B49A F0 0C    BEQ $B4A8       exit loop if null byte [EOS]
// .:B49C C5 07    CMP $07         compare with search character, terminator 1
// .:B49E F0 04    BEQ $B4A4       branch if terminator
// .:B4A0 C5 08    CMP $08         compare with terminator 2
// .:B4A2 D0 F3    BNE $B497       loop if not terminator 2
// .:B4A4 C9 22    CMP #$22        compare with "
// .:B4A6 F0 01    BEQ $B4A9       branch if " (carry set if = !)
// .:B4A8 18       CLC             clear carry for add (only if [EOL] terminated string)
// .:B4A9 84 61    STY $61         save length in FAC1 exponent
// .:B4AB 98       TYA             copy length to A
// .:B4AC 65 6F    ADC $6F         add string start low byte
// .:B4AE 85 71    STA $71         save string end low byte
// .:B4B0 A6 70    LDX $70         get string start high byte
// .:B4B2 90 01    BCC $B4B5       branch if no low byte overflow
// .:B4B4 E8       INX             else increment high byte
// .:B4B5 86 72    STX $72         save string end high byte
// .:B4B7 A5 70    LDA $70         get string start high byte
// .:B4B9 F0 04    BEQ $B4BF       branch if in utility area
// .:B4BB C9 02    CMP #$02        compare with input buffer memory high byte
// .:B4BD D0 0B    BNE $B4CA       branch if not in input buffer memory
//                                 string in input buffer or utility area, move to string
//                                 memory
// .:B4BF 98       TYA             copy length to A
// .:B4C0 20 75 B4 JSR $B475       copy descriptor pointer and make string space A bytes long
// .:B4C3 A6 6F    LDX $6F         get string start low byte
// .:B4C5 A4 70    LDY $70         get string start high byte
// .:B4C7 20 88 B6 JSR $B688       store string A bytes long from XY to utility pointer
//                                 check for space on descriptor stack then ...
//                                 put string address and length on descriptor stack and update stack pointers
// .:B4CA A6 16    LDX $16         get the descriptor stack pointer
// .:B4CC E0 22    CPX #$22        compare it with the maximum + 1
// .:B4CE D0 05    BNE $B4D5       if there is space on the string stack continue
//                                 else do string too complex error
// .:B4D0 A2 19    LDX #$19        error $19, string too complex error
// .:B4D2 4C 37 A4 JMP $A437       do error #X then warm start

.label /* $B4D5 - 46293 */ BASIC_B4D5_save_string_descriptor = $B4D5
//                                 put string address and length on descriptor stack and update stack pointers
// .:B4D5 A5 61    LDA $61         get the string length
// .:B4D7 95 00    STA $00,X       put it on the string stack
// .:B4D9 A5 62    LDA $62         get the string pointer low byte
// .:B4DB 95 01    STA $01,X       put it on the string stack
// .:B4DD A5 63    LDA $63         get the string pointer high byte
// .:B4DF 95 02    STA $02,X       put it on the string stack
// .:B4E1 A0 00    LDY #$00        clear Y
// .:B4E3 86 64    STX $64         save the string descriptor pointer low byte
// .:B4E5 84 65    STY $65         save the string descriptor pointer high byte, always $00
// .:B4E7 84 70    STY $70         clear FAC1 rounding byte
// .:B4E9 88       DEY             Y = $FF
// .:B4EA 84 0D    STY $0D         save the data type flag, $FF = string
// .:B4EC 86 17    STX $17         save the current descriptor stack item pointer low byte
// .:B4EE E8       INX             update the stack pointer
// .:B4EF E8       INX             update the stack pointer
// .:B4F0 E8       INX             update the stack pointer
// .:B4F1 86 16    STX $16         save the new descriptor stack pointer
// .:B4F3 60       RTS

.label /* $B4F4 - 46324 */ BASIC_B4F4_allocate_space_for_string = $B4F4
// make space in string memory for string A long
//
//                                 return X = pointer low byte, Y = pointer high byte
// .:B4F4 46 0F    LSR $0F         clear garbage collected flag (b7)
//                                 make space for string A long
// .:B4F6 48       PHA             save string length
// .:B4F7 49 FF    EOR #$FF        complement it
// .:B4F9 38       SEC             set carry for subtract, two's complement add
// .:B4FA 65 33    ADC $33         add bottom of string space low byte, subtract length
// .:B4FC A4 34    LDY $34         get bottom of string space high byte
// .:B4FE B0 01    BCS $B501       skip decrement if no underflow
// .:B500 88       DEY             decrement bottom of string space high byte
// .:B501 C4 32    CPY $32         compare with end of arrays high byte
// .:B503 90 11    BCC $B516       do out of memory error if less
// .:B505 D0 04    BNE $B50B       if not = skip next test
// .:B507 C5 31    CMP $31         compare with end of arrays low byte
// .:B509 90 0B    BCC $B516       do out of memory error if less
// .:B50B 85 33    STA $33         save bottom of string space low byte
// .:B50D 84 34    STY $34         save bottom of string space high byte
// .:B50F 85 35    STA $35         save string utility ptr low byte
// .:B511 84 36    STY $36         save string utility ptr high byte
// .:B513 AA       TAX             copy low byte to X
// .:B514 68       PLA             get string length back
// .:B515 60       RTS
// .:B516 A2 10    LDX #$10        error code $10, out of memory error
// .:B518 A5 0F    LDA $0F         get garbage collected flag
// .:B51A 30 B6    BMI $B4D2       if set then do error code X
// .:B51C 20 26 B5 JSR $B526       else go do garbage collection
// .:B51F A9 80    LDA #$80        flag for garbage collected
// .:B521 85 0F    STA $0F         set garbage collected flag
// .:B523 68       PLA             pull length
// .:B524 D0 D0    BNE $B4F6       go try again (loop always, length should never be = $00)
.label /* $B526 - 46374 */ BASIC_B526_garbage_collection = $B526
// garbage collection routine
//
// .:B526 A6 37    LDX $37         get end of memory low byte
// .:B528 A5 38    LDA $38         get end of memory high byte
//                                 re-run routine from last ending
// .:B52A 86 33    STX $33         set bottom of string space low byte
// .:B52C 85 34    STA $34         set bottom of string space high byte
// .:B52E A0 00    LDY #$00        clear index
// .:B530 84 4F    STY $4F         clear working pointer high byte
// .:B532 84 4E    STY $4E         clear working pointer low byte
// .:B534 A5 31    LDA $31         get end of arrays low byte
// .:B536 A6 32    LDX $32         get end of arrays high byte
// .:B538 85 5F    STA $5F         save as highest uncollected string pointer low byte
// .:B53A 86 60    STX $60         save as highest uncollected string pointer high byte
// .:B53C A9 19    LDA #$19        set descriptor stack pointer
// .:B53E A2 00    LDX #$00        clear X
// .:B540 85 22    STA $22         save descriptor stack pointer low byte
// .:B542 86 23    STX $23         save descriptor stack pointer high byte ($00)
// .:B544 C5 16    CMP $16         compare with descriptor stack pointer
// .:B546 F0 05    BEQ $B54D       branch if =
// .:B548 20 C7 B5 JSR $B5C7       check string salvageability
// .:B54B F0 F7    BEQ $B544       loop always
//                                 done stacked strings, now do string variables
// .:B54D A9 07    LDA #$07        set step size = $07, collecting variables
// .:B54F 85 53    STA $53         save garbage collection step size
// .:B551 A5 2D    LDA $2D         get start of variables low byte
// .:B553 A6 2E    LDX $2E         get start of variables high byte
// .:B555 85 22    STA $22         save as pointer low byte
// .:B557 86 23    STX $23         save as pointer high byte
// .:B559 E4 30    CPX $30         compare end of variables high byte,
//                                 start of arrays high byte
// .:B55B D0 04    BNE $B561       branch if no high byte match
// .:B55D C5 2F    CMP $2F         else compare end of variables low byte,
//                                 start of arrays low byte
// .:B55F F0 05    BEQ $B566       branch if = variable memory end
// .:B561 20 BD B5 JSR $B5BD       check variable salvageability
// .:B564 F0 F3    BEQ $B559       loop always
//                                 done string variables, now do string arrays
// .:B566 85 58    STA $58         save start of arrays low byte as working pointer
// .:B568 86 59    STX $59         save start of arrays high byte as working pointer
// .:B56A A9 03    LDA #$03        set step size, collecting descriptors
// .:B56C 85 53    STA $53         save step size
// .:B56E A5 58    LDA $58         get pointer low byte
// .:B570 A6 59    LDX $59         get pointer high byte
// .:B572 E4 32    CPX $32         compare with end of arrays high byte
// .:B574 D0 07    BNE $B57D       branch if not at end
// .:B576 C5 31    CMP $31         else compare with end of arrays low byte
// .:B578 D0 03    BNE $B57D       branch if not at end
// .:B57A 4C 06 B6 JMP $B606       collect string, tidy up and exit if at end ??
// .:B57D 85 22    STA $22         save pointer low byte
// .:B57F 86 23    STX $23         save pointer high byte
// .:B581 A0 00    LDY #$00        set index
// .:B583 B1 22    LDA ($22),Y     get array name first byte
// .:B585 AA       TAX             copy it
// .:B586 C8       INY             increment index
// .:B587 B1 22    LDA ($22),Y     get array name second byte
// .:B589 08       PHP             push the flags
// .:B58A C8       INY             increment index
// .:B58B B1 22    LDA ($22),Y     get array size low byte
// .:B58D 65 58    ADC $58         add start of this array low byte
// .:B58F 85 58    STA $58         save start of next array low byte
// .:B591 C8       INY             increment index
// .:B592 B1 22    LDA ($22),Y     get array size high byte
// .:B594 65 59    ADC $59         add start of this array high byte
// .:B596 85 59    STA $59         save start of next array high byte
// .:B598 28       PLP             restore the flags
// .:B599 10 D3    BPL $B56E       skip if not string array
//                                 was possibly string array so ...
// .:B59B 8A       TXA             get name first byte back
// .:B59C 30 D0    BMI $B56E       skip if not string array
// .:B59E C8       INY             increment index
// .:B59F B1 22    LDA ($22),Y     get # of dimensions
// .:B5A1 A0 00    LDY #$00        clear index
// .:B5A3 0A       ASL             *2
// .:B5A4 69 05    ADC #$05        +5 (array header size)
// .:B5A6 65 22    ADC $22         add pointer low byte
// .:B5A8 85 22    STA $22         save pointer low byte
// .:B5AA 90 02    BCC $B5AE       branch if no rollover
// .:B5AC E6 23    INC $23         else increment pointer hgih byte
// .:B5AE A6 23    LDX $23         get pointer high byte
// .:B5B0 E4 59    CPX $59         compare pointer high byte with end of this array high byte
// .:B5B2 D0 04    BNE $B5B8       branch if not there yet
// .:B5B4 C5 58    CMP $58         compare pointer low byte with end of this array low byte
// .:B5B6 F0 BA    BEQ $B572       if at end of this array go check next array
// .:B5B8 20 C7 B5 JSR $B5C7       check string salvageability
// .:B5BB F0 F3    BEQ $B5B0       loop
//                                 check variable salvageability

.label /* $B5BD - 46525 */ BASIC_B5BD_search_for_next_string = $B5BD
// .:B5BD B1 22    LDA ($22),Y     get variable name first byte
// .:B5BF 30 35    BMI $B5F6       add step and exit if not string
// .:B5C1 C8       INY             increment index
// .:B5C2 B1 22    LDA ($22),Y     get variable name second byte
// .:B5C4 10 30    BPL $B5F6       add step and exit if not string
// .:B5C6 C8       INY             increment index
//                                 check string salvageability
// .:B5C7 B1 22    LDA ($22),Y     get string length
// .:B5C9 F0 2B    BEQ $B5F6       add step and exit if null string
// .:B5CB C8       INY             increment index
// .:B5CC B1 22    LDA ($22),Y     get string pointer low byte
// .:B5CE AA       TAX             copy to X
// .:B5CF C8       INY             increment index
// .:B5D0 B1 22    LDA ($22),Y     get string pointer high byte
// .:B5D2 C5 34    CMP $34         compare string pointer high byte with bottom of string
//                                 space high byte
// .:B5D4 90 06    BCC $B5DC       if bottom of string space greater go test against highest
//                                 uncollected string
// .:B5D6 D0 1E    BNE $B5F6       if bottom of string space less string has been collected
//                                 so go update pointers, step to next and return
//                                 high bytes were equal so test low bytes
// .:B5D8 E4 33    CPX $33         compare string pointer low byte with bottom of string
//                                 space low byte
// .:B5DA B0 1A    BCS $B5F6       if bottom of string space less string has been collected
//                                 so go update pointers, step to next and return
//                                 else test string against highest uncollected string so far
// .:B5DC C5 60    CMP $60         compare string pointer high byte with highest uncollected
//                                  string high byte
// .:B5DE 90 16    BCC $B5F6       if highest uncollected string is greater then go update
//                                 pointers, step to next and return
// .:B5E0 D0 04    BNE $B5E6       if highest uncollected string is less then go set this
//                                 string as highest uncollected so far
//                                 high bytes were equal so test low bytes
// .:B5E2 E4 5F    CPX $5F         compare string pointer low byte with highest uncollected
//                                 string low byte
// .:B5E4 90 10    BCC $B5F6       if highest uncollected string is greater then go update
//                                 pointers, step to next and return
//                                 else set current string as highest uncollected string
// .:B5E6 86 5F    STX $5F         save string pointer low byte as highest uncollected string
//                                 low byte
// .:B5E8 85 60    STA $60         save string pointer high byte as highest uncollected
//                                 string high byte
// .:B5EA A5 22    LDA $22         get descriptor pointer low byte
// .:B5EC A6 23    LDX $23         get descriptor pointer high byte
// .:B5EE 85 4E    STA $4E         save working pointer high byte
// .:B5F0 86 4F    STX $4F         save working pointer low byte
// .:B5F2 A5 53    LDA $53         get step size
// .:B5F4 85 55    STA $55         copy step size
// .:B5F6 A5 53    LDA $53         get step size
// .:B5F8 18       CLC             clear carry for add
// .:B5F9 65 22    ADC $22         add pointer low byte
// .:B5FB 85 22    STA $22         save pointer low byte
// .:B5FD 90 02    BCC $B601       branch if no rollover
// .:B5FF E6 23    INC $23         else increment pointer high byte
// .:B601 A6 23    LDX $23         get pointer high byte
// .:B603 A0 00    LDY #$00        flag not moved
// .:B605 60       RTS

.label /* $B606 - 46598 */ BASIC_B606_collect_a_string = $B606
//                                 collect string
// .:B606 A5 4F    LDA $4F         get working pointer low byte
// .:B608 05 4E    ORA $4E         OR working pointer high byte
// .:B60A F0 F5    BEQ $B601       exit if nothing to collect
// .:B60C A5 55    LDA $55         get copied step size
// .:B60E 29 04    AND #$04        mask step size, $04 for variables, $00 for array or stack
// .:B610 4A       LSR             >> 1
// .:B611 A8       TAY             copy to index
// .:B612 85 55    STA $55         save offset to descriptor start
// .:B614 B1 4E    LDA ($4E),Y     get string length low byte
// .:B616 65 5F    ADC $5F         add string start low byte
// .:B618 85 5A    STA $5A         set block end low byte
// .:B61A A5 60    LDA $60         get string start high byte
// .:B61C 69 00    ADC #$00        add carry
// .:B61E 85 5B    STA $5B         set block end high byte
// .:B620 A5 33    LDA $33         get bottom of string space low byte
// .:B622 A6 34    LDX $34         get bottom of string space high byte
// .:B624 85 58    STA $58         save destination end low byte
// .:B626 86 59    STX $59         save destination end high byte
// .:B628 20 BF A3 JSR $A3BF       open up space in memory, don't set array end. this
//                                 copies the string from where it is to the end of the
//                                 uncollected string memory
// .:B62B A4 55    LDY $55         restore offset to descriptor start
// .:B62D C8       INY             increment index to string pointer low byte
// .:B62E A5 58    LDA $58         get new string pointer low byte
// .:B630 91 4E    STA ($4E),Y     save new string pointer low byte
// .:B632 AA       TAX             copy string pointer low byte
// .:B633 E6 59    INC $59         increment new string pointer high byte
// .:B635 A5 59    LDA $59         get new string pointer high byte
// .:B637 C8       INY             increment index to string pointer high byte
// .:B638 91 4E    STA ($4E),Y     save new string pointer high byte
// .:B63A 4C 2A B5 JMP $B52A       re-run routine from last ending, XA holds new bottom
//                                 of string memory pointer

.label /* $B63D - 46653 */ BASIC_B63D_concatenate_two_strings = $B63D
// concatenate
//
//                                add strings, the first string is in the descriptor, the second string is in line
// .:B63D A5 65    LDA $65         get descriptor pointer high byte
// .:B63F 48       PHA             put on stack
// .:B640 A5 64    LDA $64         get descriptor pointer low byte
// .:B642 48       PHA             put on stack
// .:B643 20 83 AE JSR $AE83       get value from line
// .:B646 20 8F AD JSR $AD8F       check if source is string, else do type mismatch
// .:B649 68       PLA             get descriptor pointer low byte back
// .:B64A 85 6F    STA $6F         set pointer low byte
// .:B64C 68       PLA             get descriptor pointer high byte back
// .:B64D 85 70    STA $70         set pointer high byte
// .:B64F A0 00    LDY #$00        clear index
// .:B651 B1 6F    LDA ($6F),Y     get length of first string from descriptor
// .:B653 18       CLC             clear carry for add
// .:B654 71 64    ADC ($64),Y     add length of second string
// .:B656 90 05    BCC $B65D       branch if no overflow
// .:B658 A2 17    LDX #$17        else error $17, string too long error
// .:B65A 4C 37 A4 JMP $A437       do error #X then warm start
// .:B65D 20 75 B4 JSR $B475       copy descriptor pointer and make string space A bytes long
// .:B660 20 7A B6 JSR $B67A       copy string from descriptor to utility pointer
// .:B663 A5 50    LDA $50         get descriptor pointer low byte
// .:B665 A4 51    LDY $51         get descriptor pointer high byte
// .:B667 20 AA B6 JSR $B6AA       pop (YA) descriptor off stack or from top of string space
//                                 returns with A = length, X = pointer low byte,
//                                 Y = pointer high byte
// .:B66A 20 8C B6 JSR $B68C       store string from pointer to utility pointer
// .:B66D A5 6F    LDA $6F         get descriptor pointer low byte
// .:B66F A4 70    LDY $70         get descriptor pointer high byte
// .:B671 20 AA B6 JSR $B6AA       pop (YA) descriptor off stack or from top of string space
//                                 returns with A = length, X = pointer low byte,
//                                 Y = pointer high byte
// .:B674 20 CA B4 JSR $B4CA       check space on descriptor stack then put string address
//                                 and length on descriptor stack and update stack pointers
// .:B677 4C B8 AD JMP $ADB8       continue evaluation

.label /* $B67A - 46714 */ BASIC_B67A_store_string_in_high_ram = $B67A
// copy string from descriptor to utility pointer
//
// .:B67A A0 00    LDY #$00        clear index
// .:B67C B1 6F    LDA ($6F),Y     get string length
// .:B67E 48       PHA             save it
// .:B67F C8       INY             increment index
// .:B680 B1 6F    LDA ($6F),Y     get string pointer low byte
// .:B682 AA       TAX             copy to X
// .:B683 C8       INY             increment index
// .:B684 B1 6F    LDA ($6F),Y     get string pointer high byte
// .:B686 A8       TAY             copy to Y
// .:B687 68       PLA             get length back
// .:B688 86 22    STX $22         save string pointer low byte
// .:B68A 84 23    STY $23         save string pointer high byte
//                                 store string from pointer to utility pointer
// .:B68C A8       TAY             copy length as index
// .:B68D F0 0A    BEQ $B699       branch if null string
// .:B68F 48       PHA             save length
// .:B690 88       DEY             decrement length/index
// .:B691 B1 22    LDA ($22),Y     get byte from string
// .:B693 91 35    STA ($35),Y     save byte to destination
// .:B695 98       TYA             copy length/index
// .:B696 D0 F8    BNE $B690       loop if not all done yet
// .:B698 68       PLA             restore length
// .:B699 18       CLC             clear carry for add
// .:B69A 65 35    ADC $35         add string utility ptr low byte
// .:B69C 85 35    STA $35         save string utility ptr low byte
// .:B69E 90 02    BCC $B6A2       branch if no rollover
// .:B6A0 E6 36    INC $36         increment string utility ptr high byte
// .:B6A2 60       RTS

.label /* $B6A3 - 46755 */ BASIC_B6A3_perform_string_housekeeping = $B6A3
// evaluate string
//
// .:B6A3 20 8F AD JSR $AD8F       check if source is string, else do type mismatch
//                                 pop string off descriptor stack, or from top of string space
//                                 returns with A = length, X = pointer low byte, Y = pointer high byte
// .:B6A6 A5 64    LDA $64         get descriptor pointer low byte
// .:B6A8 A4 65    LDY $65         get descriptor pointer high byte
//                                 pop (YA) descriptor off stack or from top of string space
//                                 returns with A = length, X = pointer low byte, Y = pointer high byte
// .:B6AA 85 22    STA $22         save string pointer low byte
// .:B6AC 84 23    STY $23         save string pointer high byte
// .:B6AE 20 DB B6 JSR $B6DB       clean descriptor stack, YA = pointer
// .:B6B1 08       PHP             save status flags
// .:B6B2 A0 00    LDY #$00        clear index
// .:B6B4 B1 22    LDA ($22),Y     get length from string descriptor
// .:B6B6 48       PHA             put on stack
// .:B6B7 C8       INY             increment index
// .:B6B8 B1 22    LDA ($22),Y     get string pointer low byte from descriptor
// .:B6BA AA       TAX             copy to X
// .:B6BB C8       INY             increment index
// .:B6BC B1 22    LDA ($22),Y     get string pointer high byte from descriptor
// .:B6BE A8       TAY             copy to Y
// .:B6BF 68       PLA             get string length back
// .:B6C0 28       PLP             restore status
// .:B6C1 D0 13    BNE $B6D6       branch if pointer <> last_sl,last_sh
// .:B6C3 C4 34    CPY $34         compare with bottom of string space high byte
// .:B6C5 D0 0F    BNE $B6D6       branch if <>
// .:B6C7 E4 33    CPX $33         else compare with bottom of string space low byte
// .:B6C9 D0 0B    BNE $B6D6       branch if <>
// .:B6CB 48       PHA             save string length
// .:B6CC 18       CLC             clear carry for add
// .:B6CD 65 33    ADC $33         add bottom of string space low byte
// .:B6CF 85 33    STA $33         set bottom of string space low byte
// .:B6D1 90 02    BCC $B6D5       skip increment if no overflow
// .:B6D3 E6 34    INC $34         increment bottom of string space high byte
// .:B6D5 68       PLA             restore string length
// .:B6D6 86 22    STX $22         save string pointer low byte
// .:B6D8 84 23    STY $23         save string pointer high byte
// .:B6DA 60       RTS

.label /* $B6DB - 46811 */ BASIC_B6DB_clean_descriptor_stack = $B6DB
//                                 clean descriptor stack, YA = pointer
//                                 checks if AY is on the descriptor stack, if so does a stack discard
// .:B6DB C4 18    CPY $18         compare high byte with current descriptor stack item
//                                 pointer high byte
// .:B6DD D0 0C    BNE $B6EB       exit if <>
// .:B6DF C5 17    CMP $17         compare low byte with current descriptor stack item
//                                 pointer low byte
// .:B6E1 D0 08    BNE $B6EB       exit if <>
// .:B6E3 85 16    STA $16         set descriptor stack pointer
// .:B6E5 E9 03    SBC #$03        update last string pointer low byte
// .:B6E7 85 17    STA $17         save current descriptor stack item pointer low byte
// .:B6E9 A0 00    LDY #$00        clear high byte
// .:B6EB 60       RTS

.label /* $B6EC - 46828 */ BASIC_B6EC_evaluate_chr = $B6EC
// perform CHR$()
//
// .:B6EC 20 A1 B7 JSR $B7A1       evaluate byte expression, result in X
// .:B6EF 8A       TXA             copy to A
// .:B6F0 48       PHA             save character
// .:B6F1 A9 01    LDA #$01        string is single byte
// .:B6F3 20 7D B4 JSR $B47D       make string space A bytes long
// .:B6F6 68       PLA             get character back
// .:B6F7 A0 00    LDY #$00        clear index
// .:B6F9 91 62    STA ($62),Y     save byte in string - byte IS string!
// .:B6FB 68       PLA             dump return address (skip type check)
// .:B6FC 68       PLA             dump return address (skip type check)
// .:B6FD 4C CA B4 JMP $B4CA       check space on descriptor stack then put string address
//                                 and length on descriptor stack and update stack pointers

.label /* $B700 - 46848 */ BASIC_B700_evaluate_left = $B700
// perform LEFT$()

// .:B700 20 61 B7 JSR $B761       pull string data and byte parameter from stack
//                                 return pointer in descriptor, byte in A (and X), Y=0
// .:B703 D1 50    CMP ($50),Y     compare byte parameter with string length
// .:B705 98       TYA             clear A
// .:B706 90 04    BCC $B70C       branch if string length > byte parameter
// .:B708 B1 50    LDA ($50),Y     else make parameter = length
// .:B70A AA       TAX             copy to byte parameter copy
// .:B70B 98       TYA             clear string start offset
// .:B70C 48       PHA             save string start offset
// .:B70D 8A       TXA             copy byte parameter (or string length if <)
// .:B70E 48       PHA             save string length
// .:B70F 20 7D B4 JSR $B47D       make string space A bytes long
// .:B712 A5 50    LDA $50         get descriptor pointer low byte
// .:B714 A4 51    LDY $51         get descriptor pointer high byte
// .:B716 20 AA B6 JSR $B6AA       pop (YA) descriptor off stack or from top of string space
//                                 returns with A = length, X = pointer low byte,
//                                 Y = pointer high byte
// .:B719 68       PLA             get string length back
// .:B71A A8       TAY             copy length to Y
// .:B71B 68       PLA             get string start offset back
// .:B71C 18       CLC             clear carry for add
// .:B71D 65 22    ADC $22         add start offset to string start pointer low byte
// .:B71F 85 22    STA $22         save string start pointer low byte
// .:B721 90 02    BCC $B725       branch if no overflow
// .:B723 E6 23    INC $23         else increment string start pointer high byte
// .:B725 98       TYA             copy length to A
// .:B726 20 8C B6 JSR $B68C       store string from pointer to utility pointer
// .:B729 4C CA B4 JMP $B4CA       check space on descriptor stack then put string address
//                                 and length on descriptor stack and update stack pointers

.label /* $B72C - 46892 */ BASIC_B72C_evaluate_right = $B72C
// perform RIGHT$()
//
// .:B72C 20 61 B7 JSR $B761       pull string data and byte parameter from stack
//	                               return pointer in descriptor, byte in A (and X), Y=0
// .:B72F 18       CLC             clear carry for add-1
// .:B730 F1 50    SBC ($50),Y     subtract string length
// .:B732 49 FF    EOR #$FF        invert it (A=LEN(expression$)-l)
// .:B734 4C 06 B7 JMP $B706       go do rest of LEFT$()

.label /* $B737 - 46903 */ BASIC_B737_evaluate_mid = $B737
// Perform MID$()
//
// .:B737 A9 FF    LDA #$FF        set default length = 255
// .:B739 85 65    STA $65         save default length
// .:B73B 20 79 00 JSR $0079       scan memory
// .:B73E C9 29    CMP #$29        compare with ")"
// .:B740 F0 06    BEQ $B748       branch if = ")" (skip second byte get)
// .:B742 20 FD AE JSR $AEFD       scan for ",", else do syntax error then warm start
// .:B745 20 9E B7 JSR $B79E       get byte parameter
// .:B748 20 61 B7 JSR $B761       pull string data and byte parameter from stack
//                                 return pointer in descriptor, byte in A (and X), Y=0
// .:B74B F0 4B    BEQ $B798       if null do illegal quantity error then warm start
// .:B74D CA       DEX             decrement start index
// .:B74E 8A       TXA             copy to A
// .:B74F 48       PHA             save string start offset
// .:B750 18       CLC             clear carry for sub-1
// .:B751 A2 00    LDX #$00        clear output string length
// .:B753 F1 50    SBC ($50),Y     subtract string length
// .:B755 B0 B6    BCS $B70D       if start>string length go do null string
// .:B757 49 FF    EOR #$FF        complement -length
// .:B759 C5 65    CMP $65         compare byte parameter
// .:B75B 90 B1    BCC $B70E       if length>remaining string go do RIGHT$
// .:B75D A5 65    LDA $65         get length byte
// .:B75F B0 AD    BCS $B70E       go do string copy, branch always

.label /* $B761 - 46945 */ BASIC_B761_pull_string_parameters = $B761
// pull string data and byte parameter from stack
//
//                                return pointer in descriptor, byte in A (and X), Y=0
// .:B761 20 F7 AE JSR $AEF7       scan for ")", else do syntax error then warm start
// .:B764 68       PLA             pull return address low byte
// .:B765 A8       TAY             save return address low byte
// .:B766 68       PLA             pull return address high byte
// .:B767 85 55    STA $55         save return address high byte
// .:B769 68       PLA             dump call to function vector low byte
// .:B76A 68       PLA             dump call to function vector high byte
// .:B76B 68       PLA             pull byte parameter
// .:B76C AA       TAX             copy byte parameter to X
// .:B76D 68       PLA             pull string pointer low byte
// .:B76E 85 50    STA $50         save it
// .:B770 68       PLA             pull string pointer high byte
// .:B771 85 51    STA $51         save it
// .:B773 A5 55    LDA $55         get return address high byte
// .:B775 48       PHA             back on stack
// .:B776 98       TYA             get return address low byte
// .:B777 48       PHA             back on stack
// .:B778 A0 00    LDY #$00        clear index
// .:B77A 8A       TXA             copy byte parameter
// .:B77B 60       RTS

.label /* $B77C - 46972 */ BASIC_B77C_evaluate_len = $B77C
// perform LEN()
//
// .:B77C 20 82 B7 JSR $B782       evaluate string, get length in A (and Y)
// .:B77F 4C A2 B3 JMP $B3A2       convert Y to byte in FAC1 and return

.label /* $B782 - 46978 */ BASIC_B782_exit_string_mode = $B782
// evaluate string, get length in Y
//
// .:B782 20 A3 B6 JSR $B6A3       evaluate string
// .:B785 A2 00    LDX #$00        set data type = numeric
// .:B787 86 0D    STX $0D         clear data type flag, $FF = string, $00 = numeric
// .:B789 A8       TAY             copy length to Y
// .:B78A 60       RTS

.label /* $B78B - 46987 */ BASIC_B78B_evaluate_asc = $B78B
// perform ASC()
//
// .:B78B 20 82 B7 JSR $B782       evaluate string, get length in A (and Y)
// .:B78E F0 08    BEQ $B798       if null do illegal quantity error then warm start
// .:B790 A0 00    LDY #$00        set index to first character
// .:B792 B1 22    LDA ($22),Y     get byte
// .:B794 A8       TAY             copy to Y
// .:B795 4C A2 B3 JMP $B3A2       convert Y to byte in FAC1 and return
//
// do illegal quantity error then warm start
//
// .:B798 4C 48 B2 JMP $B248       do illegal quantity error then warm start

.label /* $B79B - 47003 */ BASIC_B79B_evaluate_text_to_1_byte_in_xr = $B79B
// scan and get byte parameter
//
// .:B79B 20 73 00 JSR $0073       increment and scan memory

.label /* $B7AD - 47021 */ BASIC_B7AD_evaluate_val = $B7AD
// get byte parameter
//
// .:B79E 20 8A AD JSR $AD8A       evaluate expression and check is numeric, else do
//                                 type mismatch
//
// evaluate byte expression, result in X
//
// .:B7A1 20 B8 B1 JSR $B1B8       evaluate integer expression, sign check
// .:B7A4 A6 64    LDX $64         get FAC1 mantissa 3
// .:B7A6 D0 F0    BNE $B798       if not null do illegal quantity error then warm start
// .:B7A8 A6 65    LDX $65         get FAC1 mantissa 4
// .:B7AA 4C 79 00 JMP $0079       scan memory and return
//
// perform VAL()
//
// .:B7AD 20 82 B7 JSR $B782       evaluate string, get length in A (and Y)
// .:B7B0 D0 03    BNE $B7B5       branch if not null string
//	                               string was null so set result = $00
// .:B7B2 4C F7 B8 JMP $B8F7       clear FAC1 exponent and sign and return
//

.label /* $B7B5 - 47029 */ BASIC_B7B5_convert_ascii_string_to_flpt = $B7B5
// .:B7B5 A6 7A    LDX $7A         get BASIC execute pointer low byte
// .:B7B7 A4 7B    LDY $7B         get BASIC execute pointer high byte
// .:B7B9 86 71    STX $71         save BASIC execute pointer low byte
// .:B7BB 84 72    STY $72         save BASIC execute pointer high byte
// .:B7BD A6 22    LDX $22         get string pointer low byte
// .:B7BF 86 7A    STX $7A         save BASIC execute pointer low byte
// .:B7C1 18       CLC             clear carry for add
// .:B7C2 65 22    ADC $22         add string length
// .:B7C4 85 24    STA $24         save string end low byte
// .:B7C6 A6 23    LDX $23         get string pointer high byte
// .:B7C8 86 7B    STX $7B         save BASIC execute pointer high byte
// .:B7CA 90 01    BCC $B7CD       branch if no high byte increment
// .:B7CC E8       INX             increment string end high byte
// .:B7CD 86 25    STX $25         save string end high byte
// .:B7CF A0 00    LDY #$00        set index to $00
// .:B7D1 B1 24    LDA ($24),Y     get string end byte
// .:B7D3 48       PHA             push it
// .:B7D4 98       TYA             clear A
// .:B7D5 91 24    STA ($24),Y     terminate string with $00
// .:B7D7 20 79 00 JSR $0079       scan memory
// .:B7DA 20 F3 BC JSR $BCF3       get FAC1 from string
// .:B7DD 68       PLA             restore string end byte
// .:B7DE A0 00    LDY #$00        clear index
// .:B7E0 91 24    STA ($24),Y     put string end byte back
//
// restore BASIC execute pointer from temp
//
// .:B7E2 A6 71    LDX $71         get BASIC execute pointer low byte back
// .:B7E4 A4 72    LDY $72         get BASIC execute pointer high byte back
// .:B7E6 86 7A    STX $7A         save BASIC execute pointer low byte
// .:B7E8 84 7B    STY $7B         save BASIC execute pointer high byte
// .:B7EA 60       RTS

.label /* $B7EB - 47083 */ BASIC_B7EB_get_parameters_for_poke_wait = $B7EB
// get parameters for POKE/WAIT
//
// .:B7EB 20 8A AD JSR $AD8A       evaluate expression and check is numeric, else do
//	                                type mismatch
// .:B7EE 20 F7 B7 JSR $B7F7       convert FAC_1 to integer in temporary integer
// .:B7F1 20 FD AE JSR $AEFD       scan for ",", else do syntax error then warm start
// .:B7F4 4C 9E B7 JMP $B79E       get byte parameter and return

.label /* $B7F7 - 47095 */ BASIC_B7F7_convert_fac_1_to_integer_in_linnum = $B7F7
// convert FAC_1 to integer in temporary integer
//
// .:B7F7 A5 66    LDA $66         get FAC1 sign
// .:B7F9 30 9D    BMI $B798       if -ve do illegal quantity error then warm start
// .:B7FB A5 61    LDA $61         get FAC1 exponent
// .:B7FD C9 91    CMP #$91        compare with exponent = 2^16
// .:B7FF B0 97    BCS $B798       if >= do illegal quantity error then warm start
// .:B801 20 9B BC JSR $BC9B       convert FAC1 floating to fixed
// .:B804 A5 64    LDA $64         get FAC1 mantissa 3
// .:B806 A4 65    LDY $65         get FAC1 mantissa 4
// .:B808 84 14    STY $14         save temporary integer low byte
// .:B80A 85 15    STA $15         save temporary integer high byte
// .:B80C 60       RTS

.label /* $B80D - 47117 */ BASIC_B80D_evaluate_peek = $B80D
// perform PEEK()
//
// .:B80D A5 15    LDA $15         get line number high byte
// .:B80F 48       PHA             save line number high byte
// .:B810 A5 14    LDA $14         get line number low byte
// .:B812 48       PHA             save line number low byte
// .:B813 20 F7 B7 JSR $B7F7       convert FAC_1 to integer in temporary integer
// .:B816 A0 00    LDY #$00        clear index
// .:B818 B1 14    LDA ($14),Y     read byte
// .:B81A A8       TAY             copy byte to A
// .:B81B 68       PLA             pull byte
// .:B81C 85 14    STA $14         restore line number low byte
// .:B81E 68       PLA             pull byte
// .:B81F 85 15    STA $15         restore line number high byte
// .:B821 4C A2 B3 JMP $B3A2       convert Y to byte in FAC_1 and return

.label /* $B824 - 47140 */ BASIC_B824_perform_poke = $B824
// perform POKE
//
// .:B824 20 EB B7 JSR $B7EB       get parameters for POKE/WAIT
// .:B827 8A       TXA             copy byte to A
// .:B828 A0 00    LDY #$00        clear index
// .:B82A 91 14    STA ($14),Y     write byte
// .:B82C 60       RTS

.label /* $B82D - 47149 */ BASIC_B82D_perform_wait = $B82D
// perform WAIT
//
// .:B82D 20 EB B7 JSR $B7EB       get parameters for POKE/WAIT
// .:B830 86 49    STX $49         save byte
// .:B832 A2 00    LDX #$00        clear mask
// .:B834 20 79 00 JSR $0079       scan memory
// .:B837 F0 03    BEQ $B83C       skip if no third argument
// .:B839 20 F1 B7 JSR $B7F1       scan for "," and get byte, else syntax error then
//                                 warm start
// .:B83C 86 4A    STX $4A         save EOR argument
// .:B83E A0 00    LDY #$00        clear index
// .:B840 B1 14    LDA ($14),Y     get byte via temporary integer (address)
// .:B842 45 4A    EOR $4A         EOR with second argument       (mask)
// .:B844 25 49    AND $49         AND with first argument        (byte)
// .:B846 F0 F8    BEQ $B840       loop if result is zero
// .:B848 60       RTS

.label /* $B849 - 47177 */ BASIC_B849_add_0_5_to_fac_1 = $B849
// add 0.5 to FAC1 (round FAC1)
//
// .:B849 A9 11    LDA #$11        set 0.5 pointer low byte
// .:B84B A0 BF    LDY #$BF        set 0.5 pointer high byte
// .:B84D 4C 67 B8 JMP $B867       add (AY) to FAC1

.label /* $B850 - 47184 */ BASIC_B850_perform_subtraction = $B850
// perform subtraction, FAC1 from (AY)
//
// .:B850 20 8C BA JSR $BA8C       unpack memory (AY) into FAC2
//
// perform subtraction, FAC1 from FAC2
//
// .:B853 A5 66    LDA $66         get FAC1 sign (b7)
// .:B855 49 FF    EOR #$FF        complement it
// .:B857 85 66    STA $66         save FAC1 sign (b7)
// .:B859 45 6E    EOR $6E         EOR with FAC2 sign (b7)
// .:B85B 85 6F    STA $6F         save sign compare (FAC1 EOR FAC2)
// .:B85D A5 61    LDA $61         get FAC1 exponent
// .:B85F 4C 6A B8 JMP $B86A       add FAC2 to FAC1 and return

.label /* $B862 - 47202 */ BASIC_B862_normalise_addition = $B862
// .:B862 20 99 B9 JSR $B999       shift FACX A times right (>8 shifts)
// .:B865 90 3C    BCC $B8A3       go subtract mantissas

.label /* $B867 - 47207 */ BASIC_B867_perform_addition = $B867
// add (AY) to FAC1
//
// .:B867 20 8C BA JSR $BA8C       unpack memory (AY) into FAC2
//
// add FAC2 to FAC1
//
// .:B86A D0 03    BNE $B86F       branch if FAC1 is not zero
// .:B86C 4C FC BB JMP $BBFC       FAC1 was zero so copy FAC2 to FAC1 and return
//                                 FAC1 is non zero
// .:B86F A6 70    LDX $70         get FAC1 rounding byte
// .:B871 86 56    STX $56         save as FAC2 rounding byte
// .:B873 A2 69    LDX #$69        set index to FAC2 exponent address
// .:B875 A5 69    LDA $69         get FAC2 exponent
// .:B877 A8       TAY             copy exponent
// .:B878 F0 CE    BEQ $B848       exit if zero
// .:B87A 38       SEC             set carry for subtract
// .:B87B E5 61    SBC $61         subtract FAC1 exponent
// .:B87D F0 24    BEQ $B8A3       if equal go add mantissas
// .:B87F 90 12    BCC $B893       if FAC2 < FAC1 then go shift FAC2 right
//                                 else FAC2 > FAC1
// .:B881 84 61    STY $61         save FAC1 exponent
// .:B883 A4 6E    LDY $6E         get FAC2 sign (b7)
// .:B885 84 66    STY $66         save FAC1 sign (b7)
// .:B887 49 FF    EOR #$FF        complement A
// .:B889 69 00    ADC #$00        +1, twos complement, carry is set
// .:B88B A0 00    LDY #$00        clear Y
// .:B88D 84 56    STY $56         clear FAC2 rounding byte
// .:B88F A2 61    LDX #$61        set index to FAC1 exponent address
// .:B891 D0 04    BNE $B897       branch always
//                                 FAC2 < FAC1
// .:B893 A0 00    LDY #$00        clear Y
// .:B895 84 70    STY $70         clear FAC1 rounding byte
// .:B897 C9 F9    CMP #$F9        compare exponent diff with $F9
// .:B899 30 C7    BMI $B862       branch if range $79-$F8
// .:B89B A8       TAY             copy exponent difference to Y
// .:B89C A5 70    LDA $70         get FAC1 rounding byte
// .:B89E 56 01    LSR $01,X       shift FAC? mantissa 1
// .:B8A0 20 B0 B9 JSR $B9B0       shift FACX Y times right
//                                 exponents are equal now do mantissa subtract
// .:B8A3 24 6F    BIT $6F         test sign compare (FAC1 EOR FAC2)
// .:B8A5 10 57    BPL $B8FE       if = add FAC2 mantissa to FAC1 mantissa and return
// .:B8A7 A0 61    LDY #$61        set the Y index to FAC1 exponent address
// .:B8A9 E0 69    CPX #$69        compare X to FAC2 exponent address
// .:B8AB F0 02    BEQ $B8AF       if = continue, Y = FAC1, X = FAC2
// .:B8AD A0 69    LDY #$69        else set the Y index to FAC2 exponent address
//                                 subtract the smaller from the bigger (take the sign of
//                                 the bigger)
// .:B8AF 38       SEC             set carry for subtract
// .:B8B0 49 FF    EOR #$FF        ones complement A
// .:B8B2 65 56    ADC $56         add FAC2 rounding byte
// .:B8B4 85 70    STA $70         save FAC1 rounding byte
// .:B8B6 B9 04 00 LDA $0004,Y     get FACY mantissa 4
// .:B8B9 F5 04    SBC $04,X       subtract FACX mantissa 4
// .:B8BB 85 65    STA $65         save FAC1 mantissa 4
// .:B8BD B9 03 00 LDA $0003,Y     get FACY mantissa 3
// .:B8C0 F5 03    SBC $03,X       subtract FACX mantissa 3
// .:B8C2 85 64    STA $64         save FAC1 mantissa 3
// .:B8C4 B9 02 00 LDA $0002,Y     get FACY mantissa 2
// .:B8C7 F5 02    SBC $02,X       subtract FACX mantissa 2
// .:B8C9 85 63    STA $63         save FAC1 mantissa 2
// .:B8CB B9 01 00 LDA $0001,Y     get FACY mantissa 1
// .:B8CE F5 01    SBC $01,X       subtract FACX mantissa 1
// .:B8D0 85 62    STA $62         save FAC1 mantissa 1
//
// do ABS and normalise FAC1
//
// .:B8D2 B0 03    BCS $B8D7       branch if number is +ve
// .:B8D4 20 47 B9 JSR $B947       negate FAC1
//
// normalise FAC1
//
// .:B8D7 A0 00    LDY #$00        clear Y
// .:B8D9 98       TYA             clear A
// .:B8DA 18       CLC             clear carry for add
// .:B8DB A6 62    LDX $62         get FAC1 mantissa 1
// .:B8DD D0 4A    BNE $B929       if not zero normalise FAC1
// .:B8DF A6 63    LDX $63         get FAC1 mantissa 2
// .:B8E1 86 62    STX $62         save FAC1 mantissa 1
// .:B8E3 A6 64    LDX $64         get FAC1 mantissa 3
// .:B8E5 86 63    STX $63         save FAC1 mantissa 2
// .:B8E7 A6 65    LDX $65         get FAC1 mantissa 4
// .:B8E9 86 64    STX $64         save FAC1 mantissa 3
// .:B8EB A6 70    LDX $70         get FAC1 rounding byte
// .:B8ED 86 65    STX $65         save FAC1 mantissa 4
// .:B8EF 84 70    STY $70         clear FAC1 rounding byte
// .:B8F1 69 08    ADC #$08        add x to exponent offset
// .:B8F3 C9 20    CMP #$20        compare with $20, max offset, all bits would be = 0
// .:B8F5 D0 E4    BNE $B8DB       loop if not max
//
// clear FAC1 exponent and sign
//
// .:B8F7 A9 00    LDA #$00        clear A
// .:B8F9 85 61    STA $61         set FAC1 exponent
//
// save FAC1 sign
//
// .:B8FB 85 66    STA $66         save FAC1 sign (b7)
// .:B8FD 60       RTS
//
// add FAC2 mantissa to FAC1 mantissa
//
// .:B8FE 65 56    ADC $56         add FAC2 rounding byte
// .:B900 85 70    STA $70         save FAC1 rounding byte
// .:B902 A5 65    LDA $65         get FAC1 mantissa 4
// .:B904 65 6D    ADC $6D         add FAC2 mantissa 4
// .:B906 85 65    STA $65         save FAC1 mantissa 4
// .:B908 A5 64    LDA $64         get FAC1 mantissa 3
// .:B90A 65 6C    ADC $6C         add FAC2 mantissa 3
// .:B90C 85 64    STA $64         save FAC1 mantissa 3
// .:B90E A5 63    LDA $63         get FAC1 mantissa 2
// .:B910 65 6B    ADC $6B         add FAC2 mantissa 2
// .:B912 85 63    STA $63         save FAC1 mantissa 2
// .:B914 A5 62    LDA $62         get FAC1 mantissa 1
// .:B916 65 6A    ADC $6A         add FAC2 mantissa 1
// .:B918 85 62    STA $62         save FAC1 mantissa 1
// .:B91A 4C 36 B9 JMP $B936       test and normalise FAC1 for C=0/1
// .:B91D 69 01    ADC #$01        add 1 to exponent offset
// .:B91F 06 70    ASL $70         shift FAC1 rounding byte
// .:B921 26 65    ROL $65         shift FAC1 mantissa 4
// .:B923 26 64    ROL $64         shift FAC1 mantissa 3
// .:B925 26 63    ROL $63         shift FAC1 mantissa 2
// .:B927 26 62    ROL $62         shift FAC1 mantissa 1
//                                 normalise FAC1
// .:B929 10 F2    BPL $B91D       loop if not normalised
// .:B92B 38       SEC             set carry for subtract
// .:B92C E5 61    SBC $61         subtract FAC1 exponent
// .:B92E B0 C7    BCS $B8F7       branch if underflow (set result = $0)
// .:B930 49 FF    EOR #$FF        complement exponent
// .:B932 69 01    ADC #$01        +1 (twos complement)
// .:B934 85 61    STA $61         save FAC1 exponent
//                                 test and normalise FAC1 for C=0/1
// .:B936 90 0E    BCC $B946       exit if no overflow
//                                 normalise FAC1 for C=1
// .:B938 E6 61    INC $61         increment FAC1 exponent
// .:B93A F0 42    BEQ $B97E       if zero do overflow error then warm start
// .:B93C 66 62    ROR $62         shift FAC1 mantissa 1
// .:B93E 66 63    ROR $63         shift FAC1 mantissa 2
// .:B940 66 64    ROR $64         shift FAC1 mantissa 3
// .:B942 66 65    ROR $65         shift FAC1 mantissa 4
// .:B944 66 70    ROR $70         shift FAC1 rounding byte
// .:B946 60       RTS

.label /* $B947 - 47431 */ BASIC_B947_2_s_complement_fac_1 = $B947
// negate FAC1
//
// .:B947 A5 66    LDA $66         get FAC1 sign (b7)
// .:B949 49 FF    EOR #$FF        complement it
// .:B94B 85 66    STA $66         save FAC1 sign (b7)
//                                 twos complement FAC1 mantissa
// .:B94D A5 62    LDA $62         get FAC1 mantissa 1
// .:B94F 49 FF    EOR #$FF        complement it
// .:B951 85 62    STA $62         save FAC1 mantissa 1
// .:B953 A5 63    LDA $63         get FAC1 mantissa 2
// .:B955 49 FF    EOR #$FF        complement it
// .:B957 85 63    STA $63         save FAC1 mantissa 2
// .:B959 A5 64    LDA $64         get FAC1 mantissa 3
// .:B95B 49 FF    EOR #$FF        complement it
// .:B95D 85 64    STA $64         save FAC1 mantissa 3
// .:B95F A5 65    LDA $65         get FAC1 mantissa 4
// .:B961 49 FF    EOR #$FF        complement it
// .:B963 85 65    STA $65         save FAC1 mantissa 4
// .:B965 A5 70    LDA $70         get FAC1 rounding byte
// .:B967 49 FF    EOR #$FF        complement it
// .:B969 85 70    STA $70         save FAC1 rounding byte
// .:B96B E6 70    INC $70         increment FAC1 rounding byte
// .:B96D D0 0E    BNE $B97D       exit if no overflow
//                                 increment FAC1 mantissa
// .:B96F E6 65    INC $65         increment FAC1 mantissa 4
// .:B971 D0 0A    BNE $B97D       finished if no rollover
// .:B973 E6 64    INC $64         increment FAC1 mantissa 3
// .:B975 D0 06    BNE $B97D       finished if no rollover
// .:B977 E6 63    INC $63         increment FAC1 mantissa 2
// .:B979 D0 02    BNE $B97D       finished if no rollover
// .:B97B E6 62    INC $62         increment FAC1 mantissa 1
// .:B97D 60       RTS

.label /* $B97E - 47486 */ BASIC_B97E_output_overflow_error = $B97E
// do overflow error then warm start
//
// .:B97E A2 0F    LDX #$0F        error $0F, overflow error
// .:B980 4C 37 A4 JMP $A437       do error #X then warm start

.label /* $B983 - 47491 */ BASIC_B983_multiply_by_zero_byte = $B983
// shift FCAtemp << A+8 times
//
// .:B983 A2 25    LDX #$25        set the offset to FACtemp
// .:B985 B4 04    LDY $04,X       get FACX mantissa 4
// .:B987 84 70    STY $70         save as FAC1 rounding byte
// .:B989 B4 03    LDY $03,X       get FACX mantissa 3
// .:B98B 94 04    STY $04,X       save FACX mantissa 4
// .:B98D B4 02    LDY $02,X       get FACX mantissa 2
// .:B98F 94 03    STY $03,X       save FACX mantissa 3
// .:B991 B4 01    LDY $01,X       get FACX mantissa 1
// .:B993 94 02    STY $02,X       save FACX mantissa 2
// .:B995 A4 68    LDY $68         get FAC1 overflow byte
// .:B997 94 01    STY $01,X       save FACX mantissa 1
//                                 shift FACX -A times right (> 8 shifts)
// .:B999 69 08    ADC #$08        add 8 to shift count
// .:B99B 30 E8    BMI $B985       go do 8 shift if still -ve
// .:B99D F0 E6    BEQ $B985       go do 8 shift if zero
// .:B99F E9 08    SBC #$08        else subtract 8 again
// .:B9A1 A8       TAY             save count to Y
// .:B9A2 A5 70    LDA $70         get FAC1 rounding byte
// .:B9A4 B0 14    BCS $B9BA
// .:B9A6 16 01    ASL $01,X       shift FACX mantissa 1
// .:B9A8 90 02    BCC $B9AC       branch if +ve
// .:B9AA F6 01    INC $01,X       this sets b7 eventually
// .:B9AC 76 01    ROR $01,X       shift FACX mantissa 1 (correct for ASL)
// .:B9AE 76 01    ROR $01,X       shift FACX mantissa 1 (put carry in b7)
//                                 shift FACX Y times right
// .:B9B0 76 02    ROR $02,X       shift FACX mantissa 2
// .:B9B2 76 03    ROR $03,X       shift FACX mantissa 3
// .:B9B4 76 04    ROR $04,X       shift FACX mantissa 4
// .:B9B6 6A       ROR             shift FACX rounding byte
// .:B9B7 C8       INY             increment exponent diff
// .:B9B8 D0 EC    BNE $B9A6       branch if range adjust not complete
// .:B9BA 18       CLC             just clear it
// .:B9BB 60       RTS

.label /* $B9BC - 47548 */ BASIC_B9BC_table_of_flpt_constants_1_00 = $B9BC
// constants and series for LOG(n)
//
// .:B9BC 81 00 00 00 00           1

.label /* $B9C1 - 47553 */ BASIC_B9C1_table_of_flpt_constants_03 = $B9C1
// .:B9C1 03                       series counter

.label /* $B9C2 - 47554 */ BASIC_B9C2_table_of_flpt_constants_0_434255942 = $B9C2
// .:B9C2 7F 5E 56 CB 79            .434255942

.label /* $B9C7 - 47559 */ BASIC_B9C7_table_of_flpt_constants_0_57658454 = $B9C7
// .:B9C7 80 13 9B 0B 64            .576584541

.label /* $B9CC - 47564 */ BASIC_B9CC_table_of_flpt_constants_0_961800759 = $B9CC
// .:B9CC 80 76 38 93 16            .961800759

.label /* $B9D1 - 47569 */ BASIC_B9D1_table_of_flpt_constants_2_885390073 = $B9D1
// .:B9D1 82 38 AA 3B 20           2.88539007

.label /* $B9D6 - 47574 */ BASIC_B9D6_table_of_flpt_constants_0_707106781 = $B9D6
// .:B9D5 80 35 04 F3 34            .707106781 = 1/SQR(2)

.label /* $B9DB - 47579 */ BASIC_B9DB_table_of_flpt_constants_1_41421356 = $B9DB
// .:B9DB 81 35 04 F3 34           1.41421356 = SQR(2)

.label /* $B9E0 - 47584 */ BASIC_B9E0_table_of_flpt_constants_minus_0_5 = $B9E0
// .:B9E0 80 80 00 00 00           -.5

.label /* $B9E5 - 47589 */ BASIC_B9E5_table_of_flpt_constants_0_693147181 = $B9E5
// .:B9E5 80 31 72 17 F8            .693147181  =  LOG(2)

.label /* $B9EA - 47594 */ BASIC_B9EA_evaluate_log = $B9EA
// perform LOG()
//
// .:B9EA 20 2B BC JSR $BC2B       test sign and zero
// .:B9ED F0 02    BEQ $B9F1       if zero do illegal quantity error then warm start
// .:B9EF 10 03    BPL $B9F4       skip error if +ve
// .:B9F1 4C 48 B2 JMP $B248       do illegal quantity error then warm start
// .:B9F4 A5 61    LDA $61         get FAC1 exponent
// .:B9F6 E9 7F    SBC #$7F        normalise it
// .:B9F8 48       PHA             save it
// .:B9F9 A9 80    LDA #$80        set exponent to zero
// .:B9FB 85 61    STA $61         save FAC1 exponent
// .:B9FD A9 D6    LDA #$D6        pointer to 1/root 2 low byte
// .:B9FF A0 B9    LDY #$B9        pointer to 1/root 2 high byte
// .:BA01 20 67 B8 JSR $B867       add (AY) to FAC1 (1/root2)
// .:BA04 A9 DB    LDA #$DB        pointer to root 2 low byte
// .:BA06 A0 B9    LDY #$B9        pointer to root 2 high byte
// .:BA08 20 0F BB JSR $BB0F       convert AY and do (AY)/FAC1 (root2/(x+(1/root2)))
// .:BA0B A9 BC    LDA #$BC        pointer to 1 low byte
// .:BA0D A0 B9    LDY #$B9        pointer to 1 high byte
// .:BA0F 20 50 B8 JSR $B850       subtract FAC1 ((root2/(x+(1/root2)))-1) from (AY)
// .:BA12 A9 C1    LDA #$C1        pointer to series for LOG(n) low byte
// .:BA14 A0 B9    LDY #$B9        pointer to series for LOG(n) high byte
// .:BA16 20 43 E0 JSR $E043       ^2 then series evaluation
// .:BA19 A9 E0    LDA #$E0        pointer to -0.5 low byte
// .:BA1B A0 B9    LDY #$B9        pointer to -0.5 high byte
// .:BA1D 20 67 B8 JSR $B867       add (AY) to FAC1
// .:BA20 68       PLA             restore FAC1 exponent
// .:BA21 20 7E BD JSR $BD7E       evaluate new ASCII digit
// .:BA24 A9 E5    LDA #$E5        pointer to LOG(2) low byte
// .:BA26 A0 B9    LDY #$B9        pointer to LOG(2) high byte

.label /* $BA28 - 47656 */ BASIC_BA28_perform_multiply = $BA28
// do convert AY, FCA1*(AY)
//
// .:BA28 20 8C BA JSR $BA8C       unpack memory (AY) into FAC2
// .:BA2B D0 03    BNE $BA30       multiply FAC1 by FAC2 ??
// .:BA2D 4C 8B BA JMP $BA8B       exit if zero
// .:BA30 20 B7 BA JSR $BAB7       test and adjust accumulators
// .:BA33 A9 00    LDA #$00        clear A
// .:BA35 85 26    STA $26         clear temp mantissa 1
// .:BA37 85 27    STA $27         clear temp mantissa 2
// .:BA39 85 28    STA $28         clear temp mantissa 3
// .:BA3B 85 29    STA $29         clear temp mantissa 4
// .:BA3D A5 70    LDA $70         get FAC1 rounding byte
// .:BA3F 20 59 BA JSR $BA59       go do shift/add FAC2
// .:BA42 A5 65    LDA $65         get FAC1 mantissa 4
// .:BA44 20 59 BA JSR $BA59       go do shift/add FAC2
// .:BA47 A5 64    LDA $64         get FAC1 mantissa 3
// .:BA49 20 59 BA JSR $BA59       go do shift/add FAC2
// .:BA4C A5 63    LDA $63         get FAC1 mantissa 2
// .:BA4E 20 59 BA JSR $BA59       go do shift/add FAC2
// .:BA51 A5 62    LDA $62         get FAC1 mantissa 1
// .:BA53 20 5E BA JSR $BA5E       go do shift/add FAC2
// .:BA56 4C 8F BB JMP $BB8F       copy temp to FAC1, normalise and return

.label /* $BA59 - 47705 */ BASIC_BA59_multiply_by_a_byte = $BA59
// .:BA59 D0 03    BNE $BA5E       branch if byte <> zero
// .:BA5B 4C 83 B9 JMP $B983       shift FCAtemp << A+8 times
//                                 else do shift and add
// .:BA5E 4A       LSR             shift byte
// .:BA5F 09 80    ORA #$80        set top bit (mark for 8 times)
// .:BA61 A8       TAY             copy result
// .:BA62 90 19    BCC $BA7D       skip next if bit was zero
// .:BA64 18       CLC             clear carry for add
// .:BA65 A5 29    LDA $29         get temp mantissa 4
// .:BA67 65 6D    ADC $6D         add FAC2 mantissa 4
// .:BA69 85 29    STA $29         save temp mantissa 4
// .:BA6B A5 28    LDA $28         get temp mantissa 3
// .:BA6D 65 6C    ADC $6C         add FAC2 mantissa 3
// .:BA6F 85 28    STA $28         save temp mantissa 3
// .:BA71 A5 27    LDA $27         get temp mantissa 2
// .:BA73 65 6B    ADC $6B         add FAC2 mantissa 2
// .:BA75 85 27    STA $27         save temp mantissa 2
// .:BA77 A5 26    LDA $26         get temp mantissa 1
// .:BA79 65 6A    ADC $6A         add FAC2 mantissa 1
// .:BA7B 85 26    STA $26         save temp mantissa 1
// .:BA7D 66 26    ROR $26         shift temp mantissa 1
// .:BA7F 66 27    ROR $27         shift temp mantissa 2
// .:BA81 66 28    ROR $28         shift temp mantissa 3
// .:BA83 66 29    ROR $29         shift temp mantissa 4
// .:BA85 66 70    ROR $70         shift temp rounding byte
// .:BA87 98       TYA             get byte back
// .:BA88 4A       LSR             shift byte
// .:BA89 D0 D6    BNE $BA61       loop if all bits not done
// .:BA8B 60       RTS

.label /* $BA8C - 47756 */ BASIC_BA8C_load_fac_2_from_memory = $BA8C
// unpack memory (AY) into FAC2
//
// .:BA8C 85 22    STA $22         save pointer low byte
// .:BA8E 84 23    STY $23         save pointer high byte
// .:BA90 A0 04    LDY #$04        5 bytes to get (0-4)
// .:BA92 B1 22    LDA ($22),Y     get mantissa 4
// .:BA94 85 6D    STA $6D         save FAC2 mantissa 4
// .:BA96 88       DEY             decrement index
// .:BA97 B1 22    LDA ($22),Y     get mantissa 3
// .:BA99 85 6C    STA $6C         save FAC2 mantissa 3
// .:BA9B 88       DEY             decrement index
// .:BA9C B1 22    LDA ($22),Y     get mantissa 2
// .:BA9E 85 6B    STA $6B         save FAC2 mantissa 2
// .:BAA0 88       DEY             decrement index
// .:BAA1 B1 22    LDA ($22),Y     get mantissa 1 + sign
// .:BAA3 85 6E    STA $6E         save FAC2 sign (b7)
// .:BAA5 45 66    EOR $66         EOR with FAC1 sign (b7)
// .:BAA7 85 6F    STA $6F         save sign compare (FAC1 EOR FAC2)
// .:BAA9 A5 6E    LDA $6E         recover FAC2 sign (b7)
// .:BAAB 09 80    ORA #$80        set 1xxx xxx (set normal bit)
// .:BAAD 85 6A    STA $6A         save FAC2 mantissa 1
// .:BAAF 88       DEY             decrement index
// .:BAB0 B1 22    LDA ($22),Y     get exponent byte
// .:BAB2 85 69    STA $69         save FAC2 exponent
// .:BAB4 A5 61    LDA $61         get FAC1 exponent
// .:BAB6 60       RTS

.label /* $BAB7 - 47799 */ BASIC_BAB7_test_both_accumulators = $BAB7
// test and adjust accumulators
//
// .:BAB7 A5 69    LDA $69         get FAC2 exponent
// .:BAB9 F0 1F    BEQ $BADA       branch if FAC2 = $00 (handle underflow)
// .:BABB 18       CLC             clear carry for add
// .:BABC 65 61    ADC $61         add FAC1 exponent
// .:BABE 90 04    BCC $BAC4       branch if sum of exponents < $0100
// .:BAC0 30 1D    BMI $BADF       do overflow error
// .:BAC2 18       CLC             clear carry for the add
// .:BAC3 2C       .BYTE $2C       makes next line BIT $1410
// .:BAC4 10 14    BPL $BADA       if +ve go handle underflow
// .:BAC6 69 80    ADC #$80        adjust exponent
// .:BAC8 85 61    STA $61         save FAC1 exponent
// .:BACA D0 03    BNE $BACF       branch if not zero
// .:BACC 4C FB B8 JMP $B8FB       save FAC1 sign and return
// .:BACF A5 6F    LDA $6F         get sign compare (FAC1 EOR FAC2)
// .:BAD1 85 66    STA $66         save FAC1 sign (b7)
// .:BAD3 60       RTS
//                                 handle overflow and underflow

.label /* $BAD4 - 47828 */ BASIC_BAD4_overflow_underflow = $BAD4
// .:BAD4 A5 66    LDA $66         get FAC1 sign (b7)
// .:BAD6 49 FF    EOR #$FF        complement it
// .:BAD8 30 05    BMI $BADF       do overflow error
//                                 handle underflow
// .:BADA 68       PLA             pop return address low byte
// .:BADB 68       PLA             pop return address high byte
// .:BADC 4C F7 B8 JMP $B8F7       clear FAC1 exponent and sign and return
// .:BADF 4C 7E B9 JMP $B97E       do overflow error then warm start

.label /* $BAE2 - 47842 */ BASIC_BAE2_multiply_fac_1_by_10 = $BAE2
// multiply FAC1 by 10
//
// .:BAE2 20 0C BC JSR $BC0C       round and copy FAC1 to FAC2
// .:BAE5 AA       TAX             copy exponent (set the flags)
// .:BAE6 F0 10    BEQ $BAF8       exit if zero
// .:BAE8 18       CLC             clear carry for add
// .:BAE9 69 02    ADC #$02        add two to exponent (*4)
// .:BAEB B0 F2    BCS $BADF       do overflow error if > $FF
//                                 FAC1 = (FAC1 + FAC2) * 2
// .:BAED A2 00    LDX #$00        clear byte
// .:BAEF 86 6F    STX $6F         clear sign compare (FAC1 EOR FAC2)
// .:BAF1 20 77 B8 JSR $B877       add FAC2 to FAC1 (*5)
// .:BAF4 E6 61    INC $61         increment FAC1 exponent (*10)
// .:BAF6 F0 E7    BEQ $BADF       if exponent now zero go do overflow error
// .:BAF8 60       RTS

.label /* $BAF9 - 47865 */ BASIC_BAF9_constant_10_in_flpt = $BAF9
// 10 as a floating value
//
// .:BAF9 84 20 00 00 00           10

.label /* $BAFE - 47870 */ BASIC_BAFE_divide_fac_1_by_10 = $BAFE
// divide FAC1 by 10
//
// .:BAFE 20 0C BC JSR $BC0C       round and copy FAC1 to FAC2
// .:BB01 A9 F9    LDA #$F9        set 10 pointer low byte
// .:BB03 A0 BA    LDY #$BA        set 10 pointer high byte
// .:BB05 A2 00    LDX #$00        clear sign

.label /* $BB07 - 47879 */ BASIC_BB07_divide_fac_2_by_flpt_at_ac_yr = $BB07
// divide by (AY) (X=sign)
//
// .:BB07 86 6F    STX $6F         save sign compare (FAC1 EOR FAC2)
// .:BB09 20 A2 BB JSR $BBA2       unpack memory (AY) into FAC1
// .:BB0C 4C 12 BB JMP $BB12       do FAC2/FAC1
//	                               Perform divide-by

.label /* $BB0F - 47887 */ BASIC_BB0F_divide_fac_2_by_fac_1 = $BB0F
// convert AY and do (AY)/FAC1
//
// .:BB0F 20 8C BA JSR $BA8C       unpack memory (AY) into FAC2
// .:BB12 F0 76    BEQ $BB8A       if zero go do /0 error
// .:BB14 20 1B BC JSR $BC1B       round FAC1
// .:BB17 A9 00    LDA #$00        clear A
// .:BB19 38       SEC             set carry for subtract
// .:BB1A E5 61    SBC $61         subtract FAC1 exponent (2s complement)
// .:BB1C 85 61    STA $61         save FAC1 exponent
// .:BB1E 20 B7 BA JSR $BAB7       test and adjust accumulators
// .:BB21 E6 61    INC $61         increment FAC1 exponent
// .:BB23 F0 BA    BEQ $BADF       if zero do overflow error
// .:BB25 A2 FC    LDX #$FC        set index to FAC temp
// .:BB27 A9 01    LDA #$01        set byte
// .:BB29 A4 6A    LDY $6A         get FAC2 mantissa 1
// .:BB2B C4 62    CPY $62         compare FAC1 mantissa 1
// .:BB2D D0 10    BNE $BB3F       branch if <>
// .:BB2F A4 6B    LDY $6B         get FAC2 mantissa 2
// .:BB31 C4 63    CPY $63         compare FAC1 mantissa 2
// .:BB33 D0 0A    BNE $BB3F       branch if <>
// .:BB35 A4 6C    LDY $6C         get FAC2 mantissa 3
// .:BB37 C4 64    CPY $64         compare FAC1 mantissa 3
// .:BB39 D0 04    BNE $BB3F       branch if <>
// .:BB3B A4 6D    LDY $6D         get FAC2 mantissa 4
// .:BB3D C4 65    CPY $65         compare FAC1 mantissa 4
// .:BB3F 08       PHP             save FAC2-FAC1 compare status
// .:BB40 2A       ROL             shift byte
// .:BB41 90 09    BCC $BB4C       skip next if no carry
// .:BB43 E8       INX             increment index to FAC temp
// .:BB44 95 29    STA $29,X
// .:BB46 F0 32    BEQ $BB7A
// .:BB48 10 34    BPL $BB7E
// .:BB4A A9 01    LDA #$01
// .:BB4C 28       PLP             restore FAC2-FAC1 compare status
// .:BB4D B0 0E    BCS $BB5D       if FAC2 >= FAC1 then do subtract
//                                 FAC2 = FAC2*2
// .:BB4F 06 6D    ASL $6D         shift FAC2 mantissa 4
// .:BB51 26 6C    ROL $6C         shift FAC2 mantissa 3
// .:BB53 26 6B    ROL $6B         shift FAC2 mantissa 2
// .:BB55 26 6A    ROL $6A         shift FAC2 mantissa 1
// .:BB57 B0 E6    BCS $BB3F       loop with no compare
// .:BB59 30 CE    BMI $BB29       loop with compare
// .:BB5B 10 E2    BPL $BB3F       loop with no compare, branch always
// .:BB5D A8       TAY             save FAC2-FAC1 compare status
// .:BB5E A5 6D    LDA $6D         get FAC2 mantissa 4
// .:BB60 E5 65    SBC $65         subtract FAC1 mantissa 4
// .:BB62 85 6D    STA $6D         save FAC2 mantissa 4
// .:BB64 A5 6C    LDA $6C         get FAC2 mantissa 3
// .:BB66 E5 64    SBC $64         subtract FAC1 mantissa 3
// .:BB68 85 6C    STA $6C         save FAC2 mantissa 3
// .:BB6A A5 6B    LDA $6B         get FAC2 mantissa 2
// .:BB6C E5 63    SBC $63         subtract FAC1 mantissa 2
// .:BB6E 85 6B    STA $6B         save FAC2 mantissa 2
// .:BB70 A5 6A    LDA $6A         get FAC2 mantissa 1
// .:BB72 E5 62    SBC $62         subtract FAC1 mantissa 1
// .:BB74 85 6A    STA $6A         save FAC2 mantissa 1
// .:BB76 98       TYA             restore FAC2-FAC1 compare status
// .:BB77 4C 4F BB JMP $BB4F
// .:BB7A A9 40    LDA #$40
// .:BB7C D0 CE    BNE $BB4C       branch always
//                                 do A<<6, save as FAC1 rounding byte, normalise and return
// .:BB7E 0A       ASL
// .:BB7F 0A       ASL
// .:BB80 0A       ASL
// .:BB81 0A       ASL
// .:BB82 0A       ASL
// .:BB83 0A       ASL
// .:BB84 85 70    STA $70         save FAC1 rounding byte
// .:BB86 28       PLP             dump FAC2-FAC1 compare status
// .:BB87 4C 8F BB JMP $BB8F       copy temp to FAC1, normalise and return
//                                 do "Divide by zero" error
// .:BB8A A2 14    LDX #$14        error $14, divide by zero error
// .:BB8C 4C 37 A4 JMP $A437       do error #X then warm start
// .:BB8F A5 26    LDA $26         get temp mantissa 1
// .:BB91 85 62    STA $62         save FAC1 mantissa 1
// .:BB93 A5 27    LDA $27         get temp mantissa 2
// .:BB95 85 63    STA $63         save FAC1 mantissa 2
// .:BB97 A5 28    LDA $28         get temp mantissa 3
// .:BB99 85 64    STA $64         save FAC1 mantissa 3
// .:BB9B A5 29    LDA $29         get temp mantissa 4
// .:BB9D 85 65    STA $65         save FAC1 mantissa 4
// .:BB9F 4C D7 B8 JMP $B8D7       normalise FAC1 and return

.label /* $BBA2 - 48034 */ BASIC_BBA2_load_fac_1_from_memory = $BBA2
// unpack memory (AY) into FAC1
//
// .:BBA2 85 22    STA $22         save pointer low byte
// .:BBA4 84 23    STY $23         save pointer high byte
// .:BBA6 A0 04    LDY #$04        5 bytes to do
// .:BBA8 B1 22    LDA ($22),Y     get fifth byte
// .:BBAA 85 65    STA $65         save FAC1 mantissa 4
// .:BBAC 88       DEY             decrement index
// .:BBAD B1 22    LDA ($22),Y     get fourth byte
// .:BBAF 85 64    STA $64         save FAC1 mantissa 3
// .:BBB1 88       DEY             decrement index
// .:BBB2 B1 22    LDA ($22),Y     get third byte
// .:BBB4 85 63    STA $63         save FAC1 mantissa 2
// .:BBB6 88       DEY             decrement index
// .:BBB7 B1 22    LDA ($22),Y     get second byte
// .:BBB9 85 66    STA $66         save FAC1 sign (b7)
// .:BBBB 09 80    ORA #$80        set 1xxx xxxx (add normal bit)
// .:BBBD 85 62    STA $62         save FAC1 mantissa 1
// .:BBBF 88       DEY             decrement index
// .:BBC0 B1 22    LDA ($22),Y     get first byte (exponent)
// .:BBC2 85 61    STA $61         save FAC1 exponent
// .:BBC4 84 70    STY $70         clear FAC1 rounding byte
// .:BBC6 60       RTS

.label /* $BBC7 - 48071 */ BASIC_BBC7_store_fac_1_in_memory = $BBC7
// pack FAC1 into $5C
//
// .:BBC7 A2 5C    LDX #$5C        set pointer low byte
// .:BBC9 2C       .BYTE $2C       makes next line BIT $57A2
//
// pack FAC1 into $57
//
// .:BBCA A2 57    LDX #$57        set pointer low byte
// .:BBCC A0 00    LDY #$00        set pointer high byte
// .:BBCE F0 04    BEQ $BBD4       pack FAC1 into (XY) and return, branch always
//
// pack FAC1 into variable pointer
//
// .:BBD0 A6 49    LDX $49         get destination pointer low byte
// .:BBD2 A4 4A    LDY $4A         get destination pointer high byte
//
// pack FAC1 into (XY)
//
// .:BBD4 20 1B BC JSR $BC1B       round FAC1
// .:BBD7 86 22    STX $22         save pointer low byte
// .:BBD9 84 23    STY $23         save pointer high byte
// .:BBDB A0 04    LDY #$04        set index
// .:BBDD A5 65    LDA $65         get FAC1 mantissa 4
// .:BBDF 91 22    STA ($22),Y     store in destination
// .:BBE1 88       DEY             decrement index
// .:BBE2 A5 64    LDA $64         get FAC1 mantissa 3
// .:BBE4 91 22    STA ($22),Y     store in destination
// .:BBE6 88       DEY             decrement index
// .:BBE7 A5 63    LDA $63         get FAC1 mantissa 2
// .:BBE9 91 22    STA ($22),Y     store in destination
// .:BBEB 88       DEY             decrement index
// .:BBEC A5 66    LDA $66         get FAC1 sign (b7)
// .:BBEE 09 7F    ORA #$7F        set bits x111 1111
// .:BBF0 25 62    AND $62         AND in FAC1 mantissa 1
// .:BBF2 91 22    STA ($22),Y     store in destination
// .:BBF4 88       DEY             decrement index
// .:BBF5 A5 61    LDA $61         get FAC1 exponent
// .:BBF7 91 22    STA ($22),Y     store in destination
// .:BBF9 84 70    STY $70         clear FAC1 rounding byte
// .:BBFB 60       RTS

.label /* $BBFC - 48124 */ BASIC_BBFC_copy_fac_2_into_fac_1 = $BBFC
// copy FAC2 to FAC1
//
// .:BBFC A5 6E    LDA $6E         get FAC2 sign (b7)
//                                 save FAC1 sign and copy ABS(FAC2) to FAC1
// .:BBFE 85 66    STA $66         save FAC1 sign (b7)
// .:BC00 A2 05    LDX #$05        5 bytes to copy
// .:BC02 B5 68    LDA $68,X       get byte from FAC2,X
// .:BC04 95 60    STA $60,X       save byte at FAC1,X
// .:BC06 CA       DEX             decrement count
// .:BC07 D0 F9    BNE $BC02       loop if not all done
// .:BC09 86 70    STX $70         clear FAC1 rounding byte
// .:BC0B 60       RTS

.label /* $BC0C - 48140 */ BASIC_BC0C_copy_fac_1_into_fac_2 = $BC0C
// round and copy FAC1 to FAC2
//
// .:BC0C 20 1B BC JSR $BC1B       round FAC1
//                                 copy FAC1 to FAC2
// .:BC0F A2 06    LDX #$06        6 bytes to copy
// .:BC11 B5 60    LDA $60,X       get byte from FAC1,X
// .:BC13 95 68    STA $68,X       save byte at FAC2,X
// .:BC15 CA       DEX             decrement count
// .:BC16 D0 F9    BNE $BC11       loop if not all done
// .:BC18 86 70    STX $70         clear FAC1 rounding byte
// .:BC1A 60       RTS

.label /* $BC1B - 48155 */ BASIC_BC1B_round_fac_1 = $BC1B
// round FAC1
//
// .:BC1B A5 61    LDA $61         get FAC1 exponent
// .:BC1D F0 FB    BEQ $BC1A       exit if zero
// .:BC1F 06 70    ASL $70         shift FAC1 rounding byte
// .:BC21 90 F7    BCC $BC1A       exit if no overflow
//                                 round FAC1 (no check)
// .:BC23 20 6F B9 JSR $B96F       increment FAC1 mantissa
// .:BC26 D0 F2    BNE $BC1A       branch if no overflow
// .:BC28 4C 38 B9 JMP $B938       nornalise FAC1 for C=1 and return

.label /* $BC2B - 48171 */ BASIC_BC2B_check_sign_of_fac_1 = $BC2B
// get FAC1 sign
//
//	                               return A = $FF, Cb = 1/-ve A = $01, Cb = 0/+ve, A = $00, Cb = ?/0
// .:BC2B A5 61    LDA $61         get FAC1 exponent
// .:BC2D F0 09    BEQ $BC38       exit if zero (allready correct SGN(0)=0)
//
// return A = $FF, Cb = 1/-ve A = $01, Cb = 0/+ve
//
//	                               no = 0 check
// .:BC2F A5 66    LDA $66         else get FAC1 sign (b7)
//
// return A = $FF, Cb = 1/-ve A = $01, Cb = 0/+ve
//
//                                 no = 0 check, sign in A
// .:BC31 2A       ROL             move sign bit to carry
// .:BC32 A9 FF    LDA #$FF        set byte for -ve result
// .:BC34 B0 02    BCS $BC38       return if sign was set (-ve)
// .:BC36 A9 01    LDA #$01        else set byte for +ve result
// .:BC38 60       RTS

.label /* $BC39 - 48185 */ BASIC_BC39_evaluate_sgn = $BC39
// perform SGN()
//
// .:BC39 20 2B BC JSR $BC2B       get FAC1 sign, return A = $FF -ve, A = $01 +ve
//
// save A as integer byte
//
// .:BC3C 85 62    STA $62         save FAC1 mantissa 1
// .:BC3E A9 00    LDA #$00        clear A
// .:BC40 85 63    STA $63         clear FAC1 mantissa 2
// .:BC42 A2 88    LDX #$88        set exponent
//                                 set exponent = X, clear FAC1 3 and 4 and normalise
// .:BC44 A5 62    LDA $62         get FAC1 mantissa 1
// .:BC46 49 FF    EOR #$FF        complement it
// .:BC48 2A       ROL             sign bit into carry
//                                 set exponent = X, clear mantissa 4 and 3 and normalise FAC1
// .:BC49 A9 00    LDA #$00        clear A
// .:BC4B 85 65    STA $65         clear FAC1 mantissa 4
// .:BC4D 85 64    STA $64         clear FAC1 mantissa 3
//	                               set exponent = X and normalise FAC1
// .:BC4F 86 61    STX $61         set FAC1 exponent
// .:BC51 85 70    STA $70         clear FAC1 rounding byte
// .:BC53 85 66    STA $66         clear FAC1 sign (b7)
// .:BC55 4C D2 B8 JMP $B8D2       do ABS and normalise FAC1

.label /* $BC58 - 48216 */ BASIC_BC58_evaluate_abs = $BC58
// perform ABS()
//
// .:BC58 46 66    LSR $66         clear FAC1 sign, put zero in b7
// .:BC5A 60       RTS

.label /* $BC5B - 48219 */ BASIC_BC5B_compare_fac_1_with_memory = $BC5B
// compare FAC1 with (AY)
//
//                                 returns A=$00 if FAC1 = (AY)
//                                 returns A=$01 if FAC1 > (AY)
//                                 returns A=$FF if FAC1 < (AY)
// .:BC5B 85 24    STA $24         save pointer low byte
// .:BC5D 84 25    STY $25         save pointer high byte
// .:BC5F A0 00    LDY #$00        clear index
// .:BC61 B1 24    LDA ($24),Y     get exponent
// .:BC63 C8       INY             increment index
// .:BC64 AA       TAX             copy (AY) exponent to X
// .:BC65 F0 C4    BEQ $BC2B       branch if (AY) exponent=0 and get FAC1 sign
//                                 A = $FF, Cb = 1/-ve A = $01, Cb = 0/+ve
// .:BC67 B1 24    LDA ($24),Y     get (AY) mantissa 1, with sign
// .:BC69 45 66    EOR $66         EOR FAC1 sign (b7)
// .:BC6B 30 C2    BMI $BC2F       if signs <> do return A = $FF, Cb = 1/-ve
//                                 A = $01, Cb = 0/+ve and return
// .:BC6D E4 61    CPX $61         compare (AY) exponent with FAC1 exponent
// .:BC6F D0 21    BNE $BC92       branch if different
// .:BC71 B1 24    LDA ($24),Y     get (AY) mantissa 1, with sign
// .:BC73 09 80    ORA #$80        normalise top bit
// .:BC75 C5 62    CMP $62         compare with FAC1 mantissa 1
// .:BC77 D0 19    BNE $BC92       branch if different
// .:BC79 C8       INY             increment index
// .:BC7A B1 24    LDA ($24),Y     get mantissa 2
// .:BC7C C5 63    CMP $63         compare with FAC1 mantissa 2
// .:BC7E D0 12    BNE $BC92       branch if different
// .:BC80 C8       INY             increment index
// .:BC81 B1 24    LDA ($24),Y     get mantissa 3
// .:BC83 C5 64    CMP $64         compare with FAC1 mantissa 3
// .:BC85 D0 0B    BNE $BC92       branch if different
// .:BC87 C8       INY             increment index
// .:BC88 A9 7F    LDA #$7F        set for 1/2 value rounding byte
// .:BC8A C5 70    CMP $70         compare with FAC1 rounding byte (set carry)
// .:BC8C B1 24    LDA ($24),Y     get mantissa 4
// .:BC8E E5 65    SBC $65         subtract FAC1 mantissa 4
// .:BC90 F0 28    BEQ $BCBA       exit if mantissa 4 equal
//                                 gets here if number <> FAC1
// .:BC92 A5 66    LDA $66         get FAC1 sign (b7)
// .:BC94 90 02    BCC $BC98       branch if FAC1 > (AY)
// .:BC96 49 FF    EOR #$FF        else toggle FAC1 sign
// .:BC98 4C 31 BC JMP $BC31       return A = $FF, Cb = 1/-ve A = $01, Cb = 0/+ve

.label /* $BC9B - 48283 */ BASIC_BC9B_convert_fac_1_to_integer = $BC9B
// convert FAC1 floating to fixed
//
// .:BC9B A5 61    LDA $61         get FAC1 exponent
// .:BC9D F0 4A    BEQ $BCE9       if zero go clear FAC1 and return
// .:BC9F 38       SEC             set carry for subtract
// .:BCA0 E9 A0    SBC #$A0        subtract maximum integer range exponent
// .:BCA2 24 66    BIT $66         test FAC1 sign (b7)
// .:BCA4 10 09    BPL $BCAF       branch if FAC1 +ve
//                                 FAC1 was -ve
// .:BCA6 AA       TAX             copy subtracted exponent
// .:BCA7 A9 FF    LDA #$FF        overflow for -ve number
// .:BCA9 85 68    STA $68         set FAC1 overflow byte
// .:BCAB 20 4D B9 JSR $B94D       twos complement FAC1 mantissa
// .:BCAE 8A       TXA             restore subtracted exponent
// .:BCAF A2 61    LDX #$61        set index to FAC1
// .:BCB1 C9 F9    CMP #$F9        compare exponent result
// .:BCB3 10 06    BPL $BCBB       if < 8 shifts shift FAC1 A times right and return
// .:BCB5 20 99 B9 JSR $B999       shift FAC1 A times right (> 8 shifts)
// .:BCB8 84 68    STY $68         clear FAC1 overflow byte
// .:BCBA 60       RTS
//
// shift FAC1 A times right
//
// .:BCBB A8       TAY             copy shift count
// .:BCBC A5 66    LDA $66         get FAC1 sign (b7)
// .:BCBE 29 80    AND #$80        mask sign bit only (x000 0000)
// .:BCC0 46 62    LSR $62         shift FAC1 mantissa 1
// .:BCC2 05 62    ORA $62         OR sign in b7 FAC1 mantissa 1
// .:BCC4 85 62    STA $62         save FAC1 mantissa 1
// .:BCC6 20 B0 B9 JSR $B9B0       shift FAC1 Y times right
// .:BCC9 84 68    STY $68         clear FAC1 overflow byte
// .:BCCB 60       RTS

.label /* $BCCC - 48332 */ BASIC_BCCC_evaluate_int = $BCCC
// perform INT()
//
// .:BCCC A5 61    LDA $61         get FAC1 exponent
// .:BCCE C9 A0    CMP #$A0        compare with max int
// .:BCD0 B0 20    BCS $BCF2       exit if >= (allready int, too big for fractional part!)
// .:BCD2 20 9B BC JSR $BC9B       convert FAC1 floating to fixed
// .:BCD5 84 70    STY $70         save FAC1 rounding byte
// .:BCD7 A5 66    LDA $66         get FAC1 sign (b7)
// .:BCD9 84 66    STY $66         save FAC1 sign (b7)
// .:BCDB 49 80    EOR #$80        toggle FAC1 sign
// .:BCDD 2A       ROL             shift into carry
// .:BCDE A9 A0    LDA #$A0        set new exponent
// .:BCE0 85 61    STA $61         save FAC1 exponent
// .:BCE2 A5 65    LDA $65         get FAC1 mantissa 4
// .:BCE4 85 07    STA $07         save FAC1 mantissa 4 for power function
// .:BCE6 4C D2 B8 JMP $B8D2       do ABS and normalise FAC1
//
// clear FAC1 and return
//
// .:BCE9 85 62    STA $62         clear FAC1 mantissa 1
// .:BCEB 85 63    STA $63         clear FAC1 mantissa 2
// .:BCED 85 64    STA $64         clear FAC1 mantissa 3
// .:BCEF 85 65    STA $65         clear FAC1 mantissa 4
// .:BCF1 A8       TAY             clear Y
// .:BCF2 60       RTS

.label /* $BCF3 - 48371 */ BASIC_BCF3_convert_ascii_string_to_a_number_in_fac = $BCF3
// get FAC1 from string
//
// .:BCF3 A0 00    LDY #$00        clear Y
// .:BCF5 A2 0A    LDX #$0A        set index
// .:BCF7 94 5D    STY $5D,X       clear byte
// .:BCF9 CA       DEX             decrement index
// .:BCFA 10 FB    BPL $BCF7       loop until numexp to negnum (and FAC1) = $00
// .:BCFC 90 0F    BCC $BD0D       branch if first character is numeric
// .:BCFE C9 2D    CMP #$2D        else compare with "-"
// .:BD00 D0 04    BNE $BD06       branch if not "-"
// .:BD02 86 67    STX $67         set flag for -ve n (negnum = $FF)
// .:BD04 F0 04    BEQ $BD0A       branch always
// .:BD06 C9 2B    CMP #$2B        else compare with "+"
// .:BD08 D0 05    BNE $BD0F       branch if not "+"
// .:BD0A 20 73 00 JSR $0073       increment and scan memory
// .:BD0D 90 5B    BCC $BD6A       branch if numeric character
// .:BD0F C9 2E    CMP #$2E        else compare with "."
// .:BD11 F0 2E    BEQ $BD41       branch if "."
// .:BD13 C9 45    CMP #$45        else compare with "E"
// .:BD15 D0 30    BNE $BD47       branch if not "E"
//                                 was "E" so evaluate exponential part
// .:BD17 20 73 00 JSR $0073       increment and scan memory
// .:BD1A 90 17    BCC $BD33       branch if numeric character
// .:BD1C C9 AB    CMP #$AB        else compare with token for -
// .:BD1E F0 0E    BEQ $BD2E       branch if token for -
// .:BD20 C9 2D    CMP #$2D        else compare with "-"
// .:BD22 F0 0A    BEQ $BD2E       branch if "-"
// .:BD24 C9 AA    CMP #$AA        else compare with token for +
// .:BD26 F0 08    BEQ $BD30       branch if token for +
// .:BD28 C9 2B    CMP #$2B        else compare with "+"
// .:BD2A F0 04    BEQ $BD30       branch if "+"
// .:BD2C D0 07    BNE $BD35       branch always
// .:BD2E 66 60    ROR $60         set exponent -ve flag (C, which=1, into b7)
// .:BD30 20 73 00 JSR $0073       increment and scan memory
// .:BD33 90 5C    BCC $BD91       branch if numeric character
// .:BD35 24 60    BIT $60         test exponent -ve flag
// .:BD37 10 0E    BPL $BD47       if +ve go evaluate exponent
//                                 else do exponent = -exponent
// .:BD39 A9 00    LDA #$00        clear result
// .:BD3B 38       SEC             set carry for subtract
// .:BD3C E5 5E    SBC $5E         subtract exponent byte
// .:BD3E 4C 49 BD JMP $BD49       go evaluate exponent
// .:BD41 66 5F    ROR $5F         set decimal point flag
// .:BD43 24 5F    BIT $5F         test decimal point flag
// .:BD45 50 C3    BVC $BD0A       branch if only one decimal point so far
//                                 evaluate exponent
// .:BD47 A5 5E    LDA $5E         get exponent count byte
// .:BD49 38       SEC             set carry for subtract
// .:BD4A E5 5D    SBC $5D         subtract numerator exponent
// .:BD4C 85 5E    STA $5E         save exponent count byte
// .:BD4E F0 12    BEQ $BD62       branch if no adjustment
// .:BD50 10 09    BPL $BD5B       else if +ve go do FAC1*10^expcnt
//                                 else go do FAC1/10^(0-expcnt)
// .:BD52 20 FE BA JSR $BAFE       divide FAC1 by 10
// .:BD55 E6 5E    INC $5E         increment exponent count byte
// .:BD57 D0 F9    BNE $BD52       loop until all done
// .:BD59 F0 07    BEQ $BD62       branch always
// .:BD5B 20 E2 BA JSR $BAE2       multiply FAC1 by 10
// .:BD5E C6 5E    DEC $5E         decrement exponent count byte
// .:BD60 D0 F9    BNE $BD5B       loop until all done
// .:BD62 A5 67    LDA $67         get -ve flag
// .:BD64 30 01    BMI $BD67       if -ve do - FAC1 and return
// .:BD66 60       RTS
//
// do - FAC1 and return
//
// .:BD67 4C B4 BF JMP $BFB4       do - FAC1
//                                 do unsigned FAC1*10+number
// .:BD6A 48       PHA             save character
// .:BD6B 24 5F    BIT $5F         test decimal point flag
// .:BD6D 10 02    BPL $BD71       skip exponent increment if not set
// .:BD6F E6 5D    INC $5D         else increment number exponent
// .:BD71 20 E2 BA JSR $BAE2       multiply FAC1 by 10
// .:BD74 68       PLA             restore character
// .:BD75 38       SEC             set carry for subtract
// .:BD76 E9 30    SBC #$30        convert to binary
// .:BD78 20 7E BD JSR $BD7E       evaluate new ASCII digit
// .:BD7B 4C 0A BD JMP $BD0A       go do next character
//                                 evaluate new ASCII digit
//                                 multiply FAC1 by 10 then (ABS) add in new digit
// .:BD7E 48       PHA             save digit
// .:BD7F 20 0C BC JSR $BC0C       round and copy FAC1 to FAC2
// .:BD82 68       PLA             restore digit
// .:BD83 20 3C BC JSR $BC3C       save A as integer byte
// .:BD86 A5 6E    LDA $6E         get FAC2 sign (b7)
// .:BD88 45 66    EOR $66         toggle with FAC1 sign (b7)
// .:BD8A 85 6F    STA $6F         save sign compare (FAC1 EOR FAC2)
// .:BD8C A6 61    LDX $61         get FAC1 exponent
// .:BD8E 4C 6A B8 JMP $B86A       add FAC2 to FAC1 and return
//                                 evaluate next character of exponential part of number
// .:BD91 A5 5E    LDA $5E         get exponent count byte
// .:BD93 C9 0A    CMP #$0A        compare with 10 decimal
// .:BD95 90 09    BCC $BDA0       branch if less
// .:BD97 A9 64    LDA #$64        make all -ve exponents = -100 decimal (causes underflow)
// .:BD99 24 60    BIT $60         test exponent -ve flag
// .:BD9B 30 11    BMI $BDAE       branch if -ve
// .:BD9D 4C 7E B9 JMP $B97E       else do overflow error then warm start
// .:BDA0 0A       ASL             *2
// .:BDA1 0A       ASL             *4
// .:BDA2 18       CLC             clear carry for add
// .:BDA3 65 5E    ADC $5E         *5
// .:BDA5 0A       ASL             *10
// .:BDA6 18       CLC             clear carry for add
// .:BDA7 A0 00    LDY #$00        set index
// .:BDA9 71 7A    ADC ($7A),Y     add character (will be $30 too much!)
// .:BDAB 38       SEC             set carry for subtract
// .:BDAC E9 30    SBC #$30        convert character to binary
// .:BDAE 85 5E    STA $5E         save exponent count byte
// .:BDB0 4C 30 BD JMP $BD30       go get next character

.label /* $BDB3 - 48563 */ BASIC_BDB3_string_conversion_constants_99999999 = $BDB3
// limits for scientific mode
// .:BDB3 9B 3E BC 1F FD           99999999.90625, maximum value with at least one decimal

.label /* $BDB8 - 48568 */ BASIC_BDB8_string_conversion_constants_999999999 = $BDB8
// .:BDB8 9E 6E 6B 27 FD           999999999.25, maximum value before scientific notation

.label /* $BDBD - 48573 */ BASIC_BDBD_string_conversion_constants_1000000000 = $BDBD
// .:BDBD 9E 6E 6B 28 00           1000000000

.label /* $BDC2 - 48578 */ BASIC_BDC2_output_in_and_line_number = $BDC2
// do " IN " line number message
//
// .:BDC2 A9 71    LDA #$71        set " IN " pointer low byte
// .:BDC4 A0 A3    LDY #$A3        set " IN " pointer high byte
// .:BDC6 20 DA BD JSR $BDDA       print null terminated string
// .:BDC9 A5 3A    LDA $3A         get the current line number high byte
// .:BDCB A6 39    LDX $39         get the current line number low byte

.label /* $BDCD - 48589 */ BASIC_BDCD_output_positive_integer_in_a_x = $BDCD
// print XA as unsigned integer
//
// .:BDCD 85 62    STA $62         save high byte as FAC1 mantissa1
// .:BDCF 86 63    STX $63         save low byte as FAC1 mantissa2
// .:BDD1 A2 90    LDX #$90        set exponent to 16d bits
// .:BDD3 38       SEC             set integer is +ve flag
// .:BDD4 20 49 BC JSR $BC49       set exponent = X, clear mantissa 4 and 3 and normalise
//	                               FAC1
// .:BDD7 20 DF BD JSR $BDDF       convert FAC1 to string
// .:BDDA 4C 1E AB JMP $AB1E       print null terminated string

.label /* $BDDD - 48605 */ BASIC_BDDD_convert_fac_1_to_ascii_string = $BDDD
// convert FAC1 to ASCII string result in (AY)
//
// .:BDDD A0 01    LDY #$01        set index = 1
// .:BDDF A9 20    LDA #$20        character = " " (assume +ve)
// .:BDE1 24 66    BIT $66         test FAC1 sign (b7)
// .:BDE3 10 02    BPL $BDE7       branch if +ve
// .:BDE5 A9 2D    LDA #$2D        else character = "-"
// .:BDE7 99 FF 00 STA $00FF,Y     save leading character (" " or "-")
// .:BDEA 85 66    STA $66         save FAC1 sign (b7)
// .:BDEC 84 71    STY $71         save index
// .:BDEE C8       INY             increment index
// .:BDEF A9 30    LDA #$30        set character = "0"
// .:BDF1 A6 61    LDX $61         get FAC1 exponent
// .:BDF3 D0 03    BNE $BDF8       branch if FAC1<>0
//                                 exponent was $00 so FAC1 is 0
// .:BDF5 4C 04 BF JMP $BF04       save last character, [EOT] and exit
//                                 FAC1 is some non zero value
// .:BDF8 A9 00    LDA #$00        clear (number exponent count)
// .:BDFA E0 80    CPX #$80        compare FAC1 exponent with $80 (<1.00000)
// .:BDFC F0 02    BEQ $BE00       branch if 0.5 <= FAC1 < 1.0
// .:BDFE B0 09    BCS $BE09       branch if FAC1=>1
// .:BE00 A9 BD    LDA #$BD        set 1000000000 pointer low byte
// .:BE02 A0 BD    LDY #$BD        set 1000000000 pointer high byte
// .:BE04 20 28 BA JSR $BA28       do convert AY, FCA1*(AY)
// .:BE07 A9 F7    LDA #$F7        set number exponent count
// .:BE09 85 5D    STA $5D         save number exponent count
// .:BE0B A9 B8    LDA #$B8        set 999999999.25 pointer low byte (max before sci note)
// .:BE0D A0 BD    LDY #$BD        set 999999999.25 pointer high byte
// .:BE0F 20 5B BC JSR $BC5B       compare FAC1 with (AY)
// .:BE12 F0 1E    BEQ $BE32       exit if FAC1 = (AY)
// .:BE14 10 12    BPL $BE28       go do /10 if FAC1 > (AY)
//                                 FAC1 < (AY)
// .:BE16 A9 B3    LDA #$B3        set 99999999.90625 pointer low byte
// .:BE18 A0 BD    LDY #$BD        set 99999999.90625 pointer high byte
// .:BE1A 20 5B BC JSR $BC5B       compare FAC1 with (AY)
// .:BE1D F0 02    BEQ $BE21       branch if FAC1 = (AY) (allow decimal places)
// .:BE1F 10 0E    BPL $BE2F       branch if FAC1 > (AY) (no decimal places)
//                                 FAC1 <= (AY)
// .:BE21 20 E2 BA JSR $BAE2       multiply FAC1 by 10
// .:BE24 C6 5D    DEC $5D         decrement number exponent count
// .:BE26 D0 EE    BNE $BE16       go test again, branch always
// .:BE28 20 FE BA JSR $BAFE       divide FAC1 by 10
// .:BE2B E6 5D    INC $5D         increment number exponent count
// .:BE2D D0 DC    BNE $BE0B       go test again, branch always
//                                 now we have just the digits to do
// .:BE2F 20 49 B8 JSR $B849       add 0.5 to FAC1 (round FAC1)
// .:BE32 20 9B BC JSR $BC9B       convert FAC1 floating to fixed
// .:BE35 A2 01    LDX #$01        set default digits before dp = 1
// .:BE37 A5 5D    LDA $5D         get number exponent count
// .:BE39 18       CLC             clear carry for add
// .:BE3A 69 0A    ADC #$0A        up to 9 digits before point
// .:BE3C 30 09    BMI $BE47       if -ve then 1 digit before dp
// .:BE3E C9 0B    CMP #$0B        A>=$0B if n>=1E9
// .:BE40 B0 06    BCS $BE48       branch if >= $0B
//                                 carry is clear
// .:BE42 69 FF    ADC #$FF        take 1 from digit count
// .:BE44 AA       TAX             copy to X
// .:BE45 A9 02    LDA #$02        set exponent adjust
// .:BE47 38       SEC             set carry for subtract
// .:BE48 E9 02    SBC #$02        -2
// .:BE4A 85 5E    STA $5E         save exponent adjust
// .:BE4C 86 5D    STX $5D         save digits before dp count
// .:BE4E 8A       TXA             copy to A
// .:BE4F F0 02    BEQ $BE53       branch if no digits before dp
// .:BE51 10 13    BPL $BE66       branch if digits before dp
// .:BE53 A4 71    LDY $71         get output string index
// .:BE55 A9 2E    LDA #$2E        character "."
// .:BE57 C8       INY             increment index
// .:BE58 99 FF 00 STA $00FF,Y     save to output string
// .:BE5B 8A       TXA
// .:BE5C F0 06    BEQ $BE64
// .:BE5E A9 30    LDA #$30        character "0"
// .:BE60 C8       INY             increment index
// .:BE61 99 FF 00 STA $00FF,Y     save to output string
// .:BE64 84 71    STY $71         save output string index
// .:BE66 A0 00    LDY #$00        clear index (point to 100,000)

.label /* $BE68 - 48744 */ BASIC_BE68_convert_ti_to_string = $BE68
// .:BE68 A2 80    LDX #$80
// .:BE6A A5 65    LDA $65         get FAC1 mantissa 4
// .:BE6C 18       CLC             clear carry for add
// .:BE6D 79 19 BF ADC $BF19,Y     add byte 4, least significant
// .:BE70 85 65    STA $65         save FAC1 mantissa4
// .:BE72 A5 64    LDA $64         get FAC1 mantissa 3
// .:BE74 79 18 BF ADC $BF18,Y     add byte 3
// .:BE77 85 64    STA $64         save FAC1 mantissa3
// .:BE79 A5 63    LDA $63         get FAC1 mantissa 2
// .:BE7B 79 17 BF ADC $BF17,Y     add byte 2
// .:BE7E 85 63    STA $63         save FAC1 mantissa2
// .:BE80 A5 62    LDA $62         get FAC1 mantissa 1
// .:BE82 79 16 BF ADC $BF16,Y     add byte 1, most significant
// .:BE85 85 62    STA $62         save FAC1 mantissa1
// .:BE87 E8       INX             increment the digit, set the sign on the test sense bit
// .:BE88 B0 04    BCS $BE8E       if the carry is set go test if the result was positive
//                                 else the result needs to be negative
// .:BE8A 10 DE    BPL $BE6A       not -ve so try again
// .:BE8C 30 02    BMI $BE90       else done so return the digit
// .:BE8E 30 DA    BMI $BE6A       not +ve so try again
//                                 else done so return the digit
// .:BE90 8A       TXA             copy the digit
// .:BE91 90 04    BCC $BE97       if Cb=0 just use it
// .:BE93 49 FF    EOR #$FF        else make the 2's complement ..
// .:BE95 69 0A    ADC #$0A        .. and subtract it from 10
// .:BE97 69 2F    ADC #$2F        add "0"-1 to result
// .:BE99 C8       INY             increment ..
// .:BE9A C8       INY             .. index to..
// .:BE9B C8       INY             .. next less ..
// .:BE9C C8       INY             .. power of ten
// .:BE9D 84 47    STY $47         save current variable pointer low byte
// .:BE9F A4 71    LDY $71         get output string index
// .:BEA1 C8       INY             increment output string index
// .:BEA2 AA       TAX             copy character to X
// .:BEA3 29 7F    AND #$7F        mask out top bit
// .:BEA5 99 FF 00 STA $00FF,Y     save to output string
// .:BEA8 C6 5D    DEC $5D         decrement # of characters before the dp
// .:BEAA D0 06    BNE $BEB2       branch if still characters to do
//                                else output the point
// .:BEAC A9 2E    LDA #$2E        character "."
// .:BEAE C8       INY             increment output string index
// .:BEAF 99 FF 00 STA $00FF,Y     save to output string
// .:BEB2 84 71    STY $71         save output string index
// .:BEB4 A4 47    LDY $47         get current variable pointer low byte
// .:BEB6 8A       TXA             get character back
// .:BEB7 49 FF    EOR #$FF        toggle the test sense bit
// .:BEB9 29 80    AND #$80        clear the digit
// .:BEBB AA       TAX             copy it to the new digit
// .:BEBC C0 24    CPY #$24
//                                 compare the table index with the max for decimal numbers
// .:BEBE F0 04    BEQ $BEC4       if at the max exit the digit loop
// .:BEC0 C0 3C    CPY #$3C
//                                 compare the table index with the max for time
// .:BEC2 D0 A6    BNE $BE6A       loop if not at the max
//                                 now remove trailing zeroes
// .:BEC4 A4 71    LDY $71         restore the output string index
// .:BEC6 B9 FF 00 LDA $00FF,Y     get character from output string
// .:BEC9 88       DEY             decrement output string index
// .:BECA C9 30    CMP #$30        compare with "0"
// .:BECC F0 F8    BEQ $BEC6       loop until non "0" character found
// .:BECE C9 2E    CMP #$2E        compare with "."
// .:BED0 F0 01    BEQ $BED3       branch if was dp
//                                 restore last character
// .:BED2 C8       INY             increment output string index
// .:BED3 A9 2B    LDA #$2B        character "+"
// .:BED5 A6 5E    LDX $5E         get exponent count
// .:BED7 F0 2E    BEQ $BF07       if zero go set null terminator and exit
//                                 exponent isn't zero so write exponent
// .:BED9 10 08    BPL $BEE3       branch if exponent count +ve
// .:BEDB A9 00    LDA #$00        clear A
// .:BEDD 38       SEC             set carry for subtract
// .:BEDE E5 5E    SBC $5E         subtract exponent count adjust (convert -ve to +ve)
// .:BEE0 AA       TAX             copy exponent count to X
// .:BEE1 A9 2D    LDA #$2D        character "-"
// .:BEE3 99 01 01 STA $0101,Y     save to output string
// .:BEE6 A9 45    LDA #$45        character "E"
// .:BEE8 99 00 01 STA $0100,Y     save exponent sign to output string
// .:BEEB 8A       TXA             get exponent count back
// .:BEEC A2 2F    LDX #$2F        one less than "0" character
// .:BEEE 38       SEC             set carry for subtract
// .:BEEF E8       INX             increment 10's character
// .:BEF0 E9 0A    SBC #$0A        subtract 10 from exponent count
// .:BEF2 B0 FB    BCS $BEEF       loop while still >= 0
// .:BEF4 69 3A    ADC #$3A        add character ":" ($30+$0A, result is 10 less that value)
// .:BEF6 99 03 01 STA $0103,Y     save to output string
// .:BEF9 8A       TXA             copy 10's character
// .:BEFA 99 02 01 STA $0102,Y     save to output string
// .:BEFD A9 00    LDA #$00        set null terminator
// .:BEFF 99 04 01 STA $0104,Y     save to output string
// .:BF02 F0 08    BEQ $BF0C       go set string pointer (AY) and exit, branch always
//                                 save last character, [EOT] and exit
// .:BF04 99 FF 00 STA $00FF,Y     save last character to output string
//                                 set null terminator and exit
// .:BF07 A9 00    LDA #$00        set null terminator
// .:BF09 99 00 01 STA $0100,Y     save after last character
//                                 set string pointer (AY) and exit
// .:BF0C A9 00    LDA #$00        set result string pointer low byte
// .:BF0E A0 01    LDY #$01        set result string pointer high byte
// .:BF10 60       RTS

.label /* $BF11 - 48913 */ BASIC_BF11_table_of_constants_0_5 = $BF11
// constants
// .:BF11 80 00                    0.5, first two bytes
// .:BF13 00 00 00                 null return for undefined variables

.label /* $BF16 - 48918 */ BASIC_BF16_table_of_constants_4_byte_powers_of_10 = $BF16
// .:BF16 FA 0A 1F 00              -100 000 000
// .:BF16 FA 0A 1F 00              -100 000 000
// .:BF1A 00 98 96 80               +10 000 000
// .:BF1E FF F0 BD C0                -1 000 000
// .:BF22 00 01 86 A0                  +100 000
// .:BF26 FF FF D8 F0                   -10 000
// .:BF2A 00 00 03 E8                    +1 000
// .:BF2E FF FF FF 9C                     - 100
// .:BF32 00 00 00 0A                       +10
// .:BF36 FF FF FF FF                        -1

.label /* $BF3A - 48954 */ BASIC_BF3A_table_of_constants_ti_constants = $BF3A
// jiffy counts
//
// .:BF3A FF DF 0A 80              -2160000    10s hours
// .:BF3E 00 03 4B C0               +216000        hours
// .:BF42 FF FF 73 60                -36000    10s mins
// .:BF46 00 00 0E 10                 +3600        mins
// .:BF4A FF FF FD A8                  -600    10s secs
// .:BF4E 00 00 00 3C                   +60        secs
//
// not referenced
//
// .:BF52 EC                       checksum byte
//
// spare bytes, not referenced
//
// .:BF53 AA AA AA AA AA
// .:BF58 AA AA AA AA AA AA AA AA
// .:BF60 AA AA AA AA AA AA AA AA
// .:BF68 AA AA AA AA AA AA AA AA
// .:BF70 AA

.label /* $BF71 - 49009 */ BASIC_BF71_evaluate_sqr = $BF71
// perform SQR()
//
// .:BF71 20 0C BC JSR $BC0C       round and copy FAC1 to FAC2
// .:BF74 A9 11    LDA #$11        set 0.5 pointer low address
// .:BF76 A0 BF    LDY #$BF        set 0.5 pointer high address
// .:BF78 20 A2 BB JSR $BBA2       unpack memory (AY) into FAC1

.label /* $BF7B - 49019 */ BASIC_BF7B_evaluate_power = $BF7B
// perform power function
//
// .:BF7B F0 70    BEQ $BFED       perform EXP()
// .:BF7D A5 69    LDA $69         get FAC2 exponent
// .:BF7F D0 03    BNE $BF84       branch if FAC2<>0
// .:BF81 4C F9 B8 JMP $B8F9       clear FAC1 exponent and sign and return
// .:BF84 A2 4E    LDX #$4E        set destination pointer low byte
// .:BF86 A0 00    LDY #$00        set destination pointer high byte
// .:BF88 20 D4 BB JSR $BBD4       pack FAC1 into (XY)
// .:BF8B A5 6E    LDA $6E         get FAC2 sign (b7)
// .:BF8D 10 0F    BPL $BF9E       branch if FAC2>0
//                                 else FAC2 is -ve and can only be raised to an
//                                 integer power which gives an x + j0 result
// .:BF8F 20 CC BC JSR $BCCC       perform INT()
// .:BF92 A9 4E    LDA #$4E        set source pointer low byte
// .:BF94 A0 00    LDY #$00        set source pointer high byte
// .:BF96 20 5B BC JSR $BC5B       compare FAC1 with (AY)
// .:BF99 D0 03    BNE $BF9E       branch if FAC1 <> (AY) to allow Function Call error
//                                 this will leave FAC1 -ve and cause a Function Call
//                                 error when LOG() is called
// .:BF9B 98       TYA             clear sign b7
// .:BF9C A4 07    LDY $07         get FAC1 mantissa 4 from INT() function as sign in
//                                 Y for possible later negation, b0 only needed
// .:BF9E 20 FE BB JSR $BBFE       save FAC1 sign and copy ABS(FAC2) to FAC1
// .:BFA1 98       TYA             copy sign back ..
// .:BFA2 48       PHA             .. and save it
// .:BFA3 20 EA B9 JSR $B9EA       perform LOG()
// .:BFA6 A9 4E    LDA #$4E        set pointer low byte
// .:BFA8 A0 00    LDY #$00        set pointer high byte
// .:BFAA 20 28 BA JSR $BA28       do convert AY, FCA1*(AY)
// .:BFAD 20 ED BF JSR $BFED       perform EXP()
// .:BFB0 68       PLA             pull sign from stack
// .:BFB1 4A       LSR             b0 is to be tested
// .:BFB2 90 0A    BCC $BFBE       if no bit then exit
//                                 do - FAC1

.label /* $BFB4 - 49076 */ BASIC_BFB4_negate_fac_1 = $BFB4
// .:BFB4 A5 61    LDA $61         get FAC1 exponent
// .:BFB6 F0 06    BEQ $BFBE       exit if FAC1_e = $00
// .:BFB8 A5 66    LDA $66         get FAC1 sign (b7)
// .:BFBA 49 FF    EOR #$FF        complement it
// .:BFBC 85 66    STA $66         save FAC1 sign (b7)
// .:BFBE 60       RTS

.label /* $BFBF - 49087 */ BASIC_BFBF_table_of_constants_1_44269504 = $BFBF
// exp(n) constant and series
//
// .:BFBF 81 38 AA 3B 29           1.44269504 = 1/LOG(2)

.label /* $BFC4 - 49092 */ BASIC_BFC4_table_of_constants_07 = $BFC4
// .:BFC4 07                       series count

.label /* $BFC5 - 49093 */ BASIC_BFC5_table_of_constants_2_149875_eminus_5 = $BFC5
// .:BFC5 71 34 58 3E 56           2.14987637E-5

.label /* $BFCA - 49098 */ BASIC_BFCA_table_of_constants_1_435231_eminus_4 = $BFCA
// .:BFCA 74 16 7E B3 1B           1.43523140E-4

.label /* $BFCF - 49103 */ BASIC_BFCF_table_of_constants_1_342263_eminus_3 = $BFCF
// .:BFCF 77 2F EE E3 85           1.34226348E-3

.label /* $BFD4 - 49108 */ BASIC_BFD4_table_of_constants_9_6414017_eminus_3 = $BFD4
// .:BFD4 7A 1D 84 1C 2A           9.61401701E-3

.label /* $BFD9 - 49113 */ BASIC_BFD9_table_of_constants_5_550513_eminus_2 = $BFD9
// .:BFD9 7C 63 59 58 0A           5.55051269E-2

.label /* $BFDE - 49118 */ BASIC_BFDE_table_of_constants_2_402263_eminus_4 = $BFDE
// .:BFDE 7E 75 FD E7 C6           2.40226385E-1

.label /* $BFE3 - 49123 */ BASIC_BFE3_table_of_constants_6_931471_eminus_1 = $BFE3
// .:BFE3 80 31 72 18 10           6.93147186E-1

.label /* $BFE8 - 49128 */ BASIC_BFE8_table_of_constants_1_00 = $BFE8
// .:BFE8 81 00 00 00 00           1.00000000

.label /* $BFED - 49133 */ BASIC_BFED_evaluate_exp = $BFED
// perform EXP()
//
// .:BFED A9 BF    LDA #$BF        set 1.443 pointer low byte
// .:BFEF A0 BF    LDY #$BF        set 1.443 pointer high byte
// .:BFF1 20 28 BA JSR $BA28       do convert AY, FCA1*(AY)
// .:BFF4 A5 70    LDA $70         get FAC1 rounding byte
// .:BFF6 69 50    ADC #$50        +$50/$100
// .:BFF8 90 03    BCC $BFFD       skip rounding if no carry
// .:BFFA 20 23 BC JSR $BC23       round FAC1 (no check)
// .:BFFD 4C 00 E0 JMP $E000       continue EXP()
