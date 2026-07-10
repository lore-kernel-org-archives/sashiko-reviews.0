Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2281519B4
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783643603; cv=none; b=cJhdy40QdqKtbQPhKkyQixQceuLTpB+nnvCBFsW2oVj2Q94FNjxaLgWCUvaMIaK0v7W7UPVBmW/qC3AME1r0rztypj8dUHpbDgnjq1qSzROq3djZdi+V43Es4fyDseBw6VJ9R1DGKgwwdUSaqEt9m0rTHMJ5VGNIKi4TM51G3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783643603; c=relaxed/simple;
	bh=Gab9VpthtLiQjZ59zgBi+Xozzt86WLy1sK8mrxbHN0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z+qhIiukt7xLn4ZvOnXG4JJtAtcADYkCbQrxPTRKEdRhXac4UUf+XvZcf2zXZk98tmug39iO441S94YXHMIKusw6y6FNvk7Pg45SQjPt2x5P1ks4ewkjhEnkTewr8DuLTaonC3ISbKN0BfOr7FoL/xUzHK18CT3xUFErNpSdGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TQ5+dG4Y; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TQ5+dG4Y"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88fc985a65so571835a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783643602; x=1784248402; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4rIBGWgF/ElXP4CVjcXjLMpbYLhwv7WmQTJ1sHcZVs=;
        b=TQ5+dG4YTnmaxpVER5KX8gcPWpP53lgQOfzCi6c7S/65atx38FB7feVavVRVwilcH1
         TIrp35PUH/pJ3eCdEG+QUu9mAep0hTNMUKUIZwC6QfqrWvxlcmrT3AlKZfnGcPsFGZzT
         uT7ubYKcnRUcx7XGY/8GgRQoczXqO7FPoZQ/0MvtAHbmAV85f3QG4gYv/Qt4MUsedAG8
         ed96KteCaL9dkHZXXp55fBvFdHrPdftLLp5ll1fYVLoxEMu2WzU++2ukYms69ryiKUkK
         3ACyKeQSg25UBz2IXh1Y9eQdlkYscumfDEQfOWEybWJp8kUXKt5rRhB3FWg+WcrbjGvM
         D/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783643602; x=1784248402;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4rIBGWgF/ElXP4CVjcXjLMpbYLhwv7WmQTJ1sHcZVs=;
        b=pyRO4Qw45n7rCnW4AZw4Ka2qlvumY2GDwseNa+NvcWWANNjwRFZxcUvGD6WfnCw2wz
         tkbbYzfzF41V2ZiO0q+jyeymt71L2fqhKcMRVBlKSIWek4rMzEe+7BLzcNiYbeRzZnER
         JkXPbQY27trpXYIAaC2b59e4LzJQm8lnq63HWh+3GB/HR6CBlDSj7kI9Thpz6DnfHcSJ
         6yTqb4ZjVaIhgLb3I9HqxgRxo7fINzgAB0gy04HZsBIM/mCzeY3yZfSL5B1PwlsByqCs
         Y2GTC2voeeZ5BoIG/7fOinQBlW7IwraHrMCjvSnfyR4VxUSOYslnY45a1yCQwWYGrQfb
         mJUQ==
X-Gm-Message-State: AOJu0YzQ+T7hHnLZ7SSRw4bZ3OuFvoHp1EOo0EYZkoulTj7f9Pb4bNve
	ZFfx/O53lb84tp7HKxxcpOQaXiTzbL2wI2ZjAOoMjpSPa7cFdiEhxZFN4yzVzb4ghj7xpJIt31K
	vX/xVew==
X-Received: from pgu17.prod.google.com ([2002:a63:1451:0:b0:c8e:650d:c415])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:700b:b0:3c0:9c19:65a5
 with SMTP id adf61e73a8af0-3c0bd3137b7mr12161307637.61.1783643601636; Thu, 09
 Jul 2026 17:33:21 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:33:21 -0700
In-Reply-To: <CAEvNRgEyefHztOrhpzZ9cPjr_Rc1XkfXE7ak_WX2P_=t_JZJSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260709204948.1988414-1-seanjc@google.com> <20260709204948.1988414-18-seanjc@google.com>
 <20260709211523.8BE3F1F000E9@smtp.kernel.org> <CAEvNRgEyefHztOrhpzZ9cPjr_Rc1XkfXE7ak_WX2P_=t_JZJSg@mail.gmail.com>
Message-ID: <alA90eb0_aKEZgph@google.com>
Subject: Re: [PATCH v4 17/18] KVM: guest_memfd: Align the gfn as well as the
 pfn when "preparing" a folio
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 09, 2026, Ackerley Tng wrote:
> sashiko-bot@kernel.org writes:
> >> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> >> index cd7a795834cb6..4082cde3f3fca 100644
> >> --- a/virt/kvm/guest_memfd.c
> >> +++ b/virt/kvm/guest_memfd.c
> >> @@ -87,8 +87,8 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
> >>  	 * checked when creating memslots.
> >>  	 */
> >>  	WARN_ON_ONCE(!IS_ALIGNED(slot->gmem.pgoff, nr_pages));
> >> +	gfn = ALIGN_DOWN(gfn, nr_pages);
> >>  	index = kvm_gmem_get_index(slot, gfn);
> >> -	index = ALIGN_DOWN(index, nr_pages);
> >
> > [Severity: Medium]
> > If a userspace caller creates a guest_memfd memslot with a base_gfn that is
> > not aligned to the huge folio size, will computing the index from the aligned
> > gfn result in a misaligned index?
> >
> > When passed to kvm_arch_gmem_prepare(), couldn't this cause the iteration
> > to go past the end of the huge folio, resulting in an out-of-bounds host
> > physical memory access?
> >
> 
> This sounds like it would be a problem. We could perhaps leave this
> until huge pages are supported?

Yeah, for sure.
