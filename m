Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C598C13D53C
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786406680; cv=none; b=GZ9HSYbssTPQPNQGsLVs7HfuHV2RokE/ojVM81Y0pJ5z//kqMGd34DMSAaOEhQxFbcUrWBV1dbkhtgUZuwVdGD6eyioQgBwt89sSwpVIc+2BHc9FxF9L0Atd9CnpXFok3qKfT26FzgcXZtxo9fvXapzvjipNjnPInVS7KuaWy2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786406680; c=relaxed/simple;
	bh=HJBF+TSSzQd86uwj6B1uJ2YU+Qpc/TVCzBSZ0dPrIdw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bRZE5pjoaXm/Hwt2P/8izuBj6EXia70FbwJ0FLQPVprObDUAp6dNNFDctxXyNUdQIKXJIFi2qb2rymE5GP0k7rwwCx3JW01+4yi6wSzbMNImW387LkBIHjq84Qll9O47MkPdktL8jTz7Z9sP/+/NAX1p8mqYP5mF79KzUQ2Yeg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=co6EprUE; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="co6EprUE"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so73547935ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 17:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786406677; x=1787011477; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWP8fni2Pj7QL+D72A3UzmdRtAr58m5dr4TKd83QRDo=;
        b=co6EprUErS8G0AyARk2LiEevN57g3dMmmaUzBhUwlCo+ppV7v0zmhixqYFMslR0UPt
         bJeD1snmwYpdaReWnrJlo2QlDX6J/XLmR/0SXoyTCb/fPUGgN6gcvXgH/7xF0mHJv92i
         5K8tqo08fx8bydsDYE5csTGh5wjL1D2tT9Z6Zx+dpbrp6MTzxqfJpzaHMZvF8fkGdmZs
         Xt2EI4b8zKpKmO6o7ZnIDpXxxMOT4uWd1w3jIk3/6J8tXs1wF+QSokgcBlzVSgqv+Rz7
         thdrbFTZOatwpczaa41oReVKr5uYwL7p/8D6lm8ibf6xEXSKbNjZib/9Mp88lRcD4JL8
         3xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786406677; x=1787011477;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWP8fni2Pj7QL+D72A3UzmdRtAr58m5dr4TKd83QRDo=;
        b=n1UXgx0AbSCya37NDmLYFf/Y2DSwQyb+0/Z7qW7x2C/eiRyjh6CWftPcwuVYXZIOIo
         YDaHdk8kEqXdedpEsPyAeWa4CIwiW8NvYWgXiT8DJZTNyAaud/9kmydkh+fEQUIqruNX
         nQKeU6nYjn34a6dtRbetBrl+FDHIlrsX+lDh2zSID5rjyt1Q7ZrpnOg/l5+a+KkW45Nv
         3V25ge86jFzuCMqJ7TB0jltxnbthEMWa67+cwCl8FGkhz0kqKMLbIrOUqV4at9uWh4n1
         sZC2NCm6B0kXbqNLDOk7eF55ax6EYfhdg1x/sMjlxm7Hk8Pz46iWulF50FEgU8DXC4b1
         PxBQ==
X-Gm-Message-State: AOJu0YxzZDsx8q7vGzu4F0HH6viR6u5UQ3yDsMKYTErKuWcKg7H0XJM2
	bCjCTR2tD8JYgJCKz0w1od1Xs/UPBHzoHODYGAEQ0yhdfOnKBx/qurGKZwCaxJm3pKcC4uZze2o
	3kmDJIA==
X-Received: from plcb3.prod.google.com ([2002:a17:902:d303:b0:2ce:d2e2:393])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b26:b0:2cf:ccc2:6088
 with SMTP id d9443c01a7336-2d294b29193mr358218035ad.4.1786406677170; Mon, 10
 Aug 2026 17:04:37 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:04:36 -0700
In-Reply-To: <anplcWfYReCMeu1A@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810112200.2326727-1-xiaoyao.li@intel.com>
 <20260810112200.2326727-3-xiaoyao.li@intel.com> <20260810113924.4ACBE1F000E9@smtp.kernel.org>
 <13ea6279-a342-493b-a0f8-15ac5b4c59ad@intel.com> <anplcWfYReCMeu1A@google.com>
Message-ID: <anpnFAK6EZToizbZ@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 10, 2026, Sean Christopherson wrote:
> On Mon, Aug 10, 2026, Xiaoyao Li wrote:
> > On 8/10/2026 7:39 PM, sashiko-bot@kernel.org wrote:
> > > > @@ -2147,7 +2156,7 @@ void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
> > > >   	struct vcpu_tdx *tdx = to_tdx(vcpu);
> > > >   	*reason = tdx->vt.exit_reason.full;
> > > > -	if (*reason != -1u) {
> > > > +	if (tdx->vt.exit_reason.basic != -1) {
> > > [Severity: Medium]
> > > Will this check always evaluate to true due to C integer promotion rules?
> > > 
> > > The basic field in union vmx_exit_reason is a 16-bit unsigned bitfield. When
> > > comparing it to -1, the unsigned 16-bit value is promoted to a signed 32-bit
> > > integer. If the value was set to -1 (65535), the comparison evaluates as
> > > 65535 != -1, which is always true.
> > > 
> > 
> > Well, how about something below on top of this patch?
> 
> No, we need to not rely on magic exit_reason.basic values.  Can't this be?
> 
> 	if ((tdx->vp_enter_ret & TDX_SW_ERROR) != TDX_SW_ERROR) {

This would arguably be a bug fix as well, because the "real" EXIT_REASON_EPT_MISCONFIG
path gets a false negative.  E.g. when getting information for an EPT Misconfig
for the tracepoint, KVM really should print all information, not zeros.

At a glance, this exact change can probably be a separate patch too.

> 		<read values>
> 	} else {
> 		<zero values>
> 	}
> 
> We'd need to use the unsafe version if we go with my suggestion[*], but other
> than that wrinkle, the above seems like the obviously correct fix (maybe too
> obvious)?
> 
> [*] https://lore.kernel.org/all/anXxBzO41_5eaaOI@google.com
