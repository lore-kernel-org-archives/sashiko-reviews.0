Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF019C553
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854433; cv=none; b=F5tC/umlf3VbLhHuCAwJ/L461HMpNAjdVR+JdanRKwF7kmJh2V107yM3Tr1HTO8jkd5ee6NCgtPDLL6BZWJRjsyVXvY/y6FWNzvTt1gk4udz3+jxCT7sZiIj3v4l4DyPZJ8rqrFBtTopmlHs476ixTMbgqwSVJGX/uvGYSWpbTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854433; c=relaxed/simple;
	bh=/n+duGFnZj9vgLfVjFxc1+AFLhU6/tMFkRyk4mmlD4E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rRGTVRfyNs+oYfHTcjInn/XFNohfl933j2Xa+e3VP8cNe0iVS4+oyuMStbyoq9th+mMcT+/TjYvir1dO2O8+ZQ3Box/hJv/xOnPXfZqplsgOK8BTB21audkS+PDgjpYmi8pjxZvULvzmAsf3lIDOXxt81BfYxa3FxXdrVhKx8NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lZRBhrM+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lZRBhrM+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-37e16f658abso3241a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782854431; x=1783459231; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzftopFDP8FiWfjOlsWLNJMxrI9W6RqxZpV3xiWeDtY=;
        b=lZRBhrM+gI3fasKhQi6eqr5zcSA+93TR3kcdXRlrpa+LxaoUTx/DyDFXzd9sq6rKDl
         bG68gS2A+fus2qFU9eq+8Bhg0CnOVgpW6SNc/nEUNuAubUTpiRSaUiGSCZQ4fqQcyzaZ
         BbViMvRnDaE4Z0Jr0v2vGdQUp4qEhtEEeFmOdaNrFFgHiAKfcsdGcAnXpod7mQ1jHh2v
         0TjNpY3u9yKERAx+M4ofVn8kpByC28ulTz9nZ2jvMvW6GEvNfwi5C1YgJLAAx39l++QP
         K4TPTgs8+QnqRNdfy8V1/JFy1XhP4jEoTRrIXEw2z6TEK3tSRHg/5jNv7uKgISqG0mu5
         tM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854431; x=1783459231;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzftopFDP8FiWfjOlsWLNJMxrI9W6RqxZpV3xiWeDtY=;
        b=QHZrAcEjn3jAiVUC8ljnp2BfCIn+jaSy1njH5KC8P9lWF6XDoOmUL+qiLMNUTfJ3gQ
         C0bcUHqegmIGEWtSSW9FKoeaHtN3kJarvzuWjbDNmyvSwZ4aT4nRQBFh1FbxTDhaFyHQ
         M7YcvXbGEEK8Jfc5clnFU3bDGWIRjP8WHf1nR8bxadOPeF0TJJ7pqK1ZyLt66DQLwpUI
         LsKW8wFPL2YGtIXJK/1OBrL50qs92N+5ZDM+Zz/lamo6cxznEqKD2fYvCJduo7siWOO9
         CkDxKWKmcc1AOVHnIsu1VXNwwPvkLal/j9WmtlFPnZ2mXDk96kObYO98r4wyw856vtUk
         odsA==
X-Gm-Message-State: AOJu0YzkzwQko0YTPgCYdqB2JEE0+jTCPsJjYMnBk5U7WbAHNbFLB3UO
	sBgwQM1PjwIHbBe6CO1zV0/T0ATtg9wMuAbzJz1ShodybHAy4v3V+MKaT0tsvAJG8Rz97qNFecL
	0rhn+9IkFzi3ZTjraNhUQQu4MT/MyGWTcj2eBrRYCoFCxvkV7u7/FybUH1KJRiXNsWwkRX9K5XD
	GWl/9HK/CEzxyRHvPqEgJpYZn8YdI0AfEZ86nwuWyfnxa/KgN2
X-Received: from pjbjx19.prod.google.com ([2002:a17:90b:46d3:b0:37f:6c08:3ef1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a51:b0:37d:f7fe:4bbc
 with SMTP id 98e67ed59e1d1-3805272a49dmr4084697a91.21.1782854431153; Tue, 30
 Jun 2026 14:20:31 -0700 (PDT)
Date: Tue, 30 Jun 2026 14:20:30 -0700
In-Reply-To: <20260630211845.8E8201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630210156.457151-1-seanjc@google.com> <20260630210156.457151-3-seanjc@google.com>
 <20260630211845.8E8201F000E9@smtp.kernel.org>
Message-ID: <akQzHkKVBCDcEfOm@google.com>
Subject: Re: [PATCH v2 2/3] KVM: SVM: Do all per-VM AVIC initialization during
 vCPU precreation phase
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 30, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index 4a0a2dbd1687f..d71a2fed1a08b 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> 
> [ ... ]
> 
> > @@ -308,47 +308,32 @@ static int avic_alloc_physical_id_table(struct kvm *kvm)
> 
> [ ... ]
> 
> > -int avic_vm_init(struct kvm *kvm)
> > +static void avic_add_vm_to_ga_log_list(struct kvm *kvm)
> >  {
> 
> [Severity: Low]
> Does the function prototype for avic_vm_init() in arch/x86/kvm/svm/svm.h also
> need to be removed? The declaration appears to still be present even though
> the implementation is removed here.

Doh.  Assuming no other issues, I'll fixup when applying.
