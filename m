Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136529E0E5
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 00:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786409038; cv=none; b=ljJYP8PpaE1X/XE5UZB3ouCsmlm2JfzR16yNuDUw9SqcMsaN8j7UgZEHlPcNWp/LodsAuZfF3unstCaHAkCzGCE9BPfS+jxujDzKKmiLhSBlX+uIKBsjK+IZ8Ed2wfKw3P2c8weTBwBDXNFuXPHyhPpa+99Urc4+uWo3FHBgu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786409038; c=relaxed/simple;
	bh=WQxPyjOmNtM5R8JyZSMh3RwDvaCfdXHPYKo1RlbE7Bk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tLgDwibHsymhTDT8WZcP0yXCi4y7GXIkEpaw2p51W66T4sNVq6FtsOkSujInTU0MgC6kw4qv2j31KD1fUsjlz1h6J1fUXEQcXOc+7FYc8hf7PlzNdjBYmrPD1E100N5jXLzMYcUiE9dX86VNhbnFrzMLcxmxabzft0yFxk+n6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gmfbST/h; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gmfbST/h"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3157325a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 17:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786409036; x=1787013836; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdtwI1Ee0mw3e+1rCkhKazccv8OvfhLfoElZh6LGLeY=;
        b=gmfbST/hXiuMwSrdI9htqs0LsZUw7dobX1ULs8l4VpOOWpEJiEfZNb60E58wr6VHTV
         I7IHFXTWAsv5Z2kdwQ1yjJg7S8HISzmb8pErr90upD2EfFBKiSwSUuCLwr8DKmL6X7yq
         88oiLDyIbkHq8biqtFwbaPFHMLAXUNjCvz4PIPvX31csq0Fjfx4UP6LSP9UHTZMV05vm
         iMzBxqgx7xrtdr6pUqSPpQ/QDRi1Ngc5WQ2VdwoLXzugfvrjmEktRTLfz3f2tgDIJ5d4
         0/CoUPulseHhwrrEz9owPU7B+gc6Lh3NRERFnIJDZ/D5kUGBDBqfsqKQZHEvA+d+FgLC
         kyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786409036; x=1787013836;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdtwI1Ee0mw3e+1rCkhKazccv8OvfhLfoElZh6LGLeY=;
        b=QkRF630tFTamQHg2mz2yu2ZzVib5p6IOZyfXrkg9qUDdY8zOgnxTTexXPr8Ej4CVjt
         bKHjidcHTjkVpXr63PgIntEiON62WyPDfo3Z5I5HEzQb3UpDfOtu3mD9k+mufs+h5dvp
         RgOzkHr5SsdjcYMtU0b7CTGNOtBVDchi7l1a+XYPjkWfgH0K3dCvYAng9xPuRxDnpxcz
         78Mb56JV43NcC8zMZ3EIPwWGPzMOVuFFR1W4vdVMPg9DQ8Rw4D4RGhCP22IBPCO9m0bN
         HDiz7KfAe64340LETm0GPYrbEKd6YwRMqFJrTS9OXI6gjTq34Kl+BYTQ0MYb+Bxdlc8P
         lP1g==
X-Gm-Message-State: AOJu0YwpN03YA4U81mQcJPcBWmP5fqn4Dezwg2RT2SfOYYzwf4TzpuUA
	lbmZDMN+SjDL+BUvoERyGprTWIxhqpKg/c0ICm8vrl+3UN9BWJJYaAgV93rBkgSTlPWV0hkSJYB
	FVGbdeg==
X-Received: from pgnb22.prod.google.com ([2002:a63:7156:0:b0:c9e:63b8:11b5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4a89:b0:3b4:61f:1fec
 with SMTP id adf61e73a8af0-3cc1a0bcd18mr7553175637.2.1786409036317; Mon, 10
 Aug 2026 17:43:56 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:43:55 -0700
In-Reply-To: <b50b3535-eaa1-4944-914d-0eea8dac0e06@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260713105033.15405-1-sarunkod@amd.com> <20260713105033.15405-6-sarunkod@amd.com>
 <20260713111119.EC35E1F000E9@smtp.kernel.org> <b50b3535-eaa1-4944-914d-0eea8dac0e06@amd.com>
Message-ID: <anpwS3C2UIHFz_Uf@google.com>
Subject: Re: [RFC PATCH v3 5/6] KVM: SVM: Add support for AMD IOMMU Guest APIC
 Physical Processor Interrupt (GAPPI)
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 10, 2026, Sairaj Kodilkar wrote:
> On 7/13/2026 4:41 PM, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > Can an unprivileged user-space process trigger this WARN_ON?
> > 
> > When a vCPU is created, svm->gappi_cpu is initialized to -1 in
> > avic_init_vcpu(). It is only set to a valid CPU ID later during
> > __avic_vcpu_load().
> > 
> > If host user-space configures device interrupt routing via the KVM_IRQFD ioctl
> > before the vCPU runs, avic_pi_update_irte() is invoked. This will pass the
> > uninitialized svm->gappi_cpu (-1) down to this function, hitting the WARN_ON.
> > If the host has panic_on_warn enabled, this allows host userspace to trigger
> > a kernel panic.
> 
> This is a valid concern.
> 
> If host userspace attaches a bypass IRQ targeting a vCPU that has never
> been loaded. Functionally, there is nothing to do in that window. A vCPU
> that has never been loaded cannot be blocking, so no GAPPI wakeup is
> required. The IOMMU still posts the interrupt into the vAPIC backing
> page, and the pending IRR is evaluated at the first VMRUN after
> avic_vcpu_load(), which is also where the IRTE gets a valid Destination
> and IsRun = 1.
> 
> This can be resolved by assigning a arbitrary gappi destination, without
> actually updating the gappi wakeup list of that CPU.

With the disclaimer that I haven't look super closely at this series, and haven't
thought too deeply about the feature itself either...

Why are we doing anything different than what VMX does?  vCPUs on the wakeup
list when they block, and come off the list when they wakeup.  It's literally
one flow that's guarantee to pair put()+load(), and the logic for manipulating
the list is quite simple as a result.

Going a step further, why is GAPPI not sharing code with VMX Posted Interupts?
At a glance, the only meaningful difference in the wakeup flow is the "should
this particular vCPU be awakened".
