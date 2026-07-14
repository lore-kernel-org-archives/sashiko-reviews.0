Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520494C900B
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 15:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042235; cv=pass; b=l+gRjbjW7xU1dXYasHisDW0B3aQ3pr3DZDt991kQPuZo3yQ4ivHmPNtuc+sNCpecpT51EoyrLZp1YDGqAtoKvf52LM2awlWV96jPT/Dt8lWXjieGMa2cx7adLyhsAR+g6dZjnTGcB/iEcIH+pvYP8OzfwGEqlijudK1FPiIfK0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042235; c=relaxed/simple;
	bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohB8bvWtiEqUtJ4hQZINdlJr9wuvJTAVnkDndemAYMsWbnHIE2N77YbxTm2ToeIdrAy/RYMCnG/rRzJdZ5bj4qghps4E9/Wq5fj651bmeUphKakdtQcg41z/MCHlGM2ycHP0DFZvNyktDGnqtFa/WerFDRL6InjEhLOo2xNqswE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCL0LV1F; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCL0LV1F"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so6303170a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 08:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784042232; cv=none;
        d=google.com; s=arc-20260327;
        b=JuBtSrmmvnfGG6kIu3Y/W4WXSV7ILXLHx/e66lVc7v27CXY3JlFc10NSRU3Mg5/o0p
         kJ3OVyg6W79dfbCyf+rd0GyhAw054fLbUd5gyMRcVaXbt036h23ihNnxKP/ZirPYVek+
         emnZ/O2XGKiWbObVk77vQJ4Szi2BaK6qYCDtM3pHzEGEKRXHNW7eTovM89qOB6I/JLIE
         aqbIMv33C3Nj/1nmJuvQX4obDeOWdFecq3fui018YcYSAPcQ8dF62dP1cY/SR1vJETjg
         PwHjINT6Zh3AU7GkKMgDjw6UodbOa8LJZVrmwCq1x5N+xOoFAZNzUHU8buOx+CICP9tj
         fx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
        fh=rEbUDeSlRDHDClN5FFB/8opoJgSDYGApSTj8TnPxcCE=;
        b=X9W63mwQq/uwlCtL9/HzUTQLqGlerpW9zOle8Nlv0Fw0UfON7S/IQu5PG++p0m86P2
         fGqG3oqVnRXk9ScmwY25qMoj52JtrmS1KeaZpYQHvNUnOCX3TCcWoIBGlY21rrlO6jBL
         AK0Q+YkZQYwDi9ezV1WQMFk9CDUfIRR4bgtAIcHuKxuKsbTN43hArBN+HexTBDOgpJ6k
         JoI/WOTqjKGG9YkqUpHq1Q9L08XhJHEdTXKbRbZnzqlBoy6Q0Ri3hdwmVPTmHMEyXxjd
         hYk0wqOIRGxsmXbWm+IfVVxWBzp+Kh0VdNHfxjhH+OtJZm5naR6A4ahTfoufIeWp3BvL
         m+xw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784042232; x=1784647032; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
        b=RCL0LV1FN3GS7GMVT6ibv5uQYgsRt00/dvKSX7ivlpjkvvg+TEDBwrD8hQUdR1Knul
         F/MRh7Ye6EKe27sHuvVNwL7FuD/6X3X9Z8jQqsJiYJPRWQXhc7iK8nAYoYPtdYA8aKc7
         w9Bz2kUFJza16qzcHN6EZHWCIgMKLAaVQg25Tt/SHesnP03GIOWVmriyUVJVbWIOQhDN
         zjA3X8Dg4myhEe03l2M4Q+OXYsC9oaifbaxTq2uTp4KouweAQ4Pqv8YuRk8ms33xBVo1
         PRUEYFhreLi2aFHYP5PmcW+eIHU/cKV3vZz9Enmxtq75AfUesH2xHdWXaCw2tCOY+jt4
         f7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042232; x=1784647032;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCZioSxZUKRoFUoafPKC6kOcWAwiCPQKbHmk8VnfLNk=;
        b=E5JARPvfWWNdh1D9d1wCGsMHxu5Jjplx1qpDtcR4ZVAPchMEcEH96/PT9lDJzeWVwg
         Yia/agN4+8WxkEyFUMlyqwzWP71upFmYhzQEuvzZ77okGniqBrTHPWKqNE6wGLFhYX/4
         TvOvIGFWU3vYwJL8pwzefp1VjCeRkmI6tHMgLNPsXI/9AAEgQo1AjdlECEfrpHCyt1qo
         KJZnJHXZRAfVu5TTZsV3h49hausdJiqkbe5OJ5+b9+jWDckm/INzoBx5NDilD28v++Rd
         jXgc0lTVRaQEi/93uzqDA8ZBrCVyDt1VZc6/2zDkIAk/sKLxgKfsABvS4YgK6Uc+Vi/s
         Cw0A==
X-Gm-Message-State: AOJu0YzZQvRw3ZCzaTTY/0g0Ne/rZ4PXENJwH4X/gvztBduhpj1Vdk/0
	xJfMdlE7r1y2C2cpoj0z/hY4YyD7+a6a/BA+OEFXbDLnTbLz0zCQ+HKrjcfyEhyuPCJ4ZgrQBsM
	k4Zrm0R5kMCG77w5Z0gLpvcq7yNvGXoAksrlW
X-Gm-Gg: AfdE7clZqxAbubTYAKcfTOYeEqKLuQlYZG9jxfA+gcU+VEUgPb6Y2EI38pVYhpqGWRV
	diwx47vwH4iVZGrLMBKM7h1AGXB7yEz7A5KgfgXeOzBtx5+PIvj0X1UnEh/ahjBJPZp6Zmgxr/R
	WYaqe1rG+85h2rOhxGTXluDqYILhvbFawfAS8Bu/1MQl19BtFace1BiUziGo59ELl9f9/pZR9yN
	6QiPtTCLSQb2hHBh7UH0Vf+IFJQpOCTmb4WtRJChhadtyzzJVSQLNM0IcFar/vYqeNjTPWLxg==
X-Received: by 2002:a17:907:da16:b0:c16:534:6a30 with SMTP id
 a640c23a62f3a-c1667bb3a0dmr153796766b.58.1784042232390; Tue, 14 Jul 2026
 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713131223.279555-1-a.shimko.dev@gmail.com>
 <20260713131223.279555-2-a.shimko.dev@gmail.com> <20260714131728.6C94F1F000E9@smtp.kernel.org>
In-Reply-To: <20260714131728.6C94F1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 14 Jul 2026 18:17:00 +0300
X-Gm-Features: AUfX_mxoe0WVqnkvs3GVvNEK0y0uCrWT_C7Lanjv8yWfj1dW_K7a-g6ZJXk_Svs
Message-ID: <CAOPX7470Xdk=O6xxQRUyiYg25yQfXDpD+MEeAWwVyLVF8zQJKA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: add DAPU Telecom
 DAP8211R(I) PHY binding
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 4:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: Medium]
> Since this property is a vendor-specific extension, should it include a
> vendor prefix like dapu,tx-inverted-clk? Introducing custom properties
> without a prefix risks colliding with future standard properties.
It will be fixed.

> [Severity: Medium]
> Will this compatible string cause the example to bypass validation for th=
is
> schema? The schema requires the compatible string to be exactly
> "ethernet-phy-id0008.011b". If the example is not evaluated against this
> file's schema, it can hide other validation failures.
It will be fixed.

> [Severity: Medium]
> Will this value trigger a validation error when the compatible string
> mismatch is fixed? The tx-internal-delay-ps property enforces an enum wit=
h
> strict 150 ps steps, and 1150 is not in the list of allowed values.
I wanted to show that you can specify values other than just multiples
of 150 ps. But I think that would be unnecessary.
It will be fixed.
--
Best regards,
Artem
