Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582F3AB260
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786181084; cv=pass; b=k0QVoD7E9ufEaaoSrvm7uV/am3YbclesITk7o+A3VBwW0+m88zUlwpJWlorZrhH8IQvJeEl2psM4bkfcv7hp82kmVcNCcblI1nCU6CfWOLIMQJNlfShcWZzKqK1aZv6pTLwttddTCaWFyZCZrd8XJXT0rC9Wsna8ECY+fVxOn0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786181084; c=relaxed/simple;
	bh=/vZ5XM4H6eO46uqhmy3Y4wauXN7Cl7jVntz/tJBe7IY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ypvd8QqRVsMTh5QmN43Ykodg8wPDjod3UNzPWk13aZwBX5MXiGrksF/bxNL2Mcti2Wgyn/akx9DXiCheNUsM36lSbtZ7nkASAutwHusJGyt+sfnNAta05pIO/KullHZfdeH9z0/zlmaaUzLZJF9bFcNGe7MLPvgC/4zt5cmXfO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEmBWEJy; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEmBWEJy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc61541f8cso32281685ad.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 02:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786181083; cv=none;
        d=google.com; s=arc-20260327;
        b=fYA+DgMOXXMGfgJLngvLFJ4kDgJXHniCtVddywCNUE6Qzj/UwrYmVJMjbm3PAevVt2
         20ZqX7jP+2O1jfpcOHkSLZLEvmrgZLho3dFUG2sL5DdHKL8byv06eiz11pZaAC/ZEAj0
         cr8eISLKhWzAHB12dfEiblRygUgwI8RqhkBflUbqm9tHutYFmlwx7y+KpVpcsydKnRku
         EFuUA5sXcSCk0Ule8vTObmet/bvmZdDPBOfn+cHzzSPxzqYU32Ggcp3U9B2S7+1TOYut
         PS68kgLDDxeiPpS+vIjDfum4HU+T+DUJ0g1LhCm9hNE1RTYTKiPC8Fusq77ptLjIwCIv
         ohPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MrghsmMy56aL0iIdrpu+h7WNYslFByyIZgbjP7fVunE=;
        fh=zt2hjtFWVrBSbexOnXx/digRN2O0tNSOK4/ceCsrIlE=;
        b=KMv0Be7AwPIa89uBOpHcJTbaE0nvQD8g9QI0916ZViUaN/1rBTAM/8qrhrG8kfLL70
         yohg5jvJ+UJkicwqq0HyYUGCwYqgrg2eWXeH/doMsUuzbIzQJXKh08WEPx2/uToI+X6I
         V/XMz95jCtsws34rzWc4Fsr685kMAlMet0xYNexf7Yg6JE3RXnWXDbwMPPdQ33vdPP0n
         CpkGAqmc9XAu+mdiOOYK+nxq4xRQsqF9tZqwtdCnwZFTb22P+otyXynFM9SIq9c38CQq
         XhCRS6h17RvCKyZluv9mTMHyADmggfDhRBy8lR+l933UJrvjlE9jzeqrfRkov6VMp+R7
         1x9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786181083; x=1786785883; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrghsmMy56aL0iIdrpu+h7WNYslFByyIZgbjP7fVunE=;
        b=ZEmBWEJy92z0sLtaoxy1nH/oR9v0Pfs8O1uKM7eieqTECF/Y/m61+AZJRRNY9f7CRD
         XhiXgWsQX8UrYXgAcsDGg8DdcdpC9KBo9XKI2DfgKz06fwKUKlr4fcOZLKfj62vgOmYa
         Glr77lRrMBk5MCFz97zVQ6sDT9ifauoexjrk73QqF0NpevSlsgvD/DWX5oQH6XdhvjZq
         bQgcbAtfMhi/ktpy5otckvcDtmTNvjjF3dUhqpQB7G+CTHQNBJOrI2VNY9HJ1JQAZ3vW
         KLU8a7AZguYw4LyyslYY9ZJbx3OAplOb5gNRNmMlfprof5CiRVYvtD3XMNzzMiNvWIBC
         /QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786181083; x=1786785883;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrghsmMy56aL0iIdrpu+h7WNYslFByyIZgbjP7fVunE=;
        b=jIWS2cNbVXhOtJ6Qd3mtsqtJOgMOX3xYNX6cfC4vzDKiA0GWrve3y+pFdi6pgMgGpD
         EnqmFAkA6I/+IuGCm9tutf44Q1WLLQZDPPoXKbaCYp6AGUEP3A63rdHf16W3oazivt/D
         C0JMMvuoPNVOQGb+NsUHekMPbLZvYSZ14AQta2j/ajLscBeXMhQC+Nj2RssK4+dZS3zp
         2DUqzFSRl/Je6p9JraK49LHJGXuxhWDysGKRQNz9JdtSsE8ow15Nim59KN9wOiF+8TTr
         PfLIzLcQLDnTG7j6ZCirpfxA6AqN71P54PN3/jxEKFyLWB4FCiSHtGfA715W2L8XyO5g
         0NUg==
X-Gm-Message-State: AOJu0Yzzpv0lzU7nWmJILRTn4WsMZTRnArVYd17Udqx0ZTGTpwW7mvzS
	ZcUPNiRgx/LURib+Tp2Orv7qgVpAznW4i94B/CsF2laxz2XtD5EPa9kDWmfGYcr791ErWNNKUcc
	FLG+j94hX3dIw7ChjUUKtOxKJFfYW5dXqOaZu
X-Gm-Gg: AR+sD116H1bQ14cKVx+fDgJtu43z22uRnZDS0QZKJFn+uke/CnFZKU3h9BjQJUhyDqL
	/LnF7hQGVGnIj5PPR7a04R2atdHJTW6tsQHb8F6U06plqzaV77lBJp93CL8BcITKF6eJiE4XDr6
	Pc5brtK0u5+JwWQO3q4qa+ufACa0jVBFNKWmKAkLa2cI1SOtnlqiLdwLunwRNpECmXzA53FroBw
	Suff2AILGAqZ6xl166z0TQmtxwIBDCwR2hkEkBg6sHQNf0sZs05xUIreMKNlYgZCJgVZNqQ8w/p
	oTnqtUVTJQuIn2/adGg38nVWoC6FG/WALzH+NkUkJuHjmBpdS45dJtt8cGJ9eichpn5yyQwns9o
	5hn4Uph3HO0zuzbBk/WqNg1F4guUJMTJOHDmKzsE9VnVZYgxYt05jnKduI/qSue5O5Oj5QdaULd
	IW2KcYypdREJuk1I0=
X-Received: by 2002:a17:903:324f:b0:2cf:41ba:96c2 with SMTP id
 d9443c01a7336-2d2b2e2160bmr26820625ad.12.1786181082808; Sat, 08 Aug 2026
 02:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807080447.35479-1-phucduc.bui@gmail.com> <20260807080447.35479-2-phucduc.bui@gmail.com>
 <20260807081701.C3D691F00A3A@smtp.kernel.org>
In-Reply-To: <20260807081701.C3D691F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 16:24:29 +0700
X-Gm-Features: AUfX_mzQ1raMOa_ddMDzuPQuG9imRPgE_uqf_ormA10itsLxjDp6UBVFtMIy1cE
Message-ID: <CAABR9nHHHEDz2hM3TeQRTMsRSUYHJBFgxH6X+26M1c0x=NJWFQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: stm32_iwdg: Propagate errors from
 optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: High]
> This is a pre-existing issue, but since we are adjusting the error handling
> around IRQs here, is there a missing cleanup path for the wake IRQ?
>
> A bit further down in stm32_iwdg_irq_init(), the code calls the unmanaged
> dev_pm_set_wake_irq(dev, irq) function:
>
>         if (of_property_read_bool(np, "wakeup-source")) {
>                 ...
>                 ret = dev_pm_set_wake_irq(dev, irq);
>                 if (ret)
>                         return ret;
>         }
>
>         ret = devm_request_irq(dev, irq, stm32_iwdg_isr, ...);
>
> If devm_request_irq() fails immediately after, or if a subsequent setup step
> like stm32_iwdg_start() fails in stm32_iwdg_probe(), the wake IRQ remains
> attached because dev_pm_set_wake_irq() does not automatically clean up on
> failure or device unbind.
>
> Could this cause the memory for the wake IRQ to leak and leave a dangling
> pointer in dev->power.wakeirq? If a probe deferral or unbind occurs,
> would the next probe attempt fail permanently with -EEXIST when
> dev_pm_set_wake_irq() encounters the dangling pointer? Would using
> devm_pm_set_wake_irq() here instead ensure proper lifecycle management?
>

This could be the case. However, I don't have the hardware available to
test and verify this issue.
Since this is a pre-existing issue and is outside the scope of this patch,
I would prefer to address it separately if it is confirmed.
