Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40D834A3D6
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779311206; cv=none; b=IApiYpFCQ+5c3n2ICoKlwgt+E9DfT+2S086Jdta2ec9BoTWR2J+Q8ZRcGDsfi0xQ5yNcHR/fWdycAEWIu75wK+28ymSuaIwsPy2qfV0Q4WPhIfWZrYEn/D05FuLtugfsJtyC1ErDuJUGi+Vy/gmxGs0PmA5Ybou8y+bJ56rDcyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779311206; c=relaxed/simple;
	bh=AkGtEPLI8YUYNvTXu8Kh0Ow1uRQIZlr5HS+MCfYPWaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UeeevjgdBvSDC3OPC20shRNz7QhAspQ4ZM7LjlNmL6S3HVGsUW6xEqCFuh6uujIm7eofNRElLKmv0fBNATcwhvBNqnxJz0DTpisHc5Stypm6lD9YSXQoXd6VqmJorZMjDRdRSrl2Et+vZIjjBkNVrQC47X7w2C+yoETOA5iWa7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Msp6gr5u; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Msp6gr5u"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso3032791b3a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779311205; x=1779916005; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XzU733i4LRzT0VTX5lJXk+wXutwbub7NmvSDpQIkegg=;
        b=Msp6gr5uzO/iv/OcIkDjGkgf8Eq5Te/DXC4xHIb17HoacUCDw+ZnpuU7FiLDRQP3Xk
         mRddQ6Uiw0C8v8jB7gpvpb0HeOpxurd0MkzJIalLRJL4XLtFW+FFtRGfEfx7PLECnNw6
         kmUh+uUEhYRkhY6DDK3pfbTcC0rRVJsmwuG2x22jVAeza7MIEbk/iX2wCD7w6570yJVB
         vMhKXbFXJIGj8hRE9aLYiVkaA2cMhd9ebWxiN+wL9uXP2VOn1IenmQKB+Rf8ELFKd/0+
         FvqwrASMFZxiexwfu//i2oYg++drlz7q82k2ZztJ9UT9kbr9eL8KxrOG7PbQdb0uDuaf
         7OEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779311205; x=1779916005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzU733i4LRzT0VTX5lJXk+wXutwbub7NmvSDpQIkegg=;
        b=NzYtsFDUcQA1ssHVKOORMcmPHF3zopW7nd5KkjntZelylGvnO0tUdEh/lM5ovtjZK1
         Uq0vIx4rwAro4Iyf1UCvAlIs9YFqPR4wE5GlReZ7tGbPbvWRey7jY57QR7O3mEXVzQU7
         94iS2T/RuB6JlDKmwQb6F1DhVIDRtiCiGpZN+wj6LuEy/XlqM8+U4CnvZT1OFiYARLvR
         2m3vby61fRLDouokFFTvEG+tT6nWN9qTAt11gvTOqg/Pw1+BxiT99ukYscmjz4jddsCO
         4WfKM7XNizB8ZpnXIE80do+bwogBUnCQPyZD+3wQ2WYR2iLiLO4mNdVuLUh8uLgaLQHT
         qK2A==
X-Gm-Message-State: AOJu0YxCaiNGXsbilG5kR0EPbc9hn9Qn+BpFntNZuenj4tRowmYSwA0H
	f8yl69YNtl8We8c73xMjg8wcDVUWRMuPb/8L9eaE6g8inyszs/brjl5pyqnUHA9tb6M4eFDF+RV
	HQSS1dBTxZxSPWX4L98HQJ3tj/vAJ1rEyDanvXHn0YbA/i9fNrfIrqdnRLLyx/LipvxlnlAQT/8
	INaJpMn/a3Ku8M0wovIyzyWecvYLDlGQTKgxlgGqNQMSn8T3hx
X-Received: from pfbfc32.prod.google.com ([2002:a05:6a00:2e20:b0:82f:96ee:b9ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:bd8c:b0:837:6bb9:acb7
 with SMTP id d2e1a72fcca58-8414ab08b90mr219137b3a.0.1779311204529; Wed, 20
 May 2026 14:06:44 -0700 (PDT)
Date: Wed, 20 May 2026 14:06:43 -0700
In-Reply-To: <20260515195934.C790BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-42-seanjc@google.com> <20260515195934.C790BC2BCB0@smtp.kernel.org>
Message-ID: <ag4iYyTLtJEEyabl@google.com>
Subject: Re: [PATCH v3 41/41] x86/kvmclock: Get CPU base frequency from CPUID
 when it's available
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 15, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index 62c8ea2e67691..7607920ae386e 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> > @@ -190,6 +190,20 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
> >  	}
> >  }
> >  
> > +static unsigned long kvm_get_cpu_khz(void)
> > +{
> > +	unsigned int cpu_khz;
> > +
> > +	/*
> > +	 * Prefer CPUID over kvmclock when possible, as the base CPU frequency
> > +	 * isn't necessarily the same as the kvmlock "TSC" frequency.
> > +	 */
> > +	if (!cpuid_get_cpu_freq(&cpu_khz))
> > +		return cpu_khz;
> > +
> > +	return pvclock_tsc_khz(this_cpu_pvti());
> 
> Before this patch, both calibrate_cpu and calibrate_tsc used
> kvm_get_tsc_khz(), which checks kvm_para_tsc_khz() to get the exact TSC
> frequency from KVM's PV CPUID timing leaf, and only falls back to
> pvclock_tsc_khz() if it is unavailable.
> 
> Does the fallback path in kvm_get_cpu_khz() bypass kvm_para_tsc_khz()
> entirely? For VMs that expose KVM's PV CPUID timing leaf but not
> CPUID.0x16, it looks like cpu_khz will now be reverse-calculated from
> pvclock multipliers instead of using the exact hypervisor-provided value.
> 
> Could this introduce a precision regression due to truncation loss, causing
> cpu_khz and tsc_khz to needlessly diverge on the fallback path?

David pointed this out too, I'll fix in the next version.
