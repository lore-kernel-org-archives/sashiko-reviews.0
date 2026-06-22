Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9042368D79
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124564; cv=none; b=dc5ttXs5pQ6B3XNt22Nf3ZjbDIoutmcueSLhV/mJSj3n3dXUBsHU32IAPgvIESStKC/vWvYxXSRECJXAuYljBi/LPxNFIA1hBmngklDnrcZ6EItqHWXYlIBCYsKKF4Wh9smXKCtlc+UAFV9VJHGSausTgCIWqEEESh/IQ8TX8wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124564; c=relaxed/simple;
	bh=CdhzNEvEzeM4Cb2Q3ggY+4SMLj+7QqizoqUamE9SWhQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQqMZQsCJeHc86rb6zSPq/K+oT70I5hBnMzzjeTJjL2u3r8xnp3ukLOPz0IqzwTTeCeaMsJaCpo36X/LPhqcrcqWF3nFkzIBAwhH2nPyYSKXFJnE9zvdlGbQpPDoFvHtgGpn1oTRYkvu43Wi2YqLwEW8KZaA+9vkb+Z/FNzLUkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNNFG928; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNNFG928"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49249072f03so9791285e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 03:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782124561; x=1782729361; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3r1/tqF5BE50TrdY3pFWW8BNC9rn1rlUywnd4aQCIHY=;
        b=TNNFG928NWomGAsrYdFABGS1R5KHOu6x6DeN0w/vOn642aff/kVbrsEqtifHECtqL5
         0kux+eLQzTxbSs+AlUVrcwUh0+SBeUp0XnZQ03Jt7NL8UpgXr4HsZMammc2UfUs4lFjA
         advU/lBxiY9e3ejlwW0e+HtnQpL2BBI3gL/WmCZoljz2JqEQjzj//mPdPNSVjIeJ7u6L
         IUN16hSQTJeqLcLOaX79mchy6UKB+Z6660V82MISp+ggcINWKlK8mMsTh0uInXY3E3tF
         Qgr6YyF+A5bKMwRKfznQSempK3NPeNEG3I3uTzjuABML/NCyaSLOeY2iBbT8YhjxyMR8
         K90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124561; x=1782729361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3r1/tqF5BE50TrdY3pFWW8BNC9rn1rlUywnd4aQCIHY=;
        b=Mrrm1xoNExcRCBr/g/m3tCZWyvHP9g3UHfyql84tpQ4gLGeG3hBNAosGa55/Fi0HVm
         /Lspqf3OpYpddRsy5yr4Ogqj84vXX20UVFx0hLSVkb5AKbl91W71RhZU/Fe5tc+E9TKM
         6hM8bImMdUMyDEBm5mqxCf/kJ8crZQ/e2tOfxdD3tIkz4WYkouvZo9m3OTOFGa24ViJp
         hVhMjOYI6yLrpO0pUMmMCrVkIL3rNA7ggHuHv5WtXivnVZI4W75FEKyKXy3OrxTA+uLS
         +k9M0yg55wuWDBKhSdn+fk7pa7Zip+uWu3B2m/Ky4bq0kRCAeP7gcygl9WH0n10usNjn
         ehpA==
X-Gm-Message-State: AOJu0YwqHb0qEOcwJtusMiKsWtLylNZ7ONrjfQ0u4OaMolBFeuZQ97zq
	KuwpWI4XadvjqjWAt+CCGa7C0nzCFYtf5zqVWT20gGDIefN4g5Mgab3ALNZAVA==
X-Gm-Gg: AfdE7clfLrSjFwMOnlfPc+yTGNxDgw7vjXTv4LIQyy5qdEcSK6I5g/d8CeHFuSpKDEp
	GB566KHNB4RoQDm8orAuigDfWKneMXO93kTZiL1tzjm0kuqE7rC0Ky269uYaUH/qP1Jl/+la79E
	dypEht3vF70ZtBPAILGLx8regK+/7/PNFrSD27rKS5rd8BDX6zfLHbH73gpDbSjyEdNIFpEqj9z
	mp2b+CQSMfhOShM7q7OmW9FFsQth7Kod33iTrvieZSy5wWsdSFYdqnyMwfGMhfApgO/xyTZx7q/
	osvHLAFtUq3y+/QGc5mM+jtsWav3hqdON+X9SX2FB8wgxEYkP16+2eqit8wlomewVhASshOY/3R
	q531VZqFU7YdPNuNph0mGK1Ba2eoRVY/I9zpas/FDwzm0fAMjrCoXZwZTiLohpYoylNnhzHqIyx
	qqtNfr0X+ZKic81XI=
X-Received: by 2002:a05:600c:828a:b0:492:5297:e8a3 with SMTP id 5b1f17b1804b1-4925297f415mr85451635e9.20.1782124560915;
        Mon, 22 Jun 2026 03:36:00 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924594f8fasm184523775e9.0.2026.06.22.03.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:36:00 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 22 Jun 2026 12:35:58 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/3] selftests/bpf: Add tracing_multi link info
 tests
Message-ID: <ajkQDtC2PGX-gqLN@krava>
References: <20260621204524.61067-1-jolsa@kernel.org>
 <20260621204524.61067-3-jolsa@kernel.org>
 <20260621205350.ED2741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621205350.ED2741F000E9@smtp.kernel.org>

On Sun, Jun 21, 2026 at 08:53:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Incorrect assertion failure message tag for invalid `addrs` pointer test.
> --
> 
> commit edec3b6e703fee4df106f0b3f019e87b22c606fc
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Add tracing_multi link info tests
> 
> This commit adds new tests for tracing_multi link info. The tests follow the
> existing logic used for kprobe_multi and uprobe_multi tests.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/fill_link_info.c b/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
> > index f589eefbf9fbd..969f04ee9ac6a 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
> 
> [ ... ]
> 
> > +static void verify_tracing_multi_invalid_user_buffer(int fd, const struct tmulti_target *targets)
> > +{
> > +	__u32 ids[TRACING_MULTI_CNT] = {};
> > +	struct bpf_link_info info;
> > +	__u32 len = sizeof(info);
> > +	int err, i;
> 
> [ ... ]
> 
> > +	/* Invalid cookies pointer -> EFAULT */
> > +	memset(&info, 0, sizeof(info));
> > +	info.tracing_multi.cookies = 0x1;
> > +	info.tracing_multi.count = TRACING_MULTI_CNT;
> > +	err = bpf_link_get_info_by_fd(fd, &info, &len);
> > +	ASSERT_EQ(err, -EFAULT, "tracing_multi.bad_cookies");
> > +
> > +	/* Invalid addrs pointer -> EFAULT */
> > +	memset(&info, 0, sizeof(info));
> > +	info.tracing_multi.addrs = 0x1;
> > +	info.tracing_multi.count = TRACING_MULTI_CNT;
> > +	err = bpf_link_get_info_by_fd(fd, &info, &len);
> > +	ASSERT_EQ(err, -EFAULT, "tracing_multi.bad_cookies");
> 
> [Severity: Low]
> This isn't a bug, but is this tag a copy-paste error? The comment mentions
> testing an invalid addrs pointer, but the assertion in
> verify_tracing_multi_invalid_user_buffer() uses the
> "tracing_multi.bad_cookies" tag rather than something like
> "tracing_multi.bad_addrs".

yep, will fix

jirka
