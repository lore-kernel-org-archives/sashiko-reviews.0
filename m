Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5AD4A3F16
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010758; cv=pass; b=iPM5nZ3k/ZZ7sVuDRak2gtzJpad9w9TriaKMWTDLPoGeVYp2+Seh7tT5A0hki7YtJTWkEv7qcVOkvPQFFSQBYM0VdBHGYXdLKUi7FIsEnZDBc5m+XvXi6LTYTLOgoSTgGgfKt1UydXnsZpd8mXA2fCwYnxWVKWc9XO2UAZoAHaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010758; c=relaxed/simple;
	bh=2etocRQt3pnlAXRWdwTTQS7UEFqNVfVCOoEDKOcfG4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3k4zLvhAxdeUCyiwVd6M2ooFUG0ioWgx7mlZVVs0wOd0Swb0wqfxu+PhXmFnHxb4vJS/WYsGrqv6spXBTS+JDG8jL6eYAXrqNjWdyRp9qYONcdKfwC2M7rasDhkd9e1HtbNksLIoGB+5kcImS+w0f7yZk7sxiTj6ImbvmKCFak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxNHAPzJ; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxNHAPzJ"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso3388494eaf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792010756; cv=none;
        d=google.com; s=arc-20260327;
        b=pbztuSX3GQ3sYP/yNE/cO8KAyjQXEosEBf4x2OXrPakfZyN+HL3kRX3bTVpX7pxG2+
         2pb//QCpExc9ACFbyOKxMnQxXhmLSbdgdmQDVijooEgyApKAlwGpMEWUmIkcBjKST4gM
         7PXUVMQYYIUopvIEKoVpJIuinLyERMVfbGYnkLUUI1O79byO1ab8bPp9v38FqHYLBvpr
         i4wzJFJ/7YSD1u/OfZp1SBbx3OoSKngYmeRBoMYNkQ5xYKl2wt2p9/L2HHTUH4hklw5H
         BtWamIkMkjAE2nFVz+PaYYcioREwC94x455ufxFV1HP5AdaDzgl2RtfjE9GtayR9+j7E
         00OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2etocRQt3pnlAXRWdwTTQS7UEFqNVfVCOoEDKOcfG4I=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=N0DPl+JifJk+IiYw4MPH6sNpZckX6/3vyjF/BWmzSuOOuDjUysUa/hWYExCKwMLOdB
         /XaY8A0dpY83GyNNgEkkn5vHDhPbwrhthy+rlLQsVQvDpai0/M/It4pfbVrvQvy09b2q
         0x6w6yzkl6NCsoP7vuyLc6nq4tZzMptoUwpWGsfhGSzmmBWdjZstB+6RC57abgaAgQ2U
         K1Ax9uPc7JdqRA333FlehHDDImASdeFaPIpkVyAeLcECfTfO21HeC3b+BaVHRuZgyY8T
         pNcBbOCP3mSgovgEi3Ski+L9JfyurkJrn+ASDXMwSMcH785rzNybiKYaqM+lo3YFJqK6
         n7ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792010756; x=1792615556; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2etocRQt3pnlAXRWdwTTQS7UEFqNVfVCOoEDKOcfG4I=;
        b=KxNHAPzJZX6IqTHFenrAosNcLPK94lLuMQo6F8Yb72kpSY/n1p9fj4MJtwSxk7cIUn
         BQ2mflMM9/ax8i6CZXbscySgmbtAfhPx36XxDwfQJRBziUNK4BmA2TL93x96tJYJqdYl
         Lb3MNNnZG+KcCa9oC9JcORD3IFk4P0puIAfORVpZWCmfIH0REB7KSVi5lOjG3VU2hFyd
         ZKeGoLkwxhiYiASt+Bn/wqwCkKQdvXU9nbpMpIIJWx6LOnxp4xpwv/Uqq9t/IrZzcN9x
         MZ1oIEaYC+G3Mf7NFNwUwQzbrwRAW/Ht1SkrB2djKIj9EVT9X7WMVTxdClOhIL9Yf+KQ
         bWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010756; x=1792615556;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2etocRQt3pnlAXRWdwTTQS7UEFqNVfVCOoEDKOcfG4I=;
        b=tkU7tB+Obs7OlgeelG1I0eXL4voY9wJXpDRiconO65ZQv+AFhq6N/GHqdr2k4JD904
         05K42AchIJk0ynh4vxB9ke9QajdKBuav8HuTN2HyhTOjOcQdgWLkY+Tui/IGs+qCBGhl
         9hGxNVlq66q2sA81W/+yxWH7IhZM8M3vB2wwuJZmce+SEolWYefV6McbyX4TEwc4OSJy
         CUZeIENEkrez5fqotOhGVNDPD4WIRXP7n6XRgVkX4Cy/nlOvdii+jScgwL7pbGfUjY5p
         FN9g9dEhRWpt68m9nJ5AVo1395q/scThxcUPblvUAW24KRPclLZMR+V+SS6V8HMpuVOU
         dtYg==
X-Gm-Message-State: AFq9FYJB2v1hES4feR5xCoOCm538zTjvrGXXAg6VW70oNcbmqbRoQhgK
	oO70WtbrN4qXGCb1FMllWsW6Dhf8MvP8whkM1UAm8wxFfVxIu2oqD5I9o6tyyQDh9SRlqh/jiev
	bAF+ANJQ+SIua/OaO7J55d4ANaVEZoRjkh8akyH//enTWVSg7ya/6dOgI
X-Gm-Gg: AYBFou21hVrehdhkYdJeGdFKGUdWpYqI9zXzXGjmSYstFlvVPtTVoxoE9aehylPCGhf
	mojUVZ1OBKJDn76lhtUU9BEvXVU+j4QkTjJUo1TuEBcWjj1dr3/Rb920LsGm9ah2BWMDC2lyplv
	lHlGJRapfxERqf+LnTVHF4JUHaRpg5MXGrRideT5pPvNh18gr5xaHT0KQkxc7pB7RV41dBM6DHS
	RboHGWTV6OF884cRWxQEboP63tF4XQkazpj+IvW+KjmeydylYolDXmqtkJnt/t5fsRarZzj6IiI
	LK1/w7oS50na/hjuE2+naoLHXBtrjot0XNju1y3cI7Xu1w0ex3oOOMhBZc4vRxkIfestQG38C45
	+lVAaK/VOSg59FjoHYvPS0Jof
X-Received: by 2002:a05:6820:c85:b0:6d9:4c33:64fa with SMTP id
 006d021491bc7-6ef0e2e2752mr12643841eaf.37.1792010755328; Wed, 14 Oct 2026
 13:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014162144.4053279-1-jmoroni@google.com> <sashiko-outbox-171546@kernel.org>
In-Reply-To: <sashiko-outbox-171546@kernel.org>
From: Jacob Moroni <jmoroni@google.com>
Date: Wed, 14 Oct 2026 16:45:43 -0400
X-Gm-Features: AclHuK-iwztzR3eQTfvwV5eUJGwUE0EG1rrr7G4kwg3b4DgtUadOalfCGYHX5Yw
Message-ID: <CAHYDg1QA__BNuAnprKLWLpNoCy3Q8jCaNLZ3wSPxyvHLUKtxLw@mail.gmail.com>
Subject: Re: [PATCH rdma-next v2] RDMA/irdma: Check MR contiguity before PBLE alloc
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is a pre-existing issue and not caused by this patch.

I will send a separate follow-up patch to fix this by switching IRDMA
over to the newer "allocate a brand new MR" rereg_mr flow that Jason
mentioned in a different patch a while ago. That will eliminate this entire
class of "halfway torn down MR" bugs, if that's okay?

- Jake
