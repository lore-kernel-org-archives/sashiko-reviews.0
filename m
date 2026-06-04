Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF682FF67E
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560049; cv=none; b=Xlqun1sy56dNUNd7uadOKaBHAaPyptKYjaolJx5Yng/BJmwLcu/fnMi/X2KPdYN/MWQV0tK7xaDTpho2MGdy9ZniyzY9YqjEua+7uoygHcDAnzc4NvAO5ouQgmE6SBCjElso7LDWq/tOYcA+Fx7kz700m0dgXy6znycB4L/SX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560049; c=relaxed/simple;
	bh=euaKvkz0bmQioDFYhOdMwAp8A8tyElTXhl7rJTkQKPw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPTh5KHTGiyDE+ZEn9DYurOT6NjKs3UUbgZYj6JUaICGSuBBDUFC5R4VI+CWkZyh+CuyWmnESvn5b+/iBVOVI7rO2RroTlvb7ie+C9OV6+MBq6JKFubnFhQ1X03Ugddd7BfO2riR+VKYMmFYckQG5s5y/uEwwPYTsEc1MalSv1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpsOVX4F; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpsOVX4F"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eedc94d37so175405f8f.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780560046; x=1781164846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RL7FImbpIn+VjTJfYXkZ93eX1v/NTo7ok1lWqFVH6L8=;
        b=rpsOVX4FU1COi8NH0BgYwV3cAiKAd4AWu/6g+iokPUjS9Bya9+Na0kEaumLbfb5vn8
         KA9zRrwKwbviYrW7k85pSoVtqqC1HOBuztdI4WoA7I/gd7OP3Ewpaypq5r5CTAidtZ97
         EnZzq6RajwI83kGqLrWQ2CzVrcTaefSLNqt1AejkL5xMtH4TtpKcuoqFafQaHPUykXSB
         ypNhAJSt8lHKnvw7zVp0ZUFt2o+6J29TdPdEYQuqQew+pIqg3XkDauN1Wzrj5SNbz5ae
         oWt72cxbIGGc9VScRR4aRiXPcmvFSBkuXw8NK7CLbJ1ci6OOs0mT2s5mpANGXYAnrVON
         hX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560046; x=1781164846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RL7FImbpIn+VjTJfYXkZ93eX1v/NTo7ok1lWqFVH6L8=;
        b=pS6vZfjE6FT3ohO+eq6KO+aATLAwKxGw2k094tGT2Ijl6FksNnuIS8xXPbTXV+vWP1
         Kh1ZA5gUVPI1c6P2B05DPMZBFuYbwlefiIcE+dBSqK943tBCx7h2Q7M0hwGAI14Lm8ij
         gySrdGKF3dw7UyjLeywLkk+gr+laHnNSosIJ4uaw5C5cXp6NXZv7DFdbqt7zAc7ZNV5E
         3DRxnsNzSjmjoAzD/NowBdGOpnJIay3/DTYIXhT/fzc/+rFg3LulOaBzYQGz4caXjSm7
         nvMW5DQ7y1Vo+VYQ5UcMjw0p5tOZIZmQEB9zU9qX3+cHp6QmEWsgRlitCqM0vFb84tDC
         GZoA==
X-Gm-Message-State: AOJu0YyXJuwCkdAcmKX91GmsqsVeYhho4z5tuBb0lvQwOwlXrrX17szP
	OzvyiNVC9xSOMdD0b0Uo/oVWdcPStTzr1zhIpE/nkmRS3XZb0bP1/IFmKHnFfA==
X-Gm-Gg: Acq92OH9xvabTR0NJJMZsOZZt8WSwC7QdxDNIWKdJltu1aZK/m+qlzKf6gIQJMS17gb
	z2s9E7/F1dnkvWd+OsQemcubPSpmzIqlL63VyuaPon9MpLAjbKuVeQuP5j8FdXBPs/4syri/5T0
	zGdcH0cfkm89MPphfYV/zOd4vv2Xs62I2lqMZcxONx/gzLVlKvGSO8Ep6EKOsrZ7G1iT91k4oyn
	ASP8kQOP5CMjCZHhJt38P1TUH+L9cnyI121qmlco3GMaGSgE4EfbaMdcaOH9FO6pWZ578MS2khu
	SElS65jKTTxOy9FdJ+JOqoYqpkGmCw4lY1+Tu5JnbmXmeg24FwMUdGTppcNtHbxBUNcSRl6AnVC
	TQHdIjwySXuBN0KhNXAqk9hfxVP4T+ooj4dRH78Nd8/xRF7/piaeXSrUFMi12zpAISfKss0QrrQ
	+kaM9E82VcznD1+DtCQ1LbY9UCqQ==
X-Received: by 2002:a5d:424b:0:b0:45e:ee50:d066 with SMTP id ffacd0b85a97d-4602178307fmr7803012f8f.6.1780560046008;
        Thu, 04 Jun 2026 01:00:46 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f345209sm14077545f8f.17.2026.06.04.01.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:45 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jun 2026 10:00:43 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv7 bpf-next 21/29] selftests/bpf: Add tracing multi
 skel/pattern/ids attach tests
Message-ID: <aiEwq_Oo7vKbxZAB@krava>
References: <20260603110554.29590-22-jolsa@kernel.org>
 <20260603134059.D02E71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603134059.D02E71F00893@smtp.kernel.org>

On Wed, Jun 03, 2026 at 01:40:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch introduces tests using new libbpf APIs and section definitions (`bpf_program__attach_tracing_multi`, `struct bpf_tracing_multi_opts`, `fentry.multi`) that are not present in the tree.
> --
> 
> commit 51532d297dcd0ba4ad28dece86396b88a934e780
> Author: Jiri Olsa <jolsa@kernel.org>
> Subject: selftests/bpf: Add tracing multi skel/pattern/ids attach tests
> 
> Adding tests for tracing_multi link attachment via all possible libbpf
> apis - skeleton, function pattern and btf ids.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_multi.c b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
> > new file mode 100644
> > index 0000000000000..f333b2514b345
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
> 
> [ ... ]
> 
> > +static void test_link_api_pattern(void)
> > +{
> > +	struct tracing_multi *skel;
> > +
> > +	skel = tracing_multi__open_and_load();
> > +	if (!ASSERT_OK_PTR(skel, "tracing_multi__open_and_load"))
> > +		return;
> > +
> > +	skel->bss->pid = getpid();
> > +
> > +	skel->links.test_fentry = bpf_program__attach_tracing_multi(skel->progs.test_fentry,
> > +					"bpf_fentry_test*", NULL);
> 
> [Severity: Low]
> Is the bpf_program__attach_tracing_multi() function implemented in the tree?
> I couldn't find its definition in the libbpf headers, which might cause a
> build failure when compiling the selftests.

yes, added in: libbpf: Add support to create tracing multi link

> 
> [ ... ]
> 
> > +static void test_link_api_ids(void)
> > +{
> > +	LIBBPF_OPTS(bpf_tracing_multi_opts, opts);
> 
> [Severity: Low]
> Does struct bpf_tracing_multi_opts exist in the current libbpf headers?
> This instantiation seems to rely on a structure that is missing from the tree.

yes, in: libbpf: Add support to create tracing multi link

> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/progs/tracing_multi_attach.c b/tools/testing/selftests/bpf/progs/tracing_multi_attach.c
> > new file mode 100644
> > index 0000000000000..332d0a423a430
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/tracing_multi_attach.c
> 
> [ ... ]
> 
> > +__u64 test_result_fentry = 0;
> > +__u64 test_result_fexit = 0;
> > +
> > +SEC("fentry.multi/bpf_fentry_test*")
> > +int BPF_PROG(test_fentry)
> 
> [Severity: Low]
> Is the fentry.multi section prefix supported by the current version of
> libbpf? Using an unrecognized section might cause libbpf to fail when loading
> the object.

yes, in: libbpf: Add support to create tracing multi link

jirka
