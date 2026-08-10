Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D642668E
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786406259; cv=none; b=Of/0iOWo51j4d8VaA5Kn6EIJ6JfLGeBk0FbOArusQlwdL7miQaA3iiMpcyzouMy27Kch5tPn/3JMWdlv9vy6I6CS1u+H4OpDliSZEbQP/LRTNGgI5VCn7571QfMxd+KS3naezN89n/FPVT5pUfE9ujUFfQ4UkScDauMvg7ZaEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786406259; c=relaxed/simple;
	bh=4BupJwdVyL6umlPiGYOwer+ZhuGrupEyMF3dhJCrF+k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=otzJg7AdrmPRnJtnW1Dji+da9529q556Hg/JxisLgCt7E0/nyPqilUdPQBSMUjYcHtigon2yIgaFoFGqSxeWZlG/b9FcwVDY6aC29ZsGej5SPrRZ5xUBR49B8963rXKPBpRE/ujYGEt6XvLqQMdoAjd1Hzafge1n3hqD2X2JlH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X0OzZOfZ; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X0OzZOfZ"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso2878998b3a.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786406258; x=1787011058; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeZGsgiDsMXG6LZQ2iDpLtip3LMl/NmxKydR78skp+E=;
        b=X0OzZOfZUxNZUdXRMZdEJIR3cmQy1JFgZo9hoe5yEymB+I9TAXPt60vFhBDeBt2tYs
         6IYtsvY1W73Z7Zct6bYoXd9wSpr5vu7ACSTQnnG8Rl/xlXzuDhBje8Ugtpm3gKGnQ39X
         f1pV15C6ij51jpz88b+A0utRFbhcloKnT9lT/Gbh17UGBvb6po/P10xWQD3Np2kmO4YM
         BSTxyOrZ7hnuAxNajJ9g4XR/x28HDckIAQ+R5zIgZWUjeMbR593VZaVqTtTNwjk/lMtH
         mKj7s0JfHP4g05kO4AkmIY5kg4/kpagHid7iXQXTXd7Mqq8bBCv0MJ7MibY9fdHfuaJL
         d9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786406258; x=1787011058;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeZGsgiDsMXG6LZQ2iDpLtip3LMl/NmxKydR78skp+E=;
        b=B8V/uU/XG8zsWHs2siuwLT/q3vSaOzUDRb4YXLOubb+NJVzHONYzA43YN7wvf+jyuV
         gr4cVGqf8SfS9iFhWxLUpaYnlr/sVJDlmZmYyydYY40lIubKh1n84PVZ7+4FRI4qATjG
         K/mSoJZvtf3/NUdFBL0k2b1wTlKpLKCRQirQkLiW6am5c7/QrxI1NLw7TvQJA8Ay/+wP
         QV0vy8os/+6kuEHMJY9bDFPoWXECmG67bqAgYsWu3l+CxpJSZnAxQQ8npppGee1xjN20
         efDQWibWhLWB9YwzK2gU6/UfbJLINBvLqaI2HUAYZvvKPR6sx0wS3jiHYAZ9SzdD5o/D
         09Mg==
X-Gm-Message-State: AOJu0Ywzhv1zrJar3zb6LuoIZTApBk6IOurWFOZYlPb3yCgaH6SEhAZp
	hr8X7e0eE5Wf+63OueT4ytqzdmtPe6BqnDLmZRcgdvfzLSWa5NW4LnSOCBXgIFVnXaJlPuSjL/3
	EMpj6CA==
X-Received: from pgdi6.prod.google.com ([2002:a05:6a02:51e6:b0:c99:aff5:707d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e598:b0:3c3:93ce:663
 with SMTP id adf61e73a8af0-3cc1a35367cmr6912795637.26.1786406257898; Mon, 10
 Aug 2026 16:57:37 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:57:37 -0700
In-Reply-To: <13ea6279-a342-493b-a0f8-15ac5b4c59ad@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810112200.2326727-1-xiaoyao.li@intel.com>
 <20260810112200.2326727-3-xiaoyao.li@intel.com> <20260810113924.4ACBE1F000E9@smtp.kernel.org>
 <13ea6279-a342-493b-a0f8-15ac5b4c59ad@intel.com>
Message-ID: <anplcWfYReCMeu1A@google.com>
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 10, 2026, Xiaoyao Li wrote:
> On 8/10/2026 7:39 PM, sashiko-bot@kernel.org wrote:
> > > @@ -2147,7 +2156,7 @@ void tdx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
> > >   	struct vcpu_tdx *tdx = to_tdx(vcpu);
> > >   	*reason = tdx->vt.exit_reason.full;
> > > -	if (*reason != -1u) {
> > > +	if (tdx->vt.exit_reason.basic != -1) {
> > [Severity: Medium]
> > Will this check always evaluate to true due to C integer promotion rules?
> > 
> > The basic field in union vmx_exit_reason is a 16-bit unsigned bitfield. When
> > comparing it to -1, the unsigned 16-bit value is promoted to a signed 32-bit
> > integer. If the value was set to -1 (65535), the comparison evaluates as
> > 65535 != -1, which is always true.
> > 
> 
> Well, how about something below on top of this patch?

No, we need to not rely on magic exit_reason.basic values.  Can't this be?

	if ((tdx->vp_enter_ret & TDX_SW_ERROR) != TDX_SW_ERROR) {
		<read values>
	} else {
		<zero values>
	}

We'd need to use the unsafe version if we go with my suggestion[*], but other
than that wrinkle, the above seems like the obviously correct fix (maybe too
obvious)?

[*] https://lore.kernel.org/all/anXxBzO41_5eaaOI@google.com
