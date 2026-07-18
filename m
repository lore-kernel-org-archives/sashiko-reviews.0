Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00828246BCD
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784372687; cv=pass; b=G0jG920QUGd5yrqoMnyDGYLzaX2j/o3GDHv+UnOVp8xvCdhBRSBBaB9umcHCTAJDZ4kru3CnDCf1XBvxOogPr4XQK2CDsdMI8h/nQO1pAMXFtBTZGUS/T+83ML3jlh777YcM3Kjxp22XWq3CMCa/A0NcGt7aE+/iWTs1OFLVyIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784372687; c=relaxed/simple;
	bh=9oXnPdc5M5kFL0zR2usbcRQetuEtaE9CxxIQBqFaYTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3yYIIsnQifqQAhgKbM0c9rpSVew22tAI/I3palpFnY3X8YvQuOxQuUU9jEU9X/MYGnHcky6RLSkxhsl9og8zSuQb3392ZcJZY23w7cPQpJgIztf5RMbwdaCM84aFOqsgK1nAmJJlZyRWRLA3tzdaUgSiaU3MqRNdHyIYcVJ2d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4ksq8hC; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4ksq8hC"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664b8b65192so1056228d50.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 04:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784372685; cv=none;
        d=google.com; s=arc-20260327;
        b=P+wPYwvtt4laU1oINtPIiCMjXKqgnnHbfcvkXbeQgaYJ0Qiq03RPJ62WM7BHRQfMpM
         8ziqbkJTsoeLo3HPSbJFQ5ZUank3RTL6mSw8mxYv7HEAiJueRaNkEN6/LvmNz77b6i9V
         RZttMJKi4mWwOyPFq+Byc0dcuBko9SAupFpDn1uWT60X6wKn1W5UNOGgzDCTLeJc2dtf
         p1zc/JcuNNiG61JvZt9Fn5itUMUljagCvYrJkexjwTmzGChu/Lg2Jk7a8J9I0h9qTu3T
         0jbyPZVCxUO0DgkdP8Zq28qzljY7p4gfVsaJuqi1nYmDV1SfsEVnGWRNphhYbnU2HQzb
         i3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        fh=xe4emxZEcQBVt02to8FaosjdLxA6bFQlvQ4JcI/FS7M=;
        b=VeqNm2/lmngXjBSDTpcXzBJftua4bt/EUyNL+AfhBMOPnfok676EIJj6lUtkf7LKtk
         Frcb4Q9GKp96hnwansvNXX3YpL2RBh6si75aiFk+aPRd4awMUXbPd/Xcx7s7WU2iUnjP
         wyF0gmYXz8yGf+Kri+Eu1hdFcOyEGEUNw+8zGGatSenbuvInJUeV7JSdHv4DdyBq9arW
         /ShG8urvXYUqSUPDAkcMRys6g2r8oF6D1kFW+z8XFR7n3DYCaIOX9+gZq6lELCilTlIk
         Kz89178idikKt9drubIXCTgWxH+NwHNxe1JiuqyUs/NGGzVl4vSOmUJ89inslAb9/vSo
         u9oA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784372685; x=1784977485; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        b=h4ksq8hC1DG2ywRLoNTTE80T6b6uw9qavtnL532osWti7orkE7it6Lcq8GvcsMO5tX
         u8Yf4EkpM81OavLUOyBSMndKn8UHPmMV8VoH2p9NCx03bigi9lrIZ5gDqxHQGpKePwRH
         /38PKNNMpc64ikFvx4C1L6lljmmi50TnosNmIlidVCjI7ERYTiDcHSsya3MY6Kc3e9hk
         K1QRKwww0pWiTdLx1tsa6cEZ3gG4UdTyc5GLADrBMNnfbgJhWmz2gPhYBIfXsIkscN5h
         pfP+HHsdO6klkwfzZarv9HqWkP2JJ0oGv1TrWJVc7yXsGxrtX7U8imsMZ8pGpmw8xClk
         bPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784372685; x=1784977485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        b=gIqq7o9Bwn8L3olkg2frFmGnYSKmpiIz5ADgGyw83rtqkD/BBIFMZjYYsh2xCPkHTH
         T+RbH5cXY7espwl+niS96jCyXi6SeO9nkc1SFqSLhxDWlXfB7CEaMWtujY/13/DfH+1g
         uZ+7ahoI6yUwE6UZeY9Nm1xWV3sc/HAGLeNb+senyO+hv4NcNwvDZMbjSRzNBDSwZQNY
         FHIWDPqXkpcdCr9XX8gJqAAFolJP+WBXEN/KnXu3UWVx7BxBMlDDriNQ16ibsaH1ZOPK
         qm3LsG5vc7AjqBz49LmGFo4nBSsIA77nytfeSpJXwe4AEJI/OQXOIN8rFLDOhkV+e48q
         gpZA==
X-Gm-Message-State: AOJu0YwFzu4Oo9JQ8Ui4AGnuBg22byFlreywT2CSuPFJAHH2BKB5lZaQ
	rBMZfw+HCPyW9+NGf3q3HPL3E6SevIkdoqdxGNcOu6B++QW2Q8JVXmV3ZZOSUgOhiba4pRRotx2
	zshyTfqmAH035fZvy06bGX8ELuJU+qUntqGQreaU=
X-Gm-Gg: AfdE7cm0tv/ikwwXkxT4TL0uTrjUmuFX/VF8XOHMDAmegrPqm5dZmYKiKBrcGeoaIOr
	yPGLquyX57tz62lOTGSDbugeidoi4w8Z+T20jtEC68yJsWB3XSvcE+vZVNtpbj6+KiSMAA8cAIi
	1dtCCA5ttx/FfdHpkv1xUW3burcOiZcYjVjPTGa9JDQVJRvm6ogSfW94U5RxYzT68qX6PKr9nB2
	D0IvniuFtqf3GpCt72SSpPSBfrIhnUQInyEs+birBbcSu2TaebsCqJqlguEJsJmvhgt1MhWWvEn
	GzLhirdWWo5wbgFKInyg9bnwcVHgYQ==
X-Received: by 2002:a53:b19d:0:b0:667:8db0:76a7 with SMTP id
 956f58d0204a3-6683be700d6mr1278751d50.9.1784372684813; Sat, 18 Jul 2026
 04:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-5-royalnet026@gmail.com>
 <20260718091200.65AE21F000E9@smtp.kernel.org>
In-Reply-To: <20260718091200.65AE21F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 13:04:33 +0200
X-Gm-Features: AUfX_mzv1PFiBSswpTxs5ztrtbcERZseF6OCGF3wFsdhSvoLcm5qvDBSH066Hi4
Message-ID: <CAEWPSH7CMoQB=ypHQvrV058VxpX_+Wdfthb9SJrHczVPZKqmcQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does exposing this codec to the ALSA subsystem trigger a suspend
> regression in the hdmirx driver?

Good catch -- this one is real. The audio worker missed the pattern
the driver already applies to its hotplug and res_change works,
which hdmirx_disable_irq() cancels on the suspend path. Fixed for
v4: suspend cancels audio_work before the controller clocks are
gated, and resume re-arms it when a capture stream is active; the
worker's FIFO error path then resynchronizes the clock and the FIFO
on its first run after resume.

> Should swab32() be used here instead to ensure the byte swap happens
> unconditionally on all architectures?

Yes -- readl() already abstracts the bus endianness, so what this
code wants is an unconditional byte reversal, not an endian
conversion. Switched to swab32() for v4 (no functional change on
arm64, where this controller lives, but the right primitive
regardless).

Both changes are in my tree, compile-tested, and will be part of v4
together with whatever comes out of human review of the series.

Igor

On Sat, Jul 18, 2026 at 11:12=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The audio_work delayed work is not cancelled during system suspe=
nd, leading to a fatal bus fault.
> - [Medium] Incorrect use of be32_to_cpu() for unconditional byte swapping=
 breaks audio capture on big-endian architectures.
> --
>
> --- Patch [4]: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio =
capture on Orange Pi 5 Plus ---
> commit 030cd8fd5334b79e1751dec57b1de1f5fa4e3df3
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus
>
> This patch routes the HDMI receiver audio to the i2s7_8ch interface. It c=
reates
> a simple-audio-card configuration to expose a capture-only ALSA card driv=
en
> by the HDMI input. The setup uses the receiver as the bitclock and frame =
master.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index 145986695720a..2a68610cddbc3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -37,6 +37,22 @@ hdmi1_con_in: endpoint {
> >               };
> >       };
> >
> > +     hdmiin-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,name =3D "rockchip,hdmiin";
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> > +             simple-audio-card,frame-master =3D <&hdmiin_codec>;
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai =3D <&i2s7_8ch>;
> > +             };
> > +
> > +             hdmiin_codec: simple-audio-card,codec {
> > +                     sound-dai =3D <&hdmi_receiver 0>;
>
> [Severity: High]
> Does exposing this codec to the ALSA subsystem trigger a suspend regressi=
on in
> the hdmirx driver?
>
> Looking at the underlying codec driver hdmirx_suspend() in snps_hdmirx.c:
>
> drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_suspend()
> {
>         struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
>
>         hdmirx_disable_irq(dev);
>
>         /* TODO store CEC HW state */
>         disable_irq(hdmirx_dev->cec->irq);
>
>         return hdmirx_disable(dev);
> }
>
> The audio_work delayed work is queued on system_unbound_wq, which is not
> freezable, but this suspend callback doesn't cancel it.
>
> If system suspend is initiated while audio capture is active, the worker
> could fire after clocks are disabled via hdmirx_disable(), resulting in
> a bus fault when it performs MMIO reads.
>
> [Severity: Medium]
> Will this audio capture work correctly on big-endian architectures?
>
> The underlying hdmirx_audio_fs() driver function uses be32_to_cpu() for a=
n
> unconditional byte swap when calculating the ACR subpacket:
>
> drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_audio_fs()
> {
> ...
>         acr_cts =3D be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
>         acr_n =3D (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >=
> 8;
> ...
> }
>
> Since be32_to_cpu() behaves as a no-op on big-endian CPUs, the bytes rema=
in
> unswapped, causing the bitwise masking to extract the wrong bytes for the
> ACR CTS and N fields.
>
> Should swab32() be used here instead to ensure the byte swap happens
> unconditionally on all architectures?
>
> > +             };
> > +     };
> > +
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718085728.67=
97-1-royalnet026@gmail.com?part=3D4
