Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7348AE17
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726966; cv=none; b=XbhLZqH+7kwsdmgEADLFdbySYfXD0H/fHmQ2QSk+sPvafpPfEtIxMOCA62ckXOZPLBGv9rs+aPdFZoYVDUADG7NvpnT/NZaSE+1tsA391jagxyNRpkso08MkHA7EBhaA5VL/0+q7yNjg4zb14KfmBstYGR/PHXFCgBupJcans6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726966; c=relaxed/simple;
	bh=JoZqmxpuuPNKAmYYoCdlkybFxzPOn0hNPVsF9oZo2WY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jOOFKjR6tKysNqFymM1hkeg9pubWTifwur6xYKrsH5X6V94cwA/K45VxZURoY9W2PovNJMVyusexXbuCCNG/8u5s8Oiz50lpuTi2m1bgaQknZ11EhNePERdZnedzcZodeHGqgY/OYhJmuN9CGPYj8pFwtfZPFI6YNmH0W0+qb7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LsqB/DMx; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LsqB/DMx"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84870e7f498so1317758b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786726965; x=1787331765; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoZqmxpuuPNKAmYYoCdlkybFxzPOn0hNPVsF9oZo2WY=;
        b=LsqB/DMxqaLjHEVBqumDlSukk1wP3FWXIioY0Gx79Bo36/WAKsm2qsDHoGZwQH75n7
         o1DeAda7wWltTeAWVo1VljGGQwnSuLs9e6irWgTkVjD++Io91K8CgLP1kWf3zd+BIufa
         kbOn+Di/cizceAD7y682v87efwlz2gcOqzAYo3Htn0leafyNh72KiNfyHpa86BG3dxGN
         fwUG5BACqqdN+y5osDcfa/VlCGkrKgVFELOf1klPJLsqxaFH0mCbH2m2WcaUrxujd3u7
         SZ4rI3dpjRiVado5LzUhTvw2PzVP3ko+DtnHYwzIG67iy66hX/GLQiK13f5AnADCa6rq
         NnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726965; x=1787331765;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoZqmxpuuPNKAmYYoCdlkybFxzPOn0hNPVsF9oZo2WY=;
        b=O+Ny5IsbvbeY4PedqLPVKIUaLBhd6EDh1rGLTXJdmKIyrxLz6zs4FEPXmxRLAugdID
         z2unV1nmSjonhfpTApTgsi4Y2VzL6XjxkKzxP5ewxxDNPeWJs7GDkyZ6rQ73ILL6Kjym
         lkU0lZUA4WNYto6HstEwhjkPDf6eaZ2zakS85hWbGYnvn4VpkzTXZO4/LRKND+k4mwaz
         jaa+78lCaKKbmLuQlNwfK8Mjw0uMVnDaBuHtDJK7tjh0IwdYALlp+zx1q4B5ryHJn790
         fYWtwJCiTKm7Dw3Vg99HajDJHdR1tvsfa0txn4TNEsmFliKG23a19FOZKo9ndN0Iovpo
         XzYg==
X-Gm-Message-State: AOJu0YznIrZX6FqUqH9380DHQoT7LLAGhT06v1RcrZmOwHY9Cxc/yNb+
	SvOqo1psgtQtW17QeP70GmuXVB4YtR8c2ll9zbVaNx0V/AwPMqEyFm+XIkG7BVuW4upJYad66V6
	4KL0SPX5xfTy2gw1TzvrR3GGf5xuf/juOBMVXKcos577w5Nh0C8qkAUAzg9Waj0LD2l4/U8gwY7
	QIi64KlZzEeTzdH/MThoykPpm/ZDzbPsawKJRsuk4vsp/1+w8H
X-Received: from pgnd14.prod.google.com ([2002:a63:734e:0:b0:c9a:b3b0:a861])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a0d:b0:3cc:1d29:f172
 with SMTP id adf61e73a8af0-3cc71fa83c4mr8041630637.22.1786726964456; Fri, 14
 Aug 2026 10:02:44 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:02:43 -0700
In-Reply-To: <20260814161950.136041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814161129.2177118-1-seanjc@google.com> <20260814161129.2177118-4-seanjc@google.com>
 <20260814161950.136041F000E9@smtp.kernel.org>
Message-ID: <an9KM3Ye-GX7WggF@google.com>
Subject: Re: [PATCH 3/3] KVM: VMX: Rename posted interrupt prefixes from "vmx"
 to "vt"
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 14, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Low] The function `vmx_needs_pi_wakeup()` was not renamed to `vt_needs_pi_wakeup()`.
> - [Low] The shared inline API `__vmx_deliver_posted_interrupt()` was not renamed to `__vt_deliver_posted_interrupt()`.
> - [Low] A comment inside `vt_can_use_vtd_pi()` references the old `vmx_pi_start_bypass()` function name.
> --

I also missed vmx_handle_nmi() and __vmx_handle_ept_violation().

I'll also add a blurb in the changelog for patch 1 to explain that keeping the
vmx_ prefix is intentional so that vt_op() doesn't require a one-line forwarder
when CONFIG_KVM_INTEL_TDX=y.
