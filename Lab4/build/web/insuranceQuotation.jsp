<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Insurance Quotation</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>Insurance Quotation</h1>
            
            <div class="card">
                <fieldset style="border: 1px solid #ddd; padding: 20px; border-radius: 4px;">
                    <legend style="padding: 0 10px; color: #555;">Insurance Calculation</legend>
                    
                    <form action="processInsuranceQuo.jsp" method="POST">
                        
                        <div class="form-group">
                            <label for="icno">IC No*</label>
                            <input type="text" id="icno" name="icno" placeholder="E.g. 821210-05-3478" required>
                        </div>

                        <div class="form-group">
                            <label for="name">Name*</label>
                            <input type="text" id="name" name="name" placeholder="Enter name" required>
                        </div>

                        <div class="form-group">
                            <label for="price">Market Price*</label>
                            <input type="number" id="price" name="price" placeholder="Price" step="0.01" required>
                        </div>

                        <div class="form-group">
                            <label for="coverage">Coverage Type</label>
                            <select id="coverage" name="coverage" required>
                                <option value="thirdparty">Third Party</option>
                                <option value="comprehensive">Comprehensive</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="ncd">No Claims Discount (NCD)</label>
                            <select id="ncd" name="ncd" required>
                                <option value="0.0">0%</option>
                                <option value="0.10">10%</option>
                                <option value="0.25">25%</option>
                                <option value="0.30">30%</option>
                                <option value="0.45">45%</option>
                                <option value="0.55">55%</option>
                            </select>
                        </div>

                        <div class="button-group">
                            <button type="submit" class="btn btn-submit">Submit</button>
                            <button type="reset" class="btn btn-cancel">Cancel</button>
                        </div>
                        
                    </form>
                </fieldset>
            </div>
        </div>
    </body>
</html>