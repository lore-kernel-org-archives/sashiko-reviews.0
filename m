Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5C63ADB97
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784932022; cv=pass; b=Cs1nxtl5zaqRbLpDHvALddS5qrawCm9ie4dsm6vP74kARo7gWhsNXefxm/hFOD+j16cotui2S0VmkhHmqMkHkzF8hu8dS32lhTfokXTjQ/RDtXQ0IpJZCxtcnphu9fu3+I+F5tx5CGwD5yXOdtar7hg49iG4Fuj3+zBSEvbqX6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784932022; c=relaxed/simple;
	bh=l8gsbB4MNN06wOKbHuGu34rbQhV1QvndhFbTSBKkm+w=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYn6pf39dj9pSkZTrm1nvCCK6VGn5Vjc4aY+MeVb8jqqXImuL4OjDCzfTb8KX0jmz4wCx8wPyP9FlslXrIbUt/loMZNh2CmoWVe6K2WV5EW9g5PdN8JuIQRoZPTwAaannxBBKXEAwUmeGSNzmCryrK317ulXVWW3PLIpxuOQci0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wjyEID/L; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wjyEID/L"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso894938a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 15:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784932021; cv=none;
        d=google.com; s=arc-20260327;
        b=rO+9QMlNjeYP2g3Lqyolo2jZd41nCSa7W9BmgOYtYru2N8umBI8gXT3Joak1os5ZtD
         MUTlfnkJvN4fdlHASsoblAyz4dVsIb2rcBx7mR7l+oI94Fm8tmpOnndcwC5vYS5ayS6W
         GKMdeyCpRwc6mKyaOKZCss7PpiMTmL2bIiPChapFWNthi2pymvr9cCPB8kUnFoQnrU8P
         5F+5iPpJ8RjjJhxZKIKEUetCa0XH3RSBhWHfVRlg2wzTj7Q3hnCL5VMcoUADBR42Oqmr
         A1/BxBWTownfMZOMLwKPIs9+Fij5xKTk7M+RX7hV0pS77mFLdvwj28W/TOUpDBaYFsy8
         hYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=MetIniAEDCZS1PteAG9tZMTckOLASLfoWHNvNGHv2oM=;
        fh=ZkUHwcsok+pvY4ZVwsraH01EmmUB/wObUl/NNpED8OE=;
        b=APHw9Yl0QRdxH1RLtXIt+BoywXplKREL9aqlWXfYdVNwjh1+VmXxWBT/2r3oZLrWiD
         lGLFPbBPvyKd+vZh8PBVLPB9DNuolKIL8bcsrnt80xILAK74q4o2D/ue8XT2M4+cPcYz
         8egCCIqxvCb4dSUhjpndqZZ9/nfxbjZP89X0ZP4yaIvhvtvDOkxGTYkZuzJzI21O6TkX
         ZPr3hy2gTUL/3JzrX2HGqek5kHX8JYX1eEdAQZk5bKJtNO/ZDh7Yko+lHnFKFxfsca9d
         KqkCayDT5ROUogZ0TjTnfMjaRYmEbk4Hg/2QLf6MTYXskHkkkdR+2v4l8GW2arvWHiSG
         1Kmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784932021; x=1785536821; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MetIniAEDCZS1PteAG9tZMTckOLASLfoWHNvNGHv2oM=;
        b=wjyEID/L5iPj3+nLmByEtsa3OHIir0VxKXOiGbHwofzY/II6xnyCCo7gjr6NHHoUk2
         myj1zoZzI8tKVQu0WPBs8hkURij2EzwiOmH5GPRJERZSFpL6UCEwryhSlA83KdIquq5Z
         kdUmlyVbl6zeXkTfF6R4x6DtFYIEpU9cXLWrRsUaF6Krjttq8Pul3YSoEyAEMCMKdJCN
         meoUXwzkfvsIAxeQKDIW00SZxt9zrjAj449tmQvUxzYCzxowFRXU9D+UgiOC5g/XGSF3
         yQIpFAPx4FCMfK/nybX6AzVsk3Zb8tb8aWCorouzMob1g9ocI/7qz+mzmI4YGmWUE2oM
         MCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784932021; x=1785536821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MetIniAEDCZS1PteAG9tZMTckOLASLfoWHNvNGHv2oM=;
        b=N47VtMqgdLC16ZCBYipygfroxKdsU7watXf1Z+9L7/Sy5rezRCDv3jv1W5CqpbRZ4J
         ZcCNiXiTaJkDXZ/A0OlHnBRxPjLYFBLnvQ3zwyfORwQU0bczP9K4fesvHzfvDzE3QFKC
         nSEXhdxNjTZswDrHRxuKBW5yanNdwztvE2DXckqSrUPfZU5MacXLsi0KSNGG+rx9cxoE
         oPco+hOFYDwvgGlfAHcmNLaOa5/yxth6sZCNsrnyHALmEfVimmIl74+aSpf9TMuaHoU0
         p6igD2h+Zsn5lCfaghUrQEjAQtU0EO1C03+BeD8ICtx/jDbYooi1i7DRNW8qCAAuV5MY
         AEGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsqHU5z883/0TKcMl2iyk2OWZlmhZLOGyCaJ94Rs0P/eRhJQu2KR1k+P0wgpUKD35bYeist+qKRG/AhcROj4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoEHWRoL/qsQ6g2u1bDz4Kpk9cxYOAf+E6gqeI/FRwxbHwIQ2G
	JmhZkqKd5Hdi6PFEYTYLuIxphgAPGRdc+FsH5xTDHYnPbCHOdQ7kBHWIeKSV14EsYEVYg4Dj5yw
	nBRiK7FWn0Oiv+bW6BbMZVlu2j/vTrATd8D6YZ7E6
X-Gm-Gg: AR+sD111zlQSVLnDkY6LLrl57wHaCwKCCM0jsJjK6XjtQ14Ap6E1j0W+Rc3Iaj1qAwo
	h2pgDK+gd6M4g4pho9cvX2CqW7JCPceR0U2B5bbKziNYexkd49A91cVTxvn+mRoIowPSI+DVPhj
	HKrU7Q1WCmRTn9WYUTYgTNOgZ0PnfTcMeTJwCFNYI5/CQmPLn0kDqJw46hxA0069RhYpOloTa5n
	6/berdq8rnljHlZWE80SpZYuSaL2Fluis8GyHAq3UpF8xVkfEDZEsyPuEya/i7WRZAPJINnHbJU
	RDE+IYY6LnwJsu1UKRPmcNUpnz8rpi956TYWspOeh60djjkoi2jbf/kecQ==
X-Received: by 2002:a17:90b:53c4:b0:38f:a81:15b1 with SMTP id
 98e67ed59e1d1-38f1f121dfdmr2263760a91.19.1784932020101; Fri, 24 Jul 2026
 15:27:00 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 15:26:59 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 15:26:59 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <affe09f7-31bd-4d86-906c-9c6f92eb903a@intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <20260619005856.09DD81F000E9@smtp.kernel.org> <CAEvNRgE6iKBhMYM64rgvuVEOvAFyNoryzpjTtSQRf5TcrLTepA@mail.gmail.com>
 <affe09f7-31bd-4d86-906c-9c6f92eb903a@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 24 Jul 2026 15:26:59 -0700
X-Gm-Features: AUfX_mzvttvkeqF-juQumTmgnDd1Lckidkf3twfrA-bvzjcL5NrRUSAmvOW-w8Y
Message-ID: <CAEvNRgEapm67HO3VvK7ZkXy7JFrs06A6SbJGPua-nDO7pScNfw@mail.gmail.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
To: Xiaoyao Li <xiaoyao.li@intel.com>, sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 6/25/2026 7:47 AM, Ackerley Tng wrote:
>> sashiko-bot@kernel.org writes:
>>
>>> Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
>>> - [Medium] Unprivileged userspace can trigger a WARN_ON_ONCE if the hos=
t administrator misconfigures a module parameter.
>>> --
>>>
>>> commit bf8cb04a544d7b8235d73034e0febf195ab335c3
>>> Author: Ackerley Tng <ackerleytng@google.com>
>>>
>>> KVM: guest_memfd: Make in-place conversion the default
>>>
>>> This commit makes in-place conversion the default when the architecture
>>> supports private memory. It introduces a module parameter to override t=
he
>>> default and adds a warning in the CoCo VM memory population path if in-=
place
>>> conversion is disabled without enabling per-VM memory attributes.
>>>
>>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>>> index 86c9f5b0863cb..5cb73543c03c8 100644
>>>> --- a/virt/kvm/guest_memfd.c
>>>> +++ b/virt/kvm/guest_memfd.c
>>>> @@ -1193,10 +1193,15 @@ static bool kvm_gmem_range_is_private(struct f=
ile *file, pgoff_t index,
>>>>   {
>>>>   	struct maple_tree *mt =3D &GMEM_I(file_inode(file))->attributes;
>>>>
>>>> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>>>   	if (!gmem_in_place_conversion)
>>>>   		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages=
,
>>>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>>>>   							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>>>> +#else
>>>> +	if (WARN_ON_ONCE(!gmem_in_place_conversion))
>>>> +		return false;
>>>> +#endif
>>>
>>> [Severity: Medium]
>>> Could this WARN_ON_ONCE() be triggered by unprivileged userspace if the
>>> administrator misconfigures the module parameter?
>>>
>>> If the system administrator sets kvm.gmem_in_place_conversion=3D0 on a =
kernel
>>> compiled without CONFIG_KVM_VM_MEMORY_ATTRIBUTES, it appears this warni=
ng can
>>> be reached from an unprivileged ioctl path calling kvm_gmem_populate().
>>>
>>> Since an unprivileged user creating a CoCo VM can intentionally trigger=
 this
>>> warning, could this act as a host-side denial of service on systems con=
figured
>>> with panic_on_warn=3D1?
>>>
>>> Would it be better to convert this to a pr_warn_once()
>>
>> Sean, what do you think of using pr_warn_once()?
>
> How about don't expose the module param when
> CONFIG_KVM_VM_MEMORY_ATTRIBUTES=3Dn? something like:
>
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -103,7 +103,9 @@ module_param(allow_unsafe_mappings, bool, 0444);
>
>   #ifdef kvm_arch_has_private_mem
>   bool __ro_after_init gmem_in_place_conversion =3D
> !IS_ENABLED(CONFIG_KVM_VM_MEMORY_ATTRIBUTES);
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>   module_param(gmem_in_place_conversion, bool, 0444);
> +#endif
>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(gmem_in_place_conversion);
>   #endif
>

I think this is a great idea, please check for this in v9!

>
>>> or perhaps validate the
>>> module parameter at initialization time?
>>
>> I thought about this too, but didn't want to move it to initialization
>> time because this (populate) is probably the first time the kernel
>> knows for sure something is used weirdly.
>>
>> Like, perhaps the admin did compile without
>> CONFIG_KVM_VM_MEMORY_ATTRIBUTES and also set gmem_in_place_conversion=3D=
0
>> but wants to use the host only for non-CoCo VMs and hence doesn't need a
>> warning, idk.
>>
>>>
>>> --
>>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-gmem-i=
nplace-conversion-v8-0-9d2959357853@google.com?part=3D24
>>
