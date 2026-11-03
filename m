Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713178;
	b=d8VIbh5KBZZ2gjq3CexiYU60eRD7B0yWT4H/MzrEYsdS6mQy5GtAL+G66Efy0EWCV4lJ
	 cABe5rBjc2MGF8eNbm0462odnIUIjCTRD0+HX2irRUGoXJ44kEH5bcGqjNZGuy8/vbiXs
	 bfpk66/kjexmx2I8DUs/a4040PP53qSDqsh520wW1FmaBOt2i6O1tqNwYyU2Kfru6XEmd
	 6bSeKcwXj+4UB6Svtdd3YBrA0eBYuHxc2Ni737y/wlif4eLLT3RRcycg3U8K3s7Lt3B06
	 67ieeYJJFa1eLHNEhUcieGwUxsxN1CPxvZVNFh6Cuk2dp/g00EuDL2M1/iGr1yQL9FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
	b=VzWZErCLELANPPlJK7pHbVATgGB0tZBfUtcb1uaC5GK/FHuGoWIVWczkwr/h1IyBcEWc
	 DMDZC5IOcMXxy9LdCXCroGQqvVxO4y+Yj3AeUXkUv6n2OVmtxc4p/QJeSEdVfgyGUJ0xb
	 X/urdHMrMhI9pdhBho28dc7lc5PvIaMQW6Vh2NN7MBkphCClVXhnS4oX24Po5rCVlSAsV
	 egiJ24gVtcK5Nxl27YYf89bOdadJi4w/u2oOGtp5hTED3aX/grEUswl8HSo7TfxCmpRBo
	 jbBI+MGDIafpRW02OEzahZ7E11A44GZgP/6YJd9BO4xhN61e1+ptya7qTuW6DmdhYhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbTQ1AWP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366FF606A331
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 13:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 366FF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbTQ1AWP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so26066955e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 05:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713177; x=1794317977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=bbTQ1AWPt56hxQiTJLA7+KxeZidPy0UAldQ4KmzhrAmRsuFNZuhtXWH1JSqs3abe5b
         WqFRhaso7dGRoOuJyNf5pc1jCbVV/mj3p5nTFH/A3fJuybUPlBQWQCe+oBJXVBlXAr2r
         NS+5wdkB8j8N11rHtXD+bvovjeIvUvQLbAHJjXkiDsSp8YUe7YU3PrSLrLiciPPUEmq8
         LI5la9h+P/KXtJCKhiIjN/BHlp239bScMUfl8lI9Is7VWR0YaauqCbJrVeiyR2tBGJjv
         t5fo/rLV3ojHZAYIwHc/ExVyZ7dhzZxv0yYaH5Ch6dE64dIEZ90edFzVJVPGfWSicbsD
         t3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713177; x=1794317977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=T3isQBimU96V4SNC3sJ/sfRrJzF/cjE1nxv2FIufhudzixgz3Mbbg4l6a2RxTQiRNU
         bTSJPt4mbbmaH9OA7nr07cj4n032gfRla6QG9moozR+/5MHXKt530hyw91visMWYJYYy
         dtURfKUoD6Pr8HeKZ3u3d+Izb4vsJmdCuya+AH0HmFcpeGA+6EEA2FmrQfsXRmiRO7lm
         BgHk4t6/PkJvHEazAoFFTkjN5dudL+ab3snc8C3lHUTUxTN5c0lrHCDyoZwTEgwcU/hh
         s7U6NW5ozPIrLTct+Cm3NyzMNAlGIv+zCgYvzlDf1wMivGT3I83SsjyIYf5YL8WFf+SU
         +Drw==
X-Forwarded-Encrypted: i=1; AKwUvBw7H/dsy+7I+uM+yK5KqLETMwM7U8x1rViPny8PNLxgsFo1GRrVkvyRodqUhYID7JVvSJ/HuSQ/Krc7r+mGDz0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+1N5rRbd8DU3oe+XCRbp+qp83R7v8LtZzuURprtwux7+nVJOCj
	7XLbg4Afs/wzkA0r3Bac6B8RdjFPaMn4PRZQAu7RnVTNFfsc+IczsMEddvRgZJusLuA=
X-Gm-Gg: AYBFou0/EBEreMYgx7uYUBtWW1ADROGe6cyt9FVOOj72S456tTnqw3EILFj7or3bdv2
	aXgO9eh660QiwW+srCK1z40HKxGZFN+vnBJ8VwsUVoe13+5qPeb9vALdVT1NYv5n2iTl0pihOXU
	EMfmhnz4WfWTJBXDsGnWQRkXV4NCdlkYaBP7SIkOwfV99n/ta7hOMjRI/sUVFC49tpWeFiQi55y
	34zzVZjvP2IQqUMh9zZhHblql6L93jl5TL8Y4JB60n1bCy380u7T+QRSRqhGQbkmc9JImrMGYka
	QnT0bGFZjGBL0XYQbVM+anN13e1RHXudtNpH5RDMXQJib2nGDrrB/MuivORI7M9tDiZEOYgpo6x
	8p63abSmN1hFl20zC0PDWGGmB0OvDj5GOBjZWi+04U3TeIzROHtb3Bpkzwxg0CnZQR03vESlzIN
	7IhEyBiEa8VF687fuFDCbS/adrQ2g/FlVgduJvxEjaZMclkgbp2cMii7o23tswBdge+uiMmraxe
	2b/GjIdv26QjUX8/e1j3ANGV5bBeRbVQHQDxo/kMp82ETsaB+H+E4pOnkhTGjyvJjSYqX2QACTf
	6xUOoB5rm+En0RebG5Y5WIQN6WVktzbZWL/DZpVyzYQaMXM5JynpwGStizKGssDX1K0G57B/VTJ
	LDI3J0iB5bq0idrJrbhyreyVrd6w0rMygX3gDsv0DvCz7Yw==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr319276755e9.17.1793713176492;
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm24174999f8f.24.2026.11.03.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
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
Subject: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Tue,  3 Nov 2026 14:39:35 +0100
Message-ID: <20261103133935.2892210-1-romain.tisserand@gmail.com>
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
feed the inverted left output to the right one and the inverted right
output to the left one ("Left HPOUT Negative To Right HPOUT Mute" and
the reverse in the A23 and A33 user manuals and the V3s datasheet; 0 =
mute, the reset value). The driver defines them but nothing can set
them.

They are needed when a mono speaker amplifier is bridged across HPL and
HPR, as on the PocketGo S30 (A33): with the same signal on both outputs
the speaker gets almost nothing. With a mono mix on both DACs and the
inverted left added to the right output, HPL - HPR carries the signal.

Expose them as one enum, "Off", "Left to Right" or "Right to Left", so
that the two outputs are never fed with each other at the same time. It
defaults to "Off" (both muted), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, no warnings. On a PocketGo S30
  (A33, mono speaker amplifier bridged across HPL and HPR), first with
  the bits written by hand while a 600 Hz tone played (same tone on both
  channels, AIF1 DA0 route "Mix Mono"): with PAEN_HP_CTRL = 0xf4 (HPCOM
  driven, no inversion) the speaker is much quieter than with 0xf6
  (bit 1 set) or 0xf5 (bit 0 set, the other output muted).
  Then on 7.3.1 with this patch, same tone through PipeWire: "Headphone
  Inversion Playback Route" = "Left to Right" sets bit 1 (0xf4 -> 0xf6)
  and the speaker is clearly louder than with "Off"; "Right to Left"
  sets bit 0 (0xf5).
- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..7188b498fb08 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -314,6 +314,25 @@ static const struct snd_soc_dapm_route sun8i_codec_mixer_routes[] = {
 
 /* headphone specific controls, widgets, and routes */
 static const DECLARE_TLV_DB_SCALE(sun8i_codec_hp_vol_scale, -6300, 100, 1);
+
+/* For a speaker bridged across HPL and HPR: one direction at a time */
+static const char * const sun8i_codec_hp_inv_enum_text[] = {
+	"Off", "Left to Right", "Right to Left",
+};
+
+static const unsigned int sun8i_codec_hp_inv_enum_values[] = {
+	0,
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE),
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(sun8i_codec_hp_inv_enum,
+				  SUN8I_ADDA_PAEN_HP_CTRL, 0,
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE) |
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+				  sun8i_codec_hp_inv_enum_text,
+				  sun8i_codec_hp_inv_enum_values);
+
 static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 	SOC_SINGLE_TLV("Headphone Playback Volume",
 		       SUN8I_ADDA_HP_VOLC,
@@ -323,6 +342,8 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	SOC_ENUM("Headphone Inversion Playback Route",
+		 sun8i_codec_hp_inv_enum),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: aae83f3931bc3a5497bcc8351b5f954ad7ac895c
-- 
2.43.0

