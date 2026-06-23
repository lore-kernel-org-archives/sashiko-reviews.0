Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C82376BF1
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 00:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782174426; cv=none; b=geJ6Z5WZ7rpBPizcaBtXf5todhuK0+Rz5hQuAG8waphFTI94KTAISBIg4Vz/gflRUpSsj6CiyEs7HHaUMICSDk8qSFvwGVUKILNUrfRuHLIUBjazwMEy0zHwEtyHJvA7jGF/DyUkF70Gx97dBivpHrXPNeF1AGdgYasJe3yTgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782174426; c=relaxed/simple;
	bh=44b40FNP+GAQbQbXKQNOho2js7AD+VaXNZPF5DFDsMg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AMDMkzcbTI0Wkx6OVwW20aCqxdXoBD/ixgAG5uD1Y6wqrgHEzoLbvSiau4iQBGssKDLag8HYjqubKEV27F47Pd8fz77gNAs7CuUJJSwEXKR4xZEZM/Iv20ci3fF1CP2+YljPTTS97Gw+Xud5SEw/6KATN0O2rPpv0U7mBh8I7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QeUCInVv; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QeUCInVv"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-842208d5b0eso3512196b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 17:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782174425; x=1782779225; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq/owXnFX88Pz3Pf4JSEwe3XNyjNB1kqyEi1wlombTc=;
        b=QeUCInVvc1UXV5YEtC4CzE1/KJWO0jY1Wn2KVHnF6kfb3t9YDgyqFGTMTqj2sxHNeJ
         hbBTB0HCoo+AWBMbvpDmlcVExIzTFS2J6WR1SJUNUxmkimYGTCiCM2RjVQV/bJPGkahW
         r/daFXhop9P7bqJisA0FHyGomF7uZAn+64BPB6jbMgdAun02RWHH9c9ug/xHK+bQA1oz
         IuRGLUAqXu6R2DV0zsd7auvpqS0ch3cVpqyRqEVRivn5iWu8ShxQ9FEn5u+5U148zlTY
         3ycFbOTT9NTfUpMPN3Q+ghJMMKi/Q1JtRG9b41aCMJ3LarhUnvCQ2K6MbXwJgATGK9r/
         wmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782174425; x=1782779225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq/owXnFX88Pz3Pf4JSEwe3XNyjNB1kqyEi1wlombTc=;
        b=STBNtZIjha6jE0L9L8m8y2FPFYwDNY7/clnxzy66AjcCzfIbUDIrzqyvaT6pueyG2H
         XUUSRItZByCmcJ5KkQ66GYuM4WxiDT/RfdHQboxTN345gD1qCxOJjf0SU7hU6dU4BxgB
         cMOjte+w7FSdvhY9I9uAaD7kx8++apodVkEE6I8RTEHHUSe9wjAqtuSu6w8OK3WqTTzH
         PKi21RnU3TRPDvUlpJdGW+1nIK/UDe60moQv6B+bkesAThveuughsaxjhzpMC1F/DZXy
         gkecssnw8LvTIwBIDSawE5kG7zS/NqYxiZHOWsA72aAB1IUANzTf9DfgaVVUoUczesb1
         k3uA==
X-Gm-Message-State: AOJu0YzhTUsOf2rnYLX/zweTpzHEZCZbBQzaxCQwddgmtBgsmZffMNSu
	9TCETkUdktxDD4PLW/o6V4n0YzuD8n+4VIBr2Sncfqj/LI95vCc90sPxCVIOgYUyZsXmcT6mMdB
	D6N1wkQ==
X-Received: from pfwo4.prod.google.com ([2002:a05:6a00:1bc4:b0:845:47bc:59de])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ccd:b0:842:5ea5:5fdd
 with SMTP id d2e1a72fcca58-84595440182mr611845b3a.40.1782174424841; Mon, 22
 Jun 2026 17:27:04 -0700 (PDT)
Date: Mon, 22 Jun 2026 17:27:04 -0700
In-Reply-To: <CA+EHjTzQhOi-qeiNGpn50o_ko2Cp05qzuKwhiZCgLPCyiwWhrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-17-9d2959357853@google.com>
 <20260619005320.51A8F1F000E9@smtp.kernel.org> <CA+EHjTzQhOi-qeiNGpn50o_ko2Cp05qzuKwhiZCgLPCyiwWhrw@mail.gmail.com>
Message-ID: <ajnS2NmvfBtgLKky@google.com>
Subject: Re: [PATCH v8 17/46] KVM: guest_memfd: Advertise KVM_SET_MEMORY_ATTRIBUTES2
 ioctl
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 19, 2026, Fuad Tabba wrote:
> On Fri, 19 Jun 2026 at 01:53, <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Missing compat_ioctl handler for guest_memfd file operations causes KVM_SET_MEMORY_ATTRIBUTES2 to fail with -ENOTTY for 32-bit userspace.
> 
> guest_memfd is gated on 64-bit: x86 selects KVM_GUEST_MEMFD only under
> X86_64 (arch/x86/kvm/Kconfig:50), and arm64 is 64-bit only. Is 32-bit
> userspace with guest_memfd a supported configuration?

Good question, I genuinely have no idea.  My preference would be to do nothing
for now, and wait to add the (AIUI) one-liner "fix" until someone comes along
with a decent use case.
