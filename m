Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA6386443
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349117; cv=pass; b=Kj1mVlO+uKNA84kLi3OIzxnqh56nTLHAE2jdAxLZwul3otPKidQsB7ihen4x24Do+iCG/NNpSBporRpYe3uPDqYB+4IK+7pc0QxZGw2OtEooK+8iB7OiyIUUJBZ0ZesPAWv8uSrvKm8RXAvzoUBy+l7siaFKv1Dj6fWuswNzHp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349117; c=relaxed/simple;
	bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeAJ26KtRx1Wo8NUshWEV9/95YWesXTEiNw5EAyqxrLt19gEshTWIOFPvxRLWM0qSDUbaXNM1g8wyyF4gf6pqdCGQ9Zxvf88MC5UIxXACmwNWiQifq0Pil8R7ZWuRVi1owAVrJ4XPMQmwJ3P9JPB6szSNG7KQL6ncqitEvv/LBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m45/kiCi; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m45/kiCi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso12548168a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 00:38:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779349114; cv=none;
        d=google.com; s=arc-20240605;
        b=GABIbcXpbg/rzjat234Rd5mi75HSyl6SEeJ9dHvyA5Y3c4dAfNO8xOXKPi0zqqIAqG
         8OPTNxFzjeTUZ6Rm6wDyUX+uggG3y0qkDdKlv5DCqcwY4pVQRyQjocTqZGAr+QsinAxO
         NhUHmqWn7KrLp79Rl+XwCRV3K/KqLakcWTqk/orZxYgB3/DX5SZPf2uSenDn6hOzoFHG
         Ny7KQ5V6t2RztDy2SJmRjPrmYt5KeRCccwk5xxLMmcLAT5q4y8sVKCveku/qVO/5AgIa
         QdmG5E08ZqrPKLSv56F4pg98GoqcS2sWbJUvE5LOjyViRoYTLUp+YdLbYdNwBDn8iUaq
         lpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        fh=AeKY19gMLQSz0DLAsIMuWcRjlV2JFnlpDHB2v0fV59U=;
        b=PLfBU/bw5luUS7cyJaP5KbKySfQRVK/idAqFllG2aCpCeSnOCU9T9tUMJY6nbv0yOT
         llHZ/91nM0CqU5xx2oFATRrAE1Ov2Ou6V7daGhZDGzaaHVP7yzk/Cm29eZe0wQmNb2DA
         jzx+Y82QLGNqg5/albioZtmDzsE+xW0ZVf/eIF4Ps48JUgj/q0WmB0u51KxvjoelFx15
         zx1pC0TBQT3Ofs6bFEIncutXa1jxhvK3RauLkqeRKdcXF4wCgyeTec1UC6fMntACSppX
         RzkNrcJtaEdfLJB7pVLj1yayuid5oNmUyrsZXe9FJniqeRfC6w8yToOM0ufIWWvstu6R
         Shfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779349114; x=1779953914; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        b=m45/kiCiAYCTT4zYxO85m7N6bssPGJkPKhvjgp5i4FnGOoZ+JDhvkzn5MxJRCbnfrH
         r39jQLp+MKUGbgFXdypffcueKob21LIl2T2Tp3VMXOqdxWt6R++zbGMBoof0e0ef0/4T
         Kt2G7U4xVjaGKS/YoTo3tdcGTxzpTsxd3xZeoE5/xfOL+vCGp/S7BEC4yaHy2ySWKhpC
         SZNWhfA2XA3J2L4KcYdnxE16ELTV5h6hqhEkdyYQdVXBx0jB7J7y5ulXnH4MIBAh507x
         a48dTHeL/hJj/oEJC2NwH8c5uC8KLrxnvCMFagYrjHDdkXypbOU7vZWZLCk9PMbzSKAa
         Rwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349114; x=1779953914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYE6AwotSwk91GJo45vtKZgWH8fG+L9aVrfxpVFSg40=;
        b=OK1DhD82BbBVxNh1PngWgXcdjvJZi1zYtuICqHL9/Zy637MllZ3WWOmxbthIOYIVs4
         fbpAc8VbaS1k4YgBCRB8vTj24RUmVEQUMzcGNF+R7DfnG4QFh1vkg12jmEW1dNlIWzXN
         l715E1FOWe6NtF1e+qY2HDZSIOBweHPMs5jYp9xL4379HWwEEkj6If5eJFiZ8Fk384YQ
         9yDMs0RcsmB7yaAuWxj349bbVwcYucxgnK1hhiGB+/vXr51aj+kjKX/bm1j+KGVXZPZW
         lRELRE2zYj1gfcMYEuLfPvvtT8Vu81zW+fz/YVXoyiMwjsV8KUT8s4SWWwR/vuLN4qUO
         ZcCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZEe8TmrcGkrDOGRdeSyr8pA8t3mfEdzkBKWWxDlQH07aa1HMmx07SlMU/UtXYLxr1yqIRpc1SpYLfIZpAuFs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIuydAQ/o7zDBsEVB61fjiv0FbE+/bemnLpxQWHhrhGbQiznWf
	GzfsH3iyder4hchc6QcfMc0t3x6rN/CB5YgpgzAtLkMmLQzwzpl5AuFynZ9C8tNRpyuDykjvdct
	UzoA7QVKQ4si5HFvMYOBmzVMil7h6B8qMViKRwBrd/A==
X-Gm-Gg: Acq92OE6yzWLsMEV+/NX87VMIVF0bQ5718rIDYD7X1T1y3LpcB1EFGgviAIuoVw8+U5
	mZQsdMY2C/r2IMFebdnXHPoRYr/2RhDWPNxBNl/qsaQe71be32WpJDLtTEmMxEanBjUBuVkKSlK
	BJTvZ1tOGG3OL3WSPZUpocYCuJ/d7bPt/WzfA0DBwWij28C4cux63ZXWvb+Y2yxYyxT+i4a+4Z2
	wfs3iZhIo/9kssSL/PKZqoWgjuzwKOBov+Om2C890AY/BnOp4AhrqYhE6Qq9bZfqNxoUBszjGrt
	2WTd8ghRyTrqDUJa2LA3CNg/OApXSNpxbK9L17oZ2Q==
X-Received: by 2002:a05:6402:34c3:b0:686:d801:96c9 with SMTP id
 4fb4d7f45d1cf-688367cfeb0mr797381a12.14.1779349113964; Thu, 21 May 2026
 00:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513-exynos850-cpuhotplug-v4-3-54fec5f65362@linaro.org>
 <20260514053037.BB9A1C2BCB7@smtp.kernel.org> <DINMSL1LPPCF.1U0AO6MYUFTN2@linaro.org>
In-Reply-To: <DINMSL1LPPCF.1U0AO6MYUFTN2@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 21 May 2026 08:38:22 +0100
X-Gm-Features: AVHnY4IWx-1LpMYkHNMVlV5-A-NXDPnKWwrYcqsb3AhsVZOrTUQ92kJoyqXmTRQ
Message-ID: <CADrjBPpBJ6cZYnGRkSVDA4BVKC_rh=KKvSWq2VjCTDMo5nMmPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] soc: samsung: exynos-pmu: generalise
 gs101-specific cpu{idle,hotplug} for Exynos SoCs
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, 
	linux-samsung-soc@vger.kernel.org, sashiko-reviews@lists.linux.dev, 
	conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 20 May 2026 at 17:06, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> (adding samsung list and other folks back in c/c)
>
> On Thu May 14, 2026 at 6:30 AM BST, sashiko-bot wrote:
> > Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> > - [High] Hardware register misprogramming due to incorrect CPU index from smp_processor_id().
> > - [High] Use-After-Free of device node intr_gen_node.
> > - [High] Missing teardown of global notifiers on probe failure causes Use-After-Free.
> > - [Medium] Missing of_node_put() on error path causes a device node reference leak.
> > --
>
> Sashiko reported quite good findings. I'd say that most of them were
> present in the code one way or another before my series.
> They look fixable.
> I'd rather need then two series: first one with fixes and then
> generalisation of cpuhp for Exynos but first one will be listed as a
> dependency (but dependency will indicate order of how series should
> be applied). Is that okay with you to proceed this way?

That sounds like a good approach to me; then you can use Fixes tag so
it gets into stable for gs101.

Peter
