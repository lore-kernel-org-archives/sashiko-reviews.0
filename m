Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793661452;
	b=cf3+FERLFvUJ4p552xLSfiSm+06uhanqTPyXpwWrYeBrKEi8ETwo9w+cuqV1YCK+1Kbq
	 tjYqMlpS2yZbKvjDx2aBR5a0pw0+lLq9YUrPzqG0N2mo0log2yq0oTAwdJm7Dd4mz2Gqx
	 hVXKQhNVKg45uD0gHX+uK/CGDf8OUFcpmSw4oWAFd4b5c/jpE6OTMtB6ZLQUzLAjn02KS
	 AH05xAbYi2uWo1vb5Zd0LST673pZi4cusnLbT1bURUalN8GjFNfV0SS5DLOLYsZfayRMW
	 NNOem6BjlP2/gBwhOvRxcOt5M3yaDaQOz9Gb/RO2X6G2oI9PsAv73JDrijpNuL+VH1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xKD9YvpeuRe/dGg9UOpRwAfoOUMyefhjGpw4KelDrg4=;
	b=RFNnnywT2U3TRuwBDGFOpdPBETGYqbKp/BWJvwU/1hLWgfLd+IHhBuuV03f6y71Ql3ux
	 E+XDHaglzQPAKDvbsU2gzelJRYbjma9TRTmOhxIfMA2h8aO2U5gGmeEP4jDz/JX9QU3rE
	 /KFTUPSug8oOvsIP8HFGM+iSoJH5zrdj16+K8PoUA1r+//4Vsa0MqiNmCAYs14WowEMcG
	 pdjw1COgHz0haUBp6Jd8NrkIWI6b6hCdCpM1ATWMP1FmXrAFqlnIskqpIk1WbPoPsW15X
	 LDEBhObqm21cE/WS9yNvHExRmzSxAHKUPFjbki8f4edzCe4U+q7tSzkHmNAqxdGMpFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNnaJRcZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B43606A326
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 23:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B43606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNnaJRcZ
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eb0a52d605so17885ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 15:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793661450; cv=none;
        d=google.com; s=arc-20260327;
        b=XRMSEGm3klpxUku3iP3m/2rQD7xG+6wIWyp8VY6zVnCitxxaN4T+WuX1XaF7NKiOHo
         dAhJ6+dVvXeX3taqOnlbF5AMnBO62rGlMnCHM5wgeMJ0nb3vkVjwH+ExX/2S2FM1qTqN
         nTyXL0UHebbiIbenq/2cTD2y+gd0GOn5snWj9XLhCe/yOqBlslOj41GhmgmsutbvNtz0
         E5z6bdRPGNJ7/Vlv98JVT0MTzJnrDdxg6SS3e7iKcr5zZUvzWIqomNLOWNQd5BdTKbyJ
         R4SUzSsjLuQQWirBcfPBsxpSEyuSEMbDNPQ4DOnfea8qdQk22ynuf5JOuvJHZMY3At/c
         fINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xKD9YvpeuRe/dGg9UOpRwAfoOUMyefhjGpw4KelDrg4=;
        fh=KdiYuOgHr1xuk8V+WFeOGLuiGf6u0cn12cqjPppO3PQ=;
        b=L6O7DZ2WMZ5f8RihEQTWYGnio/kC/vNb7r4dVKvFQG/a/QDN1eCKkPntOyRKRfO1Hx
         rAXcpQmPJemZepCbnF2MoxDFF2af+mmW0gzJIcPLfRoKHH4AqIa1iadg53KChxo4+643
         F0zWrEvyf5nhLzibgG+kxtMW7MGFsKRAKj8er08zS8FM9Oj8E2Bc8eQPBttJtu/+bEMe
         uW3eK2q7Qz84ktsBpH88BSTM4LF58kNq14pL13csAmVp01lwZ4ZB76FZ9YfnWHFzhzjC
         6ciUa2ri8XEefOberoxlf9JHA2DE509N+rjB+8bEwMkZaSReeFhTnNfVE5elTX8P85SO
         3o5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793661450; x=1794266250; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKD9YvpeuRe/dGg9UOpRwAfoOUMyefhjGpw4KelDrg4=;
        b=KNnaJRcZE75w7VANJIFIMoZ2Eb/vUi40oMpe5VMWT2OaYxaXln0DZQZ+mRreXTWuxv
         NdTg4wqwfBt598xoydaMLyvFCbuslwR85vMAXDS1ZvB2/S+KvZH9wQtc3dNjeVzRGxKb
         ytR74FVqBBhQLoyOIV2pVUm0/SnVQosfEAuqqmzRP/XeUqSCl2kYZoCcp+RXxXhp9Vsf
         lBAHGNEa/EG/RJRuurFPLdhqyXbX7cCvzKj4OcXlgSgj9z9hG9nWeZdDtBWlLeuJqrv4
         xZ39sF3VMcs6eWfdCM3ZswS0dQ+Z6jhDG7ELssV0omAs45xO/gPrGdrEpLbZeczIWpVH
         2nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661450; x=1794266250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKD9YvpeuRe/dGg9UOpRwAfoOUMyefhjGpw4KelDrg4=;
        b=MKHyB7aDnwqHOLTCoKcCKtPjQWpYFx5sPC2lX2+YneXRHYBs+xKibnN+etNhLIs5U5
         9CYnxCF3t2RWnqI1EdyJBpVBJOREGtDwFxUM1u8Teq/YkRZXXLh/Th6SlnD9dSTHCAUa
         VOQbYu60x81fBds6+aO38EVx6Yz3gj1WHi0GPeui0kZtxmbq7zV0OLUvB4vKdcvOtaOq
         toX7CzmQt84MK0V/DDjcuWzAPF5hOsXAlQrJ+loOycw6py2ZuvGxWSIi5wYRnhOURi4x
         lbq3rdXqTMdTgH/XwZIaIBWYbyZnBkdDLRqzTjtUT/PISeA9QLLe8A3eCmSdEWyj0Pg3
         daGQ==
X-Gm-Message-State: APuU4Z99pK7nOreSlI1w9yl9V6+faiWZvRa2pIHfzrn+jiqazQRj2/+F
	7110W2SR6As2oJjgsE43xpCdRAG8Sa4/xetmD3N0GFg+h9xQHj5VvKYpOcH49M1hJ969T3S/nm+
	eEBv5n+YfICjGuxYWFvgapXALmQ8oI/96MxaO9A8lOfw6Hti87sM933m3
X-Gm-Gg: AYBFou2jmMXDZ3JmQI5SnmbCBq/YGOb7xQqSlnOvCKLGHHiEfFk7cppKFuOLilyBVgW
	bH186CBF7UXPa4iO80CHILzXfB0Gnq+6VV/wo73Wo9CEljUedRtdHzC4nBsyzqpGNLr4BCFvSan
	umHqv3Z+6/MyS6RIBWpJFBF1HwU+4ssLYE/YpfsKaLpANqwmsLKoVbzhTN86wC8vGViQa7t6x/D
	DO5ATAjzngbNzb39KbeUMotkX/Zoo+s72TykdI4ny8V/bYzuDyhdXp0ZPbIXyw8poHtnrACqyvb
	3lRefroTfyHXcGLXTwaaOhP9YHjQwz4afawlEgjEfF/m+F5SGlP++RDhQiR59u1bOCf6iKBVVVs
	fGi3dsUniPj9F+pAzF7paO2X8ito0LWFjWI3eRpw+NHbgCbLHzS1a8f982hTfnt6KWsQ=
X-Received: by 2002:a17:902:cf0d:b0:2c7:f0cc:dafa with SMTP id
 d9443c01a7336-2ecee02a602mr1319195ad.5.1793661449821; Mon, 02 Nov 2026
 15:17:29 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1792690544.git.abhishekbapat@google.com>
 <f577c773058265f0eb7fe2c10fb6aa4003445a00.1792690544.git.abhishekbapat@google.com>
 <sashiko-outbox-183008@kernel.org>
In-Reply-To: <sashiko-outbox-183008@kernel.org>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 2 Nov 2026 15:17:18 -0800
X-Gm-Features: AclHuK-hHejKvvLFEoGswR0AFCGtiaitOOypnWQKOfKmeT59R1ag4cCR_-OpHjQ
Message-ID: <CAL41Mv64927fy+w4FVzROTS2iNjRqZc8Ss=dZxuk-WqmJpoh8A@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] alloc_tag: Extend allocinfo_filter to support
 tracing queries
To: sashiko-reviews@lists.linux.dev
Cc: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:38=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] alloc_tag: UAPI breakage in ALLOCINFO_IOC_GET_AT from growing al=
locinfo_filter
> --
>
> commit b1243e6bc8216f5fe9d8786ec8ca3a597c41681f
> Author: Abhishek Bapat <abhishekbapat@google.com>
>
> alloc_tag: Extend allocinfo_filter to support tracing queries
>
> This commit extends struct allocinfo_counter and struct allocinfo_filter =
in
> the alloc_tag uapi header to report whether tracing is enabled on a tag a=
nd
> allow filtering tags by their trace state.
>
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > index dafcba2f7e2c1..a96054ac22376 100644
> > --- a/include/uapi/linux/alloc_tag.h
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -38,7 +38,8 @@ struct allocinfo_counter {
> >       __u64 bytes;
> >       __u64 calls;
> >       __u8 accurate;
> > -     __u8 pad[7];
> > +     __u8 trace_on;
> > +     __u8 pad[6];
> >  } __attribute__((aligned(8)));
> >
> >  struct allocinfo_tag_data {
> > @@ -54,7 +55,8 @@ enum {
> >       ALLOCINFO_FILTER_INACCURATE,
> >       ALLOCINFO_FILTER_MIN_SIZE,
> >       ALLOCINFO_FILTER_MAX_SIZE,
> > -     __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
> > +     ALLOCINFO_FILTER_TRACE_ON,
> > +     __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_TRACE_ON
> >  };
> >
> >  #define ALLOCINFO_FILTER_MASK_MODNAME                (1 << ALLOCINFO_F=
ILTER_MODNAME)
> > @@ -64,6 +66,7 @@ enum {
> >  #define ALLOCINFO_FILTER_MASK_INACCURATE     (1 << ALLOCINFO_FILTER_IN=
ACCURATE)
> >  #define ALLOCINFO_FILTER_MASK_MIN_SIZE               (1 << ALLOCINFO_F=
ILTER_MIN_SIZE)
> >  #define ALLOCINFO_FILTER_MASK_MAX_SIZE               (1 << ALLOCINFO_F=
ILTER_MAX_SIZE)
> > +#define ALLOCINFO_FILTER_MASK_TRACE_ON               (1 << ALLOCINFO_F=
ILTER_TRACE_ON)
> >
> >  #define ALLOCINFO_FILTER_MASKS \
> >       ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> > @@ -75,6 +78,7 @@ struct allocinfo_filter {
> >       __u64 max_size;
> >       /* filter criteria only; see allocinfo_counter.accurate for actua=
l accuracy */
> >       __u64 inaccurate;
> > +     __u64 tracing;
> >  };
>
> [Severity: High]
> Does appending the tracing field to struct allocinfo_filter in
> include/uapi/linux/alloc_tag.h break existing userspace binaries calling
> ALLOCINFO_IOC_GET_AT?
>
> While struct allocinfo_counter consumes a byte from pad[] to keep its siz=
e
> unchanged, growing struct allocinfo_filter by 8 bytes shifts the data fie=
ld
> in struct allocinfo_get_at and changes sizeof(struct allocinfo_get_at):
>
> include/uapi/linux/alloc_tag.h:
> struct allocinfo_get_at {
>         /* inputs */
>         __u64 pos;
>         struct allocinfo_filter filter;
>         /* output */
>         struct allocinfo_tag_data data;
> };
> ...
> #define ALLOCINFO_IOC_GET_AT            _IOWR(ALLOCINFO_IOC_BASE, _ALLOCI=
NFO_IOC_GET_AT,        \
>                                               struct allocinfo_get_at)
>
> Because ALLOCINFO_IOC_GET_AT encodes sizeof(struct allocinfo_get_at) via
> _IOWR(), and allocinfo_ioctl() -> allocinfo_ioctl_get_at() in mm/alloc_ta=
g.c
> matches only the new command value and copies sizeof(struct allocinfo_get=
_at),
> won't userspace binaries built against the previous uapi header fail with
> -ENOIOCTLCMD (-ENOTTY) when invoking ioctl(fd, ALLOCINFO_IOC_GET_AT, &par=
ams)?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792690544.=
git.abhishekbapat@google.com?part=3D3

Hi all,

I recently discussed this with Suren and we realized that the IOCTL is
in v7.3 so this UAPI breakage is a legit concern. However, we have a
workaround for this. We are going to convert the inaccurate uint64_t
to "flags" where the bit 0 would be a check for accurace and bit 1
would be a check for tracing. This allows us to extend this UAPI
without breaking the previous versions. I will send out a v5 patchset
with this change soon.

Thanks,
Abhishek.
