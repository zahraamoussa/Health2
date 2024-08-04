<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Allow all origins
header('Access-Control-Allow-Methods: GET, POST, OPTIONS'); // Allow specific methods
header('Access-Control-Allow-Headers: Content-Type'); // Allow specific headers

$servername = "fdb1030.awardspace.net";
$username = "4508247_project";
$password = "1kr0b0d_2Fnq5h)[";
$dbname = "4508247_project";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]));
}

$data = json_decode(file_get_contents('php://input'), true);
$user_id = $data['user_id'];

$sql = "SELECT tip FROM nutrition_tips WHERE user_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$tips = [];
while ($row = $result->fetch_assoc()) {
    $tips[] = $row['tip'];
}

$stmt->close();
$conn->close();

echo json_encode(['success' => true, 'tips' => $tips]);
?>
