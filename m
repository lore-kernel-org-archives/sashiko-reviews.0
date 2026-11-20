Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202674;
	b=i+irpOFR49k4Kdl63SYG7G2FXU/LAtJ/FeMmDvoVJ4gqRg8IWxUyqEv2r6CY1VvxoAr5
	 UkQnaiaeh9zFjcqCgr92kWPdnLvIDm8E009ebGQjAcHa8AUw8AUAvtfnQCuzQBu614UIU
	 ukBAClS+irXaWwIH149qaNkgGnMyyUSYkNLOTkpzFRoiydYROD86HV8H5repn5sjgpTgZ
	 GotcPGRgWBMzfLOJiwgAr9idjDXcgd4dqF3ms47yAigCRIAiA/jQbvNT1tlKvXnbWvcIb
	 XZvKBSDurQ8jrELZhoJMowL31HqWzl+4MLi5UgPhbnDbnU00JD6+5v31yIlSaqL4Izg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=EqIWlPRmhQa/qTttZkxhbBZ2a0xxoQ3QCxHq+S0xpPA=;
	b=Fv1MfsFoNCISP8KTTq3xVmzV919CzQ+FDHQISa43zHlM1MGdS3typ5xTb4A7xPWAagq4
	 SXSRk8NJa4dZYknZL+d1AL3Qq6JjI+Rnci8ZjHIMRhpi1tMF7k67Rao9yeGM7i7e4X7wK
	 2aefbxkvLIFFiubz5/OOirYLUh6gPwFlOupDxdY+3lt2DsqW1jfYHpUszjnmtGvLnO4Lh
	 6LzJG6ZGS38V+kk1q4S2EfI84XeIJHD+IQM+hGP1INr5mp7+uPsl5GpaWtNLWQlS8hau9
	 UW87b22ApIa1eoM52K682+joB6K+OX1cyMcMdS6X5Z/EofRypDtm42R0y8DRc7NhtnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtnM0rFy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373E606A6D7
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 19:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E373E606A6D7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtnM0rFy
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso796112e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795202672; cv=none;
        d=google.com; s=arc-20260327;
        b=n28mOe63nr9D/Pagg6thPYJiFkYmBzLB0OFNB0E5yA+thOAw2TXXrcA17IBXRd6w18
         kF6LQr0iyGn2/mSsI+XsdmkA+qRgwXH2QEXbbJIWKux6w3U9NcTCeZ0BBMxhyQUjNfT8
         PFVXElt2zF2eZtjfrXKtjZPuiFfVwj4P2WW8IdTOKwaDLVYFZSPULuoXF0+3k8ayidFZ
         diREAP4sUNfUFI3M6H9YEXn8GkSVFoLa9IleAiWcDBa8zolJpC6OGiCZUpx3q9AuNCtX
         l+B8S3gKXuxghpBexwRNlaQhpPArC6S1HOiBh3P+p8t72prw1Anf+Ng4BHB/7w3W2dsM
         jrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EqIWlPRmhQa/qTttZkxhbBZ2a0xxoQ3QCxHq+S0xpPA=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=ST/jRSwe+KRy8GNKyzb6FMZmpWBKRxDk8BvpcpJVvss0DCFQeTSXM7PBEifh9Sp2N3
         ZaYaFJ7AAgrPTiEJ9sFcmXwyBUyHwTCW3DCBjWHbc+6Ks4J1HhULRCYZRz4gv/wshRLz
         SnEhB61nGazQqxwf3q7VpeqAbLiLoidQehVL/1SjJALaXYFrq6sY+Ik13QHO5ju/I4mr
         p3knHnf60GqrQBofqv+V2Ss+X3yrep8bWf7e8YgDCpD0GIU2X44xOnkPO2EXMxonQNhA
         FSUNzY12pP0nn3omiOstpAyp9/umBNOA6P7buLqdDN1+CRxnICX31nIpj5lkWuUYSoh6
         jmzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202672; x=1795807472; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EqIWlPRmhQa/qTttZkxhbBZ2a0xxoQ3QCxHq+S0xpPA=;
        b=MtnM0rFyPqPjG+kuv0fiDffU7yHHPtdLygR5ZsnNAh1PO+Nq2kxFaa5i4i2XZpBWA8
         XWkW9ZutI414lGNpo9zDqSK3Hrdp97UdZMHBzPbG05uTDgg6I4WhnnCSGSnDwkEjeg/A
         G6E6dj+5Aos7DHgUUKXzySL+njx8QDH0iTGwwXc00fa5axxpsmMvHJKjKrpX8iSepZNi
         aw71vXSg/Lhb7gZ/FBxDQCQa1P7dxmfmGi/T6ygeXdgrJdP1rzio+c10aHy7b2kqg53+
         RlZse4xPPhCugT3Ga0R+zMYHyp10iLa0MJVBUYKkAUYrytXN3RQ2z39Po/x6oVP5JaEh
         OukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202672; x=1795807472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqIWlPRmhQa/qTttZkxhbBZ2a0xxoQ3QCxHq+S0xpPA=;
        b=lYiuIK8gmc33GoCyfdsFEu0xmrFE6jj9DPWn2i3dsz4sRAg/gliEWPYXzjKQxyHGit
         TaZvRv1MVH165NT5uN4Fmno1rFJyRB2/gv5qOg1ryFwokWMWe1XEaNpWGkAnl7Sr8M5T
         /+bGIXYV5xh5aj2GF6FB86KedjTHR93g/Tk4fQwuJ6JJ/Zn97zFpJgpYu30kHtEboFYH
         oZdZQILi/Av+gecNyou1rDdlKETNGjAKN37uKLU2pO5VTr63R9Thx3hWWc3+/XK2NRVO
         cJ8rq7PaOQwhjUBVvBf62z7o8nOm0AOVtVYq4k7tlXhnMSCHMilpYVEexd/sgr6CBwZN
         m1cQ==
X-Gm-Message-State: APuU4Z/0U2IUOmJvZiOY2olpFvp3bI+fKJRetCLrf9uvENFqgs6J5G2j
	rhKf97VZTl92ljycoWeSrKc4qTaxuA68EVsv8uT6ad5KOKGX5nBw4RMS6KdVJla65WrMic9RvGr
	e9+oMBv2WBsVIjHrceDfbyUgA7gLBrlSWMuep
X-Gm-Gg: AZFdTZco/MqBNdDl+pQwreG1hB2G4vf+02m15+tso+ObFyYuA6pysQvLfTic87PwpXi
	rEaf5vX5wHIdctPXmBDjppSE0A6MyJ1JTD1QC0uxEyABV/ZVxhQVpTTyVFbzIgfAARBI8D6tBGe
	htQ5dkdU+eZklkboIB8vyT0UWZQIqN7FHhcgAVbxnluMIVWGylQwd2xX/v80AzJAb1DGPikJmz3
	VFJTr/AHoOXTbwvJLlF5WVoxLXJTUjE3hc+zhaHabtoP1FrLnYsQ1+9GFajC0MJTjhDTFeuDLNf
	PkmlvFqHzbyDpvVcF2qKu8n7DA3lO84MT4/G3nuwd7MfCXFPpQxvbqURWMF7e0uoKvZHOoqyZFI
	scFhNPGXzy2nUb3zdC5VjxVTFcNea9U7R6GkS
X-Received: by 2002:a05:6512:a92:b0:5c0:a7f:3ee8 with SMTP id
 2adb3069b0e04-5c1bc6f6f92mr1247082e87.8.1795202671893; Fri, 20 Nov 2026
 11:24:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106072412.7909-1-kanchanapsridhar2026@gmail.com>
 <20261106072412.7909-4-kanchanapsridhar2026@gmail.com> <sashiko-outbox-202709@kernel.org>
In-Reply-To: <sashiko-outbox-202709@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 11:24:19 -0800
X-Gm-Features: Aa3M54rhTUbna5usUdb29tdk64fNtvutRquhcws5sDaGP6EBJACKMJdTqBzkNNQ
Message-ID: <CACpmpodxjJ3ZQt4xOsWfWQNjgMtPzKx0oGMy+mJTU1wxVWdMUw@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] crypto: acomp - Add trivial segmentation wrapper.
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] crypto: acomp - missing non-zero unit_size check in
>   crypto_acomp_compress()
> - [Medium] crypto: acomp - union type confusion in
>   acomp_reqchain_finish() on virt dst
> --
>
> commit c2a605231cabd5e0e15d6d778b3943a2c118d756
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> crypto: acomp - Add trivial segmentation wrapper.
>
> This commit adds a single-segment compression wrapper for algorithms that=
 do
> not natively support segmentation, returning the compressed length or err=
or
> in req->dst->length when req->unit_size is set.
>
> > diff --git a/crypto/acompress.c b/crypto/acompress.c
> > index c8b4b8589769e..ac4dc52668b89 100644
> > --- a/crypto/acompress.c
> > +++ b/crypto/acompress.c
> [ ... ]
> > @@ -242,6 +246,10 @@ static int acomp_reqchain_finish(struct acomp_req =
*req, int err)
> >  {
> >       acomp_reqchain_virt(req);
> >       acomp_restore_req(req);
> > +
> > +     if (req->unit_size)
> > +             req->dst->length =3D unlikely(err) ? err : req->dlen;
> > +
> >       return err;
> >  }
> >
> > @@ -266,10 +274,13 @@ static int acomp_do_req_chain(struct acomp_req *r=
eq, bool comp)
> >  {
> >       int err;
> >
> > +     if (unlikely(req->unit_size && req->slen > req->unit_size))
> > +             return -ENOSYS;
>
> [Severity: Medium]
> Can acomp_reqchain_finish() corrupt the destination buffer when a request
> with a non-zero req->unit_size uses virtual addresses?
>
> In struct acomp_req, dst and dvirt share an anonymous union.  When
> acomp_do_req_chain() handles a virtual-address request
> (CRYPTO_ACOMP_REQ_DST_VIRT), acomp_reqchain_virt() restores the raw u8 *
> buffer pointer into req->dvirt before acomp_restore_req() restores
> req->unit_size.  Writing to req->dst->length then treats req->dvirt as a
> struct scatterlist * and overwrites 4 bytes inside the caller's output
> buffer.
>
> In addition, acomp_do_req_chain() is called for decompression (comp =3D=
=3D false),
> so a decompression request with req->unit_size set will also hit the
> compression-only req->slen > req->unit_size check and write to
> req->dst->length.

Herbert, is it Ok if this can be addressed as a follow-on to this patch-ser=
ies?

>
> >       acomp_save_req(req, acomp_reqchain_done);
> >
> >       err =3D acomp_do_one_req(req, comp);
> > -     if (err =3D=3D -EBUSY || err =3D=3D -EINPROGRESS)
> > +     if (unlikely(err =3D=3D -EBUSY || err =3D=3D -EINPROGRESS))
> >               return err;
> >
> >       return acomp_reqchain_finish(req, err);
> > @@ -279,10 +290,27 @@ int crypto_acomp_compress(struct acomp_req *req)
> >  {
> >       struct crypto_acomp *tfm =3D crypto_acomp_reqtfm(req);
> >
> > +     if (likely((req->unit_size =3D=3D req->slen) && acomp_request_iss=
g(req) &&
> > +                 !crypto_acomp_req_seg(tfm) && !acomp_is_async(tfm))) =
{
> > +             int err =3D tfm->compress(req);
> > +
> > +             req->dst->length =3D unlikely(err) ? err : req->dlen;
> > +             return err;
> > +     }
>
> [Severity: Medium]
> Should this fast-path check also verify that req->unit_size is non-zero?
>
> Callers that do not use segmentation leave req->unit_size at 0.  If such =
a
> caller submits a scatterlist request with req->slen =3D=3D 0 on a synchro=
nous
> non-segmented transform, req->unit_size =3D=3D req->slen is true, so
> crypto_acomp_compress() enters the segmentation path and writes the negat=
ive
> error from tfm->compress(req) into req->dst->length, corrupting the calle=
r's
> scatterlist or causing a NULL pointer dereference if req->dst is NULL (wh=
ich
> can also happen when req->unit_size is non-zero and req->dst is NULL here=
 or
> in acomp_reqchain_finish()).

I left out the check for req->unit_size is non-zero, because it is
implicit in the (req->unit_size =3D=3D req->slen) check, and also because:

  - I did not see other places in acompress.c that specifically check
for req->slen being non-zero.
  - This is in latency-critical code. Fewer conditionals are preferable.


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106072412.79=
09-1-kanchanapsridhar2026@gmail.com?part=3D3
