<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Allow all origins
header('Access-Control-Allow-Methods: GET, POST, OPTIONS'); // Allow specific methods
header('Access-Control-Allow-Headers: Content-Type'); // Allow specific headers

$servername = "fdb1030.awardspace.net";
$dbusername = "4508247_project";
$dbpassword = "1kr0b0d_2Fnq5h)[";
$dbname = "4508247_project";

// Create connection
$conn = new mysqli($servername, $dbusername, $dbpassword, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Set content type to JSON
header('Content-Type: application/json');

// Get the posted data
$data = json_decode(file_get_contents('php://input'), true);

// Debugging: Print raw input
error_log("Raw input: " . file_get_contents('php://input'));

// Check if data is null
if (is_null($data)) {
    echo json_encode(['success' => false, 'message' => 'Invalid JSON']);
    exit();
}

// Extract the data
$username = $data['username'] ?? null;
$email = $data['email'] ?? null;
$password = $data['password'] ?? null;
$height = $data['height'] ?? null;
$weight = $data['weight'] ?? null;

// Check if any of the required fields are missing
if (empty($username) || empty($email) || empty($password) || empty($height) || empty($weight)) {
    echo json_encode(['success' => false, 'message' => 'All fields are required']);
    exit();
}

// Prepare the SQL statement
$stmt = $conn->prepare("INSERT INTO users (username, email, password, height, weight) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("sssdd", $username, $email, $password, $height, $weight);

// Execute the statement
if ($stmt->execute()) {
    // Get the user ID of the newly created user
    $user_id = $stmt->insert_id;
    echo json_encode(['success' => true, 'user_id' => $user_id, 'message' => 'User registered successfully']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error: ' . $stmt->error]);
}

// Close the connection
$stmt->close();
$conn->close();
?>
