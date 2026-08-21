Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B52DA768
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787335567; cv=pass; b=qN8VUaN2MkTre6Hzl2cJupZ2OQFfj4/as32CRnUkmAQy3sJxgTGe3VGsBA4kkgLXXagP9Bs+25Csyf8OB7s3wor9JXeCZ3mexP2lknvzr0/bTIppcu58T5xGSv88Kz1ElKLt92l9KwdnBZ85Haq+KRXuhCMOBxSmlsA+jqaHYT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787335567; c=relaxed/simple;
	bh=1LthjORSPcmpyo5UW7oXGx/EBc/qFcqg4eoh5yX5pMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8YSLUVndieUgOhhXrdePs0c8l33scESaA51ZAqHqSuOgaG8PWwae33fPJD8WlHru76P2x1/wk1mmxNdry3HAPtGZqcs7tt6F8zOA8k1sHlTwoSwd66TkdLYOWcqvxOraq0rWY3l6fLnl2xa6nswQi8tnqI0AOsVeqNiGsp2zEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DJnfRaO5; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DJnfRaO5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69fec8b4638so1279a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 11:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787335564; cv=none;
        d=google.com; s=arc-20260327;
        b=RYj2AxFuT3of28DrXCQaJgGpMovxGC3SEqBAdU5EYbncqGBP6g0SmmX0YfEdlhFcao
         UjbyyQAt60oLTnNEJFkN11e6Ako42P60bW4Fnoy/lXd0gX2I0IzH2i13xkYsmbCc8rc6
         YN9JZ1R/Eg3+d9Trx0TRdiN66r5PiZREeXLEi3yWHkSF8HDPCPbFBIdSnCSP/jBphTVw
         CJAmmxw8LcNipZ8+Xs3PK0+ShMvZb9GKRyDCpsFrKbkwsQhW8Ui70JgThFbL2a5FWts4
         PvWFoB+Nh0oJjsaugj6rDqzF64WJvIzobg19TwyYnm+1mSZJXzHNwVJG20H1OFDJLg/M
         t1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1LthjORSPcmpyo5UW7oXGx/EBc/qFcqg4eoh5yX5pMc=;
        fh=2E8G5L5HRIhYv0SLHRh0bmuG4bK/RxhrEd6+zC1U6gY=;
        b=kGeRay9hYP4CXmv9irt3nR+6h0lSyo48W+fP7boylQ4J5qjH33/9sIxLAu+x1T8LqK
         CVpXpHc/aMQy+61YRfnUy0IxfwtaMrZezcKY4wVlzoludMDVR8FjR/7pIjzjaU/G3AW1
         SsdaR1DUPJB6w5Ck9hkxr7lsFOBmjhuguBDgLVxzwxlT/S4ocY3iV64H/hJHsEYxHBpH
         0/qCnjaXB3cM3JfpP8Y5wpn1clYGnR4Xkr5EKEXgQoFMx69Aj9lxUmdqv9JturCVUEVK
         t4ZIxJiGZuqDJ7JzKVA32FL9RrrWbXwdaORKAZTkgAe+NDOI11Q2cM7jIZicVE2TFrhy
         Tkww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787335564; x=1787940364; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LthjORSPcmpyo5UW7oXGx/EBc/qFcqg4eoh5yX5pMc=;
        b=DJnfRaO5CNg9tffNcA5O7hhGoPCB2RNvkotTkn00Lh2QKEexUtAukdGhGSPUHmiLmS
         i0AutyhQ++JG1BSHO0JK5/uaVYdRBKrMON+Dz8vhy7vL1eeUI3TN69tkgJSoy5qbcnAh
         N9sQguQLrh8/DIvogBaH8WZ+KrcukCbFlryv99Q72Fhcz5LSKbB5IBZ14/IC43dQRDlw
         mgL6r2xGJ+Ap3NCNojv+zBoGem4FyGecnHs0Ng5pgXLOA1WJGCB3EIeyNvzUwMzBangk
         u7VwXdIfCTgRgiRsIDlmZl2QrWvcNbhpzedtDW7nz1glhpy5qKC+9Um8n901g0aanQ7u
         kEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335564; x=1787940364;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1LthjORSPcmpyo5UW7oXGx/EBc/qFcqg4eoh5yX5pMc=;
        b=oI+FEHjx+J2Yj9K3E0BBs/xiCxUrE8Ze4zq0KVNEV26Vp4sx1dIJKpk0dxh2WE+PGR
         iKSe0uwrjR9gpb6iMm0HuuWiye7yIyE78aeS9Ny/YS4viTkD5xstRWOW0l+jpyV7zuvT
         Ht0Hbyjrlh/8wAtcu3ChCr++DOzW0Ohe6AHuFNW1XKq3PoixAv74iE33Dr8AoUTwMcXn
         DNm8Gqi1wapPUOFJiv0MHrWsPYrERMTCKy5aJkt7PVerE0Z2OjkKEN5ne6pr0esGgT+m
         KeN0Duq1iBuzT3RS7xCNIUKsjqyBfUh1knnMOT+6u167Qv4iwy8AcOBfny6Io/RpqUjY
         S1Ww==
X-Gm-Message-State: AFuF++kQDnYeXKqdpcXFX83Nge9V4xd1AW5ZYDHxR71//iLqBT5UsGrY
	YE1F7mNj8bEygtYTLwfWIH2tKW8ZF2ibcBRN2isO1jDH4jzY978LqyoacRADYFeh6DPrF9Hl8VX
	OUslg/bWOK2UvK+Du4FtHWC7qQWXA1UZwgy9kvhhQB/guM8NU+rHz/zQpWLM=
X-Gm-Gg: AR+sD100eSfGoFZEGFkowBayJI5MWkHKwOms9gD0mKIqpIIOuyL4GB+VW8usrew+jxD
	YkV0unGFjNQAdYfc4kkqFhkUzQyVNjVsEEuk4EWkGeTlCcY+izSaScCvfCspsSu78CTVLBfh8Sb
	XYSZqzu6NRBMlHKFAefjK7iXErxMQsvvmsyzIGy3ufHTTOiNBOnfV08mRMmQyLOd3zXlHBbu8E7
	g7Twce9fWAKG6+UTWTSidUzscf10RMMh2tf47FTxHaMcOoUF40o6gLOFPj9FC/uUtHTWxr8dJTg
	OCX5JYDbLz7xmQyMEj+1tenSusY7A6DGfcgPSiLji04ryCrnMYrZM4sghJzvVsDgCa22rKJx1xI
	IfIdp34tZmKhm6el5xWdLmTiljowqRXx7
X-Received: by 2002:aa7:d58f:0:b0:69f:d9cd:ec41 with SMTP id
 4fb4d7f45d1cf-6a5829285c4mr2112a12.6.1787335563218; Fri, 21 Aug 2026 11:06:03
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821134521.2211943-1-aniketmaurya@google.com> <20260821140140.652491F000E9@smtp.kernel.org>
In-Reply-To: <20260821140140.652491F000E9@smtp.kernel.org>
From: "Aniket ." <aniketmaurya@google.com>
Date: Fri, 21 Aug 2026 23:35:51 +0530
X-Gm-Features: AcwNN1Vll-2JGB7PneFsCkdYdlfUsx8ee3WY1745-4slYygAtC_iXP2aaVNBdFs
Message-ID: <CAMmmMt3t5dPVfoZAir-n5mq9MUaa9LshH_29HQGMPmWKtzB5=A@mail.gmail.com>
Subject: Re: [PATCH v2] PCI/ASPM: Clear L1SS capability when L1 latency is unacceptable
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This isn't a bug introduced by this patch, but the ASPM sysfs show and store
> functions fetch the link_state pointer locklessly and do not check for NULL
> before dereferencing it.

This is a different issue and can be fixed separately.
