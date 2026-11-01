Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543439;
	b=xkSvr2hEdZkJrS8EM6Z/zNlnNoZCF+fzsd7bmBYK0X6+4X4SWQxvdXp4ugWhDUBLhSC7
	 WoLlrwbe+ghDtjVHwmSjWydAppIIPcN9cJ9s5aB4MyhBAQdfd2Ibjai8gkf6N8nhDl6uJ
	 T5lwW0dQXvqmePl+JtO21U6NdMR+EhJITD28yHZ06FqCmYye6xt0M7wYvagmhS1o47pXB
	 MKgdjhbqywkZR12QRq/1kpBeNxeaG9RuMewcRuiLjmb1nyfVQK0GWeI1odypsWI4vBpte
	 XpIs12SiR+G2RQGcVZeZnZ7VF9GbQuEeR5u1qy2BciKU0OYRAmrAkEdCfiwGQBkSWag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
	b=IL2aS3b8IoYTnAw2gMgnP0QFanreuOIG9icBD6jPLWMgHnBmTlal+5x3JaZKNjCdWt8g
	 jU1LRrnzzeeAQVb/1UDAdtLMygAd7HlRxK4Rlx6D8Kc+921KXXiV/aq/hL62h2DsnmQ9v
	 C7Mtpd+PHaHdDujUuuwD2+YwW7Sy7ESIP/iSvAgBVrStzhHwxLXMghFZXmoqKqKx4AWVo
	 K3JfaOEuDxIO000SSDwNQGzRyExzJ15nWF6zIddrEKpELhHqHJNh+WTrQu3R7GEpv0Xg8
	 a4HtQ6L9oMpDHgHFca8hk9wZXhrCL/XbzxffaKydUMm2EMia3sZRq7aLUQew2jxI+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0f4Sgexz;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEEF606A325
	for <sashiko-reviews@lists.linux.dev>; Sun,  1 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEEF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0f4Sgexz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so12387525e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543437; x=1794148237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=0f4Sgexzib5NRDoc+D+2tOI4yaFzU9XGjTkgFZtFeKTHb71MNwTdlblEPQMYSR1ovS
         ZcZnOr/3yKr3yXlpJuv1XsxntUyKg8Ia8ehRSOLffN3qTZXjtmcAFGj4Z6D0rbGQy2SA
         LOL0V9JVIWpYOHvDVQy2ULSyexkl2EZkVvvCGoY8FflkbTKF+smvbADIDtaxDJnSnGSq
         09hZG02YQbSUb+lD5lj+zDgMyXWkEggSOzAtK3E7Uyy7mpzEyfPqftIGaUZgNvdl0HnN
         oECG9Zp+Gkc5+ZPy+SQPJHiamuGf/rX3ii3xj3U4ePd5hE1RWSLjIy6z50KHJKsdq800
         iBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543437; x=1794148237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=YfC58GIVisctorHC1Xd2VGripPXt3CbgCmtPV5AU4iUhTN3f0hdjyq2/5v23OQWNlP
         J681XLa1PZzysWgE4CFXasCzRBexS3/ZqLKOUEXnX0LN29veffgqkqL8MINV/8KNvOtu
         9VfC4ChrZ6h+K7551mfGessuOMa6hnPfxt0VGeP56g+F293JUOfq1SeAA/M04v7t1w/S
         GmLd1jWs5VaBoFbXoTODbrkGvGsuH4A8jacZKR/u6pi1etF5nPUR4imMOLIIANlEbN+Z
         bhLP1HgoWfOaHsjCJV+ufN5/HyBw1hB0YJjYJ1eiseDagQ0hxcTyGgXa2S0IInPWG+pt
         ypVg==
X-Forwarded-Encrypted: i=1; AKwUvBz6EVTr1TCeTIFJj+GBkWblO8BBGiYClDcP8EtT7k748C2MoqBHxc5u1RwPv8L0AGVzF9XnomQZZ6yiUJ5DRYA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIOasEeNSAYtKuPIc455Q1qCn3DTBoqC3FlCDmIepXITrwSrQNz
	pzvkW5M8+D7chJrYNZvoci6hRY9fgfhm/eGdAvpeR6B20Bd6YzWtCEb7
X-Gm-Gg: AYBFou1ncFnZcXAJIcwjVFOOMhfxLT5KY7hGSv+kov6YK8lQ3Nax0moZlOuTXMNcEJU
	NYnW5jFr47g5MKShmo1R7Et+gGHAZO5ztvWscndWzxVip4rJC8a7hfz1/xltz+sEgfccP7I8+SR
	hNQMv+ewRsuIBMatoRRBe4qioBqYSqgXv/qeCTpGH8hFpaTK1lskU2bkDH5RS0RK2/aGyFZDF0E
	XG/NqmFI4DOHB9k41ZvhiNqfU1KE2wHDsS62NITXgxz0FNQQRIQHe5AYxw/XqBdxMnpexZxPoly
	yBhWeRKE/A8WN3C5L8A8GUrw1XXvUTPBex8gdXqkNP5ieux6c5W3Z0eKqT0LJvi4itXTyIKK3VM
	FU8aYEqXmfwQlfzzgCQHmQQm3amCE4SmuqwEFfEn9itgJuEn8hssmZUELfONrmtFmsbTjSfiR9A
	RNCR13KfkXtN9jJtOPFQCBqcX+KSirrm8O7n5W47+N9KoTLWWOzZR8/uQ87Z/60nnnhWOKYHrsk
	K5DSo9Y6hLAEkxzSeFBU5guKeUT8pmHnfSfqVbQ4L704XHYWWQEKyXQV12k07uADset54KyaLQW
	b2+0TGfpHvjf+9FGkc4yCrrLtrf8F6MlaHk7Sy2C7HtXx9YDxB/VxMRkyUSc1elRhlFVgW1uU3c
	tbLBZlnNoqhFml6k9u0P7N2pzAWK8jAlT2sBYQ3mGrfuwSQ==
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr152423265e9.28.1793543437168;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 0/2] ASoC: rt5631: Support an MCLK clock from the SoC
Date: Sun,  1 Nov 2026 15:30:33 +0100
Message-ID: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

The RT5631 driver doesn't take a master clock, so when MCLK comes from a
SoC clock output, that clock is turned off at boot as unused. This
series adds an optional "mclk" clock to the binding and enables it in
the driver while the codec is active, as rt5616 does.

The board that needs it is the GPD XD (RK3288), whose device tree is not
upstream yet. Its MCLK is i2s0_clkout: handed to simple-audio-card, the
mux picked the 12 MHz oscillator for 12.288 MHz (wrong pitch); held by
the codec, it follows the I2S clock, as on the RK3288 boards with ES8388
and MAX98090 codecs.

Changes in v2:
- Patch 2: get the clock in the I2C probe, as rt5616 does since
  b5c9df40ca56: from the component probe a deferral was lost and a rebind
  leaked the clock (reported by Sashiko).
- Patch 1: unchanged; picked up Krzysztof's Reviewed-by.
- v1: https://lore.kernel.org/all/20261025145354.3476371-1-romain.tisserand@gmail.com/

Testing: dt_binding_check for realtek,rt5631.yaml; W=1 builds for arm
(multi_v7) and arm64 (defconfig) with SND_SOC_RT5631=y and =m, no
warnings. Tested live on the GPD XD (RT5631 on simple-audio-card,
mclk-fs 256) on 6.18.54 with this change backported (the bias level read
uses snd_soc_component_get_bias_level() there): i2s0_clkout stays on the
I2S clock at 11.2896 MHz for 44.1 kHz and 12.288 MHz for 48 kHz, and
both play at the right pitch; v2 tested the same way, with the clock
taken in the I2C probe. Boards without an "mclk" clock are not affected
(clk_prepare_enable() on a NULL clock does nothing); not tested on other
boards.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session where I
asked it to fix the pitch problem without the RK3288 clock change that
was refused in 2014. It traced the clock ordering in simple-audio-card,
proposed taking the clock in the codec driver following rt5616, and
drafted the patches and the messages; v2 follows the Sashiko review. I
reviewed and understand them, and tested them on the GPD XD as described
above.

Romain TISSERAND (2):
  ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
  ASoC: codecs: rt5631: Enable the optional MCLK

 .../bindings/sound/realtek,rt5631.yaml         |  8 ++++++++
 sound/soc/codecs/rt5631.c                      | 18 +++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.43.0

