<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Allow all origins
header('Access-Control-Allow-Methods: GET, POST, OPTIONS'); // Allow specific methods
header('Access-Control-Allow-Headers: Content-Type'); // Allow specific headers

// Database credentials
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
    $conn->close();
    exit();
}

// Extract the data
$user_id = $data['user_id'] ?? null;
$coach = $data['coach'] ?? null;
$type = $data['type'] ?? null;
$month = $data['month'] ?? null;
$payCode = $data['payCode'] ?? null;

// Check if any of the required fields are missing
if (empty($user_id) || empty($coach) || empty($type) || empty($month) || empty($payCode)) {
    echo json_encode(['success' => false, 'message' => 'All fields are required']);
    $conn->close();
    exit();
}

// Check if user_id exists in users table
$checkUser = $conn->prepare("SELECT id FROM users WHERE id = ?");
if ($checkUser === false) {
    echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
    $conn->close();
    exit();
}
$checkUser->bind_param("i", $user_id);
if ($checkUser->execute() === false) {
    echo json_encode(['success' => false, 'message' => 'Execute failed: ' . $checkUser->error]);
    $conn->close();
    exit();
}
$checkUser->store_result();

// Debugging: Log the number of rows found
error_log("Number of rows found: " . $checkUser->num_rows);

if ($checkUser->num_rows === 0) {
    echo json_encode(['success' => false, 'message' => 'User ID does not exist']);
    $checkUser->close();
    $conn->close();
    exit();
}
$checkUser->close();

// Prepare and bind
$stmt = $conn->prepare("INSERT INTO request (user_id, coach, type, month, payCode) VALUES (?, ?, ?, ?, ?)");
if ($stmt === false) {
    echo json_encode(['success' => false, 'message' => 'Prepare failed: ' . $conn->error]);
    $conn->close();
    exit();
}
$stmt->bind_param("issis", $user_id, $coach, $type, $month, $payCode);

// Execute the statement
if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'request is done']);
} else {
    echo json_encode(['success' => false, 'message' => $stmt->error]);
}

// Close connections
$stmt->close();
$conn->close();
?>
