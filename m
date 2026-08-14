Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3DD48D864
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727567; cv=none; b=km7tmfhqdLYs9XbTfq8iO4GDWxcX7fAuIVj/p4fe9TXRE/Cx16kBf8KUdvueBjagppMhB6OA65V7QJlftjRmd39voN8/J68m0tPhbUKrYk9aRlgbF+Y7qsUooNL+acG6Mc4cuSzwKY3YjUvOPwIWmKkRYYBwc9ssubUEinDqp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727567; c=relaxed/simple;
	bh=3y/CgvSV9/spB42H58eBm2iNL8x9g4lCKrpuNOhwQHU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FCQMYYZqLdb6WfJgP4lrZBx7eQUJ2tP7viprCTdQoRvfl8iDQjizfJqzqoFkcrwlkwWGuiPvF+7OlpcBABseVP2IhThPmNwT+UQH4l03ErO+H1MadTUluim5qeDatKV6K1HGU/DCok0Epyq3J+NaJm4sg0rnU9vzL3t+MdMrnC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cAOGV/+N; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cAOGV/+N"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso17979945ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786727565; x=1787332365; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWjdemJZnftyld6YOAQ6Wsvdeomv2P2Ul7Km+qAcNvM=;
        b=cAOGV/+NcPHFdFf6f2PwGg/PLxIu0cqz71KxYFC6z7jdiGOnyRG6SpPYW/jWvkhISF
         duuxFbwE6eYtPSL5rqosbXf2opPfyQk2ekQieqhDbzgd5r1LLSMB5W3Tu4OgfaqSpc+/
         +NP4LvJqa6wOJKoMiiM2zkOMM6qrvUCR3IHFzXU/gbtNmezVrt4KZHC9CbjjCKFSjqLX
         vp8rpjh3E6GcmqDb/3EOylHBXogqaUqy6wfJlmZgPUynVgfOTW95LNvcef0GsoCoxK+k
         gNBG+uvkrWxgzIY8VRWwMt2PFmcvY7wC3D/i1SOgkqXftKRChfm0NVxVs+V/0+v7YoAj
         n6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786727565; x=1787332365;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWjdemJZnftyld6YOAQ6Wsvdeomv2P2Ul7Km+qAcNvM=;
        b=smcwuUhZ8q2ZU22CUlCWZZ1n8b3v59Ou9O6MckE2qDx7IsQghZVzqumBuQ6VdPIyyv
         U4g053nn5OzLgP6feh4Yw7SlVGdROnqeF2+1nVpLpNLEMG9wRXZ7KQAOP/rG2f+au9i7
         LE3/itEHMdNHbaImtJDlmBfEzNhz1VpHaL9JQ8R83NyVzxWAEkimxW3KHruUb8FzGQGQ
         bOshstunqXxHfZL4GPfw2GQ36TCm1AaFtoeqDAHVbBPqNCMDT4X3D46gf+CyABtTA5JF
         11V6MvavlRgAueRqyu1FsDl7J3JNhZ8yOsAB+scwkW29Gd3DObqjmfreL7U/3ceIGIdo
         XmxA==
X-Gm-Message-State: AOJu0YyXzCPt6DgNrGJr/U6kGa1FjC6ekCZwFUxY4hKT30QCYUvarCWg
	LWRMvlffZawctDL53vlTvXO4oixdN2HurEpidWWNdglJZC0NM4Qi6HOfgr+bFARQmm1ku7mtp9B
	3RYnquy62Pul3BMJVhsQwsUtT7vubQBjKf1DZpZYqNFQihsfZLzKAi+tPrNOFbhBHLSGABaAixH
	zyIZHNCq54S1qJg56xwFXWy/FfjBM/9xRhxmoG6iCDW1Ba4QD7
X-Received: from pgar27.prod.google.com ([2002:a05:6a02:2e9b:b0:cbe:d979:e9ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3949:b0:3c3:8651:b317
 with SMTP id adf61e73a8af0-3cc71ced4d0mr7818747637.10.1786727565317; Fri, 14
 Aug 2026 10:12:45 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:12:44 -0700
In-Reply-To: <an9KM3Ye-GX7WggF@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814161129.2177118-1-seanjc@google.com> <20260814161129.2177118-4-seanjc@google.com>
 <20260814161950.136041F000E9@smtp.kernel.org> <an9KM3Ye-GX7WggF@google.com>
Message-ID: <an9MjA8JvHBipTv8@google.com>
Subject: Re: [PATCH 3/3] KVM: VMX: Rename posted interrupt prefixes from "vmx"
 to "vt"
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 14, 2026, Sean Christopherson wrote:
> I'll also add a blurb in the changelog for patch 1 to explain that keeping the
> vmx_ prefix is intentional so that vt_op() doesn't require a one-line forwarder
> when CONFIG_KVM_INTEL_TDX=y.

/facepalm

The callback is wired up directly, i.e. it can simply use a "vt" prefix.  IIRC,
I was playing around using vt_op() to address the wait_for_sept_zap issue and
forgot to revisit the change when I discarded that idea.
