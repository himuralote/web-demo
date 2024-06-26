<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f7f7f7;
        }

        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            width: 100%;
        }

        .form-group label {
            width: 100px;
            margin-right: 10px;
            text-align: left;
            word-wrap: break-word;
        }

        .form-group input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container input[type="submit"] {
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("form").on("submit", function(event) {
                event.preventDefault();

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/com/example/test",
                    data: $(this).serialize(),
                    success: function(response) {
                        alert("Username: " + response.username);
                        window.close();
                    },
                    error: function() {
                        alert("An error occurred while processing your request.");
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="form-container">
    <h2>ElasticSearch Index Migrate</h2>
    <form action="test" method="post">
        <div class="form-group">
            <label for="ips">Address</label>
            <input type="text" id="ips" name="ips">
        </div>
        <div class="form-group">
            <label for="indexPath">IndexPath</label>
            <input type="text" id="indexPath" name="indexPath">
        </div>
        <div class="form-group">
            <label for="username">Username (Optional)</label>
            <input type="text" id="username" name="username">
        </div>
        <div class="form-group">
            <label for="password">Password (Optional)</label>
            <input type="password" id="password" name="password">
        </div>

        <input type="submit" value="start">
    </form>
</div>
</body>
</html>