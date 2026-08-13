Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94863136672
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 00:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786579621; cv=none; b=CUIXXvimr01/k9CzF5AdwiJvdYOkASMKt6Wr34jgmAmKRV65MtGKFB6hMkmbIa6wYPAu5gCfYWDCcRbuSJip1PvQDEFZScMiUcNfUpfgy2AyYq1bIW7C5+iHLEjT6LpV5SWVmq5ybiTJ4U6FsbaKugFthtt2YFL83uN84wOxrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786579621; c=relaxed/simple;
	bh=4DFC9XcdQa+gXjY/jBLIEv888QmZKCWfftMFEJzsr2c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t5gnaR/dtCY2KgBaRQd5uR8b4vI/+qaQnlugMTxLs9O2nUuBqD8I9TdkmUUsxgzF0J+aAT3cIgKKGE8Spl+JC3diPyZ2iXT00I45J/fJm9Gc1BsdY9GdYPHVRZj3lt57WJXsxYVB6soISDAJXfI75d71LOdRapESQQ6sNoMOwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dU4l4ElE; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dU4l4ElE"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e024d2129so2382791b3a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 17:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786579619; x=1787184419; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKU+B6jA9oay19SIBewfSSwib4hWwrU7BKuj6eQWkeY=;
        b=dU4l4ElEeIGrpU40N2NweekFe9b9cL7uHFmS/FtlxhKxdrk6auPpXrxTJ+IkQOfw24
         4aOLUn6a7J42RKMjz0Nn/VZw6jG6V5+XUNrYX67eRZTLuuaXP+yzZSIyr4G0yakK7Eqe
         UQ0p/BZ2tjcM7QLUm3d315hIRSk5Wbo7YaCGk7QB8B3qH4zNu19DS1L/8vPGLo+7QXYW
         UG9x0Q1equ44VEZPOQHuS76n76RuVWrsb1Fajd1QB7HAHxvwUs+qlrrnnJNrcAsHwPhc
         pv4mAk5hsX6Bb0Ow4HOfzt7+0/0DT77iBcGgK77ADqtoBCRnA3Fk7TGzVspkvxAuroYN
         0fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786579619; x=1787184419;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKU+B6jA9oay19SIBewfSSwib4hWwrU7BKuj6eQWkeY=;
        b=KimYIaWnlGliSeZyp2mdZhH4kSaHroNsNDoylnZUNRMoZeVA2RQ0VAUormtVSjhIz6
         yr+NT94dNlI0D4QGn9/hZK1eHCixg3m0vEUdI0dvCWzHGGyKZgCXt7it+LbjPDyLvAq7
         S0+D73fr+Sngt3mSEwFa+G5DysCGKsmYWSceZA8NoFVxLAT80+4J1XRZF8GAC8j1fMuX
         fO6xU56KlFzgQUQdAbEhBGYdON9gm8g3o7ib6zZowIJ1UxBuUehoUWwihXialYCs9ws8
         QfbeE0U1lh2AUCbzvoj9voVlH2jHyUgTUiWR3Qj8fuSG0TfxFQeXunC+sZWANlhECX+s
         scbw==
X-Gm-Message-State: AOJu0Yw9CoNLOyL4RZcbLbwBtLZqljlvLYDVSOQrbPp2lqSclkF2/KL5
	2CkMh8vwCb8X1MFHcjAxwhTaBrbFJw48Ej4e/elANe2QBZSHdkbQdTCZPIcRSP2PiLi5OgwPz5r
	rq5509Q==
X-Received: from pgbcn3.prod.google.com ([2002:a05:6a02:a83:b0:c8f:d0d0:d863])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4103:b0:848:5540:2377
 with SMTP id d2e1a72fcca58-84fc6d3f4b3mr1871965b3a.17.1786579618762; Wed, 12
 Aug 2026 17:06:58 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:06:58 -0700
In-Reply-To: <b66874a9-3f3f-4b65-90b1-b08c4aab6649@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812080229.2481439-1-xiaoyao.li@intel.com>
 <20260812080229.2481439-5-xiaoyao.li@intel.com> <20260812082029.118791F000E9@smtp.kernel.org>
 <b66874a9-3f3f-4b65-90b1-b08c4aab6649@intel.com>
Message-ID: <an0KokdtSXE2GmM1@google.com>
Subject: Re: [PATCH v3 4/4] KVM: TDX: Enable Bus Lock VM exit
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 12, 2026, Xiaoyao Li wrote:
> On 8/12/2026 4:20 PM, sashiko-bot@kernel.org wrote:
> > Pre-existing issues:
> > - [High] The preexisting VMX handler vmx_handle_exit() silently drops negative error codes when a bus lock is detected.
> 
> As replied in the v2: VMX fix was sent already
> 
> https://lore.kernel.org/all/20260806111923.1990562-2-xiaoyao.li@intel.com/
> 
> BTW, Sean,
> 
> Will you pick the VMX fix separately from the series, if it looks OK to you?
> So the next version of that series can focus on the general x86 CAP changes.

Given how close we are to the merge window, it probably makes sense to include
it in this series.  It's not urgent enough to squeeze into 7.3-rc1, let alone 7.2,
so the very earliest I would grab it is 2.5 weeks from now.
