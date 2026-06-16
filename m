Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7A3793AA
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 19:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639691; cv=pass; b=LUt6qlH0Qcy8e7B5x6ulvCB5jcJKGepL6QyhoQIazLReviVCryxPZvjbXdSWFa1f4IzVX6fYyG5qXoJ6zv6NsylH16+uE8VW6NFJsTkuh7xy8YY+8MCcgDB3elLBNRnsUWsHRhhpgI7+Qn7CXQOdR2+ONuet+ZlaKFJVJTlzq3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639691; c=relaxed/simple;
	bh=rOreL9cMPNKjQLcaTXTeQFF75y3HOUoqRBuOPg2jGxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTgywdD2GgmWuZphkss4CxrBEVUT34LpVMPDktwtx9FlSHcyGWycjMDBjPGjBI3RDqjaeNPjQKF6h5Ii2VO4LmBAJ81BZJ6dbzS30wKs1QId3X7c7N/vZ3yKueSqJ3cRzEzGkVritCQlJwYIxKNNSnhJbRyy1g8IJIGsdLLudrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hSImgKOp; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hSImgKOp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so3070a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 12:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781639688; cv=none;
        d=google.com; s=arc-20240605;
        b=jgrR3g45DMH/PkuGTZJ9rfW0EG0HOL03qL7B34coxPNALg3P6HJQU9Z4ZrE3zI6FoG
         a00qxmbGEDKwPa07v0JkkJt3tTdd76mvF2ywzs4qk3NeBJwgEwD66IwDsCywEsn8WXzx
         cG5MKdd78IiEkLXBs/WKzDAmqyR1SLjHX75OQTpy/sgOvKu6vrb+IouY6itfQMpaVH14
         k/X/tuIcbU0flXWbqkruXh+hfe14QvknjhrtVeNXshx9TfThq+9irmpAOy5g6/bW1b/t
         unMkW8Kx2Vmd+yjmAku6x/Q96woFrLuD9A6b8mDE6ZOTp/8ld05mpxyqfwb77CVUT+Lj
         8DBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l/CgDRXCVmcvg8qX3Y+6ACmme2uqTw2HX6Xact+DTl4=;
        fh=wPfcqgZzFtHU2ja2Y0lrnDCQh/N/nq9j5T+zctXKEPA=;
        b=Ahzxd/2HawHIrZNvMsBKHGUUrFB90qYiQzrzAUWbEnywSRg5F9TF5fFjedWWoFAC2W
         EK8nHxaEy9a7z8aGERWnV0X6C02VkZYAMeeQnr4wUyuVs/8w3dn8gWpsDKy1Pbu2r0nq
         MGRVFmA1YBjnIkMK+0MqFzU671h8MdhVZLgSlKwQrgUIzacCBv5qigjffn8xUbU4yZcO
         SMQKaKwolYpDUu53XRf8X1weyF5wL5bOJGn5onCiO8HJ/F60G3C7jH/Esg28/Orw+NTq
         HuC6x4mE9eaFm+rE/59bgWUBbGMR0GcTdzKwwBoPz/d9jAL+Xob4WIgd+X6iaIF9+/FB
         zoCQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781639688; x=1782244488; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/CgDRXCVmcvg8qX3Y+6ACmme2uqTw2HX6Xact+DTl4=;
        b=hSImgKOpWfPs84ngTy3K8wNev1Hm3ACDiMJ6owOgORhSIcTEVc/Nq2cqXwFXiR0pE7
         85oxfGPHWQOVOUtJDEA0t/gqCkLNlK5KRjb/HOZ0JtnG6I9evjb1NlIyewCEIZJn9dI5
         kipYTkpUEWZBzJXKlN/UFlMHLOSEyg696k8vQGM0gu5af80SrHbRjLAGVR/w7bDzh7wf
         SG3t6zBWsQaSE/l6EzvEesa+5kHXbe6c88PD9VwWkzyEvgujWDq3csqgqX6blVVlUXm1
         115wz2oZVsCp9mLtuDsT9LB3Mr9E0s2+7j/QowH/e0/FrpEPNEqJ8aZ3SnbtD/1JJeoB
         lIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639688; x=1782244488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l/CgDRXCVmcvg8qX3Y+6ACmme2uqTw2HX6Xact+DTl4=;
        b=R2b3XvOBMHvNuWb/H0IUBj6I279AbZMdc/XHh2azXh+Czj8zuW0gf2u+vHNrt4LTDN
         /jeaOKkeevF6EZ2d/FyQ/3KCIc1h7VhVMR68I+CKUUYvviXgzCRRApdxkQI2SsGfXO/o
         A/TFVwl16dgDwc54jEDmGW2eE3jHp9/YfgLC6Sslui3borOekBPMltiUP5EEWzn9pcj1
         8V48Y6A0csdb6hwauCKlf0W34hrQIJJ4CoY33qpw4vF7Rb79N993EKXphRkZpA+k4DTK
         umoqPwnSuat8LfXZNrOEdEhwHVqSHvL8kIEsbMIXHZPRH8LcjScY+Xtyj5dvddjqdhmT
         d19g==
X-Gm-Message-State: AOJu0YyURX/xeUeiwFpWF24p4P9oXOczTnucJfnVPbuPrGfgNuC9TLPf
	UasyD9fnqoPby1UMtqwLSi8Tc8irsxdkR04wb9d3HE6fFIT5gAKIeBH+QAJDnjy7mySkDy9RWro
	ONV8yrV4KNbQKl4v062T1w+1JvzpWcg/Hvy9+k0wA
X-Gm-Gg: Acq92OHhXVGBya7VLOnxZTx7lGWqMk49KW8boXAmG3dcbxithKY3zaE4svtM1Bx0EQU
	hAMbYrpOUjEt/yj+mk37OD3wpPolV5LQ4J2jVm3VYMBFxdDZZ6M6im3F1jr9KuXAnv+nRw87bFP
	b6hLA4gCwE/5diWyg1Md1Q4D6UzVGi9dWEKbKG8F6/PuO+9Y25UxBsldlHqkSFD2M1q/sdFqDhd
	Mmy3zGp91317pgWH9qNoGS5BKDkgYVZTwVLViZc847XuMYaDSghc6p9C99E7SjWOrt0OCWqFu3N
	K4MqDTa2AbSGOJyGiw==
X-Received: by 2002:aa7:c919:0:b0:693:3e06:8f4d with SMTP id
 4fb4d7f45d1cf-695476eb895mr8776a12.2.1781639687910; Tue, 16 Jun 2026 12:54:47
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260616004155.1435766-25-yosry@kernel.org> <20260616013031.53DAC1F000E9@smtp.kernel.org>
 <CAO9r8zPA6B72RDWeBMHqv1xz6o9dDHEEjwnMjwAwVwA=5qxaKg@mail.gmail.com> <CAO9r8zM1aKR6VzOhVq1_xTH5ZhSUBzYh-tr+ZzO_L4o28iy9OA@mail.gmail.com>
In-Reply-To: <CAO9r8zM1aKR6VzOhVq1_xTH5ZhSUBzYh-tr+ZzO_L4o28iy9OA@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 16 Jun 2026 12:54:35 -0700
X-Gm-Features: AVVi8Ccl5w4C_y5y0xOjMjz0BTS525Kww8pR3RSPvd9mlFGLN-xlUMmMlMC5JwA
Message-ID: <CALMp9eRS0EyqPqWZNkS0U=iH4mSt0snD44ufgXw7wvs9+o=a4A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 24/25] KVM: nSVM: Use different ASIDs for L1 and L2
To: Yosry Ahmed <yosry@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:28=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wro=
te:
>
> On Tue, Jun 16, 2026 at 11:14=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> w=
rote:
> >
> > [Omitting the previously reported issue]
> >
> > > > @@ -1557,6 +1550,8 @@ void svm_free_nested(struct vcpu_svm *svm)
> > > >       if (WARN_ON_ONCE(svm->vmcb !=3D svm->vmcb01.ptr))
> > > >               svm_switch_vmcb(svm, &svm->vmcb01);
> > > >
> > > > +     free_asid(svm->nested.asid02);
> > > > +
> > >
> > > [Severity: Critical]
> > > When the hardware ASID is freed here during nested SVM teardown, does
> > > svm->nested.last_asid also need to be reset to 0?
> > >
> > > If L1 disables SVM, svm_free_nested() is called, freeing asid02. This=
 ASID tag
> > > can then be reallocated. If L1 later re-enables SVM and uses the same=
 L1-managed
> > > ASID, nested_svm_entry_tlb_flush() will see:
> >
> > Hmm if L1 reuses the same ASID, it's up to L1 to explicitly flush it if=
 needed.
> >
> > That being said, KVM needs to flush ASIDs when first allocated anyway,
> > otherwise we risk reusing TLB entries from a completely different vCPU
> > or VM. This series correctly does so for L1 (calls
> > vmcb_set_flush_asid() when initializing vmcb01's ASID), but not for
> > L2.
> >
> > So yes, we need to make sure asid02 is always initialized (and reset)
> > to 0, but not for the reason Sashiko mentioned. It's so that the first
> > nested VMRUN using an L2 ASID always does a flush (as L1 is not
> > allowed to use ASID 0).
>
> I think VMX might have the same problem.

This code *should* take care of it, since vmcs12->virtual_processor_id
can't be 0 if it's being used, and vmx->nested_last_vpid is
initialized to 0:

> if (is_vmenter && vmcs12->virtual_processor_id !=3D vmx->nested.last_vpid=
) {
>         vmx->nested.last_vpid =3D vmcs12->virtual_processor_id;
>         kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
>         return;
> }

However, Gemini points out that last_vpid is not cleared when L1 does
a VMXOFF, even though vmx->nested.vpid02 is freed.

Per the exhortation in security-bugs.rst, I am treating this issue as publi=
c.
