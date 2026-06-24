Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E072DC789
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 23:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782344871; cv=pass; b=LrnMBSqtCj7p7ZCG2l7/VHNyL4CKF2N2NQnlG7wLJEivtDwx7WUPmbEuNIRQhCaYnOXPE79I80bAOp8+ABe5g/UjJW6czllLRBANHIK8ExgwR1lBMjBfAFuQUNeKp7Eq4IM/taPl37K9wDaS79wg3OM6yvUO50JaRedqg+f/7JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782344871; c=relaxed/simple;
	bh=BOTs7ndZFpsyfsR7Xd704fb0PFSbUEVOoFzPWcbnkd8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkYnfQFQW2OHU8LNmIfHtN9XQm2aqL1olKEVfU6ogdRI6jKwl3cSCT+/RGglJ+OJZ89zbsCe3Fk4DK4Ay3TVfJySxl51yxKjcx8vERKIq+hSnuub7phCP7dm3+9NY3FaOA18SjbSzRA70jUju2ehel1rsiuxjsil8gDp03wliXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eg6WmlOO; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eg6WmlOO"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13986d61b4eso999698c88.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782344868; cv=none;
        d=google.com; s=arc-20260327;
        b=cQ9eKS6wu1BpKtHZZiVk1X0HKPjCS1lJiCO3D29Z+OMCgbhoWj95tarMDxhmj8ltau
         RSWJlA4gQGcPTpNP0w7Ff9SV6A4xjRRJajDin6eI7y8yl9tzib1G6wsFUSQUfXaEb5Za
         W+DRAr42ow5SWmz8S4/EgiGXVAdKqJg8zeR8cfQhJRER5blO/0vKuvhZ/4vNUd2UFcnO
         B6fzWdfDa/Owd82kSjIWbnAkBiXHxNuqDNoF1qc2LxK9BMfFNU1Jw1w8Fls1lnHh48PA
         WEQ4Etd8k8YspkHKEBqBXTX9ObME0l2KSSbLhGZV1k9HFCZeUsZwVpRXo1OtNyBzKq0Y
         vzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=18U+I3MBHpVGWp0B9SjNPE91pyZLnJEIxilKZScMveI=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=WZkkZ/XgMia4HTPSQtY0MJ9At3Icn7dgGo+gfzayrjdIXfo3k3MNhYjEjRpnGHo5ny
         qEWcZtITDx0Tym3gvjcxG/2wv9n4lGXgrvvuxuySUPTNyd2++GmyB50MZ7+a8yObUTKd
         2HabXFHbycajnp4L7WsgxOdm3pwqdyP0uoDip2dNmGS73NMF1mQzAaW4zdPaBg+zZIdX
         9JgVN1Bdj77jmtgNaJRj4UgmUGKmnJtm8Cz8QVuBL1kOX4uC6hkjV947wDv0tf8m6id1
         3ANqCpwGbGSbpqAhH3cZB+SMJDWayW3e+RAP5H0Mf1tgVhwzCGWIsOVCdcYW69tqNqnL
         mG2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782344868; x=1782949668; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18U+I3MBHpVGWp0B9SjNPE91pyZLnJEIxilKZScMveI=;
        b=Eg6WmlOO4VE97IZldEkAvldRLvfIZFw9UiC1pLsaJ2WTSl+5OpNzcBFWBOnvO4vqNk
         h3Yjfc5XQCVZp7Nsp3zqL5cexE86QHJyE919ArbWlg6/fnSog0ycK8N/XETOgzWg/UaJ
         K+dnBe3gHH+gGsKJjFVWQfpt/x5xz1miIwq/t43l/xSdL0nkwiYyKECb2axaiq/BV/ON
         7LOYx3K/oTsVMYmg/HDj11ncUaqT9dQPPxF0ome/xWtYHXRb+OHhIgCPlHmfr6NoeIpz
         ca+9dJOcstIRK2kIn8o+WW9Q7cV8waWZKzD7KrOIlIhY4tI95+ncCKqhwlf8cR2dNpW0
         NpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782344868; x=1782949668;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18U+I3MBHpVGWp0B9SjNPE91pyZLnJEIxilKZScMveI=;
        b=FrzIZ0n4aoFwS2UgSk+sNq+HCpskogpU0sLkc6vVat2W1iQcbPCkByM959LBm8Ex14
         ecgRRoY5ELRvgzbmy0Ic1/N137ap34EHoscqAC20HhAfTE7Ec1kzvRUqVPv42G1v/Bw0
         xba02kpuK7QHDB1jWmymemQhvAbRaO6ThtxzMOfWrbrsWBU9RSCnbTEV1dLfMTcsC+ZW
         ZBFfe/Ps0ykEKoTRz3xITwSXb29mLEbfeFYzgNKKmiOTNrQnJOYnGqwfgsiAxIjRj+V/
         Vkz7Yi7p5XUHaOcBLXuvoFmtXqf39cFyY/Pp19RUHqUAm3uFeihtf8jLTwFh9i0g5jQR
         3JkQ==
X-Gm-Message-State: AOJu0Yy/5JuRezcB0v/lXXc9rYaBlKrwTJ/jRIRVYxmvSMIOPHmqFQZQ
	iRdXjKz8EYDSfaEw7TOIIUxGimbLclt8Pi5batC0Q8buOkhzRCAEtftKU7pG88RH9k6WgzWOXqB
	pAfLywytuETmkyVczs8lRvIWsD1zgK5Q0pg/kZSTMn6qwxwf9HIERXo+p
X-Gm-Gg: AfdE7cmBSpdfsj9B76VaHBwXpdTFXiRZM+UOdASsANE7/cM/b1yLh2U+dWCLNJRvTRx
	pDICpMTY4pJRJvHmNEHD3E1ECSuOlzZny2pbgZVt5twJEF11tsjlglUy3f72XZUzr5aaoxOueKs
	VDKRZIA6WidfsLi5nSNpzhIaHtqgjHWrqzJ5MSM+gPO45FHY9shzlHTIiCM8QDZlf/MLerZ6nut
	LlPGp3DhIGAU2wwIfRxcGaY7KN7E5rG24SbiQVJ1Lxn6cG16iuhaNy9UtjbOnHBTyfEtq5Mur/Z
	8yj0cAAG35UA935z6jA86VYMVr3BDOejFa4fxNlJuLk6s6LLn7vpLeqIBYU=
X-Received: by 2002:a05:7022:98d:b0:136:c565:e83a with SMTP id
 a92af1059eb24-139dbb3ec98mr135615c88.24.1782344867276; Wed, 24 Jun 2026
 16:47:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 16:47:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 16:47:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260619005856.09DD81F000E9@smtp.kernel.org>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com> <20260619005856.09DD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 16:47:45 -0700
X-Gm-Features: AVVi8CcyRflzPmfvQme9jCFwguwaCgRojeI5Y2eDu1yNbRvAkdDgWUV4du7WdVU
Message-ID: <CAEvNRgE6iKBhMYM64rgvuVEOvAFyNoryzpjTtSQRf5TcrLTepA@mail.gmail.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Unprivileged userspace can trigger a WARN_ON_ONCE if the host =
administrator misconfigures a module parameter.
> --
>
> commit bf8cb04a544d7b8235d73034e0febf195ab335c3
> Author: Ackerley Tng <ackerleytng@google.com>
>
> KVM: guest_memfd: Make in-place conversion the default
>
> This commit makes in-place conversion the default when the architecture
> supports private memory. It introduces a module parameter to override the
> default and adds a warning in the CoCo VM memory population path if in-pl=
ace
> conversion is disabled without enabling per-VM memory attributes.
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 86c9f5b0863cb..5cb73543c03c8 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1193,10 +1193,15 @@ static bool kvm_gmem_range_is_private(struct fil=
e *file, pgoff_t index,
>>  {
>>  	struct maple_tree *mt =3D &GMEM_I(file_inode(file))->attributes;
>>
>> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>  	if (!gmem_in_place_conversion)
>>  		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>>  							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>>  							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +#else
>> +	if (WARN_ON_ONCE(!gmem_in_place_conversion))
>> +		return false;
>> +#endif
>
> [Severity: Medium]
> Could this WARN_ON_ONCE() be triggered by unprivileged userspace if the
> administrator misconfigures the module parameter?
>
> If the system administrator sets kvm.gmem_in_place_conversion=3D0 on a ke=
rnel
> compiled without CONFIG_KVM_VM_MEMORY_ATTRIBUTES, it appears this warning=
 can
> be reached from an unprivileged ioctl path calling kvm_gmem_populate().
>
> Since an unprivileged user creating a CoCo VM can intentionally trigger t=
his
> warning, could this act as a host-side denial of service on systems confi=
gured
> with panic_on_warn=3D1?
>
> Would it be better to convert this to a pr_warn_once()

Sean, what do you think of using pr_warn_once()?

> or perhaps validate the
> module parameter at initialization time?

I thought about this too, but didn't want to move it to initialization
time because this (populate) is probably the first time the kernel
knows for sure something is used weirdly.

Like, perhaps the admin did compile without
CONFIG_KVM_VM_MEMORY_ATTRIBUTES and also set gmem_in_place_conversion=3D0
but wants to use the host only for non-CoCo VMs and hence doesn't need a
warning, idk.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-gmem-inp=
lace-conversion-v8-0-9d2959357853@google.com?part=3D24
