var pdfDoc = null,
    pageNum = 1,
    pageRendering = false,
    pageNumPending = null,
    IsFirstLoad = true;

    function InitializeControl(controlId) {
        var controlAddIn = document.getElementById(controlId);
        controlAddIn.innerHTML = `
            <div id="pdf-contents">
                <div id="pdf-meta">
                    <div id="pdf-buttons">
                        <button id="prev">Anterior</button>
                        <button id="next">Siguiente</button>
                        <button id="zoom-in">Zoom +</button>
                        <button id="zoom-out">Zoom -</button>
                        <button id="rotate-left">Rotar Izquierda</button>
                        <button id="rotate-right">Rotar Derecha</button>
                    </div>
                    <span id="page-count-container">
                        Página: <span id="page_num"></span> / <span id="page_count"></span>
                    </span>
                </div>
                <canvas id="the-canvas"></canvas>
            </div>
            <style>
            #pdf-controls {
                position: fixed;
                top: 10px;
                left: 10px;
                background: rgba(255, 255, 255, 0.8);
                padding: 10px;
                border-radius: 5px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
                z-index: 1000;
            }
            #pdf-container {
                position: relative;
                width: 100%;
                height: calc(100vh - 60px);
                overflow: auto;
                margin-top: 60px;
            }
            #the-canvas {
                display: block;
                margin: 0 auto;
                overflow: auto;
            }
        </style>`;
    }
    
    function LoadPDF(PDFDocument, IsFactbox) {
        var canvas = document.getElementById('the-canvas'),
            pdfcontents = document.getElementById('pdf-contents'),
            ctx = canvas.getContext('2d'),
            iframe = window.frameElement,
            factboxarea = window.frameElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement,
            scale = 1.3, // Default zoom level
            rotation = 0; // Default rotation (0 degrees)
    
        pageRendering = false;
        pageNum = 1;
        pageNumPending = null;
    
        PDFDocument = atob(PDFDocument);
    
        if (IsFactbox) {
            if (factboxarea.className = "ms-nav-layout-factbox-content-area ms-nav-scrollable") {
                factboxarea.style.paddingLeft = "5px";
                factboxarea.style.paddingRight = "0px";
                factboxarea.style.overflowY = "scroll";
            }
            scale = 0.6;
        }
    
        requestAnimationFrame(() => {
            function renderPage(num) {
                pageRendering = true;
                pdfDoc.getPage(num).then(function(page) {
                    var viewport = page.getViewport({ scale: scale, rotation: rotation });
                    canvas.height = viewport.height;
                    canvas.width = viewport.width;
    
                    pdfcontents.height = viewport.height;
                    pdfcontents.width = viewport.width;
                    iframe.style.height = viewport.height + 100 + "px";
                    iframe.parentElement.style.height = viewport.height + 100 + "px";
                    iframe.style.overflowY = "auto";
                    iframe.style.maxHeight = "2500px";
    
                    var renderContext = {
                        canvasContext: ctx,
                        viewport: viewport
                    };
                    var renderTask = page.render(renderContext);
    
                    renderTask.promise.then(function() {
                        pageRendering = false;
                        if (pageNumPending !== null) {
                            renderPage(pageNumPending);
                            pageNumPending = null;
                        }
                    });
                });
    
                document.getElementById('page_num').textContent = num;
            }
    
            function queueRenderPage(num) {
                if (pageRendering) {
                    pageNumPending = num;
                } else {
                    renderPage(num);
                }
            }
    
            function onPrevPage() {
                if (pageNum <= 1) {
                    return;
                }
                pageNum--;
                queueRenderPage(pageNum);
            }
            if (IsFirstLoad) {
                document.getElementById('prev').addEventListener('click', onPrevPage);
            }
    
            function onNextPage() {
                if (pageNum >= pdfDoc.numPages) {
                    return;
                }
                pageNum++;
                queueRenderPage(pageNum);
            }
            if (IsFirstLoad) {
                document.getElementById('next').addEventListener('click', onNextPage);
            }
    
            function onZoomIn() {
                scale += 0.1; // Increment zoom level
                queueRenderPage(pageNum);
            }
            if (IsFirstLoad) {
                document.getElementById('zoom-in').addEventListener('click', onZoomIn);
            }
    
            function onZoomOut() {
                if (scale > 0.2) { // Prevent too small scale
                    scale -= 0.1; // Decrement zoom level
                    queueRenderPage(pageNum);
                }
            }
            if (IsFirstLoad) {
                document.getElementById('zoom-out').addEventListener('click', onZoomOut);
            }
    
            function onRotateLeft() {
                rotation = (rotation - 90) % 360; // Rotate left
                queueRenderPage(pageNum);
            }
            if (IsFirstLoad) {
                document.getElementById('rotate-left').addEventListener('click', onRotateLeft);
            }
    
            function onRotateRight() {
                rotation = (rotation + 90) % 360; // Rotate right
                queueRenderPage(pageNum);
            }
            if (IsFirstLoad) {
                document.getElementById('rotate-right').addEventListener('click', onRotateRight);
            }
    
            function onView() {
                Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('onView');
            }
    
            IsFirstLoad = false;
    
            pdfjsLib.getDocument({ data: PDFDocument }).promise.then(function(pdfDoc_) {
                pdfDoc = pdfDoc_;
                document.getElementById('page_count').textContent = pdfDoc.numPages;
    
                renderPage(pageNum);
            });
        });
    }
    