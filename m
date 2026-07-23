Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99CE360EC6
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798505; cv=pass; b=XUKEetoftcCJ8Qcwlhy/dXrfv2VZt6Ssif2ep0zKa/xuhFFJZ+R/FHpjRlA4GD31VbITD/Hb07CbEtN8pf1ymvIxo/C991QSvnCeQQ7PiChK1jeg5dQMl02t3FGbw1Tz8TS01KAQaBFwlZ4AE5XBEVZ9fmQp0YdM9/JEJy3zoxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798505; c=relaxed/simple;
	bh=Fp+R410qkEY1IMIQt5CDyM30oNbGYLRrPsG4ZVSu1Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uowTmxCiYAslbVDdTw54R93X3u7xCzmaG8YqeX76xfvOMQpXNLvBA7S9hBne2lqpKwBfndw707bl9GscsGJ2sdNSEsFyByVLZCFAxmQgEbI7oyETUbDDsuV7ekG580aM91uC788kiec4cQLDNAsGaMbA+i/MKIw8qJRlpHDq68A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=i++eYKeK; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="i++eYKeK"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e6f2ee60bso1544287b3.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 02:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784798501; cv=none;
        d=google.com; s=arc-20260327;
        b=ficSnC+wCbddYF4R1Zrn5+pEJrGnbTD6hwWhgoTgBaff75jNE158ENNM4K+avd8bGJ
         FbrfZDCKGMuJmbLtM5RvBWZtEEaRcAvp69Ll77FPmohEsmgcK5zNmQ2aw9jt9tL79bNN
         qqw8ZJ4gv8wgAtHosPKXzdFJ8wm9szx9E+KD2cf0DIubiLql65ZVkxtAYRu8oGWpmLNy
         V89iNktpjKetsQL+crnj0/YxMsTFyC+zSJdZq1TLuQaNgATWAJywN5cAZmzI27WbQwy5
         Yd7GAA+NG6mgMwnNz/i//Jd4CsiFNyWSIA6yYn8rMmtLpkjZ96REUygM9Mm7K5/37F0S
         T03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RSnKA2zo95wHPVbfGKIeKc74qvgW7zPdNGfr3Ifw5gc=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=GHRphaMuj5+xRTPuN+y1WYlJkZgvU1l+V/j7XKyQbvxpVHnOH8giuSlKISpA1/dJa9
         ce6G4Y3Qx5+qZoZXpKtnr7giV6dJYRTItSArL+QD1MoJ4VaB98huIGUrT/tMf31wfguj
         lsTHPmuCv+FqgWCg6RDxLMXaZsoQS7Ej0t/gEhZ9ecNfGX5ZeH4wJTyIHOa4ueaaJpEQ
         Sz+I5dtTTwEWjv8OwQgJ2CJ1XC7GzBgwrFL5sMXvpz9gvSW+0rUbDiwMUl3YseqFdbrP
         N5VExKRVlxw0jYJS1PQGUdiasp0dLoQAXEoeibLNdiYnSU7IuMAkrQCSF4/E3pgzxxRQ
         4H3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1784798501; x=1785403301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSnKA2zo95wHPVbfGKIeKc74qvgW7zPdNGfr3Ifw5gc=;
        b=i++eYKeKerzYIIfYPcfwHaz088oCUlUyyrgCetFsOFqfZbmMcNyucuR/unSXuMQC7b
         Rktvx9aaEq/y33mb8rirQMHoaKB/gYg8DkFWnK9/JJHHcr5owcdEO9e0KjZIuu5jf8Pl
         3bsSf0QFe4d+3SbDBtGPq+77AsTE5S3PRmXCfYFXboXE8SFMyO6j3stn9dH8kQZcrGDh
         rfJ3x2g+gxXcEnM2+jWJ5YnLH/3ygPjqG3j03Mf52ZcII+q0O4FHU/vV0F4hZEat6Jh+
         kZaem1eiXu9z10rs5c1TTEozYLTH22gZTTgWQ137PXJpeJbZ8kmFQOKGLG9hndmXnuvl
         VBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798501; x=1785403301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSnKA2zo95wHPVbfGKIeKc74qvgW7zPdNGfr3Ifw5gc=;
        b=TFd/eRTLo/pFaLQiJcNvAjVB2yyT7ASqdaipWriD/JmcmIt7PD/RxN4HUaibcChePA
         ANIpy1qhVAs411fsBRKisBTORkklAy3oUpaPM+QlXjTBKZOylNs/vhAZZA/BxJGtuTUd
         17VzqC7ATEp7VzaJQMpDIebahSeVn2ePT3aK8NKx35YaVeyhPHYcPa1FbxL4lAGmrlKs
         b1LeqWur1G0SaEiP6bJf8FFPeRqJkORD7s+WQNaKLBSR1g+2ipf6yNYiK3s4dBcDPCb2
         JlIgpNzyIpw4wb/FufbLlYxtpfRcbmmDf5ou5D60kOVebj6luPdyzzlm7ZebHgj2lNAS
         dnbg==
X-Gm-Message-State: AOJu0YwL3oyOcqKFdm8Lmq2FeZANgK7Lp0LILZjAB3V4+pt7O3xaugCY
	qvOTXfI1ChSLlFkggU5LWm3qmi5r5Vx2t3I1JFMuyeW+6iqFc9VeX2djY0X4mVy3zpR0GdZ3i+n
	t8vlSnwP2cMTorOxAHwZDWrEPr2gRN6myM8SRrgNs+70kRkCgpKqDr9nxCBer
X-Gm-Gg: AR+sD1113ZGM3GJSN2pEaxLDUIic/vbiuy0xEXBGrWEy6ssPT5AHt5Jqcv6OX47xKAh
	k5vIGTb8khKXzRbu1+z1Y7jA9ueYWkcQ03TcWhSfQO+oWCMBIKXQJkx4lO/duNu6khj8opUoD9y
	vpPuVk5N/5BYQGJcqfzaXx1LU0MnF6M7RBMSf3TW6e+y5OYgGg+z+UfWgkchDmeXP8oGD3jv6ed
	jr68mb+H5QHpfNsE049WQLRBtVaEeP/1NkWBD+JRPM2xtKwQajmWgix4/1iW5JsyJ14c2n4vJUr
	V6EfLraYqosSvyAqa3dXyrHJKVJGGJdhL/zJX9c6cAnUi1Q=
X-Received: by 2002:a05:690c:9988:b0:81e:a56f:844d with SMTP id
 00721157ae682-81f4d674777mr4408207b3.34.1784798501559; Thu, 23 Jul 2026
 02:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723-chromaticity-v1-1-5ef5746ace2a@frame.work> <20260722173529.7BAA31F00ACA@smtp.kernel.org>
In-Reply-To: <20260722173529.7BAA31F00ACA@smtp.kernel.org>
From: Daniel Schaefer <dhs@frame.work>
Date: Thu, 23 Jul 2026 17:21:05 +0800
X-Gm-Features: AUfX_mxcKxylLeNZW3a59aaejdAdEzO2nyAJHcWYwC8eSH3yVQwwMFUuOy8lQmc
Message-ID: <CAAjcXz4K6vmATfobBQxqCtj2MgzX7omNbFQjkzY8_xXPkNOgXw@mail.gmail.com>
Subject: Re: [PATCH] iio: hid-sensor: als: scale each channel individually
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>  Does the info_mask_shared_by_type for these channels need to be changed =
to
info_mask_separate so userspace can read the newly added scale for
CHROMATICITY_Y?

Yes, that's a good idea. Will send v2 after I tested it.


On Thu, Jul 23, 2026 at 1:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The patch fails to expose the individual scale for the CHROMAT=
ICITY_Y channel because it still uses `info_mask_shared_by_type`.
>
> Pre-existing issues:
> - [High] The driver's IIO buffer layout uses a fixed structure, but `avai=
lable_scan_masks` is dynamically populated, causing misaligned buffer reads=
 and data corruption.
> --
>
> --- Patch [1]: [PATCH] iio: hid-sensor: als: scale each channel individua=
lly ---
> commit 6d49cfd4cf380845a584116e06dcf23fc8c25ad6
> Author: Daniel Schaefer <dhs@frame.work>
>
> iio: hid-sensor: als: scale each channel individually
>
> This commit updates the hid-sensor-als driver to support individual scali=
ng
> factors for each channel, instead of using a single global scale. It stor=
es
> the scale attributes in arrays indexed by channel.
>
> Link: https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/merge_requ=
ests/413
>
> > diff --git a/drivers/iio/light/hid-sensor-als.c b/drivers/iio/light/hid=
-sensor-als.c
> > index 384572844162c..232cb58e0a9ff 100644
> > --- a/drivers/iio/light/hid-sensor-als.c
> > +++ b/drivers/iio/light/hid-sensor-als.c
> > @@ -33,9 +33,9 @@ struct als_state {
> >               u32 illum[CHANNEL_SCAN_INDEX_MAX];
> >               aligned_s64 timestamp;
> >       } scan;
>
> [Severity: High]
> This is a pre-existing issue, but does this fixed struct buffer layout
> cause data corruption?
>
> The driver captures samples in als_capture_sample() into a static sparse
> array (als_state->scan.illum) based on fixed channel indices. However,
> indio_dev->available_scan_masks is dynamically constructed based on the
> attributes present on the sensor.
>
> The IIO core calculates scan_bytes and channel offsets assuming the buffe=
r is
> tightly packed.
>
> When iio_push_to_buffers_with_ts() is called in als_proc_event(), it writ=
es
> the timestamp at the end of the tightly packed length, which overwrites v=
alid
> channel data in the sparse array.
>
> The IIO demuxer then reads from incorrect offsets, scrambling the data se=
nt to
> userspace.
>
> Should the driver pack the samples sequentially instead of using fixed in=
dex
> offsets?
>
> > -     int scale_pre_decml;
> > -     int scale_post_decml;
> > -     int scale_precision;
> > +     int scale_pre_decml[CHANNEL_SCAN_INDEX_MAX];
> > +     int scale_post_decml[CHANNEL_SCAN_INDEX_MAX];
> > +     int scale_precision[CHANNEL_SCAN_INDEX_MAX];
> >       int value_offset;
> >       int num_channels;
> >       s64 timestamp;
>
> [ ... ]
>
> > @@ -186,9 +186,11 @@ static int als_read_raw(struct iio_dev *indio_dev,
> >               ret_type =3D IIO_VAL_INT;
> >               break;
> >       case IIO_CHAN_INFO_SCALE:
> > -             *val =3D als_state->scale_pre_decml;
> > -             *val2 =3D als_state->scale_post_decml;
> > -             ret_type =3D als_state->scale_precision;
> > +             if (chan->scan_index >=3D CHANNEL_SCAN_INDEX_MAX)
> > +                     return -EINVAL;
> > +             *val =3D als_state->scale_pre_decml[chan->scan_index];
> > +             *val2 =3D als_state->scale_post_decml[chan->scan_index];
> > +             ret_type =3D als_state->scale_precision[chan->scan_index]=
;
> >               break;
>
> [Severity: Medium]
> Since the patch introduces per-channel scaling factors, can userspace act=
ually
> read the scale for the CHROMATICITY_Y channel?
>
> The als_channels array defines both CHANNEL_SCAN_INDEX_CHROMATICITY_X and=
 Y
> with .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE).
>
> Because of this, the IIO core will create a single in_chromaticity_scale =
sysfs
> attribute for both.
>
> When read, IIO queries the first registered channel of that type (X), lea=
ving
> the Y scale factor completely inaccessible.
>
> Does the info_mask_shared_by_type for these channels need to be changed t=
o
> info_mask_separate so userspace can read the newly added scale for
> CHROMATICITY_Y?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-chromati=
city-v1-1-5ef5746ace2a@frame.work?part=3D1
