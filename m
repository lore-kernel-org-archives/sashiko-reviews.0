Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65B73B776A
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212390; cv=pass; b=V9dHSX5Z/P7rTy420khwcrfFhnQlq+tAw2VIE4a5bgRIXbyMkXh64Q2RSwXm0lThsNAWcB2tRR+cv6+cLiNOeD0XtbRU1F6kYxD7sRv435RWrFH8PgE9WBP2o7x13vRFhYr9/vyvbKeVEms+Agbd/mlf5OTeyeof1uGTal/pfRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212390; c=relaxed/simple;
	bh=3ux/9MYCmRGaVF+WTBt5CVZosKYLKPfKOqqlr1ELLVA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAMRnC33UAWVocBNkjF3u/RVTQfLXH83kNuSGZnXUar5DrbZxcoWPxS/ALXz/0uDFwUlLLjvk2PLxDpWzCNI5cWUSGvO1jW1Lbi2+4c9iLOQvArQ85tRe3+fqXyzMlOlbKKgXAnl5erYp8eKFd2JdpLMC3j21+QZ0XmyzmK8XME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TslUAoNW; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TslUAoNW"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so13164356d6.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 00:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787212388; cv=none;
        d=google.com; s=arc-20260327;
        b=G/73t/CfWnniI4DLIg3nDnhUvWYyR10wukVgMRO+V7wVOh974Loi/dZlT4KiXVxZNf
         gkQ7Vb9xtrC2dCTYkeXyc55lZwgAz+P2N5LI1QtcXtOk9zMG1xDRNUrX/QGdDEBdo4YH
         WWHzOQxWHDl/vjvk8UNCUqRVsYX0QR9qGqwN/jJ00Na4XAtLQW5MimeW3V+AN9Z4Hblm
         k8/fP2hLswsR7SBOABIwuMLCVUjLhmx8sAZ9GKx48wZKNsC0rjPDZfyNY7oWpO9oZeKj
         +1VD9LflwPPdWuM3ZlxQCliKjt6ViiGvpLkb3QGF1S0q9ZI5UY72nRAi23OHXEn1TTaI
         BovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=o51BoL0uW8eYgVaNnvAPkhpysbo2+k4CgPomgwBCyNM=;
        fh=EZuZmZXRu1UyRSJj9ezXMUdPDZEdphtf/LAtIY+x/4c=;
        b=XrHi9LWOtlTBvQsXmeZjd9EEmk8cHz2dt06EMejMQzWZkyWPCkWGwOcC+xLzqGALw8
         vQJeYJxvZOrzPhSmtJAHR7ifpYI5RY56K539Uidi06LGIuiYOcYCIS34MkKV/fqBKzdQ
         4onIoXrbZbu0wUJLzdGFslGaLmhCTHNgJ/GmKQHBQG83Vlr6A01tsvmvclUTMewwz1E2
         ydeWWzXPH5J43201VbjJhr/1HwrFQvJvdZDg9+lA8lbuK7h7dqEplLeHWLazKmkvH7Ct
         ZyKLwQlzYrhr1afK5zLR+Wkg4ixw4j+l4yW+2YQ5QqM6H1HLdAHjaTwxGQWk/SQXWc4I
         ERNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787212388; x=1787817188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o51BoL0uW8eYgVaNnvAPkhpysbo2+k4CgPomgwBCyNM=;
        b=TslUAoNW+ONOVAAPoGaLAsbK9QTDHc/1IHP3fJpN9vJVOViOuTqXAjBcorECYqNUNv
         7V0DLOpItIfDLNtCOrrs0imah9zOH1cyHcVJeok6UHx8DEuNsygaaxmTqz7r5dSCbTVF
         Uul+f64v/hYcJl5lpONQtTsIn2tvIIweyw3JlQ4uEKKZBqxl0sEuAy+QHHl8DFfK66d8
         qI28pM34/f9D90CD8vs/YCvthiT+9GkZu5NdbczTe0/K4sHMf//zSHJSSLJXtgvpJY2m
         2in1+5FpcJYyHeVeTC8B/sqJS9R5JPaaLJEnaXnQwPVpIbWj1UJcNuBgAPpdMFUYsNJw
         J3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212388; x=1787817188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o51BoL0uW8eYgVaNnvAPkhpysbo2+k4CgPomgwBCyNM=;
        b=P8Z0PJWhHNzg5xUCXvWwdvWCgGA2gkOjFM8zqJYTsyggnOjpmdsj2emXL+5Po+LFSM
         0jaRC06CGEDWrhTnWKwxPG1uedVwJsmZ2ehQb41OS8FnbMsB6lkTMVh7j3mks/vTEYoD
         +/FnKjcCtLuaTih0CLLND/bSWzGBIPyIbBJ+f0zBdy1TWegb7UZxtp5B59RwOUppG+Tn
         O5A5X/m4o8sNTWJAO5fKN7r+Q7diVYKKl5ZDVmnc3u3jvzIKtHLDv7DCI8kowY5jSege
         LfMjdBxXsO9+596tc0Efv2gBTZ0g7ZdxbssNWT6dP/0OM4gLbLlFTMpdoHlf7Tt8HuCU
         eMwQ==
X-Gm-Message-State: AFuF++nXbPXq3ZbtJR/ilP7e0unGhAEsyb0Rqi2WOPq2XupLrNmww19p
	9tozKFcHibt9L3pz4+TY8I64ZfYLYn4HEiNJtXFHVaQ81Mm0HQKTNgbwukAb2MmDtkjrN+zZteF
	M3/IXJBhzU9ffezZqsrh46s34ik67ie2moAktmHvQUMcKlVKScZ/kCnB1
X-Gm-Gg: AR+sD11R8Fs+FKYygHG5z7HhLnfCFDhWaoq/MbYXQgHPBrYdZYmRdgCVhcTZWa5cVF7
	xeAVVBYfCW1lkaEIo8OCVBljpeiT7G2VDuMGLqvYCQUR7QJkVUrz2WFIFkDtSE/zYIuHCsz8QqD
	MTcL9Cqud8MafWou5TfNmqbNfoaPBs65/5mIEh4V+yX5T0keauW7WogDSl2hI8YR3IOwKoI8hjZ
	7PIYAmdCj16LhwXiPSVNQsawjVOwxkdk4BINoqEESAUi0IAYIYOiNBAkAq2+kR18kmOpdF4P2CN
	4l98VUjYXvXVesYb2uThjYeXKy4s6MjPVJKralvLywydFPxdpJZ4aVi9ej45s1AZfiIR6OwaWDZ
	Zd0wyGL/jHimfbt91QPrLv/25rcj2kF7vhVNBsYo2bg==
X-Received: by 2002:a05:6214:4014:b0:90a:804c:325a with SMTP id
 6a1803df08f44-90c5e984419mr106287766d6.13.1787212386932; Thu, 20 Aug 2026
 00:53:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 00:53:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Aug 2026 00:53:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260818092909.DBA151F00A3D@smtp.kernel.org>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-2-5298f42d49bb@google.com> <20260818092909.DBA151F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 00:53:06 -0700
X-Gm-Features: AcwNN1WB-tnpCZT-uPr4BO2Hn9hueJ3F68Yv8vagfQAHyYOSy_v0o3BPhF3IvDw
Message-ID: <CAEvNRgGFy39FmmVQGLc0SZkOGuYg5rXhKd2Ah+FhaSwc13zQVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: SEV: Drop page refcount early during RMP
 fault handling
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Dropping the page refcount early introduces a race condition w=
here a concurrent `guest_memfd` invalidation can trigger a false-positive '=
Unexpected RMP fault' kernel warning.
> --
>
> --- Patch [2]: [PATCH v2 2/4] KVM: SEV: Drop page refcount early during R=
MP fault handling ---
> commit 7d0f356d8592ce1804052b0fdb61fccf3a11ecaa
> Author: Sean Christopherson <seanjc@google.com>
>
> KVM: SEV: Drop page refcount early during RMP fault handling
>
> When handling an RMP fault, KVM retrieves the PFN for a private GPA from
> guest_memfd. This patch drops the page reference immediately after retrie=
ving
> the PFN instead of holding it across the entire handler, and adopts the M=
MU
> invalidation protocol to guard committing anything based on the PFN.
>
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index b2738362a928b..b34b11d7f8fad 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>
> [ ... ]
>
>> @@ -5030,18 +5031,22 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu,=
 gpa_t gpa, u64 error_code)
>>  		return;
>>  	}
>>
>> +	mmu_seq =3D kvm->mmu_invalidate_seq;
>> +	smp_rmb();
>> +
>>  	ret =3D kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
>>  	if (ret) {
>>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for p=
rivate GPA 0x%llx\n",
>>  				    gpa);
>>  		return;
>>  	}
>> +	kvm_release_page_unused(page);
>>
>>  	ret =3D snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
>>  	if (ret || !assigned) {
>>  		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry=
 found for GPA 0x%llx PFN 0x%llx error %d\n",
>>  				    gpa, pfn, ret);
>> -		goto out_no_trace;
>> +		return;
>>  	}
>
> [Severity: Medium]
> Since the page reference is dropped before this lookup in
> sev_handle_rmp_fault(), could a concurrent guest_memfd hole-punch drop
> the file's reference to the page and free it?
>
> If the page is freed, the RMP entry would transition to shared/unassigned=
.
> Could this then cause snp_lookup_rmpentry() to see the page as unassigned
> and incorrectly emit this warning before the mmu_invalidate_retry_gfn()
> check happens?
>

Yes, this can happen. I'll also check for invalidations before
warning in the next revision.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-gmem-no-=
return-page-v2-0-5298f42d49bb@google.com?part=3D2
