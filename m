Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B257947884C
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943075; cv=none; b=UKiCUyL9Jn7xd+3GTLPPz4RecGaw6A6uGczryl32Cf1OtZ0tmph9FjvKf0NZ0Og0NGf9ZwIwBoPHSYhjaK559gOMWZ53reMtXlRjHHz/f+ZCnmK2vlTL2kgjcvH/cw3agJjiXfzYlYMR7dCDsx/e+p222mnGcXZUumPt56Dirww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943075; c=relaxed/simple;
	bh=S3Z3rnyOq7JZQ53Rdv4tbQRYk3CanTRKPf6nPJmbOXE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M+7KqhrVhjrj0qOnzbRCFDg5xlRrcy4ubHHPbIGJhlSIRkJiGPAvgGOfUZtwPZ4UBNpKMLj+GBt58c91iPYHYD5Zqp5G+gBTiGuaO/B9v4CP4t8vZU5+61nCSep9acIvPo94vsq2gSU9AhBSIKzwfeXlMEHuMQZyc3d3hv2SF6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sFSxAi5+; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sFSxAi5+"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485d853b08so1921032b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785943073; x=1786547873; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g3YZ5iTtFS4MrvF1HOSKp5JT5qkAOW11RqUF8i4nnDI=;
        b=sFSxAi5+uUBXMwFXoNipRcG1NK8mUmNuvfvsdI8H5WFhZUuOkcSwcj0GLFCZCVww2l
         5cuyOCoad5St773A8XDpEZm0f4KYrWw2PROkawacEZ6iQoA68+WwEBMHVVZ1sjD0YJpV
         zrGEEGV+6z9xLr3tqaV6tSIBY3IROmPtJzZR8i44wUFKxNvBekOLrrw7HVfvkJzrVxUw
         w/m3siAdYRytSsoUiRI7u+PMmJIkwpPTFMnrbyhKVz0kyi/4uM35SI055K/nVRV3LyBg
         pNlGurhqn1VUsD/trO6c2/zJ5XVWzBBs4CHoGyIRP45bd+3nSNmL6H/yn/e0YUfTkZWZ
         +kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785943073; x=1786547873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3YZ5iTtFS4MrvF1HOSKp5JT5qkAOW11RqUF8i4nnDI=;
        b=IEGQqMexTDtMG2qytu4C5/S/ZQJxFVRzDHu6JqqvrXuSGZXxAJT5OcvFIZXgj/TQIl
         vyTjODzfPUfmTcuApivarm8d2JAOTj6FIbm/Fa0Ku6ZXcdcJbPviGvtvPz4YCo94znGl
         lG/AS4O89L0K19caHxokk9gK4KU7djdDdp+iegunmPMpe/ll90ZpGnfuh81wK9rBZUDE
         GWuOniNexVbnWG46NvOvP5K0P9nqHbCiUBJpEqYq9JBgSTSFkumOlvP7NcDoqmlqHt3X
         ID/HvxVDk0qWb7tQ2nW7irtz+OTXo2PXMvk3rAT1PLNDggL4yIouolJnfZWSjqUwXtzp
         dpaQ==
X-Gm-Message-State: AOJu0YztFcKMCLfM+xKWrAyGxTuFckf7CoyvO/64MCieNBrNmWjB+cD+
	ULDKqfr6R43RCoUqns4kpeWW6E8t6nhFT0X9FKB0OQykFg4k+N6arigW6hSXGWRXZjDG+A48Ht3
	SstYnfiUUC7sYRFtPqkgCAerqan2AYriyOWFXz2PMs3B7p3OJiLmyBSK2n9gJeDG2R2uNyALDXv
	xRGL1pbHcub4QVGD9kvxtwXn7p9mqoAmY7whKZwikZqJI3tSt2
X-Received: from pgj4.prod.google.com ([2002:a63:904:0:b0:c8b:19f4:6228])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3928:b0:84e:d5e6:a085
 with SMTP id d2e1a72fcca58-84f2de7e930mr6860423b3a.0.1785943072271; Wed, 05
 Aug 2026 08:17:52 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:17:51 -0700
In-Reply-To: <20260804235204.559041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260804233923.3504629-1-seanjc@google.com> <20260804233923.3504629-8-seanjc@google.com>
 <20260804235204.559041F00A3A@smtp.kernel.org>
Message-ID: <anNUHwk5JvUik6Ra@google.com>
Subject: Re: [PATCH v8 07/17] KVM: x86: Move "no master clock" fallback from
 __get_kvmclock() to get_kvmclock()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 04, 2026, sashiko-bot@kernel.org wrote:
> commit cb25993776f1881f5ff66de261984bd8992ceece
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: x86: Move "no master clock" fallback from __get_kvmclock() to get_kvmclock()
> 
> This commit refactors the kvmclock retrieval logic by extracting the master
> clock fallback out of the inner helper and changing it to return a boolean.
> 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index b520928579129..7366d4602f89f 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> 
> [ ... ]
> 
> > @@ -1667,8 +1673,6 @@ static void __get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
> >  				   &hv_clock.tsc_shift,
> >  				   &hv_clock.tsc_to_system_mul);
> >  		data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
> > -	} else {
> > -		data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
> >  	}
> >  }
> 
> [Severity: High]
> Does this function need to return true on the success path?

Doh, yes.  I botched the splitting and incorrectly added the "return true" in
"KVM: x86: Wrap all of __get_kvmclock_master_clock() with CONFIG_X86_64=y".  I'll
fix, and properly compile test all patches (I did that before splitting the patch,
but obviously not after).
