codeunit 50008 Weighing
{

    trigger OnRun()
    begin
    end;

    var
        StatusText: Text;
        decPesada: Decimal;
        codBalanza: Code[10];
        strBalanza: Text;
        intBultos: Integer;
        decPesoUnitario: Decimal;
        strItemNo: Code[20];
        strStatus: Text;
        codDoc: Code[20];
        intLin: Integer;
        optTDoc: Option Salida,Descarga;
        rstWP: Record "Weighing Scale Parameters";

    [Scope('OnPrem')]
    procedure fntPesada(p_codBalanza: Code[10]; p_strBalanza: Text; p_intBultos: Integer; p_decPesoUnitario: Decimal; p_strItemNo: Code[20]; p_strStatus: Text)
    begin
        codBalanza := p_codBalanza;
        strBalanza := p_strBalanza;
        intBultos := p_intBultos;
        decPesoUnitario := p_decPesoUnitario;
        strItemNo := p_strItemNo;
        strStatus := p_strStatus;
        Clear(rstWP);
        rstWP.Get(codBalanza);
    end;

    [Scope('OnPrem')]
    procedure fntMiDoc(p_optTDoc: Option Salida,Descarga; p_codDoc: Code[20]; p_intLin: Integer)
    begin
        codDoc := p_codDoc;
        intLin := p_intLin;
        optTDoc := p_intLin;
    end;

    [Scope('OnPrem')]
    procedure fntDevolverPesada(): Decimal
    var
        l_rstWR: Record "Weighing Records";
        optTDoc: Option Salida,Descarga;
        l_rstLD: Record "Lín. descarga";
    begin
        if optTDoc = optTDoc::Salida then begin
            Clear(l_rstWR);
            l_rstWR.SetRange("Shipment No.", codDoc);
            l_rstWR.SetRange("Weighing line no.", intLin);
            if l_rstWR.Find('-') then begin
                l_rstWR.Validate(Confirmed, l_rstWR.Confirmed::Confirmada);
                l_rstWR.Validate("Gross + Tare", decPesada);
                l_rstWR.Validate("Weighing Date and Time", CurrentDateTime);
                l_rstWR.Status := 'Actualizado por última vez: ' + Format(CurrentDateTime, 0, '<Day,2><Month,2><Year4><Hours24,2><Minutes,2><Seconds,2><Second dec>');
                l_rstWR.Modify;
            end;
        end;
        if optTDoc = optTDoc::Descarga then begin
            Clear(l_rstLD);
            l_rstLD.SetRange("No. proyecto", codDoc);
            l_rstLD.SetRange("Line no.", intLin);
            if l_rstLD.Find('-') then begin
                l_rstLD.Validate(Confirmed, l_rstWR.Confirmed::Confirmada);
                l_rstLD.Validate("Gross + Tare", decPesada);
                l_rstLD.Validate("Weighing Date and Time", CurrentDateTime);
                l_rstLD.Status := 'Actualizado por última vez: ' + Format(CurrentDateTime, 0, '<Day,2><Month,2><Year4><Hours24,2><Minutes,2><Seconds,2><Second dec>');
                l_rstLD.Modify;
            end;
        end;
    end;

    [Scope('OnPrem')]
    procedure fntTCPServer(l_ServerIP: Text; l_ServerPort: Integer): Text
    var
        dnTCPClient: DotNet dnTcpClient;
        dnNetworkStream: DotNet dnNetworkStream;
        dnTextEncoding: DotNet dnTextEncoding;
        dnChar: DotNet dnChar;
        ResponseBytes: array[1024] of Char;
        BytesRead: Byte;
        ResponseText: Text;
        readstream: InStream;
    begin
        dnTCPClient := dnTCPClient.TcpClient();
        dnTCPClient.Connect(l_ServerIP, l_ServerPort);

        readstream := dnTCPClient.GetStream();
        readstream.ReadText(ResponseText, 1024);
        exit(ResponseText);
    end;

    [Scope('OnPrem')]
    procedure fntAnularAcentosyEnes(strTexto: Text[100]): Text[100]
    var
        txtCharsToKeep: Text;
    begin
        txtCharsToKeep := '0123456789,.';
        exit(DelChr(strTexto, '=', DelChr(strTexto, '=', txtCharsToKeep)));
    end;

    procedure fntLeerBalanza(p_codBalanza: Code[10]; p_strBalanza: Text; p_intBultos: Integer; p_decPesoUnitario: Decimal; p_strItemNo: Code[20]; var p_strStatus: Text): Decimal
    var

        SerialPort: DotNet SerialPort;
        Weight: Text;
        Parity: DotNet Parity;
        StopBits: DotNet StopBits;
        Handshake: DotNet Handshake;
        l_rstScale: Record "Weighing Scale Parameters";
        sysArray: DotNet Array;
        decPesada: Decimal;
        i: Integer;
        l: Integer;
        cduWeighing: Codeunit Weighing;
    begin
        Clear(l_rstScale);
        if l_rstScale.Get(p_codBalanza) then begin

            p_strBalanza := l_rstScale.Name;
            case l_rstScale."Connection method" of
                l_rstScale."Connection method"::Serial:
                    begin
                        sysArray := SerialPort.GetPortNames;
                        if fntPortNameCheck(sysArray, l_rstScale.Port) then begin
                            SerialPort := SerialPort.SerialPort;
                            Parity := SerialPort.Parity;
                            StopBits := SerialPort.StopBits;
                            Handshake := SerialPort.Handshake;

                            // Configure RS232 port settings
                            SerialPort.PortName := l_rstScale.Port; // Specify the appropriate port name
                            SerialPort.BaudRate := l_rstScale."Baud Rate"; // Set the baud rate
                            case l_rstScale.Parity of
                                l_rstScale.Parity::Even:
                                    SerialPort.Parity := Parity.Even; // Set the parity
                                l_rstScale.Parity::Odd:
                                    SerialPort.Parity := Parity.Odd; // Set the parity
                            end;
                            SerialPort.DataBits := l_rstScale."Data Bits"; // Set the data bits
                            case l_rstScale."Stop Bits" of
                                l_rstScale."Stop Bits"::"1":
                                    SerialPort.StopBits := StopBits.One; // Set the stop bits
                                l_rstScale."Stop Bits"::"2":
                                    SerialPort.StopBits := StopBits.Two; // Set the stop bits
                            end;
                            case l_rstScale.Handshake of
                                l_rstScale.Handshake::None:
                                    begin
                                        SerialPort.Handshake := Handshake.None; // Set the flow control
                                    end;
                                l_rstScale.Handshake::XOnXOff:
                                    begin
                                        SerialPort.Handshake := Handshake.XOnXOff; // Set the flow control
                                    end;
                            end;

                            // Open the RS232 port
                            SerialPort.Open;

                            // Check if the port is open
                            if SerialPort.IsOpen then begin
                                //MESSAGE('Conexión exitosa.');

                                // Read weight data
                                Weight := SerialPort.ReadLine;
                                //MESSAGE('Peso: %1', Weight);

                                // Process the weight data
                                // Perform the necessary business logic here based on the weight value

                            end
                            else
                                Message('No pude conectarme con el puerto RS232.');

                            // Close the RS232 port
                            SerialPort.Close;
                        end;
                    end;
                l_rstScale."Connection method"::TCP:
                    begin
                        Clear(cduWeighing);
                        Weight := cduWeighing.fntTCPServer(l_rstScale."IP address", l_rstScale."TCP port");
                    end;
            end;
        end;
        p_strStatus := 'Actualizado: ' + Format(CurrentDateTime, 0, '<Day,2>/<Month,2>/<Year4> - <Hours24,2>:<Minutes,2>:<Seconds,2>');
        i := 0;
        l := 0;
        Weight := cduWeighing.fntAnularAcentosyEnes(Weight);
        Weight := CopyStr(Weight, 1, 7) + ',' + CopyStr(Weight, 8, 20);
        l := StrLen(Weight);
        repeat
            i += 1;
            //l += 1;
            case CopyStr(Weight, 1, 1) of
                '1', '2', '3', '4', '5', '6', '7', '8', '9':
                    begin
                        Weight := CopyStr(Weight, 1, StrLen(Weight));
                        i := 0;
                    end
                else
                    Weight := CopyStr(Weight, 2, StrLen(Weight));
            end;
        until (i = 0) or (l = i);
        if Evaluate(decPesada, DelChr(Weight, '=', ' ')) then
            if (decPesada >= l_rstScale."Downward limit") and (decPesada <= l_rstScale."Upward limit") then
                exit(Round(decPesada, 1));
    end;

    local procedure fntPortNameCheck(p_Array: DotNet Array; p_strPortName: Code[10]): Boolean
    var
        i: Integer;
    begin
        for i := 1 to p_Array.Length - 1 do begin
            exit(true);
        end;
        exit(false);
    end;

}

