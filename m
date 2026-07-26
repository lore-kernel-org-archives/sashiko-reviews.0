Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF984A33
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 00:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785024149; cv=pass; b=QDN1fGThB6M/Y2PSs1FDyIrgwx0nEolqGmyMeWJNy276AqnGyxJPamr/KbZXzEOPYMF76+JWED5ynJZVjrmzOJNnj2kaJhMk/djDSWLgojjFL5bFN68rh/lEdLPMOWAAfTp/6BajjNeOp7SDKe6v19/IVUf2IFvMV+DLd+azgDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785024149; c=relaxed/simple;
	bh=hGMDwQQLThygxY83szVLHDeO1j19/dPpyXJ0IV8ZMk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWC7uYV2nJ33H0JTcIc6c0PLhzddrEYnvNxYF74wC+nSJkN3j/yGhklF4suPCv60GaH4/281ZKX+VQ1uFXHMghROZZgAX5xYbxDJ6AjPw4hNYJ91OG/AXjacDxXIY3Z4NOH+m+44EIosM0AnuNQjlePnZYJXJUVv/gB20h8Ur5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMb+5/TS; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMb+5/TS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1846091a12.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 17:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785024146; cv=none;
        d=google.com; s=arc-20260327;
        b=WiULW9owchomlvoKGuJ6XL46j8LusClJE7SkCQs5PzHVO/C3xCiOvpfaQ97Ra3p5kH
         +joTYOXF/ewyD03fDtI7QiXF2KCv6k2h+mjXBXzIXl2HExuzYRNmN70gdEjVxBNYAbfx
         L5cSi/QXNKxSMXgubdyFFAjjA4dxqsOgxO8QJ5p6DhZSV91AUTA5nGfAmsgAu0Ztt+DX
         WzuGHttmREpHElTcSWlIpiHqQ/wT8WZIfYKnP1lgIc1e7J9FRjhImZ+MiSsVfVEL5rEr
         NIbZpqAAPrP5UzK1K64kpuMoi3V+gRedGHV7qTTxSfr6pi2woeYQzuGneYTRrllBpC2a
         bWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OFM/TCyOucQ/FV/J6qU4TAWprxb53QsM1x2T+kKVBU=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=b/XIu2g3vrvAshV/CMtdGtPhNs3jGUwUQien1cfFa2vKFDRWnfbeEnCJ2WywPscztE
         +iWcCo9IeIg5uyQrH0lop6YGHers9pAr7O0QbcHKjjx3PbLwV4OEb4QAaN+lr/BeAfa6
         ykExX8trZCfRrquSjKEBuKQFEpkQjV4ZiLcsckrQN1W5mZgfHyzzdO5sNPsjDh4Zzdkn
         1xmEOvUzap4QtwRzoMrPpDSteksu8JkxAdXKIAnrOVG+MrncEJHZuxttM60FcklbZmrn
         wTG/+PPtfuFp6E8oXh1KSyBZc5jiXDilvopZdLMXEoSwsBSo/u6G+SnN38TI47Q7hSjt
         jH0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785024146; x=1785628946; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OFM/TCyOucQ/FV/J6qU4TAWprxb53QsM1x2T+kKVBU=;
        b=gMb+5/TSnnr6+i00+ZlzJRQtlCXcx+VXpjCrWFIogg4LuEJbwLR1E+QTa3Le62q8Sk
         VlRyVUmxKEhPHpEmeMKGxfHDOCO/CRsgmROsVKPefqwK2QpUai4xr6GDAe71uHViVLBF
         BWQyX6v4ntXVGR5b3UjgbfZ9Hpi/q3SU9VFDd+UigF3LQX35cXkiZJERm321a9Ir95ye
         EBagosnKc5n2crpQ9tCu0drW84zI/9NhLpbtmfCqTll4I2KLwT+hSzgeCHL3y/tcuqUB
         tfHnIYvL9pfZwjQRQwh3Vl6m99oUjqg/Tz4a4RbQhCAeMLXEibGLvzSC1dQW+U1izbv1
         QUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785024146; x=1785628946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OFM/TCyOucQ/FV/J6qU4TAWprxb53QsM1x2T+kKVBU=;
        b=EMCAsladl2+miU333DrtifkAmiNLmmQOjYnMcDCX1Q9G1golsMfrSy91WXa5REjgca
         p0GQ51Ssr10NHLGOY6cnQ9b2Wum7IErq8NBiZxH775fkKrcYEb1zrv3Ko/Ww/A3P7tar
         gOw8L4VnuuwX6bG+MClqBfuSf4DckuIXAShHf+3n9r+0CqpAUyBDvkPGCeRNX55FagTe
         CCA/WNYf+LSvLJsZhh3yEXOvOoM1vJnlZWg2rM6utFryE6k2KnuztGiQ/fz5eKQex/k+
         4IGbFgJUAVpHUtmj0QOQK1V1rFVNzHbyfSkTGpw9q1c86TVdDor3f0aoWB9Qy5FfXChn
         xMpQ==
X-Gm-Message-State: AOJu0YxEOTTIPhC1WIj1xXjIvZ8K16t55grmiGcp/o35cxy8zwOtl+/3
	pFsxzFK1IZN6f8k4zFoNrbs3L+ekOPj0V6BSWXqAXapZSe5dpdPi85WJf7ik99Sqg0kIFgEDrmU
	skB1dMPLQ/gX7qZS8uW8t4L5JaIAQzdHmCQ==
X-Gm-Gg: AR+sD11JAa8QLB8gReioMQFCa0XtoIZHRiWPOptC49ho83uebKhPJDpMxMQIp5zEUF5
	PC2pw++9nS+cdweqBhL3TcTv+5nQ7wc33d5qc4/3a1ESXzgH0FOtmNVLvGKpC89S+Bb9CKhLYGa
	ODa3o+P44t95zZU1fp5bVQdZUsucJRw+JY+TP3isSAJJfjYzj6gJpg2UCX+3JtPIsXsE4dNQIza
	I5uvs9msLRJzFcN1IPgIc49WvUZ8eMdGG047W34z+mdlaZo14f+dh4MSQClfWQcpY+VvvIiNyam
	VtHN41H86OZfOddpMEfNcsJiE54xG9ivGZnOAbrVXjYmc7Htx56TxzgjB+p082RhwkF5UfqDdbE
	ef05moi5PLYMP+zZjyCS+c9g6m4J21lmo2FcmyyCTfzpxg6KT2MfegV+WLkvP+bJICxUF/S2W
X-Received: by 2002:a05:6402:2693:b0:698:3b7c:7e52 with SMTP id
 4fb4d7f45d1cf-69fc118cd72mr1268009a12.40.1785024145825; Sat, 25 Jul 2026
 17:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628231049.1248899-1-rosenp@gmail.com> <20260628232120.0511A1F000E9@smtp.kernel.org>
In-Reply-To: <20260628232120.0511A1F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 25 Jul 2026 17:02:13 -0700
X-Gm-Features: AUfX_mzkRY6Z8kZjUsSyDR6zqqIZ31wwydK7R2vmJU3Bx1SrmlOEVAvbSgYCMTQ
Message-ID: <CAKxU2N9EvtEGzaowAr4J0+0F9iFsd5j8jmL7JTAqBWDPfanoaw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: fix nvram size
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 4:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Heap out-of-bounds read and write in `brcm_nvram_add_cells` =
due to mismatched logical length validation.
> - [High] Fatal page fault due to `ZERO_SIZE_PTR` dereference if the NVRAM=
 partition contains only padding bytes.
These issues were fixed separately.
> --
>
> commit f8d0bb1af13fdcf08114311cb9160479fcd6bdb5
> Author: Rosen Penev <rosenp@gmail.com>
>
> ARM: dts: BCM5301X: EA9200: fix nvram size
>
> Fixes:
>
> [ 0.182121] WARNING: CPU: 0 PID: 1 at drivers/nvmem/brcm_nvram.c:85 brcm_=
nvram_probe+0x400/0x480
> [ 0.182159] Unexpected (big) NVRAM size: 1056112 B
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> > diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/ar=
ch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> > index 5bbc2ba0f9598..87569408bb695 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> > +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> > @@ -26,7 +26,7 @@ memory@0 {
> >
> >       nvram@1c080000 {
> >               compatible =3D "brcm,nvram";
> > -             reg =3D <0x1c080000 0x180000>;
> > +             reg =3D <0x1c080000 0x100000>;
>
> [Severity: Critical]
> This is a pre-existing issue, but I noticed a potential out-of-bounds hea=
p
> read and write in drivers/nvmem/brcm_nvram.c when parsing NVRAM partition=
s.
>
> In brcm_nvram_parse(), the length check validates the logical length defi=
ned
> in the header against the total partition size rather than the allocated =
data
> length:
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_parse() {
>     ...
>     if (len > priv->nvmem_size) {
>     ...
> }
>
> If the flash data defines a header->len larger than the non-padding data
> size but smaller than the total partition size (priv->nvmem_size), the dr=
iver
> calls brcm_nvram_add_cells() with a len larger than the allocation:
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_add_cells() {
>     ...
>     tmp =3D priv->data[len - 1];
>     priv->data[len - 1] =3D '\0';
>     ...
> }
>
> Can this lead to memory corruption if reading from a malformed flash
> partition?
>
> [Severity: High]
> This is a pre-existing issue, but I also noticed a potential page fault
> if the NVRAM partition is completely empty.
>
> In drivers/nvmem/brcm_nvram.c:brcm_nvram_copy_data(), if the partition on=
ly
> contains padding bytes, priv->data_len becomes 0. devm_kzalloc() will ret=
urn
> the ZERO_SIZE_PTR token (0x10) which bypasses the NULL check:
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_copy_data() {
>     ...
>     priv->data =3D devm_kzalloc(priv->dev, priv->data_len, GFP_KERNEL);
>     if (!priv->data)
>         return -ENOMEM;
>     ...
> }
>
> The ZERO_SIZE_PTR is then cast and dereferenced in brcm_nvram_parse():
>
> drivers/nvmem/brcm_nvram.c:brcm_nvram_parse() {
>     ...
>     if (memcmp(header->magic, NVRAM_MAGIC, 4)) {
>     ...
> }
>
> Could this cause a kernel panic due to dereferencing address 0x10 when
> probing an erased flash partition?
>
> >
> >               et2macaddr: et2macaddr {
> >                       #nvmem-cell-cells =3D <1>;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628231049.12=
48899-1-rosenp@gmail.com?part=3D1
