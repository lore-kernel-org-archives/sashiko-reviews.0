Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D98377560
	for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 22:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894526; cv=pass; b=TexrBE2GARtp8B/6BzB8h/tsHFUxXR9KUr6SMoG1mTpHDpJicCSgVhyG97kDta8sA5NRdUJ7fDFb+bVe5OU0h16Ev1qkEKUajkHl3lcDKrBNQYK5F7SAJm3HSUncNN/TrbpbCN9BlMWyNjsVoY5/kmNSzvSLip2upbQL+wYsrWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894526; c=relaxed/simple;
	bh=0fCXXFEDAD7mvMeuL7r7BbbiMn8MPj1+tl1viAJTJfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dkulgHVmgHuWOqwSnNdTQ7nI/tFo306SMCZh0o+AWSposOJ5LxiAF9r5LvcMy12sJRX9S488kUxHj6nBpWZswvF58k5exs7aAuJW2TjpjNlVzcNiwG7DEPl33P3aPNOn/1/hbdRV1HITeg0ygFCSUALzPWIlYKA6JtMnUd48xDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8HBx+sT; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8HBx+sT"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso1095946e87.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 12 Jul 2026 15:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783894522; cv=none;
        d=google.com; s=arc-20260327;
        b=WQSvD0vQgNFQv4+92RBT9WY2EQNeZGJrChDZYSWmLZN7tA8DwEk4WJpeAiYUVQ8pqR
         /eXAabGWx1KebQLT+NTyLpWzJi+eOEENtKofUw0rXeaymB1W3TeeJOSb6zBog8rVzf1p
         vxOYnIzy8t+nXAsPozk+oa5+b4m/9qXTGj9WV/h+qfOrFwOC/m6N716+QLDS42fCUuG6
         1/XKHjeGmZu+9UmRYoaA4e3VxDZshnGOUxQ46bdiuRgyh+n8r1/nFa/gAyWJHDrFRlyN
         VMXTzCl4qsgx4ffe9iDK/cRmg6HvKpeM+gs2Mog5dtBTxzJaYl6z11MzOc6Ubk7c5DXp
         ytQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzFgxOk+HAGOIQ1gtBaMzwBhzfd5e2hGicmuSHTdE00=;
        fh=qZ573kJbboDlF5ZdFSpXBOtsvYGibtZSqSfyNLJoExQ=;
        b=DzkGZqpFqi9OxjJZIHWR0VkZSi2+iuFFbklBGX0RZ8MHigqjClpVDFWgUlR8cY1TSH
         Qx5wx9BtrlfTw5vgx2iDyLlHGT5kLPXtYWIkLuMoKyeGUYaTspSsyuvcKGW5b0lb9SM4
         N5p7tcEHzp/BT84m4Eq8UI5kr43y93VU65r7qtaHS+geigiTw21GqdhKLSP2zLa1fq8p
         VwpdlvXmLPzoUkTBfTioNHhdUcnZeLD4IiOeLlwTz6ydMNEuxwFvJrB1SIl9NcGneaFc
         EIFJ7Hgx9JbfmWhkYuTEme3v4A7F5aXoqV5t2bPmg7Y50TqS8Y+I73zpROhJvAZGBy0e
         eTKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783894522; x=1784499322; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzFgxOk+HAGOIQ1gtBaMzwBhzfd5e2hGicmuSHTdE00=;
        b=A8HBx+sTqDS3TVJQy5dxHnafAZOiEQX/iLWFC7+ADXdXNsDhkQsSab6uYkfD2UH4iF
         61I0ObAmYLl3Sw65Wse2jzB2V9u0U87W57sxgKIhWOO5kVBZRRYsQqNXtNIWG1jYTUNc
         cGQMOPcVqaOemM5EXprNZnmrFsRAwU+jds3uisivZljjY07y6l8IRsHWpq+N1RR+uMQb
         /7ehczmjmZGSB7Y8SOnQpp6qiNFEz3DbuIFXxTXG/MbRsTQq0rC0T88JLEY44xOV995q
         F9UcixbPl8e/mVTPZjfOZ+5T3UNhLH8lbTEQDp6bNkCUeuhQLwO3Yunqzv6cpLW/kQT3
         ONKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894522; x=1784499322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzFgxOk+HAGOIQ1gtBaMzwBhzfd5e2hGicmuSHTdE00=;
        b=Y2DQuwzBy70gQLj//zP5FJJT+DSrlXglmS6sG0ECU8Jo728z9YEeecppGbLz3HdLra
         So9YYTZ3lYXQt3L3HC56VNaij9Sns1vYIXADXAsc0jeh1+gxwOecpZU7yzTXVfpRzsh8
         Ag/sFRGzO93/QFAqzABA1IfuGNo2inTuqBweYkArDtFrh9A6hLP9GJw/q4toGZcrHugo
         EhCPtNeSsZm67ohltei0e3uEiq4x/iPC7dvVR1BK1Vi9dOeG0uAKpfjMTsu3uLMdd3ci
         PMwRoAEilhVcclqa256I1vhOdmsrpayLQYOo0OeUUh6ZKhY29u5qG70b975zLuVpG/Fg
         6cQQ==
X-Gm-Message-State: AOJu0YwAt3s2MTba/a5yarHlArM+BdpncsgzaUooS7n0i0PY/bbL35zB
	sZsqnnXVxXzbS5WAtRng2pSYLcKilA5WJ4bv8/5IOgGs04PY3p7UPQC07jy5qQbBi0oxACUlzij
	exoGp9fJh7RZBbH41DbHa3IjhuX4jw6GAWA==
X-Gm-Gg: AfdE7cm87HHk+BTQz6ONjCslKOWZ1UuK0MpxtoYizhGBb7nkhErn9sj387RTbNKK14Y
	CI1FtdUwjxbRq+J/DiMGjbGrhhcrMjludTDuTuNwh3Bss8F+PB/VEA90al13Yx2tkG3lmeSSjsA
	SRhgXpIvghNfvJ+q4iaisK3MVIvlM/qoSV2dghpupKjTsXjliDuE6g8RTnAsdGtj40dym6RtbMg
	TLM0SzkCb4cDLSSu2lfQtWKVx4smHd6Dv6y5mg3D/WdVP2pyD/fgT8vR7KkxJK6dUJoNGbr+DnG
	Xs9QtBKskeFOLneiKFMdLUIt/A0UFD1FZOJjFLDoeB7JkpoJkeclZNNLl1edi4S8/aPOuJrnDB6
	qhHylUjJiu9zVIQ4xCNdSwusyi1TheVMi0bx4kKQX225jIvxfJt/yDi+ickv6n5pSpdtUPhoeWj
	wrzMOamuM=
X-Received: by 2002:a05:6512:159e:b0:5b0:20c6:a9b6 with SMTP id
 2adb3069b0e04-5b0236b9303mr1400872e87.56.1783894521684; Sun, 12 Jul 2026
 15:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260712220039.924958-1-rosenp@gmail.com> <20260712220039.924958-2-rosenp@gmail.com>
 <20260712221110.7A0531F000E9@smtp.kernel.org>
In-Reply-To: <20260712221110.7A0531F000E9@smtp.kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 12 Jul 2026 15:15:09 -0700
X-Gm-Features: AUfX_myv349aji-6oOm_gzkc6hXvmyh7Nl69nJb30alWyDMkR4Sb-h3tn5_dgE4
Message-ID: <CAKxU2N-w_Uccz=upLvOVBGVy5p5UYYv8+znhc4w1rM2d8b-pQQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] dmaengine: idma64: use kzalloc_flex
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, vkoul@kernel.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 3:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] If `idma64_prep_slave_sg()` is called with `sg_len =3D=3D 0`, it=
 eventually calls `idma64_desc_fill()` which accesses `desc->hw[UINT_MAX]`,=
 causing a kernel panic.
Fixed in the second patch. This is just sashiko being broken with v2 patche=
s.
> --
>
> --- Patch [1]: [PATCHv2 1/2] dmaengine: idma64: use kzalloc_flex ---
> commit 54aec29a1bbe69497782adf915ba6169fd73e345
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: idma64: use kzalloc_flex
>
> This commit refactors the idma64_desc and idma64 structures to use flexib=
le
> array members. It simplifies allocations by using kzalloc_flex and adds
> __counted_by annotations for runtime bounds checking.
>
> > diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
> > index 5fcd1befc92da..d914f50ec3096 100644
> > --- a/drivers/dma/idma64.c
> > +++ b/drivers/dma/idma64.c
> [ ... ]
> > @@ -307,10 +289,12 @@ static struct dma_async_tx_descriptor *idma64_pre=
p_slave_sg(
> >       struct scatterlist *sg;
> >       unsigned int i;
> >
> > -     desc =3D idma64_alloc_desc(sg_len);
> > +     desc =3D kzalloc_flex(*desc, hw, sg_len, GFP_NOWAIT);
> >       if (!desc)
> >               return NULL;
> >
> > +     desc->ndesc =3D sg_len;
> > +
>
> [Severity: High]
> This is a pre-existing issue, but can this lead to an out-of-bounds acces=
s
> if idma64_prep_slave_sg() is called with sg_len =3D=3D 0?
>
> If sg_len is 0, desc->ndesc is set to 0 and the for_each_sg() loop is
> bypassed. The function then calls idma64_desc_fill() which does the
> following:
>
> drivers/dma/idma64.c:idma64_desc_fill() {
>     ...
>     unsigned int i =3D desc->ndesc;
>     struct idma64_hw_desc *hw =3D &desc->hw[i - 1];
>     ...
> }
>
> Since i is 0, i - 1 underflows to UINT_MAX, causing an out-of-bounds
> access on the hw flex array. With the new __counted_by bounds check,
> this will likely trigger a panic immediately.
>
> >       for_each_sg(sgl, sg, sg_len, i) {
> >               struct idma64_hw_desc *hw =3D &desc->hw[i];
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712220039.92=
4958-2-rosenp@gmail.com?part=3D1
