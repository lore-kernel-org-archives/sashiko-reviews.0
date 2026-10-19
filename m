Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424825;
	b=mm1ex1SRFHU3G3OUMU9RpWpuKlr3//PgVKmA9R6npgvvU4kxhpya92Re2l0/D2DHSs2Y
	 GtlDhfCgwXG203UDUGl/tWXD8QQF/8+Bp+XZRj+nIllH+cZ9LThsp6RNZmY3mMLtxwd17
	 iLBjZHzM+pATR8dHz/CWCQ57l0S9n6EeezvkCaXicWB2HjH9Wi5mvr6IC3l769L0adedA
	 IJQ9YZu1BuROpMCSk448K0orstRPSqUxu+Wl0/yr+l+/zRTYt23VHH++khptly6e4m35w
	 E/hUdQZKfEJ5MNXBkmdqqmt9F/bLRHB+Yvk5BGFb/CpNcs/mhkrSKGhLxdBFczknGUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424825;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=6eAg9tb1et2BPHQaOqAcQvY2sjCRU8JVu33cBeD3Y+s=;
	b=YmrWZS0w53CRhNZmsDnTberw5wH9ZlNr3MZLoTTfgImCzxoIgdbGqE0Fnk6nV7FFaXJT
	 7RznVov7dEAVVfbCZdiXp7kVHfe/yvsFk3aAsR+kzSxZtEUQ5qqO/I7DgH4JO2OBan/+X
	 8eE1Tl38wJcoLWbWYeDvCsmdWGuB6FJ1XebSHgnHCVbYBrlOOqK7uXPMDjW4LzDV8lwmP
	 Xqg7n2yiz+uSeL46azPYGY2tRnXEuFV9BL0X3EaiU6gXSVHXcyZm3g7GHujPp8ZRWFqU6
	 f2BvOjZOmKqkgLqHAi4L8uuQ5OSYOUR7deen5fCXtWOIzyDGGVYRCXTMQ0SHIWdW+7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=Il467r68;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=GgWoqVAS;
	arc=none smtp.remote-ip=23.251.234.51
Received: from e234-51.smtp-out.ap-northeast-1.amazonses.com (e234-51.smtp-out.ap-northeast-1.amazonses.com [23.251.234.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87E607AF0D
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 15:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A87E607AF0D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=Il467r68;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=GgWoqVAS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1792424823;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=wJNmKU58xAgxoa/KviAfa8I8qVK1OsW4hKhPWbnbLQM=;
	b=Il467r68EiJHGU9WPfNvfBuBCA9aLKRjmVqEi2GhxYIPEYGa2qeoFGdLDIROxk+y
	xakL/L9zy2UVshbyCpkWMiwChFiBHByV1OorfXgfjvJh4zk3F1jaj6Bz1MrgfCZWRYc
	uYo1YPOf+qpgAQ9EEK5U699+aVBR04jMqnLFa7xM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1792424823;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=wJNmKU58xAgxoa/KviAfa8I8qVK1OsW4hKhPWbnbLQM=;
	b=GgWoqVASP7/bjigY9NQpgESIigjcuKdIe0qMz7E48VgHxtAocHf2i0utsR1pAFlp
	a/NTylg/YDMR70In5GUMEccaePzL8nuc9MJoSui2TrRy62q7WXx+Csxh/dRVtCEgQ3/
	rwPlp4lESWlx4iG8AMoVLKzt86YaGFyuu1EzRazc=
In-Reply-To:
 <010601a1332f343c-b1381230-9344-4bef-a709-99e07b18d513-000000@ap-northeast-1.amazonses.com>
References:
 <010601a1332f343c-b1381230-9344-4bef-a709-99e07b18d513-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: [RFC PATCH v3] phy: qcom-mipi-csi2: round the requested settle
 interval up
Message-ID: <010601a154d848df-37257f7a-0553-43ed-93c2-4fcc5b690d14-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:47:03 +0000
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.19-23.251.234.51

The settling counter represents the requested interval in timer ticks,
with the existing six-tick hardware offset. Truncating the division
programs fewer ticks than requested when the interval is not an exact
multiple of the timer period.

Rounding the final division alone is =
insufficient: the earlier unit
interval calculation already rounds down =
before multiplying by six.
At a 599.9 MHz link frequency and a 100 MHz =
timer, the exact requested
interval is approximately 90000.833 ps. The =
truncated unit interval
produces 89998 ps, so even a rounded-up final =
division programs nine
ticks (90000 ps) instead of the required ten.

Compute the complete six-unit-interval term as 3 / link_freq and round
it up to picoseconds with a 64-bit divisor. Then round up the conversion
to timer ticks. Retain the timer-period calculation, minimum counter
handling and six-tick hardware offset.

Link: https://lore.kernel.=
org/all/sashiko-outbox-166399@kernel.org/
Signed-off-by: Jizhou Tong =
<fqwqf@fqwqf.xyz>
---
Changes in v3:
- Base directly on media-next =
d7e7bca71698, which contains the PHY
  driver, and remove the old =
prerequisite patch IDs.
- No source changes from v2.

The v2 CI report lists only the two prerequisite patches and names the
PHY driver addition as its branch head. This revision supplies just the
rounding fix on media-next, without asking b4 to reconstruct that series.

v2:
https://lore.kernel.org/all/010601a1332f343c-b1381230-9344-4bef-a709-99=
e07b18d513-000000@ap-northeast-1.amazonses.com/
CI report:
https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/11251022=
0/artifacts/report.htm

Validation: ARM64 W=3D1 driver-object build on the =
stated base, and
128482 ASan/UBSan cases using the actual helper against =
independent
rational bounds. The baseline fails the rounding tests. The =
source
file after applying this patch is byte-identical to v2.

The timer-period convention and zero-count rejection are unchanged.
Zero is also rejected by the base driver; whether hardware permits it
is a separate question for the PHY maintainer. This remains an RFC for
the rounding policy and six-tick offset. No new hardware test is claimed.

 .../phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git =
a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c =
b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b21e1a235b8397c4c84b25d869427..f07699ba1fde63536b4d63cc400=
8ff936f78cc7d 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy=
.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 #include <linux/time64.=
h>
=20
 #include "phy-qcom-mipi-csi2.h"
@@ -220,23 +221,19 @@ static void =
phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
  */
 static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 =
timer_clk_rate)
 {
-	u32 t_hs_prepare_max_ps;
 	u32 timer_period_ps;
-	u32 t_hs_settle_ps;
+	u64 t_hs_settle_ps;
 	u8 settle_cnt;
-	u32 ui_ps;
=20
-	ui_ps =3D div64_u64(PSEC_PER_SEC, link_freq);
-	ui_ps /=3D 2;
-	t_hs_prepare_max_ps =3D 85000 + 6 * ui_ps;
-	t_hs_settle_ps =3D =
t_hs_prepare_max_ps;
+	/* Round the complete 6 * UI term up, avoiding an =
intermediate truncation. */
+	t_hs_settle_ps =3D 85000 + =
DIV64_U64_ROUND_UP(3 * PSEC_PER_SEC, link_freq);
=20
 	timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
=20
-	if ((t_hs_settle_ps / timer_period_ps) < 6)
+	if (div_u64(t_hs_settle_ps,=
 timer_period_ps) < 6)
 		return 0;
=20
-	settle_cnt =3D t_hs_settle_ps / =
timer_period_ps - 6;
+	settle_cnt =3D DIV_U64_ROUND_UP(t_hs_settle_ps, =
timer_period_ps) - 6;
=20
 	return settle_cnt;
 }

base-commit: =
d7e7bca7169873b46e857c025c10f3336c1258d8
--=20
2.53.0

