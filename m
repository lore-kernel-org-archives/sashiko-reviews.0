Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C9F175A6B
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978904; cv=none; b=KP/0BFfh3Ij4YDsbbBWoW/+1fjgKS1jF44rNqMbCIg8v9ciUwaxE9LCpe1rpdwraT5CgOl4Fvg7qhLXfUl5d7XcM1267YtudUiRI/KgOc7idmGjWGzOdvfYPaAHXcG1Czw5mGm1iUDzVrOsiqF58Td0W9IaTcYq9OjsN2TOGVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978904; c=relaxed/simple;
	bh=4YIjTjZ7aI7k4GD9TxkXUehhYodZrAGMTkj5zCQlt/Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ecMOQrAhIdjPIE4DKw46qCKv1uWopr0NexJlFtC9JPBw3vCXC5+GIII6UmkfpfrWxvmsbnjcUdTRnG9agMv0bDKMvtm0o4juPQySpFEl+g2xj86FnfKQbpu5qplCd1BHp77TZ3iIcuT2AyDoEenZ+bzy5j/j7kABy4mb7YKVxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JnDM6YD/; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JnDM6YD/"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b10so4361585a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786978902; x=1787583702; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+lSPZatQ3pM/vR8/ZQqW9J7GM0TSAbsGGNfZFJXeYU=;
        b=JnDM6YD/pGGhCBKBm6JWUiro6/6dkp9C6nGpod7pWCbm+Xv7L+wN1pX4jjP3N8gCPp
         vyrnJeh5dkzAw//MLwuLEJHryLKVq/yY7h2R5vfML0NvP3I3OWdnKSgOtGiANN/0KG3x
         +wjRZltkTjmh3C/18GsY4aBXPBxgw4txNtb78GbCBkhicM3QOxyuvJbas1GD4Wfap8AC
         f6sJ/8eKKmBOrATJLotwcs22R8IH2CLPY5fAMqRGclev2gea6Ykt0dTOisRrgf/j5JOK
         7VghkWGV8fxq9YDb27uIS/9/zch2vDPtaQ5E7/ws6IuD6N6CPz2smKTgDurL0PVrlHQg
         zYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786978902; x=1787583702;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+lSPZatQ3pM/vR8/ZQqW9J7GM0TSAbsGGNfZFJXeYU=;
        b=YS9VJiJwfKo9LwVxbFnPUj6d8VSyuYCjfRo2slBtV+55XTOydS0bCdOYt6/c9v0nRt
         dZNTe7S6jLTkVVUoAczgg7ppF/py4W/IN9Kko1K2HTlLdgNhwpthhnXwuItI7PTtZdfI
         KS0U0sfJEOxD7jLMLFdXf6ctCXIgxw4PBTZANh1guK0W7T9jXcaX9hX9t+n2x33O1zw4
         OEinBSnPicEVmpYe136LBiVnjTLEcC/olYSAX6ZmnpyTbXcZaYh5ssBD54kyXJ5G/WxL
         NCzXS3HoumfWc8lYyqFFqEwYeW/8/aClqP9k4Rty6hCCZBNXxSiDyoncafw9SJq93LuH
         DPpA==
X-Gm-Message-State: AOJu0YwMmloeScYAno327hW/HR+2ObayR1Ja+B4HzRsulFVbLS0ztDq5
	k0YNmdg/G+Phs+ITVGC4drn8ZKYLeROy7RhcQL5WLZm47+LzBuhPGVr2YrKU+ETXkMT7M89NWyK
	t0Fyetw==
X-Received: from pgdu9.prod.google.com ([2002:a05:6a02:2f49:b0:cb2:563f:d136])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:700d:b0:3c4:46ca:334b
 with SMTP id adf61e73a8af0-3cc71ca238dmr29637511637.9.1786978901823; Mon, 17
 Aug 2026 08:01:41 -0700 (PDT)
Date: Mon, 17 Aug 2026 08:01:41 -0700
In-Reply-To: <901ee69d-9bd6-45fa-ae0f-0df35d80b94f@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814161129.2177118-1-seanjc@google.com> <20260814161129.2177118-4-seanjc@google.com>
 <20260814161950.136041F000E9@smtp.kernel.org> <an9KM3Ye-GX7WggF@google.com> <901ee69d-9bd6-45fa-ae0f-0df35d80b94f@intel.com>
Message-ID: <aoMiVYebMpxPwg3d@google.com>
Subject: Re: [PATCH 3/3] KVM: VMX: Rename posted interrupt prefixes from "vmx"
 to "vt"
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 17, 2026, Xiaoyao Li wrote:
> On 8/15/2026 1:02 AM, Sean Christopherson wrote:
> > On Fri, Aug 14, 2026,sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > > - [Low] The function `vmx_needs_pi_wakeup()` was not renamed to `vt_needs_pi_wakeup()`.
> > > - [Low] The shared inline API `__vmx_deliver_posted_interrupt()` was not renamed to `__vt_deliver_posted_interrupt()`.
> > > - [Low] A comment inside `vt_can_use_vtd_pi()` references the old `vmx_pi_start_bypass()` function name.
> > > --
> > I also missed vmx_handle_nmi() and __vmx_handle_ept_violation().
> 
> So for TDX VMDoS series, I need to rename __vmx_handle_notify() to
> vt_handle_notify() and extract handle_bus_lock_vmexit() from vmx.c to main.c
> as vt_handle_bus_lock_vmexit() or just inline function in common.h?

Yes please.  Though I think it probably makes sense to go with __vt_handle_notify()
to capture that it's an inner helper?  E.g. that's my plan for
__vt_handle_ept_violation().

Regardling handle_bus_lock_vmexit(), put it in main.c.  to_vt() currently lives
in vmx.h, which means it's impossible to inline vt_handle_bus_lock_vmexit() in
common.h because it can't get from "struct kvm_vcpu *vcpu" to "struct vcpu_vt *vt"
to update exit_reason.bus_lock_detected.

v2 of this series will address that (I coded everything up and tested it all last
week, just need to post it), but (a) juggling those dependencies isn't your
responsibility and (b) we don't want to take a dependency on the cleanups for a
fix that is destined for stable@.

Then I'll do one of three things: post a new version of this series to move
vt_handle_bus_lock_vmexit() to common.h, post a standalone patch to do the same,
or simply leave it in main.c (it's going to require a non-inline implementation
for at VMX since it's wired up to a function table, and it should be a rare path
so inlining for performance reasons is a non-goal).

Thanks!
