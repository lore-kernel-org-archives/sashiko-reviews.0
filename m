Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23444E64C
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 22:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785279582; cv=none; b=YkHOjnMadRCs7LF1BGcDhfVrxRZi1G/nXlaFqDco5XaZ0QHTF1otOQXo9XglAhgDxprqA+NbmXylTX66SWopF7xPTVy4AdgxiVUNzi9Aj78+R3IqkO8bKq0rKiDfeO07hSBqk86RvowPyvaA4lpaeUaFh8QW7tbU8Iupvo2jdd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785279582; c=relaxed/simple;
	bh=WdXcIMczcDRNI6LiAVIZUBxe+k0lENaof1A6LN4ltQ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SBrUSHfxS7pzD79dQCscFw1V9Pmhd9BuF6loioZTZcpQFX23E0KrMEgs5+0oVRSRlCQhO+HeEhAJQjPjMeJHt5fUcNK7XTM0VK/H1IrDupHAv/qwIcOSRQcEw24Or37y8dINeTTwZSWuIH/h6pP868od6dyCBg3NQGtPaAJcslk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gj6KQ+m8; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gj6KQ+m8"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84885a4fcabso330807b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 15:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785279581; x=1785884381; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=thdOOm/K4pddHQDmKddowM1+LABgvbQslWGfyXrJceQ=;
        b=gj6KQ+m8Ks6wto9AyvD7YeVUaIyRXUjQZ06M6bERVNNEQA49C7+mUQDSTOgLgUUD6p
         HBF7UNNXaArzLuqHIYcSnB7lK+n+vgn6aO083w0N2gLq1MXaiH0kFXFNC9Mi9zv84lIy
         UfF2RNuyyLUZ7vRGM9M4/2wJqomq3CGwSh80Gd5akbmPmrWU/7hcnro7m0GgyL3dWZhd
         P8QKx98TAkJb9eYMmbCBM4EPq5fO6XT9fcIzpkZ6/OYLt8wWqbGhQSKYk4+1wqrxbSwu
         GKQM6a+S4ZgBr6nq7r+HeEY1iT4KyptfACKBXy5D+3kmFAEPMKtlLMd49wz09/F8YTK+
         BfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785279581; x=1785884381;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thdOOm/K4pddHQDmKddowM1+LABgvbQslWGfyXrJceQ=;
        b=TeieLn8/oOy23z4hEUHHfENf14B7mQshh0LQddst9qa9O0nARlvAfDEdIfRFiwfyMQ
         VRXsBzyDLPMZPastEF7tSXzgKKhk6/4XHE8yBZSqsXYvKa71ip1qmCCLP7x7TkH3Umoa
         zvbPdlW3XtmjJ48KKCw6L2rl/H7uPqygww8qFAT+hnzU9nqLUWJEc3Bxi/ps6xQpdcc3
         +zebUU7eIczh7cLU43ZzecNtLICn2b8a9xZ7R+HIFQ0JzrielGRyZBHrHrguY6CgT48s
         2ecRxexRNdZwgGUZ9TYmM6QBhk4hGI2ddZEhLHamwCyC6iM34MRo+iPZoqr1BCy91s7z
         aJ6Q==
X-Gm-Message-State: AOJu0Yzd6o7BacttTzzUietT9wfapoNNgF8Qc8woJER3pG5a7dmIBV3x
	CsPJLqEK86M5IB/2mRzJeUYi2emr5Dd+13sF3P7TsuVIs8hflpJuo2S2Ww1P4uWbn/fkReg35eq
	ifOfV9Q9+FFrMey3/65Fdt9NM2vqaHs10bH/7AkKo8w3y13ZTJhYunYMDjxXL1RL7T1/3juRSjP
	zNCu7Ow5AbkiYHNmmZRBUWkZXHUzR1TOgEPOUu3+07RSiWDr9D
X-Received: from pgbl4.prod.google.com ([2002:a63:5704:0:b0:c99:5634:7551])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac89:b0:848:2eac:bfb2
 with SMTP id d2e1a72fcca58-84e93107604mr4560309b3a.13.1785279580732; Tue, 28
 Jul 2026 15:59:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 15:59:40 -0700
In-Reply-To: <20260728152156.A48831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-25-dwmw2@infradead.org>
 <20260728152156.A48831F000E9@smtp.kernel.org>
Message-ID: <amk0XODzenVy3D1g@google.com>
Subject: Re: [PATCH v7 24/36] KVM: x86: Use ktime_get_snapshot_id() for master clock
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Woodhouse <dwmw2@infradead.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 57494812cc839..45a768fd7cb35 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
>=20
> [ ... ]
>=20
> > @@ -1580,14 +1581,39 @@ static int do_realtime(struct timespec64 *ts, u=
64 *tsc_timestamp)
>=20
> [Severity: Low]
> The commit message mentions replacing do_kvmclock_base, do_monotonic,=20
> do_realtime, and vgettsc. Were these functions meant to be removed in thi=
s=20
> patch? Leaving them defined as static helper functions without any caller=
s=20
> will break builds compiled with -Werror=3Dunused-function.

Sashiko's "low" is my "high" :-)

arch/x86/kvm/x86.c:1575:12: error: =E2=80=98do_realtime=E2=80=99 defined bu=
t not used [-Werror=3Dunused-function]
 1575 | static int do_realtime(struct timespec64 *ts, u64 *tsc_timestamp)
      |            ^~~~~~~~~~~
arch/x86/kvm/x86.c:1556:12: error: =E2=80=98do_monotonic=E2=80=99 defined b=
ut not used [-Werror=3Dunused-function]
 1556 | static int do_monotonic(s64 *t, u64 *tsc_timestamp)
      |            ^~~~~~~~~~~~
arch/x86/kvm/x86.c:1533:12: error: =E2=80=98do_kvmclock_base=E2=80=99 defin=
ed but not used [-Werror=3Dunused-function]
 1533 | static int do_kvmclock_base(s64 *t, u64 *tsc_timestamp)
      |            ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
