Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFCB463B86
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986375; cv=none; b=qESJoDWsI52yz7eDf8wcXJaQvkMSiHngrUkHw1rBIR8LXY4OzVR+fvISVm/BoxG+UO+7ZRoUkat8vUDVFaAmwbf1JMNaFBigYax0LhTV75IAuGmNlvkIiNOr0u3ETnMuuz1ZGVdi9oBj5f9IsIjWaC6iQBAYfieYq1Fei51CSGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986375; c=relaxed/simple;
	bh=vGRkCp8CN9ItE9Tqxfjd1G6PBe2XxjW5Iv38PjtgXxc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V6vV9LdnOfr05W1Lbzm4EgS99pAxkaE4TOWofyztfKH6JQEWMqTZtjlFkPuXT+p579JfEyWYG3+h6OJZs/OzDxPRvKkos0mGj1tHt5AsMM7LLKKBXcLNtUh8xke4tUIPwRo+GK+a33MaTFupwLixjfDMaKsHJonN80soAjX/vVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dUWuT8ak; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dUWuT8ak"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so4939725a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 10:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786986373; x=1787591173; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PEnRvWyc97A37Ln6PXTQIDa+M4xYXCTC9bYQPyMKWBg=;
        b=dUWuT8akc5iHPhpJBs90PQebDD/CnvKupRtEjpORI1qlLCdy2PTYIzIKaQFJt84+jm
         rba1WUMGHzpq351JiDiIsssFgOsu1V3PMnpbnbpAqu1t419XPoNzRJDrVLMS4DLes877
         ztk4172V+aS0lxFI+yjW93ZX7iJxzZqCvkiOp6zXLmWGPSc1Gplfs+dyQT/eJxdDkTLR
         7+9SXlHxFZh8Rj3aBGEy5A92MxE1jB+O0KnmHS5mCXp2mQQUP901oy7Y/X+h8TpDc7P5
         5c7x9FIugLPAukS85JgY5AmfcJMAjz+y9Saiwfp6ZbiDCl5kmA5cb3QnoFeLqc+pKJN2
         nq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786986373; x=1787591173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEnRvWyc97A37Ln6PXTQIDa+M4xYXCTC9bYQPyMKWBg=;
        b=FhSG8GyirBdyvPiaCurGPanMWlpfvWAe/9iy7VHqjqh18FluNZafDxG62hcL4y24K9
         hrXHb+IlkIZMk4+MipX8JDtgKRoOcCR68dJxSGMN6k83b9/6lVv3gcnSGehRPJPv2JBG
         q5bYDPPW1yCpKYYQyypVJAg3wvObzprlfJxPAPFJotRSZUHLG+pKVsQDp6wRj5SY6wwD
         Io60RBUBgWjYqSBSpSpe9dnsRMWCL0h8lAroMsyts+n+RNqrrrmPxIGFQ0poXMsGu8v5
         sTSymnsJaP7CzUaEVzzNFgqBDm1tw7b4Rv0AysLVR4k0E4SUm+DjOupturBfXCQv/lgd
         0ivw==
X-Gm-Message-State: AOJu0Yzf7CGmsKwMjg/30N6DjNSO/bYmYG7RzmX9WByZ2ui2/wquYbuf
	WhWsHRe2M7Opa/dmLPTvrvZbjC9h/ytgmHvLjJOWnqUoEBGzZkYyfZUbCIM96tKtjsLR76NQi0x
	uRJAN7g==
X-Received: from pgcc4.prod.google.com ([2002:a63:1c04:0:b0:cbe:9e80:c394])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d52c:b0:3c3:a140:9380
 with SMTP id adf61e73a8af0-3cc71c09a97mr31063858637.16.1786986372909; Mon, 17
 Aug 2026 10:06:12 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:06:12 -0700
In-Reply-To: <87lda5kmye.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814162221.2144473-1-vkuznets@redhat.com> <20260814162221.2144473-5-vkuznets@redhat.com>
 <20260814163105.BDEC31F000E9@smtp.kernel.org> <87lda5kmye.fsf@redhat.com>
Message-ID: <aoM_hK4Vn-xr7NvO@google.com>
Subject: Re: [PATCH 4/4] KVM: selftests: Check VMPTRLD with active eVMCS
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 17, 2026, Vitaly Kuznetsov wrote:
> sashiko-bot@kernel.org writes:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The hardcoded `VMPTRLD_INSN_SIZE` of 5 bytes is brittle
> > because `vmptrld` is executed using an inline assembly memory operand
> > constraint (`"m"`), which results in a variable-sized instruction
> > depending on compiler optimizations and register allocation.
> 
> True that, but afair we don't currently have an instruction decoder in
> selftests. I see three ways to move forward:
> 
> - Calculate the size of the instruction with two labels, something like
>   (untested):
> 
>     static inline int __vmptrld(u64 vmcs_pa, int *insn_size)
>     {
>             u8 ret;
> 
>             __asm__ __volatile__ ("movl $(2f-1f), %[size];"
>                                   "1: vmptrld %[pa]; 2:"
>                                   "setna %[ret]"
>                     : [ret]"=rm"(ret), [size]"=m"(*insn_size)
>                     : [pa]"m"(vmcs_pa)
>                     : "cc", "memory");
> 
>             return ret;
>     }
> 
>   and use insn_size in the tests.
> 
> - Stuf __vmptrld() with NOPs after vmptrld and keep the constant jump,
>   just make it loner (e.g. 10 bytes should realistically be enough).
> 
> - Make peace with the fragility (it's just a selftest after all) and
>   leave a comment in vmptrld() that changing the asm there make break
>   the assumption.

Option D: use KVM_ASM_SAFE() to do the heavy lifting.  Completely untested, but
something like so:

static inline int vmptrst_safe(u64 *value)
{
	u64 error_code;
	u8 vector;
	int ret;

	asm volatile(KVM_ASM_SAFE("vmptrst %[value]")
		     "\n\tsetna %[ret]"
		     : KVM_ASM_SAFE_OUTPUTS(vector, error_code),
		       [value]"=m"(*value), [ret]"=rm"(ret)
		     :
		     : "cc", "memory");

	return vector ? vector : ret ? -EINVAL : 0;
}

> Any preferences? Personally, I'm feeling adventurous and can go with the
> first one - calculating the exact size with labels.
