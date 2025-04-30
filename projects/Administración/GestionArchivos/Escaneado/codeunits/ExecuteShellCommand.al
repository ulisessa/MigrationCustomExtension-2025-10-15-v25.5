codeunit 50020 ExecuteShellCommand
{
    trigger OnRun()
    begin

    end;

    procedure ExecuteShellCommand(Command: Text; Parameters: Text): Text
    var
        Process: DotNet dnProcess;
        StartInfo: DotNet dnProcessStartInfo;
        StandardOutput: DotNet dnStreamReader;
        StandardError: DotNet dnStreamReader;
        Output: Text;
        ErrorOutput: Text;
    begin
        StartInfo := StartInfo.ProcessStartInfo();
        StartInfo.FileName := Command;
        StartInfo.Arguments := Parameters;
        StartInfo.UseShellExecute := false;
        StartInfo.RedirectStandardOutput := true; // Redirige la salida estándar
        StartInfo.RedirectStandardError := true;  // Redirige la salida de error
        StartInfo.CreateNoWindow := true;         // Opcional: no mostrar ventana

        // Crear y ejecutar el proceso
        Process := Process.Process();
        Process.StartInfo := StartInfo;
        Process.Start();

        // Leer la salida estándar
        StandardOutput := Process.StandardOutput;
        Output := StandardOutput.ReadToEnd();

        // Leer la salida de error (si existe)
        StandardError := Process.StandardError;
        ErrorOutput := StandardError.ReadToEnd();

        // Esperar a que el proceso termine
        Process.WaitForExit();

        // Combinar la salida estándar y de error para retornar
        if ErrorOutput <> '' then
            Output := Output + '\nError: ' + ErrorOutput;

        exit(Output);
    end;

}