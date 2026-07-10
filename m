Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4FE1A6825
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 00:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783643383; cv=pass; b=LctnpuWzFq9Oxh2Fvku3LTpV66VHviDpzX0xenlMV7o7X649N2GCLgdcUfN0jAXE4OoST3gOGriqWEu0uXAgucZu1b8Brd90qYyL9o2x1vfz/0JSC5UWuL5I3QTY9/AIt//FX6zIA/q9UOoNEijpMBeLAvPirNT51RyEv4axSaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783643383; c=relaxed/simple;
	bh=BBOxaPmM/01vv+CsTj8a2UQ6N2oadeCRstpSSslF1gs=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/CWGoNBGXMzkH+o9MESMYKS5l63Pp9oqHdZ7FtRowfWyLz0rDIYFxbIgndp1ABdT/RAi+x1/dWQR40qXynJxDwULI6aHbYq7PeoiI2AjEjBz+TdsWIL+6ocYXxkP8NJm6PhstivlAbd04aoEbnrPzWxyK6zYv15CyNvpzDP0X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AtACiL6u; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AtACiL6u"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso206766a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783643382; cv=none;
        d=google.com; s=arc-20260327;
        b=NC/Hfk/ayYPN3Lpf9htDmtAcmHolUQQEAe8P6J0dfbrNA0m8ScUG5EanPuv7VUV24D
         xWP0omVvE3GPUrK5bnu7YpOLcUnFlbR6Bfi02ThKMJJeb5ttd3hZ/ocBH3UVIjC2ucEu
         QuVakEWtp121PJ1KL964XM6ot8oPc3y/xCl3tkhlURbdOI7UTpYBGgnc3IBUNMqybfuC
         AG+vPJZGER3+9MxqKDiRyJ7qnIz2I5RbR/nn67Wc7PpiSZaLQmMS6mWXb2GGLo1A5n+8
         caMikB5sw/EkePnrscxbP1lCuqlXNMkCxCUjPaQoqsHOPtfGLoNiawtqPlxa8qzqDbm/
         m+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6eKQoPNuaY1tGYHzSoxY+PT5XlE0M22tyAx+QiEVcTE=;
        fh=n/xVjRsPLSx48DK0mlLV8S98n4Bay9rv1xBpMnS6M6Y=;
        b=bNod2iNJ0pT6WzemCUurTdO4Hs7trgv/LjbyJlG31b40ou2Mlxdcr8Pu+1KiYKZq/w
         SBj3q670np+FDvR/19+Ajbbzj7tip6mgBFsJC8Tbap8EDW8cMrHpFbKeUclzQdFzKwpr
         cGegmAG1U0v5H2CbFWQIVXKuN5RU2R0gSAQthmiBLvJyTqdkv1PgY6IHam3TfGJlGk2p
         GPqZybB8VIXmqx5tZZ4eqbVtS0sabxaicPYabQeczbkC5lujrf6Kpjoz2uh4GNtTNJxY
         3xn+OoJM1o/4Rh0uUYyG2e2xh6R51U6bJ+y5WfVqxNiZBAwM0HtsiCPr8rpBSLFoRBpx
         r7QA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783643382; x=1784248182; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eKQoPNuaY1tGYHzSoxY+PT5XlE0M22tyAx+QiEVcTE=;
        b=AtACiL6u4FrxyzGqwVeXvp7PhZ8Qoa1z1yKqgFuEXr+uv4p3pUkJmSU2E605b6AjYs
         ScxFuiY8+L3JcfsgT2iBfHGSH7ASuAw3uTheCZWvuBh3L7JPy+hEtDEK2xZAf5FjHAKj
         SyTqZ0uljGJ2gG34XLr6q3VrIsIVxXY1Pqoxc+ZfNkUoQeUHc3LML6EIFpg9warT6/y2
         /tN33uuAsXRbOCicsJe8+RAPLTj/oj2n0xJ8wd4edOAJQvc4NAC0E0HbwRewQguYeQVb
         99pWf3LOKLsN0IxDupG16pskIdIwXD2q10WB18FEqmlv7FAFqISvgOPoNcpZ2zOgJv8I
         b5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783643382; x=1784248182;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eKQoPNuaY1tGYHzSoxY+PT5XlE0M22tyAx+QiEVcTE=;
        b=CAqKCGk67i8J7OL4ZWoRI1W06SUV5d9X+fdpgdwz09Z81dFvc23FALXFt09WdT6SNg
         2H1rrMpECN18fjPapd0VitQo5WPIln0B/uao0QSKBSMXhGpVu3YWJoEhSG5UsFw/kwkU
         rYLCn6QX5p4NLHAjOH2kOQeLsUpK0IjVP9DyMYwM+El6YGMyT3CkrxzBmiVWk5uHfV3R
         S0JmKNJZib0KE9jLlWfhopul89CLpBH0OoZDlF7Xj3YUVoGB6FMdK+d+vNJsDQC7rBDa
         gftlJDFkbhGqm4h5DjyS+O0Y+H3FXb2DUcSuPbm6qmO97saB1qeZ8tihA20bH+vsVeV+
         oJjg==
X-Gm-Message-State: AOJu0Yxoq0LU1BuqZRPl96Y+509GRgCXuDUgK/IkQPXuEV5h2e0Wz8+s
	5d45DR6jSf+UKJ38oa3NjjYNeZRlgsA0gdVLq4D3Y40B46DqSj6y+/tx+hbIVUqQhSj6Jp+MDRM
	UZep9iHh4vNDPPUev1oOGymqYPK24UYd3oWxoL4rPMQkS3MQGqu17VvY0lmQ=
X-Gm-Gg: AfdE7cm3pLsPcZDjsB9QxZ4+OnGYKr/xKeeMUm2OICvtLIz7Ac/pVI6fwZGs/+JI2VS
	N2QPxBne/t5fPmrc0kEanOU06x/U47/DcGnfQpKW97vXxGg4aZjT8fN5kg/l3SixwLLwCefbq3m
	KJJZtAq8dRh5vJrf69VqKKY0dG2lGy+jLB7+qggexKPPS6yYi3U1ingQscRmHts6nGNli5wrXMQ
	xPubEwAFbchBS2epGcPZJs7tqAlarDqKdzoJs5ZtCGSF4o3KrJO77W2yfVnqpcKar5rN4vSURI5
	ADboWeHfANjEIeMekJhIJpFGw/BT51+BteOFic2MxGrFvSicharO6pYtV+dawF80GtMl4A==
X-Received: by 2002:a05:6a21:39a:b0:3bf:9abb:a8be with SMTP id
 adf61e73a8af0-3c0bd0f9e0cmr11588986637.41.1783643381236; Thu, 09 Jul 2026
 17:29:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 17:29:40 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 17:29:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260709211523.8BE3F1F000E9@smtp.kernel.org>
References: <20260709204948.1988414-1-seanjc@google.com> <20260709204948.1988414-18-seanjc@google.com>
 <20260709211523.8BE3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 9 Jul 2026 17:29:40 -0700
X-Gm-Features: AVVi8CeC7912GNUZ12uLBsKZMA9Jkkk0PAaOu948lFfSF_ZlWtbKRgZ3tNU-gS4
Message-ID: <CAEvNRgEyefHztOrhpzZ9cPjr_Rc1XkfXE7ak_WX2P_=t_JZJSg@mail.gmail.com>
Subject: Re: [PATCH v4 17/18] KVM: guest_memfd: Align the gfn as well as the
 pfn when "preparing" a folio
To: sashiko-reviews@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [Medium] Aligning GFN down without validating memslot boundaries introduces host out-of-bounds physical memory access when preparing huge folios.
>
> Pre-existing issues:
> - [Critical] Concurrent execution of KVM_GMEM_POPULATE and vCPU page faults allows unprivileged userspace to trigger host hardware crashes and guest data corruption.
> --
>
> --- Patch [17]: [PATCH v4 17/18] KVM: guest_memfd: Align the gfn as well as the pfn when "preparing" a folio ---
> commit 5debe95f8712f79807df583e8d5e927a97b4c012
> Author: Sean Christopherson <seanjc@google.com>
>
> KVM: guest_memfd: Align the gfn as well as the pfn when "preparing" a folio
>
> When preparing a guest_memfd folio, this patch aligns the gfn as well as
> the pfn to preserve the effective gfn+pfn pair. This prevents a mismatch
> set and unintentional guest crashes due to assigning the pfn at the wrong
> gfn for huge folios.
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index cd7a795834cb6..4082cde3f3fca 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -87,8 +87,8 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	 * checked when creating memslots.
>>  	 */
>>  	WARN_ON_ONCE(!IS_ALIGNED(slot->gmem.pgoff, nr_pages));
>> +	gfn = ALIGN_DOWN(gfn, nr_pages);
>>  	index = kvm_gmem_get_index(slot, gfn);
>> -	index = ALIGN_DOWN(index, nr_pages);
>
> [Severity: Medium]
> If a userspace caller creates a guest_memfd memslot with a base_gfn that is
> not aligned to the huge folio size, will computing the index from the aligned
> gfn result in a misaligned index?
>
> When passed to kvm_arch_gmem_prepare(), couldn't this cause the iteration
> to go past the end of the huge folio, resulting in an out-of-bounds host
> physical memory access?
>

This sounds like it would be a problem. We could perhaps leave this
until huge pages are supported?

> [Severity: Critical]
> This is a pre-existing issue, but I noticed a potential race condition
> between KVM_GMEM_POPULATE and vCPU page faults in this same file.
>

We're good, vCPU page faults can't happen until the VM is finalized,
populate must be done before finalizing.

>
> [...snip...]
>
