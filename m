Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795744833;
	b=bo2JMRdnSq+r32FOmMDi1OIS7nnx5vIfK61tSgfYLqeHUFBpUau+RIUZ4/PRwCdpdI5F
	 hCyhAH6lyKKJ1T8B8Z49xISR/OTOYXT8QohF6MNuNkZLMNbo66jGzrW9Wss7xW4vnb4fI
	 /SIcKm8HQ5hc+kOvy917C7zvdO3JpmPqMVW/Hdnz1SW6CIOmVn+pjCWvsYnvVRkLGsQJG
	 B+PdetVImm7s6JhQMPCLqcrg0m2WlX02PpU2GankZQUPUAbV106I85NfXlphCdDW8rs4j
	 D9jDl+thOLwzV/nhQEPck23rMiJCitHmsZqNiQqHoBbX3I+cCNuPzEs3I+zzeJl1INg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795744833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
	b=kE/u8NQVnUmhbwp+eK4s24cDuix45oBldDHIGquYNBRz+5sR3JHzi1eXXzBV+n3PVu3o
	 gHjkpjnnjQewHrDg/BKfpzwE+OXRKqC0EUk5+7KilKka5HzvZYI9TeWEDh+wcbZFYuAYy
	 UcfApoXe6Zyf1oKQ1lDMrlr9mqSapq5UD1uKjhDplTxEz6omfhn2+lgLukh0aWGl279tA
	 oXY80y67zcHBexEvgIxgrWxYtE065O3mmH0ln8iI1v15wue5oCm0XIqLN+hnHrr8pOu8R
	 /GArcVFs9LUCzethappeLqM60ssNIlpdKUnd+qse/g3/7BZgM7uIp7wwdQ1j0xAsTLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahDbzzRh;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8231606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 02:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8231606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ahDbzzRh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso70488195e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744831; x=1796349631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=ahDbzzRhyo3zwbfwAL1VYQ9XVnNZJk4yoa0P7DFMXWibCFm+j2L+5TtXCcQiRSgJ1H
         qsM8MoLfxbMAPbyvIWvTT4SAz9zOUXGu4HeOq9OSd0Ces3Le5uHuqfvvL11M3qYUGmdV
         CJGtuwZpRgOka0Xuatod6xyX3SqwSIm45u4qzGTpj//iYlD5sDlNT1A9FgXEkcaOSNcT
         u1eMwNzlIsWb5mMNsAs91jvwtZNUu1mE4F2m9UbPm7oOHdN8UJScsf9ayMErj1EVYo0v
         b19krF+cLgePKisHP5WFFmu9XmKd+koz4wDAe738PBgaAZSi7lPWxzUVyIabIpU7DuOp
         sNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744831; x=1796349631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=lbCxv1oLG3qh/GULNVvcrh4/tK1kGuxnTEb/PfEYD2ypkGyZxV53LpLbwsGhT/A4Hf
         VtpYu1XvR62U9VRKyQ1UiVsDtzVwvRqNouq49lcSAFChuaS5RGdnw0C2iu3Ijpt+wv6v
         +yPqVHqFLDwUlG2mRy7vbZuP7s+LTrq32etQo/oQ+/WcLWd1Afm9b2WRUVjan6iNWcr4
         9PbynZ4gDoXCUOgznR8wW0TqoiIw2Sy6/ceCOkziVPRY9UFN/+VUtxaHZvZvTa5esxMn
         nahCkSteq3QhjFJr6mWhtGah86zGkhX/N7nImxiVpDGJRCV4LnQc2IGfMnD/bN7i84M5
         T3Fg==
X-Forwarded-Encrypted: i=1; AL+hErGy+Q9WdLYaOcJh4CA78LBRoEbqJPkRPK0X2VSULs+NED48d2LhOeX1EjcMUAj13xO6UMShdb/RYkeHR8NwO24=@lists.linux.dev
X-Gm-Message-State: APuU4Z/bHKEVP1R2wgxGKRJiyTXeftbRvBleOED3YiOJ2vLfm4usGhpn
	JNYLZfdb5zG9LyBZr5u8eqgld0qIPrsDs1U49SGPuqXMejPve3/HFgUA
X-Gm-Gg: AZFdTZdTX9RNy5UDDtrZMU/zTLVV2HcLp4Uy9PDv84M2Bn4HWyMDB0Am249iRt7PO0h
	4epA63ud3RD1cosr0uqnHkkC7OKFp50lGxfj1BZH61Vu0rhHOmTmCdeyFcvFIyZffsALzkp3re/
	Qfa3kFiB4/yfjQJzo5cMFOIuuhha/KD8/GLcEkIpy8d5i0asrHWmSVMCLbhi/6vj1d6fAw+Eob6
	qfN/w3leMd7aOTvb2YIPrZV+Tq2lSezuavIHeJtRcs0G6xfNUTpE1te0tHEf/Tuzgs7OVY575RJ
	bQxt4G7Su2vkbEznVhVhY/JcjGHCdsoYO3BKgfosNidpXdCuZUWxp6tX7JcVNn/0lIXbSQM0Zol
	4JNWxM+Nfs0HqBTEUZ9YN91PWFKjvEpISntAK145bva7IEaBWzjFt6UqrFe/Uyqo3IriayZW7Hm
	7IMa0Lgp/Ba+DdmBrFB/tk+p2F5PVlj2TaHOulwba1DCL3he5x27rFQHcDYOdPEFdYkdroN7ZDz
	PqZFhgHRYvAGbxxWEW3BIl5uSVLiy3aNf1XV17+phMqjJYnxmzH0ML9xSO9IhCFSJuuMUii0ohL
	Rfpf2Wiy5WZ+VriWdmOrzkBVcz0WWnFLvxt2zC7ZNVfPn91Wboaq6riQIAc9r6IFHZAz9+H5eUr
	Ri6rhmwarlilUKMMJXCj3+7fQWBla7dUCig1sr3Q3pPwiXA==
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr468130625e9.16.1795744831000;
        Thu, 26 Nov 2026 18:00:31 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm44994364f8f.2.2026.11.26.18.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:00:30 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2] ASoC: sun8i-codec-analog: Add the headphone inversion switches
Date: Fri, 27 Nov 2026 03:00:29 +0100
Message-ID: <20261127020029.1618525-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
are "Left HPOUT Negative To Right HPOUT Mute" and "Right HPOUT Negative
To Left HPOUT Mute" in the A23 and A33 user manuals and the V3s
datasheet (0 = mute, the reset value). The driver defines them, but
nothing can set them.

The PocketGo S30 (A33) has a mono speaker amplifier bridged across HPL
and HPR. With the same signal on both outputs it gets very little;
setting bit 1 makes it clearly louder, which is what the board needs.

Expose each bit as its own switch, "Headphone L to R Inversion Playback
Switch" and "Headphone R to L Inversion Playback Switch". Both default
to off (the reset value), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Changes in v2:
- Two independent switches instead of one enum that kept both bits from
  being set together (Mark Brown). With both bits set the S30 speaker
  goes silent (results below), which does no harm, so there is no reason
  to forbid it in the driver.
- Commit message: describe the bits by their manual names and what the
  S30 needs, without a signal model I cannot back up.
- Link to v1: https://lore.kernel.org/r/20261103133935.2892210-1-romain.tisserand@gmail.com

Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, and =y in the A33 kernel
  below, no warnings. On a PocketGo S30 (A33, mono speaker amplifier bridged
  across HPL and HPR) on 7.3.1, stereo path (AIF1 DA0 "Stereo", headphone
  source DAC), 440 Hz tone on both channels, listening to the speaker:
  both switches off (PAEN_HP_CTRL 0xf4): quiet; "L to R" on (0xf6):
  clearly louder; both on (0xf7): silent apart from a few clicks. (The
  test kernel had longer control names, which ALSA truncated; this
  version only shortens them.)
  Before this version, the same bits written by hand while playing, with
  a second tone on the left channel only:

    bits 1:0     both channels    left channel only
    00           normal           normal
    10           louder           silent
    01           loud             loud
    11           silent           silent

- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..e24fd7bd0613 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -323,6 +323,13 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	/* inverted left to the right output, and the reverse */
+	SOC_SINGLE("Headphone L to R Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE, 1, 0),
+	SOC_SINGLE("Headphone R to L Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE, 1, 0),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: 9f961caa18fc4678067232f8f021a23cb1588de4
-- 
2.43.0

