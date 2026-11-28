Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858141;
	b=VKqouJBEQGwNoQ9L06uuEPNnrZkhZFvty2xqPDYroZG4Xdux28jJqxigIXxHQ9K1DJoy
	 2C9ZpgI7Bd3pVVlkUNL/uexOKdCRzVSkvpXxkcWACa2HMAbyTBGMI1QZ+l34a8HVnkqtj
	 /nUIyFfdsvTXSEXnwn/CrmzKdQkRH7K4MtU2ddk5imAQz0SOqSzzNNU8gwxOQmG1nx1k8
	 0BZg9WujpxG79H/mb7sHXt2nvbrVZAdJ+K+wHkBYV6tBivWOCFoJg9UiOOlCsyjS31Q/5
	 VQpZVe3u9rNsNRpiMo2MNJxUrjbvjIBST90aph32jPpUr1UoUQXu30R2FEtQLp47uWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+T4002pIw3rZ91yEJ61NQuLQSTrjOSKQ29W7WLBm84o=;
	b=5SSlcRnrP5vXS2Kty5dXtc0CKrEkul0pOkMrW2Y0aJ4CTI9HSp0ZMWR6O/o7XQovTxJa
	 gkdbzwqqobehVk27dIewJP7xHOoBU/0SbQPqTNJ3m6FONFdp9hWNpvcD4TIPh0c+FLtNA
	 GN/EXvZModbCY2lTAltNDAshfMXeF0V+/4tNeWspPUGqLybQkGxKT12jmeK2Tkbkb4/MP
	 6SBCT+Ady6HCqeGK0LhAKlpBxjlQOWwFS6/oGeACDg6CzDjY11zpWm2+rMRD3jJ3KWVtf
	 cA1m2di5M58EOiFHAsUz1pECKi56ySNcooeTnHXOWF6jmXnv6Bg8VfQAT9jHWwnmKJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=T+B+CzDB;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE8A606A31C
	for <sashiko-reviews@lists.linux.dev>; Sat, 28 Nov 2026 09:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=T+B+CzDB
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso7832969f8f.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 28 Nov 2026 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795858139; x=1796462939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+T4002pIw3rZ91yEJ61NQuLQSTrjOSKQ29W7WLBm84o=;
        b=T+B+CzDBbgmOBbDXp8E8xZotufbo/ugkIh57ynvSyECYLGKafRa/1a6iz2z3aGenmW
         kR1zqNDoTfj4JL+n6E/HHK1dbTHNr1NzCshnHDxj6vf67AvfyoXJaCEzB0LHyJlHewrK
         dWiEDgoo3ukIu0SBVB+qHBQnm4xtmdcprSPL9n8e2rNRg7kl8/q8WqlKHsz9K0wE1tgM
         zeCM5ZzahMvVUXXAH65ziAoForEKBVJvFaac9glJ8ju5JkTJggJppumnUpSERUcteuLe
         kdtkggJtA0JWdkE1x9tff0uKmk3wUtRI/TLIgKaOtP7A7f7+ysRyHW6Cyar8CJge7MXx
         DnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858139; x=1796462939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+T4002pIw3rZ91yEJ61NQuLQSTrjOSKQ29W7WLBm84o=;
        b=tctfKRS4NmyZgiwDmmA6sN1UvTofXXKrkY48UQ4YGmJ3Wh/b6jfYsNZWp0DjI964cs
         Ib/3vkT14TKXdhV3IdEp+rVHQ4N7j84QbXEfDSI6uX2Esa5ad6UBWnMvi3BIFqC9Ntxl
         o3wKuO8MA9C9425bOXa5fnY3O3BVbSw2loW5BJZq2sgv99xB7fK0yyFME1fKvF18D2pX
         6vglIXrg66ajpVHovb1SxpIJVVQ5yCxoJTDiSZUARkEnh5Air6zNtqLV2v5pkn5TlAbF
         XUsPabCRRm67C7ikQoCuF1ns+RXDXOkZ6tNz7MUCGwyxU1HSUfM1SbCe9GbdXh3cLStX
         iuHQ==
X-Gm-Message-State: APuU4Z/O4+4hrEhu67JaDT8ozD11q7iRA1MurkPl0oAqpz6wIa9a1iDL
	Dweaw98GxPAH14WmpkuzHJgIm90lEFGcQJbfdZnrpr4Y3PSHI1L9Je48NUMlG5BfgCyeiTXqsST
	qZQD7391qZA==
X-Gm-Gg: AZFdTZfU1b1ue7u94RarzJ1Djg6GMsW6p5DdOI0UZ9/svU+yISorF1zQmuOXoUo2M3F
	GvTEFulbHNpyNVCD10yWrU8y1+xNzDBVnUVCwxPuregkSCTFoJ2nqG6wc/069QVO/X+TmU9A2Ff
	pyewmAJT7boEjj2atDc2S4awzfD35nk3AJLpRcpQ5C4D5GCGeDei2xU+ZRCQ1rTrsdJT9cSX0D+
	j4S6vtHbna3dD+IUHZiqNnxna0Fd3iWlocjR09V2ufFTq4cFpWXz7RFaa2xbcTWTpWkkgV1/nwC
	EnwT2+7J/ICXWgq26qxf+nWCtwO1b4B7CLHfnshNlYXb6JuK90F1DGBdAJS2o49hUvP4VF7qFYX
	Brm5NNj+RpiRpDmRltRvCiu8Va+raDynbMKVb0VLB4t67xwA9upOXL4kKbmnpE4QvBJg7FzT1TQ
	8+HWE90VLWJm8IeaoXDVftGepRlRSeOg3JzTZyxSgAdpgnHKzLUngixg0Vi+Behe2Fnv/vlpxeT
	iejdonebUhEsOoxMYv0EH6cVFsk6ozUgkS/foO0pMFqk7OJoAantusLcAkt3dP+NtZsszKzUriA
	kB80dqc0DzGdfTN0bcY=
X-Received: by 2002:a05:6000:26ca:b0:4a6:4687:2ce9 with SMTP id ffacd0b85a97d-4abad5ac73dmr53013677f8f.4.1795858138844;
        Sat, 28 Nov 2026 01:28:58 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b1ed8b6a05sm31097138f8f.43.2026.11.28.01.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:28:58 -0800 (PST)
Date: Sat, 28 Nov 2026 12:28:55 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 1/3] KVM: arm64: nv: Fix AT emulation for TCR2_EL1
Message-ID: <awqe16An2pmXAmfO@stanley.mountain>
References: <20261127-nv-tcr2-v3-v1-0-9c15c1cabe01@pereq.eu>
 <20261127-nv-tcr2-v3-v1-1-9c15c1cabe01@pereq.eu>
 <sashiko-outbox-237810@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-237810@kernel.org>

Btw, sorry for not putting v3 in the subject.  I'm just seeing that
I missed that now.

On Fri, Nov 27, 2026 at 04:01:09PM +0000, sashiko-bot@kernel.org wrote:
> > @@ -1437,8 +1463,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
> >  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TTBR1_EL1),	SYS_TTBR1);
> >  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
> >  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
> > +	if (cpus_have_final_cap(ARM64_HAS_TCR2))
> > +		write_sysreg_el1(effective_tcr2(vcpu, TR_EL10), SYS_TCR2);
> >  	if (kvm_has_tcr2(vcpu->kvm)) {
> > -		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
> >  		if (kvm_has_s1pie(vcpu->kvm)) {
> >  			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
> >  			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
> > @@ -1452,6 +1479,17 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
> >  	__load_stage2(mmu);
> 
> [Severity: High]
> This problem wasn't introduced by this patch, but when __kvm_at_s1e01_fast()
> switches to the shadow stage-2 MMU here [1], does it need to call
> kvm_arm_vmid_update(&mmu->vmid) and check and update mmu->last_vcpu_ran
> the way vcpu_prepare_mmu() does?

Patch 3 does the VMID stuff, but it doesn't handle the mmu->last_vcpu_ran
check.  Probably it's simpler to use the slow path when they don't
match.

That fix would go in as a separate patch at the end.  I'll resend the
series next week.

regards,
dan carpenter

