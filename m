Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598057;
	b=s0E5OC/gV/Y+7x9GVR42Yi3kOcv+81Xv5Ka6/mhmAjtxHjumSDPOPO8fpScPD9BxuKmj
	 X0OxvOgxq1S8Xmvy2b3eOxuafnqxDV4BTHmT/UTMkVMx+tsDYloxVzoSAVCcU9U+SvrOa
	 jPmB+fRaQI36m/ltmXFDR2ab3CtfWdcn7ECLMPXYdKatx3zBo/PaVaeIC2YdSCj0F+Slu
	 eBEPnPrmmDAA7HAbPgFJth0vqnOAU1ooT7+wAo5q8Dv+zDFsRUNS9BKxD3XJQuwWwGxeR
	 vb+FbGhsyZjluR3a4RsjT//lThGv1KtlX4YrgPQIisIJsOpgia+Ozut8wu31PJyQUHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=zqTNPD7bC5qKrIZEQgWRFxdczrnAZu0gT9xHLYWFyDM=;
	b=obaeMu3N2MrLNNOIO2d6rZQUssT2ttut8Q+WxUFadpU1lyYSxzp6Y9ABLKH6iSWkj1SI
	 31RzAEoVN2Wbw6Bmzi6FRSI/lit6hs8InhzAJBdoVy7PV//XVsBk9tV5IpXZz40sP/SmU
	 TnX8E7X45iB4F+ccBC8eTkMcL3Pl8eIMg6pffsGYjtzFAKUb99f55v87x3HoWofZCqNDo
	 KKFCqJGUgv8ufXD3Z7nKC821vwF6FW9Eksz+Tcv9ujNYsCazHCjiukhuTHw4y9TVG9TdO
	 VtJwlbzjqzVbt78Ze2W1wVHsefegBqRIvNL2fyuft+tbo3v1wc4vXyCEfA+SENZnwIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="O/thzJS2";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F6B606A69B
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 09:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F6B606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=O/thzJS2
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3128476f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 01:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795598055; x=1796202855; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqTNPD7bC5qKrIZEQgWRFxdczrnAZu0gT9xHLYWFyDM=;
        b=O/thzJS2cCBhcjf+pKLdn/A41J8Hp6d1sqg9InTW9ILw1K6v31HOvVwzwcZ2wNsyiW
         wI5DKa6/Ec34nAoxwOOR0gLPWJwaFWVeBlGa0mGmlachhG14ja84Jo8jEy+y5A2RZhH4
         tWTXan4iUqYSnhLySf/kYVK/aR0v86cykJeHQ1CarwkY6omK85UsHWrbDMpwPqEwJZes
         HjJfJJ/wb87fGjG/f3m19RlW20vat7deXny18R1net6uqkfwDh7wI9Dw4SSq4LeYhdJf
         7LvJmRxW+DItx5vOZCz8Isrt/pYxHtWaZtPFQWw4RpA926n64k+RbMlPOKVnXi1hPgBF
         QCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598055; x=1796202855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zqTNPD7bC5qKrIZEQgWRFxdczrnAZu0gT9xHLYWFyDM=;
        b=YF4lbqwzOUA4uuy8mPiETJQrsC3BGPEhRgtHr940QV5eSDD49AOcMsSEjm6JBUhvrp
         G3F9g7dsjgtHMDYVywoAsyXROj0MMo34gmUjooxpwkAyghDE12B6JwTEb4sGJifX/LwH
         yixURQ9o5CbMoRjPGoPpA/bQIsIIk17/kXryrb3hLf7SrBfbBEAmkNarNCV+sSith6xK
         67BoXCsYDlzjC1D6+rDTLwFgj28Vv1YX1tEeq/GVlqbnvWP9wkSQTV6f1spwhXAA6bwu
         +tVEn/2/4YO47poiTPrPkeAJCc4Ec7V4K+paA4b0vPwlagyenmk4VUtzyfrFwtgmA9X/
         ZpsQ==
X-Gm-Message-State: APuU4Z+5tEE19ynzKhDJQ3wPa3G7GWC6EfYeu1nfCzDxUhXnNartJnVn
	DvkM7TiiXFuGn7dHt3tRTob9Evvsu5s77K0aow1ZUDiyBXefaCbbXSmlcIGackDOvVsntPBNNaG
	2fchlp1g=
X-Gm-Gg: AZFdTZfAiHY8abO8jJrnYteRzrTYHmYSQ15Vaymtqgr+EjZI1sV63AfV2aazQh5qPHj
	PZan7HvYb55/3kGLynycnT7cq9AW2wSQYPCWdZZ+5DxIpmlikQca9JGzAA5nNic+Gz+ZCshO68A
	YxO5aeyOa7reGB3n2fg1tm92r8mMlEFWvR6X+NKU3w6Vg0XiWzR5JaJja+V3/D5+Qmuh/9CTXsg
	R4gx5LvGOHHGgMwqWFtV0pCS7usTytD9vDUT00c5nYKY56dsCtBu/fr6C1jaZ0Guz8rC9ZMxmRK
	bEFav+ZKOt9TU7KrdnzCVx7XB38+EJWaNvSKUG403ysFMcyB7990uKmtLMDcVfKsM6IYy3vzKTs
	+0SeyJ+e36/8qkUh76UJwb8r2Ad3mVA33aJ4vJIeXC28wzTwpSrwEWgF+hyytPcbgzjVeGoCMC4
	SjcJcQcNAOcBX/lK54XcZBifB2gAekZVkJeLSHeUWF9kXLpbV6rpZi+THqbGKkMp6tKlyo/hzT/
	q5VEqm8W8VMFnhMVU/jeDQCHEKx0n5L0+ZUPlNfA/5t9T3iwoaHpqDN32aoNatx2iDUsDam1ej1
	LQbSiXHlGO4aC4H6ydo=
X-Received: by 2002:a5d:64c9:0:b0:4a6:bc53:2478 with SMTP id ffacd0b85a97d-4abb0d5256fmr33657721f8f.13.1795598054777;
        Wed, 25 Nov 2026 01:14:14 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf62f7sm34532100f8f.13.2026.11.25.01.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:14:14 -0800 (PST)
Date: Wed, 25 Nov 2026 12:14:10 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-s390@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1
 when resetting a vcpu
Message-ID: <awam4std0Zifdn9k@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
 <sashiko-outbox-232760@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-232760@kernel.org>

Let me add the s390 maintainers to the CC list.

I considered doing it the way Sashiko suggests but s390 doesn't have the
__vcpu_assign_sys_reg() helpers so it broke the build.  The registers are
not the same so, either way, some of this is going to be specific to
arm64.  But Sashiko is correct that s390 probably keeps a stale SP_EL1
across a reset.  The s390 maintainers could probably take the selftest in
patch 8 and modify it for s390.  :)

The pKVM part was my fault.  I had a patch for that but I screwed up
and didn't include it.  Sorry!

I guess what I'd like to do is keep this patch as-is and let the s390
maintainers fix s390.  When I send v3, I will include the pKVM fix.

regards,
dan carpenter

#HashTagTopPostingRules!

On Wed, Nov 25, 2026 at 07:15:46AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] KVM: arm64: SP_EL1, ELR_EL1, and SPSR_EL1 unreset in
>   pkvm_reset_vcpu() and core
> --
> 
> commit d315f26d12c1dd260ed62612065ad5e34b6f9f03
> Author: Dan Carpenter <dan@pereq.eu>
> 
> KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1 when resetting a vcpu
> 
> This commit zeroes SP_EL1, ELR_EL1, and SPSR_EL1 in kvm_reset_vcpu() when
> resetting a vCPU.
> 
> > diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> > index 26081d2734087..9c1b42890c966 100644
> > --- a/arch/arm64/kvm/reset.c
> > +++ b/arch/arm64/kvm/reset.c
> > @@ -199,6 +199,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
> >  
> >  	/* Reset core registers */
> >  	kvm_reset_vcpu_core(vcpu);
> > +	__vcpu_assign_sys_reg(vcpu, SP_EL1, 0);
> > +	__vcpu_assign_sys_reg(vcpu, ELR_EL1, 0);
> > +	__vcpu_assign_sys_reg(vcpu, SPSR_EL1, 0);
> >  	vcpu->mmio_needed = false;
> >  
> >  	/* Reset system registers */
> 
> [Severity: Medium]
> Should SP_EL1, ELR_EL1, and SPSR_EL1 be reset in the shared helpers instead
> of only in host kvm_reset_vcpu()?
> 
> For pKVM protected VMs, flush_hyp_vcpu() does not copy host_vcpu->arch.ctxt
> into hyp_vcpu->vcpu.arch.ctxt.  Instead, on PSCI CPU_ON,
> handle___kvm_vcpu_run() calls pkvm_reset_vcpu() at EL2:
> 
> arch/arm64/kvm/hyp/nvhe/pkvm.c:pkvm_reset_vcpu() {
> 	...
> 	kvm_reset_vcpu_core(&hyp_vcpu->vcpu);
> 	kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
> 
> 	/* Must be done after resetting sys registers. */
> 	kvm_reset_vcpu_psci(&hyp_vcpu->vcpu, reset_state);
> 	...
> }
> 
> Because neither kvm_reset_vcpu_core() nor pvm_sys_reg_reset_vals[] resets
> SP_EL1, ELR_EL1, or SPSR_EL1, a protected vCPU that cycles through PSCI
> CPU_OFF and CPU_ON re-enters in PSR_MODE_EL1h with stale SP_EL1, ELR_EL1,
> and SPSR_EL1 values.  Resetting *vcpu_sp_el1(vcpu) = 0 in
> kvm_reset_vcpu_core() (which also covers arch/s390/kvm/arm64/reset.c) and
> ensuring ELR_EL1 and SPSR_EL1 are reset for pvm_sys_reg_reset_vals[] as
> well would keep all vCPU reset paths consistent.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125-double_exception-v2-0-224689d8a764@pereq.eu?part=2
