Received: from e234-51.smtp-out.ap-northeast-1.amazonses.com (e234-51.smtp-out.ap-northeast-1.amazonses.com [23.251.234.51])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646104718CB
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 02:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860096; cv=none; b=rftURPQt3qBfjuuqmceLhaGIuNz9WaVtxY+bc0eQen6xIEXPW0ulXl6UMBu3vzFu9J+oy8MYLpoKXs9Xy1Bfz8y+A3Vrklo3ZzWrfMvd0iTyVelvMsVAFTyaeplSBLEx9hJ6JhGqo75y1MyToW2EpK4MQcCsDad5qu0q2I3dCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860096; c=relaxed/simple;
	bh=R5dUOAP4FxM0ylbvQIr1OGrrL2192Rwy0KCDgnHxHf4=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=nDgnsMRX7A2HeZGMOk7gz5lk7L7FRcmUxC9YaUD+3EicBfiSa0IVXBYYLKB0Ud+Ue764xd9lvSfTz7BIray9Fr9X4YInUttOdqc9iL/TDsqq4Ai+hN7t4+HAzMv95JhbAY35v+8t3mOOmc6SKUCw1N4oaahOpoCxr2Ap17l2UKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=6VL0XphO; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=DbHmXFu4; arc=none smtp.client-ip=23.251.234.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="6VL0XphO";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="DbHmXFu4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791860094;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=R5dUOAP4FxM0ylbvQIr1OGrrL2192Rwy0KCDgnHxHf4=;
	b=6VL0XphOYUcNFSyr3gumygH+LJYIDRlZzxmD9eqX5VQV7PhRHMPEbTjId42jUVpr
	opkrEvFa20OYuYJfXFAjA8pTLk3UzCr7fb7B0ZTuZe7OpsCmDRMpfD7dns81zGrqywV
	Z2vU9ScuWTeB1J2JaHZf6YNjGwuLXLTrr4olNnek=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791860094;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=R5dUOAP4FxM0ylbvQIr1OGrrL2192Rwy0KCDgnHxHf4=;
	b=DbHmXFu4cx2dckbJu8Tadik+98oDobw6QcqVjmKciH+ruRMV+Uf2wkx+siR13uBr
	IZLSmS77MLHm+4DnQwPSO37TR7phd1DtHv2+qrjUDqtyOHo15AlvMHzUp9QJuXxtfH/
	bKzHRpi2fTKfRrf0GKAdygFyvDpVBM+Om7P320Mo=
In-Reply-To:
 <010601a1251fbfb9-9afc4070-5194-4714-86b1-5358791e7770-000000@ap-northeast-1.amazonses.com>
References:
 <010601a1251fbfb9-9afc4070-5194-4714-86b1-5358791e7770-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: [RFC PATCH v2] phy: qcom-mipi-csi2: round the requested settle
 interval up
Message-ID: <010601a1332f343c-b1381230-9344-4bef-a709-99e07b18d513-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:54:54 +0000
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.13-23.251.234.51

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
Changes in v2:
- Round the complete 6 * UI term up =
instead of truncating UI first.
- Use 64-bit division for the =
link-frequency denominator and interval.
- Add the 599.9 MHz counterexample=
 and rational-boundary regression tests.

v1: https://lore.kernel.=
org/all/010601a1251fbfb9-9afc4070-5194-4714-86b1-5358791e7770-000000@ap-nor=
theast-1.amazonses.com/
Review: https://lore.kernel.=
org/all/sashiko-outbox-166399@kernel.org/

Rechecked against media-next =
d7e7bca71698 on 12 October 2026, which
contains the v18 CSI2 PHY driver and=
 still truncates this calculation.
The base/prerequisite metadata also =
permits applying this increment
on Linux 7.3-rc5 plus the original v18 PHY =
changes.

Validation: ARM64 W=3D1 driver-object build and 128482 ASan/UBSan=
 test
cases using the actual C function against independent rational bounds=
.
The v1 calculation fails 410 cases, including 599.9 MHz / 100 MHz.

This remains an RFC for confirmation of the hardware counter's rounding
policy and existing six-tick offset. The timer-period convention is
unchanged. The v2 arithmetic has software/build coverage; it has not
yet been isolated in a new SL7 hardware test.

 .../phy/qualcomm/phy-qcom-m=
ipi-csi2-3ph-dphy.c    | 15 ++++++---------
 1 file changed, 6 =
insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m=
ipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
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
72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
prerequisite-patch-id: =
ab0db8f40ef87320e67543686702109ac045784f
prerequisite-patch-id: =
d6b3dab26f8a95822465a176f691280a5610c22e
--=20
2.53.0

