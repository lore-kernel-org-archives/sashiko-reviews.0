Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8257B3CB54F
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217629; cv=pass; b=aoCmgowfUCDQNCI3EmKUGiTbDWPZmVSjaVF5uIZwwDfcKz4M79sKu24kE+1rXVzRmcMv5Qk3MAAqSjm446M9ElTLWSdFkpKn4zANthvcjaf4JUM4XAz7ns6PJvhvnNZhtyvxyFKy+8esNzpSxNxdG3UWDgTNlQaelo+qSV9h6Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217629; c=relaxed/simple;
	bh=mCKwif1IQ/lLee7i1tlpkED0sCq1sTR3RlYMoWGxaM4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WLMrj/UoUUtwuK9TH5WOjPD6YhbZpRvkMWHAVZSftpOvozQNAvksuPNzMz0vGSU9AIZh5KfDDXp/YhbIp1qEkaKpYFR0zNLgVue8lRCHcmwLFg3EW2j9Vv5nkjyuxTpctew7zreqM5Bh2t6yFADu953zD0A/M3rUE1FR+J9COks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m6KPAOm2; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m6KPAOm2"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-52d58d7aad6so10181391cf.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 02:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787217626; cv=none;
        d=google.com; s=arc-20260327;
        b=NOa8Wlck38ae359uTYP5wgOGs6sQHsFdm7rCs769m8P6gw1bJ8MZzs8wURGiMeKuN7
         BrSVt1wvdc857k+s5i8cfyC/LfEc+TWsco9Lxlp6Q79EbApPLnhdjaEb4l39aCxfxdcr
         QU9cs94UAgxcMpiK0uC/MSsNe1efLkeLFZ6AFJqZKA1lj0Soq1O1Sb0YljHeuJTU2c5I
         7d/mhb7LaajwuNl32Mg9rxDEZlmxa8ps/SCUpk/YABgBkKuNH5Aeove7c13n9L2U8sd0
         N9hcYolUZ8deXGS+24+8DpW+qKu1Hbr3QKQIL0g7c3NYiTsMy34dfDlNQx7LJWbTiiEu
         IEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=btEJqH3glvcBsRJbKg2L7KXKgyRtz4hJgj5UscNKC5A=;
        fh=2WPn+KueKtsIlzT9KzYxa4hFiIDLstDnZss1cuZWK88=;
        b=D3vGEqKuuu4jSqu6+lPZ860CoEBTdV2Jm3hwT/eqEqGLDlwhq1oukhjjlSxXT8PLLM
         qm6qLiu/N6U5w1tY4Mm7csU4HzmyHF1bGBpvsK2iaGE3wgEwv+z1Z5NZQsceekx1xGtl
         iOjBQ6WvFlF4R922RRtefnYbFW5gLJwXwHu6UyW9lPwbvFOLlXd5efaExhQOg6378cSH
         sJ05d2uzAfhfinuLDltg9gDurVPOops0EsVCw7Qlx0G690zrw/6EZ2LjkFJntCJM4j3R
         QXiyC3bBMus3cfuWadLaXk6YQNZ0EuHU3UUIYFX+oHW16D5m6MUUDt8XOirV7RR2bjjW
         A2mQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787217626; x=1787822426; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btEJqH3glvcBsRJbKg2L7KXKgyRtz4hJgj5UscNKC5A=;
        b=m6KPAOm2wDsMzaOHHZdCz+w4KSdLDibDGtTmbjYgUdf9XHy1fBTzPueWwNT6bvBPhX
         w+osymFiTGbxycgdNkaSJm3Z6sIpV8s8MvQ325oFFqG6LtBR+9rv2PboJaWBA/aWLf/f
         OwX3R1HFx90UpcrQ1/DzOpVwEKF27+I/2g4vPTpj5vUEPbES+TZ3LAXUkjP1veObMbyF
         j3igTVOX4euX/T36qU9dNG6z8mCWkDJHJ4xDNI+WRxtm3fw1NaJuDzXqRYrB2bTLVkUZ
         Lb/6gZJ3NBC33j329nugTlZ4S1BI6SXJnHBC5eX1P5mxVme9BF8MSFGXAiiaWqkv29Bj
         ehyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217626; x=1787822426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btEJqH3glvcBsRJbKg2L7KXKgyRtz4hJgj5UscNKC5A=;
        b=XC5DDGJeO9jQHHhbjr8ANFoTH+LZ9jT7zlb2MFmshM5gNOl674/CG50rTjNTc7xMjQ
         G7YNR6PbLPGbwGCa5904wESHtAMnPhTTpVwL1kZuofzTnry/IVpUkKan6uNURMao9eif
         1boEuWdt7+2oCf1RlQ7Bq+3uBBfEbhoDXiqqHqp65XFwAbZm3Wi2ACDw6EwzJRUDIcS7
         CGmrFnEFLVbYOAMEXoFkyQdo/n1xQ2PSmZVKo1BXApwz3OWZlGXHDYEJNwLfgLB7t97g
         FrnuBwUVVMdmIYGvQy8FvojHHsJbDWk75lenr2NsDG9gRtZA3eFi1bAleFMwfle7Rhcj
         uyGw==
X-Gm-Message-State: AOJu0Yykq6jM85O/7Lt7baDE9R8eQSuukLPsOV8bmNulegSdD6u/YjQH
	wRMqOv/zlZ5jTmwyBRSEHkiW1Uwj0X4oFA9BNl1KDTfZphO44TnRFLZeFnEj4F5izct6Qpp4KoC
	tQ5ErAtsud2jrYEKPMl5SdxQjCsQIjzu+4Hkv/UvzdkP5XEVAJCJKoHFQ
X-Gm-Gg: AR+sD11pUuCrYRsry7n9AMyFdJEf6FrFBxRb7Y30PDluWAsVORdpyMc2n2fkSBE3CYp
	Pi8GpP/30eDxcr/+sX1He3CJgPt8YyOL4qUCQ7ytTsq3RYgN/Vh3HBk7fPAb36s0DnfffUWg3+d
	j21K6rIJBkANjebsmXlchq9/9kDdrYpL0BbvPj+TGcMZNB6JD59u7IJkQ/CmY4H1kps/2PyruOw
	x+8X84scu5k6aXvbyw2z++eF3Vtp+pR+KHHllPVqvgiNfTCuNaVYizBBIMU78reiUhG8yCEItl4
	6vov4PGHwSim/iAuKwEHPTtozjwghw7oz18pUM1KcHP1n04ub6U+d3AhzlU70XUhUvc4OP5wn4S
	E
X-Received: by 2002:a05:622a:5148:b0:516:d955:ea6 with SMTP id
 d75a77b69052e-52dd58d3483mr104538721cf.14.1787217625625; Thu, 20 Aug 2026
 02:20:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 02:20:25 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 02:20:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260818092717.3F4871F000E9@smtp.kernel.org>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-3-5298f42d49bb@google.com> <20260818092717.3F4871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 02:20:24 -0700
X-Gm-Features: AcwNN1VYoQ5shf82DtyHbf0xd5d-e2E9t-61o0yco6Y-2RGI9BPKRpGen-uy2Zw
Message-ID: <CAEvNRgHEVxO+1Mkoc3-c2+qSrKWnD+BDe04NBvuwGU6BL0amzA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: SEV: Drop page refcount early in VMSA reload
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] A preexisting vulnerability in `sev_gmem_make_shared` allows=
 a malicious SEV-SNP guest to cause a host kernel panic by transitioning a =
`guest_memfd` page to VMSA state. When the page is subsequently freed, KVM =
fails to reclaim it and returns the still-firmware-owned page to the host p=
age allocator.
> --
>
> --- Patch [3]: [PATCH v2 3/4] KVM: SEV: Drop page refcount early in VMSA =
reload ---
> commit 597ff1c52e82911967f2122ff1d77aa79a4a2d9b
> Author: Ackerley Tng <ackerleytng@google.com>
>
> KVM: SEV: Drop page refcount early in VMSA reload
>
> This commit modifies the guest VMSA reload path for SEV-SNP vCPUs to drop
> the page reference immediately after retrieving the PFN from guest_memfd.
> This avoids holding the reference across MMU lock acquisition and prepare=
s
> for future changes. The page's presence remains governed by KVM's MMU
> invalidation protocol.
>
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index b34b11d7f8fad..d3d620bc04dce 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>> @@ -4062,6 +4062,7 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu =
*vcpu, gpa_t gpa)
>>  	 */
>>  	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
>>  		return;
>> +	kvm_release_page_clean(page);
>>
>>  	read_lock(&kvm->mmu_lock);
>>  	/*
>> @@ -4076,8 +4077,6 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu =
*vcpu, gpa_t gpa)
>>  	else
>>  		svm->vmcb->control.vmsa_pa =3D pfn_to_hpa(pfn);
>>  	read_unlock(&kvm->mmu_lock);
>> -
>> -	kvm_release_page_clean(page);
>>  }
>
> [Severity: Critical]
> This is a pre-existing issue, but can this allow a malicious guest to
> cause a host kernel panic?
>
> Looking at sev_gmem_make_shared() in arch/x86/kvm/svm/sev.c:
>
> arch/x86/kvm/svm/sev.c:sev_gmem_make_shared() {
>     ...
> 		rc =3D rmp_make_shared(pfn, use_2m_update ? PG_LEVEL_2M : PG_LEVEL_4K);
> 		if (WARN_ONCE(rc, "SEV: Failed to update RMP entry for PFN 0x%llx error=
 %d\n",
> 			      pfn, rc))
> 			goto next_pfn;
>     ...
> }
>
> If an untrusted SEV-SNP guest modifies a guest_memfd page state to VMSA
> using RMPADJUST, and the page is subsequently freed, rmp_make_shared()
> will architecturally fail on the VMSA page.
>

I need some help with this one.

For the initial VMSA page, IIUC snp_safe_alloc_page() gets a
non-guest_memfd page. This won't ever go through sev_gmem_make_shared(),
so we're good. snp_leak_pages() doesn't actually leak pages, it just
tracks leaked pages, but __free_page() is skipped so the page is really
leaked.

> Because the error is bypassed without calling snp_leak_pages(), the
> firmware-owned page is returned to the host page allocator.
>

For guest-provided VMSA pages, those can be guest_memfd pages. The
refcount taken is the one guest_memfd holds. Without considering
conversions, just considering truncation, sev_gmem_make_shared() is
called from kvm_gmem_free_folio(). Sashiko is saying that
rmp_make_shared() will fail, and the folio is freed.

Sounds like this would be a problem if the folio is used elsewhere...?

> Could this lead to an RMP violation and a host kernel panic when the host
> later attempts to access the freed page?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-gmem-no-=
return-page-v2-0-5298f42d49bb@google.com?part=3D3
