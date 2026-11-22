Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322908;
	b=TfbGK4XX8BB9p9B9+d7aW08feKIv/49HZ26i3q72whxzXYvgvZgTq+njhC0nxtjLzbio
	 fve9Diq4Xlwilrs0jCeULh+oQeDO7huPoDAyjniNogJ9svN1skFiwOh4j5ZH8Vj09CGVS
	 ufNT3IK6pfIjV0QJkWbpQEdcztZpu+ze70nmtFTq8tQxB12t6Hi6qwDTDEnwzPUfawZfZ
	 DL0/ia6XOT+ZOPcKkFIfelg8CmATdnM6h9LycSIijeqJpFq3EMMWcGlqlbwWTm0v8hyhq
	 aZOczhOow9LcA2gdH5sN2Wv+Mv8PnW0xykLaFn3oQJ7d5oFct5Hmac/vn41bu4Rbh0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=aivprEjWWyuTPpWR091yh3Xxco3ejGQmEcsBHTiq2so=;
	b=oAr74Dbt0AaWmlLdJInLNQVVjiAH70dIf6czzhPX7d+2AHY5SAzEDKSBnZ9kEdsdpyaN
	 0oEzKyeWHA0xaZRYCGMuIR5TIrSu5W1sMVU104bFRgQ5s76F5lyiVOkcBG+KxnHskstNh
	 OzWy3u58EEQPHq0drLNYailti6xluxihgBUv5A59DoFa0jO34dHHXQbzOPA+B9esNHFR2
	 WI0FtSK0fwYFwOV3VkemcLg1e6k+ds6y5KgrrId9hzwxCQ28wRTNUmhzW1EIGMZeXYCQV
	 GOJqcsVOS5mz5RyFeB/9SPaJ41jwhyqXMEJM/H+hmWf4gVB0BJqvpp1lXzRiEwOHerA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HnsoWpyi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D3606A320
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 04:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862D3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HnsoWpyi
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55be673e029so155771cf.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 20:48:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795322907; cv=none;
        d=google.com; s=arc-20260327;
        b=PO56CD0unhPfrAnEPHjUyYIA0TKZP24OeTWopYqFarVhJYWmrlk5dMFohhjJ1XEFwk
         QQlD99AlwKY2UgqbMk5bsHFehq1DGajbGiJ601qscTtQ1PAfuNKzjB28EheM8a3c7PT4
         pCypj7k/5H3pIvRNXVMj1BVYKdCp8BvvBOzVaq4oh/GS6/Fbq8LVEl2hrYlV+sXhM2Uq
         2czOmkCMSZeA7dY/+uYsCHS51jDnfZAKo3bgmWq7v1ULnAxbksv6sojB5ncppZ2LJLer
         xCtgt5FEnAggRwGq/kYLLaH0GjUwAHI8MMLhGNK8C6cl+CVKFIMmp3xzFgsWBZd08Uei
         98cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aivprEjWWyuTPpWR091yh3Xxco3ejGQmEcsBHTiq2so=;
        fh=ZajQVXKx4og9o2V1Rn4I18ADtLjDNP2g2IqA77gF7F8=;
        b=U8ualkHmg1Z7HzKEt0fe77z1YmcYcOU8B+sp3kprlBeyZohxK74XPZxLWstb1xpmzV
         IeK1gDZ9lizy+8MoK41ts+8n+ackJwkmr4hEdaWl5Cqkotnd7Gf7jMXQufoala9AXP6P
         9i1ERmQ6DdISb7xm9Wh3aSCNNipXjjxAeJ5LaIBrWcK2dagD9/zJtXB6Nx5yAAdaYIOr
         f/MWXqqVpaCDKUQCNNAn/h1lSSeyK0Phr/4A5bsQhCaBwFd4GE0Bqf27sZNj7UR4M1ZY
         B96ycCOAnxij4mpMUyxFgTCLbBBDRnvRjKrQeZ4DUXURxiliK6RsOfVPGSPXjiiKdfls
         2viQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795322907; x=1795927707; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aivprEjWWyuTPpWR091yh3Xxco3ejGQmEcsBHTiq2so=;
        b=HnsoWpyiDIzcXMfcFKAqxb4Cxynrv/HIYOu5eoCueHCBX7G1YsXuBtFw2T0Uw/otFr
         Ad6n96dY1T9gUQ4E/kCBj6WlKh65RNYtbDosku2Z7ngtmifUxfw97cmYH1WiI72zdVkc
         3ebPYrr4EyzQavhxKmJdJ7F64WqLAWJsSiFYqpDJi31MKpC75PlgnEgJEuEVhtesRwNy
         DZmNmZ3Wcem5ViQH+Bcmx2z1Lg38D+UHwVPZIYUHQqXiTKuTfCSebWHkqQWXylRbWYm+
         RdFtjRcTnN9gLVvv1gMtuAqE9bnMx1JnkJk4FCZD8jzLLN2dLs1/DQKm2yamKTAvAgXm
         WgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795322907; x=1795927707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aivprEjWWyuTPpWR091yh3Xxco3ejGQmEcsBHTiq2so=;
        b=aRrSzokIGDyd1tkszrv+F81Br91lC20KAhSAnNsKfQl3NL8Xjbmwtn8JXByPVWME44
         S705/2kis7frKHeRQsQAgJ2O7LmVVxpkiUWBYtrKh4k6kmudEefoRWnI/Pdby1UHDwST
         XBKYbePODRtANjwWn9/NnK3335mLiQ4ilVF/1vYUz05ptSecfn4duaP/c3qeuO2KGZAv
         Ew6qgJwgtzsEHrxjjx5Q/d+NE8re2ZPrGSkgpmX1RMVoiZLjwd2FTsglgiQFq65S1KP6
         c2UVdqQ+yezQhbdAsnXZKV1I8RfxDn00/TLX4uGM+BI0klF6aAZXewNaoebxiOr/o3LP
         28pg==
X-Gm-Message-State: APuU4Z83QY/35S4LkGGp1u8HcG6M2hrz10ZkLPiZwCKRVART1yc1+/yu
	ZNPaqVSmITP6aqK06HtvMTSHQMMaU0oiI6G2n2n40qWAegD82qQnKY1lhwegTRYFkLz1bBJaJV7
	BT2oN9KP6TgUYhusY5R5sKFoYfCIV+wc6soyZHd6l
X-Gm-Gg: AZFdTZfQtvg7rNyl4Jt8+Hg/GoqcksiZdsxzMkQprDaVrWfZhQLivit/Nbiw3JXFirv
	Kw1ljWy7TiEj6vYPqqGoDb2gE6l2CORdxvYtFKKHDZGKZVipHOGDy5HtKPdqSdEFwRhDuKiCem3
	2U4/q0MqHWc6pxlKZx3WQtTUoGF9PaUN0iim2viKtyGciJoA7Bn1KlSzGUmGEjguJABX6lrGGFt
	wmUBT/eP2Yx9VLUsqTf/me6576NMxnqi73uel+6IxoJm8VUQJj8h1wxiVrFTHVTbYdWc5Pu0Dwb
	tqSN3h/mzQ77I/bKnbR3IOqXsAd4m18lrpdjgSHc2zui04j6gpKjASmOCCzeZ9D2lmuLNfY4yBK
	TumM64wH00uugJm7NKtzNyZi+HW7LyrhNDcDiUYMJnGrmANszpZPRcpJ+zTZErNddTfCIefjrNv
	wSqY8Pc4dfwISgXoJn
X-Received: by 2002:a05:622a:124a:b0:535:bb33:6351 with SMTP id
 d75a77b69052e-55d87fcff29mr19987351cf.1.1795322906822; Sat, 21 Nov 2026
 20:48:26 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118132719.632451-2-ardb+git@google.com> <sashiko-outbox-223175@kernel.org>
 <b7521ecf-d30a-4b47-959e-43257baaf8a9@app.fastmail.com>
In-Reply-To: <b7521ecf-d30a-4b47-959e-43257baaf8a9@app.fastmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 21 Nov 2026 20:48:15 -0800
X-Gm-Features: Aa3M54offAfg3834PgFby-yYoDkOuUmUfJ9HCVQYtK0CdYb7PRNW36LqxMd2aV0
Message-ID: <CAJuCfpFH05dc+K=NproS=T_piiJqx-xJ7zvXDdNe+g1_bXF2Ow@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: Use __ prefixed ELF section names
To: Ard Biesheuvel <ardb@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Ard Biesheuvel <ardb+git@google.com>, 
	linux-mm@kvack.org, Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 6:03=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Thu, 19 Nov 2026, at 14:27, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issues to consider:
> > - [High] alloc_tag: SECTION_START() and SECTION_STOP() fail to expand
> >   macro argument
> > - [Low] alloc_tag: missing Fixes: trailer for unprefixed alloc_tags
> >   section name
> > --
> >
> > commit 933587991e6a16ab600445b22347397f80335de9
> > Author: Ard Biesheuvel <ardb@kernel.org>
> >
> >> alloc_tag: Use __ prefixed ELF section names
> >>
> >> The compiler will emit static relocations related to a section .foo in=
to
> >> a separate section called .rela.foo, i.e., it just appends the section
> >> name to the string ".rela"
> >>
> >> When section names start with . or __, this results in relocation
> >> section names that are correctly matched by the various pattern rules =
in
> >> the various linker scripts across the tree.
> >>
> >> Without any such leading delimiter, it may lead to spurious warnings
> >> such as
> >>
> >>   >> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' =
being placed in section `.rela.dyn'
> >>      ld: warning: dot moved backwards before `.rela.dyn'
> >>      ld: .tmp_vmlinux1: section `.rela.dyn' can't be allocated in segm=
ent 1
> >>
> >> Fix this by renaming the section to __alloc_tags. While at it, tweak t=
he
> >> headers so that the definition of the name appears only a single time.
> >>
> >> Cc: Suren Baghdasaryan <surenb@google.com>
> >> Cc: Kent Overstreet <kent.overstreet@linux.dev>
> >> Cc: Hao Ge <hao.ge@linux.dev>
> >> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> ...
> > Does #NAME in SECTION_START() and SECTION_STOP() stringify the macro na=
me
> > "ALLOC_TAG_SECTION_NAME" instead of expanding it to "__alloc_tags"?
> >
> > In alloc_tag_sec_init(), kallsyms_lookup_name() will look up
> > "__start_ALLOC_TAG_SECTION_NAME" and "__stop_ALLOC_TAG_SECTION_NAME"
> > instead of "__start___alloc_tags" and "__stop___alloc_tags", returning =
0
> > for both.  When compressed page allocation profiling is enabled
> > (sysctl.vm.mem_profiling=3D1,compressed), kernel_tags.count remains 0,
> > causing idx_to_ref() and ref_to_idx() to misclassify built-in kernel ta=
gs
> > as module tags and dereference an invalid module_tags.first_tag pointer=
 on
> > page allocation or free.
> >
> > Using __stringify(NAME) instead of #NAME would expand the argument firs=
t.
> >
>
> Ugh the token pasting stuff always confuses me - I'll fold this in for v2=
.

With that change, feel free to add:

Acked-by: Suren Baghdasaryan <surenb@google.com>

Thanks!

>
