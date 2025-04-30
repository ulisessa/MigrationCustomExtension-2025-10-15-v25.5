dotnet
{
    assembly(System.Net.Sockets)
    {

        type(System.Net.Sockets.TcpClient; dnTcpClient) { }
        type(System.Net.Sockets.NetworkStream; dnNetworkStream) { }

    }

    assembly(mscorlib)
    {
        type(System.Text.Encoding; dnTextEncoding) { }
        type(System.Char; dnChar) { }
        type(System.Array; sysArray) { }
        type(System.Text.StringBuilder; dnStringBuilder) { }

    }

    assembly(System.IO.Ports)
    {

        Version = '9.0.0.0';
        Culture = 'neutral';
        PublicKeyToken = 'cc7b13ffcd2ddd51';

        type(System.IO.Ports.SerialPort; SerialPort) { }
        type(System.IO.Ports.Parity; Parity) { }
        type(System.IO.Ports.StopBits; StopBits) { }
        type(System.IO.Ports.Handshake; Handshake) { }

    }
    assembly(Oracle.DataAccess)
    {
        Version = '2.112.1.0';
        Culture = 'neutral';
        PublicKeyToken = '89b483f429c47342';

        type(Oracle.DataAccess.Client.OracleConnection; dnOracleConnection) { }
        type(Oracle.DataAccess.Client.OracleCommand; dnOracleCommand) { }
        type(Oracle.DataAccess.Client.OracleDataReader; dnOracleDataReader) { }
    }
    assembly(NAPS2.Sdk)
    {
        Version = '8.0.1.0';
        Culture = 'neutral';
        PublicKeyToken = 'fab2435581894676';

        type(NAPS2.Images.Barcode; dnBarcode) { }
        type(NAPS2.Images.BitDepth; dnBitDepth) { }
        type(NAPS2.Images.Deskewer; dnDeskewer) { }
        type(NAPS2.Images.IProcessedImageOwner; dnIProcessedImageOwner) { }
        type(NAPS2.Images.ImageExportFormat; dnImageExportFormat) { }
        type(NAPS2.Images.ImageExportHelper; dnImageExportHelper) { }
        type(NAPS2.Images.ImageMetadata; dnImageMetadata) { }
        type(NAPS2.Images.PageSide; dnPageSide) { }
        type(NAPS2.Images.PageSize; dnPageSize) { }
        type(NAPS2.Images.PageSizeUnit; dnPageSizeUnit) { }
        type(NAPS2.Images.PostProcessingData; dnPostProcessingData) { }
        type(NAPS2.Images.ProcessedImage; dnProcessedImage) { }
        type(NAPS2.Images.ThumbnailRenderer; dnThumbnailRenderer) { }
        
        type(NAPS2.ImportExport.Images.ImageTransferData; dnImageTransferData) { }
        type(NAPS2.ImportExport.Images.ImageTransferDataReflection; dnImageTransferDataReflection) { }
        type(NAPS2.ImportExport.FileImporter; dnFileImporter) { }
        type(NAPS2.ImportExport.ImageImporter; dnImageImporter) { }
        type(NAPS2.Ocr.OcrController; dnOcrController) { }

        type(NAPS2.Pdf.PdfExporter; dnPdfExporter) { }
        type(NAPS2.Pdf.PdfExportParams; dnPdfExportParams) { }
        type(NAPS2.Pdf.PdfFontPicker; dnPdfFontPicker) { }
        type(NAPS2.Pdf.PdfImporter; dnPdfImporter) { }
        type(NAPS2.Pdf.PdfMetadata; dnPdfMetadata) { }
        type(NAPS2.Pdf.PdfiumFontSubsets; dnPdfiumFontSubsets) { }
        type(NAPS2.Pdf.PdfiumImageExtractor; dnPdfiumImageExtractor) { }
        type(NAPS2.Pdf.PdfiumPdfExporter; dnPdfiumPdfExporter) { }
        type(NAPS2.Pdf.PdfiumPdfReader; dnPdfiumPdfReader) { }
        type(NAPS2.Pdf.PdfiumPdfRenderer; dnPdfiumPdfRenderer) { }
        type(NAPS2.Pdf.PdfiumWorkerCoordinator; dnPdfiumWorkerCoordinator) { }
        type(NAPS2.Pdf.IPdfPasswordProvider; dnIPdfPasswordProvider) { }
        type(NAPS2.Pdf.JpegFormatHelper; dnJpegFormatHelper) { }
        type(NAPS2.Pdf.PdfAHelper; dnPdfAHelper) { }
        type(NAPS2.Pdf.PdfEncryption; dnPdfEncryption) { }

        type(NAPS2.Scan.ScanningContext; dnScanningContext) { }
        type(NAPS2.Scan.ScanOptions; dnScanOptions) { }
        type(NAPS2.Scan.ScanController; dnScanController) { }
        type(NAPS2.Scan.ScanDevice; dnScanDevice) { }

    }

    assembly(NAPS2.Escl)
    {
        Version = '1.0.0.0';
        Culture = 'neutral';
        PublicKeyToken = 'fab2435581894676';
    }

    assembly(NAPS2.Images.Gdi)
    {
        Version = '8.0.1.0';
        Culture = 'neutral';
        PublicKeyToken = 'c19d6afe2e9e67ae';
        type(NAPS2.Images.Gdi.GdiImageContext; dnGdiImageContext) { }
    }

    assembly(NAPS2.Images)
    {
        Version = '8.0.1.0';
        Culture = 'neutral';
        PublicKeyToken = 'fab2435581894676';

        type(NAPS2.Images.ImageContext; dnImageContext){}
        type(NAPS2.Images.ImagePixelFormat; dnImagePixelFormat){}

    }

    assembly(NAPS2.Internals)
    {
        Version = '8.0.1.0';
        Culture = 'neutral';
        PublicKeyToken = 'fab2435581894676';
    }

    assembly(System.Diagnostics.Process)
    {
        type(System.Diagnostics.Process; dnProcess) { }
        type(System.Diagnostics.ProcessStartInfo; dnProcessStartInfo) { }
    }

    assembly(System.IO)
    {
        type(System.IO.StreamReader; dnStreamReader) { }
    }

    assembly(System)
    {
        type(System.Timers.Timer; MyTimer) { }
        type(System.Timers.ElapsedEventArgs; MyElapsedEventArgs) { }
    }
}