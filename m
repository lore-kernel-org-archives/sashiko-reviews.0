Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811016;
	b=I5Y4pmWMjiLZM9cU+EWmRVsLvyRs2Eanb7FLry1cIjTAvwmBVxmGAeGgbly/An1qP1kE
	 UZmnVYbRUMhDEmNzJeoWNn/As9q0JWs8y+sQzLkoaAqXX2FjyUa7RVLL2gBhrKoFtdZXD
	 ASXmgyYb+1foK/lPg3cV8bdE60snrkdW/b1OPGxV6BE9OzAbcgWXi+jF+4y5A1Nc4GaAf
	 GjIQUr3zitfl56mv35FT2MIltwDMW37OHxdtaHS9o30yDK/0AsHQHuYcTmLnxfZvLG+TE
	 2poTQKOnLv+lNem3bIFlNa2feT0vnjSM/Slp0PmSqZS/dlGzzctST6TzQBzMHfp5lYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=P5qFYjBpoihP1d3aZdf6ZOVbEHGPd4/o6Ut1jFZ75ZA=;
	b=XeQqwonWlrBgaseHbY4h9QzdVDLJY3NKYl7AFjvNHSjy0VQVDBkcT+lG7TwYEifGrHiL
	 HTixmNYvve8mpGj2oIsIliTex6x1pZL0rQ8kn7MUyKwrISm74+2jr/8OL5zb0Eu5wdz1R
	 mTYu6MY/EcFgKQ7x7+sb/4LEwobQUryUXIXNKSf9Fl74exXBBIzF55/8XMEvxPkggDPCT
	 bkwqaj4pvMmDobYWdJbADXofNfkYDpjUG8fX9yx5XvG4bCEqbhdsRLaUT7eexMAf3Vh7i
	 pCYSJRkvFubbgNMxG0hXLB42yEPr9fdVqbi5U+SrMSQgoh4zqa4L/VZQwu9Jd3qFpNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YmEW4bmm;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D98606EE8E
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 16:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7D98606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YmEW4bmm
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdae10aebfdso489240a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 08:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793811015; x=1794415815; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5qFYjBpoihP1d3aZdf6ZOVbEHGPd4/o6Ut1jFZ75ZA=;
        b=YmEW4bmm3VcRrK8WULx+QiyxgtXsZNrec6oeHASQROq4VflF0MVpeFJVnkg0ufR4hy
         NrEDeiLU+omNvGrvtXsY6So+BF0iFrUyZPuLlixadm/faXLOzzUm8tUTN87qs280QVoJ
         v+rMEVKq9QG+LrLKwnlEa8bOK/BVHBMg4Mr+Og7YrzCZWD0iTXIo4NmKlf2mZq92gPl2
         8vHVaHUY1pGIyFLSp2WfIf0+sv8u6PDJZRQliqgLb2hR8eKi1tiPMEIf3D7tTTN+drnv
         bon78eEpF9c6mL3hi7MebXuBNzHhHG+AiC4ki7VlWeikf83laEPLBdcKOOXNx8/QTsML
         EflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811015; x=1794415815;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5qFYjBpoihP1d3aZdf6ZOVbEHGPd4/o6Ut1jFZ75ZA=;
        b=qHQnCMIgM91Q2bmico+gfioEI9JflPeH3F3uJX0Eh29c2CoMIyb/HyCqvFZ15hYc6L
         WISL4T2R6LsMFYQjG6C6yQUiMVNJn+rG8Zklh+AeaYzS1t4EKngnv9LeodM4wtTk/rmv
         STlm8GFoMUK+01YY+WPRTYeJcfxLcacWRlwKu/ZcDqtZuoVqiPDHMod51gH9Kzy/niYL
         Y+fUd/XJnd1Pmkl3cGudaHnI6xegA8Bq+V8MCqh3MsOZmVCtEBFbgohBqbctWwi7qYYs
         dTxZNWHOFNybGpIM1dCGYIZEqqe6XNFh9DE1nn+c73o9nJh/sBjkJczM9IfX8GdExuth
         e3hw==
X-Gm-Message-State: APuU4Z9Se6c/Q/s44h5QLxBZBRBQPwfQ2P0AucJyvV39aqV/ymxK7OpO
	H32u0nx3aEGnjYMDjOP42FFnIHjJuTEHzdih5ok/IWL5lKNTvkHurLiHmj3ZxqGpafiDBkPnb9z
	Rh4TR2ypAV485ImJ+c3gcH1B7JSKoPoBiPFNg5yreeLum9oxjVSG26mjBBZcXJ4IFE11mZ2coOo
	JEb3EwHfSmKnDwwa0cV2Iv7MbRN5NhxdumrTqgiFeDeeBhyDzd
X-Received: from pgdc9.prod.google.com ([2002:a05:6a02:5109:b0:cd5:f887:3cfe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:734d:b0:3e1:a402:680c
 with SMTP id adf61e73a8af0-3eb98517683mr18495637.21.1793811014778; Wed, 04
 Nov 2026 08:50:14 -0800 (PST)
Date: Wed, 4 Nov 2026 08:50:14 -0800
In-Reply-To: <sashiko-outbox-196866@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261104080721.2169-1-zhangchujun@cmss.chinamobile.com> <sashiko-outbox-196866@kernel.org>
Message-ID: <autiRrLCDz6JTuiB@google.com>
Subject: Re: [PATCH] selftests/kvm: check fopen() return in get_run_delay()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: zhangchujun <zhangchujun@cmss.chinamobile.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 04, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] selftests/kvm: infinite loop when fopen() fails in get_run_delay()
> --
> 
> commit fed2657e5d999eb78e5e508f23ea617f2787e14a
> Author: zhangchujun <zhangchujun@cmss.chinamobile.com>
> 
> selftests/kvm: check fopen() return in get_run_delay()
> 
> This commit adds a NULL check on the FILE pointer returned by fopen() in
> get_run_delay() so that it returns MIN_RUN_DELAY_NS instead of passing NULL to
> fscanf() and fclose() when /proc/<tid>/schedstat cannot be opened.
> 
> > diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
> > index f5f7189f96a84..2827f7d7d905e 100644
> > --- a/tools/testing/selftests/kvm/lib/test_util.c
> > +++ b/tools/testing/selftests/kvm/lib/test_util.c
> > @@ -421,6 +421,8 @@ long get_run_delay(void)
> >  	sprintf(path, "/proc/%ld/schedstat", (long)kvm_gettid());
> >  	fp = fopen(path, "r");
> >  	/* Return MIN_RUN_DELAY_NS upon failure just to be safe */
> > +	if (!fp)
> > +		return MIN_RUN_DELAY_NS;
> 
> [Severity: Medium]
> If fopen() fails to open /proc/<tid>/schedstat (for instance, when
> CONFIG_SCHED_INFO is disabled in the host kernel), will returning the constant
> MIN_RUN_DELAY_NS here cause the callers of get_run_delay() to hang in an
> infinite loop?
> 
> get_run_delay() reads the calling thread's cumulative scheduler run_delay
> counter, and both callers in the tree wait for subsequent readings to advance
> past an initial baseline.
> 
> In tools/testing/selftests/kvm/steal_time.c:main():
> 
> 		run_delay = get_run_delay();
> 		kvm_pthread_create(&thread, NULL, do_steal_time, NULL);
> 		kvm_pthread_getaffinity(thread, &cpuset);
> 		TEST_ASSERT(CPU_COUNT(&cpuset) == 1 && CPU_ISSET(cpu, &cpuset),
> 			    "Worker failed to inherit parent's CPU affinity");
> 
> 		do
> 			sched_yield();
> 		while (get_run_delay() - run_delay < MIN_RUN_DELAY_NS);
> 
> When get_run_delay() returns MIN_RUN_DELAY_NS on every call,
> get_run_delay() - run_delay evaluates to 0, which is always less than
> MIN_RUN_DELAY_NS, causing this loop to spin forever.
> 
> Similarly, in tools/testing/selftests/kvm/x86/xen_shinfo_test.c:main():
> 
> 				rundelay = get_run_delay() + MIN_STEAL_TIME;
> 				do {
> 					sched_yield();
> 				} while (get_run_delay() < rundelay);
> 
> Here, rundelay becomes MIN_RUN_DELAY_NS + MIN_STEAL_TIME while get_run_delay()
> continues returning MIN_RUN_DELAY_NS, which also spins forever.
> 
> Should get_run_delay() instead fail or skip via TEST_ASSERT() or
> TEST_REQUIRE() when fopen() fails, similar to other file-opening helpers in
> tools/testing/selftests/kvm/lib/test_util.c such as get_sysfs_val() and
> get_def_hugetlb_pagesz()?

Ya, I agree with Sashiko.  Not only could returning MIN_RUN_DELAY_NS lead to
failure, it could result in false passes, which is arguably even worse.  E.g.
running the steal time test with CONFIG_SCHEDSTATS=n seems pointless.

I don't think we want to simply do TEST_REQUIRE() if fopen() fails, because that
would result in weird skips if fopen() initially succeeds but then randomly fails
partway through the test.

I think the best way to tackle this would be to provide separate APIs to open and
read the file, and then have the open API do TEST_REQUIRE() and the read API do
TEST_ASSERT().

E.g.

FILE *sys_open_schedstat(void)
{
	char path[64];
	FILE *f;
	int fd;

	sprintf(path, "/proc/%ld/schedstat", (long)kvm_gettid());
	fd = open_path_or_exit(path, O_RDONLY);

	f = fdopen(fd, "r");
	TEST_ASSERT(f, __KVM_SYSCALL_ERROR("fdopen()", -1));
	return f;
}

long get_run_delay(FILE *f)
{
	long val[2];
	int r;

	r = fscanf(f, "%ld %ld ", &val[0], &val[1]);
	TEST_ASSERT(r == 2, __KVM_SYSCALL_ERROR("fscanf()", r));

	return val[1];
}
