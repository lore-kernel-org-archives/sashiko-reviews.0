Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193555349B7
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087677; cv=pass; b=LOphkYDStplAkqUqxM5H+DR1bG83m4DOlUfQ1A51r8IEPHbAPetqHHELqsqmb0AbAwjQLryUVq2m2vxfkLbf77yDxVBw38jhWUkSfjnLK3QktxqSlhJolqq0hAYFQtRKrQex0KjKndixBltyaLvEKl2LABHvr0uUjYecfYK3GZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087677; c=relaxed/simple;
	bh=Cq7RZHzjEhO7/GK7BwfTmITx4s5PfiqDYhtEgS/Go2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3BKH92u8HvpVUbv++HweQ1y2bGGqdLnNP/MrDu3Kp5MA2oghYN6x9ZFqkO9ADnoG4wY0WT5vrqbun5mbVjMv4dMKn3kuXxuvQmloayrxlx9AZZhwQefHKvHSiTiITUa/a/BJVviM+ogR/ZcvAAl2S9G97YVbErd6bz9mdPNoYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dCc8TaYM; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dCc8TaYM"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-532e9ad9a1eso18251cf.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 07:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087675; cv=none;
        d=google.com; s=arc-20260327;
        b=Br42HjdEi4jljtsW8BzvEQciQnWcWBLHcch/TVbnzhCQFix5jHnRkethQl5gTy/g7q
         qmAp0vXBd/S52a0ruYE/n1wnQkD6PD0Xv7mLcTa0+sfS6YygE1HlYgcPOR23mRJc1TEu
         bG+iCOe6UlPurs/nhaLsAGJ/m4uvYHh4Xrd0H60HWjpbYgrqT0gTHY9b6XmXa/Ym2yaM
         YM9DCjAKl33lBjpURA6qocq8t75Trv9DjFs8hBnqcGm25PSctHi3rN+4XkvKSoeo9Cl7
         uLlbd5sngsYifH2W+99HjQ0ZWm6N7oovUR3Of2ucu3ySXUiLdiLgRCe02mpTnEfGDkCa
         L8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DExhxA44NC9dc+8kUBRuzxjVL7paFNIoFs9ji4voJt0=;
        fh=9lL0hF0NMGethsOlsxoDeLBT8jtu7UHbhiekQ8TuZEc=;
        b=IRaVXNV3E9E2G+zW3eMt677bKKtb2ReYAkHeg1TGJ6BbrUMttHJblVlaTQqXP9yMkG
         58TUfWB+o7wmeqm/Vyjq87/glISUUy81+sIu1WOvEr8e5o7sBMVYXtHvJyhMfW2Wp/Fh
         RaDzTWhjVXnQ0mdSRqpsou5MOjmr31FIXHkSXVnNNtmegnP8DobCERRLQO/zG91MjI8+
         O3d4A6xWrfh7P8BTia0h18Yt94DnRuW8PyxGm57vQ/SQ459YKz3iPWdn0aKHHpBO7mhh
         BqKEWWaIzdez+09N1Z9opw9rVkncwNTf0AVRFFU7C8SHSqqoRr1OJEZ6EPp/jr4EFbZa
         pSug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790087675; x=1790692475; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DExhxA44NC9dc+8kUBRuzxjVL7paFNIoFs9ji4voJt0=;
        b=dCc8TaYMxSnLMzEsq2UD19O61NOlvRAAgG2cqlrhe69244ieT/KYBN9RemVfCIKv9+
         BF4mWVIDBG2HwdMdEUqKlS/sBFkFC2bwa0cqW7KeJ+qUcCU7KLRj78+XcqOnjGi4/PZ6
         Vww4tLkkK3q2Qk53pUtcv35yO9UvtpEeLmQ2TahpcWZiiZQCVKR1+FWXdcjSccTZav5c
         E7NiR2B79iDe9eVL/lw9P4/O03Xi1vzmnnRFqdYsRZSaANDWN7CQkXZpreLJxaKmJHbi
         yMagwVNTbJNALKJ/24hsVFw5xyzYQqqNoI2DAkp+D0z2QJ8fR3/wvxiWI3PDKproWU6W
         CrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087675; x=1790692475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DExhxA44NC9dc+8kUBRuzxjVL7paFNIoFs9ji4voJt0=;
        b=AARDIAmpZn5o3NjbhVkOkkPypp+z9FXpgq2VK76pxS2bALT2wQUl7DKB+WYrBFReID
         NyF59og6IJGfcp3/3tnntWJRmCvyzyNrUb8NI5vKlREbD35DXNmFzTLOfamEvzzIidh5
         +HpYaAB5c7mqBDP1tnjgo1tZmBvplVWzdsNMpZseT6zSa5DBYf26HOXabcg5yrSbZWj5
         1+iCxIPXFSMRLng08GdrXbsENWkZ1UIoJMxOfM9aNbSuIZNf7GujCyV6m5VvCTgnp46T
         0CyOdj7cuW/F3LiVF6o6HbqPexSwVZI1tfhYrJMm2a08Zf6YqTTMFn8hcSnxUKSLavFl
         4Wrg==
X-Gm-Message-State: AFuF++nFBIFvCxOjwxzi3XUz3hH7i+2yB52/l0f119wCunJZWy9jQvOy
	TCwMypPsG1zzLfIvhsr0tcbZ3+KaBQwzsTQKwnKDcd+Vv/+xhE/QjNGI+2PlJIK/pTGpSEAdpA0
	1A93Kgu9jMv8N+dFPOyHYYvTD4MLR9BvZuoFnO/KN
X-Gm-Gg: AYBFou0MsVsjI2g3Eq4f0q+kv3ePn8n94KxQtm6A5sitZ9Dd4LgncXkzMEWNYamy/Wg
	WYt4C2nn5LhnoKWcy147EPjq7zl1b/PYoAbA4PItb8helWBA0mA/FcVBmrzjBfEiVznNCUn/ovn
	CFJYuwjFlA6n5vatYlAv0rRQYPSpF/DNKzZscKyztcLzcb4ftWOWujwC20wnU7M3Iyc1/1KJ0Ey
	4Xcp8vP6015U91eIVKlqjbDLbZ0K9u4MRfHkjqPsvgic5AMlf8OtQjCsJPue/+mzoGEd4SnMyLx
	PM1zKYho8ERkejACMWh0Huj0Mr4sgMxAbe4Mr0DeYHXU+IeybLn6V/U=
X-Received: by 2002:a05:622a:1487:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-532e861cb49mr1554881cf.11.1790087674052; Tue, 22 Sep 2026
 07:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918154530.4129698-1-jmattson@google.com> <20260918160109.E76B81F000FF@smtp.kernel.org>
 <arKJQwAPvApkeESD@google.com> <CALMp9eQboC6DTQfa3N58XCfOLf-qwJ2L7dC5vtqDerHG80eZLg@mail.gmail.com>
 <arKQJJJB8HMK0B1G@google.com>
In-Reply-To: <arKQJJJB8HMK0B1G@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 22 Sep 2026 07:34:19 -0700
X-Gm-Features: AcwNN1VJWL6isQaEKZnB01QFvujmP7sTdhriqRJAFl1aOntJ7hkFaVL8gFh26pE
Message-ID: <CALMp9eQi0gm7ojijfKDZz9oZh+BK13qUkJOFrCmxjJTr5sx3Lg@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported
 is set in guest CPUID
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 7:26=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Tue, Sep 22, 2026, Jim Mattson wrote:
> > On Tue, Sep 22, 2026 at 6:57=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > > Gah, I hate the negative "feature" bits, I've gotten completely turne=
d around
> > > multiple times trying to sort through this.
> >
> > Me too!
> >
> > > IIUC, you're trying to "fix" setups where host CPUID.EFER_LMSLE_MBZ=
=3D0, but userspace
> > > configured guest CPUID.EFER_LMSLE_MBZ=3D1?  If so, then Sashiko is ri=
ght, it needs to
> > > be declared with EMULATED_F().  I would even argue that technically t=
his isn't a KVM
> > > bug, because KVM won't advertise EFER_LMSLE_MBZ in KVM_GET_SUPPORTED_=
CPUID on such
> > > hosts.
> >
> > I'm trying to make it possible to run a Rome vCPU on Milan or later.
> >
> > SInce this is a negative feature bit, it must be retained if the host
> > reports it. That blocks running a Rome vCPU on Milan or later.
> > However, a defeatured Rome (which reports LMSLE_MBZ as 1) can be run
>
> So, a partially defeatured Rome?  Because it sounds like the CPU reports =
LMSLE_MBZ=3D1,
> but then still allows setting EFER.LMSLE=3D1?

No; it should not allow setting EFER.LMSLE=3D1. That will fail on later
platforms and would block live migration from Rome to later platforms.

I want KVM to abide by the guest CPUID bit and disallow setting
EFER.LMSLE even on hardware that allows it.
