Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F9C3CA4BF
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779793113; cv=none; b=RjqUtQqj/MKbkFQK8sRPfgU39smLZpREU8g6JAm4d2YBSrMtBt78NnmcuoUZEy7AXlNwTgcaYAZ+UcVJDhoG34zN8C6ZNRlYly1OhxrCHptVWVRYGfAhlbO2Y06+1QjJhLW0QR55hLglCjRNOp1ptiCPNtyXNoVYZx1+HkT1GFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779793113; c=relaxed/simple;
	bh=a97WdgvdJR2aCC+EG25ggPwSDJ17gXcQGcXDd0S8MFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nFqCvE5iqA7PxvwzrfPJUitUduHh2DPdNuwJc0/Dx9x9UZnFcQ7tZuCUDN2+aCea5Q8cy+spVnyTuqMvKIRcn9SzwuFshohMMeIpPL3ymlZrCgRjKGwrh3zcssvgHrvtkDl37MGEYZsUSm/MNjbrPEdFgtmry0vcedM/s1+gH2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=edz3nzV/; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="edz3nzV/"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso19412151a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1779793111; x=1780397911; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a97WdgvdJR2aCC+EG25ggPwSDJ17gXcQGcXDd0S8MFo=;
        b=edz3nzV/m+YV8xWciXfNvAysR7d86KjhCtzkyh1ikI0FC0wiLnFrE9eCv+QpQ8UWA4
         gbDW1PdUFdfswn7akb1S4DOhj2QC1t1YSY9TUHE6QL3KUHLxl6iE67yyGb0YwRWd7VIW
         i+wzGrfcUSvC1Ab3oEvsnePbhkUMC7X/fIsg73OJNvhfFrwmSUvDjCZOTrVpNyKr5zPt
         AhiNb/nf/ET+lGeX6YeykeDXoMT3+swr9QCfTb0ifcYDNEGYbl6srmMzkukXNj4tmPx3
         pCt9WcEVKtduSd+g7K2Z7t646EqYr5QpDky322VcYhw43QRGpQR7aDS4NpnHbEdMB5+F
         hGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779793111; x=1780397911;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a97WdgvdJR2aCC+EG25ggPwSDJ17gXcQGcXDd0S8MFo=;
        b=OYwIyXEsBk0uyrbrIlPJ/dG0pysbNrCFvQy7AsxheFxm3gZa55RXVvNccmlRby/BBd
         /M/QtMcpeDRs/aQDpsIB5ECHmU7be+mB/Zcr6YVpi6YnnfR+OxlyjGIJq+tB1MLNMfRZ
         /pNbzeuK/+zyeuqLL8v/G3LoMx4KtqhVoIYpG3spjkxVr9pIRreWe2ADeKvicQceIT8b
         vOcss/0insax8gSEryW4ObHx9zes6bwAZrDAU+z47KuzKRW2Rb0pR/wbonGLAjn6R8rw
         b2OW9DQKYaTih0AEAZ1KBLc6ASP2xEFIi4dIvwc7/fxE/1KbAt0GsADpePWe0aqZSGNQ
         9wDg==
X-Forwarded-Encrypted: i=1; AFNElJ8wqOHQ2kuXeOFZKdUz+4R6EeI1fDg5kh3pkPdhm0BH3j66ApZMhLKhxAEhg2qw08iHYojRlyD4/QzzX3BVyq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhVcwhfzAjSvcdbN7zWEHgcwnCMZx4zTsc8s+zSueL1Y4B6Ush
	DY43/DsCJLTehv/TZ9KcdHCtFzGAzp6e+IDlAKANV3YlbV96LwwEtNXLMw8g3gr3mkk=
X-Gm-Gg: Acq92OEurc6zhXi4Ilv7cuVNbztRyTe0E0R3SucmaipwCSi8DwVH8Gcz605u7BV+ivs
	hoPCf5vWkanYI9tmwrFayHyH5zR1/PNlsi6o7Iv4Fo7hvlpZf5CKlLJd4rjPUW9XJnOYYUHW5gb
	u/U44EW5oivyQJx2S9kh+2kyPfg4xZezxiUlx8QbFml2NO4GYaRGrdpQprfLxBJxXN7hhD9Tjht
	Xu+OEJTO2OIKJDH/0m+pLwfkINNgMkfGOWnuB1rZvhbQ2+Ds/+8B5AH+o8gvhtXyWLVT3vIflWX
	RPj6wvfJHY5+SpIgKBJLu5VlpuqJJgCbEkel0T6vlT4bg2N9e10CrTP6O9KOPaIDd4rpO9yzjSx
	pQInFs8kF16sOf0WffypAwSo9Np52J7ZyJniQD5WMtY/BYXrlrin96Qsgqf6BG3JDG4e/UGZH0g
	R4JX5AOHDmCtg2R1AkwVK+13ZrFw==
X-Received: by 2002:a17:907:9454:b0:bc1:9d5d:e020 with SMTP id a640c23a62f3a-bdbffc5ff17mr1141064166b.10.1779793109597;
        Tue, 26 May 2026 03:58:29 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc355d25bsm478129366b.27.2026.05.26.03.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:58:29 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: sashiko-bot@kernel.org
Cc: "Jiri Olsa" <jolsa@kernel.org>,  sashiko-reviews@lists.linux.dev,
  bpf@vger.kernel.org
Subject: Re: [PATCHv3 07/12] selftests/bpf: Emit nop,nop10 instructions
 combo for x86_64 arch
In-Reply-To: <20260521132121.EEB4E1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 21 May 2026 13:21:21
	+0000")
References: <20260521124411.31133-8-jolsa@kernel.org>
	<20260521132121.EEB4E1F000E9@smtp.kernel.org>
Date: Tue, 26 May 2026 12:58:28 +0200
Message-ID: <87bje277zf.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 21, 2026 at 01:21 PM GMT, sashiko-bot@kernel.org wrote:

[...]

> Would using two consecutive 5-byte nops instead of a single 10-byte
> nop safely provide the padding needed for a 5-byte patch?

Perhaps worth clarifying that nop5,nop5 wouldn't allow us to leave the
CALL in nop10 tail after the optimize/unoptimize cycle.
