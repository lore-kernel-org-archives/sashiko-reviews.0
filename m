Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6543376466
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006402; cv=none; b=m1VzZP6DoYC4nL4wuz+2fTAc5aXFre20HMsplx3InyMoRPDXDHJARkRELw55Sme1PuTeLM0YG9Aw5dSiRSEOC5EWAE8XhzOrNL6fWAajCIirorblpCHv5bZE4pRTnqWiem8V9h8sTQ9ie00mVijxtsBRdZ1z8fFZvV7sHrlVXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006402; c=relaxed/simple;
	bh=WrJHIFWpxpN8ses6ut4xZ9sUWjWpyRjQEA/aIKGpGDs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aSH7JVFWhSvluGCXGl2FdDeuBu55zRXWDfsLqcURLaqLIOh0KQSqaq6LqugPSRXMIoVfFqAASbSMkYY5eTqs4vLP+EYG5tWHRI43//HtQsV9VM7T57POux5Wy6wML3mpY15R5SRaXqqUeN/lpCQXTspgW0FWRI3WK6Esxzg40yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPSSVQgg; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPSSVQgg"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so5088868a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 19:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789006400; x=1789611200; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdNMd2NH5nC5ElhtsJsby8lwVRF/Fgx773JqNLZyz7s=;
        b=tPSSVQggkfFj3RG+ZgoiAFamiujFMmmTaRExlobIsaEiucCY5Ipe65MDjoyYzF4J2d
         YiMe79voVw+h9hGkN6dEhasj6ISJE4dEgq53ziicS3eCSiq0MsON1DrgBwJhSJYmSXF7
         0ITop14ocRGkrf/VjOKaurt+bqcPaH/w1sOe39EkMUPEICO2KdJZVh87GCo0hTplYwLx
         ygmqqPpDCGHTtRg+T9cyIS1p3XN0emUp4ATXc+RZbVm5mrgcLDwKzb4t7lO04ktXbIGz
         CYwRrs5Qj4nZ7XQWtdQ/EbNZO00YWRrqJP1aTbfR3yJrul2/GIJQf1PPQqXTQQ0j0gXZ
         UryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789006400; x=1789611200;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdNMd2NH5nC5ElhtsJsby8lwVRF/Fgx773JqNLZyz7s=;
        b=JkLaqVnbBN9wuDbAPCgGIfbs0GjU8rOx17o/h9FSjphN0e1uCgCRyl9T1wO2MO/HA5
         z3akUICbt9wf+tlVmocrxymgBmewdnJVhxfDcWyCHWHznglnBs9ZfQouc0MRVtm/40PK
         cCEQL7qeA7UtYUx3cmAQ7js4UaDxcGN/sAwaZ4x5UUJ8I+gPGREU44kZIxpWJRyi42f9
         SlFn1Np/zpF5trmpd31+DObTQf/IaKSCjihZEbCNl2j6bumlBUXt837hQFsQ7955zB+W
         hguGjAlo7CCGmWf1gzEUBvj0PJU8AervG/+b3Lb6Yt7wclEhVOu9nlY8utx3quaMoWq0
         Q9tw==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0dA3OXtiyGImSXuamHn59Ur/j1m/K7w+WtXjgWtytYXeRDtt1ADJvAcpS25l5hQzbZXXVEw6tCq84Y6Sekw=@lists.linux.dev
X-Gm-Message-State: AFuF++lMHP6cpG1QQfiwrz6guZ7C9k7SlcisvXBp5kFttOcsb/08AvCC
	UW2UoBTOc3bn/Yf4bVGl6SDoCMDeCwxAOubd7xlVuYvqGufCB8eILXrro8FIgRF+ZR/l0R6nO9U
	blN6q92KbqV+p3eSwyVK6Dw==
X-Received: from pgzz2.prod.google.com ([2002:a05:6a02:6822:b0:cc4:3e92:96dc])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6016:b0:3d3:ae0f:526c with SMTP id adf61e73a8af0-3da3a15cf74mr64297192637.24.1789006399943;
 Wed, 09 Sep 2026 19:13:19 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:13:18 +0800
In-Reply-To: <20260910020917.C22961F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260910020917.C22961F000FF@smtp.kernel.org>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910021318.2030765-1-stanleyjhu@google.com>
Subject: Re: [PATCH v3 2/2] scsi: ufs: rpmb: Decouple device lifecycle from
 devres to avoid UAF
From: Stanley Jhu <stanleyjhu@google.com>
To: sashiko-bot@kernel.org
Cc: linux-scsi@vger.kernel.org, sashiko-reviews@lists.linux.dev, 
	"Martin K . Petersen" <mkp@kernel.org>, Brian Kao <powenkao@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sep 2026, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does this sequence still
> leave a use-after-free window during device removal?
> 
> When rpmb_dev_unregister() is called, it internally calls device_del() on
> the child device, which immediately drops the reference to its parent device
> (ufs_rpmb->dev).
> 
> If a consumer is actively holding a reference to the child device via
> rpmb_dev_get(), the child device itself remains allocated. However, the
> subsequent call to device_unregister() here drops the final reference to
> the parent ufs_rpmb structure, causing it to be freed.
> 
> If the consumer then concurrently executes a request, the framework will
> pass the now-dangling parent pointer to the route_frames callback:
> 
> drivers/ufs/core/ufs-rpmb.c:ufs_rpmb_route_frames() {
>     struct ufs_rpmb_dev *ufs_rpmb = dev_get_drvdata(dev);
>     ...
> }
> 
> Could this dev_get_drvdata(dev) dereference the freed parent memory,
> resulting in a use-after-free despite the new lifecycle management?

This specific teardown race is guarded by the companion patch in the
generic RPMB core:
"[PATCH v3] rpmb: core: Guard frame requests and teardown with mutex"
https://lore.kernel.org/r/20260910015515.1991789-1-stanleyjhu@google.com

In rpmb_dev_unregister(), rdev->lock is acquired to drain in-flight
requests and mark rdev->dead = true before device_del() is invoked.
Any concurrent or subsequent call to rpmb_route_frames() is rejected
with -ENODEV under rdev->lock before dereferencing rdev->dev.parent.

Therefore, the dangling parent pointer is never dereferenced once
rpmb_dev_unregister() returns.

Thanks,
Stanley
