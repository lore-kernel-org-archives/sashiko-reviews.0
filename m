Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082773BB680
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 20:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779223005; cv=none; b=mPwLZ6nPLC0uCi/+tnXibGOZHR7lcO6/Jzx1KuBaY8ZddfHkBOGz60QVnmF3OIeEVINBuCF9wDsuD/bAoRHxZ/XWn0kfhFqJON6WqCGwPpHUcj/xw0rNfIwOxFPQjY8kre8BnYxQGa+gE4x3YadvlItImn6DKgQHPvlS9U3HtLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779223005; c=relaxed/simple;
	bh=NVyzgDHHwWqFDEQ5sBwjAOuZvof1APUbmO5Rw5xQkDU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irUIpo4olpN71wlGfchu/eWvQzC0D3W2aDliAH7MWa1itOmbJK3yjOx1d7n05vpfse9vpS4v64O5XRR6lotEN0PVtyF2OA+GtR5XeMxzlUbOA+IbOjcwnJ35LIm/AG2TDa+Naw28p9bLuud1WPBbuMYC5d2AyjdiMRmTwwCOhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raAH9CIF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raAH9CIF"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso49278605e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 13:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223002; x=1779827802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//Sc7HUu0N0n0srzJTcA3hqC03vufTnNxLsUSy9rPDk=;
        b=raAH9CIFaJS2XKhXSVhGbcWbdIpEKfGbHTDMT4otqKLDdmQz5xQlpY6tnUTJ0aVt3i
         BXVNduDUAj0HHcqZvPvt3amRV04+JRuSkd+r6wf++ZCRILo8oqn/+qVB4xfNQ4Z4gFxY
         8fFKHDYTMj0Xrwsc4JwRpkV8Jh3EmNXiz7NvJDhCr6EsvOFztXnPDylI6dOoEe6gim8a
         ZbeVWzyf++BW5rRcS8NtDk9A9PiT/6+2l+XTHP2rwPW826vJEN7oiUiMj96korbMmFhF
         bOEEnxt+b29vQ4nF3yrIHJSFwOLJeVtADqVGDWjyR+SLrYlxFPpeazoO8lNCvp74YAWb
         m9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223002; x=1779827802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//Sc7HUu0N0n0srzJTcA3hqC03vufTnNxLsUSy9rPDk=;
        b=a4qxQ8xL6UGcg/Jyrny6FvSmBKZs8keLVRapHt0lwXB7R08ywOSKIk3xzz6632lJEc
         mGd0dAj9mq3SLUrC07BRRhBPZBnj3teJjyFB4Gzoz+BUDTt5NtUxGhouxMlxlkUsg52m
         zHti4C2mIwPOu0D3AJtd0Zq0hy6IdyPzO5K2cqSNhjMsIghe6vqupA2jbiRgNjyBp/7G
         jrjGXcjFHpmYrzAbixFAZXlo7kKTOzHGzsta6rtbFgcJe69ruRJ9InDd0rIFlJZwbldn
         WU6fE2N2cccvbXlxleD3Ls87UU8ki3nXeYSsDaXcEN4Y/YtSTiLjMS2JbEfwbsJXp+QF
         qGpg==
X-Gm-Message-State: AOJu0YxoAIM4NhJNoKSMbOEng9uNbkvkAUt9Uz+h9lSLsPAMiDcRGmym
	lsbI6nF3sV91596gWE506LSGiOmAg15RVCOY3ziAnIRj6ARbyLE38ry7glvahIt7
X-Gm-Gg: Acq92OFSDUf+RJ+1LQzszcqViKaEc1rFsx6B1TAzeb0foz7U8UyMbaifQC0UWLcTh8z
	HQ8rO+U1Fr5lMk+YfZUJ+6ix1f8mybI8oG4xqISGI3hd/qqidFaFIFz/Z2n6Eou/JxBW92XUzCE
	TumyhJ6iEwTjT890AeUtCN/O7Ll9WeRgY2O5w9GhFh4d0GJGtoE3CbbSa2XDDZ8QlkYMLocjAY0
	7ASoEK3+NprQ/Gi/p+SQua4sY6pg7kPm9COpuaeC/xQLYhuGOaaWK9bmf1lzfeqkU7t0Mylux+z
	yCwW+V2dnPrNR+2+P4fmHQYkGSqYjfCX9oKdHFMoYFExwgRho2ux23Hw2fzkNGsx7o1nVsDJB9z
	PcGumkiMe/8MGEfbtxCNEf6WoQkdy+vztYbS8/Vtrb/O4JZdVkwQ7RuplXAMglfybG9+vTd9r8E
	0rVPdY/qW0L2jNBhMTVN9gN+JpyFlcHXuP
X-Received: by 2002:a05:600c:4e53:b0:490:1640:8269 with SMTP id 5b1f17b1804b1-490164089c7mr136785135e9.18.1779223002427;
        Tue, 19 May 2026 13:36:42 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm381364305e9.9.2026.05.19.13.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:36:41 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 19 May 2026 22:36:40 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 07/11] selftests/bpf: Change uprobe syscall tests to
 use nop10
Message-ID: <agzJ2HV2BX0ST3MC@krava>
References: <20260518105957.123445-8-jolsa@kernel.org>
 <20260518111604.CC731C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518111604.CC731C2BCB7@smtp.kernel.org>

On Mon, May 18, 2026 at 11:16:04AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Missing update to USDT_NOP macro causes `subtest_optimized_attach` test failure.
> - [Medium] Inadequate search bounds in `find_instr()` may cause false test failures.
> - [Low] Misleading benchmark and function names referencing `nop5`.
> --
> 
> commit 1996488ddbe422eb1d441da9b06aafe6bd47e6d1
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> selftests/bpf: Change uprobe syscall tests to use nop10
> 
> Optimized uprobes are now on top of 10-bytes nop instructions,
> reflect that in existing tests.
> 
> > diff --git a/tools/testing/selftests/bpf/benchs/bench_trigger.c b/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > index 2f22ec61667b9..bcc4820c802e5 100644
> > --- a/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > +++ b/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > @@ -398,7 +398,7 @@ static void *uprobe_producer_ret(void *input)
> >  #ifdef __x86_64__
> >  __nocf_check __weak void uprobe_target_nop5(void)
> >  {
> > -	asm volatile (".byte 0x0f, 0x1f, 0x44, 0x00, 0x00");
> > +	asm volatile (".byte 0x66, 0x66, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00");
> >  }
> >  
> >  static void *uprobe_producer_nop5(void *input)
> 
> This isn't a bug, but should the function and benchmark names also be updated?
> 
> The benchmark exposes names like uprobe-nop5 and uretprobe-nop5, but they are
> now testing a 10-byte nop.

they are updated in following separate commit 

> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/usdt.c b/tools/testing/selftests/bpf/prog_tests/usdt.c
> > index 69759b27794d7..a160d7c4fa0d3 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/usdt.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/usdt.c
> > @@ -252,7 +252,7 @@ extern void usdt_1(void);
> >  extern void usdt_2(void);
> >  
> >  static unsigned char nop1[1] = { 0x90 };
> > -static unsigned char nop1_nop5_combo[6] = { 0x90, 0x0f, 0x1f, 0x44, 0x00, 0x00 };
> > +static unsigned char nop1_nop10_combo[11] = { 0x90, 0x66, 0x66, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00 };
> 
> Is the loop in find_instr() adequate to find this instruction sequence?
> 
> tools/testing/selftests/bpf/prog_tests/usdt.c:find_instr() {
> 	for (i = 0; i < 10; i++) {
> 		if (!memcmp(instr, fn + i, cnt))
> 			return fn + i;
> 	}
> 	return NULL;
> }
> 
> In uprobe_syscall.c, find_nop10() was updated to search up to 128 bytes to
> account for compiler-generated prologues. If a modern compiler generates a
> prologue longer than 9 bytes for usdt_2(), this will prematurely terminate and
> cause the subtest_optimized_attach() test to fail.

yea find_instr needs same update, will fix

> 
> [ ... ]
> 
> > @@ -271,17 +271,17 @@ static void subtest_optimized_attach(void)
> >  	__u8 *addr_1, *addr_2;
> >  
> >  	/* usdt_1 USDT probe has single nop instruction */
> > -	addr_1 = find_instr(usdt_1, nop1_nop5_combo, 6);
> > -	if (!ASSERT_NULL(addr_1, "usdt_1_find_nop1_nop5_combo"))
> > +	addr_1 = find_instr(usdt_1, nop1_nop10_combo, 11);
> > +	if (!ASSERT_NULL(addr_1, "usdt_1_find_nop1_nop10_combo"))
> >  		return;
> >  
> >  	addr_1 = find_instr(usdt_1, nop1, 1);
> >  	if (!ASSERT_OK_PTR(addr_1, "usdt_1_find_nop1"))
> >  		return;
> >  
> > -	/* usdt_2 USDT probe has nop,nop5 instructions combo */
> > -	addr_2 = find_instr(usdt_2, nop1_nop5_combo, 6);
> > -	if (!ASSERT_OK_PTR(addr_2, "usdt_2_find_nop1_nop5_combo"))
> > +	/* usdt_2 USDT probe has nop,nop10 instructions combo */
> > +	addr_2 = find_instr(usdt_2, nop1_nop10_combo, 11);
> > +	if (!ASSERT_OK_PTR(addr_2, "usdt_2_find_nop1_nop10_combo"))
> 
> Does this test fail because USDT_NOP was not updated in usdt.h?
> 
> The test expects to find the 11-byte nop1_nop10_combo, but usdt_2.c relies on
> the default definition of USDT_NOP from tools/testing/selftests/bpf/usdt.h.
> 
> Because usdt.h was not updated in this patch, usdt_2.c will compile with the
> 6-byte nop sequence, causing find_instr() to return NULL here and the
> ASSERT_OK_PTR to fail.

it's updated separately in another commit

jirka
