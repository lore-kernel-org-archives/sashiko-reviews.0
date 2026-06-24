Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28580C8CE
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308280; cv=pass; b=UAGPujwOWRWddJR0LlbPpP/27+EYRYGI3AH7RzwcxpZAqXx2+2XUDarNpqTLDrAZvIfLaISUwXxmBOzbwL0/ZkruJd0QBj2nA037PVfL7tdzuLxhcuguFAkTlh8saP5T+bR694H6qxMKpS0KlB74RQ0cfZZpeTJDt3QyFgEsong=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308280; c=relaxed/simple;
	bh=JbnF8tlvwsmPMUGz/K9mddurBUf197LtClXob6r9Br0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALabdMBj2X8LdbDZ79bi6YYGwp0SUneGiCtJvFSiYh8i60wVdrqu2bMm9kiEVKJpcyGpXt2yC+wigG6LgM2jH8G6Nl4ePvFudZ9Tj83pOTe7ZEtaCvjvuIXctnHCvBQ22L8gYajTxRala+azZiDBYzlNgXN+OeiHgnIjYzeQHg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHyKxCHo; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHyKxCHo"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-139aff562e1so1393738c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 06:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782308278; cv=none;
        d=google.com; s=arc-20240605;
        b=TWLoRo1rcti9Ptevco0nEzyYdwXjvTH7+drI6zU3mFIZgap2W4BBoLNvb1AuyKrK7+
         EYRrn0W+lbNdS9WWTnUbCmHECT/3AigMzH6wyxq33QLl7TT4IzCWe/DGb9JdcUx5xX2p
         zof0Vtv8HXqOcYzNvcZGJdxrl3wH5cTmL0rjzRDIgdYPOr1+h85ON0plbTpElvA2bfHU
         oKsi13PdmvNsGgt8am4m3/RKEGyUuieKd2dlL/wvdqq7WzSxpH44l6DVnzHJ0Db7mYZE
         hBF0J7880AcQ8j5T+e0sWaiN0csFVUfVhlKfOdoDYWnsPq2+IM/po4ZUS6dTC9Ml/ojk
         MHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=JbnF8tlvwsmPMUGz/K9mddurBUf197LtClXob6r9Br0=;
        fh=tKBL2KXLKCLRBTD9ZJ0FoV+9Me0vuTjMuw2DMNrS+zE=;
        b=F/19aP/9KrEq0fqBknVfhC+ZCSWIHZi1pdeUQ/jLWd4CsQCfRI+LplPBYmcosCe7R0
         lBUjghuM0BDI4evbga1fjBHgUbYC5lTtnjVXhrtj1zDLonzGwrGu1pLsrk/EnQeOuOEo
         LNypSskLp+Dgime+lUpujYCrj0JGbn9HG2Ql/Sr1T1JFRR06z6KlRfsXE5pg4NomrhqY
         pK0d4oU2ltHDJXGW6H45sGM/BH8ti4Ilr2KRXwKoLS34Yqg7pk+e7OLLA+pRqFT+GVDh
         AOBV4TAlyHnyMfvgYrs+caI6uyc0sZ41G9c66clDEODVwXQi7s5MiTyMKgVxwr/0yMrq
         EizQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782308278; x=1782913078; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbnF8tlvwsmPMUGz/K9mddurBUf197LtClXob6r9Br0=;
        b=LHyKxCHo6D4nqEITg7EOofVcdC72DjHuDaSKE8B3v+4lTf5AYdWGYBXJuuqrBTmoy8
         YfHvHlrX2SWZzcLBShl5bRS1i8BGxr6ma0W3XMY+J3wvsvmR+eMeoKwnZS+1+semakau
         Byrh9Vhri0T77jG9JN+0DToBhUGKbR+b4JTGcftLigPvGDlbi+ZmaB0y/wPt0821oIjf
         GKtb9lg61CYVjQufSccabr37haExtQ2pAFaohNVLOMi01SFc8wSXdKzchMw7XUMbSag5
         oKfAF724zbP6rq8Bp5bqd98WsFs1jVQsA/16rZbP1Ort6b4rLTmk3KQ2eCzQ4ZpuWVEq
         CdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308278; x=1782913078;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JbnF8tlvwsmPMUGz/K9mddurBUf197LtClXob6r9Br0=;
        b=A+/txDM4JR5P7PWJLmUIyjZGe/kHEUfm0FFEROIF/uOG4GBFBSvLa1xpx8U5oZkAbK
         1nvObMHyWZOXSpTUh2Gbo9jl6/CloaHyXfe/F71ppD43kS4Z9zdjpK9SLsb7CxW9kQWy
         2fgzUkHs234WxkWZpQd77OAx8FeQIThc43dGnSxRuvG8qWd4Er4b10kLpqHFN+hE7MS4
         epmVhNxyA2On7SzSUi2Llasc6i46slWNCaVeqVD9NbOtErRQwTxMBlZ9fr3MWVuVQ3zn
         Czzwto82C/BL3sGBFvJwEqnDFYeEANHAWCLte5yKqJCVs+jm8MGb8ZwWFsnAAYB94yxl
         oB4A==
X-Forwarded-Encrypted: i=1; AFNElJ/jbauGgNPex7CfhUJvDM2uCKxGg06G6PuImV15u/o7tlO71Cs5A2xwh3AwQs8IpyztR/W8IgkuNkdK6LUK35Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXj0Ot5FN8W+6L0CMCZgnfqNRf1TOmmGzuyfJFZs7PktkWoeka
	+f4pJhuq5/CmgvVhYdqmO9ks4ukYxWOvJ4Qdae/vpEE0+nRcymdErKz/EMN6XGqUAGC8CbqD0gA
	/DheeqG5jb5RMEbf1z0YtUzs5/9+TPGej0sP1tImSPnIl4ijcPKFgjKaUveQ=
X-Gm-Gg: AfdE7clYQD9p+McirJ60Z+VLyeuJTnDTMclgmv6hfC2JzpMQRL/2ZiX8t1kHhkgCh9r
	v573s05OX8IsQ0qAgomUAoR1vV8BFR9XZDAr3nEHrPV+YdXCuTpRMnp37lgjbXs/T9gMIwXl/Sj
	Gm2+KrrMFAw3SmXbcomSX58hz0cL2AOMtZHivKtqLh0iWs8v0dlUUDsUIihG7YPHNf0M4/ukct7
	JnMMl9k2ZyLzLr0MaAvP9mElNBqzhZioAAJd4+m+Ri/aAcyER6//79xvN5tJ5Fyzobix/mVshWb
	lB+6+OnxlsFcEjvDhrUOL38F+QKl
X-Received: by 2002:a05:7022:6624:b0:138:37a4:fcc4 with SMTP id
 a92af1059eb24-139d0c10057mr2617590c88.13.1782308277270; Wed, 24 Jun 2026
 06:37:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:37:56 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 06:37:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTxdN+TsqSyp+f+8QO-BbOgHEebmpMhJbmD0D8quWg3s8A@mail.gmail.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-7-9d2959357853@google.com>
 <20260619005533.984EC1F000E9@smtp.kernel.org> <CA+EHjTxdN+TsqSyp+f+8QO-BbOgHEebmpMhJbmD0D8quWg3s8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 06:37:56 -0700
X-Gm-Features: AVVi8CdiT8IYvHNr-i5_WMx1t0IMgMVlt_53LlQKQ1trLegTSEWDN2cz65gsFkw
Message-ID: <CAEvNRgHzrPAkLD6a2GYM6KpFBbHscghW3sVrVWv8XvjF+1BD1g@mail.gmail.com>
Subject: Re: [PATCH v8 07/46] KVM: Rename memory attribute APIs to prepare for
 in-place gmem conversion
To: Fuad Tabba <tabba@google.com>, sashiko-reviews@lists.linux.dev
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> Pre-existing issues:
>> - [High] `kvm_range_has_vm_memory_attributes` iterates over potentially massive ranges under `rcu_read_lock()` without yielding, leading to RCU stalls.
>
> Not a concern. The xarray walk is pointer comparisons with no I/O or
> allocation per iteration. Realistic ranges (memslot-sized, low
> millions of GFNs) complete in microseconds. The "billions of elements"
> scenario mentioned below requires ~8 GB of xarray metadata to even set
> up and doesn't happen in practice. The `!attrs` fast path
> short-circuits via `xas_find` when no entries exist. This is the
> standard xarray-under-RCU pattern used throughout KVM and mm/. Pre-
> existing and unchanged by this rename patch.
>
> /fuad
>

Thanks for looking into this, I agree that each iteration is fast so
it's not too bad.

Setting up vm memory attributes with 1 entry per index in
kvm_vm_set_mem_attributes() actually does allocations, so it is kind of
slow and affects VM startup time. That's also okay since it isn't done
while holding rcu_read_lock().

For the private/shared attribute kvm_range_has_vm_memory_attributes() is
on the deprecation path so I'd say optimizing the setup is a task for
another day.

>>
>> [...snip...]
>>
