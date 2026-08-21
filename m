Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969053C819D
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301843; cv=pass; b=C5C3bYThC0+Pjvt2Zm4q7MicUGRCoFNIEzjtTCYGUV5Pi02eAY+/DI8ReCDHjMYtWhaVgxgEMtzHg67kchbS5fibiDXYcHA1nkfKzwx02LcBz7EReIlCnVJjv1k/xT91xh3A7X3Q6Rljcj+d4O124461NnIu+lGjkkp6VxdqaTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301843; c=relaxed/simple;
	bh=Dk3uUFhv3dR/gphHYnJDcqos93iURHifKDqKE2F8I4Q=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEqsbdkD0bmxQD9YLjTM7f6U93mWHJQvQaW7af/5q6LYUIF490hZcbQ2IOY0vbnmWCPSED4ilQwOv9PyaqHKfS1co9QhRi0RsJDxwSXd+bij376eMIaFSCPeSqBmy6bcUv5FD5ZwgK1gcLPJClT3ne2tS0v2nNusptgCDhEk5+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=evJQA1XH; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="evJQA1XH"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so4354096d6.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 01:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787301840; cv=none;
        d=google.com; s=arc-20260327;
        b=r8O5z1A6ou0TLAf22n6GSaCREe1fVo6bR9nvy9TAxv5kEjj8KlVyN3v5dJO/WFWUS0
         JAqzE2K25CoMh86HjNdvi/cAZnmuhhfrEX1LIRxfpYUCHlksaS4DY9NKEDeXPHjelnhG
         jI5PSiYgAMniEdbRHhL8lMqKwH62SU1S7FqBLVV/1tHRJxFTmkgxBjy+p/l/5C4cPqyS
         VdktJA9gkk8X/yOWijQ7QbteUfJe5vsMRNKE+rnvkQHkgVND5hC+EZAjQBTgReeRM0lS
         JUE9Ham1OqxHqGl2EVPcAkQmtVPZElyXGkMj5dUhh32ezZ4NRXoO1AinNHQ3mEkQjjpz
         DCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=JndCtY/VWXV/rVe0GCCvV63VgHFnqs0KqY0XSxvfZ0s=;
        fh=2WPn+KueKtsIlzT9KzYxa4hFiIDLstDnZss1cuZWK88=;
        b=JTeAFO1Bi/WA72SHJqvfQz8H2jrFSjELa5g+ysbeuST4BYgFl9db4b7HwM2CGCuwSd
         PSifMQG/VC66e+L9GsVwPc4EH7lEYus1Im4/NyT64sEpd0cNWL52prQfLv8JFHWn98Yv
         fbfPNLbskXY4pjwnaAJkiLHJrVZFCM2TFSQV366r3tfOslhrMh1rUCKNTF8lWGN6SboN
         ytGk+wjYYP7mMHWjWbF311BwtlobaL42dVKLXENtSlzPUcpKIpQKEeNncfxVqgpaBClw
         EI6FaQl/DZAg64TJYPiO2TAv+8lyd8Xydiu/vcGqXspTFCZ9zol9PlM9or4Xbv+5y+Dt
         ySbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787301840; x=1787906640; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JndCtY/VWXV/rVe0GCCvV63VgHFnqs0KqY0XSxvfZ0s=;
        b=evJQA1XHynMmtii9qwQ9i+eOVwKrkHFaP41yEHqgjqqKPprHBUHGD3wZxj3/wNOfQi
         jbpdktGZRRu9y9mjzHPeO6fVjTQa+X74q9CYKZzSbxncwvJ3/Y57rFLwjuB5OwE4Kbq/
         excDv63uGwqC2q5FGZVNGIj6UYnCinAWS/QoF8eJp/flXrhoEi4AGBfP0sXyw+6ai5Qc
         U/WyeNlRkXJ1uZcDeeXJ8nLdTJsDl+hOS64t+vvUghArIfz4dV9GSLKXEniLUQNFktXd
         QTkIdKKDOc1/znkOW9+6o5/cvnKFFpu4g5/Fgwa33ipamZft4qtDjWhNJKmSLZ0Bfk/k
         1s+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787301840; x=1787906640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JndCtY/VWXV/rVe0GCCvV63VgHFnqs0KqY0XSxvfZ0s=;
        b=XVtXMrFtWctKOGDLh45a8K6kyHKhqcLyC6BUlr+0U8bTuAtLxKJeNA3BVJ5deyTUfF
         oFFlRPa51tkS8kfHlq0f9irs5Wwbul6Hvn5R247QPdZV+JPLjqkybndhDZ5XoG1K+7VM
         8jqUHs6EQ7MhaD2IgnBhpU8cyI7f6tiAza2/d3nZeA66eCdUVFc/u09vEA+UyKFAmZLX
         gitLjFTrdt61JmISD43BqL4gkgn8Hu4eKoLuNLvq2AplOfIXqIgPrqQDL+xe9Aibwpi6
         WpuUl7OVQqJVZaW1Bb5G1o/kByoch5i1MYUdJ6l0VMCgFbo86jilNKpo7LW/Kt2mhmnD
         FiwQ==
X-Gm-Message-State: AFuF++kxpImki2Wh1vlCUxF2jvhiAoF7UGDE54y4C81G+o9Y4TysgjQd
	CsppJnXvTn11OyM4W7QPznkPVlz9roLy6S5QEuxMTNWQo7GMfIbjmnhmvI8RIVdhfaCr0Yk4pRE
	fPbAQdKiM3ionDg6nCX2xPu1Wbc44+6OpuAG4yliZyTS/VY5IJf+HzTQp
X-Gm-Gg: AR+sD12CEjt+Et9u3l5UwQnl3xaojSVN3epSZi623wRJWga0sN/W5QU0G3OezkQuYoV
	2+bkn14p0vhx4tDyni+DImNRtXIeZEMrkXyY/ac6tX/WSSrxRR5g2y5Z8ZdFUzKnW63wLmC3KmA
	dXd8Rliqs/VMV/bNF21m+WQPiy1uxblPNv8n5g0ZpanQdpdP30c+/RvCDTIux2uTF3k7Tl2pzpK
	ID+dq3EHTcdpxq2OfPIKv7R2ATQoVxEJcrFu0aq68NAAcU38tuzI1ecybrhIdU0uIkg+3IIuGOa
	MxO1Ve/zXUBkhzscI9XvulLWTBciFJwqbO551Gmkq5jR5yvJ/0Q6OpADvxGnVKxJN9kIOF5pOMK
	ozw==
X-Received: by 2002:a05:6214:390f:b0:8fd:b96d:195b with SMTP id
 6a1803df08f44-90c6abef274mr145111756d6.15.1787301839792; Fri, 21 Aug 2026
 01:43:59 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Aug 2026 01:43:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Aug 2026 01:43:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgHEVxO+1Mkoc3-c2+qSrKWnD+BDe04NBvuwGU6BL0amzA@mail.gmail.com>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-3-5298f42d49bb@google.com>
 <20260818092717.3F4871F000E9@smtp.kernel.org> <CAEvNRgHEVxO+1Mkoc3-c2+qSrKWnD+BDe04NBvuwGU6BL0amzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 01:43:59 -0700
X-Gm-Features: AcwNN1XQ66q23bW9XbZkGc0EqSHIasNxwr4vfpz_tu-1DEmLtY18ZBr72_AUUzI
Message-ID: <CAEvNRgHX-NebA7z3twusis35E_grJNTrbse7aUZ6+D=qpQn14A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: SEV: Drop page refcount early in VMSA reload
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ackerley Tng <ackerleytng@google.com> writes:

> sashiko-bot@kernel.org writes:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>>
>> Pre-existing issues:
>> - [Critical] A preexisting vulnerability in `sev_gmem_make_shared` allow=
s a malicious SEV-SNP guest to cause a host kernel panic by transitioning a=
 `guest_memfd` page to VMSA state. When the page is subsequently freed, KVM=
 fails to reclaim it and returns the still-firmware-owned page to the host =
page allocator.
>> --
>>
>> --- Patch [3]: [PATCH v2 3/4] KVM: SEV: Drop page refcount early in VMSA=
 reload ---
>> commit 597ff1c52e82911967f2122ff1d77aa79a4a2d9b
>> Author: Ackerley Tng <ackerleytng@google.com>
>>
>> KVM: SEV: Drop page refcount early in VMSA reload
>>
>> This commit modifies the guest VMSA reload path for SEV-SNP vCPUs to dro=
p
>> the page reference immediately after retrieving the PFN from guest_memfd=
.
>> This avoids holding the reference across MMU lock acquisition and prepar=
es
>> for future changes. The page's presence remains governed by KVM's MMU
>> invalidation protocol.
>>
>>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>>> index b34b11d7f8fad..d3d620bc04dce 100644
>>> --- a/arch/x86/kvm/svm/sev.c
>>> +++ b/arch/x86/kvm/svm/sev.c
>>> @@ -4062,6 +4062,7 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu=
 *vcpu, gpa_t gpa)
>>>  	 */
>>>  	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
>>>  		return;
>>> +	kvm_release_page_clean(page);
>>>
>>>  	read_lock(&kvm->mmu_lock);
>>>  	/*
>>> @@ -4076,8 +4077,6 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu=
 *vcpu, gpa_t gpa)
>>>  	else
>>>  		svm->vmcb->control.vmsa_pa =3D pfn_to_hpa(pfn);
>>>  	read_unlock(&kvm->mmu_lock);
>>> -
>>> -	kvm_release_page_clean(page);
>>>  }
>>
>> [Severity: Critical]
>> This is a pre-existing issue, but can this allow a malicious guest to
>> cause a host kernel panic?
>>
>> Looking at sev_gmem_make_shared() in arch/x86/kvm/svm/sev.c:
>>
>> arch/x86/kvm/svm/sev.c:sev_gmem_make_shared() {
>>     ...
>> 		rc =3D rmp_make_shared(pfn, use_2m_update ? PG_LEVEL_2M : PG_LEVEL_4K)=
;
>> 		if (WARN_ONCE(rc, "SEV: Failed to update RMP entry for PFN 0x%llx erro=
r %d\n",
>> 			      pfn, rc))
>> 			goto next_pfn;
>>     ...
>> }
>>
>> If an untrusted SEV-SNP guest modifies a guest_memfd page state to VMSA
>> using RMPADJUST, and the page is subsequently freed, rmp_make_shared()
>> will architecturally fail on the VMSA page.
>>
>
> I need some help with this one.
>
> For the initial VMSA page, IIUC snp_safe_alloc_page() gets a
> non-guest_memfd page. This won't ever go through sev_gmem_make_shared(),
> so we're good. snp_leak_pages() doesn't actually leak pages, it just
> tracks leaked pages, but __free_page() is skipped so the page is really
> leaked.
>
>> Because the error is bypassed without calling snp_leak_pages(), the
>> firmware-owned page is returned to the host page allocator.
>>
>
> For guest-provided VMSA pages, those can be guest_memfd pages. The
> refcount taken is the one guest_memfd holds. Without considering
> conversions, just considering truncation, sev_gmem_make_shared() is
> called from kvm_gmem_free_folio(). Sashiko is saying that
> rmp_make_shared() will fail, and the folio is freed.
>
> Sounds like this would be a problem if the folio is used elsewhere...?
>

I looked closer, "15.36.12 Running SNP-Active Virtual Machines" in APM
Vol2 says "After a successful VMRUN, the VMCB page, as well as any AVIC
Backing Page and VMSA Page are marked as in-use by hardware, and any
attempt to modify the RMP entries for these pages via instructions like
RMPUPDATE will result in a FAIL_INUSE response. The in-use marking is
automatically cleared by hardware after a #VMEXIT event".

So it's not true that rmp_make_shared() will always fail on a VMSA page,
it's only true if the guest vCPU is running.

RMPADJUST sets up the VMSA page, and telling the host using
SVM_VMGEXIT_AP_CREATE is how the VMSA is set up to be usable. Then, the
other vCPU needs to be started and running, and then:

If the host truncates the VMSA page or host closes the guest_memfd file
containing some other vCPU's VMSA page, sev_gmem_make_shared() on the
VMSA page should fail, but the page is released anyway and we have a
problem.

An unsolicited shared->private conversion is fine since the VMSA page is
already private.

sev_gmem_make_shared() would fail on an unsolicited private->shared
conversion. The RMP entry would still indicate private, and guest_memfd
would track it as shared...? Bad.

I've been trying to write a mini reproducer like a selftest but I've
still not gotten it to work yet. If someone knows there's no issue here
please let me know!

>> Could this lead to an RMP violation and a host kernel panic when the hos=
t
>> later attempts to access the freed page?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-gmem-no=
-return-page-v2-0-5298f42d49bb@google.com?part=3D3
