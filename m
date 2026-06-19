Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9413148C5
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 07:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853902; cv=pass; b=jL7NariPMjzz3SgxCzxSdXYZsvPmLWA3icu21oPc3paLY47gwh7f96Tn1RuDmn/gwExNbEyRWWWBrz3eFnPAVrinSa8PBh6Iq0vpri+rVLZfsNrgk08EdC3tPHGQVHkaJzYXH4JWuqztgj5p6g9LbQ8r1GXu0zm018LbIT6Fcnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853902; c=relaxed/simple;
	bh=dmgbPTPiE0xuMurE+gortA5e140VHduAPmVUQVGXPLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+FuA+xvzF54wjeAv7GaHkBUwx70fuhIrcbswjDALtD0dQcu3uMyk0509zQz9ecTdv++nQGy1hEroF/Fp8Cf/UK9zpoLWP6aM7a9eBQZIc2+t70Kn+3NQrjrYEj/jJNnVuLYPxccmo5wkUA4Rsh6cn1ijaYM2SW5zRMosiUjOeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KEyRf8K8; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KEyRf8K8"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-519ed52bcc6so89231cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 00:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781853900; cv=none;
        d=google.com; s=arc-20260327;
        b=PHTZXinM9qr0lpw4PJ0L10Tj5h3rXSPTmS8q18fD/KQBCY/LPFMM7vYUAVmk3SvyeL
         mLHrAdyptRIjbXEM5IJ+sVmoAih8dHbqIIKTLJqXVKjxSLuzVomIErWIKD7oq5LzXBay
         1LzISL4YLNSWCWSUPUSw6KcCot8NuRi8qz8LOJr6Y79WwhvsKI7UFeB+0j/cW7k28RA6
         sZ6X6LmNJgIAsdwVHxbP7cnhRR9WeZO2wa18WkKfei5RJKakPjDAdIpnN9aNHfZn2Dnr
         bxHrdeVi4MMboPOWHZ0TfCkkqaPaRqt84gpvnHTEPQuA7Hy3A2aKtzKccLvM5GmBXC1B
         QCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZLUNK0C1/C6p4P0m1RciodLT6nPw1lH0hYf9RgcDVA=;
        fh=HhTV4G5+xnJ3thQDc6cpcOYMN3AitX7qB0zPfKB89LY=;
        b=NcpbxO4QQRrRYW0l/O+ZDorkpDiHtQZs5S+p3sZk8N5n9d5Sorg8nNXWCrUK/2e6ux
         B/OvRVqvd2YSt7KpDmhM1uYHmd00JI3MJOgtU7d/u6I+VM6/llks7ti1DU1nQdHukW3R
         as6k8Ww92X996jVbf26Icqo9yAuuVlO/xSMD+dnqfT0/zAIjYhVUuvzN3W8ytS7RU23V
         m3KHi1yICRuTFmTczJl2Awdcd5jLQWEvwgAYoLH8dgg3mA+SKc5ewoJLX8d501L83XQ9
         QNl83hycwZOzAhwxGQw4SXwnmvuvvpQegH+KcPllHfebiMq9YPHHe9jyT6ozKLmgAPTW
         S3aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781853900; x=1782458700; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZLUNK0C1/C6p4P0m1RciodLT6nPw1lH0hYf9RgcDVA=;
        b=KEyRf8K8uHDjV0DjOvHWEjZrW79VbnLuhy2tvBW4krkL9pUM+hTKvmnm2tUiLvaOkC
         b3AMMPXRwytD2OtGAzYOxidzZ0BiPc5T3nMAb+Iob0AMCuI1PWT9kYolhi9e1SSr/mZp
         HxpEOkMCc8F7YtwXiesStCTfexg4/a9MCsnrtDfxFCSWw0bgIcTyWi5gQOAJbq8e6V6U
         f5R4FhBfatUoAiq4uBq6rW5ByIx+/gaiOxp8eKZPB9MMlwcCBnPuFS14fAqFkk/FuMf1
         PsDK1r5h0Y6hPGHWCLp7eTu5kVSAek0uBMy3dQK2TSDHNDfSBWmmzzeN0af/iOvhCK74
         iVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781853900; x=1782458700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZLUNK0C1/C6p4P0m1RciodLT6nPw1lH0hYf9RgcDVA=;
        b=EXheXpxSnrVyDn79vj969Xm09ESLGuGFwBL1qNilm0EtcTyhC+qgrqnQ0Is/28EJz6
         f0hErD6L4BCyaVD8UYt4MBPB5t2Nl9Iq6Zjjay0ZiQSZ64SWuIFTuDZAuyrxLlLYU7D3
         jBQ/oOMMDud/AeU8X7y/b+Y1f5gGECHGy+KT1AKMSPlzML6orH/FG1CCYjVXDOww8XR4
         /AMki8wErl4IQHZ5ysEO7dNmnkM1sqU0LWHaNecBMjV8d2y+Zb9nKbOIxtkYJFIgVpzP
         1F85fp9hUVRGNsoDMP3pCCvV9l3/nhxT3WMWXcG9IusmNTuoVQvn0sflNJH4niQ2LUko
         C9OA==
X-Gm-Message-State: AOJu0YxYeQlluUpha7mSqIeBUScieKOScVtZDO5QRHiIS8ZLOjN7ArQ/
	Ck+sqqJQ4yKVXj6gAuPRY/cLwqz/AQ8wYjvAAIFQrq5j20f75tvqgY2Qz1ylthGOWAn/XALJ/xG
	gSSsI0U216mnCCMtAVl7wyYjLDeAGsBDNiBJZSrfCrQVeEiQ+9xosrFRF27I=
X-Gm-Gg: AfdE7clsnw3+0L25gBpL4yhEmH7bEMdgcwOiSuKLN9lMWdHIxBvWEeqBSLKlmsNQulD
	sq3bfrFv+RLK3ZfZP958cwkHGiWQNQPJ31UDn2dlwLmzg2Evu7PP7lTkmr92QTZH2A9zwzrn0lV
	kCu+Z9gJ0YKcSstvlieRRapkCEWSwCgCN+iz4Gko5TsU9PpcgiL/uriJcnbJIEfOmyN9d+EHAg0
	78bseMlvubjT7zvv1Yaoj4kadjasPGkEDx3UcEeaWp5CLl+vVSHlj5zrYJDRXAgergihZkGmg==
X-Received: by 2002:a05:622a:90c:b0:516:8fad:8fd3 with SMTP id
 d75a77b69052e-519e891bc36mr4796041cf.11.1781853899259; Fri, 19 Jun 2026
 00:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com> <20260619070508.802802-5-tabba@google.com>
 <20260619071601.A5E641F000E9@smtp.kernel.org>
In-Reply-To: <20260619071601.A5E641F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 08:24:22 +0100
X-Gm-Features: AVVi8CdA4isQgBYT7r0WSn60YzlM4-QbfOsq3bKp_KL7-hetpmbtMMUTTSzzOM4
Message-ID: <CA+EHjTwpB2fmoYGfkP5RVZcB4sgbVPQ0=QR5dyUJnpQ_VQa+pA@mail.gmail.com>
Subject: Re: [PATCH 4/8] KVM: arm64: Move PSCI helper functions to a shared header
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2026 at 08:16, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The header `include/kvm/arm_psci.h` is not self-contained due to =
missing includes for dependencies used in the newly added inline functions.

The header was already not self-contained before this commit: the
pre-existing kvm_psci_version() uses vcpu_has_feature() from
asm/kvm_emulate.h without including it. Every .c file that includes
arm_psci.h already includes kvm_emulate.h. The other dependencies
(lower_32_bits, MPIDR_HWID_BITMASK) are transitively available through
linux/kvm_host.h.

Cheers,
/fuad

> --
>
> commit 5533f45659b895d2266b9d4cfb6fd00ea1dc5f92
> Author: Fuad Tabba <tabba@google.com>
>
> KVM: arm64: Move PSCI helper functions to a shared header
>
> This commit moves several PSCI helper functions out of psci.c and into th=
e
> shared include/kvm/arm_psci.h header. This includes kvm_psci_valid_affini=
ty()
> and kvm_psci_narrow_to_32bit(), along with renaming psci_affinity_mask().
>
> [ ... ]
>
> > diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> > index cbaec804eb839..f86a006d67136 100644
> > --- a/include/kvm/arm_psci.h
> > +++ b/include/kvm/arm_psci.h
> > @@ -38,6 +38,33 @@ static inline int kvm_psci_version(struct kvm_vcpu *=
vcpu)
> >       return KVM_ARM_PSCI_0_1;
> >  }
> >
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
>
> [Severity: Low]
> Does this change leave arm_psci.h relying on implicit includes?
>
> The moved inline function kvm_psci_narrow_to_32bit() relies on vcpu_set_r=
eg()
> and vcpu_get_reg() which are defined in asm/kvm_emulate.h, as well as
> lower_32_bits() which comes from linux/wordpart.h.
>
> Should this header explicitly include those files to ensure it remains
> self-contained, so that future users don't encounter build errors if they
> include this file first?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619070508.80=
2802-1-tabba@google.com?part=3D4
