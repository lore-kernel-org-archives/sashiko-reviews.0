Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E12363C59
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781308289; cv=none; b=sukIK6OQYpanzyeXsTQanzl9NjA8fEeqjq5WbTLPIDwLkLBXXIaCELPLsuUcbCsHdA/bmE6MByqCS17JEHf5cY2FLgh08SfaPz+AeKqzBKNlfQ5hRxrmmAduOuRXCZg4L61UySgwhsdF+VITn/OS0vOgg/KUm4jfa1vUixy4q1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781308289; c=relaxed/simple;
	bh=KrrixN7adNVjBTUOLfV1MrmXfGbP++mQnNm45UA20N4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j+Ku0xmT1rskaGNLqmutHDAJJV32uyxyG8Y+KEmO9h4NBmYwZ4UAVEVOxjCLupOMrUuGQ3vn1JvcBYBmmxh/c9akEzUk675qQmnyqJpocoUxCFdut3wedbp32ubJUFXt+JFAAct1eTb8S6w1yWJMw9L79/875LK3E32O8tDAWMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iam9R4S2; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iam9R4S2"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso2051665a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781308287; x=1781913087; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ksOXGkmUmxHYgHNgZg6HQ8a2PuzuJbH+miksav8bu0=;
        b=Iam9R4S23QEfZZFXD+e+ZuFsaJjYl116oUTOZ2gUrcpDRMD3qKv9D6Rnrsl1ct7j4k
         IM6V/3Wl1BNqJGeDIloUS8NekNjHuBORfCw//XKU5hJjzcYteezBBfHF3gtoWFR4c7ic
         fqS6K2F2puqM+lcSMgZXWVE6UlYDi+UBiDcLPesENVneB3A3VUGJXsDm5S+ncpFgpIrP
         p/LJd5FxxA+VxWi4kpD0/jeM1LTZP7Ra0BbUrVENivKUDmF6yaAj0xWH4sScVwSC3qij
         4ziAk6XRBBEVJtYGgsKWIuN4WXGXQim4aI/FqLhIGlmNCbHPAiWbe83CY/QispZQVTla
         L2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781308287; x=1781913087;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ksOXGkmUmxHYgHNgZg6HQ8a2PuzuJbH+miksav8bu0=;
        b=m3ueGZHMnsn3Jfi0MLRvQ17VNFJ7XQfp0yzyQw06Lbzrw90UslxZvRkc9ew2IzN9z6
         QOS7BE9FaWFkEKNiXRspMVllnFJdjkOeYX86M05ciG8Tv4yi/euKn6EvEWEuCNAKAsrk
         DWjKo86V665KIQrUr4CHL0NGrwpSdmEzVxuZ9rjzK2QP0HDmuv8izxk+KpaEpq6DWMdF
         UxL6quY3pLu7njri2c35LumynZTl1GYer0f8beoDi34KPKm3+8hBfT9W2TGPCTTGSSQX
         ybFGEfN/pB5UDitOVTpDuwdCFdefVFbUYEXtc4uJHEaxzzX8xwp1aMvlCMS9FdICQhoR
         CTUQ==
X-Gm-Message-State: AOJu0YwxNHDU92ZioaNHVDJbC/mZKoBGKb6/CrabqYmAulWo4ABJL2sl
	QAl1+dojXkVk6wTMO7tHfTX3Opo2lxNaNMJtAXXsg92omei0KxQrHwhdahCZ1mtNt8uJE5iU4cG
	HOmTdBhzJOE5U8DEF5KgT4QWcRq7YotHpJMV6Cx79IFk7L8MQPjbGToclTCiFGw36mnlz0MJCIp
	m2/74uGy34+52APObjsNMVkSCyyurW7fqfBOu+xPF3Md0zI8hW
X-Received: from pgwa8.prod.google.com ([2002:a65:6548:0:b0:c86:2164:9671])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53cc:b0:36b:7f69:c152
 with SMTP id 98e67ed59e1d1-37c2bd494e7mr1429812a91.18.1781308287198; Fri, 12
 Jun 2026 16:51:27 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:51:26 -0700
In-Reply-To: <20260612232829.482311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260612230113.684301-4-seanjc@google.com> <20260612232829.482311F000E9@smtp.kernel.org>
Message-ID: <aiybfjQbD4qMRMGi@google.com>
Subject: Re: [PATCH v3 3/8] KVM: x86: Manually check DR4/5 write values to fix
 SVM intercept priority
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 12, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
> > index 4484c5fa19e33..a1bccab0eefee 100644
> > --- a/arch/x86/kvm/emulate.c
> > +++ b/arch/x86/kvm/emulate.c
> > @@ -3853,15 +3853,23 @@ static int check_dr_read(struct x86_emulate_ctxt *ctxt)
> >  static int check_dr_write(struct x86_emulate_ctxt *ctxt)
> >  {
> >  	u64 new_val = ctxt->src.val64;
> > -	int dr = ctxt->modrm_reg;
> >  	int rc;
> >  
> >  	rc = check_dr_read(ctxt);
> >  	if (rc != X86EMUL_CONTINUE)
> >  		return rc;
> >  
> > -	if ((dr == 6 || dr == 7) && (new_val & 0xffffffff00000000ULL))
> > -		return emulate_gp(ctxt, 0);
> > +	switch (ctxt->modrm_reg) {
> > +	case 4:
> > +	case 5:
> > +	case 6:
> > +	case 7:
> > +		if (new_val & 0xffffffff00000000ULL)
> > +			return emulate_gp(ctxt, 0);
> > +		break;
> > +	default:
> > +		break;
> 
> [Severity: Critical]
> This is a pre-existing issue, but does this code need to check for canonical
> addresses on DR0-DR3?

No, MOV DR doesn't do canonical checks on the debug reg value.  I double checked
the SDM, and on both AMD and Intel hardware.
