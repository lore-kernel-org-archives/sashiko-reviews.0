Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED233CAA51
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104142; cv=none; b=Q56/sOqVR1PpVhEJ88hbwJ8gW/j+NQQwHAQwt/mbSTfM3BUw8LgpNrbgJ7vXDlk6qahel/T4rLwSIBlfUY8G0Nmgw8WKAINXooHerDAvEe93Z6ujFzu5mEEyA2pFSrZUKp+3XAe2W3RvpTjyD2Km+ffqxRLvzicWZ5SLK2R4o7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104142; c=relaxed/simple;
	bh=SxjpvUuhid5kie/ZpflUJ3Lsjarwt3I+5gwMxF8Ot5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkS/0fwal4ypJ2xtVLB4dM+jr5K3a7uDt72hzg1TwngCEasjxndgxONu3aLsHfRo3BoX+2Umva5tkM5mnKH0LrYBb9Ln9LMlU/FUU80dOdhdOu63cWRyl6RcBPDCYPeeQcMaRgfgOuMmtE4uNV80ZmIG01v3lqjkyX3pEH8epmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=abJD6caV; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="abJD6caV"
X-Gm-Message-State: AOJu0YzH0RA7st4Y9AxNws2zje7A7rirHju/LcDRUrsBb59GJVIT3t1S
	CboULw9yjo1pwCgpSnhLhuWpd2QYzX99YXMRX5/j9Igi+T9R67DXKwAtHeSG0gVbWy9ixSYOQKY
	gB64/84f7eC6BdzlqAX6dLOaNiM4OaljiLz3xj8l1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784104138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxjpvUuhid5kie/ZpflUJ3Lsjarwt3I+5gwMxF8Ot5Y=;
	b=abJD6caVGrMgcJKsGqw+WJw2+eFkJhCne7GV50M+iVqxVOyofHxbqbmytAw08c6Tn4VBdI
	+MUijdIiSxYCJz3GHSYmlWm5D5BHIlSwmbhWHO7LjaPWA146iZcOjyzgBh+Ndo4/HPUsqU
	maV5vaRHNs/JaK5teLwfBOQbPxlB2Aw=
X-Received: by 2002:a05:622a:3:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-51d71546a03mr22843281cf.4.1784104128893; Wed, 15 Jul 2026
 01:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715081238.1891918-1-fuad.tabba@linux.dev>
 <20260715081238.1891918-5-fuad.tabba@linux.dev> <20260715082411.3987F1F000E9@smtp.kernel.org>
In-Reply-To: <20260715082411.3987F1F000E9@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 15 Jul 2026 09:28:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwhjztjg7HTEMxuaY2-fUD0=YGKZ6uXwuUEKVhhQz6LXg@mail.gmail.com>
X-Gm-Features: AUfX_my7Hs3EP1N_PoMndc7TswMQav2np4-KYQOT-BjqulCM0MbSrtOxFp29ZgY
Message-ID: <CA+EHjTwhjztjg7HTEMxuaY2-fUD0=YGKZ6uXwuUEKVhhQz6LXg@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] KVM: arm64: Move PSCI helper functions to a shared header
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Wed, 15 Jul 2026 at 09:24, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The header `include/kvm/arm_psci.h` is not self-contained because=
 it uses `vcpu_set_reg()` and `vcpu_get_reg()` without including `<asm/kvm_=
emulate.h>`.

https://lore.kernel.org/all/CA+EHjTwpB2fmoYGfkP5RVZcB4sgbVPQ0=3DQR5dyUJnpQ_=
VQa+pA@mail.gmail.com/

/fuad

> --
>
> --- Patch [4]: [PATCH v6 4/8] KVM: arm64: Move PSCI helper functions to a=
 shared header ---
> (Note: The format of this report has been altered to a free-form summary =
without direct patch quotation due to automated system recitation restricti=
ons.)
>
> commit 41ab99d154503d49e14931a3e9bb6c067e760b44
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: Move PSCI helper functions to a shared header
>
> This patch moves several PSCI helper functions out of psci.c and into the
> shared include/kvm/arm_psci.h header. It renames the file-local
> psci_affinity_mask() to kvm_psci_affinity_mask() to support follow-up wor=
k
> for protected-guest PSCI calls.
>
> [Severity: Low]
> In the newly moved kvm_psci_narrow_to_32bit() function within
> include/kvm/arm_psci.h, the code makes use of vcpu_set_reg() and
> vcpu_get_reg(). Does this new header location need an explicit include
> for asm/kvm_emulate.h to ensure it remains self-contained?
>
> If a C file includes kvm/arm_psci.h without having already included
> asm/kvm_emulate.h, it looks like it might lead to a build failure due to
> missing function declarations.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715081238.18=
91918-1-fuad.tabba@linux.dev?part=3D4
