Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887740;
	b=V7L6YPmGuRkGR6MRiLOuW/P1ZDj3fYiInlsTq6RBZMsnhIbFTBYYTLIF9Vkq05wVPw0V
	 r/ExBdXfZOtY4dKYoSX/NikKfmSp1tT+9lrmJbPW48Ox1ufirDwPtgQUFUfa9KFU7LSrA
	 KSb9ldZ6FrBI+rziX9Dda8cwxhqZimTL7lD8x8WoTHShDnlVXsQprIQPSZqaX09lGdCRR
	 W42p76StMC9/t+TNBrDWfteDicuaUQHsb6t2Z/3BLlmhcWUPgS0j0IqWeQd+MF0DR2CoW
	 SNxm5hgZTuUL6stZm1E1fjad6SQFMa29Okb9MlairOK2LCMj6EgMKORmKimxvldo5eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=poGkZ4SIRNIBMqy2RRi0MRYY6O78nS+UiHWJviKThRQ=;
	b=V3F44+z37sOSRrtXDqkumusSH0Q6WhFfh/O/kASzcsw4x4rlTHdNk72gf2HL5sRWGpRl
	 k5ZuRX2XPuKMwBgJl8zABKlVq1zEnKLzgr6i99CjqTafAlCaDRichIAbzsZjQtweOnjAS
	 fyCQSz/0MJ5JSx0WriEmuvHBek6l7Tgvm3xWhGUiXRdOMETUXnhy2bq0A1/bA8NJ92fWB
	 ihgYLI81kjC3H2V7gNVaiKnBkand+SRBJzKp/4b/4Lq3WMEoJ2uWq3etKN1/0qtgjlq6T
	 dOkx67Iv3MkNTJuHAK9RJKzMbyJpUreueoLMXq6yPNaH1vDFkB2y9DzgKMgK4WSG/LA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WO0SbfjL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FC4606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 14:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FC4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WO0SbfjL
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so1149500f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 06:08:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887738; cv=none;
        d=google.com; s=arc-20260327;
        b=RWS0FtVoAxQXbPzFV8LngpyOp0Y4e1E/CkvgLTYhodroyIbIQAT6Ex1qpQH4qFoLor
         CF7H9baAaWwQbMuOq3vtjywJd+489eMo8neL/XX8J4nNdxglI1r75Rc9kVaOg90vjctS
         Js/AsGlUA3MztBDsQknmCAkZlS2paTrLG3IHrVBGVkrQMPOqfDLzPyvkqonS4u8x3mb0
         4Kgcncrf4ifpKWaSWvwiQ5eNahZs2+v3y0Fy5myNbDymWf2UWZswGLDG39//62PkFUPD
         QE1BiHJbXKcBly981H6eRBr1rbJUexnJqy1d8P5povzpgT7okS2LP2QcTCMZaBMKcpQb
         fXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=poGkZ4SIRNIBMqy2RRi0MRYY6O78nS+UiHWJviKThRQ=;
        fh=UuEIBvKRIq7mzKoTdrHfg8oBqEUwLmUXvEdzs9U2/e8=;
        b=lbu8ZoLr1TkU5h5giUgzOjpTFs8sxFoPy5vlt5HOUje5jG6qofbPlCQTzXxoUlldAZ
         hjcaPjnAsxS/ogosB2lZcpuqTcIssasPQTiM37x0o7Yw9Koj6kPEUZLop3FpTJRkVLse
         qfIYnCHGTt6PmQ1m8nvq0JRyxLRnsM8PiHfC0FrPnAQz+Edwuqw/p/0uSfykLOujBufq
         J5UNOlNfSDgvG+Fo/Pu3LvugcXFinb3KhMFqoF80KiMVrYqYF89BB6KZCIh7K80KNSpx
         Tjnow2fDMtZBdf7MsEjm3DhqdBmMBp5vW+0G+VKjDXTsr9vWeTDkvz2GsUNW2KWyNy9g
         eQWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887738; x=1794492538; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=poGkZ4SIRNIBMqy2RRi0MRYY6O78nS+UiHWJviKThRQ=;
        b=WO0SbfjLpjIbcVK9dvjzp6Ho/GRVm24ouOGkrKOWy+6LQnWNxpxKihrLRilTbfTUp2
         KB4qB1jthsCXqMbr/W0d1RwEcNrwRdHjEKYn7Qc08QzePyscXUZTrZzVhZM5kesS4CMy
         yZzN6Ucxf83Gwh9HTIXTOR14eHeJwtU3/YsVYJ9Vzw1q4eycW6bqi/CmhC9iroMVvigG
         2SKYEJwXA7/6y7Z/NLOB8YfBqSBNLw6dkPkT7W9Us+CV3GTXlgl3jL+EaCLCqpQfV0Hn
         H4avqxph9rn2RYOW2pVe3Frp/uhe6jH/OvvHd5VrREGgdq6WK1E4zHqENkMKrsCn6JQK
         /Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887738; x=1794492538;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poGkZ4SIRNIBMqy2RRi0MRYY6O78nS+UiHWJviKThRQ=;
        b=BNm9KvqCNfKlGhG6taJMvtA30NxEqVM018+s6C64yplGV4QPslev2HGw0s/Dtm73yQ
         zDI8x7TpVw19AD4fWonpull8au4eLt2WsnQrBHQeRJj/Ec5w/kQUV+vAH+LiJaMEHlNF
         OVg9lICb3e6NKO4D1WUn+/LTuiXr57wJEu7s+Vxt2PBMuREIcEXUJOnDcTY9/4pW/Jug
         fz7y/E5cGo6WHorzG59h4VSAJkm4lluy5hP5EMyr8lVrXSyDNhJ+KGmHlFT1jF4zkA9u
         SvbE++ODAEGBoUBICPK9T60XorZWYxCMIYXvH6et3sO88dTZwHnwa8ARk7OCGFesnJeU
         Ldcg==
X-Gm-Message-State: APuU4Z/3ivDDqu1QRgpjtehMCyoYuwoEZ/YTiMjad/GVEaTXtWTJjblf
	uFVbvtGbpMuBLGEEz50MDMpbSE53YJYpGpvPU9JwL+D8OJLUguiqTqiTuBLpT93d4b3DD6LCExz
	AaoBN9PcaO6fdcJTVyl0vBFYeyeCPN3ldyazrqvA=
X-Gm-Gg: AYBFou0cK9Gp31gMEL3TBHonWNaDZzW/y0DNSBnGCO1S30GHYWwqFJU3S+rsLDfxvGF
	mWLDprIhm7Cl4V90d0KbEJGL10xS4X6OszowzyQ3fMj81ED112yOQbu5pUSvavaAGEr7Pl1sh3d
	Iwlex+Y7ynsURMIux9PZmcK1YhkAbX/SyxtUaUpB+B+uEMKqepGfS7FP2bFZ4LrZdw6PQo2Z0UW
	tK7NEXOxwOmT6fBfIyyIhbNmriVV/JqxBdECcocFjzyQTasutXOd73il0+1g846XZdxafp7XQHq
	BUq/kJyhFGCFIlnassCeGLS9RR1Bc3F0Vt+le5dB87jNUT/fqr/py6qa94QIEixvAH6Q3GkBDTs
	xi51qXIjCxHm+aAQ+Re7VxWqciUZD4QXZh66L49QWFXMq8n9ShmV0tuRHFVA=
X-Received: by 2002:a05:6000:4310:b0:492:149f:67ae with SMTP id
 ffacd0b85a97d-492149f6981mr1747897f8f.32.1793887737967; Thu, 05 Nov 2026
 06:08:57 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
 <20261103101658.766905-10-jiangwenxiaomi@gmail.com> <sashiko-outbox-197081@kernel.org>
In-Reply-To: <sashiko-outbox-197081@kernel.org>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 5 Nov 2026 22:08:57 +0800
X-Gm-Features: AclHuK-oI2lqFn7xrX51ZgHU8s6oQxYB-yCUi_Hfebn7qU3X8_Z9eh5ZS-uOAXQ
Message-ID: <CAHKocdGnjANoU9EsD=o19Mg2WQ+=y3dODyKgNipyto+7WFZ8qw@mail.gmail.com>
Subject: Re: [PATCH v11 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
To: sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 18:19, <sashiko-bot@kernel.org> wrote:

> [Severity: Critical]
> Can vmap_pages_range_batched() overrun a physical chunk and map unowned
> physical memory when a coalesced batch of same-order chunks straddles a PMD
> boundary?
>
> [...]
>
> Should get_vmap_mapping_order() also bound the mapping order by the virtual
> address alignment of the current page or by the supported architectural map
> size?
>

Confirmed, this is a real overrun, and the same root cause applies to the
Critical findings on patches 05 and 10 as well. The batched walk coalesces
physically discontiguous chunks, and when a PMD boundary splits such a batch
in the middle of a chunk, the resumed PFN is still CONT_PTE_SIZE- aligned, so
arch_vmap_pte_range_map_size() maps past the end of the contiguous run.

> [Severity: High]
> Could switching vmap() to vmap_pages_range_batched() without setting
> VM_UNINITIALIZED on area expose a race with vread_iter() when a PMD is
> promoted to a huge page?
>
> [...]
>
> Should vmap() set VM_UNINITIALIZED when allocating the vm_struct and clear it
> via clear_vm_uninitialized_flag() after vmap_pages_range_batched() finishes?
>

Confirmed. vmap() can now promote a PMD to huge via
pmd_free_pte_range() while vread_iter() walks the page tables without the
mmap lock.

Both will be fixed in v12.

Thanks,
Wen
