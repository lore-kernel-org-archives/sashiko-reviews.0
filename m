Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA41284883
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 23:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782430216; cv=none; b=klDAfyuFldbl25bfpMc7LDvt0x2F945Yd2VyERWS+OVhS7wcTJbaurqKV0IAzHfH+3SHIP1cEjYSZc8PTXmX9BPMVnoHt5pHx34u7RtjO50YmRd8goS4YNqpXwnXxoOHkzrDYbCaomDJVPDKNUlKqGi2BAJ4tNErK4Q7t62Hm5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782430216; c=relaxed/simple;
	bh=IfEIqXCsLoXuFEdY+/Zoq37zzPSKcssM5p8qVcbSjI8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c4k4TsIBwWwMseJKdj2D15dLR+9O18I+8yLkaq+vaq7GaeIMQ4SJWz63ZeIFsRhAqhT+RDPQcKGhnxQuIpyQwrQefe3Mq0Vq34rLUQS7GOHs6n7e/l7en2ICDRJJRGqzPkt4YPSZeDdx6UCI2dNDNh2falOtLVnhBNWKWg5Om0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IgZZoPyO; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IgZZoPyO"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-37e00ef16d9so312506a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 16:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782430215; x=1783035015; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0iCbOfMxhRIrrW6aDycaUikl9zPdDsZys9Ta85uI08=;
        b=IgZZoPyOu/vS2VGSL+YNDp6JqM724cpsYSqieeKs8TsHW2HEUcVteksuG7+ZmjVwBF
         VZCkM7rVC2rkLRUatwkZC0mV4Mhdb9vcixCh6eLmWwVUsQgcoEKnTdfsYYPognBb8sGK
         xSggxt0FM3cmkRO6yzlLDqCoxbjGVnmaDly8jfeX0L/aAH1Z8bNroa/Xynt11gqn6ixV
         tX7gZFJCBRGuk7Us3FQ2Hx/V2qF/0Z5Bilop2n0/a4DiIrP3x3Lpi8KIcROISoIaUI8k
         QozUtG+WUlcLx8ctAQEapD5lMtKCKeMisGhR3SSovgQJYi/wuttSuS99JeYjrCKRFIi0
         cY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782430215; x=1783035015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0iCbOfMxhRIrrW6aDycaUikl9zPdDsZys9Ta85uI08=;
        b=UE3zjLWaFC9raDW0hfGqFenr79Fs0p4KINt5Kt9UnlDqYhhlESCMuceGfu2voOiZ4q
         tHKeqwleagXAUl2/eUhmaGRNWoA7KGvMDs3jEgQPkf39Wt1SyTMrk3ok6TGnyCzk3r/a
         x+dIKPzqildCy95rCfephtfHwFG30JjYk1cBTSnl/yQkG54rhoErzjXWSS8KJyoElhCg
         z6VWR7QkIYlZe1m03oN7nlMRFc3lu3h/WEdAVf7/HH567GbgGMz3NW98cwl1aphmr+NR
         J72JqBPQFfQa3BXk8xL4iIDX8FAb1rq49M3EiBMKmQc0IV5W9rFpGoM303fjSBKPZAIm
         P0bg==
X-Gm-Message-State: AOJu0YxZLhCpNvbMkPrv68JcCP1w7WMtqn8t1354mnA+fxP2CBVLoZtJ
	fv6TMirmjKWhXL/Custau5FBoEq28ZsgH8ShHfp1JUt9ew8MqAsB9OFEFEImF8bW6IqJaS7q0Ys
	DGJSegqeFvy8O3a+v2R15VfjxfDYm6nDLUOXqKsztJAP1yRgw90vwV9DhPoXGNUSm7u7qYdOHLf
	wMD9ah5CIkKIMVADl/JEgoeY/MfUkS4dYdNI1UBqM7EWPhPHMW
X-Received: from pghq13.prod.google.com ([2002:a63:e20d:0:b0:c89:2a8b:ceb1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1811:b0:36a:4074:9aa6
 with SMTP id 98e67ed59e1d1-37dfa1bc635mr3987840a91.6.1782430214316; Thu, 25
 Jun 2026 16:30:14 -0700 (PDT)
Date: Thu, 25 Jun 2026 16:30:13 -0700
In-Reply-To: <20260625224325.BE8ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260625223623.3376478-1-seanjc@google.com> <20260625223623.3376478-6-seanjc@google.com>
 <20260625224325.BE8ED1F000E9@smtp.kernel.org>
Message-ID: <aj26BTEWjOs7D1kB@google.com>
Subject: Re: [PATCH v3 05/10] KVM: x86/xen: Consolidate checks on Xen vCPU ID
 for singleshot timer hypercalls
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 25, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> > --- a/arch/x86/kvm/xen.c
> > +++ b/arch/x86/kvm/xen.c
> > @@ -1614,13 +1614,13 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_vcpu *vcpu, bool longmode, int cmd,
> >  	if (vcpu->arch.xen.vcpu_id == XEN_VCPU_ID_INVALID)
> >  		return false;
> >  
> > +	if (vcpu->arch.xen.vcpu_id != vcpu_id) {
> > +		*r = -EINVAL;
> > +		return true;
> > +	}
> > +
> 
> [Severity: High]
> Does hoisting this check unintentionally reject cross-vCPU commands that should
> be delegated to userspace?

Gah, I misread the "default" case.
