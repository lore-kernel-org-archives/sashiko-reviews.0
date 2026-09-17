Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DE483833
	for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 23:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687150; cv=pass; b=PalwBmhIDTWuGMerWRtL96+Mb8kZ1u68MBmRveBjNeGNjYr4isUI3cbZAymP1Oqft2+T3JkZtd8RFBAppgaTencchY6FMDRj8vH/1QWXMAoYxXq0wyjeE6zGLHKoVULl70090TmpTImI61uni5zTrGI5VDO92U3160EitxdpiaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687150; c=relaxed/simple;
	bh=MDmls4DMKGmzHMtCpmMQ+wf+WKA1TNJaM9WR/ky9zbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuzT7bRfr5BY673u6GFgBRhneUqgQe0rw8cGmlo+WNly7XurvcUYbZPlXIWGPniLBZMgPFz1csmFudL4Q/m4QACcavUBm0BztlpOjrsrmmZQ8Crqq9qVYWruCSeAlXDCFGFHKKLmJZifomX+Ea2QNYdZ03BfMAbHF5JQISXjFYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNGnjvZ/; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNGnjvZ/"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aac929eso246454d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 17 Sep 2026 16:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789687143; cv=none;
        d=google.com; s=arc-20260327;
        b=NCVGW8eetiWv24RK4ROaSgLBfndhuX2dVT1arGqwmU9Q0qt9iHe84e5MtiXoyEkvRe
         CtNoROBE9m7hQPQWBlfF5pQ1tNIH5U2mB0km3PEa2mHoZbfD5+O7WlD5fil4DaR123Z2
         LkvaITOn3HvArPtzoxoQxJ4NzdKOYReH3JD7Sjp4zm0LNIhPLBlzHGO1uV6SygF8ZlVE
         k/JBpWamVJM8ORsOQNzEYDiGAwnOrvxR/otM/WSplMDGVb/5BO3UZGM4XI4HddCLzP5A
         LfTHE5EreMdiUO8Atqr0hKPGz390WNHM9xGbKqgTAtio85aScJhBpWyjz8Owk9poCyWw
         bPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2XagsX8bBU1jjmpUfXKrlW1BPZCFHkmBoZ36ck5PtA=;
        fh=gfEc681R0i3FJ8dgzyR9qPe7TKiV81bK89zGhdxdKik=;
        b=H3de6y3JdT7RoEXBTbvHZnx59dnGFy7ig4zQ+S5hgClITMXo5zjL8OZ4VPc3Fp/Cpu
         qxufjrxbm9xah5YBnclTv9sJ96z7cwcENm2kYOmBR4bSLXBowzopUbiunk7PrpMn/w0B
         Zz2aTC08ufdl9omJVsj9XpDyQ631C1aNybm2Hfbj7AfVZMNQxiWzHEd8ra1NZAA6r8ar
         Zlu4OUvFSSmW1RT9hD05rrKr9ya79dn6lM7j4+4d2sSUoNEgClhkGtcyPxbsjceoZduX
         Sm6y2kDsCaAzuBwVA7+zfXn7UAPoaVmov/X2ZwUofhuzJglCggw5zcJEnlT+A9pzRk/0
         QaOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789687143; x=1790291943; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2XagsX8bBU1jjmpUfXKrlW1BPZCFHkmBoZ36ck5PtA=;
        b=KNGnjvZ/H2ag81vsqauplB5tgcACEpdYY64QV9Vvus3g2IFXHdFkFk9lbyI06PPfMH
         dice8xd767pJ/Xb6Eh+Hv3vHkMlrF7Yiba1f/xMHknWQXSz8k3x6mVnRX91N5XkE6vLq
         hF/45+rLLGKSfNd0tUKZ6+T96NS1Yro8cn3bs94jTbcnm/gMqCU13e/sXtX0us0spg5N
         bvSCtHNcVZLWx/PyZ9r5BHXyJjNuu06t8uqLOHPBkbMBSWPxGiXdLyuG3Ug18hnRIHM8
         C2WB5PaTqcAlHJQ3OQjeClcAGs/taj0+5ks8HC7w2mVRHPRpMmG+rsLwcTCwG+wp0WVe
         cDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687143; x=1790291943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2XagsX8bBU1jjmpUfXKrlW1BPZCFHkmBoZ36ck5PtA=;
        b=xaoE9/CJhGI88HZGdn+ihIWb+/fF2+FXtR4+iqd40ynkA5wui/VGjNnz0F+5vCoqzZ
         Pxzgfd1dUHVJRhmLPUVKqQCUy+USUEyN+nZuuVc43aDIOIYW+XA1k2Hf2I6eS9Viu4aX
         CIP3eE6jAFhVPJrQ0psv923+ZbZh7iOZgNdk6oMxDsLRVJaQWyIXY+o3Vrjwu/eH4JAj
         yYtX28InctaM6UBjqxRRxOnpWTzPTmveOBYBjEI5PXyO01oXV0fRcWny5+yJ5TWeDXh6
         RLJmrNfe80djErajEvFq1QZsIvS27G/7OWkvYVyosLkxpJ5VtnC2AwtqMI8/qHWbnft/
         TFbA==
X-Gm-Message-State: AFuF++leEjGYJUJain1Byv9nzjACFVmEKdu1M668tzJOqwLZykiAZ+KA
	w1t/BjZ13pR6DCbSI9nNjGgJCCze7L0ArE310FTbnDGDvSPwmUYaLeuNlxFMBdHk4JSDeSZ91EM
	t6nnu2i/sdtm7HWO7oy756RJ0w3B2YD7S2HA5
X-Gm-Gg: AYBFou0lH7GdDgxiKKv8cpQhu3RtfrJfq79p5cf9VUb7VqXu1lZpjwp/iSUz1LW6WTm
	dV0pXFrIqL9ifp6PMX2g4M3U6die+wCQ3+RBdUXhbpD6FJQPG1vwCr6Ai3pSKKahghF0wI4CePn
	48yOSJUNwJWHbZzFo3e+8wG3SXsvZwsjcwLMT4o9mqlNHuKYxyPxW6PELBPyHH4UvZxhcGN9+TY
	RZ5dndyttHIxDyhQI11obERm1ghq4C2Ym7e1QSmps0IO5RtPCzA/rpvyD3+NW80zYAaEzRgWPPL
	+rl/79XGh+BihUVF10pYyzsq5ZoNfD+hu3b2AOwSo/p/z5ysZyYJWTmFA1tUHToJJwHsCV2OVzj
	WyWjJg/WCKhb9XYShgKaPMEQ2SZS3qKc04JfwpKpaMyI=
X-Received: by 2002:a05:690e:440c:b0:66f:c1be:a644 with SMTP id
 956f58d0204a3-6717fd8f9b3mr177202d50.54.1789687142763; Thu, 17 Sep 2026
 16:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917163553.1742580-1-talesam@gmail.com> <20260917163553.1742580-2-talesam@gmail.com>
 <20260917165042.7466A1F00893@smtp.kernel.org>
In-Reply-To: <20260917165042.7466A1F00893@smtp.kernel.org>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Thu, 17 Sep 2026 20:18:49 -0300
X-Gm-Features: AcwNN1X2qQB50H7FD8zGbqFyjanOiNGftj2LssNSFrprx0J4Khv2MWqFXi1u3rk
Message-ID: <CAHBRX4HxqoXm=Y4CgNZkngPEZZDe4f=Ai1y6g8maRhuAeM5feA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/xe: Capture devcoredump on TLB invalidation timeout
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch - that read is genuinely racy, and it is my patch that
introduced it. seqno_recv is written with WRITE_ONCE() from
xe_tlb_inval_done_handler(), and I deliberately moved the devcoredump
call outside pending_lock (the capture takes sleeping locks), which
left the read unsynchronised.

  Fixed locally by sampling it while the lock is still held:

        seqno_recv =3D tlb_inval->seqno_recv;
        spin_unlock_irq(&tlb_inval->pending_lock);
        ...
        if (timedout_seqno)
                xe_devcoredump_gt(tlb_inval_to_gt(tlb_inval),
                                  "TLB invalidation fence timeout,
seqno=3D%d recv=3D%d",
                                  timedout_seqno, seqno_recv);

  This will be in v5, together with any other review feedback.

Em qui., 17 de set. de 2026 =C3=A0s 13:50, <sashiko-bot@kernel.org> escreve=
u:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] drm/xe: data race in xe_tlb_inval_fence_timeout() reading seqno_r=
ecv
> --
>
> commit ef794f6bbaafa679257b9fec9405245af4942e68
> Author: Tales A. Mendon=C3=A7a <talesam@gmail.com>
>
> drm/xe: Capture devcoredump on TLB invalidation timeout
>
> This commit adds xe_devcoredump_gt(), a variant of xe_devcoredump() for h=
angs
> that are not tied to an exec queue or job. It hooks this new capture mech=
anism
> into the TLB invalidation timeout path to capture the GuC log and CT stat=
e.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
>
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_=
tlb_inval.c
> > index 7c3bf32d9258b..7a0c04fac60aa 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> [ ... ]
> > @@ -97,6 +107,16 @@ static void xe_tlb_inval_fence_timeout(struct work_=
struct *work)
> >               queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fen=
ce_tdr,
> >                                  timeout_delay);
> >       spin_unlock_irq(&tlb_inval->pending_lock);
> > +
> > +     /*
> > +      * Capture the GuC log and CT state so the firmware side of the h=
ang
> > +      * can be inspected; there is no queue or job to blame here. Must=
 be
> > +      * outside pending_lock as the capture takes sleeping locks.
> > +      */
> > +     if (timedout_seqno)
> > +             xe_devcoredump_gt(tlb_inval_to_gt(tlb_inval),
> > +                               "TLB invalidation fence timeout, seqno=
=3D%d recv=3D%d",
> > +                               timedout_seqno, tlb_inval->seqno_recv);
>
> [Severity: Low]
> Does this code introduce a data race when reading tlb_inval->seqno_recv?
>
> In xe_tlb_inval_fence_timeout() in drivers/gpu/drm/xe/xe_tlb_inval.c, the
> pending_lock spinlock is dropped just before this block. Because seqno_re=
cv
> is read locklessly here, and concurrent updates (such as those in
> xe_tlb_inval_done_handler()) use WRITE_ONCE(), reading it directly could
> result in a data race.
>
> Could this lead to KCSAN warnings or logging a corrupted value in the
> devcoredump reason string? Would it be safer to read this using READ_ONCE=
()
> or cache the value while the lock is held?
>
> >  }
> >
> >  /**
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917163553.17=
42580-1-talesam@gmail.com?part=3D1



--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
