Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3313AEF57
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302575; cv=none; b=tV+FagvtQzThieCHinDt9NuPxmBOVvc9akdq9k2E4t9bM5yc5VjgPxkL78oPzOcsJ3/ChWZb2o778zwuPKf3EGzkdtqZu18jZWI9vodfnQwguX0lLnWaJXah2L0WP4Vpo+YQh4W5zzDO35R2TYf3sB9nrqX3py0+Tc+2uDjP684=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302575; c=relaxed/simple;
	bh=8111Qd+mRYZcNLNqgu3KSlEknrL1BX/iBccbqkA4J+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YgBZtT3sL1cdKD4qNHuhJFhJsxe5Zjqr9vSYP8pSz/GxJ4hzJzpgfxETMBi6Ijvx54UhoxpdLHBtxNYeFAb/K26R/oKeJ+YIwC/728LlAOzpVjzMoxLuwmGvqGxNLztxofRC5iBcDFfCRJ/TuWB/FgqLyrWGWeJyZxpH+aHeMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uz0Jibz/; arc=none smtp.client-ip=95.215.58.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uz0Jibz/"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=8111Qd+mRYZcNLNqgu3KSlEknrL1BX/iBccbqkA4J+s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787302571; v=1; x=1787907371;
 b=uz0Jibz/foigymJGawWPrFs22RkvvxTH/8rhfmjy6kCt73LWy8axZwTzqlGHVLP2OHnqy7fg
 g5Ah3UIz2a2ud7HKvb6nJ8drxdglNmrE7v0BvWUCUjxQXpymawMRD50SSFqY06mM3hy92HCvpLk
 kSQWULK84i2mOx4XP6fSPURI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from mail-lf1-f45.google.com (209.85.167.45)
	by smtp.migadu.com with ESMTPS id f832e084c8270cc4;
	Fri, 21 Aug 2026 08:56:01 +0000
X-Mizu-Trace-ID: f832e084c8270cc4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso7429e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 01:55:57 -0700 (PDT)
X-Gm-Message-State: AFuF++kQ6Mrt4X3kfYJSXBaBYF+H7kGDxI0p+ItFgo1xrSxg4OjneKJm
	G7E6r5Cc5Q5/sEwBQtn/vMdcx2DQatkvYZ+XZcrqw6za1XVMa4Wr/HIt/lNJxhFLzRo5xoUnjTi
	tKKv1Szsgs4yhEIf2hhFXIPMraow8kOJQQyMrB3dd
X-Received: by 2002:a05:6512:2508:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b484aa7312mr125597e87.3.1787302556573; Fri, 21 Aug 2026
 01:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821064445.615838-1-fuad.tabba@linux.dev> <20260821064445.615838-2-fuad.tabba@linux.dev>
 <20260821065743.3563C1F000E9@smtp.kernel.org> <CA+EHjTy6Qb8dv_apBg4RVU+V-LsP1Z+BkDYfRKLX0f6PnbKpeg@mail.gmail.com>
 <861pbr6emw.wl-maz@kernel.org>
In-Reply-To: <861pbr6emw.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 21 Aug 2026 09:55:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw+DGr5ZNMwqdSWEejDz-i48uh9uAjNghrYCXPRQBF3WA@mail.gmail.com>
X-Gm-Features: AcwNN1X3BW8PtRz67w1ebl42ONYlm7lvJCB4ekAzg0lCm2zJbuW6phvOHdrqeos
Message-ID: <CA+EHjTw+DGr5ZNMwqdSWEejDz-i48uh9uAjNghrYCXPRQBF3WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: vgic-its: Free the caches when
 GITS_BASER changes
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 09:50, Marc Zyngier <maz@kernel.org> wrote:
...
> > Yes, and it violates the spec: with GITS_CTLR.Enabled == 0 writes to
> > GITS_TRANSLATER are ignored, so nothing should be injected.
> >
> > It was reported in June [1] and is being worked on.
>
> Is it? I'm worried this has stalled. I'll have a look...

I actually noticed it the other day and way planning on picking it up
later, since it has stalled, as you said. Trying to keep the fixes by
theme...

/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
