Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EC446043
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785332075; cv=none; b=bklRwCP1Rv4K/d450iT0+rwWUVYSjwsToFkGD4AhKv9ZlKvUsw5dMox0E2dIyw/rVdhdjQ24o33qnR3wjsEY2M7qGTpyRCjBxwf00Qx4g8nZRKaOCM6Wv0iS24oX3IjMgCxXgFaSDOqBXmcOVIN71rO71dGnyvbKUvoInZWpWkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785332075; c=relaxed/simple;
	bh=th4hZKzg+ZvNX3vxWSicPLBYvZeuXaCwq1TOAX6BJ/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jo0ekVaJODk/GFUx5Lqz8+J2m6q8fHWxQuH5OcFknQK7X+E1RY19rjOncPsaZrK9TW/IqwxXFykJH04Ja8FgMbukR+i0cpeHzHF3qIEOQY4WKV0IxRbpVW06G1XF3xHSb/5yxV1JOZr/oqefAZT6wLtidd/bsduuyGihA28WC9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZLFavXb4; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZLFavXb4"
X-Gm-Message-State: AOJu0Yy64KG6ZH3giY913I7Hcq16TBntu30anynUm2UTuW63S3HUobg4
	2H/g5WLZ3ihq0zCCeaSe0z5FZK2dFS9A3EXWmuV5RtsTiOxbTob9HajI4WH9Cm1h3TSPLizVNgc
	d7M/OZe45A0xo6y+xCrT1uUIVXQYHaG7IoINlkfCc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785332064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNw0oLXC06WVAdDTxys3cThOgITa6WTIg6WIyFuBM4E=;
	b=ZLFavXb4tfJ3A57zhfLVtqrGvyVs1t+5t+QqHVP8BE5AmLWwXeqBq2BRy2+DNTfle6rsD5
	EJV2DobINN0nUmHLxYbDDeIKRxN6wiRY9BMT+Eusw+5GXef/o5obdkTScUdH1LuK9p4vpb
	6mFDp05+1qfH6bmNzSwBG3HjOwLNe+s=
X-Received: by 2002:a05:622a:5597:b0:528:3186:5799 with SMTP id
 d75a77b69052e-52b2b3daf85mr11629451cf.10.1785332056716; Wed, 29 Jul 2026
 06:34:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729131823.2021516-1-fuad.tabba@linux.dev>
 <20260729131823.2021516-5-fuad.tabba@linux.dev> <20260729133136.50EFA1F00A3D@smtp.kernel.org>
In-Reply-To: <20260729133136.50EFA1F00A3D@smtp.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 14:33:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw8zvPuMMefpGCMFnDRNawVkc_+XdW8pDxj40g=AFQ_sg@mail.gmail.com>
X-Gm-Features: AUfX_mxLLmBZkNGVYqvd3CLjf6J6a3kAMI39-B55sRILmCBhxKw48HHM8UmVVDM
Message-ID: <CA+EHjTw8zvPuMMefpGCMFnDRNawVkc_+XdW8pDxj40g=AFQ_sg@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] KVM: arm64: Move PSCI helper functions to a shared header
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Wed, 29 Jul 2026 at 14:31, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Missing header dependencies in include/kvm/arm_psci.h

nope:

https://lore.kernel.org/all/CA+EHjTwpB2fmoYGfkP5RVZcB4sgbVPQ0=3DQR5dyUJnpQ_=
VQa+pA@mail.gmail.com/

/fuad

> --
>
> --- Patch [4]: [PATCH v7 4/8] KVM: arm64: Move PSCI helper functions to a=
 shared header ---
> commit 4d648c3ac7ab8549b7dcf7d52de4756db87e329c
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
> KVM: arm64: Move PSCI helper functions to a shared header
>
> This commit moves several PSCI helper functions from psci.c to the shared
> include/kvm/arm_psci.h header. This makes them available for upcoming
> protected-guest PSCI calls at EL2.
>
> > diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> > index cbaec804eb839..f86a006d67136 100644
> > --- a/include/kvm/arm_psci.h
> > +++ b/include/kvm/arm_psci.h
>
> [ ... ]
>
> > +/* Narrow the PSCI register arguments (r1 to r3) to 32 bits. */
> > +static inline void kvm_psci_narrow_to_32bit(struct kvm_vcpu *vcpu)
> > +{
> > +     int i;
> > +
> > +     /*
> > +      * Zero the input registers' upper 32 bits. They will be fully
> > +      * zeroed on exit, so we're fine changing them in place.
> > +      */
> > +     for (i =3D 1; i < 4; i++)
> > +             vcpu_set_reg(vcpu, i, lower_32_bits(vcpu_get_reg(vcpu, i)=
));
> > +}
>
> [Severity: Low]
> Does this header need to include additional dependencies to remain
> self-contained?
>
> This inline function uses vcpu_set_reg() and vcpu_get_reg(), which are de=
fined
> in <asm/kvm_emulate.h>, as well as lower_32_bits() from <linux/wordpart.h=
>.
> If a new C file includes <kvm/arm_psci.h> without first including those
> dependencies, it looks like it could trigger a build failure.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729131823.20=
21516-1-fuad.tabba@linux.dev?part=3D4
