INCLUDE Irvine32.inc
.data
    max_tickets DWORD 100
    ticket_count DWORD 0

    menu BYTE "Railway Menu", 0
    menu_option1 BYTE "1. Book a ticket", 0
    menu_option2 BYTE "2. Check ticket", 0
    menu_option3 BYTE "3. See the timings", 0
    menu_option4 BYTE "4. Check the prices of tickets", 0
    menu_option5 BYTE "5. Exit the program", 0
    prompt_choice BYTE "Enter your choice: ", 0
    prompt_passenger_name BYTE "Enter passenger name: ", 0
    prompt_source BYTE "Enter source: ", 0
    prompt_destination BYTE "Enter destination: ", 0
    prompt_train_name BYTE "Enter train name: ", 0
    booking_successful BYTE "Ticket booked successfully. Ticket number: ", 0
    display_timings BYTE "Trains timings are as under", 0
    display_prices BYTE "Prices of tickets are as follows", 0
    invalid_entry BYTE "Invalid entry", 0
    newline BYTE 13, 10, 0

    ticket_records DWORD 4000 DUP(?)  

.code
main PROC
    mov edx, OFFSET menu
    call WriteString
    mov edx, OFFSET menu_option1
    call WriteString
    mov edx, OFFSET newline
    call WriteString
    mov edx, OFFSET menu_option2
    call WriteString
    mov edx, OFFSET newline
    call WriteString
    mov edx, OFFSET menu_option3
    call WriteString
    mov edx, OFFSET newline
    call WriteString
    mov edx, OFFSET menu_option4
    call WriteString
    mov edx, OFFSET newline
    call WriteString
    mov edx, OFFSET menu_option5
    call WriteString
    mov edx, OFFSET newline
    call WriteString

    mov edx, OFFSET prompt_choice
    call WriteString
    call ReadDec
    mov ebx, eax

    cmp ebx, 1
    je BookTicket
    cmp ebx, 3
    je DisplayTimings
    cmp ebx, 4
    je DisplayPrices
    cmp ebx, 5
    je ExitProgram

    mov edx, OFFSET invalid_entry
    call WriteString
    jmp main

BookTicket:
    mov edx, OFFSET prompt_passenger_name
    call WriteString
    call ReadString
    mov edi, ticket_count
    shl edi, 6  
    lea edi, ticket_records[edi]

    mov ecx, OFFSET ticket_records
    lea edi, ticket_records[edi]

    mov eax, edx

    inc ticket_count

    mov edx, OFFSET booking_successful
    call WriteString
    call Crlf
    jmp main

DisplayTimings:
    mov edx, OFFSET display_timings
    call WriteString
    call Crlf
    jmp main

DisplayPrices:
    mov edx, OFFSET display_prices
    call WriteString
    call Crlf
    jmp main

ExitProgram:
    exit
main ENDP
END main
