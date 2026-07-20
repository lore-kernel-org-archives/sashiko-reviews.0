Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98E842A80
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583513; cv=none; b=txwvIFRZWFNUDfJan9g+VlB5JhTFI9kwPP33WNn09ywsPXI64i3xOrnW72D+JWD96XS6/SbhhrU1sE/BYDKxND7rTFPCKItYic/0RaU6pwOc2ncFcq28E2Qz5nJQbzOEeHm7Bf0A78voeWqTj4HS1A2pumiZUkIe7QTFD0z0Ikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583513; c=relaxed/simple;
	bh=fgqOdfqGehyPp39uBRzhkJKpjE04+TA6AHiAA/V8Uq4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EDkhetze07CDD6U/UWujrdzj3VVGALKF5mk4+Kx5/qiCWeC7g48UPpcKqVXRyG76w6Crs7FftYmjWK+51pz/Rr+inpI4pt23ebqQcnU1423yUJSzxLZdNTas/jRqcOviPQx5YBmuE8wavCLQdrD4NSTAGFIAyzFvXrpWOweyhMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GoCMH67g; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GoCMH67g"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so76775965ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784583512; x=1785188312; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kb+H3gD1/z5LwqMW5Zz4TLwHZH22H10KWNrwvGv21eU=;
        b=GoCMH67gSxGQ0vpczBHr2xiJl8tgxbBemIejeTV/eIls44Bv07Srk9dwm0nWhXiU3B
         EwSEfZAT1n56QVyLb3rUi1h6UAyxpR3Zw+8CqK60yG64iwHQUY01t4OPt6z64MIRzVu1
         aNhd9FdYd13YpM9DgVjFo7mAHCygnqkSE5R07M8EvxWceS7bz0GF4bDdnrBv0ix8ECju
         chbGVQPMNNcwuXHmQ74+BgvQGA1LNdfCdFSuuszOc9+dHl0UaSFScERlyrpyqUUcMLbo
         FHU3kNPUOySCoNLslogP10DBJLmiLZmo1QpfC6UfRRevcWF/wlIe+A0t+27rwp68cZIw
         5erA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583512; x=1785188312;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb+H3gD1/z5LwqMW5Zz4TLwHZH22H10KWNrwvGv21eU=;
        b=JkFcO+sqUBLtZo12U6KjK1SoZMg302W0NeLq5tubaeYAgDmbve3NHNNIWzQiw7TXUl
         MIBnEpsmgQ8m3sKsE+pyh8LSTWg4H6ud8Ctjg3fsgljJbi59b5Yxd9N5eRGf+cmTZj7C
         MJT510HT/0HLGRxM6shQevbZzxmrUHzamrSHBnzY4q0Zunff394DDOGZ8SKWZsFh7RTQ
         6+xqFyoDNXsZjgmiz0IJKb/r1K9ac47cpjoVzihU35MO2KV/li3kgVLdD4F9k9b4r2UO
         BbjC7Q8mdN7ffe0WvHGWcFrDXg1O+BkSMiOwMjQGjlngCMfEYYtYPZt7HDmnvvYK07DY
         RN/Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro2ysjoM/QjVr7SMihGzikLv4ruil/ssPzDOafD6oVnWk2qQ2brWJ73nWYgV4pW5AzK0kxpzCpblNnO3Lfwc7o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsjrzxev+84bpyliDUdIFUO1TsdzqnxDBBQmD9sPn3es/Uv1TZ
	naM+PHOKsW+Kw8G5VeMBsus22xx91JqVA/roI8qvxbqNKZuEuP06EQNs8/R7IlIjkiSeXON1Cl/
	yDb6TMg==
X-Received: from plblq3.prod.google.com ([2002:a17:903:1443:b0:2cf:6c53:48ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d483:b0:2ca:f417:396b
 with SMTP id d9443c01a7336-2cf1f25625cmr211823005ad.3.1784583511786; Mon, 20
 Jul 2026 14:38:31 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:38:31 -0700
In-Reply-To: <al4rNqpBYy8FGKPw@blrnaveerao1>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260716160801.3155582-1-dmaluka@chromium.org>
 <20260716162900.9D8131F000E9@smtp.kernel.org> <alkTuicE2ELcakS9@google.com> <al4rNqpBYy8FGKPw@blrnaveerao1>
Message-ID: <al6VVx1rKn46ZCUl@google.com>
Subject: Re: [PATCH] KVM: VMX: Postpone IPIv setup after successful vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Dmytro Maluka <dmaluka@chromium.org>, sashiko-reviews@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 20, 2026, Naveen N Rao wrote:
> On Thu, Jul 16, 2026 at 07:24:10PM +0200, Dmytro Maluka wrote:
> > On Thu, Jul 16, 2026 at 04:29:00PM +0000, sashiko-bot@kernel.org wrote:
> > > [Severity: Critical]
> > > This isn't a bug introduced by this patch, but does this exact same
> > > vulnerability exist in the AMD SVM AVIC code?
> > > 
> > > It looks like the SVM code suffers from the same use-after-free pattern
> > > when userspace creates a duplicate vCPU ID.
> > 
> > Seems plausible. Can someone with AMD expertise look into this?
> > 
> > > In arch/x86/kvm/svm/avic.c:avic_init_backing_page(), the newly allocated
> > > APIC backing page address is written into the VM-wide hardware IPI table
> > > before the vCPU ID duplicate check:
> > > 
> > >     WRITE_ONCE(kvm_svm->avic_physical_id_table[id], new_entry);
> 
> Yes, this write (or just setting AVIC_PHYSICAL_ID_ENTRY_VALID_MASK) will 
> need to be delayed to a post-create phase similar to VMX.
> 
> The alternative is to simply skip setting the entry valid during vCPU 
> creation and to instead do it unconditionally during vcpu_load(), where 
> we anyway have to update the entry.

Won't work, vcpu_load() is called during vCPU creation.  :-(
