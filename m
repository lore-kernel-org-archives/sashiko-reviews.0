Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DCB3CF689
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875894; cv=none; b=rgqjIo032RCBC/B/VydRr3bcL+p3K0BUfTyU9lBJ5FjkYRHcEnIIg6MPKePprAM76TteWpTxQpOHP84OjeYSyrn3DbHOc3UgZuWHeTm2OzTyCoun4KFN++aenpuxqAwriojJvfe/Yw8SW2EeWQKZTtPQFckHOV6DwxD/aI3I0gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875894; c=relaxed/simple;
	bh=81RNxUEd/3fDZdAbZ2RtDSoKziUN3FpnTfLBca13oew=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETFR3iflz4dDAd9q/jLYZAB58k3qSzsiLfLeHgAyMR6ocM+7wP3beUxFYM4UYwHWtKNukJOsJ6gPCDJSQcBuaw59EboO6jBvTq4GbsQh+iiToStE6j/9Ftl22s/yt0qvCH11c2ibcWRomOwoOo6OtN4l3cxJNsAHPqZB1Pk3sOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+7R+4yL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+7R+4yL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so72928355e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 02:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779875891; x=1780480691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDLwJcBDVnK1lu+JVofwwRKJNU00sfYmj+78HlWJlKI=;
        b=F+7R+4yLUoEXILDZVlq8D52/cys+AJp/EH6I5PbtHtazShShBLGu475tDvUiDrWqUW
         5vwsl/upx9HzQI1QuPNy1J2pFyaptxnqaD+aWT7RBRXoFlJlkxv2WrOBGLE5brwoiS7N
         Bk1xSoAwU0Bo5BalkJlLkDpC6nnPCtyovX3LmuMiA4Ol7y35Zm0+YkmQkl9YoWQ4Ohq/
         dapFVvElg820v82ZjoiJjjH+o++h5o6Uj2oiE+mkWLpdnkdUVc535Jybz9IsnQ8luVNc
         GNFMx8bTTXXLuODyAVBkbpyIbeAzO62Jv3PpKdd1qtc0B4ODoTbAZ8ox/kk9L9xWVEYE
         yp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875891; x=1780480691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDLwJcBDVnK1lu+JVofwwRKJNU00sfYmj+78HlWJlKI=;
        b=qVLVXac1Uleo+40KVt3Oz5kwVPEC3RShDSB4kdwCu6mMU9A2N2vKMCmTsI5tVgCBIq
         CnjR7Paup2pKHFYFgIbe5DHvw5cGZLP0hQJSSKS4n7HcQ7o6bwctWX7EoSX301xoAIPZ
         qOmCbgZ0kBcPHguNTcfRlrXPHmTTlnaaP2oEJbFuRAvnWZkQfD9Rti4/2T8P0UvgEvJc
         uIZdoyHCL789syFGMJROM3RTfudfQibzsns6uBLECk0hyscZTX+C6PG/iYN9gOPpHOE/
         Cl8tdP9rNK+8xOVAhl4tsgT02xkzdJ+KJmqaG8rsKThK131QmaKKy9T5lUq+kZiTEsjg
         pCgQ==
X-Gm-Message-State: AOJu0YzfxUjKRzwwq5gxzm2ALJCUGS7F7volVQrRCOYqQ2NtAEmFiZrb
	RQnCB72B3oDWgCrgLooe3KLQN1z5U5Byj93AT5A8IaxkvOBHz3D1AVEVFdX/nw==
X-Gm-Gg: Acq92OFG1zg39ng9QUY31CAkhOFRGMFs+6SpKNyUxFdGeaCPmY7wUkxO7oG9RnsyNOL
	TIXj5fgIcP8pNRDLIJ096Ug4Vex6Yy7J2JVDb3k58yqo7vOcJbXVuL0qJIqOJJTxiyGAtGH1Tq/
	JYTXKhZ2o8yxg6X3R9x1teX8b1wsswO/Qo+OWui3q1oVQGh9zXTdriaLRghQDSDFk5yqbl5LNsm
	0ikZNk7jXtKCUb3v1xyqZabcw/eSYoI/VkoGuCSfXW1k7E5XmqvVLzA7r3By8syfeG8NENa2GFn
	SuVGJuAjJyy1PswsTccebBOmYTxC9x9pBGHj+UILD8zwaLBEgZfESudKsEgBcfmA9+LCrjVpzhJ
	qoM2iN0X1u+sx/jOHhsrByet9t0jGh+BMM8vnridfSbBIjs35k/WbBl/JgvU9b3tVFpNIn/wfEH
	dBX6nBDYkXrCLr7Ls=
X-Received: by 2002:a05:600c:3541:b0:490:6e12:542c with SMTP id 5b1f17b1804b1-4906e125469mr159149265e9.23.1779875891033;
        Wed, 27 May 2026 02:58:11 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c5eb0sm414363735e9.2.2026.05.27.02.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:58:10 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 27 May 2026 11:58:09 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv4 09/13] selftests/bpf: Change uprobe syscall tests to
 use nop10
Message-ID: <ahbAMSyTfWgxrPHl@krava>
References: <20260526205840.173790-10-jolsa@kernel.org>
 <20260526211518.3937F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526211518.3937F1F000E9@smtp.kernel.org>

On Tue, May 26, 2026 at 09:15:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The usdt.h header was not updated to redefine the default USDT_NOP to 10 bytes, which will cause the usdt test to reliably fail.
> - [Medium] check_detach() only verifies the restoration of the first 5 bytes of the 10-byte NOP and uses a signed char array that can cause compiler warnings.
> - [Medium] Benchmark functions and external reporting names were not updated to reflect the new 10-byte NOP behavior, producing misleading metrics.
> --
> 
> commit d8fb3aec4d3eab73b6231c402e78efd3cd47f8f0
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Change uprobe syscall tests to use nop10
> 
> Optimized uprobes are now on top of 10-bytes nop instructions,
> reflect that in existing tests.
> 
> > diff --git a/tools/testing/selftests/bpf/benchs/bench_trigger.c b/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > index 2f22ec61667b9..a60b8173cdc46 100644
> > --- a/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > +++ b/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > @@ -398,7 +398,7 @@ static void *uprobe_producer_ret(void *input)
> >  #ifdef __x86_64__
> >  __nocf_check __weak void uprobe_target_nop5(void)
> >  {
> > -	asm volatile (".byte 0x0f, 0x1f, 0x44, 0x00, 0x00");
> > +	asm volatile (".byte 0x66, 0x2e, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00");
> >  }
> 
> [Severity: Medium]
> This isn't a bug, but the function name uprobe_target_nop5 and the associated
> reporting names in the benchmark registry (like uprobe-nop5) still use the
> nop5 suffix. Since they now use a 10-byte NOP, should these be updated to
> nop10 to avoid misleading benchmark metrics?

it's changed in following patch that renames the related benchmarks
  selftests/bpf: Change uprobe/usdt trigger bench code to use nop10

> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > index 955a37751b52d..90851d1e4624f 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> [ ... ]
> > @@ -430,9 +432,11 @@ static void *check_attach(struct uprobe_syscall_executed *skel, trigger_t trigge
> >  
> >  static void check_detach(void *addr, void *tramp)
> >  {
> > +	static const char nop10_prefix[] = { 0x66, 0x2e, 0x0f, 0x1f, 0x84 };
> > +
> 
> [Severity: Medium]
> Is char the correct type here? The value 0x84 exceeds the maximum positive
> value for a signed char, which can trigger compiler warnings on architectures
> where char is signed. Could this be changed to unsigned char instead?

will change

> 
> Also, the optimized uprobe attachment replaces the full 10-byte NOP. Does
> verifying only the first 5 bytes adequately test that the detach correctly
> restored the original instruction stream?

the last 5 bytes is the call instruction that is always different

> 
> >  	/* [uprobes_trampoline] stays after detach */
> >  	ASSERT_OK(find_uprobes_trampoline(tramp), "uprobes_trampoline");
> > -	ASSERT_OK(memcmp(addr, nop5, 5), "nop5");
> > +	ASSERT_OK(memcmp(addr, nop10_prefix, 5), "nop10_prefix");
> >  }
> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/usdt.c b/tools/testing/selftests/bpf/prog_tests/usdt.c
> > index 69759b27794d7..fda3a298ccfc7 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/usdt.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/usdt.c
> > @@ -252,7 +252,7 @@ extern void usdt_1(void);
> >  extern void usdt_2(void);
> >  
> >  static unsigned char nop1[1] = { 0x90 };
> > -static unsigned char nop1_nop5_combo[6] = { 0x90, 0x0f, 0x1f, 0x44, 0x00, 0x00 };
> > +static unsigned char nop1_nop10_combo[11] = { 0x90, 0x66, 0x2e, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00 };
> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/usdt_2.c b/tools/testing/selftests/bpf/usdt_2.c
> > index 789883aaca4c3..b359b389f6c00 100644
> > --- a/tools/testing/selftests/bpf/usdt_2.c
> > +++ b/tools/testing/selftests/bpf/usdt_2.c
> > @@ -3,7 +3,7 @@
> >  #if defined(__x86_64__)
> >  
> >  /*
> > - * Include usdt.h with default nop,nop5 instructions combo.
> > + * Include usdt.h with default nop,nop10 instructions combo.
> >   */
> >  #include "usdt.h"
> 
> [Severity: Medium]
> It appears tools/testing/selftests/bpf/usdt.h was not updated in this patch
> to redefine USDT_NOP to 10 bytes for x86_64.
> 
> Since usdt_2.c includes usdt.h to build its probes, won't it still compile
> with the old 6-byte sequence? This would cause find_instr() in usdt.c to fail
> to locate nop1_nop10_combo and result in test failures.

all those changes are in separate cpatches for easier review (as I thought..)
I can squash them if that's what we want

jirka
