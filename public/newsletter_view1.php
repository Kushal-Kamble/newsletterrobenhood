<?php
// public/newsletter_view.php
require_once "../config.php";
include "../inc/header.php";

if (empty($_GET['id'])) {
    echo "<div class='container py-4'><div class='alert alert-danger'>Invalid newsletter id</div></div>";
    include "../inc/footer.php";
    exit;
}
$id = (int)$_GET['id'];

$stmt = $conn->prepare("SELECT * FROM newsletter_master WHERE id = ? LIMIT 1");
$stmt->bind_param("i", $id);
$stmt->execute();
$nl = $stmt->get_result()->fetch_assoc();
$stmt->close();

?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title><?= $nl ? htmlspecialchars($nl['title']) : 'Newsletter' ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background:#f6f8fb; }
    .newsletter-wrap { max-width:900px; margin:28px auto; }
    .outer-card { background:#fe9e43; padding:22px; border-radius:18px; }
    .inner-card { background:#fff; border-radius:12px; padding:20px; }
    .section-card { padding:16px; border-radius:10px; margin:18px 0; }
    .read-more-btn { background:#fd5402;color:#fff;padding:8px 14px;border-radius:6px;text-decoration:none;display:inline-block; }
    .hero-img { width:100%; border-radius:10px; display:block; margin-bottom:12px; }
    .video-thumb { max-width:100%; border-radius:8px; display:block; margin:0 auto; }
    .section-title { font-size:18px; margin-bottom:8px; font-weight:600; color:#212428; }
    .small-muted { color:#666; font-size:13px; }
  </style>
</head>
<body>
<div class="newsletter-wrap">
  <?php if (!$nl): ?>
    <div class="alert alert-warning">Newsletter not found.</div>
  <?php else: ?>
    <div class="outer-card">
      <div class="inner-card">
        <h2 style="margin:0 0 6px 0;"><?= htmlspecialchars($nl['title']) ?></h2>
        <div class="small-muted mb-3">Newsletter</div>

        <?php
        // hero
        if (!empty($nl['image'])): ?>
          <div style="background:#fff7ec;padding:10px;border-radius:12px;margin-bottom:12px;text-align:center;">
            <img src="<?= htmlspecialchars($nl['image']) ?>" alt="Hero" class="hero-img">
          </div>
        <?php endif; ?>

        <?php
        // video block
        if (!empty($nl['video'])):
            $ytId = '';
            if (preg_match('/(?:youtu\.be\/|youtube\.com\/(?:watch\?v=|embed\/|shorts\/))([a-zA-Z0-9_-]+)/', $nl['video'], $m)) {
                $ytId = $m[1];
            }
            if ($ytId) {
                $thumb = "https://img.youtube.com/vi/".$ytId."/hqdefault.jpg";
                ?>
                <div style="background:#eef7ff;padding:12px;border-radius:12px;margin:18px 0;text-align:center;">
                  <a href="<?= htmlspecialchars($nl['video']) ?>" target="_blank">
                    <img src="<?= $thumb ?>" alt="Watch Video" class="video-thumb">
                  </a>
                  <div style="margin-top:8px;">
                    <a class="read-more-btn" href="<?= htmlspecialchars($nl['video']) ?>" target="_blank">▶ Watch Video</a>
                  </div>
                </div>
            <?php
            } else {
                ?>
                <div style="background:#eef7ff;padding:12px;border-radius:12px;margin:18px 0;text-align:center;">
                  <a class="read-more-btn" href="<?= htmlspecialchars($nl['video']) ?>" target="_blank">🎬 Watch Video</a>
                </div>
            <?php
            }
        endif;
        ?>

        <?php
        // multi content
        $multi = [];
        if (!empty($nl['multi_content'])) {
            $multi = json_decode($nl['multi_content'], true);
            if (!is_array($multi)) $multi = [];
        }

        // color map (same as send helper)
        $section_colors = [
            'this_weeks_insights' => '#e7d9fb',
            'quick_bytes'         => '#e6f3ff',
            'ai_tip'              => '#f5d8f9',
            'toolbox'             => '#d7ecfb',
            'market_news'         => '#d4f4d4',
            'wellnessbyte'        => '#f9f6d0',
            'quote_of_the_day'    => '#fde2d2',
        ];

        // deterministic order
        $sections_def = [
            'this_weeks_insights' => "This Week’s Insights",
            'quick_bytes'         => "Quick Bytes",
            'ai_tip'              => "AI Tip of the Week",
            'toolbox'             => "Toolbox",
            'market_news'         => "Market News",
            'wellnessbyte'        => "Wellnessbyte",
            'quote_of_the_day'    => "Quote of the Day",
        ];

        foreach ($sections_def as $key => $label) {
            if (empty($multi[$key])) continue;
            $sec = $multi[$key];
            $sec_label = $sec['label'] ?? $label;
            $content_html = $sec['content'] ?? '';
            $bg = $section_colors[$key] ?? '#ffffff';
            $post_url = !empty($sec['post_url']) ? $sec['post_url'] : '';
            ?>
            <div class="section-card" style="background:<?= $bg ?>;">
                <div class="section-title"><?= htmlspecialchars($sec_label) ?></div>
                <div class="small-muted mb-2"><?= htmlspecialchars($sec['subcategory'] ?? '') ?></div>
                <div style="color:#333;line-height:1.6;font-size:14px;">
                    <?= $content_html ?> <!-- content is trusted HTML from CKEditor saved earlier -->
                </div>
                <?php if ($post_url): ?>
                  <div style="text-align:center;margin-top:12px;">
                    <a class="read-more-btn" href="<?= htmlspecialchars($post_url) ?>" target="_blank">Read more</a>
                  </div>
                <?php endif; ?>
            </div>
        <?php } ?>

        <!-- Read full newsletter / share / unsubscribe -->
        <div style="text-align:center;margin-top:20px;">
          <a class="read-more-btn" href="mailto:?subject=<?= rawurlencode($nl['title']) ?>&body=Read%20this%20newsletter%20<?= rawurlencode(rtrim($BASE_URL,'/') . '/public/newsletter_view.php?id=' . $id) ?>">Share via Email</a>
          &nbsp;
          <a class="btn btn-outline-secondary btn-sm" href="index.php">Back</a>
        </div>

        <div style="color:#999;font-size:12px;margin-top:18px;text-align:center">
          You are viewing the newsletter. If you want to unsubscribe use the unsubscribe page.
        </div>

      </div>
    </div>
  <?php endif; ?>
</div>

<?php include "../inc/footer.php"; ?>
</body>
</html>
