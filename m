Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662303B42C7
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936475; cv=none; b=e2ODGrM6qKVm16dZOwwp7dBNwXRjb4gqwurRqSk/yykQ2P6PUhkqbPzUC9/UYmkVw261/3U08W2bqFT3j7Z3w/qYaPgWS+rJ1Y0hyA1+Wpca+Mj2kOzwSgglttNlN9+X0V/qv2i84xh+4RQnRihtxg+kcToA6QVaUZlIUQu0B7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936475; c=relaxed/simple;
	bh=1pQS/g2MnpCZt3mZlreri9StbMherxh7veCc3q9wdMg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ce5ypacWNbR1iA1ZDQbq6c4uenWVNU6Nq2mdCcN6IhTSYoblbHvPTWBfmnN9I9L+X6VKGmkqylnDecZ/ElocWrCnelAFOyj2OPQj7hj0laJz8VSVgoUXNR/wVA/PSyq0wF7YWMPmRzcIUSuF5HG4xwks0APAlUVppAQvQONiFlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FpyMqyd/; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FpyMqyd/"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-37fee8a7813so1024371a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782936474; x=1783541274; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOdt1MjTdK+8K0oNK35IqiS1Sh21G9xWYtRVhtEsR+w=;
        b=FpyMqyd/FyBfk2ldA5KY5359DOVxyN3GZBctnRPtGVGhqze3PQYuqJ5fL7NOUaHmCh
         7cksxioRNdBPKu4Ds1cg/6fiPQgTCKR+kFZJJR+qFnchTGcjIwTpFiANMqLWBbryXbIO
         VQFv/bUVuPn+EixsMADgNAVYUNzYvmDsIYJLUOEvwVY9Iju1cY2kzgUwbvQQrytGk+ds
         tPpI3gV6lVCg4Cqhss9RkzUtQvXMwXj7w8d2GPZyEHMz/a248sjpIUIpry9/Dwp1bv+G
         Nq1ivedqKvgBoRdUzrEi+eSmF1gzG8qqSeAPQr0iNVi+BovfGYH72IxX7kdRsbQKozsq
         69wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936474; x=1783541274;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UOdt1MjTdK+8K0oNK35IqiS1Sh21G9xWYtRVhtEsR+w=;
        b=gGf5uAzLS28sAt2ZoPUEM3UIDbZa5xExWVcIeb0RVSFLpMtxSkBkNif+WaaO8m0sRj
         /DBqm+5PsnPwWcGReG2k9loWnWtS6JaJNKXDk+9ZRDjMmX4FGykac5SkXmEHafD6Ft9Q
         QBt9WUIHArQ7qdS+cBocYfm5BWo5DSUy7CtQGPkzdGSSoh2nZ/AIcutsFe8sojAF2WLC
         11jYk+z+noR5+SAepafphWiR4MFcLfpOZWae2Hk2XyNX8IotEHEEP39Viv++1GWA8SRq
         L8zvOzUWru8Urti7Gj44Tckm20ezkmkO7URXQhgyGd6+MLC7rEb0TetD33gtvbwMqjQY
         +4yg==
X-Gm-Message-State: AOJu0YzcI5yaJ6mnlu547o79fC5DtKAghH76EVGy1/to6rmiMEcbCnr8
	v9lh7zO1wd+aHUOf35uuAFg14MW2rp/YMd9byncGknBbpHXxR8jVXWA/FhF6cUDk12jM51FX8gX
	ErA/fqGkBOhRwyMTSTZKNPwLCCUfSUPix+w/nmBuAMBv9/IpqtPw675JgI9cV2RUvB1GeHLWCnt
	XdO0wiG57DZgTnghDo5cwthTHnmmpaYDwkOvU6ZqNphdkt6a6p
X-Received: from pjam22.prod.google.com ([2002:a17:90a:1596:b0:37c:c540:67c4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264a:b0:37f:9ce0:af35
 with SMTP id 98e67ed59e1d1-380aa227dd0mr2771100a91.32.1782936473365; Wed, 01
 Jul 2026 13:07:53 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:07:52 -0700
In-Reply-To: <20260701195652.5DEF11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-6-seanjc@google.com>
 <20260701195652.5DEF11F000E9@smtp.kernel.org>
Message-ID: <akVzmNTJrsW_U6g8@google.com>
Subject: Re: [PATCH v5 05/51] x86/sev: Mark TSC as reliable when configuring
 Secure TSC
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> commit cdbd80de837f6d512a759452a18164ddd83b9b7b
> Author: Sean Christopherson <seanjc@google.com>
>=20
> x86/sev: Mark TSC as reliable when configuring Secure TSC
>=20
> This commit moves the setting of the X86_FEATURE_TSC_RELIABLE flag from
> sme_early_init() to snp_secure_tsc_init(). It consolidates the handling o=
f
> known-frequency and reliable TSC flags when overriding the TSC calibratio=
n
> routine.
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but does the early return in
> arch/x86/kernel/tsc.c:tsc_early_init() allow an untrusted hypervisor to
> bypass Secure TSC initialization?
>=20
> The tsc_early_init() function checks is_early_uv_system() before initiali=
zing
> Secure TSC. The is_early_uv_system() check relies on the presence of
> UV_SYSTEM_TABLE_GUID in the EFI configuration tables.
>=20
> Because the hypervisor can provide tables to the guest firmware which may
> expose them as EFI configuration tables, an untrusted hypervisor could in=
ject
> this specific GUID. Would this trick the kernel into returning early,
> bypassing both Secure TSC and TDX TSC initialization, and causing the gue=
st
> to fall back to untrusted legacy timers?

I suppose so?  But that's a problem best handled in a dedicated, separate p=
atch.

>=20
> [Severity: High]
> This is also a pre-existing issue, but should the newly updated
> arch/x86/coco/sev/core.c:snp_secure_tsc_init() validate that the calculat=
ed
> frequency is non-zero before returning?
>=20
> If the calculated frequency evaluates to 0, which could happen if the
> hypervisor causes MSR_AMD64_GUEST_TSC_FREQ to read as 0 or if the secrets
> factor is invalid, the function simply returns 0 instead of terminating
> the VM.

The hypervisor can't do that?  If it can, that too should be addressed sepa=
rately.

> The caller tsc_early_init() treats a return value of 0 as a failure to fi=
nd
> a trusted frequency and gracefully falls back to x86_init.hyper.get_tsc_k=
hz()
> or legacy timers. In a confidential computing threat model, should this
> security-critical initialization fail closed and terminate the VM, rather
> than falling back to the hypervisor-controlled time sources that Secure T=
SC
> is designed to protect against?
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701193212.74=
9551-1-seanjc@google.com?part=3D5
