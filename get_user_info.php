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

// Check if 'user_id' is present
if (isset($data['user_id']) && !empty($data['user_id'])) {
    $userId = $data['user_id'];

    // Prepare and execute the SQL statement
    $stmt = $conn->prepare("SELECT username, email, img, height,img weight FROM users WHERE id = ?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($username, $email, $img, $height, $weight);
        $stmt->fetch();
        echo json_encode([
            "success" => true,
            "username" => $username,
            "email" => $email,
            "img" => $img,
            "height" => $height,
            "weight" => $weight,
                "img"=>$img,
            "message" => "User info fetched successfully"
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "User not found"
        ]);
    }

    $stmt->close();
} else {
    echo json_encode([
        "success" => false,
        "message" => "User ID is required"
    ]);
}

$conn->close();
?>
