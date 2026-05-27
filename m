Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0152B3C8196
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779919643; cv=pass; b=P/bIh7k4wE00PisggG353eFu1YaFj7EFuibvwqi/1gq5GK/Ze9CQ0rMuh8bR1HXONArlS3JBa/lCzKDa5rwF/vWBoHmk8q37FYHAGcsva22B9gDydqhPM9pfdNZ5IY8d9CUlHzyeOvHLY+2RE4L0fKcaeDw6pPDn3t6MX0kvoWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779919643; c=relaxed/simple;
	bh=k3lLIpJDgggp3+QrM7CLsNzjAUmjklCE7a6Nrbi/gVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClhG7tPIDfi3n/f267R0FipRWDSCQXS+IFaxMvMxLj+Qp0/cjSno5DS/NMpDWq3F/yEu0kOOTPJtDSYz/l0qNVci6/8euAnjs5ryvZS/KU2QLxXowYSSsDjBfBQ6+T95XLSbQYCKHIwUzHlXTBOOv22eXmGqYTzCU7FlnrivY0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFyz3xU5; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFyz3xU5"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so16717430a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 15:07:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779919636; cv=none;
        d=google.com; s=arc-20240605;
        b=f60MofzHycpPdGX2lZ5RX91tSUWofKzCNQuYlRnovg+lRcjKVB5d7ACMan89U5MzOJ
         wTKVXvKjMYxIScU5HV0DB8GTzqaHXBKTHBLuo/akWlKM61GiYOIggdnSgUFePgkdwKAy
         RjYJ7pV3aLaqeWusB60DLes3uAMoAlf6Izydwk2zo8190AX3VsVBMAkoBbdfmLmfShJ5
         OhYQNz0GhH39/yyiq6x0BratY+mw3fw9zc9OodN8Gn+Vboko0qfdJCOydQf2SQ5iqOJj
         aha7NlAqgfoylDT538htKcwy2cBvZ5Qpf95gkj+0L2Oq0cfXd6iT2OgAyhlyiegQ40qz
         o+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4OVBPp4ttbsthyZCZjKgIEqVwXCG0MyY9CEWH9wwh9Q=;
        fh=dJY95gReQek3pwETf80y9u1FlYsSzi23+f1M+1FTglw=;
        b=G0tZZnQHsFUB+5vhfSenj1nKkzh/hYyffsjeLeqG0PXCcuxtE6HesDtS2/H42kYYNZ
         UH9qvI6s86ADRr5yXjY0t9v8rLrCtdh7ZAT4HHZrTqsx2jRyYBsPm0xcobY01DJ7uFp3
         YgxGhtsRiKbhv06lxOShvVlMp/UF6+qxXTzrnQdHb8d/fogJrJZwKTlCURf5VT5lcxw7
         Cl9u9lafEKuq2O8dhI/EXGCVIk/BLDX3KCON7hLUEG6Gucv7cPDWVx87gGQCy452Sgux
         8uLtlWRy2rBd975CZQskrtzJ+g2Qya+CLlPunayU5U4NBOy8P9Ttuo7K3qA8FdrxxqPj
         m3IA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779919636; x=1780524436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OVBPp4ttbsthyZCZjKgIEqVwXCG0MyY9CEWH9wwh9Q=;
        b=fFyz3xU57hFnDwzKgCQPUdxQ6Y618v92Ctjf/GV9oqH7/fDOLZqF5MtNMazi4pfJY5
         zlY/nw2NrrXVgNZdFSWFM5CtYWMOhfIJdo3gLYVBOd+mgJ/I4Op0G3NTGfVspVlezOG9
         j2g9BnL+KMSm1f3evIqXj/T4B2jfnKbzg7Mnh9teFmKBqQ1GV/is7sk8+Z7x0YTiA9Ih
         c5MRdUYSurq1Jnok1/PJZH5TOUsl88HkzBAfubNr63k0/ZURMRmcmEnWKS3055rORT1g
         THhPfq1vV72C/CQKI5Ay/CX2VXdGvVTpjoOJvzqtgPUmaTDfyYi9zql/9mmvUMto+en/
         gF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779919636; x=1780524436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OVBPp4ttbsthyZCZjKgIEqVwXCG0MyY9CEWH9wwh9Q=;
        b=TnHBIdVWpcLJNxLoBQ86xf/uQwkFNIKnh9iBLjbVcHWO3OpDti1kLL9OUqpmoDXAmb
         mfAAgCb14ig3LXYmIbqg1MIObhpbjRC9r9Sfne9JS7tEqGfEaoiafa00VTxWoffaE/hX
         azCpfSMztc7GjO4TfbwudPprIY++EbCpVpEY3kVMkbIiRAfLE8HTkS91KoCrKwSaUqqD
         IcB58ueiBYa6jH4U9DoMALj+BenQEYOe3VKtEQS7v9MhEN6L9AXqX7Km3Gbm0AVeGHZT
         uOIPVrs0tm9NcmfhguuERfh3J4oKbQwL9VqfA7slLY6IwyGy/j03rLinQ8wPg8KCQOlT
         Zljw==
X-Gm-Message-State: AOJu0YyIWzY1ZvdhDB94qmG6U/qERD2P3LH2W7kh0vq3IxHz56MvpLYy
	8VkNVn5rnPr+flMe4ZEUO/s9+Lxm2SbRMxl1HvPSm0/8pxa8NsjmZF5fzyvd1uyYxEvogo3njSz
	QeUD8W2RtfH/W8RU+64e1AA5crLzIWISpHQ==
X-Gm-Gg: Acq92OEYrlcehRVnhfW7b+A/tDGBQxXjv9VzhoB2njNJ09c0J0WxA1L6gUG5t9h6Pu9
	bVrW9jYQV1/mMNIa7w8J5Pw+fdO8aDvtTkUiNhcmkAK7h4zeoJqX+Q0JJ229VygBpp+EdplJLl2
	24HvMiVJh7oSoyf7gilRFM/Kl3KgFdqOSVvyoWvRcUd4Mvnsk29Mn5GLARglkoruPsM3pnW48dD
	wkDB0bFWvP3/p2NcqB7LEV0dsmcifSjR2z31jf/g70bbm3DHAcomo8mMeUUqkHWHDwrwN+9bWAT
	WAttCPwoVNsMo5NVqSSWq7MCGjQhbaVm7PJFgflL3miITTlYQrIfy6/NdS81msHLvnlfmGltPHf
	amZpH3G8LiBR6R0F1tZjYxUW8VZMJ1YMR8AYp6XFKn1MdTjWfKOmg43WkvfrAWRN+8W8ZVGldSK
	JbCHA=
X-Received: by 2002:a05:6402:4147:b0:67c:5745:ba00 with SMTP id
 4fb4d7f45d1cf-6889c2a3792mr12387039a12.0.1779919636018; Wed, 27 May 2026
 15:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527203126.7053-1-rosenp@gmail.com> <20260527204806.1DDBC1F000E9@smtp.kernel.org>
In-Reply-To: <20260527204806.1DDBC1F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 27 May 2026 15:07:04 -0700
X-Gm-Features: AVHnY4JJw3-pkbMOdUPeLxDinjlUUnntxistMEnXZFRIYvGlrPP2EONxnjVRRXw
Message-ID: <CAKxU2N_+aSN3L5KXs3bi4sdKmVW-JF4FzuFV50yae_Ha4Aw7CQ@mail.gmail.com>
Subject: Re: [PATCHv2] dmaengine: ste_dma40: turn d40_base phy_chans into a
 flexible array
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 1:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Defeating struct_size() saturation arithmetic with unchecked add=
ition can lead to a heap buffer overflow.
> --
>
> commit e3bf7e1250eb198cd9bf4617a8f0c3d6cc4d796b
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: ste_dma40: turn d40_base phy_chans into a flexible array
>
> This commit converts the separately-offset phy_chans pointer to a C99 fle=
xible
> array member at the end of struct d40_base, switching the allocation to
> struct_size(). The log_chans and memcpy_chans slots continue to live in t=
he
> same allocation immediately after phy_chans.
>
> > diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> > index 9b803c0aec254..d3e3c4cd43f17 100644
> > --- a/drivers/dma/ste_dma40.c
> > +++ b/drivers/dma/ste_dma40.c
>
> [ ... ]
>
> > @@ -3197,10 +3198,9 @@ static int __init d40_hw_detect_init(struct plat=
form_device *pdev,
> >                "hardware rev: %d with %d physical and %d logical channe=
ls\n",
> >                rev, num_phy_chans, num_log_chans);
> >
> > -     base =3D devm_kzalloc(dev,
> > -             ALIGN(sizeof(struct d40_base), 4) +
> > -             (num_phy_chans + num_log_chans + num_memcpy_chans) *
> > -             sizeof(struct d40_chan), GFP_KERNEL);
> > +     alloc_size =3D struct_size(base, phy_chans, num_phy_chans);
> > +     alloc_size +=3D sizeof(*base->log_chans) * (num_log_chans + num_m=
emcpy_chans);
>
> [Severity: High]
> Can this unchecked addition defeat the saturation arithmetic of struct_si=
ze()
> and lead to a heap buffer overflow?
>
> If struct_size() detects an overflow and saturates to SIZE_MAX, this
> unconditional addition will wrap alloc_size around to a small integer val=
ue.
>
> As a result, devm_kzalloc() might succeed in allocating an undersized buf=
fer,
> causing an out-of-bounds write when the channels are later initialized or
> accessed.
>
> Since phy_chans, log_chans, and memcpy_chans all use the same type and ar=
e
> allocated contiguously, should the counts be summed inside a single
> struct_size() call like this:
>
>     alloc_size =3D struct_size(base, phy_chans,
>                              num_phy_chans + num_log_chans + num_memcpy_c=
hans);
>
> Alternatively, the size_add() and size_mul() macros could be used to pres=
erve
> the saturation protection.
This is completely unreachable. I can add min() calls if needed.
>
> > +     base =3D devm_kzalloc(dev, alloc_size, GFP_KERNEL);
> >
> >       if (!base)
> >               return -ENOMEM;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527203126.70=
53-1-rosenp@gmail.com?part=3D1
