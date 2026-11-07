Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794064169;
	b=4j9nZmqi0SIi+cBvFg0F4pnS3Hc1ZdJeiwHma23+A9Kgh1hlLPcZupyyGAepf8DfjHa6
	 Vaholr1oGU6/e4z+aLEwt3Ea+2ojA5uqt1EZdzE36aayt/NS5yCFpkV+WKCv39ef4sgVw
	 jIP+vv3aKGIq3o/KVnfDIRFgtDUvd4dyTdgmiaFT68WAn2czy0zx8ke03Gnk2HU5f8Kun
	 Djusfj51KM12QowyOT2fzd+iyrL6rxbZsMwiDqGN4a9SPUYlK6WdOHRyE7v+VLNlgko3M
	 u9to2mspTBfoqIYUdUhLYryw62Z8tEs4MsDr+yf2ryp4lNJdSsY6h7+NfJ5iGN+YiXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064169;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rc5hBbbo2msUTIJOMG6pG0hWQS/2UrnL95ThmZ6N6fg=;
	b=1X73HPNkqtxpTBzBOpcALYP89ujqbyJCP35DoDbsdAHRSqBTmuL0u4YZikoCYY7/WYfT
	 Wl+ZNld/tsMYkp38KgSJ/m8d3ryipE4k1k9XP1c8gJeHNKqCvg0Li58QPHBBsJmaLEOSQ
	 BEnH7m6FO9epvNyBQcT2Pd4R8X28GeB8PBsBFQoXQiija2cDbxk9lG4Dt8iLmSE22uxMx
	 TBAy8WNG11bJQHvOktaWXVXFnd0MSGRClwT+yIp71Dn48Bv3dgc3dOFDBkRG8dN5sCEYQ
	 6BHzarp4deCfIJvW3sqaOrbwSEsHJe9waQlR5yquaafSl5VLo9eHEmazS2MqDxcaSRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=do6hHgQG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06881606E8DB;
	Sat,  7 Nov 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=do6hHgQG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892FF1F008A1;
	Sat,  7 Nov 2026 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794064168;
	bh=rc5hBbbo2msUTIJOMG6pG0hWQS/2UrnL95ThmZ6N6fg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=do6hHgQGv1oynIhZN9qTojV0qfoJlnlWt0LEyMHESWmJW+zTIW7Wf8fbxj2EMmIv4
	 59jfBOYXe12U8yjbNO4W+IbAZYm2xsYC9R577MKNKHNyRTj7JHYJFxS5xI396mrds1
	 WoBCQCjtsAXiubY02Hdflu/eLUbU2mD17o0GgGU6Ig5Sa75MXeFdWJsJ8/CGDm3250
	 FjsGqgcFlbN51Lz8YQT/35NTqu5gXorUtiAb2Lm7A1BlJjea9CPBYsA4cuDR0lsjAC
	 ++raA0yHXHDJnfqX+onS2tXAC9/i79pRoUHRvi5YvbtETTI8MPpucF3FbyWlnblDWl
	 POCCxYe6eVgHw==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v24 11/15] media: qcom: camss: tpg: Add support for
 v2.4.0 TPG
From: bod@kernel.org
To: sashiko-reviews@lists.linux.dev
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, 
 neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <sashiko-outbox-193294@kernel.org>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-11-d6b8f3f6f66f@oss.qualcomm.com>
 <sashiko-outbox-193294@kernel.org>
Date: Sat, 07 Nov 2026 15:09:24 +0000
Message-Id: <179406416444.650304.12581893664974319470.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2380; i=bod@kernel.org;
 h=from:subject:message-id; bh=Sf4TggOlKXCPUOfI4MjCGnRVILqaMiV7kPhZX483Ud8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7z8l8ik65l7DQWlPmiMBBxPJpaUljD9V6COVF
 WLGow+qWheJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau8/JQAKCRAicTuzoY3I
 OneyD/0aRTIlGSQLtND34Hgout0mOA/8FWfDrSubsMYNlvokmw9WUhtXmSBdcIfnkh7F43XeWtW
 57U7TkyRfvS60Q1WH3RG+ufxpjXtVRuac8Co5q0pg4hHqCElh8c23p1Fl6rAn2BBSwLdS12HdjY
 WHW+2+AxyCze5BTxAfyfG07Qx0SJu8jLIYpiOjRTubruCV+RvPGI7ecwD2xc/J1TwlT+F5IrMJb
 G5CEr/iQ47S5se5RfN0y2QvWojZu1JI1/ukJaSWL60IuoS9qY88cnqnK1YUDYOKEEpXzNVXDt8Q
 aVtpdvq2YThDHjqhBXBJ/3+C2diIXw3wQ6Viu0OB6NW7YC7K21tcSL8uu1s4cIGzbqoZ4ldQiDN
 hOfi9pS+bDnSlR7JmEoQxn5OnDp9kdy9PYR4alh41mgDwVHttfhxiIVzaB44XFYO5CiNsbFHW5y
 soZGbQ+yyeDlp9OeCEbhWPx5GMP2Kub/qxr9KJvLEDru/VrP3IcXH+XD+Q3Q7u1SHb07Y3PMabF
 xdqOo+vTN2yddeQhdbiUTqDBXZhREE0k910ngTYmjSyDOWVsEH3LAfOdRt5/2auc6Hmox620C2C
 bLQl0Rt+awEfXHxdki+a/60EZ6EvXVYW+xO6rMmnR/cgT/EilRRQRSx4ZAzF3BZ4ZjBwRIq3Tgn
 1ys8goMeH0rrCbg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-02 10:52 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] media: qcom: camss: uninitialized hw_version check in tpg_reset()
> --
> 
> commit ea18d39e5144ca1e8d628aa5ab708e84983e10a3
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: tpg: Add support for v2.4.0 TPG
> 
> This commit adds support for TPG hardware version 2.4.0 on Kaanapali,
> controlling test-enable and hardware reset via the TPG_CTRL_CMD register and
> routing the TPG output into CSID 1080 RX through the CSI2 TPG mux.
> 
> > diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> > index d29de5f93c18e..cabbb2638cf38 100644
> > --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> > +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> 
> [ ... ]
> 
> > @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)
> 
> [ ... ]
> 
> >  static int tpg_reset(struct tpg_device *tpg)
> >  {
> > -	writel(0, tpg->base + TPG_CTRL);
> > -	writel(1, tpg->base + TPG_CLEAR);
> > +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> > +		writel(0, tpg->base + TPG_CTRL);
> 
> [Severity: Medium]
> As reported by Sashiko on v17 [1], is tpg->hw_version initialized when
> tpg_reset() is called for the first time from tpg_set_power()?
> 
> In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() calls
> reset() before hw_version() populates tpg->hw_version from the
> TPG_HW_VERSION register:
> 
> drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
> 	...
> 		tpg->res->hw_ops->reset(tpg);
> 
> 		tpg->res->hw_ops->hw_version(tpg);
> 	...
> }
> 
> On the first power-on after probe, tpg->hw_version is still 0, so
> tpg->hw_version < TPG_HW_VER_2_4_0 evaluates to true and tpg_reset() writes
> 0 to TPG_CTRL even on v2.4.0 hardware. Should tpg_set_power() call
> hw_version(tpg) before reset(tpg), or should tpg_reset() read the version if
> needed?

Hangxiang can you have a look at this, seems credible to me.
 
> [1] https://lore.kernel.org/r/20260929061248.E035C1F000FF@smtp.kernel.org
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com?part=11
> 


