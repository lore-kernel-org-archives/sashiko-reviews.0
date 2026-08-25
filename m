Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BECF3D2FFC
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 21:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694862; cv=none; b=uM6unTVnqInYLxGT92H5HA3vnnXgADYHJblF5Oo7DzPpu7ZlbJr+1zvwQkWCb/gBEhmBHUnnf5ZEEeyS31hJi84CE4qHqvP5EkraWlO0Iynn6gRI/XCtaNcUCD6Xr9AT8hp5fRYTj0WjL17GvHjYfclc9ywsaqdrY3B+BbuMdAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694862; c=relaxed/simple;
	bh=XR8NWL48ttmRpATl2VS8DikQa6bsodivQLy6Un32ANs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QiPw1EerERP9PEtDDD/qeglLtG1twa5Axe5sq1fQwfbObUKeov82XE9Dl0EkRWZzXbiYeUFbQd4cSAdpwSOGjwaAxaeQa68tmZoGMMKddsou7XBS0PMgnFC+36ixQNAqTAwLPKzgoMV/8Zxi63/1xacMXszHoannw3AjEMAqiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FVzVB2hx; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FVzVB2hx"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d70d8839f0so513535ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787694854; x=1788299654; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTWHpOVqzsgigOpGCtEHl9Fp7RfetEno19tkznsmu8o=;
        b=FVzVB2hxJkojNdPB4AnHeOwmC1AysTSTTAsIfJDY56dBCtGsN+10RQIpT9LpqVrlPr
         UfUD+0mQkobk2UpLcsEIGWzNQaKeHUMSSsl/XJtsDxFP+oUyN70fSArtWea/a2jFMQ/t
         xbejNykQPtCjwitIkW1ONFJo3nREQkVJOgoWYeaIGOeCcmVlUejbqBoLGHd6i+YJJMbt
         ZZ36zJIr1kzmKrXTYPyfhl0uwC8xa7OQICb0GM71Py4XVn9L8nACTDw/teyrKbRpat3V
         0IBZlb2y4hWvUmCrFgNcIOJRjHd1J55Es121ZUaukaJVKVjnCG8l2rncT7VJqiUzwZ6C
         Acqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787694854; x=1788299654;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTWHpOVqzsgigOpGCtEHl9Fp7RfetEno19tkznsmu8o=;
        b=Jez1n+s3x9a835FfDcg5gtLl41oWGc1rfSyWsBp5T6HhAIa5QqIauOZIkZ94aj6ERV
         vyt472R64R3vQVyqKz2vu9HRcqc/YSXuUrzXnEXKFkk2T/OXCpXPttTTr36qxoPhf11J
         fg9jYy3glUOvYnxcHSC0ElD7LUWiI/uYHJYng3ocHJRAoI/s7Jnj9UhQ1aorX/PkO958
         AEQGoiJMyWP6oQ3wiSekT6/ezct8XZEF4UkLNnUp23RF8YrIt2rkxxGBnXCJ7Ael+qbD
         p96glGujKcCbc3Y+absfm0tx7Cncl8mLbketD+KxrcE4nmnYrX2Th96+q/oJEwWTrbk0
         MoaA==
X-Gm-Message-State: AFuF++nZ2EEUJqdVwmQaG4FLhC7zqRtVEaY3qGvmh4mpzhZ5VABW78sS
	G50w6IZYlthbCrswOpTgP7zZY5eMxx8frsOrsEY6Ae8ptV/CKlovivGm6U5EsEMaVj9ty4cJYgm
	t5k2mpvcetvKl9v+HZTe+RkRcCjidVLVmSLYdf9nRtaZmJvCFhp8B+vpdtv+cPHUR0/zYPpZtwd
	GNYl8igIS+22osuRRpTrLjjHGZuv8igvJlSfiKjR23R/dNIZ7P
X-Received: from plsq20.prod.google.com ([2002:a17:902:bd94:b0:2cc:e88e:4245])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ebcb:b0:2d6:3c2f:6a5
 with SMTP id d9443c01a7336-2d707b9cc29mr25705135ad.14.1787694853363; Tue, 25
 Aug 2026 14:54:13 -0700 (PDT)
Date: Tue, 25 Aug 2026 14:54:12 -0700
In-Reply-To: <20260823135031.4F6DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260823-shivank-gmem-fix-split-v1-0-512a29fb8e86@amd.com>
 <20260823-shivank-gmem-fix-split-v1-1-512a29fb8e86@amd.com> <20260823135031.4F6DC1F000E9@smtp.kernel.org>
Message-ID: <ao4PBDFO9wAzMFxQ@google.com>
Subject: Re: [PATCH 1/5] KVM: guest_memfd: take the invalidate lock when
 unbinding a dying file
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Shivank Garg <shivankg@amd.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, Aug 23, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but does ignoring the return value
> of xa_store_range() here and in kvm_gmem_bind() lead to a use-after-free?
> 
> Looking at kvm_gmem_bind() in virt/kvm/guest_memfd.c, xa_store_range() is
> called with GFP_KERNEL:
> 
> virt/kvm/guest_memfd.c:kvm_gmem_bind() {
> 	...
> 	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
> 	filemap_invalidate_unlock(inode->i_mapping);
> 
> 	/*
> 	 * Drop the reference to the file, even on success.  The file pins KVM,
> 	 * not the other way 'round.  Active bindings are invalidated if the
> 	 * file is closed before memslots are destroyed.
> 	 */
> 	r = 0;
> 	...
> }
> 
> If memory allocation fails during this operation, xa_store_range() returns an
> error pointer, but the return value is ignored. This masks ENOMEM errors and
> leads to an inconsistent state where the slot points to the file but the file
> doesn't track the slot.
> 
> Because the slot is missing from the file's XArray, when the file is later
> closed, kvm_gmem_release() iterates over f->bindings but fails to find this
> slot, leaving slot->gmem.file as a dangling pointer.
> 
> When the VM destroys the memslot, kvm_gmem_unbind() accesses this dangling
> pointer and calls get_file_active() on it. Can this cause a use-after-free on
> the freed struct file, or improperly increment the refcount of an unrelated,
> reused memory object?

Thanks Sashiko, for spilling the beans.  I've been sitting on a patch for about
a week (this got reported/found by multiple sources internally), I'll get it posted
today.
