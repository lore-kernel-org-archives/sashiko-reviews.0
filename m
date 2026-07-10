Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AC1374E6D
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708524; cv=none; b=NzUMyfHOeuJnIL8Nf/kYTngnUlFUsY49uzvNd8LWqZoGmUp+eXoKfujVFI1qEWB6ohPqYlxjClXx2DeM3fWiJOtr6PaWMlD4BBmKRlucA0uQS3puF1u4vbK9lotXU6t1HXLMWxhi9mVdpYMyIPHITdvpLgH5JuH39vos3BgVCXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708524; c=relaxed/simple;
	bh=cVwSutYXyxu2kAs+M/fqvlMTLCP40ylY2LRCvNSraqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qISdHhgN1OpJlw+wWZajW+Yue7LQaTgQ1SE2iE1EE4kJEOnCZs3BAc+v/xR9CM5Yjt/Vbgvu0S0JJ3ZjZ5B6uC0nfGa3xkAywF8Lt801iEogLHg80Ptm5sBLIm8yqj00xlEizcNZpN6qO8FmUNY4n3Bkrgy2pcjRovQsjenDiK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YyC0nWyl; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YyC0nWyl"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84870e7f498so1489811b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 11:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783708522; x=1784313322; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJss+Nyx//3KxfsXosZCusg05vSosR0BprDgk0IeJw4=;
        b=YyC0nWylppSgsjoPJDW7Nqd84UpHb2JLUW+tLhcMrEfmZKz787PShuZHnCO1cFC725
         yuV60u7WJtxLSHyOcru8ttvh1T/7Y5VoPSkBS++l4bvH/GZYv5jlfl+NFaiHF2uptkKS
         d/umagwOV7scEDqMG//+raz6eF/0kp/q+2JN1fvqyHkYoDtcTvgisFvd4d2jWoiMmahH
         j876gLzx73bboocZaZLOINAlmwvEfgjrQ4tJIqu6bpQD1i+nQAA/LZwYfGdIMNjKxTgx
         fnaqTlzAoYGmXT46z0Bo/XtLt4s4tksFGqriM2CtDe0omOWDXWybGJFu3xC2DdDGBu3g
         eEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783708522; x=1784313322;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJss+Nyx//3KxfsXosZCusg05vSosR0BprDgk0IeJw4=;
        b=MF3kApQLpViPn4ppzyenUgJBCAfncoszjQmb+1bN6/ryjn5k4Rho8hjcncdFX4WiXg
         5+P/Kx2TGVjbUxF9F1Ac9FZkZzgx0RmALH7L3G+LhDsjX5f5NEyOLK6cyDhs6GeW2KAo
         W1jHz1DhZ0d1/8WLRO8jV5xEX4sFWXP+P+p0PS1IMjCJk+Fk0bFaP4JS6DwR+gBQ8NEm
         zcAhT7dEMSZEFMY9zD7oFAv49jJlRw5XVbNpXasS51j4d19NNKvLcZLgwwumCQ2LPvG0
         zV2YZ6sFSyEtibqmOYDWtK/gptP3OGRV9ipahAfyYDxhEIrIwzBdAmcdm1mnzwetj4fY
         TMPA==
X-Gm-Message-State: AOJu0YzgfQfgTtS/zzHtEnxi9jd2FPLaNj/zK3t6irv/ogV+Ay1fr1QF
	7qfq5pu5z/HoCQnqhspIPFFxAySp5SZEFwBSrjzKzTjMhZeaNYCGtP7J18PFKigc1nEfOf6UISj
	2z2k6E45W7WOKTDLIav8YG5aX7ePJLDb9xKufh9JrQWUKt2hsAzdNvPrOWEB2DE5R64Og2Tg74V
	bEcToOLthkrnVhd/aXQyzlo3ZHCUJuzr8yiYOP2hZgzXPpbWlE
X-Received: from pfdb8.prod.google.com ([2002:a05:6a00:94e8:b0:847:878f:44fd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cd4:b0:847:712d:19ac
 with SMTP id d2e1a72fcca58-84889637560mr217734b3a.8.1783708522009; Fri, 10
 Jul 2026 11:35:22 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:35:21 -0700
In-Reply-To: <20260710135312.AD74F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260710134055.16432-1-danielpaziyski@gmail.com> <20260710135312.AD74F1F000E9@smtp.kernel.org>
Message-ID: <alE7aTGmUIWKJf9a@google.com>
Subject: Re: [PATCH] KVM: x86: Fix null pointer dereference in trace_kvm_inj_exception
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Daniel Paziyski <danielpaziyski@gmail.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 10, 2026, sashiko-bot@kernel.org wrote:
> > An empty struct is being passed, which makes the
> > kernel derefence a NULL pointer when the error code is 0. Remove this
> > stray struct in the invocation of __print_symbolic.
> 
> [Severity: Medium]
> Is this description of a null pointer dereference accurate?

Yes, it is.  Sashiko apparently applied to an old base (pre-7.1).  As of commit
754e38d2d1ae ("tracing: Use explicit array size instead of sentinel elements in
symbol printing") (spoiler alert), trace_print_symbols_seq() is:

	for (i = 0; i < symbol_array_size; i++) {

		if (val != symbol_array[i].mask)
			continue;

		trace_seq_puts(p, symbol_array[i].name);
		break;
	}

> Looking at how __print_symbolic expands, the empty struct { } safely
> initializes the first element's name pointer to NULL. When
> trace_print_symbols_seq() is called, it handles this gracefully:
> 
> kernel/trace/trace_output.c:trace_print_symbols_seq() {
>     ...
>     for (i = 0;  symbol_array[i].name; i++) {
>     ...
> }
> 
> Since the name field is NULL for the first element, the loop is bypassed
> entirely and the function safely falls back to printing the error code as a
> hex string without dereferencing a NULL pointer.
> 
> > diff --git a/arch/x86/kvm/trace.h b/arch/x86/kvm/trace.h
> > --- a/arch/x86/kvm/trace.h
> > +++ b/arch/x86/kvm/trace.h
> > @@ -490,7 +490,7 @@ TRACE_EVENT(kvm_inj_exception,
> >  	TP_printk("%s%s%s%s%s",
> >  		  __print_symbolic(__entry->exception, kvm_trace_sym_exc),
> >  		  !__entry->has_error ? "" : " (",
> > -		  !__entry->has_error ? "" : __print_symbolic(__entry->error_code, { }),
> > +		  !__entry->has_error ? "" : __print_symbolic(__entry->error_code),
> 
> [Severity: Low]
> Will this change break the kernel build?

No, beacuse again, Sashiko applied to an old base for some reason.
