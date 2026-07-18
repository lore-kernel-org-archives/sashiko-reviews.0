Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CB2571C7
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784372005; cv=pass; b=C7ZZ0VEbYA7FXPypzekYNAkoji9g9Uf2z67pY1Ng48GEGwPxKl9SHZRLG42Nf0P70kOH65NjILRzBY+cZduu0tF6hmJ/JaeJziwWG54a3nknK3l4McmSv1CRgv4sFyv6yvXoYKt9kL3R77VFJagUPMozvaObaqNJeWfOxp7dhbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784372005; c=relaxed/simple;
	bh=JGgwZZnE1y8KJOtlsAIYdBnf+29pDWlCFFjUwVetfQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0oSYjTp7HSwdCsvYSjfWr8nrB6tAWOrjyJfmT9FXfZ84Qwhnlxn58hebIRimEK1eeYsjRZsjASoA2OnXxSNrB5Y4WdF4Sm9TI0qsbYhxz/N/vNBdZhB+ETx69GmE80+jqLt8BX3EKyNF6xsFOiZ1pBTxNf9ykaewd5mQN9p8HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tOVpy34p; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tOVpy34p"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6681e786b81so448085d50.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 03:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784372003; cv=none;
        d=google.com; s=arc-20260327;
        b=mZQiVwCC2p1KlBxBWxjOvDVmTBkZSqan2FZ+CyaYMGIF3f0VPpxDWTNi+j9Dpz9SRs
         5turcjyz92QVk9VHL79SsF2Tr/N9necydpUF+OaN7XP+Al1KdgGQRe2OdOzOOH5Ch9ie
         yj0XW1b+mwvWeAqP0Kr4Px80131RppUU48N3NqN1RhNaZV2QhiwiTstR9pDddGqPrStr
         B704SY1Ts8niUPGQQwmE3kgWlzhZ8ZxZvtnJn3uCL3Rj4lzFGgih9fI1VXBigWx86i7e
         GMLB1Gr7KtxbLAIxUUk7xOIhi3rpDZ4hugkZKqCsYrc4vpWt8axwVioseKtXTUV1kOc5
         JE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5VfXhgwYuTBmwNIMAkrlRtJzbyswvn4JxfZ/7609S8=;
        fh=56a1th/CUASJufaIw28FFASBYJSxN4rIhmjwTOVHSFw=;
        b=fRva+Kqq51Duuwo6WhyWS2WAQDJ2W64+nA2H3FGQttitREbS/4x7fAOOxSZGrNzXVn
         OOqytY9+chfctH7xZUAx7GcFKXZ8/LsCjktW15z5Bv6m1abjben5LR9KLDsnQEAdITE3
         yhRitGdNLo1OY/zNiqF2igeqtXLt9p+y7//siuJnFzPfpRcLxsrImFDjgPLcUrFdMp3a
         0jv+RnYTgTO5+6QLNIqFXeGaEQUB7Pzw5p/kplcUicLbBL4acgkNtuXuznaMEAJD4YlG
         N0kz/aiIsFnU29BhHOunAUIE3WqOgiGOvwDkrUEbC09k6pPFScoZdXj3pyCNX865GG2r
         z6LA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784372003; x=1784976803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5VfXhgwYuTBmwNIMAkrlRtJzbyswvn4JxfZ/7609S8=;
        b=tOVpy34pW+WT98cZ6DND0+p124f4cekQGX+hCBhkWjd+YhNS9h81XbJ2zsp4Yk3Skb
         yBmh5MD/VqeMDYXbtwLKOteNQ584Vml8mGkZO2i6ER/FYiTZ5nbgdsfzAvNodH0Dj0TC
         MelizMAxr0bS8lItpOMYCQX+HUhlOfNSRg9kgtSHV/vO9zSk0hS1JVkcKSL8fY3zEK0+
         Txy+OwjoQroYf9jijbDlmUUoC2oamQtJikvGpsMw+9SITYgNQ/SHP3HRcUM89+ag0omq
         uhLRBCWCEYM0NYqpf4902GFgcEXGFLs2JEUQjCONUwFvOfBh5hM3ktcmumtUgBrFh3UJ
         F02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784372003; x=1784976803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5VfXhgwYuTBmwNIMAkrlRtJzbyswvn4JxfZ/7609S8=;
        b=Oo2b+Rq0mmQE0VUFV6ZV7C/d4+6vngJBBAI+7bBgMGtb9vwyIItB+fVa8ykCUWirjV
         cs4ip6gEd5O6dCtWgwZq1WSWbWxmGPb0LJ8KoE5Q4fN3qSKyZIMbtn22yED+0/vzF7PF
         n2uw6+QSQelBSgLGrG/jsy6r6sxFGVyn6bsyXGSvLpaPgzLdy2QVmVo3qrmH7lonmPsM
         l2yHaRVKLPOwqpMUTLlaHOnY1iBoeSmwv1fRrDnk5xhEYc2rY8H4Y/b3rj3IGUwUh2UM
         wC0Y2jI66J+NhNk7ABTVYp3ye3yuffXBg0ytqnHk6y2v6+7Ps35WzRHaoa8bFaU4UMKW
         3iyg==
X-Gm-Message-State: AOJu0YxBQ0X14aAaEvL/6lapYw0ZM3dlfpQO6whOtfsmEiicvq2Crp+A
	hslrUfzllr0wH0c51WDAMguh/ZWGkE/cIk50gNaW19uPez5x5dmqPEH3HvsvE3VBwdaFF3mKWhC
	o1QWknIIhrZjfqjCaYh9QE8mLnkEtWmV+1i9XQXA=
X-Gm-Gg: AfdE7ckjZtzPl5xfIqFD6GfB6zUv7ilLZOycL98/VIuQu18xRlhKxuoYFmH8nbfbeSx
	MJltd8ulvW/33VP/6FrsRJjlBfKC45afr6n06gbdr94Liicpi6Uo/LrtRId0RiEJG3uCqxtyXzw
	PG8faBthjqIdBeH/lD/TBKvZ4c6hyo3KkQcz4EggS8t2O1bn7HyqlSEh3tVMXqaY9j0o5qgw/0B
	hV3s7u+vM9qbXAvbRwPYaQhRdqhb2Zsv0mFt1qxCyDH9PVO5malFzyVUXR9vu5cc5PKI9/ktlfC
	zXhQduerEV0EFuoXVxc=
X-Received: by 2002:a05:690e:458a:20b0:664:f227:385a with SMTP id
 956f58d0204a3-6683bdde001mr1424612d50.6.1784372002826; Sat, 18 Jul 2026
 03:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <20260718090955.A79E51F000E9@smtp.kernel.org>
In-Reply-To: <20260718090955.A79E51F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 12:53:10 +0200
X-Gm-Features: AUfX_mwF1UuqQgMjQjfeJUF2YEeUCF9mcy5VYFqR6MQOo8I3upFsyKrktRhAwBs
Message-ID: <CAEWPSH6AFkMEVLJQxt4X554w47S6iVzupxh=eL_Rrfbcmb-hkA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
	media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does this byte-swapping logic scramble the extraction of the CTS and N
> values on little-endian architectures?

No. This is the same finding as in the v2 review, where it was already
answered, and the comment this v3 adds above the swap documents exactly
this. Two premises in the report don't match the ACR packet layout:
CTS does not live in PB0..PB2 and is not little-endian. Subpacket
byte 0 is reserved, CTS[19:16] sits in PB1[3:0], CTS[15:8] in PB2 and
CTS[7:0] in PB3 (MSB first), with N likewise in PB4..PB6. The packet
decoder stores PB0 in register bits [7:0], so the byte swap is
precisely what lines the bytes up before the 20-bit masks.

It is also the path validated on hardware: with a 44.1 kHz source the
card reports 44.1 kHz rather than falling back to the 48 kHz default,
and sample-rate switches are followed. Neither would work if the
extraction produced garbage.

> Can this lead to a use-after-free if the driver is unbound while an
> audio stream is active?

No -- the synchronization the report treats as missing is provided by
the ALSA core, and relying on it is why the v2 workaround was dropped
on Dmitry's review in the first place.

The worker is only ever armed between hw_params() and
audio_shutdown(). If a capture stream is still open when the codec
platform device is unregistered, teardown does not complete until the
stream is gone: soc_cleanup_card_resources() calls snd_card_free()
(sound/soc/soc-core.c), which blocks in wait_for_completion() until
the last file handle is closed (sound/core/init.c: "wait, until all
devices are ready for the free operation"). A disconnected card still
routes that final close through the original release path
(snd_disconnect_release() -> disconnected_f_op->release()), so
snd_pcm_release() runs soc_pcm_close() -> hdmi_codec shutdown ->
hdmirx_audio_shutdown(), which clears the streaming flag and
cancel_delayed_work_sync()s the worker.

platform_device_unregister() therefore cannot return with the worker
armed, and the devm-allocated state is freed only after remove()
returns. There is no window for the work to fire on freed memory.

Also exercised on the Orange Pi 5 Plus: unbinding the driver through
sysfs while arecord was actively capturing. The ALSA disconnect kicks
the reader out with ENODEV, the file handle is closed -- which is
where audio_shutdown() runs and cancels the worker -- and only then
does the unbind complete. A subsequent bind re-probes cleanly and the
card comes back. The kernel log stays free of warnings throughout.

Igor


On Sat, Jul 18, 2026 at 11:09=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Incorrect byte-swapping logic completely scrambles the extractio=
n of Audio Clock Regeneration (ACR) CTS and N values, breaking sample rate =
recovery on little-endian architectures.
> - [High] The `audio_work` delayed work is not explicitly cancelled in `hd=
mirx_remove()`, leading to a Use-After-Free if the driver is unbound while =
an audio stream is active.
> --
>
> --- Patch [2]: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio cap=
ture support ---
> commit b04bcd22f40b424aac824100715c46f764531875
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> media: synopsys: hdmirx: add HDMI audio capture support
>
> The Synopsys DesignWare HDMI RX controller extracts the audio stream
> embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> controller. Expose it as an ALSA capture device by registering the
> generic hdmi-codec as a child of the controller.
>
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/dri=
vers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > index 25f8ca0d6d946..22f50cbf3fa7a 100644
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>
> [ ... ]
>
> > +/* Recover the incoming audio sample rate from the ACR N/CTS + TMDS cl=
ock. */
> > +static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
> > +{
> > +     u64 tmds_clk, fs_audio =3D 0;
> > +     u32 acr_cts, acr_n, tmdsqpclk_freq;
> > +     u32 acr_pb3_0, acr_pb7_4;
> > +
> > +     tmdsqpclk_freq =3D hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
> > +     hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
> > +     acr_pb3_0 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
> > +     acr_pb7_4 =3D hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
> > +     /*
> > +      * The packet decoder stores the ACR subpacket bytes with packet =
byte
> > +      * 0 in register bits [7:0], so byte-swap each word to line the b=
ytes
> > +      * up: CTS is packet bytes 1-3 (PKTDEC_ACR_PB3_0) and N is packet
> > +      * bytes 4-6 (PKTDEC_ACR_PB7_4), 20 bits each.
> > +      */
> > +     acr_cts =3D be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
> > +     acr_n =3D (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >=
> 8;
>
> [Severity: High]
> Does this byte-swapping logic scramble the extraction of the CTS and N va=
lues
> on little-endian architectures?
>
> Since the HDMI ACR packet transmits the 20-bit CTS value across PB0, PB1,=
 and
> PB2, and because it is little-endian, applying a bitmask like
> acr_pb3_0 & 0xfffff natively yields the correct CTS value without any swa=
ps.
>
> By byte-swapping the 32-bit register, the bytes are completely reversed.
> The subsequent bitmask extracts the lower 20 bits of the swapped word, wh=
ich
> correspond to the lower nibble of PB1, all of PB2, and all of PB3, discar=
ding
> PB0 entirely.
>
> The same applies to acr_pb7_4 to extract N. Will this regression result i=
n
> garbage values for both acr_cts and acr_n, forcing the driver to blindly
> fall back to the default sample rate?
>
> [ ... ]
>
> > @@ -2784,6 +3052,9 @@ static void hdmirx_remove(struct platform_device =
*pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> >
> > +     if (hdmirx_dev->audio_pdev)
> > +             platform_device_unregister(hdmirx_dev->audio_pdev);
> > +
>
> [Severity: High]
> Can this lead to a use-after-free if the driver is unbound while an audio
> stream is active?
>
> The v3 changelog notes that the synchronous cancel for the audio_work
> delayed work was removed here under the assumption that audio_shutdown()
> handles it.
>
> However, ALSA does not synchronously invoke the PCM .shutdown callback
> when a device is unregistered if a userspace application holds the file
> descriptor open.
>
> Because hdmirx_dev is allocated using devm_kzalloc, it is freed immediate=
ly
> after hdmirx_remove() returns. Will the un-cancelled audio_work delayed w=
ork
> subsequently fire and access the freed hdmirx_dev memory?
>
> >       v4l2_debugfs_if_free(hdmirx_dev->infoframes);
> >       debugfs_remove_recursive(hdmirx_dev->debugfs_dir);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718085728.67=
97-1-royalnet026@gmail.com?part=3D2
