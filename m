Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A75378833
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 01:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608591; cv=pass; b=EkhAlgSLjq2PxktWtPHWgVdLhgjbdPNrMU04chcRXRtmgY0shG88lPVVqO4BrdM5Jqsi1tlJVgGM5/EJm3k1rd3KzZ12Ii8vUNPt7Spfz+OwwJneXTYwfAEXeT6AwE9q4PBIkMPvk9K0/agbvg0Qrsf7L1+hcE17XNWyCccJogI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608591; c=relaxed/simple;
	bh=nYO81VqPX/lykMhTTznyA/NABicyxN1HMV52ElAVDNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ViQubUgE7eNBNigPK0puG0bLKf1M7i4Fw/p6OY3FIiQFuTCjUdmEK/6unw4tBdrBnAsIM4U5NDrr6fnosO2YF92tMDR/egpKUI8GBdB0rVy4UoS7Z/uyvcvRToDr/wqmjnyuAsjzmwqLlOW2vR4rPK5LJjRXrjEYyPqC3ds1Fi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrniMLaG; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrniMLaG"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so204955e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 18:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789608587; cv=none;
        d=google.com; s=arc-20260327;
        b=VDamXW1KJeWvX/KkcemOil2MbHSTjWIB6XuUegsrz0irRY56QIlr9M2fCsWDFesutf
         BE70FTlLnQGk6rnOxafHC/TFymrQdfEaaIGMOdAlZl6Rj0dZZSPmrcXt4BrrpZqor2nG
         Mz2wp3ti1fSztSBi6Om+3HWbG7U33PHbhPaexsslj9Hoo3RYRDB5PCos+LY/+YUubqvx
         uSFwX6rG6VGpiIbhlR2OTw1OW8yrCIB6nshM4xgYI526xKhWP320lD8WuXdadzQf8rki
         QQL/VfyWTAvXLUC2qs+4mbbYZ7+9w3KyayK93OY92OWd7XY3GKyMOflTSB1jPo3FhJZt
         alhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Q7cKm1GgTP1+PqPz0omrZT8IwHZlQcfVD/A69eScTo=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=lfiIsjF86HV9mmLzwq/drWK3jVid6GAM4pEKc1zkpjHCietOyvHSfyKEEADbDE4z+e
         n1w2x+w9nAZMLpI43+Vktics6Hd8HUTtNv7UkfEbEjTKcjuFbps8eRSGiJ4okKej2lUv
         LsE+p4IQ5uBWlP1tQT/HL80try6Bj3GcSwBeRz2gVSP+qablTRot/C/boBP+cnbxtcJZ
         JcRoEDQmdtA3XvGQnvkZN2xRDV61TpL75TeU/sAPibeq/63Ab2e8jKlNSUSmayrb76vK
         VY5zkhKn1O4iKc7rRp3od9uFfdzsIpgC2I4CvG0pVlz8jdecruerHVoyyjE0S1OW3vEZ
         +26g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608587; x=1790213387; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Q7cKm1GgTP1+PqPz0omrZT8IwHZlQcfVD/A69eScTo=;
        b=XrniMLaGI/ylqGDZqwFJ7MH8qili6SEapGsPjY6w1KtQNOQX7dkP/gvF1qFttLCmVy
         hbmWi8wDuxahcmnHMGjNhl1FGgFnWM3pN3h+mCge3n8n2P3r+vnPL67cPr//u/Aq8YOy
         lSSuWMa6GTDs7rFD+ok7ipEEO10NoSOWOUoFvZ7MbLMUnzFBTmc+ccUNuzGL+LVne27Y
         QWjMEEQ/y1tKnLZ2EStQicdhQWOKTTCMzHKb9/685n+gQ+8lSWFOAqK6+EAaUq4O0EST
         Ie0UmqsWXF16RWfO2luCcq/YdYdMW+4SyWju8he/ptww68YcvWHv+fDscecle+u9ONzd
         GL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608587; x=1790213387;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Q7cKm1GgTP1+PqPz0omrZT8IwHZlQcfVD/A69eScTo=;
        b=i3D0nSg3kIrusjzsP9M30w3d6PhUoe53CgleSdHAMRmrPcwSR5LYbkExjAwZpkanpU
         OETsIZEBMaEGkumtFx62dP0n1djW/aQwlVZ5nYOsz5NcaeiNVOnX127eXxKMl/jS3BF1
         BYk9PdsbLQmrBYqX9Z4OH9ToX/X2pJsbiwIfXOZqVKEFW6cJd45lWgpa49T46BZyZzpS
         H8OzmoQVuwY0QA/20poElk9jc5yNPyZgx9ZA2xhozLJdLP+HhHAqqo1MFbC17+OR2Aos
         GlD+tExbS3YWu7X8vTCYW0gJVckQ18t9Jnw+TVFqeI4YCbhh2PKuogNhn5OwaCJdXvn/
         oVTA==
X-Gm-Message-State: AFuF++mJmcL003eZy5mfuDxQKbmk4KaQYI2rGAOCbOjfhbT1TWOftqLN
	ukudvi6PBMcA62cGbdMZoaD+BZizQF04BPA3U2VojFf15GrW3QviDMLzAEjDnpBicteSp+1yMli
	0sUC2wPHr2OGogJCoPonsz9bselczX+jFCLo2uZQ=
X-Gm-Gg: AYBFou077q6HB9Vuj7kEkjRZugNYebafosXt1y1jj5q7Zy5a/8thmJI+1hRy7x197lD
	4ee4pbieuTiLb7r+VGQWsbHQXT5ZNtGHvHdGIUuoreD12pAUuhKPGNT8kjDk1ZR1zkBXyYPh9SD
	ob3t+a0Vt0i4uTriMcvvbJR+pn/gE8r25XCOC4bAR5OKrFzvllv/2axZ9RfcWWgsKQJlLFCHQJx
	71U0wTo1aXB8LK2X0iqfvxkt9Ep38+2RL7mPOwu7o3LIWBm0Y+PrMCUWHu8Y6oawOzqY27ZN5ED
	zr4OCBM0cMi1FS6vA80yhHfVFtEqdNZkJX/x1lK4SQ/Abb1UuSXqw2wLNXbXhiOHhPoyaeP3VbG
	S+WGFtVmOKrNR
X-Received: by 2002:a05:6512:1287:b0:5ad:58c8:5de8 with SMTP id
 2adb3069b0e04-5b8b660c0f3mr1372263e87.1.1789608586599; Wed, 16 Sep 2026
 18:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917010431.29714-1-stevereaver@gmail.com> <20260917011439.76FED1F000FF@smtp.kernel.org>
In-Reply-To: <20260917011439.76FED1F000FF@smtp.kernel.org>
From: Steve Reaver <stevereaver@gmail.com>
Date: Thu, 17 Sep 2026 11:29:35 +1000
X-Gm-Features: AcwNN1X1AD25JHPBHt7BdW6CZNzwxJhG7mtsxh2Tv7wH_3N7qUBbOjuE-tL63mY
Message-ID: <CA+sfT57Sa7HSLsKMPX9o4yRb0SzBgvs_JvfoHNJKMRSREef=_g@mail.gmail.com>
Subject: Re: [PATCH] mtd: maps: add INT0800 firmware-flash map driver
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review =E2=80=94 all three addressed in v2: per-device state
via devm_kzalloc, map_destroy on the register-failure path, and %pa
for the window print. Also added the missing Signed-off-by.

On Thu, 17 Sept 2026 at 11:14, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] mtd: memory and mapping leak on mtd_device_register() failure
> - [Medium] mtd: shared state corruption via global variables in probe
> - [Low] mtd: format string mismatch for resource_size_t in dev_info
> --
>
> commit a217a15f9e29300a155e6f6c8138325d4f178f7b
> Author: Stephen Bancroft <stevereaver@gmail.com>
>
> mtd: maps: add INT0800 firmware-flash map driver
>
> This commit adds a read-only MTD mapping driver for the ACPI INT0800
> firmware hub device on x86. It exposes the system firmware flash as an
> MTD ROM device to allow userspace to read the firmware flash contents saf=
ely.
>
> > diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
> > new file mode 100644
> > index 0000000000000..2438d970b9fa4
> > --- /dev/null
> > +++ b/drivers/mtd/maps/int0800.c
> [ ... ]
> > +static struct map_info int0800_map =3D {
> > +     .name           =3D "int0800",
> > +     .bankwidth      =3D 1,
> > +};
> > +
> > +static struct mtd_info *int0800_mtd;
> > +
> > +static int int0800_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +     int0800_map.virt =3D ioremap(int0800_map.phys, int0800_map.size);
>
> [Severity: Medium]
> Since int0800_map and int0800_mtd are global variables, what happens if
> multiple INT0800 devices are enumerated?
>
> It looks like this unconditionally overwrites the global state during
> int0800_probe(). Later, int0800_remove() will free these globally stored
> pointers, which could destroy the state for all active instances or cause=
 a
> double-free.
>
> [ ... ]
> > +     dev_info(&pdev->dev, "mapped firmware window 0x%lx-0x%lx\n",
> > +              int0800_map.phys,
> > +              int0800_map.phys + int0800_map.size - 1);
>
> [Severity: Low]
> Does this format string cause issues on 32-bit architectures where
> resource_size_t is a 64-bit integer?
>
> Using %lx for resource_size_t can consume only half the value and misalig=
n
> subsequent arguments on the stack. Should this use %pa or an explicit cas=
t
> to u64 with %llx instead?
>
> > +
> > +     return mtd_device_register(int0800_mtd, NULL, 0);
> > +}
>
> [Severity: Medium]
> If mtd_device_register() fails here, do we leak the memory mapping and th=
e
> MTD instance?
>
> Normally, we would expect to see map_destroy() and iounmap() on this fail=
ure
> path, similar to what is done in int0800_remove(), but here the error is
> returned directly.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917010431.29=
714-1-stevereaver@gmail.com?part=3D1
