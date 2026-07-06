Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EC142F712
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 22:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376816; cv=none; b=hMLWPMiJOfeNFydT7+LCdC+PW25+0mLlp0RBA9I6Gio7l3zyKTfJ3EupXoVk7wzrkEtavexj7WsaItwa2z985jhPbYo+peBGYlpdzG68ltpwRbyn3yP2f04WaP5BtNE23bX3MwU2P7LYHzBe5SMYcqiccsOlt6ejcRgnIBpET1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376816; c=relaxed/simple;
	bh=uT4QDVdOjCcaU39WrLhXPDiRU4uMK9+UDDLgXkn2LQo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hqFdRvsCOCsKYjn4dPW3wQ+y71WkOKfXrI2J2MpFDPGY/wj0dliIY6CVc66v5OGLH8nl7k7CKpYgSqO7k/LihOxUxWaN6tia1wXdHBKW6kG2CERMbJN48mmKAjMuhmy8OPTZ7glDC+7ZIrM51WVwKSI+K6jD8LnFwkxnGmWgWYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WxcMkJ8T; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WxcMkJ8T"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2cc6dd43737so51184585ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 15:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783376812; x=1783981612; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wJCpc8BzZr2s/adrZrnFsb3LPXSuLc1ySnbVabaHnns=;
        b=WxcMkJ8TIu0CB4R+hxnB7jDFvwq4j/B6SnGHWs71vyYsYwVH8s+vWE66HDgYrmfZWH
         VEFgYuaftkmgi3HejzHPCHChiCvdabTq/f74Nen27U946f5yd6CKCl4GTC23Y/oqX7cz
         RsG4tYW3IPnGdpd8UPPAaHwztCmW22aBQG2jzLHS0sJ2d+NfBuKEixeLQQ8Fa+7t3FZi
         H2XJATf5JLN/cldMk+cV6/hP6NWMmNgTNvAjAj9rY8ExfiyxXYL0yf9p5YLTP24WE3/J
         NTOkmzjT3/H69TSsnsCZIgvdtXH2wJl0/lfWczmulhurSkJAPDa2K2XH+M5riNIQKzCU
         5/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376812; x=1783981612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJCpc8BzZr2s/adrZrnFsb3LPXSuLc1ySnbVabaHnns=;
        b=AE+MohmmQakoqPAzSGkgrQdPq+8K9vsw9DF6KJo6mVJMV8Om40iLlmHwnYD2Gtxskw
         yO1qrcorTAayJ+ronpe26LmhQlHlRTDhCUD9tGukY9t5AQytUAgAQ8L0YUhjO6WP8t66
         DqAt32Sjgaqv1m9bbfHhOghD+6Hw8Oo81KJww/abRkGdDUYbWoepxI7tRjVFjQ7wp0FD
         IMPDkmnu6k3M19NTf6trkS0Mot04POlLxibuJHIyB/a13LTVnng252qIIzNNH4TEZbdi
         khM8bYjEX3lbgArstIWgGwYuAl7XWVtu9xdlqX5M7KU0LVw8jM7cyhAe8yEFkBgFWipq
         63Rg==
X-Gm-Message-State: AOJu0YxL+N/MgQxyrB9jdYYIH3z3cysDSAX1WmApab/Yg5nr3eIxqgtS
	Q5SQ+WFma8wq6sU29VjtBaoR19L+aoVp28SjVhREhSufZ3+IGSRKBENIDDitW1uAYyBcKplHAmE
	gtWbhJwJpznNDs5LQWvj97gOfS44ux1neWYl1+ZwbHHhWrGq8tBzcp3yIWYUwbAv6DVynDeWc64
	yYaFMZ4WKpII2sTrzF+B7AWtxzoEp+02obmp08Y5slBmozW9DY
X-Received: from plbiy8.prod.google.com ([2002:a17:903:1308:b0:2c1:220c:ccc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:38cf:b0:2ca:6eca:492f
 with SMTP id d9443c01a7336-2ccbeb13b46mr26453985ad.14.1783376811535; Mon, 06
 Jul 2026 15:26:51 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:26:50 -0700
In-Reply-To: <20260706094037.104AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260706092021.3625908-2-twiederh@redhat.com> <20260706092021.3625908-5-twiederh@redhat.com>
 <20260706094037.104AA1F000E9@smtp.kernel.org>
Message-ID: <akwrqg9Y5FPevRqU@google.com>
Subject: Re: [PATCH 3/4] KVM: x86: Reject KVM_CREATE_IRQCHIP if APIC base is
 already mapped
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Tim Wiederhake <twiederh@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 06, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Calling `gfn_to_memslot()` in `KVM_CREATE_IRQCHIP` without holding the SRCU read lock (`kvm->srcu`) or the memslots update lock (`kvm->slots_lock`) leads to a Use-After-Free and triggers a lockdep warning.
> --
> 
> commit 69e98e42c78858b7858a1956e233c569faf47ae1
> Author: Tim Wiederhake <twiederh@redhat.com>
> 
> KVM: x86: Reject KVM_CREATE_IRQCHIP if APIC base is already mapped
> 
> User space must not map guest memory that covers the default APIC base
> address when using an in-kernel irqchip. This commit adds an explicit
> check to KVM_CREATE_IRQCHIP so the conflict is reported at the point
> where the constraint takes effect.
> 
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> [ ... ]
> > @@ -4413,6 +4413,10 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> >  		if (kvm->created_vcpus)
> >  			goto create_irqchip_unlock;
> >  
> > +		r = -EEXIST;
> > +		if (gfn_to_memslot(kvm, gpa_to_gfn(APIC_DEFAULT_PHYS_BASE)))

kvm_is_gpa_in_memslot() is what you want.
