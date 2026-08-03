Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670EC36A377
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750797; cv=none; b=pAria2zyP2/OtamFFfvpEZTvP/BmT7DhOwrB9vXuW2vZOyp40qrTadUJWhg2vOyHJ3DGiUvuv0wd7kDs80XxXawatDQI6OiqJpHPFIK/Z17M6DzhfQMbq2eXlUwad0pCtLERGPl0tx4sRvFOsHtmzHHX4RhmVmb58ojXCBb9hNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750797; c=relaxed/simple;
	bh=jkDGtM09gaACxLmOgEQUKdtMm56P/LXKifkzwy8JMuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJmQWia4pdQWKQKHmbsSMYCcLsxIWjlKrjgBBA2kaO41DUamx1lIYp9nRTHFJxXTqbPOsrKtgqIhlpYTSaRQPxJ5dEl4rUvoQs1R2tCdUi00lSDtvynAP4qiwUSOXQe892zLZhIZ/O0qsvta3WS3cPPov72vYZDMI12GtKG3wL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mnu5Y6uK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mnu5Y6uK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e592da74so384930366b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 02:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785750793; x=1786355593; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytMoZCsAqAKW3v9DDvsj7jGsWfZeTrxz+0Y25TeDiFA=;
        b=mnu5Y6uK9sFfhrkfcmV/JpJFNl9CL7O+JQxMFPfkCujg+V8fpgI19Nl8FCQpdvgWWG
         Xqru1dUtBFbr1Vt/onpYDuybOXh9shWoM9uhy8R04F9TA5OBhTwuVKN4DUb1Kjun4aNb
         ccv2IIJ5dmso+yDBVawGEXJ5LCRbsy/4C/2RcqXKfHYDYCgkw62yCK3J9wMgGEqUQ0sH
         TXgMCepB/5AdIvc5TGZmQ8sxWjObPcqlxlnteXGh9hIVdiHcIBwxfjNb9mOdRmM0edWR
         V7C89gSNwlndiFfmgCkMtrL2SkUv4UTJiE2+Eo3dEKMicXj4+E3nUtj8XaH4jo+tMeGo
         us4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750793; x=1786355593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ytMoZCsAqAKW3v9DDvsj7jGsWfZeTrxz+0Y25TeDiFA=;
        b=GZe002wo3/84V9nXLkcsO2HxiNC1xj6RhaseEXg1/kfVyUHTIZcoDeJd3lgKvVuXhT
         pPLGd8suoPxlZxeYNeU3laqbHU8zwaU5n7pqJ9zEu/KNI/QkF3WR8ePnjF9TQ+sQzRA5
         ArzXmtNuteVRvZ0EWTd80uNRo2MZgWdn43zgD6raJSEXBfZETit3559tNYTiMWOCKabU
         jwKLyYWbIkzvUaILsiZxN1dDdiP9sRVCcpkXhwy0TNt5YbQgMa+bO3KdyhkMMHJ0kTJ5
         co/a3Cc+1P4eiPfbvXqYDM1iyYokQmNgMAhIpbrW35dhtxEC5GrUGAONVpcOEwJAg612
         /TzA==
X-Gm-Message-State: AOJu0YwMXXjyz+AZk4MsN7MDmA6mthU6UbuF0fJ0ZjpWXRZF8BuYlSMo
	avOeVbXwmf8hh7Q+HLF+NISRVMgnbNhQVNcPa9pkZWu8ts/QqqjhvQQEhUarOagFwXiK+LkSqmh
	NZAlPdg==
X-Gm-Gg: AR+sD11CLZ3N/0zV3pMip0B0w7zJv+v/Mzj7lFNqMTf4KaxaL5RgiYuUWTHVI4Vuw1l
	WAJwV3FQ81wLB6VuEbMzD3G06ZV+JTmm3d3PWYUgGiPuja/n/u22x3BnT3jXZ9Qml/jasRrrYry
	HqdfibA1owo+cGZKAzwHvEAXHoL6p94i0QeSYYi7o5lEweYvhClfFM9aWKNfGl6022dJ2w73mV3
	a/VZ4NNJ5Ok67ivCPGabCX7QIDRh0YXS0UuJPS/pVAHUnt57S9jP87QbAOtrcuYEo0OpAVFc5R4
	nM/2kKmXp2yuudz62PzdDIbTjSa1y1UlP5P/zfTVOZUTHBtguCdz5IT6fcIA2SLoEpcyv0yz/ef
	/O8l+kniY0J+ZYA6NOYYq682zUkr0bSY8expNNmYX0dbDHWvIaQS/C3Z46XjIIbhqTlr/HIW76J
	5iIYz5NUXgvrW7KtMG3HZ9zNB9bvIHGCicJrxisK1s57ootPyaxUDF/zM41D5RxIHR5FBo3/ZtW
	v+jWK8b5xDDugTl70jm+fUTN+TQx7q8KhwruV7JdQg=
X-Received: by 2002:a17:907:1b28:b0:c15:bed9:f492 with SMTP id a640c23a62f3a-c1fe7e9f944mr748660666b.10.1785750792945;
        Mon, 03 Aug 2026 02:53:12 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c9bc0dsm490631966b.21.2026.08.03.02.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:53:11 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:53:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] KVM: arm64: Drop %pB on nVHE panic when stage-2 is
 active
Message-ID: <anBk9amSO_MuXY-h@google.com>
References: <20260803093906.3531699-1-vdonnefort@google.com>
 <20260803095017.4A9D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803095017.4A9D01F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 09:50:16AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Incomplete fix for host stage-2 deadlock in nVHE hyp panic handler.
> --
> 
> --- Patch [1]: [PATCH v2] KVM: arm64: Drop %pB on nVHE panic when stage-2 is active ---
> commit 6bd2e7dd3552f4e44146bf3e1065ca1511de7411
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> KVM: arm64: Drop %pB on nVHE panic when stage-2 is active
> 
> This patch introduces nvhe_hyp_panic_host_s2_disabled() to skip %pB
> formatting during a hyp panic when host stage-2 is active. It aims to prevent
> deadlocks that occur if the host stage-2 lock is held and a fault happens
> when accessing lazily mapped kallsyms data.
> 
> > diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> > index 54aedf93c78b6..88dcb8cb36f3c 100644
> > --- a/arch/arm64/kvm/handle_exit.c
> > +++ b/arch/arm64/kvm/handle_exit.c
> [ ... ]
> > @@ -538,8 +548,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
> >  		unsigned int line = 0;
> >  
> >  		/* All hyp bugs, including warnings, are treated as fatal. */
> > -		if (!is_protected_kvm_enabled() ||
> > -		    IS_ENABLED(CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC)) {
> > +		if (nvhe_hyp_panic_host_s2_disabled()) {
> >  			struct bug_entry *bug = find_bug(elr_in_kimg);
> >  
> >  			if (bug)
> 
> [Severity: High]
> This is a pre-existing issue, but does this fully resolve the host stage-2
> deadlock?
> 
> Further down in this same function, the backtrace and instruction dumpers
> are called unconditionally:
> 
> 	/* Dump the nVHE hypervisor backtrace */
> 	kvm_nvhe_dump_backtrace(hyp_offset);
> 
> 	/* Dump the faulting instruction */
> 	dump_kernel_instr(panic_addr + kaslr_offset());
> 
> kvm_nvhe_dump_backtrace() iterates over stack frames and calls
> kvm_nvhe_dump_backtrace_entry(), which uses the exact same %pB formatter
> to print the frames:
> 
> arch/arm64/kvm/stacktrace.c:kvm_nvhe_dump_backtrace_entry() {
>     ...
> 	kvm_err(" [<%016lx>] %pB\n", where, (void *)(where + kaslr_offset()));
>     ...
> }

stacktrace depends on CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC already...

> 
> Similarly, dump_kernel_instr() reads the faulting instruction directly from
> kernel memory, which could trigger a stage-2 data abort if the page is not
> present in the lazy host stage-2 page tables:
> 
> arch/arm64/kernel/traps.c:dump_kernel_instr() {
>     ...
> 		bad = aarch64_insn_read(&((u32 *)kaddr)[i], &val);
>     ...
> }

We actively maps .hyp.text in the host stage-2 at boot.

> 
> If a panic occurs while the host stage-2 lock is held, won't these
> unconditional calls still trigger the stage-2 fault and deadlock that
> this patch is trying to avoid?
> 
> Should these operations also be gated by nvhe_hyp_panic_host_s2_disabled()?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803093906.3531699-1-vdonnefort@google.com?part=1

-- 
Vincent
