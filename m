Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397342EEAC
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 22:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239645; cv=none; b=IHuyhWYJsrgvU1ie/g3sUTA8pe3qI5kXWwA1vYpJ7kJPrSo4r8aDWzCC11EBwph2oaI3bxohqNqzn/KHPF3jsEBGDicUhC4ogZ67YDsKkZ+YdFBaUstY8ZVhPMN/7+LXV7JgERmHHSJpIq+25AylJTyrcpI0WT5X4jaITj6qzPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239645; c=relaxed/simple;
	bh=V1qsBrhvz7v25JC3ijOWpLP9V3s8Bt+LPOK287APpMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLX9g9nGvEwHb7HAv0Q3Pt2+o53QBABL3vstKCdiQb+PQTtB+ZK4S6Vqh/P63PIEhK45hOeUFibYQyBGtRXWJuNphOWLBSoXpbOv24MVKZ3Vzsw3LODScBywjfLqp+gSyQKd7W82YitL2ZotAEbF9k/Czn6pWnyB7HvQZh01Gd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EWYbZVmH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EWYbZVmH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e2e4ef20beso21835ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 15:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791239643; x=1791844443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OvVZJ9mVxE/RIGdj4jq/yHj7p5dyaauFgOlJsChu8aE=;
        b=EWYbZVmHVkXzgyKb+13nYc6/jhrF2HesdTtHJ6ARVNMTt1ABhmPl/fwqPmyxJeLRJx
         sA3mO3Z6Jf0Jkg5Lot6dP5jk50ASaGG2fmcRooEO57GxCSeEqq99Q9SURuRVTUabsyH7
         JU95I3wE9Aq2OCe7JeMYv+1ZGpwF+gbCnwWz+Z1/OeLNoZBWGsdAHPzOj5F961+oxlKW
         PyeLNoee6o3G1rNyENgsINAd6pzJGHuGWxAmdjMKMR/ekpvCRGR6D9qn2CgHx+/CLmLy
         vM6Z/ZuEYDQPL+ozgjrUFiIlSmrUqy21b6MRabcoQ0gHdUqzNV3m7RbLW2qPRshRMadX
         Ez0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239643; x=1791844443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvVZJ9mVxE/RIGdj4jq/yHj7p5dyaauFgOlJsChu8aE=;
        b=K/ah67G8MM8GdPvh685h0WQmBgQqpa0Dw7RMEBShTWpF0b+JopQMiQK2RS4svQKiQJ
         vpb5uqRAy4tM+HZ+6qn8gLfWxcP5vhjaxMeI3RBTg1dx+34tcboDgaApQgGUMHIfhUrc
         I8tKB3xazCNhU0Ptb0lRk84zZDHJ4+saUugFGd8Q10d+jTctzs/T/M9Fd0cc5iRdiYMp
         9zGpyFDfovl8+0JyTmEHFZlZfkfUjC0vTjDxBnzkeXKxIzG1Etvy28f3znTIUKa5590T
         5dwgxYkO5QfNJ5HYVe3vqSJ0zQ8ZhGJFYG3CJzrXDJckci9xVpN1qroU3/rsTSBZK1Mf
         5tdA==
X-Gm-Message-State: AFq9FYJL3c4azblz9d4f4pXOagnKsUYRfES4qxjXLGb2dQN3KRV3vW8p
	TzrbLMbHUJ8IQhWNB5+Ecv8oT8ly1CkVLWfmXYqSTjKLxAuzjtCBm+nBWdV+IAAPHF533wceCC/
	hO3uvjQ==
X-Gm-Gg: AYBFou36R1h4aCvnxwJmcFUfr0ub+UDji58GyNsXbJJIC8QSUDT6iZ6ahZ6Zi7Yel9k
	yIacOh3wXewxb/xDVfGKX1VX72G2ONktfrLeavmRMGQFjBoDD/TRI+MdSdGfXXgo0zbtIQPrhxr
	JaXZBvnOY2d8FaqxgSWspvdpwcoLoutWZVBubd9TztBzHIOJLjIR+idevB6ORsgKYRH+wMn1vXt
	HXJca2gOI0jq+8wxHLhqdFi9HC+137GEo3Gojok/QiL0rSkL3WNDqzMCE4vWMNcrp734vwCqJy5
	2fnL4pEsJC5Y/4rEYIslXJ38AovpBZseYfyX6HHeAAOsvYnBFsCaQsvMG9+Lx6BnPuJinSbxwGk
	/npIHUWhVxsB3Bpe36XYLTbD0Fv5JGvVE8XFRzJz5Hkat3w15sP6RN99rUZ9aEVaLTA9JA4iaN1
	ZHCJYZTR8K9cU/nz5tHELx3PSraVm3SJ+bpzm/+lolCbnxMALrHndzfrZPoapAR1B+VuyKu4aH7
	iia/yr8svEFWmmeMkqGFADnR7ngU45V
X-Received: by 2002:a17:902:ea0c:b0:2df:8e89:3bff with SMTP id d9443c01a7336-2e5cd1f1170mr778865ad.17.1791239642076;
        Mon, 05 Oct 2026 15:34:02 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cb7cb3sm1489772a91.11.2026.10.05.15.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:34:01 -0700 (PDT)
Date: Mon, 5 Oct 2026 22:33:56 +0000
From: Lisa Wang <wyihan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v15 10/23] KVM: selftests: Set up TDX boot parameters
 region
Message-ID: <asQl1OrH2vtnhHS4@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-10-7c62a5d8a992@google.com>
 <20261002091329.9ACBE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002091329.9ACBE1F00893@smtp.kernel.org>

On Fri, Oct 02, 2026 at 09:13:29AM +0000, sashiko-bot@kernel.org wrote:
> [ ... ]
> > +	/* Set parameters! */
> > +	params->cr0 = kvm_get_default_cr0();
> > +	TEST_ASSERT(vm->mmu.pgd < (1ULL << 32),
> > +		    "PGD must be within 32-bit address space for 32-bit boot code");
> > +	params->cr3 = vm->mmu.pgd;
> > +	params->cr4 = cr4;
> > +	params->idtr.base = vm->arch.idt;
> > +	params->idtr.limit = kvm_get_default_idt_limit();
> > +	params->gdtr.base = vm->arch.gdt;
> > +	params->gdtr.limit = kvm_get_default_gdt_limit();
> > +
> > +	TEST_ASSERT(params->idtr.base < (1ULL << 32),
> > +		    "idt must be within 32-bit address space for 32-bit boot code");
> > +	TEST_ASSERT(params->gdtr.base < (1ULL << 32),
> > +		    "gdt must be within 32-bit address space for 32-bit boot code");
> 
> [Severity: Low]
> Does this assignment silently truncate the 64-bit vm->arch.idt and
> vm->arch.gdt addresses?
> 
> Since params->idtr.base and params->gdtr.base are 32-bit fields, the
> subsequent TEST_ASSERT checks evaluate the already-truncated values. If a
> test allocates an IDT or GDT address beyond 4GB, the assertions will
> always be trivially true because the upper 32 bits are lost before the
> check.
> 
> This could lead to confusing test failures during guest execution instead
> of properly failing the assertion here.
> 
> Should these assertions check vm->arch.idt and vm->arch.gdt directly
> before assigning them to the base fields?

Will update the assertions to check vm->arch.idt and vm->arch.gdt directly.

