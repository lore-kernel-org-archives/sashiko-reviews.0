Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3559C3A7587
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161309; cv=none; b=QLUG528dA1kJbvk1MngmOuqBnztt1vwUZdgivSXfKB/AUFfBoE8ZwPpfGd7yS1pYSbLRtUqffbZySnMtG5MyFLSgk+Jf8sznwdp7urJyl52pJ7WMlKjKxDBzK9iub+FJnHPqoSZN8Hip4JgT8zvyw8bTntnT2Il2c3xFoofKJvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161309; c=relaxed/simple;
	bh=5K+iPpF8DDgclPsRQeL7zsBmY6cYvKrH6RbiTc5jglc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fv1D9ryvdssDxUrZTaok5QLAYfvrNgg4dOIn0l4KbYleEFyF3QBzgWcVDQWIdZC3/P7tVrxmNIerY6D89GbIh1KSO76CNIdJwK1l1UCG+RIOe/DVkKBu57IiMhijX8m4e+U7FCWyDIyQGoTEANvLluc+CsJ+rSXazZkN/0AzNvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AlpNn0eP; arc=none smtp.client-ip=95.215.58.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AlpNn0eP"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=5K+iPpF8DDgclPsRQeL7zsBmY6cYvKrH6RbiTc5jglc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790161299; v=1; x=1790766099;
 b=AlpNn0ePhg6p+jtXeSS24SkO4mVIyA+SgNLSsZSHMpscJvuimYY7GDc8HFU4owzMTT4n7IwK
 n/47ZtCBuCIynSeEp3yYmkem97LGST152j5/7dnomKsaiHeYVWXqBRN/GarTf9HS0jV1MH/o4DB
 6P/5x3ukL8wFASJXg3jTEltQ=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 66dd3016d87c032c;
	Wed, 23 Sep 2026 11:01:39 +0000
X-Mizu-Trace-ID: 66dd3016d87c032c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8c42da963so5264e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:01:32 -0700 (PDT)
X-Gm-Message-State: AFuF++mK0WwWpDIfG05LXjNToskpZL2jdIfSGQ47sFO6hUWeYOoaPDGT
	zjDQQxx9Tvndv45VatB8U6GZTzDT0zKZkrMO7Dpt22BtaLr2CIGaYksMXqXG7a/BGSBn0l+8UB1
	A80hH/KTKSviWqqPTJeL3r9/BdGtAuhmSkxiLCJYY
X-Received: by 2002:a05:6512:648a:b0:5b6:4ad:d6ba with SMTP id
 2adb3069b0e04-5b8d91673a2mr101791e87.15.1790161291757; Wed, 23 Sep 2026
 04:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-7-787bd3bc7e3f@kernel.org> <20260922143157.0E84B1F000FF@smtp.kernel.org>
In-Reply-To: <20260922143157.0E84B1F000FF@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 12:00:55 +0100
X-Gmail-Original-Message-ID: <CA+EHjTziT=qEvCpjGriVhC5g7=nyQNfvEQenw-JXSJuWtJwTRg@mail.gmail.com>
X-Gm-Features: AcwNN1VlY5oTU2GdC6G6YKOfl5LmibKipPAp5RDM2yTy_ZaXda-g-wUfh5go1wI
Message-ID: <CA+EHjTziT=qEvCpjGriVhC5g7=nyQNfvEQenw-JXSJuWtJwTRg@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] KVM: arm64: Size the stage-2 memcache from the
 fault MMU
To: sashiko-reviews@lists.linux.dev
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 22 Sep 2026 15:31:56 +0100, sashiko-bot@kernel.org wrote:
[...]
> Does this decoupling of s2fd->mmu and vcpu->arch.hw_mmu cause a spurious
> allocation downstream in kvm_s2_fault_map()?
[...]
> Could this lead to an unnecessary allocation in the ioctl path that might
> spuriously fail and return -ENOMEM to userspace?

Sashiko might be right about this one, though the mismatch comes from
patch 5 rather than this patch: patch 5 moves kvm_s2_fault_map()'s pgt
to s2fd->mmu and leaves the allocation check above it on
s2fd->vcpu->arch.hw_mmu. Could patch 5 switch that check to s2fd->mmu
as well, the way gmem_abort() tests pgt->mmu?

This patch looks fine to me though.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
