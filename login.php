<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Content-Type: application/json');

// Handle preflight request
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(204);
    exit();
}

$servername = "fdb1030.awardspace.net";
$username = "4508247_project";
$password = "1kr0b0d_2Fnq5h)[";
$dbname = "4508247_project";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get POST data
$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['email']) && isset($data['password'])) {
    $email = $data['email'];
    $password = $data['password'];

    // Prepare and execute the SQL statement
    $stmt = $conn->prepare("SELECT id, username FROM users WHERE email = ? AND password = ?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($userId, $username);
        $stmt->fetch();
        echo json_encode([
            "success" => true,
            "user_id" => $userId,
            "username" => $username,
            "message" => "Login successful"
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Invalid email or password"
        ]);
    }

    $stmt->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "Email and password are required"
    ]);
}

$conn->close();
?>
