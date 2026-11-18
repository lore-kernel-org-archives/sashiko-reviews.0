Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794989634;
	b=gcyXGwM8RLX9HHmn9tACqqvgASy9EC01kDndz8ydb/72tDn2VR9YdZ/x9Mhd0UlmQ3xs
	 mOIympBDM5Jr42g+xCgbBzoFJnCEC5L/8SP+rX6SxQ8rdFB9miLpXfGcw2x0cfHWvtZ5y
	 6Sv5+zorF9RjiWTmHL1iCR1Nfj/ykvh4GUCQa+fgnOe06NViTVB2S6tlFqnHnsYbN5rrU
	 UVGlUqVe1YiLxr81jiwUSlItCo/1ZgH/bDSgcnhAuGhLBIhGSPPga3t/M0pu79nsvvCgi
	 poyMKCiGd5z/flf69reI2jQsxszWMwM8ZagQe6KyR6qi+enuPmgG3xxYA+2eW8WuiwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ff00ug9gApPN4aPXoacgE+gcCygc8x9Aqk+39n/itA0=;
	b=PriV2udHV2nJCB88229nFl51ifEsjL+SmU3JeUMpq9z6uRCMKaUaE8GYiHNzrjMtu37X
	 0g/mGvmRhd3Ax5ef9cWJXHASy5zLWm9RvA3681oxyIcGhikpbNTCKB+92PZBJ6VWok7qG
	 iJFIY426rptawSG4bk1pRaJVklMezP7yQMyrPWSiLL1GdMbLf1rhADfVJV0eI+RAZmVIy
	 eyaNKdsWAKKKAKMMat5cYCat1qh8WPISAjo33JTnFMDwYw5kYyI0kLHESP6s5MWsJSlvD
	 NFz0mSz68uZJPTWIKBrykPblXidFQvGlIB68J1I0UgE6vQzYvO47Lseu1rBxHOm4E8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="CLmsB/0o";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387A606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 08:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9387A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CLmsB/0o
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so6201875e9.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 00:13:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794989632; cv=none;
        d=google.com; s=arc-20260327;
        b=T8pHzSBffTLj1DMxqeB9u5/JvhnJqm4bVhZsE8Uenjy3WGpnYJvHyiv+9eaAU27C3f
         YtHOm/lwKjRy8GETNNo9oCDd9lgWCeKo4LN30broswG5paSNkSpPKCfd3uAH78N4rFFj
         SP5//NTvK+Jz7KqApvnmx4FCm33uhpcQDneFxJUDXQVmBBAl2iGiGdget3H1AWPJv3Vf
         00jrqp01SSxKrp0F5wTFBJ9lM9Y5y87w/DrWqAf/nOKr24+OtzY512f2Z4y4yw7jtkOB
         hOH6pnmR+w6PgSSyXT+hZKJnYHubPYBqVjEAL2dWzjMpz7XRP0GRYiCjAxrB3EmaluKZ
         55TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ff00ug9gApPN4aPXoacgE+gcCygc8x9Aqk+39n/itA0=;
        fh=n9dU3i5kQPBG8KJS6aJC46h33B/C+3MB3reUNjDZq4I=;
        b=ercTTQ5MsCNAj3FVhWM/ZwFV5MTTrHb1FYWUMrauHGKfOOZAlh4yg4EISbQ7RNQYWx
         DPJ7grt+wpjM0sZU3ZoEhYFencP0CDM2VpO90k2r4ulEgMsBFsHGxs31+R0zlz6y/6uM
         aStFKgnI4S6V3FpyYcWiiVg7ahMNEFAHJ8GYVMRlUYyBZgcE5OWAzJlCKT9RPs4Onw8y
         peb9vrUuew8rs0d+QxIHdQznwpqFkQBqzUImCUL3PYQRnu7Ngkc80AulaG9lSbfpaeoT
         +NA4jWb9BPnVNoUc5zb5P2jUpab7D89yO7A8QlWW+n+OqtQaTZtfpyoZcJPmEwF6qWSF
         4YNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794989632; x=1795594432; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ff00ug9gApPN4aPXoacgE+gcCygc8x9Aqk+39n/itA0=;
        b=CLmsB/0oWRriDMMX7P3MWeVd//JQTLhjDYZ0UMrTirOX6AqodgjIdFNgCS61TBtGds
         TdM1DB5YW8T/D2fD0yP4XAoDsRA20inrO/+tefquJSvSBwuU22fYkKVqtCz/qK3gODmo
         BCEFvIAsSF+e7GaY9AtEMvo1+qbrVvBYbcmLv1PJ6umCN9qbZyHVzaLdG7QRYfh1uLWu
         efdtAYkuY4keLiafeUjHPxHcQmhKAqytPaadatdSWuAvmnWUSjYGi1MreoP5TJzaYcVU
         CJJHhK82ePJKCeqGszV1HXUDAIPik8ApAOUKl1Q1c8QomZu6VhlRrKKhB/y7++EUMKoI
         MBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989632; x=1795594432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ff00ug9gApPN4aPXoacgE+gcCygc8x9Aqk+39n/itA0=;
        b=MSp+LRNCZHk1v0nA3RKhdDyIKL6GIWi6y1I9A5qVqhr3+aISRNBgIOZ8nvWE80dNju
         tSdEVxA4nGTogh7bnO8iRjtM4WJ48vk4dLhmA6myo76lpmcUE46mLp+zAIbE+Dn++27Z
         BMfcbePBEmj/jEu96hREFMZeZl8JuP7wNkOuis4qLH+20afsMItSNf9nhLZxq97QqFvz
         VgEuCsNbXhkBfb7R3O3Xzw6HFysdpY60TZai58TSi2fdcEAAKYUl6dSOKx9zJ2HBEHsz
         sGRYD27Ahbz4AipMyorwYvaKLx6z55YNdJpL7c5xid21bMtGsSCsEPvoVssXBLOprzUK
         q58g==
X-Gm-Message-State: APuU4Z+SWRrMPBS9JXBdE854NGHkqG9dSqzx6LbHs7rd4OWBHGDUqt/4
	lcMnAzIkOPUerLnX1ifHUpy9oX6w66zagm2hs2Bt/8KMCsuJlIhwqYkY/GkFitRQwBpIRuSefgr
	mQSyuFbOa1oaD22WbqM7GWL3xlKQ56RaiNHMdjnXvlJOS+LY+7x0Ndxt6
X-Gm-Gg: AYBFou0seoQScTs0bz91EA1+DWiTKzUbptBNzFx2+OrKKb5PDS+sUQV0GlTZiT0pKNy
	FmdQd2/13jHs2ImP0peIFlkQ+Q5eAKdNsqsa4G5cw65uToMOPMpNDwwQ+X9Gd5MWweqUKt7SHFH
	v8LrjvM+dp5ikQytk2kiiugqwMbltDBBg01eOUeNryj6b5AGmX4VHW2hexjtmnldVxseVX5oQW8
	hN+1dSUsvEhdyi+Wl6lG/MizGBU0txXCa9di5Ep3/a5SL0uwOnkR8aOijFqJ7fxhOI0y6Jo2MCT
	Z/5aOrxpN0ot4X66RpuGQkU6s51URaIkr5We6z+aCNRihD/WlTY6MMwA9j9e0aK1gdlugNdU5fN
	StDKNjlMuDiLa7XZvrCZRrK2Uxj9XXNIIgtp6ccfnWgBwqA5ZVVBnwLjB2MutXe9MvaJawL0DUD
	ll2j7T9I1W6qMc
X-Received: by 2002:a05:600d:6011:b0:4a2:1050:aff with SMTP id
 5b1f17b1804b1-4bb7da12dd2mr31321575e9.6.1794989631363; Wed, 18 Nov 2026
 00:13:51 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
 <20261117-tyr-remap-2mb-v1-3-2a8efd4c8180@google.com> <sashiko-outbox-219548@kernel.org>
In-Reply-To: <sashiko-outbox-219548@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 09:13:36 +0100
X-Gm-Features: Aa3M54oJZdT7-ajHsujlEqHjejtQJ-wbRg89LRwChMZkFv84X9L5dIr8h3QO4eE
Message-ID: <CAH5fLghi4y1623FwMeRH60zZUqAoATABEJ-bBp8uPD1goYwPFw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/tyr: vm: expand sub-block unmaps to 2MB
 boundaries on remap
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, gary@garyguo.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 9:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/tyr: page table desync and GpuVa leak on pt_map() error
>   in sm_step_remap()
> --
>
> commit 890e6d1a0c182be186e5d6f90855d935bae30eda
> Author: Sami Tolvanen <samitolvanen@google.com>
>
> drm/tyr: vm: expand sub-block unmaps to 2MB boundaries on remap
>
> This commit expands sub-block unmaps in sm_step_remap() to 2MB boundaries=
 when
> the surviving fragments are physically contiguous and remaps the survivin=
g
> head and tail fragments as 4KB pages.
>
> > diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
> > index 1dd11b2b12532..bcc864b174284 100644
> > --- a/drivers/gpu/drm/tyr/vm.rs
> > +++ b/drivers/gpu/drm/tyr/vm.rs
>
> [ ... ]
>
> > @@ -749,10 +780,50 @@ fn sm_step_remap<'op>(
> >              op.va_to_unmap().addr() + op.va_to_unmap().length()
> >          };
> >
> > -        let unmap_length =3D unmap_end - unmap_start;
> > +        // The surviving fragments inherit the protection of the mappi=
ng being
> > +        // split.
> > +        let prot =3D op.va_to_unmap().data_ref().prot;
> > +
> > +        let block =3D Alignment::SZ_2M;
> > +        let aligned_start =3D unmap_start.align_down(block);
> > +        let aligned_end =3D unmap_end.align_up(block).ok_or(EINVAL)?;
> > +
> > +        // An end may only be expanded if the fragment the expansion s=
weeps and
> > +        // rebuilds is fully mapped and physically contiguous, because=
 the
> > +        // rebuild maps it linearly from a single recovered address. A=
 genuine
> > +        // 2MB block is always contiguous, so this never misses one an=
d the
> > +        // partial-block unmap can never reach arm-lpae. A fragmented =
region is
> > +        // never expanded, so its sub-range unmap stays correct.
> > +        let head_paddr =3D match op.prev() {
> > +            Some(prev) if aligned_start < unmap_start && prev.addr() <=
=3D aligned_start =3D> {
> > +                contiguous_phys(context.pt, aligned_start..unmap_start=
)
> > +            }
> > +            _ =3D> None,
> > +        };
> > +        let tail_paddr =3D match op.next() {
> > +            Some(next) if aligned_end > unmap_end && next.addr() + nex=
t.length() >=3D aligned_end =3D> {
> > +                contiguous_phys(context.pt, unmap_end..aligned_end)
> > +            }
> > +            _ =3D> None,
> > +        };
> > +
> > +        let region_start =3D if head_paddr.is_some() {
> > +            aligned_start
> > +        } else {
> > +            unmap_start
> > +        };
> > +        let region_end =3D if tail_paddr.is_some() {
> > +            aligned_end
> > +        } else {
> > +            unmap_end
> > +        };
> > +
> > +        let prev_va =3D context.preallocated_gpuva()?;
> > +        let next_va =3D context.preallocated_gpuva()?;
> >
> > -        if unmap_length > 0 {
> > -            let region =3D unmap_start..(unmap_start + unmap_length);
> > +        if region_end > region_start {
> > +            let region =3D region_start..region_end;
> > +            context.extend_lock(region.clone())?;
> >              pt_unmap(context.dev, context.pt, region.clone()).inspect_=
err(|e| {
> >                  dev_err!(
> >                      context.dev,
> > @@ -764,14 +835,29 @@ fn sm_step_remap<'op>(
> >              })?;
> >          }
> >
> > -        let prev_va =3D context.preallocated_gpuva()?;
> > -        let next_va =3D context.preallocated_gpuva()?;
> > +        if let Some(head_paddr) =3D head_paddr {
> > +            pt_map(
> > +                context.dev,
> > +                context.pt,
> > +                aligned_start,
> > +                head_paddr,
> > +                unmap_start - aligned_start,
> > +                prot,
> > +            )?;
> > +        }
> > +        if let Some(tail_paddr) =3D tail_paddr {
> > +            pt_map(
> > +                context.dev,
> > +                context.pt,
> > +                unmap_end,
> > +                tail_paddr,
> > +                aligned_end - unmap_end,
> > +                prot,
> > +            )?;
> > +        }
> >
> > -        let (op_remapped, remap_ret) =3D op.remap(
> > -            [prev_va, next_va],
> > -            pin_init::init_zeroed(),
> > -            pin_init::init_zeroed(),
> > -        );
> > +        let (op_remapped, remap_ret) =3D
> > +            op.remap([prev_va, next_va], GpuVaData { prot }, GpuVaData=
 { prot });
>
> [Severity: Medium]
> Can a pt_map() failure here leave context.pt out of sync with GpuVm and l=
eak
> the GpuVa?
>
> pt_unmap() has already torn down the expanded 2MB range in context.pt bef=
ore
> pt_map() allocates L3 page tables for the surviving 4KB fragments.  If ei=
ther
> pt_map() fails with ENOMEM, sm_step_remap() returns without restoring the
> unmapped range in context.pt or updating the GpuVm tree via op.remap().
>
> When Vm::kill() or Vm::unmap_range() later calls sm_step_unmap() on the
> unsplit GpuVa, pt_unmap() hits the already-unmapped PTEs, triggers a WARN=
_ON
> in __arm_lpae_unmap(), and returns Err(EINVAL) before op.remove() can unl=
ink
> and free the GpuVa and its GEM BO references.

This is valid, but allocation failure in pt_map() is a pre-existing
problem. It will go away once these page table entries are
pre-allocated.

alice
