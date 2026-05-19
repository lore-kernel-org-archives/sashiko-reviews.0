Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE7036C0D6
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 18:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216726; cv=pass; b=MJtaPHtB8JZIGBkPc3qUtvMjelwdlN4w3Gt/0TfBGMGMigrlqdejJpQHbc+OnymAdJxQNP+mKcd8NBQwbOLApsc4Ve6XjQ0j8Ofec0VW/hAUnR/UAfG2QxdxMuWe8n+IcEaBCqZC0iAF0Ts8hfJz9/rtLOj3+7Rx/TN3Zi4/W9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216726; c=relaxed/simple;
	bh=J1DOYXoQ50Kqq50Ha0/7M1Dv6M3XMd7yir8gTRFgKNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qyfxWdo9kyV4pkMlT0wQR12mYle3LrFhgl5f8v+OZU63AcJPE2KnL+6KKFrLT6Nsi90duKv2VwvYAQmWB5pdgG9IBgcKBrlGirMhw1RXiYuMl9TO1xBiuMoPh704SzXi/A0MRhuoRnkCMxCJNfGLh3WOUFaqGk45P2B+gsXZjBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaWUOYRi; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaWUOYRi"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7bdf83185bbso35610207b3.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 11:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216724; cv=none;
        d=google.com; s=arc-20240605;
        b=cHMozS6slPsrJxXLNRkRDhXsHg3IS8b5cQO6Kmon93a3oFNiooGKmcO4qW0jMFYSY3
         yn4l5AAmBeb266rkSAinMgfYL/HPFKuDa2VLpjobf8iqpfsOmsq85wKAj0COX4V1nGG7
         SqJ4v5A3hAqfvv+bNZkxwCR089oumqHy1exBTfE4k21dBUgReIb4LKiH2lqwR/IW7Kfo
         D3IPvsb7Fde2RU+tn5yQRo9c4VYHCxZT5K075fvduc/YL0F4AKT12aL4PXRTlsL5c2sQ
         0uQJlIseY8HpdHhB0nKfchujWb11HyUuqWTQSbtg4GrgemJvh/hSr111uzUxVRERPQpU
         xfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y0v4eEHup7uWRxuJ488zQzWFOVLc6XJagBWSyDGtp2A=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=XdWu52AXC+QxYtTS0GRxH3QBINIpn5IPv3qBwtLHhzbd+nBUlTmQJzCyTj+4xBdZTE
         TjSt60bKUtWIyzGQwICJmpLyBD6zgBMIRMyX7T19jtWQM/cwItbOSwsEPK2D2LYq8sTx
         ieyOs9hX874nc+guNTQBTR+eyG1wzuhtcSA+Ge3+f+7fH6aCy42sDA7MvhymizHc5OjB
         CKDPuALPjDcmz+dM/Ie3Uy3JFW4bMCG5yzg3MYeH3scxV8Urhy4tYS+6q4YUNoxJ1LYb
         J4SmWTAS9rVDE1H+BsFjjaS4TIw5uK/NcMoQ94yTS+nD6BODIb5zJpNGYdpQxA45Bs7P
         7M1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779216724; x=1779821524; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0v4eEHup7uWRxuJ488zQzWFOVLc6XJagBWSyDGtp2A=;
        b=AaWUOYRiZPN6g3AujVX2u+hx/ZtF40e/+c2TXv2mFl/JB1P/Rfl5rtLLNnFdtFpTSq
         BaZd92xv/xQX0K8OFM+wg/NCE645hlvRDe1LHddvSf/vSVq3RjI+kr+Dyuq22907RIfV
         i7/c4VF4GzngJ1d6QMU+JgwBn+GnMupS2ilLHsI/9UvUffpUwRNj2PkFnB57xsyhBB+H
         EPMRFcMfJKp0EzVGVA6DnOAslW6I7Io2U0RB8RZLff2ZMhmtbzN+aWRcfFaKYztQSTew
         SalMOoTJCmOU8eCqRgJeyIhkAMcNwNd81Wak3bcXIgRDlWM+pdwUCws4iQ6I8PNTzZBj
         We6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216724; x=1779821524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y0v4eEHup7uWRxuJ488zQzWFOVLc6XJagBWSyDGtp2A=;
        b=Z4NQGKoiNBtQiK4zvxkUtm4B6VRHvf4vfgayTNEp3Etcf9mEKYpFVRSq4KoiSXppCd
         1jVNKROi05YbX6zXhQz0nYf/0F8hYTnoWC0cbfDGvQ9nvgBds1Ce5y8DZdNrO/7MygAq
         Qs0U3ttG8YQ2WNYnxkAuWzmGbXtDr7VA3QUfltvYjcVgT439VyZPwdCubuGMKwfcUNTW
         y5CADUzw20KUrWobMdtkzWdXBLvUhRg3vPIJNXj0HRcHDtP75PZWyvMJAtXMVajRcLR3
         Mjq7T1iKXalE6NLBHOOUK9Rh1zwsP9k+QfPmV4K94LUVF7IIthjWbIb3/o9gCH7i7DDs
         w4XA==
X-Gm-Message-State: AOJu0YzvIpMRoQWFhu2wFmphOrsbUbbCv/iXMKDkKxHiEsUTbH8hVkFO
	DbLfzAYQ5VzuT4IhzxSTkH0gf9DeArSFgQ+O21KGPkXI9ooA3UFGHzPjTP/GwpQk5b909ymtFZB
	QOfmF7akZBaq/p4RjYI/tf3w1/0YMhUmkIjoq
X-Gm-Gg: Acq92OHWlVOxugCY8d8p/kJoX6mcTRmnf2CoD0ZOuQylDnuGq7V6t216SIvGBs7cM1S
	OyktzR0DCdlmvEfjf1AFN9wh36r+x4xJojvU+y1j9UmsAhM46qrdDBjjVYS0usqcEIXTsfNF/rN
	ej+bidZyCV0uHHcGTp44wB4lX0gv6IGkisYgQ59N5jJYvV4rsLjAFtlxgNiOYyBs/hwBoKDUmVC
	876HHQ11lhfAl2fOBnKVSaJPxke6ksfq7BbxEWWwDqMRP5qb/aNCx77Aq35upNVuB1vOVKOI6Of
	fXX+jUejSbHr94vF2TmH
X-Received: by 2002:a05:690c:3489:b0:7b2:aabd:535b with SMTP id
 00721157ae682-7c95b8275bemr231881707b3.27.1779216723881; Tue, 19 May 2026
 11:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519181314.2731658-6-ameryhung@gmail.com> <20260519184538.7A705C2BCB3@smtp.kernel.org>
In-Reply-To: <20260519184538.7A705C2BCB3@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 19 May 2026 11:51:50 -0700
X-Gm-Features: AVHnY4LJJTANE2G-zMmaNS4BPCZbX4vvoaum5PSGvKO3Cw88Pb5PYzIt-gsbh4E
Message-ID: <CAMB2axNDfA_M4bss4obQOMi0y6a99kFVUECeWhs_uyaWm7Yeug@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 05/14] bpf: Refactor object relationship
 tracking and fix dynptr UAF bug
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:45=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Incorrect indexing of `__state->stack` for outgoing stack ar=
guments in the `bpf_for_each_reg_in_vstate_mask` macro leads to out-of-boun=
ds heap access and potential memory corruption.
> --
>
> commit 936dee8aae85e40857f1379da85e7a73536e2261
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Refactor object relationship tracking and fix dynptr UAF bug
>
> This commit refactors object relationship tracking in the verifier and fi=
xes
> a dynptr use-after-free bug where file/skb dynptrs are not invalidated wh=
en
> the parent referenced object is freed.
>
> > diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.=
h
> > index 2cb4c7b0eab68..d83b9fbfef7f0 100644
> > --- a/include/linux/bpf_verifier.h
> > +++ b/include/linux/bpf_verifier.h
>
> [ ... ]
>
> > @@ -585,7 +591,7 @@ bpf_get_spilled_stack_arg(int slot, struct bpf_func=
_state *frame)
> >            iter < frame->out_stack_arg_cnt;                          \
> >            iter++, reg =3D bpf_get_spilled_stack_arg(iter, frame))
> >
> > -#define bpf_for_each_reg_in_vstate_mask(__vst, __state, __reg, __mask,=
 __expr)   \
> > +#define bpf_for_each_reg_in_vstate_mask(__vst, __state, __reg, __stack=
, __mask, __expr)   \
> >       ({                                                               =
\
> >               struct bpf_verifier_state *___vstate =3D __vst;          =
  \
> >               int ___i, ___j;                                          =
\
>
> [ ... ]
>
> > @@ -600,19 +607,26 @@ bpf_get_spilled_stack_arg(int slot, struct bpf_fu=
nc_state *frame)
> >                       bpf_for_each_spilled_reg(___j, __state, __reg, __=
mask) { \
> >                               if (!__reg)                              =
\
> >                                       continue;                        =
\
> > +                             __stack =3D &__state->stack[___j];       =
  \
> >                               (void)(__expr);                          =
\
> >                       }                                                =
\
> >                       bpf_for_each_spilled_stack_arg(___j, __state, __r=
eg) { \
> >                               if (!__reg)                              =
\
> >                                       continue;                        =
\
> > +                             __stack =3D &__state->stack[___j];       =
  \
>
> [Severity: Critical]
> Is it safe to index the stack array using the out_stack_arg_cnt index her=
e?
>
> In the bpf_for_each_spilled_stack_arg loop, ___j represents the index int=
o
> the stack_arg_regs array, which is bounded by out_stack_arg_cnt. However,
> this line sets __stack =3D &__state->stack[___j], which indexes the local
> function stack array (bounded by allocated_stack / BPF_REG_SIZE).
>
> Since a BPF program can push stack arguments without allocating a local
> stack, ___j might exceed the local stack size, computing an out-of-bounds
> pointer.
>
> When release_reference() iterates over these registers, it evaluates
> stack->slot_type[BPF_REG_SIZE - 1], which reads out-of-bounds memory.
> If this memory coincidentally contains the value for STACK_DYNPTR (2),
> could this result in invalidate_dynptr() being called erroneously,
> writing STACK_INVALID across multiple slots and corrupting adjacent
> kernel memory?

Right. I should set __stack to NULL in for stack args.

>
> >                               (void)(__expr);                          =
\
> >                       }                                                =
\
> >               }                                                        =
\
> >       })
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519181314.27=
31658-1-ameryhung@gmail.com?part=3D5
