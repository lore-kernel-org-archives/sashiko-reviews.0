Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D153C4B77
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555614; cv=pass; b=m2EjJYCY167JpmUX4bA/5Ya+M4WUrUhGj7Q/5AohPAW6RRNR3lSw2b5JWaN47Pn/AjspLEvbj8B90CUmm+mxwUyij6R7zwkBGDIteY8DIXKJdnLNH2wqUEijQUjLkQb2G8Q5KvGh9Ek2w5e6PMgHGPjUmGs8SdrgH52hoTYQWHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555614; c=relaxed/simple;
	bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRCv4IHwGRTE8BdgjNV2VEkQvFUuSFEa+ABmXHo+qTzaEMKJ9PN9KYthHjdRP+kR1XncsMaRg2AyP5evNMW8BqoewtXCZDN+rtUPZmcMSz9g7wmHRt/SzI/S35uZ+qduCRhN9rnUi5DhxSmSmzxXqpwwKfsYgtvssv/uuTmy/Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdHW98Bg; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdHW98Bg"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-69d862236ddso252992eaf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 23:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780555609; cv=none;
        d=google.com; s=arc-20240605;
        b=BpEpE+KhLKzNxTmkU1PAp5q5qoRNh2DWZsUgcrsjGjABIUu7wnN8nQgbKDytrI1iBN
         2yGjov0iVeJtGqrkeCOoNnqUjbqgGcQTnp+adr09duRjzIRomPy28dt4ltcXL5tVkYJV
         WwFZz3hgDBVZruCChSQPWICtRDmEmbCsrfgTJshAY2tabCwgKcgrrOF7mnL74/P0eepE
         XlpdTMloSNUkkreLwCtFBmvGXBuZ68HYRL+R/Ptc9Ke2SwYk2HRryc/2XLn6JtmXppi9
         OO/o5Nli3WZVKPBAqkrUAexpFlDF3gwBr/00FXTKvMks+t9x+//GvH5dBCX9iPnVNcSQ
         lxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
        fh=6x9uhpCI/gq+YqWyh60QozKX94C8TIGbO7qpTkaI1lo=;
        b=cIEW7oPPXVbnQP/evN6joGclEY/5pA7rBzXpqWcIewMaVkadw3NxcMAFeuucUzCw8N
         ZDhDy/MYa+Iyp9RznFIpcVKpcvwY2ndNp8iJuaZaOyTf+/1xgQMEKdW8R8ykzsEylIXN
         MrE0764/IxYspbBpXvBHRi4Ij6rbBmoe00ve3yltEX/rCdB0EX8DoOfxw25dsixcuUkB
         e4+o+G1woTi7S9JnaGVHAEvXvd6eBUIGZIxDPobN2FoPLWYRCcI7KbXT9PAS/ZWOhsea
         vyJ4+UPoZMfJfRSsaxsp6kg/PYNQfi1IAt18Ud6xzt5lQ0Xomv5LFWeoGO7ldLtMusPy
         q3BQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780555609; x=1781160409; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
        b=jdHW98BgUO6r81fPJp8am3mzXMnq7kEaSW/6WkGv2l6kkElZx3Q/9XXEEOTd5eDWAf
         Ql1t+fV8K1V88Tn18Osn438BlX/16cWpODWMLNYRYggpCo59vL+t7h7etudloQAIF8Sk
         Z65kWh2B+szjYW1dI66GoHY8yohToWhahg2vEnAtaPH8SL8HLc6LDav60OvtAtsy+R2l
         1tbYen1fHXvyeva3EGs0MW6a3IIZkQa5gVczXU0GZM0iEHA7A7lEMPtRBFD7XDzVsNCE
         DDiUQeAxP/m0pX2a9BN0c7N4NbPSdfAYzcV9t59ZJUKOTLvgeI7Y6NBnSzTjS6mY4V46
         e6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555609; x=1781160409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
        b=qios3vDrDoWiEwBmZHxP1lWlTsk4tF+r1zl1jVAbQvpjA22Fy6WrnFrwUawVQ0EQm1
         cobu7WFo9VbMkjjtQ26e6dqmKiQ7p6mM1WDd5lOoxSNKdNmZPnp1BAYevs5ZYvR0kGXW
         eQGTi3ljEwdUbaWyDpbkFDp58hHNWmb0sDuI6gjZbhWfx1ZP91ye4AIhbsghrT4rxgyM
         LMGtIX9XDoxGDhEe5myAZsbRVFUFYqRN7tKtD7cd/XqLNaKKNX1tk1mfx/78EXTutqMd
         3H3UN3uYxiMxIuGRGbrBn+1M0/7Ml3HuasClPaXSw1I6EXEuFe860BKSyzVz/hf5dqRd
         jzbA==
X-Gm-Message-State: AOJu0Yz22a7ooiSn8RBlFXvJ5p9SG6Rb/2wF413pCZytOXKHXY9H7Axl
	DZpMAYNT34VycJWOi8mYA3zuf46tgWtsHvF+eq8FnX2hpZYJOmhiLB6HIWW6mnQfLdDhlSBNv0X
	IwtN/K85Cy0T2gSMDpzm1TO0RIeFueUAaGpqKxi7cAw==
X-Gm-Gg: Acq92OF0Zw5ybTh8cJoPPv9kkXv3gwYnC7pDSOHO3fTVE8yBdAJhNzmImjsBjFjBIZj
	qYkCkpuPWYM7/3ACFTlgc98ZMngxWDtQV38bItVYtJ3rSaF23LYeGCFYVc1OO0QjLFS/8BlNAmr
	1tuP1lPUNVyT2Ikvcd6Dxp092Og7CZBZi0APVaqVEWtlg03gSKDRpFcz/wkGzyeXmepR5Ae+Jp6
	COGn5iWpRTeC2kQ6w8nwIuYcQ1gYiYXPQBDuFjwremj4fnlFJrgmuSHanh0BigQSDLsy9YHXH9B
	czU/ZV7Xhp/tY8/DZ68iBrM=
X-Received: by 2002:a05:6820:2d45:b0:69e:1a0c:123b with SMTP id
 006d021491bc7-69e47ec6971mr2637278eaf.24.1780555608862; Wed, 03 Jun 2026
 23:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-rva23u64-hwprobe-v2-v3-13-5529a7b28384@gmail.com> <20260602233750.B03631F00893@smtp.kernel.org>
In-Reply-To: <20260602233750.B03631F00893@smtp.kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 4 Jun 2026 14:46:36 +0800
X-Gm-Features: AVHnY4JQnjs7_bMYHUUcNhOXOgnpJynf1huEM1b6suF6X2cIO5M1zEC4xtBl6pQ
Message-ID: <CA+Ck9FaHADhss2sV=Z-vX4zr6VL+X=goFX_vznYE9JWBGCjwZQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, kvm@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 3, 2026 at 7:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Detection of the RVA23U64 profile fails on compliant platforms=
 because it strictly requires the unratified `RISCV_ISA_EXT_B` bundle inste=
ad of the formally ratified bitmanip extensions (`Zba`, `Zbb`, `Zbs`).

I disagree. But I would welcome more ideas.

My reply is threaded in v2, FYI:
Link: https://lore.kernel.org/linux-riscv/CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2=
QtaxCHd+XOr7DgH5+w@mail.gmail.com/#t
[1]

Also, when Sashiko says "unratified `RISCV_ISA_EXT_B`", this is wrong.
B is ratified.

BR
Guodong
