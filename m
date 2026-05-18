Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F033E51CD
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095225; cv=pass; b=WC7NiciI8pw9Ohe9DRoSTpQbMrvNWgLOk1WZJNDUcqWqi3P/H64vUnmreQMfKojqg4W/Su67dPzbTax5bMm9dd0NcIqmUBqCbMu0cdATkMeCH6qXaVvFVQV5Fvtc6deD7gIxUpLW3/WhQvO/lduKwLvIjHiKwuLGq7YwbPl6P8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095225; c=relaxed/simple;
	bh=9DM4qFj/buo+UBPSULdadhr2vBlrJYfk5WdGNzc/i6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvmeB6nPRX3UBN20eN/AgQdShnAB0ei5UqAlv2lF4wbgPZQpeEsczVpq+C43g7dV1PZVc4kDn27QLQxkbxOldHJ2BK8bnJPCPSW1YeV3pXykxC0jzPrVIITAEMQJwzTiGEMmUg6NfFfl0xwkFo1LGnvgiw8rg7ib8dXLG27fzjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6D3jD3e; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6D3jD3e"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a748d5ece4so1979607e87.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 02:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779095222; cv=none;
        d=google.com; s=arc-20240605;
        b=Hye+6upYCJJQjuh8QwcBdB4ZHr91eMZ0FmUdtjUPdIkz/nqJOekKCRO31Vb2j+hqN6
         j/TWadxG23dIgppJ7E1pD+/6W49FMDyWvJpbMcP7PuhUKarjC8E7tetVBKa4nu29cYjw
         XRUhZBEk3JnnsWeJhzkA4XgwdymevKaLcA3zdYexMy0V63lHl1gcKaTe2/YGy0DwVkZt
         uke0VEmr1q77p23TgAUUatC4lgpokFj9hkGLQOJmtC6wO6DaeZ03aVh1z/Z5OYxv3R+d
         T/iGHic0wIMC7c/ZsNmsqjSN0cBeBnsG9yyBWJ7wgVI/3nVi+wr6PTaROwkY/o3CMA0P
         Rwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TmMV+o90q+i4tF81/qjwEZD+GrK37jZ87CMwSL7czsQ=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=M9it1/8FFD0PLBOJ/dcAP2CFJSWZgZbCtUks+b2cIQw3QPcvR/vj8qbayJbl5entbi
         r/jNlef4vYTFBV0ROdeRijXmcADsZWktJ1mj0Q95C3uyQ0OqyAdsZibGuL+0RrkS65WW
         SmOQ27ioCY6DBEEaagRb2Ohi+ChvRE00aNfwpgy9QvWY+Yjb9lzDkZU1TkKM1Aq3X0mq
         fLHLGzlt9PWAhtHtaLyNwKCp1sGG7NJWnFRoKGWjvCOQ0HCvbWFdB9jhMU6/eh8ww33Y
         o5OpV01/uZPIvBqlm0DUwkUu2CtmIFgKjJaYtHGK3mZ++kcMkxvw5tF9k+PzDKbukkCP
         whiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779095222; x=1779700022; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmMV+o90q+i4tF81/qjwEZD+GrK37jZ87CMwSL7czsQ=;
        b=U6D3jD3egy5/6bI2CSUH4l7n3/iumlDW/bdnH+25A4k1pRzkUdrK6368hQzyybMSLz
         fAtjoxj113LbVCnONwr7q2qHOoOl5FSmJBNd/+UgfFXdwaxptWq2y12hTOmmyREF18F/
         /GDoF41sdY1NKDqhlQZB8jnfIkpmqpEZceZNl8syXN8iA9bN5lznQWvRuPVJM7WHMfTQ
         oFRy6cnJuQfDILXK/thcmwpqadxIwINzY3DDu5BmZdiImmAIIqpgI57M09vjw6czEaYW
         ly+WtLkVwXTiSkdz9g0J3vKqifxcIb5iUUM3SI6h9IvGOsKWOB6sabyWiq6zTuVewWUH
         whNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095222; x=1779700022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TmMV+o90q+i4tF81/qjwEZD+GrK37jZ87CMwSL7czsQ=;
        b=a9YL0AQixtzyCHn1KhLELueIEtGb0XhhsWyXmwCJWMEbeS0BJPIT0vErCK7tyWw5mH
         Iuj4P2L6402IdK0prc0jagOcJbto/SubvLMTRQPHcsFLqQQOw8dXZfN+ZWpXQ/j9zsKC
         vbfhDm1GNv9GcDATgcHVd36KS7tFi6wv9q6YG1OFnGD0LCx/iurfgNNKlCUguIVczMRV
         KwK4kUp0SdhNxjl+BIclGRrL59OVtNN/yApz2E0ONWNR5YsNhPjc7e1OkQ5Mh8f7bayF
         ojWj0gWaRuAfMJUcG58AlCjBfFhPDwYRr8l5+/iIMrZIIhkpcUvczoGH/zgLgFrvP46H
         DaUg==
X-Gm-Message-State: AOJu0YwSd4CbQGDp46sVGkVS3lf7ZFIBjs91xhQ/zrcTzDhMVWYWdtn8
	ft73ocyJPKfQnwiNYuI1Z1k18CbYgWQf8GTXkwSc53zjsUBY9QjW0/tjwn+tTHu/GEjHYT4rXIk
	JP/o8mCuHH3841ATjy2VtShML/lANpCOWsHN7E42A+CBh
X-Gm-Gg: Acq92OHnE0os/IoPzFpbugE8oijSuXU4BhFLw/LLEt31mNPBtoI0lnhMkEbFb5A5bNT
	Ulwa7TsiggqucC9fo7pI1YDjARXplYKaKftDYQhOWoalRfQE37unepXrx29VyOlPyTDFF6v7YTn
	bnz5JtvROc0B+izvAf0jt2fwvrZ/9EuYcMkSp4JRjYln6gFlnkGJG+1hrvnYRlPqzPn7+TRF82k
	MoikzieF9+7qdYCTWl1l4lROsR4Q49cBszbFgFjwG3BzJe/gapFVbDG41CL3n3JGJY29BzO1N0e
	zEERQWPRWQ7wf3YcfvpIGycyLt5IF7htj4S4R1Kf
X-Received: by 2002:a05:6512:1053:b0:5a8:99c8:94b7 with SMTP id
 2adb3069b0e04-5aa0e616b94mr4663489e87.18.1779095221568; Mon, 18 May 2026
 02:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517063311.28921-2-kerneljasonxing@gmail.com> <20260518063407.C3B99C2BCB7@smtp.kernel.org>
In-Reply-To: <20260518063407.C3B99C2BCB7@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 18 May 2026 17:06:23 +0800
X-Gm-Features: AVHnY4LKrw0qFtbHGKqfXcu-V7tP9AzJn4y6fuq2eTHGnnu_X0lVCJt5SRs-J-k
Message-ID: <CAL+tcoCp19F2rNxYL_LoGsY5MuBZ6cGKSZsj6D7kvQZcYp0wJg@mail.gmail.com>
Subject: Re: [PATCH net v3 1/5] xsk: cache csum_start/csum_offset to fix
 TOCTOU in xsk_skb_metadata()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Critical] The `skb->csum_start` assignment in `xsk_skb_metadata` can s=
ilently wrap around 16 bits on architectures with large page sizes (e.g., 6=
4KB), leading to negative checksum offsets and hardware descriptor corrupti=
on.
> - [High] Software checksum fallback (`skb_checksum_help`) in `xsk_build_s=
kb_zerocopy()` operates on an empty linear SKB, unconditionally failing and=
 dropping packets.
> - [High] Returning `-EINVAL` from `xsk_skb_metadata` permanently wedges t=
he AF_XDP TX queue, causing a local Denial of Service.
> --
>
> commit a101fbe76c494016d6edebf7d5d5e0dc173c0af5
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> xsk: cache csum_start/csum_offset to fix TOCTOU in xsk_skb_metadata()
>
> The TX metadata area resides in the UMEM buffer which is memory-mapped
> and concurrently writable by userspace. In xsk_skb_metadata(),
> csum_start and csum_offset are read from shared memory for bounds
> validation, then read again for skb assignment. This commit fixes a TOCTO=
U
> race by reading these values into local variables once.
>
> Closes: https://lore.kernel.org/all/20260503200927.73EA1C2BCB4@smtp.kerne=
l.org/
> Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload suppo=
rt")
>
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 5e5786cd9af55..f8c8a8c9dfba5 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -811,13 +812,15 @@ static int xsk_skb_metadata(struct sk_buff *skb, =
void *buffer,
> >               return -EINVAL;
> >
> >       if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM) {
> > -             if (unlikely(meta->request.csum_start +
> > -                          meta->request.csum_offset +
> > +             csum_start =3D READ_ONCE(meta->request.csum_start);
> > +             csum_offset =3D READ_ONCE(meta->request.csum_offset);
> > +
> > +             if (unlikely(csum_start + csum_offset +
> >                            sizeof(__sum16) > desc->len))
> >                       return -EINVAL;
>
> Does returning -EINVAL here wedge the AF_XDP TX queue?
>
> If xsk_skb_metadata() rejects invalid metadata and returns -EINVAL,
> xsk_build_skb() appears to propagate this error without advancing the
> consumer pointer via xskq_cons_release(xs->tx).
>
> When __xsk_generic_xmit() receives the -EINVAL error, it bypasses
> the post-loop cleanup and the invalid descriptor is never consumed.
>
> Could this put the socket into an infinite loop on subsequent sendmsg() c=
alls?

I should state that the first two bugs are valid and pre-existing, so
no action needs to be performed in this series.

Yes, it will cause xsk to get stuck in the send syscall infinitely. I
think -EINVAL should be dealt with the same method as -EOVERFLOW:
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 5e5786cd9af5..c6cf2434a7c9 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1010,6 +1010,10 @@ static struct sk_buff *xsk_build_skb(struct xdp_sock=
 *xs,
                        xs->tx->invalid_descs++;
                }
                xskq_cons_release(xs->tx);
+       } else if (err =3D=3D -EINVAL) {
+               xsk_cq_cancel_locked(xs->pool, 1);
+               xs->tx->invalid_descs++;
+               xskq_cons_release(xs->tx);
        } else {
                /* Let application retry */
                xsk_cq_cancel_locked(xs->pool, 1);
@@ -1059,7 +1063,7 @@ static int __xsk_generic_xmit(struct sock *sk)
                skb =3D xsk_build_skb(xs, &desc);
                if (IS_ERR(skb)) {
                        err =3D PTR_ERR(skb);
-                       if (err !=3D -EOVERFLOW)
+                       if (err !=3D -EOVERFLOW && err !=3D -EINVAL)
                                goto out;
                        err =3D 0;
                        continue;

>
> > -             skb->csum_start =3D hr + meta->request.csum_start;
> > -             skb->csum_offset =3D meta->request.csum_offset;
> > +             skb->csum_start =3D hr + csum_start;
> > +             skb->csum_offset =3D csum_offset;
>
> Could this addition overflow skb->csum_start on architectures with large =
page
> sizes?
>
> Since desc->len can be up to PAGE_SIZE (e.g., 65536 bytes on ARM64 or
> PowerPC), csum_start could be as large as 65534. Adding the driver headro=
om
> (hr) could cause the sum to exceed 65535, truncating when assigned to the
> 16-bit skb->csum_start field.
>
> When the driver later computes skb_checksum_start_offset(skb), could this
> result in a negative integer and cause out-of-bounds offsets to be progra=
mmed
> into the hardware?

Ack, it should be checked in advance like this:
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index 5e5786cd9af5..1fd7a70e5d38 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -816,6 +816,9 @@ static int xsk_skb_metadata(struct sk_buff *skb,
void *buffer,
                             sizeof(__sum16) > desc->len))
                        return -EINVAL;

+               if (unlikely((u32)hr + csum_start > U16_MAX))
+                       return -EINVAL;
+
                skb->csum_start =3D hr + meta->request.csum_start;
                skb->csum_offset =3D meta->request.csum_offset;
                skb->ip_summed =3D CHECKSUM_PARTIAL;

>
> >               skb->ip_summed =3D CHECKSUM_PARTIAL;
> >
> >               if (unlikely(pool->tx_sw_csum)) {
> >                       int err;
> >
> >                       err =3D skb_checksum_help(skb);
> >                       if (err)
> >                               return err;
> >               }
>
> Does skb_checksum_help() unconditionally fail here for zero-copy AF_XDP
> sockets?
>
> xsk_build_skb_zerocopy() creates a non-linear SKB where data is stored in
> fragments, meaning skb_headlen(skb) is 0.
>
> Inside skb_checksum_help(), it checks if the offset is greater than or eq=
ual
> to skb_headlen(skb). Since skb_headlen() is 0, this check always evaluate=
s
> to true, triggering a WARN_ONCE and returning -EINVAL.
>
> Could this cause all checksummed packets to be dropped when hardware offl=
oad
> is unsupported and pool->tx_sw_csum is true?

I don't think we need to move the check ahead as warn_once is simply enough=
...

Thanks,
Jason
