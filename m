Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7896C360751
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560020; cv=none; b=cOpeEFBgN05+Vha6vTazfZ8JeeNX1XihKyDCmODAdEt80Zgn8uLX+ZdKbE3rz+LfPb2zi4/ac3d9cT1UGfpHpsBeFJGKFbPNDg3Z2BctV0dFrhMCqm+xhccvfju2UJQnSTdaUsR801zlX43BMP/dEndW9BxSmkniRCJ/qnFMTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560020; c=relaxed/simple;
	bh=/kK0EiqbtRxcXCneLjLSqWB+1SFHKACpn5JrEZdEokU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDzYH2Ts2zL6yVDMIQCI0YAvxtG0aaFNDk2SqoLHQzq0y6pFjoYRUE+3QLTyZ4kJEvc/gnbnwB2lg50RIXub1T35XFe3T4/dnNSsB7ukAQTWJoxzx+kE7yNCvhq1NNLy+VqemuDB4sRG9ZCYSaCeu0KPT3dIeYsF+aRX9XoB6eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0yz+bUP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0yz+bUP"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso170112f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780560018; x=1781164818; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR2sxU8/RVafv8i+YN/YPRdPY2nC6pIwxn29KCvs/x4=;
        b=N0yz+bUPaM9ih+SVnKsrncsNJb6GoV0VLQdc8NB2bN3abDiILpv8YNP6R+pM6F0aem
         SnZNyjvrG2TeSklTALKb0Y4CUmOgYRxAONzppYEFW5kFHPjqOZPOwziYuqoJLYbqghjy
         s0dEEqCdy79/6ULw0L7AClM9cqq3tCeqi6/8SnpjERQkQjd56CPqndRYJxMZQG6ZjW/E
         0nyBFjsr/QOBR3akmdX23stYoEIeIQav3pxlu/yyLgGylaazTfmfPlu2i6M2NoLYsXP7
         aI3uliNnZXYfR2QChD6sgdpiY+S6cJblmA4cnlF0quJQEXqj0xDlDMzH9icGtlQrhPfL
         N8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560018; x=1781164818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KR2sxU8/RVafv8i+YN/YPRdPY2nC6pIwxn29KCvs/x4=;
        b=rr1T0jUWRGZesSgkq6UF3rfKF+xmUxT22WG4YbFslggsAoNqr2xWmQsKoe7KKrrdwB
         IgjUkuRanq9EkAQ9YLfpzP+gflKfDS7XNUcOw407t7wnQh9SKIAhbFr8V/gCYuM0Ub/i
         GnnVdDtcaRv82wEUZP6WaUNJIuvoYsgErxNKre6P30Uf0+8JdI7FpZr05nA2GjU5c22a
         Jf+WBhMUVYWuF6aQfTr+nngqwhB0qTcanV7DHTaHfKnktkKJOZeXs7IBpE8VX77dluqw
         mJVvHRSXzzEOOuCXzwoCujhX95LHyosACI77Y1w0AFxe5oroqIGRem1K2inOutxEvqo7
         wLCQ==
X-Gm-Message-State: AOJu0YyJBbwp3bPKJL/umVjzM7za2clK9YjVX6eLWobWlaLk+0KDE9Lg
	ulseWysAr4hDd50jJPaMZ1aPo0ZZHbfZK7Ib0uOTySejymhT+rIbZB0LzV9Bag==
X-Gm-Gg: Acq92OHcnKT5/LbS4o4HBsH9z7BuIUFPFR/7Mi8b+1nay6DexgFhyGkhuR7nIS1GMsq
	ueX+Svhsfnhn5XIVy9pwzquiiEeANagHPV6nmu3lEboTO6EQLl6TDvZZgffkO0ITkr9ABCfUVkd
	bYedw/QNsTYN1yYk5JxIn9Y4b494VkZC9tHbkXGbJZu9RuVfokFebHZXbtiHSbCwc2o0hB46Oe6
	YI7KptZSxz8bH7IZjUf0XuusPS9F0sU9oGEtwgq6ps6H5th0/ksDnsK2gSTvTg8+mLk1boxu5ST
	kY9op42hRYe9CQIuarh9aJc75nKwgyjuiUuto31wxNq9+DTrTuExpPN4zQRsiammopxocC5Ofjp
	ZQehWjqOih1pdW6KNjCa3XhjdNw5PmJ7/6c7tivBEwFd1dNGjwNsPa1JE6qvjCN0AZ0R3DFKFxZ
	r5Lr8/HiG81eg3sOOePansDAuCDA==
X-Received: by 2002:adf:f484:0:b0:460:efd:c682 with SMTP id ffacd0b85a97d-460218271b6mr8956673f8f.24.1780560017687;
        Thu, 04 Jun 2026 01:00:17 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm14961528f8f.6.2026.06.04.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:17 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jun 2026 10:00:15 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv7 bpf-next 13/29] bpf: Add support for tracing multi link
Message-ID: <aiEwj71lWsgZEbv9@krava>
References: <20260603110554.29590-14-jolsa@kernel.org>
 <20260603114150.AB61C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603114150.AB61C1F00898@smtp.kernel.org>

On Wed, Jun 03, 2026 at 11:41:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch references multiple undefined symbols (`struct bpf_tracing_multi_link`, `bpf_trampoline_multi_attach`, `bpf_trampoline_multi_detach`, and `is_tracing_multi`), which results in compilation failures.
> --

this commit compiles fine, specific answers below

jirka

> 
> commit 4e3377b79034e4eafa802e1a2382a4ca893a956f
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Add support for tracing multi link
> 
> This commit adds a new link type to allow attaching a BPF program to
> multiple function BTF IDs. It introduces the tracing_multi configuration
> fields in bpf_attr::link_create and implements the attachment logic.
> 
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index 625a4366fe6d7..6f72ede0c8f04 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> > @@ -5842,6 +5842,8 @@ static int link_create(union bpf_attr *attr, bpfptr_t uattr)
> >  			ret = bpf_iter_link_attach(attr, uattr, prog);
> >  		else if (prog->expected_attach_type == BPF_LSM_CGROUP)
> >  			ret = cgroup_bpf_link_attach(attr, prog);
> > +		else if (is_tracing_multi(prog->expected_attach_type))
> 
> [Severity: Low]
> Is is_tracing_multi() defined anywhere in this series? It appears this might
> cause an implicit declaration error during the build, as the function or macro
> seems to be missing.

yes, in: bpf: Add multi tracing attach types

> 
> > +			ret = bpf_tracing_multi_attach(prog, attr);
> >  		else
> >  			ret = bpf_tracing_prog_attach(prog,
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > index d853f97bd154f..9e3cb547651e5 100644
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> > @@ -3641,3 +3642,132 @@ __bpf_kfunc int bpf_copy_from_user_task_str_dynptr(const struct bpf_dynptr *dptr
> >  }
> >  
> >  __bpf_kfunc_end_defs();
> > +
> > +#if defined(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS) && \
> > +    defined(CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS)
> > +
> > +static void bpf_tracing_multi_link_release(struct bpf_link *link)
> > +{
> > +	struct bpf_tracing_multi_link *tr_link =
> > +		container_of(link, struct bpf_tracing_multi_link, link);
> > +
> > +	WARN_ON_ONCE(bpf_trampoline_multi_detach(link->prog, tr_link));
> 
> [Severity: Low]
> Where is bpf_trampoline_multi_detach() declared? It looks like the declaration
> and definition for this function are missing, which will break the build.

yes, in: bpf: Add bpf_trampoline_multi_attach/detach functions

> 
> > +}
> 
> [ ... ]
> 
> > +int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
> > +{
> > +	struct bpf_tracing_multi_link *link = NULL;
> > +	struct bpf_link_primer link_primer;
> > +	u32 cnt, *ids = NULL;
> 
> [ ... ]
> 
> > +	err = check_dup_ids(ids, cnt);
> > +	if (err)
> > +		goto error;
> > +
> > +	link = kvzalloc_flex(*link, nodes, cnt);
> 
> [Severity: Low]
> Is struct bpf_tracing_multi_link defined anywhere? Evaluating the size of an
> incomplete type in this allocation macro will lead to a compiler error.

yes, in: bpf: Add bpf_trampoline_multi_attach/detach functions

> 
> > +	if (!link) {
> > +		err = -ENOMEM;
> > +		goto error;
> > +	}
> 
> [ ... ]
> 
> > +	link->nodes_cnt = cnt;
> > +
> > +	err = bpf_trampoline_multi_attach(prog, ids, link);
> 
> [Severity: Low]
> Does bpf_trampoline_multi_attach() exist yet? Like the detach function, this
> seems to be undeclared and undefined, leading to a build failure.

yes, in: bpf: Add bpf_trampoline_multi_attach/detach functions

> 
> > +	kvfree(ids);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260603110554.29590-14-jolsa@kernel.org?part=1
