Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92AB3939DB
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 02:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648716; cv=pass; b=shmAZE1yysUaJk6IQHVc4A2n+V1UVOTLlB0lHrC3HcIxSKmkIXPet/REjLGrTd7liOhCkQXWUNGErsxIEX+fp58HZwIyagwLZdxNsUHiaSH3qthlLD/O8L6wV0udHkWqFj0OyJD2jyichzQc+YHlxAJEVno1YaUOA6gJ/EQHN1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648716; c=relaxed/simple;
	bh=gRofY94116ewXssUMqxmKOiWev4JCA1Bvd0JTvEcWgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcJe4oF6woWTsE0zydOKbNfKnvgqoXmbD3P5bRSRVfsAM2XPU9/8czFZcxnRo69XgAc5tKaifv5Secww4OfXlzfFRiAbIeD4noEoSangOPJhIrU3FTqpz/yTWKahrpQxIzsKBdOxNkvOcgw/Y68u9x4CXdAijv/gONcBiPzg45I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqJ662PN; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqJ662PN"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so16614285ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 19:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790648714; cv=none;
        d=google.com; s=arc-20260327;
        b=cKXBmHkFERoRKierwGqdHScf3Ko/+N1FUVppyP6nMjKgrJM6CLET61rEwWQn3z0ThE
         yiIGJZlQp//ZRn03VS4lkQFW+DvIaiQECtPCie9V65HT3XiIlDITRd3owxei+fNwUXYV
         efMdtB7nwVnGMkbml+Cvs9g9g7f7x/i77mm9x3r/drLDyNaJmlYn2LmMbEkpuoQRyl2n
         SSj5KxaXJRHv/FB3ef+4/WzJd/B32hbpsL/+/8qttlXXq4uLa5/47/ard4lsveKb83w2
         g0ExBsNgHhYw79/i0/uu0X+6s/qD49sZYrKa/V9TFxFvfxPD1hFiyQjMmtsNIOxzzVYZ
         fZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nkKvLbzRYukGPbTIPd09ia/Uh277ngkm3fC9shqQYaI=;
        fh=KVY0t7eIv11YRslAz9KeevdJaXJDzlNtDlgAvL43980=;
        b=IHrByD84vkjDESNlhinSkeBgfR1PFOJxLOtJNI8yYtgTvWvaHm+LRn8tIRjchDs3PA
         Aoq/lXy9HlP5AV3EewJzynhwATJySEi5s4Pnj3NK6MQuEf7fceZ1N/Tkbc0MqpWJ8Yf/
         m3uaoZInJL+7H6tlzT2grjxnuPkCwQuZRxlr8NHkow24wAqcHUJy315ut6PyjcmGyGAM
         twqZG52aWp1exF7W7O4uh+Mdp8t0v/o7XrqPoL0+8MicGR0d5+bpFVL2YpblhcL61G/6
         318ry9ukoAMVJbe425QmyU6kj9Oh/yrHbKoBQ6nRq6Az3mlw8hav44SCwyvdOxLq5DzA
         MXiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648714; x=1791253514; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkKvLbzRYukGPbTIPd09ia/Uh277ngkm3fC9shqQYaI=;
        b=dqJ662PNYj1g7COWNbl6vsO9Q2jE4nWAT5hxg//9Fs8TmtXrnP61uG41z4XoK6cCnM
         uT7szQGtaN+l7eHoxExmroXR7QB7bFLBiIIju7WY7UpogscpeyXOSECO2ROfUqKk6/GN
         u15pTNvLZN2SK0ejvSiGpyfYlZGKXrTDPcUy5y30a9M6qVlEGT/vF+eWQCNI5E9ZtldZ
         hE8zZUh6BC4iwub60Y94JEFC+T16MI4MuiQhE32awoNUG2o3Fylze7ggHkiBq21BfOXY
         HrQB0qIuUPZk+2GaS/Y7JMnt5RrXUETYW0TWMQtNIujZxqG/rfmsGLMl4iyRn3cQqoBb
         ssXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648714; x=1791253514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkKvLbzRYukGPbTIPd09ia/Uh277ngkm3fC9shqQYaI=;
        b=Jzrg7RWuKwmmVi8YpxpJ6f0b1XlwLkHgrs1o4bHzMx3iv/+/kiUy0SZ4i+wbC8tzBM
         Brb4DXaCJNSBMhNcueAS3RJNCJ8M2MD9DlubMHAcWLXT0WhkbWHuKK6ZEV59lUVULl5s
         +Mcpy2eOtF5mAa1kAJ9kzR/MpiaElukCWL/jhphZ25PMabtw2ljwy12MbLBjInIWPyas
         XtcBtbFcprahpwsowYaI4NYP2ixRgow9Q1aBxHTJnvPnQwIoo8QE3+V7UiekTlmAEg13
         dSUS4K1xhUaFu3xpwQg6JpLVYMIrX6NaCKTrNwk6wstJ7t5/YG1+5TKpB+U1D5XGra2Q
         paZQ==
X-Gm-Message-State: AFq9FYJUaxSoClvhqwVNMp+/tLTPYq8KQXouReeCIP1iCXQ7TIi2RgtX
	u0BXuuzQPA53fRrB1XhWWrHm7/ChT+uLtJY0oQuogMtQFwVRYM5OepNGj1TYRBYWpVWNNAoNV1i
	pwV0bdKHUycn5RKnmAAaQ1ZvVIJHzexw=
X-Gm-Gg: AYBFou2Sdv2orXYcKlJz8ZCWAZdmFVpj05woPYCbOAEun0pAY+Eq9gSYZaG6BkFeN0Y
	CPP05tTzTZ7hWuhYNvvyzqANFSQzhjT42KgktPU010gapQUykqvDvVRYPs96Sgf3wxbUi9V+64M
	0Iy+d9kSL+X+pmMTt4NcQ0vEZyuemQC0aTMon7NJPTx8cgIojhill/UzvVslN+6QUxAt51VYwXl
	SGpPOoBJzapXsI28FmEBT9vetpwMHNpv4mgKT2W9MoRoDSXMwJSZx8mSdPJirfEREvlnGmo6fkT
	wU8I7yMfowFSiclMxgbfMPi1JztlSzM+2Z1IdNwCbJzJIaQO3HvcdMTXSvFR/asRoMVn9UAmeUk
	xuLKBIwajGfEiAN8ldcsFHSdVGW+O7Xxcy1rN
X-Received: by 2002:a17:903:2f50:b0:2dd:c0ff:e72a with SMTP id
 d9443c01a7336-2df7dff64ffmr110127895ad.60.1790648713958; Mon, 28 Sep 2026
 19:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929005411.4105448-1-vineet.gupta@linux.dev>
 <20260929005411.4105448-2-vineet.gupta@linux.dev> <20260929010327.024281F000FF@smtp.kernel.org>
 <0499fb85-d323-4141-b76e-bc9812b1d142@linux.dev>
In-Reply-To: <0499fb85-d323-4141-b76e-bc9812b1d142@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 28 Sep 2026 19:25:00 -0700
X-Gm-Features: AclHuK8MvjEF6nKkv4Z6ye1ak46nrlLfbKnMlxuKQXs_Elcb-3k7e9WK_870Png
Message-ID: <CAEf4BzZJL3jkyXo7XwTYwH2St-eiQB_FNCM6ZP=_TzC_McW2zQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] tracing: fgraph: allocate shadow stacks inline
 with GFP_NOWAIT
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, 
	rostedt@goodmis.org, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:22=E2=80=AFPM Vineet Gupta <vineet.gupta@linux.de=
v> wrote:
>
> On 9/28/26 6:03 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] cleanup: mixing goto-based error handling and scope-based clean=
up
> > --
> >
> > commit a6de528fef00ef67da15965a7a8b3944fa92b053
> > Author: Vineet Gupta <vineet.gupta@linux.dev>
> > Subject: tracing: fgraph: allocate shadow stacks inline with GFP_NOWAIT
> >
> > This commit aims to resolve performance regressions with ftrace graph t=
racing
> > when there are a large number of tasks. It replaces the pre-allocated b=
atch
> > approach with inline allocation using GFP_NOWAIT, avoiding repeated swe=
eps of
> > the task list. Additionally, it transitions the RCU read-side section t=
o use
> > scoped_guard(rcu) instead of manual rcu_read_lock and rcu_read_unlock c=
alls.
> >
> >> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
> >> index 40d373d65f9b9..1c5ccc3f80d53 100644
> >> --- a/kernel/trace/fgraph.c
> >> +++ b/kernel/trace/fgraph.c
> > [ ... ]
> >> @@ -1057,26 +1056,37 @@ static int alloc_retstack_tasklist(unsigned lo=
ng **ret_stack_list)
> >>              }
> >>      }
> >>
> >> -    rcu_read_lock();
> >> -    for_each_process_thread(g, t) {
> >> -            if (start =3D=3D end) {
> >> -                    ret =3D -EAGAIN;
> >> -                    goto unlock;
> >> -            }
> >> +    scoped_guard (rcu) {
> > [Severity: Low]
> > Does this mix goto-based error handling and scope-based cleanup within =
the same
> > function?
> >
> > Looking at alloc_retstack_tasklist(), the function retains the legacy g=
oto free
> > path in the initial pre-allocation loop (just before this block), while
> > introducing scoped_guard(rcu) here.
> >
> > The cleanup subsystem guidelines recommend that for a given routine, we=
 should
> > convert all resources that need a goto cleanup to scope-based cleanup, =
or
> > convert none of them. Mixing these paradigms creates confusing ownershi=
p
> > semantics and is highly prone to double-free or resource leak regressio=
ns upon
> > future modifications.
> >
> > Could we either convert the ret_stack_list array cleanup to use scope-b=
ased
> > helpers, or stick to the manual rcu_read_lock() and rcu_read_unlock() h=
ere to
> > keep the error handling style consistent?
>
> And a third option is to drop the fallback allocation completely and
> return -EAGAIN and come back. Granted I don't have much experience of
> typical handling of GFP_NOWAIT fails and retrying immediately: would
> that recover at all or does that take us back to where we started ? Peter
>

Not Peter, but I don't see a problem with scoped rcu and goto-based
free/cleanup. Unless Peter objects, let's keep it as is?

> Thx,
> -Vineet
