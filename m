Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820945;
	b=DA6Fff2dFBjhFJKYND4UqHIzwtlw4bkeoOnFLuzUUZoyZkhQToMwaOwS4HvtX6H24x3O
	 GHKmVa7+gJxbRGOqgoV6jefUVOtn1r+T4Z+2weBIjzo3QrnP9AO5klkFGM4XpvEgK5acI
	 +wlt9nbe+LhDppCXzQ14TMRTvtNw9bk1jP5OCatvkX21kJ0TRcA2L8K6hqRTnyFI0cGMM
	 ntudWF9yeuKjt84k9U7m3AnrTnQpfk5cEFbkqcfB9UygWH+C1bwsl0+3OWOQh5cIpmHXI
	 Jp+sgjtJxhcYUk6hB0vfGnlGrVgQURlSsIyvO3ar8tizHYqIeggvX2Bv90GWUH7Lvwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kHdIL6Qy/M97X4vCAX1fCvBa1y4VV/EfPvmnoDmBPuA=;
	b=E8lxXk9dJJ0Tm7PNmEiGHZVQLJ6jCp4dTt/lmYzei/jCrSn15RnT16IPQkRtwFfxJQ+B
	 0LfD9jtkvBDCmjsOFoK78rAufTPM1wskDtvL9YCVeTolMxg5cNQQUXN0YT24tcxFGvU/d
	 oRRtbUb6rT2c9hHn/l34tH2J7RdB7tqUQXhguEuBinhiwC6WQ37ncSC8E1mF5R0rLq9s6
	 BgA4sMfwQ1WtAcIDwhZ0XsidNVm2R9NEiwMG11IPb+99flp/M1wmbX3QBb5QxF50FRgKU
	 ba2EjKb9LzDxAzi7SBmGG3A5l4RzRuCpQZ6dzYV5zaQgcE6jGYJXJ9YcsMp1HRAfmzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=V1mA2Rq8;
	arc=none smtp.remote-ip=74.125.225.73
Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95616606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 09:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95616606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=V1mA2Rq8
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-490ca655ba2so1265269f8f.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794820938; x=1795425738; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kHdIL6Qy/M97X4vCAX1fCvBa1y4VV/EfPvmnoDmBPuA=;
        b=V1mA2Rq8axjd5UuOqShX0+NFFajonLEnP+fODR9etuMbydXolH6adlCFGh1UCGAD11
         yS18NWSrC1Fub0gcRXuQ85IqyZKsV9Vhwom4Ej/f7YW0xvD9QciJYrjX56BH9TdqzS8B
         Le/2s7v/VN3mHZMJH5TCbS3ExdW7gmH6ikVzjeil9WLS3AV4wPoiW5SGul7wVwUIps0p
         sHPKvTesXDqwQWtc0gdGxNdsv+3aIMFFTy5bIdIqgeHJJGDNdhKzeTR2XO0wjwbGBEMo
         xK4yrb+OZN/p3QNYMANFyYDctmyJ1dWjXQeOEed2mBaaQx1B4NI7+ywt7b3mL5xCorTA
         OMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820938; x=1795425738;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHdIL6Qy/M97X4vCAX1fCvBa1y4VV/EfPvmnoDmBPuA=;
        b=dt4RWGFjGnTJ19GilDx9TnT70MnQFUez3OqVET9EL9381AddS/7Qwigp1M2nQesa03
         j+FWbBQWrTyVBv9Uqh4E3l4o75Yc5kgxEqfL+NeuvipgiTXt2hGOWrUuEwDM7eqD/EkV
         8sRmxEF8+RG56cVtMJiyB8FpuOUr7gBIszE3s26HCnHoH08BuQfltvAkIDUv/HzfIIJz
         2jF8KLks6oxl3nZIjDJFj+ZMBG+JsaDlBhsHSRSUmXhBCCCfQGD4qcDmnbR++weKuVdA
         zyDQyFpuWhyp/d/F9peIMdP+18dzSi2m2hQwG4tGnd5ClunbE3xeMAJ+Mcd7eHtvGbt9
         26tg==
X-Gm-Message-State: APuU4Z8w1neT9C1K3MNCZ9TeTledZuWniESO2C4ZehiAOH99SP7sM0x7
	ezvWlbdYcwrH9CR8wGRAzuLZ1IoDX+OE9eTUp0VU3Qq6n1v4KmFNt5/oeatu+oht7YvyTBNQMbu
	HgDzLgOqzvAis
X-Gm-Gg: AZFdTZd+5GewM4oFFzFmKm/4dKUxDTUyTZF5E0lZ+SuUfRzR2jHYcNnitv1nNoofapD
	XisImB2+UfL2qjMtRTC+u5C2CDQ4WpJeOw6OPYi4jXkuGWx4+2DcQfh0U369hegFb3N1RCUQGXt
	UFadTnVtbxQqI70iOrcgpl6f2vNhcJzFXF00WS/7rSFlkWAcLJRGx0ivtdUXUjywZPVKLorkym4
	Lpl0dpy/eSTEeA0FcOX0m26AVb4Y+JHVzIyhOErRgxLkRLmg9AXFbVb64InVDR+LBBySDnmE1LQ
	Cb252uq/xYX9qgAx3diJERYI1UTIvsB0RH2mdXE5SptKNr2bgr524EkQ9QhnBemoIG1cNQq7kOU
	XHoc2Qla3WcleguL/fVbN8u2zKwbmUk9SQ+fDZgHD+hAarQRymYS9tATVURdXQahF5BlxpcvMoT
	553gZROMBbGucCd/33VTRRYxnj2+HDgisF4uC+9Kbn88vA291F5KQuPWKbMRIiZb+J+n+sa90XV
	wPyiXKjc7pyhb9Q88tivb5jL/l898n5+sOTqGcpora+/+yg2m2MLU3NdvKIuXuocOXUyf4HI6yU
	Tlxt7PweX9et6PZ91vI=
X-Received: by 2002:a05:6000:260a:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-49c727cf557mr19077157f8f.42.1794820937714;
        Mon, 16 Nov 2026 01:22:17 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c651esm21650487f8f.47.2026.11.16.01.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:22:17 -0800 (PST)
Date: Mon, 16 Nov 2026 12:22:13 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 1/2] KVM: arm64: nv: Fix AT emulation for TCR2_EL1
Message-ID: <avrLRfCRUcLrc9Tp@stanley.mountain>
References: <cover.1794808373.git.dan@pereq.eu>
 <eec50693a12e1ba34d60458ae8fe605ac198a79c.1794808373.git.dan@pereq.eu>
 <sashiko-outbox-216278@kernel.org>
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
In-Reply-To: <sashiko-outbox-216278@kernel.org>

On Mon, Nov 16, 2026 at 06:27:41AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] KVM: arm64: nv: unmasked PIE/POE in SYS_TCR2 in
>   __kvm_at_s1e01_fast() and __kvm_at_s1e2()
> --
> 
> commit ba7c962c50af660f734650ef98aa65969755bc0a
> Author: Dan Carpenter <dan@pereq.eu>
> 
> KVM: arm64: nv: Fix AT emulation for TCR2_EL1
> 
> This commit sanitizes hardware SYS_TCR2 during nested AT instruction
> emulation by masking out unsupported PIE and POE bits and clearing
> SYS_TCR2 when the guest VM does not support FEAT_TCR2.
> 
> > diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
> > index 30d8f062b2c29..06765881a4c81 100644
> > --- a/arch/arm64/kvm/at.c
> > +++ b/arch/arm64/kvm/at.c
> > @@ -1438,7 +1438,13 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
> >  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR_EL1),	SYS_TCR);
> >  	write_sysreg_el1(vcpu_read_sys_reg(vcpu, MAIR_EL1),	SYS_MAIR);
> >  	if (kvm_has_tcr2(vcpu->kvm)) {
> > -		write_sysreg_el1(vcpu_read_sys_reg(vcpu, TCR2_EL1), SYS_TCR2);
> > +		u64 tcr2 = effective_tcr2(vcpu, TR_EL10);
> > +
> > +		if (!kvm_has_s1pie(vcpu->kvm))
> > +			tcr2 &= ~TCR2_EL1_PIE;
> > +		if (!kvm_has_s1poe(vcpu->kvm))
> > +			tcr2 &= ~(TCR2_EL1_POE | TCR2_EL1_E0POE);
> > +		write_sysreg_el1(tcr2, SYS_TCR2);
> >  		if (kvm_has_s1pie(vcpu->kvm)) {
> >  			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIR_EL1), SYS_PIR);
> >  			write_sysreg_el1(vcpu_read_sys_reg(vcpu, PIRE0_EL1), SYS_PIRE0);
> > @@ -1452,6 +1458,9 @@ static u64 __kvm_at_s1e01_fast(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
> >  	__load_stage2(mmu);
> >  
> >  skip_mmu_switch:
> > +	if (cpus_have_final_cap(ARM64_HAS_TCR2) && !kvm_has_tcr2(vcpu->kvm))
> > +		write_sysreg_el1(0, SYS_TCR2);
> > +
> >  	/* Temporarily switch back to guest context */
> >  	write_sysreg_hcr(vcpu->arch.hcr_el2);
> >  	isb();
> > @@ -1554,6 +1563,9 @@ int __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
> >  		if (!vcpu_el2_e2h_is_set(vcpu))
> >  			val |= HCR_EL2_NV | HCR_EL2_NV1;
> >  
> > +		if (cpus_have_final_cap(ARM64_HAS_TCR2) && !kvm_has_tcr2(vcpu->kvm))
> > +			write_sysreg_el1(0, SYS_TCR2);
> 
> [Severity: Medium]
> Does hardware SYS_TCR2 still retain unmasked PIE, POE, and E0POE bits in
> __kvm_at_s1e2() and on the !mmu_cs path of __kvm_at_s1e01_fast() when
> kvm_has_tcr2(vcpu->kvm) is true?
> 

Yep.  Some bits are missing.  I'll need to update this one.

Also sorry for sending patch 2/2 before patch 1/2.  I fat fingered that.

regards,
dan carpenter

