Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842844;
	b=IUpaVgi1J24tPMhqfJ26DT3e7L5fwXeiJfz56OyDWky7K0Tnl4vc4XBYRZM3DCzZN/1+
	 fwwX3WBnuxXW+sShacABgVxdiRNEtgXO0EnTB7a5s6wQ7xYU4Uh1gXhPjYlfISs05AzRH
	 JP7TzpifswXO3sJ9o/bjBSDXJ09ql/JpsWClD6paFRVJ6ffBOxkyxhsUlCh8XyMaIeN76
	 w4e2GSHY4eB0czTyWrgtAPomjHmt8CnfQLe4e0bqXNCQXlGD6TCPJmyoNjyYuupED1o8j
	 6vuCl0/kL9yHdFE4CRqr7Maa3KgnHH76be54m6n/Q3J+xTOEhcZG66PsaVuhUAC/pug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eoxTx1ruNCZnKQ2C0kl5zbniFIBX2aek5amYXBxk6HE=;
	b=T1U5CuNO8pFVa4zoUBZ1XzdEobkSFWUrCba3hC3alXGGHz8Gs1NmCrRmnKPmLrqam7FD
	 wV0Zho5u5TUR0wL0S1pTgkzPEnmW3QBZrCsl28lCz7f6zAkEn66Hlt8wO2I3ThP3qwAaP
	 wGaj3gaG/ADzOm7gWxSvyv2tBndHkqiZfOs+tg7awjOSiBwoFykpzNDLtBqsEN6HVX2T1
	 0lK4v1S8v7vZGmOh6JH9vozxW9in7QBohRDGXgQEXMHj5mVsMuP1Un9vqYu1yCfcoua1n
	 8zCd79UTEahuan4RPuQgaJ0GR7jTXI8QAX6dW0XkZAzSReEQVNjHf4aQijEJ1h/nILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=JJdSwTe2;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E4606A322
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 15:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E0E4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=JJdSwTe2
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so10946925e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 07:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794842842; x=1795447642; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoxTx1ruNCZnKQ2C0kl5zbniFIBX2aek5amYXBxk6HE=;
        b=JJdSwTe25SarMh4GmxwbuVtkkcwIktk+vsnUxcjWlR4X0VAJEGjPhdU/rciwY8rMJk
         zMJnf8lLXj6/xGNmbST5shOzGW4e8lgCcZ3ZQUeBW1mLIGZ5Em/12nI6T7qovEAyxUym
         wh+1XX7dQujx0eTWUJf8Z7od7GC5PmtybFLOVstf8FirOgR15G5/kS6fUh56ZG4zROP6
         +oDCyyxEpDLyqTAmeVXUWjA/b0S+tdCEU78jZj1ktQoHMJYf4O7Bb9dj00+H7lEMBBEU
         KkWJeRRKnW2Cdl9KL3PDH3W0pQeEJ00LjKYSh9eRIB6WRKuHhnRVQ9VHYBDzsXI4Jf4A
         UGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794842842; x=1795447642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoxTx1ruNCZnKQ2C0kl5zbniFIBX2aek5amYXBxk6HE=;
        b=mHsuHI8ZCZgu0aHyPOZjshcwegu/7Fix9C0iT7fmARTIXJwUX4do6MpPl+2+yaeDav
         nMfvjfGM+xiXxiIEXjrVm9uh22662WRzuG1e8Oc+kRMnhXzwCtCzCmFPFNpCPACS3UEg
         rx20TWmChrYNzRhdZPwh+bNoGQkIMPi48AN2xuQ8rRmooh1BeaHda4ccV4O8oeetrqYu
         HabFeqrMvOGj3Cr3XuNiF2Q65rAxjjAvajgQm+DPnsqM9RLYqIU/RHM04glyjG3nm+cA
         WDTdFvFiAMxJrLEEHhhfgBFryedxrDVe0kGI8Wpp/ueKJdjQI+cDL71zmXHkoOfZQWuM
         i3gg==
X-Gm-Message-State: APuU4Z+K3AtjcLFqjWLTFv9Q4mPEVmQFcEdtY7Pc2QldK21keloDchPD
	rM4szQDdARqRHbMLv0Vbu7nnJAkKE9lcivif93T/8tpUDPywGmEw/gYpjvORcI2EtMW2DHCswpK
	8gFeiQZ3CMg==
X-Gm-Gg: AYBFou2sjewr7wffc37CqGpCzlUHopWXp0wrxf9ae21nOsM1O+Jc6U+NXyyFIKU1XWY
	Lkx/J+ofL9x98gHmLILesQ7viqZztnItcYG11k7466NIRs2kCYH1u+kctPAeVR+YeJEf9MYU9TZ
	PVZyUND9y9E7xA3tbqzNFCTRJfLTYBtoDVWFTHuV+kGNxF4IZ70jtFvSdufyt9T+6tPIpYCldq7
	z/Z0V2odH3vHhFep64sG0L6dXKDdFxL3RlX+q4yLKQgGf2DzbglRqfJXtKXBOP9bjxVv3cds0xx
	kxJ5vbgd4rQqKwrW0srf+VbvZDYmLUlXa9xiLKwVScvUnEadnU/d7SomUtoS31FyHhkKhMG2j2D
	HDikDE+Di47jFPjuD6O0CoY7Eo+AUnxHgki7yzmmH1amptsXsrhywTZQRDhI5slQZCcmpCkDnXa
	UKDgeCbTXHP3SDkWXgB3aSQJj08nSMTHVIvhAF1VOUTYWZI7CYu8+yq8h2GdAPUA8vPt1rQJrMz
	P+Seb1CWYh7ZTZ9Vx48wRp9ym4ndb2y9C1sPHpRyrTXrhMTEHhVpY8T62xaDPcsjXVfnO9qzdzt
	nL1nBumatI2z5DdzQ2vanxUS0rf1P8Wuau23zWBf
X-Received: by 2002:a05:600c:3152:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4bb55aac0bfmr242496785e9.34.1794842841763;
        Mon, 16 Nov 2026 07:27:21 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm600185375e9.1.2026.11.16.07.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:27:21 -0800 (PST)
Date: Mon, 16 Nov 2026 18:27:17 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] KVM: arm64: nv: Fix NULL dereference in
 kvm_inject_nested()
Message-ID: <avsg1V-mvqL3sFkP@stanley.mountain>
References: <avsH0lxpLIF2Ug64@stanley.mountain>
 <sashiko-outbox-217134@kernel.org>
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
In-Reply-To: <sashiko-outbox-217134@kernel.org>

On Mon, Nov 16, 2026 at 02:06:38PM +0000, sashiko-bot@kernel.org wrote:
> > @@ -2915,7 +2917,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
> >  	 */
> >  	__kvm_adjust_pc(vcpu);
> >  
> > -	kvm_arch_vcpu_load(vcpu, smp_processor_id());
> > +	if (loaded)
> > +		kvm_arch_vcpu_load(vcpu, smp_processor_id());
> >  	vcpu_clear_flag(vcpu, IN_NESTED_EXCEPTION);
> >  
> >  	preempt_enable();
> 
> [Severity: High]
> Can kvm_pmu_nested_transition() at the end of kvm_inject_nested() still
> run when the vCPU is not loaded?
> 
> Right below preempt_enable(), kvm_inject_nested() unconditionally calls
> kvm_pmu_nested_transition():
> 
> arch/arm64/kvm/emulate-nested.c:kvm_inject_nested() {
>     ...
> 	preempt_enable();
> 
> 	if (kvm_vcpu_has_pmu(vcpu))
> 		kvm_pmu_nested_transition(vcpu);
> }

Sigh...  Sashiko is right again.  I will resend.

I need to figure out a better way to test patches so this doesn't
happen again...

regards,
dan carpenter

