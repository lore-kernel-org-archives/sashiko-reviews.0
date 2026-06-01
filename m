Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC4935AC3C
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340765; cv=pass; b=bvoZZe0iLvvPRH8STKRcJr1TR/9U0lRW1J4ubg+BZn9+/ZGEerXIQLTkKjGKMSLMXHMRsBEXEkdnKbh7BoEuMGEhh/diKkRX/4zQGzN/axA8t6+whnkqSHFu3WaNhhwpMgPZi+IIlm8bdD833uGhgrX7GOvJDhe3NlziOmdscew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340765; c=relaxed/simple;
	bh=dsNHqGMwTUPlrUfe55QMxdZJILtC75BjFNl1GeWCT5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6nRJvrCRCTMnyp2j82ueg5bE4oFYvxSXFMq1ZTUGT31MvpgLGot9cfkkK1Y2sS65K9COKOL/+ZHUFKzhLze7z6yze3eDMrueMOeIXgdt5Nrc5qC5WIsqOwt2QDwL0o/uvX7ajwgxTBnurA+sPXlH7dfqF6GjUubfUTgXRThU4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjUpP3N2; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjUpP3N2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68b2229b48eso7713792a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 12:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780340763; cv=none;
        d=google.com; s=arc-20240605;
        b=HMOXDlHNJTXbihLRouF7PBitpyKLmzjuUMCyBcAGL0emoWVB3ei08S/R8H5Tz4KTgI
         zWmdL4XL7j+1TPQcJcl32JW1FFcYyrsSFnvRJXy7r1xQ2At8Cbc8/Cloi5Ju65+9t9Fl
         FQHtRqTW6x+o4cBiV1Hh3c/oTbjpdhu78TgZFW8pEZuX2Z25cypGUW4gCS87K8HG1pzy
         MIlHDnBO3k36A8OIWGPQwRzn2GOrsJSO+G0OMwptPrcnjUXMXrx5ACLn39UVoLvVdrvz
         hQ7tUafqUUqQe8mRlM1wYf51Z68KUB8Rw8phhkixM7buNWLhi0CuiaHLZp2jvbxz3qiG
         DFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ToRh5cKTPUe+pKq487HFcup2FxYOsRDUpBYxyNWwsg=;
        fh=CevGES2AFLxh77zkXsdBdBroN5O9WERkcETXwr7159A=;
        b=bhzPJtHAczS0HVtrDsoqRf7R1jebqcDv8jKUuSNzJF5yURv2dSWLfAGze1sTqcWluA
         LPsEDvMredCBjK29Ju2GLgOaVJiKnNQirigjZrK/E6ibDePeUeaV9429rXFYnCyEwEYI
         5r2u0PLY/HrT3s5Jt9TcsVI1Soe42EM7fhWpOrVTqvdWO9pp2lvkDgHISzMzTFUV8FI7
         SffCGM52IEfz4twP7+WGydOa3Qvcn13kuQJQQ9EEqaWSqmzoxBUYqAXaFL5vozveYupD
         XIYhdwWjnFk5pEL4Cup3lgtdUB4Jswl3ZNSox60/LaDdn6P2gN+pEL2LWt8E+MmMicQ+
         k8Qg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780340763; x=1780945563; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ToRh5cKTPUe+pKq487HFcup2FxYOsRDUpBYxyNWwsg=;
        b=AjUpP3N2X+Q/Gtr5BOQFp+yw0WypEOlyM2Z3uMRFIzhmjvm+2TfCdYNVSuFdg5wtCV
         riNcIXXmhQh6OsBJRC4AjVuMsG3KNNLMkIKoPrZrE8XQSkKqC+v+s56dG1owgzEznWjT
         WU2b8pqQO2lh/AHn1AJxdyF6G/QKyRUmCCY69UHuDbqYKomC6mA328pSM69eM8vW9JXm
         NNjPtmgg0fv6RRvdLgIPA4QXl039qyhqVHEzdV4w8No+ZqGO0203fS05Q6FalAaxWDU0
         tz1KW2+nM11alqgL6qpcwco4s+/raPBvk6Bsm3x1YJyaCrvUzU6LOD4dSxrKkMsE9oLL
         PlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780340763; x=1780945563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ToRh5cKTPUe+pKq487HFcup2FxYOsRDUpBYxyNWwsg=;
        b=jl8s16Bs5Wyc7fmjbs0LwJeDBKCbujWkrH6xMAj9mCLKxmrme0nJ4T0A6sp2C7MOrJ
         P5KuyJUwF5qyJ6c5ROo4mIBPKqCwzRtc6qo8rcEjKOQ3vCWwZVFeM91gTsYYx9Hwn43k
         lzlq0UCCGHtQ1bRSbiGQTOXytxniWBuflzS1FWyqCkyvtcv3eUTxzZrWotAZStojT4c+
         p3uwGzqgbWGOSSAPJ62hAUuPP8KiGI55yFQtbM6PtY6JYAcsj8FdueDdKKZ2OXJdybvT
         /8a3mGQo+9HsegNC0pJUmbf/lpqB6hzf+F9FUzjsi3qBnPEuse1C6iLQoqp9K9qS+bDs
         8GAQ==
X-Gm-Message-State: AOJu0Yw6ztFBXTjkZ+RTSX+mv6eK2Mo+mPHF0EH68FjfU+tcck0XP1fm
	+1YCnr7pqMMHk85eG8CvvILG/X2LuRTtKybuQQL7rB3BUSpvwYG2alyQiskXyobk/hliilWnXvU
	lQ6BV6G6zyZTYE6Q4y8bLmr4KZZBPy0PUbA==
X-Gm-Gg: Acq92OEUwgQP+NRNhJ1/S8+nqPlnjLpyTHsw1/3hRxqVB1avaqyGZrpYHfyCh5DazUO
	dPKkrhbVHFfM0q4QcIvjPi6Fi8r39It8IPD6D2sc+flSdXLlJ30MSXPffubo8lMT9baQD6LL4No
	nW9+7hmgYK1oPMf/0zAJanFGQHJ+F8gGYVLduU5Aspd/pE1GdPIWmnJ9sr61O1QduhubBwnilal
	zpIM+TFR/DZLPRHweHXokIP3bl10Qy1Xaba7VkZCLmBcWoV6hIMR4b8PwkPzdwACpvcF894tNc7
	Buzm0yBEi2f1GVxjRNlcXQB4z+rUV1qZKLaWbaDkmaxYzAwiHZjG2ShjXPrgaaW0mp9AFmYYdqD
	Q5fgSrNWmf3YXCf5h307Hs+uob2oJxp1Pz3JIJ176zA+CgXb9zl82NGVC+MiybEPksFoo
X-Received: by 2002:a05:6402:321a:b0:683:75ec:c17c with SMTP id
 4fb4d7f45d1cf-68c8b1eddcfmr6022796a12.10.1780340762242; Mon, 01 Jun 2026
 12:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601183359.11343-1-rosenp@gmail.com> <20260601184409.C1CF21F00893@smtp.kernel.org>
In-Reply-To: <20260601184409.C1CF21F00893@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 1 Jun 2026 12:05:49 -0700
X-Gm-Features: AVHnY4KnIMcoYyn6BxHK4-bEmZR9C9G0FfA-ZjB3cx_hF-FLZ-By-coC51D4ZXA
Message-ID: <CAKxU2N_8V9A5fcp7JWQWorPsU2PdKj=uiCV+rs9BAs-to_DctA@mail.gmail.com>
Subject: Re: [PATCH] ata: pata_ep93xx: fix double free and ERR_PTR dereference
 on DMA error path
To: sashiko-reviews@lists.linux.dev
Cc: linux-ide@vger.kernel.org, dlemoal@kernel.org, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 11:44=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The PATA driver fails to initialize if DMA channels are not avai=
lable, breaking the PIO-only fallback mode.
Yep. Makes this patch completely pointless.
> - [High] Trailing byte transfer logic in PIO data transfer truncates 16-b=
it values, leading to data corruption on big-endian systems.
> --
>
> commit 01fbd237d0698dff8591ae6c458732b482391c35
> Author: Rosen Penev <rosenp@gmail.com>
>
> ata: pata_ep93xx: fix double free and ERR_PTR dereference on DMA error pa=
th
>
> This commit fixes a double free of the rx channel and an invalid pointer
> dereference of the tx channel on the DMA initialization error path. By
> NULLing the tx channel before calling the release function, the cleanup
> is handled correctly.
>
> > diff --git a/drivers/ata/pata_ep93xx.c b/drivers/ata/pata_ep93xx.c
> > index b2b9e0058333e..aa6f8172925d5 100644
> > --- a/drivers/ata/pata_ep93xx.c
> > +++ b/drivers/ata/pata_ep93xx.c
> > @@ -688,7 +688,7 @@ static int ep93xx_pata_dma_init(struct ep93xx_pata_=
data *drv_data)
> >       return 0;
> >
> >  fail_release_rx:
> > -     dma_release_channel(drv_data->dma_rx_channel);
> > +     drv_data->dma_tx_channel =3D NULL;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but since we are modifying the
> error paths in ep93xx_pata_dma_init(), does this initialization failure
> unintentionally break the PIO-only fallback?
>
> Looking at the start of ep93xx_pata_dma_init(), if dma_request_chan()
> returns -ENODEV because no DMA channels are available in the device tree:
>
>         drv_data->dma_rx_channel =3D dma_request_chan(dev, "rx");
>         if (IS_ERR(drv_data->dma_rx_channel))
>                 return dev_err_probe(dev, PTR_ERR(drv_data->dma_rx_channe=
l),
>                                      "rx DMA setup failed\n");
>
> This error propagates directly back to ep93xx_pata_probe():
>
>         err =3D ep93xx_pata_dma_init(drv_data);
>         if (err)
>                 return err;
>
> Does this abort the probe entirely on systems without DMA, rather than cl=
eanly
> dropping DMA support and allowing the driver to fall back to PIO mode?
>
> >  fail_release_dma:
> >       ep93xx_pata_release_dma(drv_data);
> >
>
> [Severity: High]
> This is a pre-existing issue, but could the trailing byte transfer logic =
in
> ep93xx_pata_data_xfer() truncate 16-bit values and cause data corruption =
on
> big-endian systems?
>
> In ep93xx_pata_data_xfer(), the pad variable is an array of 2 bytes:
>
>         unsigned char pad[2] =3D { };
>
> On the READ path, a 16-bit value is assigned directly to *pad:
>
>         if (rw =3D=3D READ) {
>                 *pad =3D cpu_to_le16(
>                         ep93xx_pata_read_data(
>                                 drv_data, IDECTRL_ADDR_DATA));
>                 *buf =3D pad[0];
>
> Doesn't this truncate the 16-bit integer to its lowest 8 bits? On a
> little-endian CPU this evaluates to the correct first byte, but on a
> big-endian CPU, cpu_to_le16() places the first byte into the upper 8 bits=
,
> which are lost during truncation.
>
> Similarly, on the WRITE path:
>
>         } else {
>                 pad[0] =3D *buf;
>                 ep93xx_pata_write_data(drv_data, le16_to_cpu(*pad),
>                                   IDECTRL_ADDR_DATA);
>         }
>
> Will le16_to_cpu(*pad) zero-extend the 8-bit pad[0] value to a 16-bit
> integer, resulting in 0x00BB instead of 0xBB00 before byte swapping,
> ultimately writing 0x00 as the first byte of the transfer? Would casting
> to a 16-bit pointer better manage memory across endianness boundaries her=
e?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601183359.11=
343-1-rosenp@gmail.com?part=3D1
