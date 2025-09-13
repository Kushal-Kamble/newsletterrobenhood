<?php
session_start();
require_once "../config.php";


// Get newsletter ID
$id = (int)($_GET['id'] ?? 0);
if (!$id) {
    echo "<div class='alert alert-danger'>Invalid newsletter ID.</div>";
    exit;
}

// Fetch newsletter
$res = $conn->query("SELECT * FROM newsletter_master WHERE id=$id");
$newsletter = $res->fetch_assoc();

if (!$newsletter) {
    echo "<div class='alert alert-danger'>Newsletter not found</div>";
    exit;
}

// Decode sections JSON
$multi = json_decode($newsletter['multi_content'], true);
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title><?= htmlspecialchars($newsletter['title']) ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background:#f8f9fa; }
    .newsletter-section { margin-bottom:40px; }
    .card { border-radius:12px; }
    .btn-custom { background:#fd5402; color:#fff; }
    .btn-custom:hover { background:#e64900; color:#fff; }
  </style>
</head>
<body>
<div class="container py-5">
  <h1 class="mb-4 text-center"><?= htmlspecialchars($newsletter['title']) ?></h1>

  <?php
  // Render newsletter sections
  foreach ($multi as $slug => $sec) {
      if (!empty($sec['content'])) {
          echo "<div class='newsletter-section'>";
          echo "<h3 class='mb-3'>" . htmlspecialchars($sec['label']) . "</h3>";
          echo "<div>" . $sec['content'] . "</div>";
          echo "</div>";
      }
  }

  // Collect post IDs used in this newsletter
  $post_ids = [];
  foreach ($multi as $sec) {
      if (!empty($sec['post_id'])) {
          $post_ids[] = (int)$sec['post_id'];
      }
  }

  // Show related posts (only the ones sent in mail)
  if (!empty($post_ids)) {
      $in = implode(",", $post_ids);
      $posts_res = $conn->query("SELECT id, title, image, short_desc FROM posts WHERE id IN ($in)");

      echo "<hr><h3 class='text-center my-4'>📌 Related Posts</h3>";
      echo "<div class='row g-4'>";
      while ($p = $posts_res->fetch_assoc()) {
          $img = !empty($p['image']) ? htmlspecialchars($p['image']) : 'default.png';
          $title = htmlspecialchars($p['title']);
          $short = htmlspecialchars(mb_strimwidth(strip_tags($p['short_desc']), 0, 120, '...'));
          $pid = (int)$p['id'];

          echo "
          <div class='col-md-4'>
            <div class='card h-100 shadow-sm'>
              <img src='{$img}' class='card-img-top' alt='{$title}'>
              <div class='card-body'>
                <h5 class='card-title'>{$title}</h5>
                <p class='card-text'>{$short}</p>
                <a href='post_view.php?id={$pid}' class='btn btn-custom'>Read More</a>
              </div>
            </div>
          </div>";
      }
      echo "</div>";
  }
  ?>
</div>
</body>
</html>
