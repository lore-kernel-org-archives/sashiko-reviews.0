Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F3453A33
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764650; cv=none; b=m+EcQB1pqWjSUi3amPUglkTux/LFr1I8jveupjTURbG1cBsR9lE+icAfxas5zodWQQ9SsFEoTOtRZcT8c0kc+BG+OVoc2mcp1JCrSAozrsQUbDBJ4CmPy02qSvcQyQGx7hZMY7rltMoNjRqaFLfCWzCYGkBPSOMZy6QHMFtunak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764650; c=relaxed/simple;
	bh=+PWwCAxLILgjH1BHOxwFwcwG08ux2y9quV8YRSFgmMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rBO0ZDUfTKVhxggcm+oco8i6IxfE4B6ssC5aPuf/7y5ZzgHuypI7dUvlgMabaUBX9eweSfgqARc4vLudkGFZTv3by3hZhNc6L+NFZUI3cWbL4y8HjzjdlHzWRlY0i+SK0dTlbWuwifjcI86xGyybez4sdvWu9WAIn19t3ZFOKBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JvasTfIs; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JvasTfIs"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1558864a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764630; x=1788369430; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0ahfTR7945TLMX+OKhlYErwamPWxkVCGwYwu/m0mdI=;
        b=JvasTfIsgLDuFytrgpsG6sawnMS60GQLRglczy6SuG3RSscJewPGO6C36pejBntTIJ
         488SlsmN36BAAOwmbKXD64HAZiOierQm+2iCzx8V22chRdCbLEpwSiE0njJeWeyqQTqI
         I0RhW8DJMdOEKyqqQEHQ+m2XWQtPrKyjTaQn6Vb9HSPUHGMiNUOKGl9JbNYcfDZIJdnp
         PLZ124R2HwytlHUq/tU8RIL3KQBpRYR0vHsXJ3fRf8pb5uG7mNv2hi+vOvTJOKOfRPOJ
         Z9H79POzTO3RvyWt1IBTaMos7GzYfL1PbUkJpZ6MT08QwXftO+snGhyg6o0kJYvB+Alb
         llpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764630; x=1788369430;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0ahfTR7945TLMX+OKhlYErwamPWxkVCGwYwu/m0mdI=;
        b=HzEp3uOiizmxxb47BQv/+i3BEZyykObSICw/dDnvwWwq+EowmUZ2PomZOjSNtW/8Ut
         msCYrMmOLqf1gI7U1g1J50SGCUNLS0tMOzWgWCT66n+hl72jwxdxoBQU/IJKh2/Ps7Cb
         KE4ZvPeeL2Xeb7l1ab1yBO7o5roZSOD3ATOZHs5wblXi9hheuse1+FFoyErwbYHx8L7G
         nRqLMAEnmSPjiauweM6IyqsMiEwJOP2LT7TZQRg5YsDY7atLbhLFicTyax+E/gSWAZYG
         ELqO6h0d1kxF7pO9BxEbCH5dVavwjCvdMBYinWyo7nJA9xHRKc4XH5mxAJUh09ByjXOJ
         X5XQ==
X-Gm-Message-State: AFuF++n+ELbud7LjLKHuy1nQEljrTbACBgNgji3w+Hby7B7r49evLk8w
	5HmdcWb8uTTmKtVa+vXdkt9IkJlhanNnVmNPI8tdb01jZEwuzg7dztz1D4Uoxz5nJHXrr66CbQH
	URHru79j3PCxFpFq7d9Ugg0xMLlq0xxwbSDk2W7FZu7qdGNSKqntQSTsOAepDrim6azV3lLs5b3
	wTRTyHoU0bWyiMjAjjNcIzO+jhmgX6tYtV+vGEHokLr+JqlrWw
X-Received: from pgna15.prod.google.com ([2002:a63:704f:0:b0:cb3:9a4d:501])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:bb0e:b0:847:8acd:747c
 with SMTP id d2e1a72fcca58-85374ebe486mr14183739b3a.13.1787764629255; Wed, 26
 Aug 2026 10:17:09 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:17:08 -0700
In-Reply-To: <20260826170506.012231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826165154.766699-1-seanjc@google.com> <20260826165154.766699-2-seanjc@google.com>
 <20260826170506.012231F000E9@smtp.kernel.org>
Message-ID: <ao8flASJQeE8iMKz@google.com>
Subject: Re: [PATCH 1/2] KVM: guest_memfd: Gracefully handle xarray errors
 when binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 26, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> 
> [ ... ]
> 
> > @@ -654,7 +658,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> >  	if (kvm_gmem_supports_mmap(inode))
> >  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> >  
> > -	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
> > +	xar = xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
> >  	filemap_invalidate_unlock(inode->i_mapping);
> >  
> >  	/*
> > @@ -662,7 +666,12 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> >  	 * not the other way 'round.  Active bindings are invalidated if the
> >  	 * file is closed before memslots are destroyed.
> >  	 */
> > -	r = 0;
> > +	r = xa_is_err(xar) ? xa_err(xar) : 0;
> > +	if (r) {
> > +		slot->gmem.file = NULL;
> > +		slot->gmem.pgoff = 0;
> > +		slot->flags &= ~KVM_MEMSLOT_GMEM_ONLY;
> > +	}
> 
> [Severity: High]
> If xa_store_range() encounters an error halfway through the range (for
> example, -ENOMEM), can it partially succeed and leave some entries pointing
> to the memslot in the f->bindings xarray?

Something tells me this isn't idle curiosity...  Assuming Sashiko is correct,
this as fixup?

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 1d2de9a1bc3f..323159c9b5f3 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -668,6 +668,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 */
 	r = xa_is_err(xar) ? xa_err(xar) : 0;
 	if (r) {
+		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
 		slot->gmem.file = NULL;
 		slot->gmem.pgoff = 0;
 		slot->flags &= ~KVM_MEMSLOT_GMEM_ONLY;
