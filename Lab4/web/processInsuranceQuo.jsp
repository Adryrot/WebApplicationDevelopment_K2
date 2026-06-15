<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Insurance Quotation Result</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <%
        String icno = request.getParameter("icno");
        String name = request.getParameter("name");
        String coverage = request.getParameter("coverage");
        String ncdStr = request.getParameter("ncd");
        
        double price = 0;
        double ncdPercentage = 0;

        try {
            price = Double.parseDouble(request.getParameter("price"));
            ncdPercentage = Double.parseDouble(ncdStr);
        } catch (Exception e) {
            price = 0;
            ncdPercentage = 0;
        }

        double rate = 0;
        String coverageDisplay = "";
        
        if ("comprehensive".equals(coverage)) {
            rate = 0.05;
        } else {
            rate = 0.03;
        }

        double insurance = price * rate; 
        double discountAmount = insurance * ncdPercentage;
        double afterNCD = insurance - discountAmount;
        double sst = afterNCD * 0.08;
        double finalAmount = afterNCD + sst;
    %>

    <div class="container">
        <h1>Insurance Quotation Result</h1>
        <div class="card">
            <h2 class="form-title">Quotation Summary</h2>
            
            <div class="result-group">
                <label>IC No:</label> <p><%= icno %></p>
            </div>
            <div class="result-group">
                <label>Name:</label> <p><%= name %></p>
            </div>
            <div class="result-group">
                <label>Market Price (RM):</label> <p><%= String.format("%.2f", price) %></p>
            </div>
            <div class="result-group">
                <label>Coverage Type:</label> <p><%= coverageDisplay %></p>
            </div>
            <div class="result-group">
                <label>NCD:</label> <p><%= (int)(ncdPercentage * 100) %>%</p>
            </div>

            <hr style="border: 1px dashed #ddd; margin: 20px 0;">

            <div class="result-group">
                <label>Base Insurance:</label> <p>RM <%= String.format("%.2f", insurance) %></p>
            </div>
            <div class="result-group">
                <label>NCD Discount:</label> <p>RM <%= String.format("%.2f", discountAmount) %></p>
            </div>
            <div class="result-group">
                <label>After NCD:</label> <p>RM <%= String.format("%.2f", afterNCD) %></p>
            </div>
            <div class="result-group">
                <label>SST (8%):</label> <p>RM <%= String.format("%.2f", sst) %></p>
            </div>
            <div class="result-group">
                <label><strong>Final Insurance Amount:</strong></label> 
                <p><strong>RM <%= String.format("%.2f", finalAmount) %></strong></p>
            </div>

            <div class="button-group">
                <button onclick="history.back()" class="btn btn-back">Back</button>
            </div>
        </div>
    </div>
</body>
</html>