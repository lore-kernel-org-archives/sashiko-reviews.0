Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA643BFE38
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510344; cv=none; b=iU4KOE2N2iww4sQV94UmRIdPQUrzAv8zyMROuPU7Y4LYBbWCAoCrAT7xBUkqUTFiqAbvuYzkpXTGFvJV1LfgUb6SdkV+F1+mOzrDz7RIR5fMXKGMIqoDDcDfbDURmuzdNaxNsn16mDNhePCflBYVGUqR4LC51I6Q0iEWIsW2elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510344; c=relaxed/simple;
	bh=QRFykM/dRrqvda6J19hWdhbvvCSJWoUxH6upTIIoa7Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSmLwjkhu7X+Skg0OJ4+UPX9iuCecECFCPzHV09m29ar7IXO402ZSZbG6EbdDrEtV8mGU4od2EX46+01Jm1zf0nuMowUKQefNenNOWrNCp5ExiluyVBQQgQH8iNzaBEAqliXLQALjSEZ8EHADb4T/dVyItyBOfhXSabvHmX2Vog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPGlAOHr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPGlAOHr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso29092595e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 00:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781510341; x=1782115141; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ2yQjvmZ3fwNrdGj/6ndgBVMLizxNTABMhDzt/9sHI=;
        b=bPGlAOHrVXb+HgvsazhaC6if3OmoCcJOvoEruwuBkh6njGfw1TsX1Jgoy2nF4cqvjD
         G5YUbt1SytFSJJ/v3gJjM3tViMTzpfYh/3u5vEw35qjjHfiqmsVtjl+ZnZts6lvaMwka
         ULBoSLcOvgiqNQplyVM298+2fhAoks3WG9Kc/rrJZboWkkGEV3HdNc+r1eE09LDLLvPj
         y/dTtom260bG2C54P5vo2u2YAZPDS4vL6tcET0i3Sqf4ebjeuK01R7wGP/xwqNYnaDQS
         11J3VwrYHd7QUsk1VS8PsbHhBV0uLkLpOG5vtDC2yfzZuVIiOWToo6F810wBb6Q//FDn
         Yvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781510341; x=1782115141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ2yQjvmZ3fwNrdGj/6ndgBVMLizxNTABMhDzt/9sHI=;
        b=Z3rTYvuFvaToh/NmgSM3yi027UlM/jbiJn2N2ZmjxxdQlZTW0amsyZPW1thFTvPkFY
         FcWzu+TFE6QEZ69MQIa82K5hcNvFm3nkFCfX2voyMwYL78B9m8v6dRnn2TKxncFjye2t
         EoRmFKhaDQ6NizVqEhnwA3nAY3VM8FftFPDN3zyqNaKbCgtQssVZVQvqBOkEzx84oHyf
         ABQlFKf1o+/hGaljB5NNmZbPNFOUM2egKbBT4k0pqjd787xBkLbIcpYvXpJElDK2tq8l
         xAAdz3yOcIyDVC9O+Iq9TSNoOmwyV1MxETPfEwVIoDJJtZElCBBOD5hkf+BlFyIqYFDf
         kCxQ==
X-Gm-Message-State: AOJu0YxuLhYY5owrgJDJJnja2BuxJryp3RjHBabfMBV+6xzJldokvRPU
	CG/XigxBwq3qc/1AOnsBpR698Xmn34TNQlo8ZLIE2h5XpWgo9cSpeBVgdRjRNw==
X-Gm-Gg: Acq92OFGJucljREtcTOAu3vnXNDWckfeLfSuFLlYDE6hAEXHipcD0x/MMNgOc6Uu9A5
	RsFYTQaL12WTGPJawb3xuFDpuyxM5x+6Y/8yuikH6mRzR8gvP84IdOwowHPlcXf66Y0MXTaWRUw
	q/+4N8bCziTQ65TL0gl13o+nki6ttbQg+A0RNH2cRS/4C+Wk/LCOD7hw8rVdTPKGpvojhsaHLuo
	kSIrGfve7YD3Yo0f4VTbfn74YvejekVmxQctJq2GjTsV3/flUpX5lt3b1Sr43tiRSSBpKhx0cQL
	yzOPEKXL9tbiA1jYscJKebJIqYxRT5m6oQ2GDXCR1OZXD+kc+GkGeZYDS5vF1wYpVoPGhAfu0IU
	xjFChcq8F3dduObqxxhbCQVUnTSkhrQitQ1gYqU4G4kKgd37/A/svNF+1uPu3FbngFg9LWyiPjs
	v43c0yNRVpVwU=
X-Received: by 2002:a05:600c:1595:b0:48e:8eb0:4957 with SMTP id 5b1f17b1804b1-490ea9ace2bmr97919875e9.2.1781510340941;
        Mon, 15 Jun 2026 00:59:00 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e6a8fsm32532456f8f.37.2026.06.15.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:59:00 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 15 Jun 2026 09:58:58 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv3 bpf-next 1/7] bpf: Guard __get_user acesss with
 access_ok for uprobe_multi data
Message-ID: <ai-wwq183bfjoxkg@krava>
References: <20260611114230.950379-2-jolsa@kernel.org>
 <20260611115503.AC16D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611115503.AC16D1F00893@smtp.kernel.org>

On Thu, Jun 11, 2026 at 11:55:02AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing access_ok() check for the usyms array in bpf_kprobe_multi_link_attach() allows arbitrary kernel memory read.
> --
> 
> commit e5440667240e003d50bb838ad4b19e526ef6c703
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> bpf: Guard __get_user acesss with access_ok for uprobe_multi data
> 
> This patch adds access_ok checks for uprobe_multi arrays before calling
> __get_user. It ensures that the user space data bounds are safe.
> 
> Link: https://lore.kernel.org/bpf/20260610145235.CB1441F00893@smtp.kernel.org/
> 
> > diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> > --- a/kernel/trace/bpf_trace.c
> > +++ b/kernel/trace/bpf_trace.c
> 
> [ ... ]
> 
> > @@ -3261,6 +3262,16 @@ int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *pr
> >  	uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
> >  	ucookies = u64_to_user_ptr(attr->link_create.uprobe_multi.cookies);
> >  
> > +	/*
> > +	 * All uoffsets/uref_ctr_offsets/ucookies arrays have the same value
> > +	 * size, we need to check their address range is safe for __get_user
> > +	 * calls.
> > +	 */
> > +	size = sizeof(*uoffsets) * cnt;
> > +	if (!access_ok(uoffsets, size) || !access_ok(uref_ctr_offsets, size) ||
> > +	    !access_ok(ucookies, size))
> > +		return -EFAULT;
> 
> [Severity: High]
> This is a pre-existing issue, but while you are adding these access checks
> for uprobes, does bpf_kprobe_multi_link_attach() have an identical missing
> check for the usyms array?
> 
> Looking at bpf_kprobe_multi_link_attach(), it calls copy_user_syms() with
> the unchecked user pointer usyms:
> 
> kernel/trace/bpf_trace.c:bpf_kprobe_multi_link_attach() {
>     ...
> 		struct user_syms us;
> 
> 		err = copy_user_syms(&us, usyms, cnt);
> 		if (err)
> 			goto error;
>     ...
> }
> 
> And copy_user_syms() iteratively calls __get_user(usymbol, usyms + i)
> without any prior access checks on the array:
> 
> kernel/trace/bpf_trace.c:copy_user_syms() {
>     ...
> 	for (p = buf, i = 0; i < cnt; i++) {
> 		if (__get_user(usymbol, usyms + i)) {
> 			err = -EFAULT;
> 			goto error;
> 		}
>     ...
> }
> 
> Since __get_user() bypasses bounds checking, couldn't an attacker provide
> a kernel address for usyms and read arbitrary kernel memory into usymbol?
> 
> A subsequent strncpy_from_user() call would use usymbol as its source
> pointer, potentially acting as a side-channel oracle to leak kernel
> information or bypass kernel address layout randomization.
> 
> Should copy_user_syms() or bpf_kprobe_multi_link_attach() also include
> an access_ok() check for the usyms array?

I'm not sure it's possible to exploit it, but the contract for __get_user is
clear, so I think we should call access_ok also in here, I'll send the fix

jirka
