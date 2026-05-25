Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECFF3AF64F
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692858; cv=none; b=WI4YjLiJ/fYnaqdWE7w852cM49icniFeGEirmSEik/tnqJvMxJ68+H4jrQmL4xZm5Szd0keAeyNeVgnBWYVl2mR/c4Nq1QnlCTTUj4zuygtcgL1icnjjVeL3mUWHWJQprTevpBn7Z1Tw3HsPP/6ut43vR6aiQeWerMrXZWXio8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692858; c=relaxed/simple;
	bh=URFZ1vwASMvVqdA1+9smaG7I3bKjYdtJPqnOH0H41mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dpks10hRGdUEfZNGc4NbFwmF9zUGGvSPLfoyqC0akGLf+5D/zvReW548onDzwC5ogUqv5bhxgRlmU3nguImYsdmWFtWf0wl4QmtWSdlQ6J3llhRlCoaeMcWCxMsEUgVWzqocDPq1bUYibYnNSL9XtcOgQha3kfJ/vHELQvXqyrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNWutlVj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNWutlVj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-365d8e43759so4732634a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 00:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779692854; x=1780297654; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFMw4UuGDjf0p4oj+e6tcK49mC0E+D/7wabzuRfHops=;
        b=UNWutlVjNFlOEOgprm80AujdKRT9fTdgkJiPpYJ5k0QPp6+KV+zNUn9iKFxU+oCabg
         NzsVD4HQoe0dlcN0C152J+zpgWlsHPwrsAq9Q72q5wX/0M3H8ghiquGKF8ztT4YaMYqV
         shcCHymNwNk6FEPtJePX+yRLRLUbfy7eCsAPzab34sxhcDyIYUc8aHMU+Kk+Z3lSRMuU
         DNkjwPjx7h5nOr1F1Upe98Ol/3ihwNw6vd0tIloTTeJ43XcjavQMlHCHa3MvGp0s4ywR
         SY+Bw02LyjmFi5DTwE0Op/AtZFSYsyqz9vMc2knGudPW5T63/YC2sfBJMNaKJujgIha4
         2SRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692854; x=1780297654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pFMw4UuGDjf0p4oj+e6tcK49mC0E+D/7wabzuRfHops=;
        b=jO0CHpAyNyBIXy2nOcyC05FvRA+yspPLBUjGZ6QW0zeu0bRImOcd8dXi5NxjUvQryC
         WAhSfCprxBvf8jQYmpsx0WoyRwbuz1sm77UUlkwwwAdZBqAA2ddUJJ+7tac5ojTJbqoQ
         m53hgKpiYAOhK/i1gnlMNWqCvrOCWLgNSQS0HYUK9v8vvtNcjWWY/12ioEuj0cG20Drb
         yeypDuFRhc22HmiAp2JjYY7w/Eq8NDjK1Ng78rynAWgH2BxTbytGUkqexb3UEgW9Wc4l
         mboEu1ETqbNa0Zt+VGfSGJXu8UP/FgpNCJNKNQaEr8r1pRVpGrdbYB7dex0A5su5Tqzg
         iqSQ==
X-Gm-Message-State: AOJu0YwXpevUAuTizn/aVN6sI1k86I107WTqn4kSnMAQ8tSDVFjYNRiG
	rgP2O2JYJMUaa4RQnhRSac3NiaZ/lkMHPDglqRk/gyZ1u+e4FY6oAQ6JBKZ9yWXm
X-Gm-Gg: Acq92OHJEwTL/AfKwAUVZctPtc4KyBjLapjF4OWepfC0wUMtHF2cpJ83z5esfQzfmd0
	7aaBSAMKrEerUjhBrKG/xH42nBc7+hvP+WK83HanGJhkEt8usYv13T6/ptchLpvSAmyiaPzQCMc
	Jt5wscIiToCM/mrJtXvKxpJ1NDCgy5UncrtkDsilkOKqlnCYm+P2IsvgbTMd0CDkFjqiBp+mpnt
	N5XMTzT9LfQn7wA+GrJrLHM5RnutbGf20WN4YOVkiyHjtwIJT5heOYfdlUqUi87s7Bur72pUjUP
	iF8+sTpzTUz2pYqTp3YR96bKVPnoV+YLfFLhhZhyQHo3HuQUk5LBwSkb18EhNkjws0K+mAaeJvJ
	kCYGz/GtuNv2BnYFfeUBogV4URi5WhY4TV+Jxb5N4ohwv/5OA4Zl1daisE3B35Y2deHfTGNDBYf
	0viW63h/GPASI0CHe8wncHth1hFu4/TV/HaV+KzP+mTgYP/Ob0+JLUjeQaY6U=
X-Received: by 2002:a17:90a:e70d:b0:369:3c3d:f899 with SMTP id 98e67ed59e1d1-36a6ba28e3bmr9654503a91.2.1779692853856;
        Mon, 25 May 2026 00:07:33 -0700 (PDT)
Received: from [10.3.165.119] ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm8580394a91.7.2026.05.25.00.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:07:33 -0700 (PDT)
Message-ID: <d93320d5-2974-4e26-be97-785ffd2ea7c5@gmail.com>
Date: Mon, 25 May 2026 15:07:30 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/2] KVM: irqchip: Cache IRQ routing entries allocation
To: sashiko-reviews@lists.linux.dev, Yanfei Xu <yanfei.xu@bytedance.com>
Cc: kvm@vger.kernel.org
References: <20260525035242.107264-3-yanfei.xu@bytedance.com>
 <20260525051714.485D51F000E9@smtp.kernel.org>
From: Yanfei Xu <isyanfei.xu@gmail.com>
In-Reply-To: <20260525051714.485D51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026/5/25 13:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Critical] Missing bounds check on user-supplied `ue->u.irqchip.irqchip` allows an out-of-bounds array write on LoongArch and PowerPC.
> --

Posted a separate fix for this issue.
https://lore.kernel.org/kvm/20260525070154.495455-1-yanfei.xu@bytedance.com/

Thanks,
Yanfei

> commit 8ac8d5f6cab84711afabacca6347f1ad673dc605
> Author: Yanfei Xu <yanfei.xu@bytedance.com>
> Subject: KVM: irqchip: Cache IRQ routing entries allocation
>
> This patch caches a VM-local entries array allocation from a freed IRQ routing
> table to reduce allocation and free churn during frequent routing updates. It
> also initializes the remaining MSI fields on x86, LoongArch, and PowerPC since
> cached entries are reused without being zeroed.
>
>> diff --git a/arch/loongarch/kvm/irqfd.c b/arch/loongarch/kvm/irqfd.c
>> index f4f953b224192..15cc80cde071b 100644
>> --- a/arch/loongarch/kvm/irqfd.c
>> +++ b/arch/loongarch/kvm/irqfd.c
>> @@ -60,6 +60,8 @@ int kvm_set_routing_entry(struct kvm *kvm,
>>   		e->msi.address_lo = ue->u.msi.address_lo;
>>   		e->msi.address_hi = ue->u.msi.address_hi;
>>   		e->msi.data = ue->u.msi.data;
>> +		e->msi.flags = ue->flags;
>> +		e->msi.devid = ue->u.msi.devid;
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does the KVM_IRQ_ROUTING_IRQCHIP
> case in this function lack bounds checking on the irqchip index?
>
> Looking at kvm_set_routing_entry() on LoongArch (and similarly on PowerPC),
> the irqchip.pin is validated against KVM_IRQCHIP_NUM_PINS, but there doesn't
> appear to be a check for e->irqchip.irqchip against KVM_NR_IRQCHIPS.
>
> When kvm_set_routing_entry() returns success, setup_routing_entry() executes
> this array write:
>
> virt/kvm/irqchip.c:setup_routing_entry() {
>      ...
>      if (e->type == KVM_IRQ_ROUTING_IRQCHIP)
>          rt->chip[e->irqchip.irqchip][e->irqchip.pin] = e->gsi;
>      ...
> }
>
> Could this allow a user-supplied routing entry to provide an arbitrarily
> large irqchip index, causing an out-of-bounds write of e->gsi into the heap
> memory following the kvm_irq_routing_table?
>
> [ ... ]
>
