Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35023AFB13
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925604; cv=pass; b=qCIcqkO7MMr3kpFFLEzdwETOeWKRmsmY9K61hTC7vpJ4EhN+STEUgOxFuacuZNijjTcBOXp6fbt7C9pnIo8JN/teMFjiXO98mG+/w6cjP0Zjefik9FLVzc2GUP2Iq4PIPlwhb0yMGcWnNlggRSqFtijS3bdkadWezOWevqjUSsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925604; c=relaxed/simple;
	bh=N63mq0f6cnN9iRIbW4gRFTVClqYEzt+UclEwUQzbMHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gjd5VPNTyX5jwZytx6OFdP7KncofDkQ/aknDwCQM5TwWpc6V0MBAkwpiFIonplfJvAkdDDrIa1LvROjZmcwC8pHWRyUDaNl4rW6MQph2HFzxSx5IKZCggRzRsvtM4X/naRx3GJVrjttI0KDcYvLwDnB2rrOM+nmOZijEOrt/2T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsmpXfh7; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsmpXfh7"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81eff3ddba4so8388287b3.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 13:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784925600; cv=none;
        d=google.com; s=arc-20260327;
        b=AcqgUT7luGZqcrL5siCOD4JBb29qLQZNlRs5UPkT5XbmVgwlQjefiMJAwPTX8kbHOD
         Py0oCMgSQ5teF0LECmPhb/Vx/5S5iyMEq61KTBV1hYx34rNgXN4EvmA5OHi7SwsKR07D
         ZAwSrM9/eZoAsczuu1v5s1sZOfomlHlep/+adsef2D/Cze2DsQdRNyIjOBZdr03msjJm
         YyvqbgpuLSRz+DkQ9q4LOJQEMvGjw4l/p0tdyqAQJfUT7M3yHDTPpuSLUdhoYHqgE8r2
         EcEmLcIpIRb0ZAuh4eeDz9vXfGkHnmjf5f9cvx+5a15YFhshVnrxrMb5LQ62ZOXC6cLR
         dg7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Tlk8Hky2z+LvqEkdAsADCEGWr5mvcivT/kkoIf/HzMw=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=kM8wOTyXDGF1xWsynJCWZVumGQlkGDiZm57jswnHAh745qiF5Iz1J/HGm9dz5DXCx3
         eFQu4qFRC1ZMaWvnKLE5QzTxZ/4ajMQzTjbTesimo23l/sPshEnwVhpa9XR/5Tra7YGY
         aUUyOl12+NOKqYe0fQCE/ehm7jYllKfPCNnNp3rTmp6ZT6+vQbe8zOw8/HgfOodzSOfv
         jdHlx9oGvK9+Xx0aiVedKdQe8c4sWJNvL4WRvMYV6LRm0Zo0sj0jQY7n7DH07N4vMVvr
         MQ0B6BPPAsFJzwAC3e796bm36uCQSApGECPHqAEZyznZQ0x29pzikd8b5y+l1/4gayxO
         dFUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784925600; x=1785530400; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tlk8Hky2z+LvqEkdAsADCEGWr5mvcivT/kkoIf/HzMw=;
        b=gsmpXfh7cffVN6fKhI7wQ/71udffxPXVerUl+fEDs10o72PeW+DhG6i0l6I/vPXD1V
         GuYW1zbposf8//wDEyHca6t/fKMSglv12JuxgR13gYGoRGS3NV6YhPpvgySBP8FvO7Tu
         K5rVw9/FfzMyU73aFyo1mvnD0/Ufrl+tg/RMn2DZDMXT/2xnTlrdaCrShFBSLdk3JpVm
         kYT+dM3q+V5aNxaZ0bZEItPrAF3Uf5Y572Mg6SeU6fj/2RLBalJrp2RSNIYTIWGfXpLg
         HAYX0QTt48PFItF9eDUyCQLi4h75PwM46Wvl/SK/6vALTcR0+dKrASGsaEpHBkbIQPnj
         ZHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784925600; x=1785530400;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tlk8Hky2z+LvqEkdAsADCEGWr5mvcivT/kkoIf/HzMw=;
        b=Od+DIvNRzvAlAtTqRn4NOhEDRA35xw9iG0DCWHcQY1soG+iPC2D9zMpZQ5jkjnWy9T
         Ix0o0Apwsq8T/Gh0kYup3/5e/xrd4JDc4mfVHcwpwjrnmiyH61BuS6cuAFUrWLLAChMD
         U7Z3+UPjGG8qTMzw0Eom/jcocHkDD80VpuEXjFlt8OaZIPq1F/7jnbrHS7rItWuP+Jbf
         5zmGlYqIftGB3xWC0tIjFDJxl2gCnv4RTXT/5BEOnUUYsHTRzTZEOPj4R6/2Xu/Vuget
         FSHaQjNAzSzw6dnYuT2HoivVeO1jfj6gTsv3XLkTyYPc25+HUDb8D8PeQgUVCPnKn0Q1
         1fmg==
X-Gm-Message-State: AOJu0YwLYehYAH5SMEglGkjlgQAkW3i1zduF7v4EqCrM8Zc7n8eKx2tF
	KXe6fBpO0Nqk/PRyyLdffC8/ItAwrbGnYMpiVGlt27wAmhyM+YiWGJEzwTUhMwyhmjToiLMIczj
	7lue5QAgyj+hvciVY5IqMpGvuTHqQxfqTPxyk
X-Gm-Gg: AR+sD13JB0EQtj6EzFzK7Ht6aH2KjoQvxANub2J5RquP2kVI/gl3btdbIEGm8xCjgK8
	Q/beZAo2WN1If8iYV02gl+VDsBrD3ku3TTpUWzFO4JTKjOqNJZAmwBXbNC7k7lcTAIvAysh/6FY
	+wsYh+FiLMdcKwo0BoY7AC1DETgD47rY5GeeXYQmEhrWe0aMOqwUc8jPtBorAdfeo2ber8TunLW
	81yOB2IU13jiLQoEx0SG7O+Iobw9x0nKpaK0yaGPaaOqDTEXsVsc/ujNtF/FQ==
X-Received: by 2002:a05:690c:3505:b0:81f:4247:de16 with SMTP id
 00721157ae682-81f69d274dcmr57187b3.24.1784925599823; Fri, 24 Jul 2026
 13:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724190813.1458271-1-ameryhung@gmail.com> <20260724190813.1458271-8-ameryhung@gmail.com>
 <20260724193219.226651F000E9@smtp.kernel.org>
In-Reply-To: <20260724193219.226651F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 24 Jul 2026 13:39:48 -0700
X-Gm-Features: AUfX_myJoICi1XGoqQSWzYiND5VArQEkN6mNun7EuNNguY7wyqgjrUrxA1ww1h4
Message-ID: <CAMB2axNC68jrpxBmyjbQWAkSin1b97O049rjuPR4u1dcW9FB5w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 07/18] bpf: Check fixed-size mem args of
 helpers and kfuncs the same way
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[...]

> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -6965,10 +6968,12 @@ static int check_mem_reg(struct bpf_verifier_env *env, struct bpf_reg_state *reg
> >               mark_ptr_not_null_reg(reg);
> >       }
> >
> > -     int size = base_type(reg->type) == PTR_TO_STACK ? -(int)mem_size : mem_size;
> > +     size = (!helper && base_type(reg->type) == PTR_TO_STACK) ? -(int)mem_size : mem_size;
>
> [Severity: Critical]
> This is a pre-existing issue, but does the -(int)mem_size cast introduce an
> integer overflow risk for global subprograms?
>
> If a user defines a BTF struct with a size close to U32_MAX (e.g. 0xFFFFFFFC),
> -(int)mem_size evaluates to a small positive integer like 4.

This won't happen. The early "mem_size > S32_MAX" check in
check_mem_reg() will prevent this.

>
> The verifier would only validate this small 4-byte region on the caller's
> stack, while the global subprogram is verified separately with a PTR_TO_MEM
> of the original massive size.
>
> Could this allow the subprogram to read and write out-of-bounds kernel memory
> beyond the provided stack object?
>
> >
> > -     err = check_helper_mem_access(env, reg, argno, size, BPF_READ, true, meta);
> > -     err = err ?: check_helper_mem_access(env, reg, argno, size, BPF_WRITE, true, meta);
> > +     if (access_type & BPF_READ)
> > +             err = check_helper_mem_access(env, reg, argno, size, BPF_READ, true, meta);
> > +     if (!err && (access_type & BPF_WRITE))
> > +             err = check_helper_mem_access(env, reg, argno, size, BPF_WRITE, true, meta);
>
> [ ... ]
>
> > @@ -9251,7 +9255,7 @@ static int btf_check_func_arg_match(struct bpf_verifier_env *env, int subprog,
> >                       ret = check_func_arg_reg_off(env, reg, argno, ARG_DONTCARE);
> >                       if (ret < 0)
> >                               return ret;
> > -                     if (check_mem_reg(env, reg, argno, arg->mem_size, NULL))
> > +                     if (check_mem_reg(env, reg, argno, arg->mem_size, BPF_READ | BPF_WRITE, NULL))
> >                               return -EINVAL;
> >                       if (!(arg->arg_type & PTR_MAYBE_NULL) && (reg->type & PTR_MAYBE_NULL)) {
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but is it possible for global
> subprograms to bypass nullability requirements here?
>
> When check_mem_reg() is called just above this line, it returns 0 early for
> literal NULL scalars:
>
> kernel/bpf/verifier.c:check_mem_reg() {
>     if (bpf_register_is_null(reg))
>         return 0;
>     ...
> }
>
> Because of this early return, the nullability check immediately following
> check_mem_reg() in btf_check_func_arg_match() fails to catch the NULL.
> The check relies on the PTR_MAYBE_NULL flag, which a literal NULL scalar
> (SCALAR_VALUE) does not have.

This has been fixed in bpf.
