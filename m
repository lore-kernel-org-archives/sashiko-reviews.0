Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF694611E5
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786725879; cv=none; b=Q+ypaNMIqS2wRPdwmH/XmMxhIXpP7vfRjUCSTsIgZrfPr+Juz/ufQz1EgAQ5Z6km4bOdRWEEMamOpIQgwJX1KLtz4qoofdkjt6p6hd5kJGZlnmVEgcirAB4kIQYwq/X+ZUBozd0NneoEf2jS+FVcOhMQLrv9IB73kRTa3lANoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786725879; c=relaxed/simple;
	bh=SXMUBMpWqjsSZ8UZUax/xd2jiHPkqWpJd/+6vxgoa0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ejamlj7M5PHuO5NTqdH0eziurH3BzH4MzVWTe7jHfl59JOtTEab68T7sw/SkqB7KtU05o+bHrAvCwtoytaMeebw7/C+NK8lSpVeqD4BgadU8Fu3s0A6bQhg2ka6h9kRGTMm6Fk2lM0AJo5OlzvGs9r6msTYJl3hibq1MaFhbafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eRnUJ9aj; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eRnUJ9aj"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84842381150so1232178b3a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786725877; x=1787330677; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHHH7uTWtnNMDgIrudvSIouxtfc87FvfYM1qiAcx7gY=;
        b=eRnUJ9ajTPHE2+PFbdMMwjMEWUaAMJXy79Ry+jorWzbvDgqtl/xTeBaByd6jBxm/NT
         hBe6bkIENUKbX4en8cDk9QK4YZ0paQHvkdZtMHXwwyFMBpOIA6dKLYNbsVIKsEaQRk90
         hq3GTbFFL54oHQ5mdPtXFdfRBeAq1pEUS5pV5q2pUZ3HltG/KIQb0ojCp3Jf1YvQiafT
         bBsV456CjuwLmEpfgQKV+vBt1tGNt2At3JUHBfTh+p7spOU23sEgk97+hOVRA/V/R5sh
         rf4DKXFpsH0UUd7a2Dpjz4l+z4sK8PYrGHADXxjyF0j9XZi5HS7JIO9NVCoKuW8V7wz+
         SxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786725877; x=1787330677;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHHH7uTWtnNMDgIrudvSIouxtfc87FvfYM1qiAcx7gY=;
        b=dZadgaWKecq9gyEBaTwekmPyyo+Tr/iwsxPjCJ1gQ6if3XgAk+lRIG6wN4jPXt2p6a
         +oYCZ3So7+LrySpblNix+jKktrmHg4wutnHe4+vNNAujisyKDQdrb09cfO3xIVbT63rn
         1T4we4wdCEHt8FVOOG88I7ETbi9tRVcv6p2IzLxvR+5d3ZD6ysdjHODFlTBDPh1IONiN
         O6PSWLtPV3tRRh5jRKEUGE7CbS4dYRDW83Uy9Et0jg9htIwleUd8WSdvzTFL8LsqwF+M
         ofm9zlAqILf3660oKVbF2A0NobXTGuCaxHGYLH24b9zCyPf6UmsT3O2a4gtJ6PjTw8xT
         iYyw==
X-Gm-Message-State: AOJu0YwTNlJzm6Y8uFJjFxfSmHj9LVZXtP6HAFj9Gz6jOR6Bcy639ixq
	nC1WBB3avf0jf2P8OPpk6mh9mHn7IqtXm/DGyyf31JYeOBrw9zXY8MtKeEXz5LlzQhcDYLXhC02
	tE5YxSmKl1O6nkH7JbmTa3YgkvRCXHwDlnmPaoj6l3yYn/7MlqdNfBO0Op9IctBUHHn4nCTbSnA
	NNwpzsra/Hx/W+CrI1eYca0wP3Eg31n8hYVWKPFf5H2Vs1FFsx
X-Received: from pfbgp14.prod.google.com ([2002:a05:6a00:3b8e:b0:847:8e58:df6f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:21c8:b0:847:973b:3cf6
 with SMTP id d2e1a72fcca58-84fddde3c32mr7348818b3a.0.1786725876826; Fri, 14
 Aug 2026 09:44:36 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:44:36 -0700
In-Reply-To: <20260814163207.D8C5D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814162221.2144473-1-vkuznets@redhat.com> <20260814162221.2144473-3-vkuznets@redhat.com>
 <20260814163207.D8C5D1F000E9@smtp.kernel.org>
Message-ID: <an9F9EJj4yLkc8Op@google.com>
Subject: Re: [PATCH 2/4] KVM: nVMX: Make VMPTRST return eVMCS GPA when it is used
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index c78c67525ac9b..d13a4d47bc68f 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> [ ... ]
> > @@ -5958,8 +5958,14 @@ static int handle_vmptrst(struct kvm_vcpu *vcpu)
> >  	if (!nested_vmx_check_permission(vcpu))
> >  		return 1;
> > =20
> > -	if (unlikely(nested_vmx_is_evmptr12_valid(to_vmx(vcpu))))
> > -		return 1;
> > +	/*
> > +	 * Hyper-V TLFS does not specify the behavior of VMPTRST when eVMCS i=
s used
> > +	 * but genuine Hyper-V seems to be returning eVMCS GPA.
> > +	 */
> > +	if (nested_vmx_is_evmptr12_valid(to_vmx(vcpu)))
> > +		current_vmptr =3D to_vmx(vcpu)->nested.hv_evmcs_vmptr;
>=20
> [Severity: Low]
> Will this cause a build failure when CONFIG_KVM_HYPERV is disabled?
>=20
> Because nested_vmx_is_evmptr12_valid() is a static inline function rather
> than a preprocessor macro, the compiler still evaluates and type-checks
> this branch even when the helper is hardcoded to return false. If the
> hv_evmcs_vmptr member in struct nested_vmx is conditionally compiled base=
d
> on CONFIG_KVM_HYPERV, the compiler will fail to find it here.

Yep.

arch/x86/kvm/vmx/nested.c: In function =E2=80=98handle_vmptrst=E2=80=99:
arch/x86/kvm/vmx/nested.c:5971:53: error: =E2=80=98struct nested_vmx=E2=80=
=99 has no member named =E2=80=98hv_evmcs_vmptr=E2=80=99
 5971 |                 current_vmptr =3D to_vmx(vcpu)->nested.hv_evmcs_vmp=
tr;
      |                                                     ^
