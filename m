Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F8C4AF9C2
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490564; cv=none; b=AZsXr9lMDsJGGd6VxiKtoLCg7hVdV32/nQLyDgURpA8Ce11h1MdY3NmP0QC4sYttx7bhUkegnfaAfvHLwCPQSKVhwc/sqCZs9Vd8/HhTlsaCGfINUhVIUDN8LgJM/rABopYVEc2TguzbHk8F2yeCiRAxiWBeIr4ai/EfisYPwO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490564; c=relaxed/simple;
	bh=DLlkjfOuya7v+DEz1a4h/J49rgyXuu2hbrUFVJeEY/s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FaPeFsvCPT1dFS1od+cwcmAOXCIWX/cwqtEkExGx6MheZQqAAP/R8HMRQ0p4cFGQiX8Z8/mvPUWX1A/OeWna0H6EuZbpYd7VaLLXB19DpxOdZ/IgtNWKOjvF6zpYjUlcuQMs/NuMK0AVXzJNbGNp3N5W3yCbPt+PKp29aO3WKMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OPS9B9VO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OPS9B9VO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789490560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLlkjfOuya7v+DEz1a4h/J49rgyXuu2hbrUFVJeEY/s=;
	b=OPS9B9VOMPab5aoyTonSF49qVAYt3Sd3GcFcbOdYt/6jPunRnxU5MBlz65c/Tvil2OFJJG
	TNKChQ3GKvnlYNMW04cffEJKIFPnp63Xs9IOC1HQ3iSqS4GtzmsWQcGamBoUWSNv3nIHYg
	UAiWZQbPdM4f+2e3m5DmkkPFNo66mUs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-PxhKwdElMkq4B7zL_-rt0g-1; Tue, 15 Sep 2026 12:42:39 -0400
X-MC-Unique: PxhKwdElMkq4B7zL_-rt0g-1
X-Mimecast-MFC-AGG-ID: PxhKwdElMkq4B7zL_-rt0g_1789490558
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8dd8be81so60639656d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 09:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490558; x=1790095358;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLlkjfOuya7v+DEz1a4h/J49rgyXuu2hbrUFVJeEY/s=;
        b=OqDJuxyZhi1+k/C5/vtabx8bPEhnwChUzC959jRwawOmJdPJUbCet4YH/xeuCVtFTy
         vOQPus3KKJPNab0KhJj1UuCeSdf8VQA99SJJQeAAYcWW5Of+ZSqyhCsyBSBvLMbnnOg0
         yHJgUGDq0cSaqEFIhHDyti7BAbebrTt4TQ0YPsSGQJfEQqvGHV/TlHxN9/WQMkTFaeaS
         RUQ69x1hVfNqhLnkbTosKidpKfVycQlPsT54iq5cAueG5F6soM2ZCK9dZb9tRzj6lNVy
         hiChH17fF+vS/zeiVwaMWyTZBuz1XgFtMnwLO2O01jeZ7Lv5wZqxKLaFXNGqi4xti28S
         ueNw==
X-Gm-Message-State: AFuF++lemEVdIok1e7nZbZS1GGMadWCf0qP5CKSQPgQaXofZZ2wpkPrc
	CmT4jxxoKY2Gb0ixpVD/UBZjiiBrAr+7Olk5vk+MuRnu7qWsBKXyILyq9gM99c3B1taSTzA8RiP
	QXwU9/QBLfOcWeqDP8ilByBAjp/HXiUJerRHVz+atA2Ggh+tz0zfzlCe1oISM9L7+NEusTF3oyL
	555nYQPplP/EoyIdrRqK95p4/QZ4q8Ep/J/84x5lYztIKmv5JXXg==
X-Gm-Gg: AYBFou0GI+ygaTsBMtu4ZmLpjyhRs3Bq4AcrWj1onQhsUW8P9a9RIgrDpYYItqn3mBK
	Z7tLe98jQO958Lp3b4CQP+aPsX/xRmuWHHp/wLXVNI+1lGGXaSKsgdaputSi5+pIRRLXw93F27z
	eF1RPNPYXJqdaEzQSlktXsLVeXKtSEB0J7Oso+lLd9j9P1JG0xLfGZQUUBAFSayDEMiKadFY0Rk
	ZHdABtK2wCqC3jRME/BFlBEWoOIMAk4yjiV0DJ3JFpIi1nzj4lrIDDgC440x6c+4k8w7YhYN8fn
	4Y6xANenyxijKuKws/4CVnubLYUPE5dkdgR4KPXBdEYcnAJK61M9lAI8iSJIhPlMP8V7vuye
X-Received: by 2002:a05:6214:5012:b0:910:49a5:346e with SMTP id 6a1803df08f44-9123a41e15dmr28824896d6.5.1789490558285;
        Tue, 15 Sep 2026 09:42:38 -0700 (PDT)
X-Received: by 2002:a05:6214:5012:b0:910:49a5:346e with SMTP id 6a1803df08f44-9123a41e15dmr28824076d6.5.1789490557581;
        Tue, 15 Sep 2026 09:42:37 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be61d17sm2634486d6.14.2026.09.15.09.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:42:37 -0700 (PDT)
Message-ID: <13440da22f31b81af4ac27471ab6d10f1523018f.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/nouveau/gsp/r535: Add support for
 INTERNAL_GCX_ENTRY_PREREQUISITE
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Tue, 15 Sep 2026 12:42:36 -0400
In-Reply-To: <20260911223650.8F0F61F000FF@smtp.kernel.org>
References: <20260911222428.752641-1-lyude@redhat.com>
	 <20260911222428.752641-2-lyude@redhat.com>
	 <20260911223650.8F0F61F000FF@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _cHNj9blBXvfur-U0Glhm70pGmc5vAfcRDelGIknHsg_1789490558
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-09-11 at 22:36 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
> - [High] Negative error codes from `nvif_device_gcx_ready()` are
> treated as bitmasks, leading to unpredictable runtime suspend
> behavior.

Probably right

> - [High] Hardcoding `r535_gsp_gcx_ready(gsp)` bypasses the GSP
> function vtable and will cause a NULL pointer dereference on non-RM
> GSPs.

Completely wrong.

> - [Medium] `nvkm_udevice_gcx_ready()` bypasses the ioctl unpack
> protocol and returns a positive bitmask directly as a return code.

I think fine? But unsure if I actually agree with this, if anyone has
any thoughts on this let me know

> - [Low] `GSP_GCX_ENTRY_GC6_READY` and `GSP_GCX_ENTRY_GCOFF_READY` are
> defined but never used.

Correct

