Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543440;
	b=HzlMN6AXPXBpQvleio2vFJOVgUurAA9r50VG+jvpOQbuqVkwcPHQoNMynYJxq0wQeDfu
	 3TudeF7matzzWNngxIZBOj3V2QLzKRMv6G93xQ0WkGH5kWZOfJkdzFR3PuSGxuqcWoWLw
	 1/mJrBs3V5UfZQ5UCZVz+F4U+tUk6/tZqN7G4omhpLY/tcBR9SrYZlWgDf6w7IhGaGB9A
	 jp9G2ZzQyycw4s5GQbGiKDUanDeY7EOJczah2urTMfgdDZjqDDYRvxqqbWMxChRJdyVpd
	 HMIK9gPnwlBGsK4JRNDqUqKXR7z1uYEHB7EHvXqTBmNH/wgLqEdrxnn43vhQPy3hesw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
	b=C1kJj25sjWTdwlC1UPezAVfTJacqZDtTlColBDJlcXlniHEfROHhpAG072ylM13L3c+P
	 IJacs88lg9QIR6BZLVSmEA5RWYPZwr9j6Le/v+NNbJKmpUxirGpH74oOGNEgMYmaYTlyN
	 4THcSlZ98GBcALHQZ3WC2sy9fmK47i5KEBWBp5XY6gb7YDqV+p4dGN9wDLw7XWWqoIYAk
	 8K57CTWTU/vqA/xg4hgB7WFrBpr5c5ezc2iywFKZ1R93D9NS1QD/iTvYNCgOad2s9KRLa
	 7EPsKJcajs3XoSbPAiX2REmjBrvmMrlAi8BTdllYiz3yT0C6OPf2Xs+zek9f4+BGGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkbnj3VC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A7606A33E
	for <sashiko-reviews@lists.linux.dev>; Sun,  1 Nov 2026 14:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2A7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkbnj3VC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so23314985e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 06:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543438; x=1794148238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=zkbnj3VCKEWfCJj/gnAx87WYrJIY5cCr1QdZM6gBFBfVmxp0/FQyl7a8eDj1UZ/eAb
         5qtN766QOpyBd8CUs/U5NXJoWhgMVM05CU3CNyEXjwq3aeC5aHt1TtrrddF/fUkz8F50
         IilI19gNpzwFwbUnFJKM7/g0kaTMrRQMqUGgGpCnPe89BwQ800fCoj/Icu3Bv2b+sAjM
         KIbj4xxX6/tBcNbYrAQYg4GHmz2Zn5kKg5Xf7qFZz1tqSYYY+k0/ylR/061VUzV5TgmA
         hG458dMY9ZUeWrvE/2mSXvgtcdkRgn5ODm03tflvw6mRkDTydjtfEZJ4N0sSMXrWpWew
         1Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543438; x=1794148238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmzM1He6Zcm6h21veWQ/ul9U4i6SIDSSoe6SFpMsROk=;
        b=AH09SGnpCedIkbVTYNBfJutdGpUdNEbclmGgR+0kH+rqL53hq0/JBgO7mXcQH/BjfV
         9G0PVbIlO4z407/E7kbhtCnHVH4feXeidBC010A8u2q02iYKZL1JU7ZvDIqBVuxqan9n
         Z/1hCg2Tp+NFza0b24foluYf6v74Zb7AOYheRhQDU1oBE5wdk/J6MLZIZVC5Yz0pL37F
         XJTkVnfRZMnst64wDZ/Ba2Gnpf6wIckigi/QMitw2gHEOd71xDb/aRytuR8/2Nv8zp0J
         DnytdUKkClABZ7yx+T1qZU3Z1OAWEc8fkJf60cpJZIQV9XFmz/r+j8v3IR3RUKu0QpDy
         S92w==
X-Forwarded-Encrypted: i=1; AKwUvBwHDHAsI1xgoRpphjhvTcknezUe74kyyvg+msFIwwUkfTjilXg2kXr/lQVQOuehTbkx4yv5ziuen9tIhSAHtwU=@lists.linux.dev
X-Gm-Message-State: AFq9FYL1PXBurysckdX5hTeGTi1Nmykbo4VT4o2wR8l7oJBa1oIwH1+H
	bkCzafRQkP4ZpPBSCUlGp3xeqdqtvFxLWkn7xxKr8DOyN+6myo/Boib2
X-Gm-Gg: AYBFou1Af2XNApR7vvyPKQfHg76C1hjde2av7cMw1Ka6rCAI0lSJ6qM85ew4xTfKa3z
	YrnbYBfw8ImdJJ//TC1VTUyO64QuWRX0WwlpB/92iijQOSeL8PcelWI4gcSb8DJhZ5jezexozSN
	zAERhU6jL/bEN56fk2rw6GOWpGYrfaqL3FNlIfj5fO/qy8tc0lh3j/ZIEk8E0fikLHk5HEhqmSX
	NcZ9kwqwQBNg+YTJAXDswFrbLZiVoT+rpyclsFQ+1PxXEpm7bdU5PEa2VkOcN8p0Pj0lvNEPJsq
	BkH3pZKqxS0/dP0b1fijECi4byhQ3bgRySKtM2Z4pkP95ejbcmqMdsOY5K/gOu4jKS8V+GYHvXY
	rv5OsyG51WCO3ByGeSnsPAkb4K7cu0exaFwsUW4hVFQa9JkUKmrIsv2r9Ty914rFMmAS6gogNXY
	NF+2A67bg0myxdPA6zbwxnqT1PXYKgTD4axTpVEfoZaFaDA9uEGaJ6kROr0dT16HNKV4A62emjm
	xFszuCxysSXrABz46h8Q2hF9Ad+h286usXTY1u7wyvE4Pj+L9XX49AIjmJ6pY5hAx3YpQCx2cfq
	s2C7PYZm6fRtmKzg62gYotbV9YDyvcZ5bBDqWLkto3SL6pzTCgPKiFKJdQWnxlz7MRnWwORomjj
	YYC6dDlv5pa0oScNdxuGoyRG2+uDoH4nKM6p9ZQWUXRFz8g==
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr184744515e9.29.1793543438534;
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:38 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun,  1 Nov 2026 15:30:35 +0100
Message-ID: <20261101143035.880469-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101143035.880469-1-romain.tisserand@gmail.com>
References: <20261101143035.880469-1-romain.tisserand@gmail.com>
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

When the RT5631 master clock comes from a SoC clock output, nothing in
the codec driver keeps it running, and the clock framework turns it off
at boot as an unused clock.

Get an optional "mclk" clock in the I2C probe and enable it while the
codec is active, from the PREPARE bias level, as rt5616 does. The rate
is left to the CPU DAI.

On the GPD XD (RK3288) MCLK is i2s0_clkout, a mux between the I2S clock
and a 12 MHz oscillator. Handed to simple-audio-card instead, it is set
to the stream rate before the CPU DAI sets the I2S clock, so for
12.288 MHz the mux picks the oscillator and audio plays at the wrong
pitch. Held by the codec, it follows the I2S clock.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 sound/soc/codecs/rt5631.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index f97fd24e42..d523d6d3a2 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
@@ -27,6 +28,7 @@
 
 struct rt5631_priv {
 	struct regmap *regmap;
+	struct clk *mclk;
 	int codec_version;
 	int master;
 	int sysclk;
@@ -1536,10 +1538,19 @@ static int rt5631_set_bias_level(struct snd_soc_component *component,
 {
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	switch (level) {
-	case SND_SOC_BIAS_ON:
 	case SND_SOC_BIAS_PREPARE:
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
+			clk_disable_unprepare(rt5631->mclk);
+		} else {
+			ret = clk_prepare_enable(rt5631->mclk);
+			if (ret)
+				return ret;
+		}
+		fallthrough;
+	case SND_SOC_BIAS_ON:
 		snd_soc_component_update_bits(component, RT5631_PWR_MANAG_ADD2,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL,
 			RT5631_PWR_MICBIAS1_VOL | RT5631_PWR_MICBIAS2_VOL);
@@ -1726,6 +1737,11 @@ static int rt5631_i2c_probe(struct i2c_client *i2c)
 	if (IS_ERR(rt5631->regmap))
 		return PTR_ERR(rt5631->regmap);
 
+	rt5631->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5631->mclk))
+		return dev_err_probe(&i2c->dev, PTR_ERR(rt5631->mclk),
+				     "failed to get the mclk clock\n");
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_rt5631,
 			rt5631_dai, ARRAY_SIZE(rt5631_dai));
-- 
2.43.0

