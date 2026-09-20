Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9CA3E1CE8
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 21:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938364; cv=pass; b=lPKVPO9cazmBu5tS6rnZUgVBwNrdKRHr2aYgVmtEIJsNmLlKMxZUP44PjLRZAwemU9Tg9+K/SrPvMj0DT/ZSf9WHB2t03p01mosNT9kOpzkKskjcFGYw3mPsikU4m0OprsCnL9P1QoFfX04QUeky4dD3OHHEXXHcoOl+Oio4w+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938364; c=relaxed/simple;
	bh=ezRCTTrs6uvQwF5UbpYaqGjiPx6ukx27ZxH2gOL/sak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0b5idSu0pT7rqP6cZ8jwcFdpp6Ej0PIECneUDQ15z3WDSWfTKf+dB3XNgZJh/APq5jPME3aHuZn4Rg4u6f3KzvSmSVGCmIwcyD68W9xmte1iUkS+wKEfnVCiO+Z9w4uQ51N/UHruPIAxyXewFZKrY2gGKOM5mShqMKCGt0UU3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kXgwRJX9; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kXgwRJX9"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso3848342a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 14:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938361; cv=none;
        d=google.com; s=arc-20260327;
        b=k22zQhaMdStfNXYrK1l6KbtY7fXtM+9J540rsyzJ55e7evFX1fF/IPPcvIvR4cfNim
         mJH4erlVR2dfnS1BdIO/IeDqujU29iGTlkg0LNyLIlso9ka3h6f87q8pc5qAS+lC8Tdu
         Pq6nDoziOdhWvNcNmWNHICZXlrAmXwk+LRqt/lcVtGlzH6wjDnY1PFxSo30z7UFLJeXh
         8Ud3CEHeKgR9+woHK3KIRwWoN2TLIEG7Xs57kl/YSJIaFAGIm4TG6TsO36I2giDX6kZw
         97TYDLAMN++12MLtIAqERchK8g3NiQvCgkTBLWMjCmNpOlJoPkFuwD63Cfd10C2Nh/EN
         /7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTysyvua/pHRkgj+3i2IdhzgN1OTX4ZBg0dHDR1pdSM=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=QgfBUjemF+xX16R5sdycdYbkyFl80PKJUqympkYzrsBDM+V+Su8JvQO4JwxCwhWbx2
         Dmsvg5ptMtLq+5bosnpr0Pvn09HG8mQ0JVpZtMyyupp17hDJW0hi/wgFYUHlU1daWHUD
         /OsifxzTDrhNoaFTKra3/MaVtcJZdxheToAk0pB0A33g4zFut1rJ+WgHDtz/mPyHaYId
         jeISnXvXS8Hmwk0WEsTfqj/dQAsZ3C5i7GIUmRakvL6N4qVbjk6TQOZqwVYiWFwqgVQ6
         FP694es+tKGrPTOKome2hDrxDBNVuD7OPdv0sCw3deykI6fhJa4oDV//HX/2tfg3Es3n
         V9Dw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789938361; x=1790543161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yTysyvua/pHRkgj+3i2IdhzgN1OTX4ZBg0dHDR1pdSM=;
        b=kXgwRJX96rREDCnOAI1VUNw9SlJQlfvz//7Ov7BiERFRD9DG3Dr3kwv/rdqHD82nhk
         bi2uUMHfStyb7DG14twaPs/GCRE6bLc/S7AAn4qAKX3tHIQp+EUyFnk3vbhZO1kl0ssL
         DB01uzicMaWUtVa9BzKYvpzrwmfwpphCGCnfLwoABxjzEVkuQvwkkbvzklvw6XcTi+ZY
         loL2HhDT/qsVkgoz6IsIwv1OAty9Y5QqaXNkGTeHdCCiPO6XIubaVlZv7W2h1yTzG7vc
         wHD3ZAvkxaQa1fCGLQC05zBMduE1Dk2EIwPW2hJX8sEYfg6ciTGNsTU6Cogyrhc1izR5
         7gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938361; x=1790543161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yTysyvua/pHRkgj+3i2IdhzgN1OTX4ZBg0dHDR1pdSM=;
        b=g5p2AV0IoGxwNYZb8skTcc+Q1ZeP0PQSecGiT1VqcDRy51MYEigOJc9II3jCHN5K/N
         mRkuFlRNQvnt0HbspfsZdCYhahI7D09DJI3eTp/4Lrkrc2+wA8/2sLNfjrAoaeWeHc1R
         woiKtqvknTI0B4E0p2V/Bi/9Rc1qrka6IvX2TbW7nDuRO15f9HmhYP61vaLKkvzMk3/F
         Cgx8BCcFh2QqOqc5uvn118d4cgMmP5pMDXyrztROErr0lgjAm2QyVqcMYNFFJb3xo7WD
         DwNaz82/n5LDFegwrodJ9uKHFQqSZ3RiRzxUDowjUlR/ysKo7yIBtGBcPj2VmZZ2wSmU
         MV0A==
X-Gm-Message-State: AFuF++kAsLtpwCBQ/4ei0lRjAPH2iE3PcDomX496innE3baMq0FNuAvZ
	ujORluTc2ppgZoa+7LVwzPN4r+JRSFbalWiVkb92UlBIE54YfJ2DMnRzk6BEwkQBkMT473HNJrK
	wD3SSuCRrvHgpDDvL6GMxp+qwA+b1IgVrcU4+czxvo0dv1z+mosdUPXw0MM4=
X-Gm-Gg: AYBFou2nr1KmSPH6Y9d98W+2L3A8sWrYrjTIuMfMRwcgeE5siYHr59rzyuKh/x4JBdv
	oOGohTUKj+VXPnrn/niqd07rpKjQP2lQXgtN/CJbOjER/RDKVrbF1jAecfB1HozrL44wL78Unfy
	fk5coLqqEjic+Q9YxKJjxMKX1u3yPOLd4Mo2Oj65mw9O6k3C0WQVM1R82swMbOiE/OfbbcBKa3j
	JmOk3H8ZdWsj0HHicaSlM/kNqHT7REMtGriZk3SIk28tui+MCbKiVZCktxqsscrMXQ/HLtAIuMN
	iCtOPi56crA2IXVt+C3cgasZ7jMo7W3y2b+e6fTkCw8SJL4PutEb3DABUborNhe7f40Gq8yJ+3W
	lcifrGZtEDx+eGhM6UugI5JFpDUKvLn2UHX022lF1VrFqH4F7etPoBLJNpHOCnbBWPHs=
X-Received: by 2002:a05:6402:23c7:b0:6aa:4529:4cb7 with SMTP id
 4fb4d7f45d1cf-6aa53135128mr6241277a12.16.1789938360721; Sun, 20 Sep 2026
 14:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920195633.3033620-1-kuniyu@google.com> <20260920195633.3033620-4-kuniyu@google.com>
 <20260920201152.8CED21F000FF@smtp.kernel.org>
In-Reply-To: <20260920201152.8CED21F000FF@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 20 Sep 2026 14:05:44 -0700
X-Gm-Features: AcwNN1VEogJIW5LP6aFMhmS47H4x3mFx-fob5a_vGfNv5ifJJNAKN1ium1p3ZmE
Message-ID: <CAAVpQUCXjzvPo868ygwA8-xzyYG8woDqSHpHctTB86i9WR_QSA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/7] bpf: tcp: Support bpf_sock_ops_cb_flags_set()
 for bpf_tcp_ops.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 1:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: data race in bpf_tcp_ops_cb_flags_set() on unlocked sockets
> --
>
> commit 56d7f542a8c499237807954e17f2fae35e5e276b
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Support bpf_sock_ops_cb_flags_set() for bpf_tcp_ops.
>
> This patch allows clearing or setting bpf_sock_ops_cb_flags via the
> bpf_sock_ops_cb_flags_set() helper within various bpf_tcp_ops callbacks.
>
> > diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
> > index c68d1fa323058..6d0452441b6c5 100644
> > --- a/net/ipv4/bpf_tcp_ops.c
> > +++ b/net/ipv4/bpf_tcp_ops.c
> [ ... ]
> > @@ -220,6 +220,24 @@ const struct bpf_func_proto bpf_tcp_ops_get_retval=
_proto =3D {
> >       .ret_type       =3D RET_INTEGER,
> >  };
> >
> > +BPF_CALL_2(bpf_tcp_ops_cb_flags_set, struct sock *, sk, int, argval)
> > +{
> > +     int val =3D argval & BPF_SOCK_OPS_ALL_CB_FLAGS;
> > +
> > +     tcp_sk(sk)->bpf_sock_ops_cb_flags =3D val;
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: High]
> If an unlocked socket is passed to bpf_tcp_ops_cb_flags_set(),

This should not happen.

The hook is only supported on hooks under sock_owned_by_me(),
and bpf_tcp_ops does not support socket lookup helpers.


> it looks like
> concurrent updates to the flags from other CPUs could be clobbered, causi=
ng
> BPF TCP callbacks to fail to invoke when expected.
>
> Does this code modify the socket flags without acquiring the socket lock
> or asserting that the socket is currently owned by the caller?
>
> > +
> > +     return argval & ~BPF_SOCK_OPS_ALL_CB_FLAGS;
> > +}
> > +
> > +static const struct bpf_func_proto bpf_tcp_ops_cb_flags_set_proto =3D =
{
> > +     .func           =3D bpf_tcp_ops_cb_flags_set,
> > +     .gpl_only       =3D false,
> > +     .ret_type       =3D RET_INTEGER,
> > +     .arg1_type      =3D ARG_PTR_TO_BTF_ID,
> > +     .arg1_btf_id    =3D &btf_sock_ids[BTF_SOCK_TYPE_TCP],
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> [Severity: High]
> Since the verifier accepts any PTR_TO_BTF_ID of type TCP here, it seems
> privileged BPF programs could pass refcounted but unlocked sockets, leadi=
ng
> to the data race mentioned above.
>
> Could the use of ARG_PTR_TO_BTF_ID allow a BPF program to pass an unlocke=
d
> socket obtained via helpers like bpf_sk_lookup_tcp() and bpf_skc_to_tcp_s=
ock()?

Same false-positive.  bpf_tcp_ops does not support such lookup helpers.
