Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93BE40EB90
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373493; cv=pass; b=rlBaJMgJQtFIP3bGeI5kZc1D7C5zipw5SROMvS/sRreA7AxPamr+Ip0UieZJXiniDGaLdbeeU1GFxCD+/bXYqGi5SayYAZjg/kLRzmhMuVKiRvl26Q6SIBaUHIGxPZO4ouT6R5oXXP5NVG7MSN1XuZ/SeFPvNumiQ/3K1AEYqsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373493; c=relaxed/simple;
	bh=4fU76HLxftGrNPMS5uU28BAwEDbagipkEqeN7ldBrzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Parh0d0T3BbLLkazvNgnINviRqjGevfy/882pp1PU+x1rD0Mmfc2RqW+pRXyU+H/xAudFhvvMKAk/1JZ+yTk8ZVE6Zz81DHNvSIwzHV19vq30cwPS+FZwfxrPRP5ppDf9nkq4Z7Jrq+jwegYasrF3HRtLVluQeSEftjoGmZW5BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhmSp5R2; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhmSp5R2"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66d20e86cffso202189d50.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 01:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789373491; cv=none;
        d=google.com; s=arc-20260327;
        b=cFPfP8ba6Kyz6jM1f7teGF06IZ8xYGZ7nUGhaTyrQAtJ/MN083MXPoJJ0iGvYZyp/y
         +gIevG8vhEMUc8pL2J1HDeP9qLN0gaMrvU9FOASTYoL7ALmMTSZbjRROK0yIZn43j2uU
         kBQQW2Jz4GDT+AJcWOTHh9GweVf5f4UredtdqLU/KWNb+TQwhHfSBHNiprxfld95Tt6Y
         wjQ0pfH5dDsg3NkFj+A17mnJ3Xu5pJWXhd18uSCUkNqMpDlqrIjP6DUDdM315K5vAcMv
         dVTJZtNa3VkklhIACZMSzgRzISsl/CtuR8NjEFJZXO5ASkToB4YTUkjM+nE0/cJjSuLa
         X9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        fh=l1IXOmO8Ox9ryNwqjr9K+2m88NU68ysaD9ZBH40Zbr8=;
        b=aCsA+nj4ui8wDxgkjt2sEUiRzmDJdohXdn3uILyFwDS4lxLxzOtU0exhvpq/8G184h
         D0w1s3pEFotO1+ojBtDqfZRs54xDW7azD+aULCt3H1hPtqxJHmNuJ9Mhgq3ys1/7vwZQ
         xbLBpMBd384VBwQ7PLJPpMmILK+/4ya5Di1+Pd4ITHQfqpuDnVp01WVn87+ZB861XTJT
         WKdcWflhcTlHApqa+zqGx+cxpF+PRw6ZdhBirSGXJqEc0sIFpJXYALpjDXdwktqz1mRe
         VNn2m0xL0l/VF1sVNSNFfnIOextpfk/fGRWov/j5XEU2TyE4IgAk9GRvNpf+BbxAtANE
         BUFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373491; x=1789978291; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        b=KhmSp5R2fepxAmlKo/r7TpOLnBHWbCFLz9GMlHeT21zq7ncSSRKgDewbAqE/z8+3JK
         NMckBYjZyXODpMfYIcQvgBjr3GpLBhYKpD896mj2bzH+orwjjS93G72ExxlpFsOGRvCv
         z6Aj9/37/i85K/GV0G9xWcaI3XA8OcZOziSQFECrI4er+DHdGDmt/QHnu4tLOK3FWarp
         NR+frFoW1oCFX3a7xJsLQo/3E9pjFIx9amfZmEQLPPnQtfKHq1HYEX/VB7ojt5hn/Y/N
         mmhFfxmcWAbdEIlUHqo5Ih7XUz2oodIAmmR6OBAZmcLb8Agb0tUGhZCt2cc/eP9Kc0ty
         Wvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373491; x=1789978291;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=53mBNqBKIPdVYuVN3sfvg8nCabbUTtVLQ2DnxwMY9cM=;
        b=INzk0GAI3j4+Lz33muI013FsHhc8+4oNMqKDq+tFIQ3rPIa4R0Q2h5l7AEoNEDRKe1
         9NlDGf3YR778uSp4cOhWMSk1HCl+Q1CJ7kLS4QdfV2+HwYPXwmyLe9D6IpI7hsKaYSdT
         ncr0E6OjNYe8qOy0Dg95QQkD0z0vUNJGnBmvqfVLohPXb9W0uHhVAyQNyGDChJdxKDiL
         Macw2OSSdLPqw8cKggWAyIymmaia03QF+VM0doNosOnYyNE5X/2Kmf/1nIxNT0WBg7+0
         wlPaiFw1pU6NOW9Gy2NfOUx2vCRQ74qxk0uaxGKeSLCLXk+0R9SoOHlFF/0yc12RKiau
         NJvQ==
X-Gm-Message-State: AFuF++mmCQ18AmI9uXB0unf4ef1sR5LVzGE9NVnd9Apl2RPSlmj3uT/F
	N85xeh2uxsCKBJ3FzZ5sLZeR+Gv8iKjxYCPHP8PO3QI5dWjf9QSzvR6T3fLvn1Qqp0bGcTMm/pO
	yRaKOgcuhyBCScvrVi1u6CeJOvUr/P0hBPSMMA0w=
X-Gm-Gg: AYBFou0T8BoNYoVd6Rp7fQPi8ZpD+1IgALP+KQ1JZFaSOfOWYdOW/4MUN43MB36rx9W
	wLK6KmPglo05Qptua7h+bTybSfuaAEa/690eUnuG2sg8lJjU9pYNk4NnoiIJy7IPtGbTFjwJTQl
	bDAGKgOLLbitfc89YvkvejgQL2nP5ZRcepqbuXovG+g3C/9F4HBgw3F//lAWMgQh49Zj9eWDlNq
	KMhvNQxQ30IW4mPEwih/lk9CiQpjbRGMIKD+mswVAA+R8i+IgsEnItXQ0n7cngwi6StyzXC2VMo
	G80ZleojaWm++UDf1s+vI2uyhyzULDgT+BBRnHGTDoT4j0jFiKyp8sjdhTIQQjWGvPo=
X-Received: by 2002:a05:690e:2023:b0:671:2f8d:eaf3 with SMTP id
 956f58d0204a3-6714e30e48fmr310610d50.4.1789373490617; Mon, 14 Sep 2026
 01:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910184452.895485-1-itai.handler@gmail.com>
 <20260910184452.895485-3-itai.handler@gmail.com> <20260910190205.D0A311F000FF@smtp.kernel.org>
In-Reply-To: <20260910190205.D0A311F000FF@smtp.kernel.org>
From: Itai Handler <itai.handler@gmail.com>
Date: Mon, 14 Sep 2026 11:11:19 +0300
X-Gm-Features: AcwNN1W3TsRmnijrk6GVHlCGzsYDkz9GLd8Q3xiW9vI-5rWBg_Mn-fVrRALFw3Q
Message-ID: <CAFpOueTWdO8JiU9Wyw+Om-dPhXgsZ5Z4n9iGxL9Y_a9JuSFtKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: take the flash lock in spi_nor_remove()
To: sashiko-reviews@lists.linux.dev
Cc: pratyush@kernel.org, mwalle@kernel.org, richard@nod.at, 
	miquel.raynal@bootlin.com, takahiro.kuwano@infineon.com, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. All three points are marked pre-existing, and
that is the right call for all three: none of them is introduced by this
patch, and the last one is a genuine problem that this patch cannot
reach.

> [Severity: High]
> This is a pre-existing issue, but does spi_nor_prep_and_lock() leak resources
> if interrupted by a signal?
[...]
> The function returns this error immediately without calling spi_nor_unprep(),
> permanently leaking the acquired controller resources (such as clocks or
> power management runtime) and deadlocking the mutex.

Same answer as on 1/2, where this was raised as well: the asymmetry is
real but unreachable, because the two halves are mutually exclusive.

spi_nor_prep() does nothing unless nor->controller_ops->prepare exists,
and the wait_event_killable() is reached only when SNOR_F_RWW is set.
SNOR_F_RWW is set only when there are no controller_ops at all
(core.c:2981):

        if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
            !nor->controller_ops)
                nor->flags |= SNOR_F_RWW;

So a flash that can be interrupted in that wait never acquired anything
in spi_nor_prep(), and there are no clocks or runtime-PM references to
leak. The mutex is not taken on that branch either, so the error return
cannot deadlock it.

While checking this I did find a real bug next to it:
spi_nor_rww_start_exclusive() returns with nor->lock held on both paths,
because 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
helpers") removed its mutex_unlock() without adding the
guard(mutex)(&nor->lock) that the other nine helpers got. No caller
reaches it today, which is how it survived since v6.15, but this patch
is one of the two that would. It leads v2 as patch 1/3. Details are in
my reply to the review of 1/2.

> [Severity: Critical]
> This is a pre-existing issue, but does dropping the lock before unregistering
> the MTD device leave a race window where pending operations can wake up and
> execute?

Yes. This is the same residual that patch 1/2 documents in its commit
message for ->shutdown, and it has the same cause: the restore runs
while MTD is still accepting operations, so an operation that starts
after the lock is dropped will send four address bytes to a chip that is
now in 3-byte mode.

Serialising against the operations already in flight is what this patch
is for - it stops the restore itself being issued into a busy flash,
which is the case where the flash silently discards it and stays in
4-byte mode. Closing the remaining window needs MTD to stop accepting
operations before the driver is torn down, which is a layer above this
one and a separate discussion.

> [Severity: Critical]
> This is a pre-existing issue, but does unregistering the MTD device without
> waiting for existing users to close their file descriptors lead to a
> Use-After-Free of struct spi_nor?
[...]
> When spi_nor_remove() returns, devres will immediately free the struct spi_nor
> memory (which was allocated via devm_kzalloc), but the userspace process may
> still issue operations or close the file descriptor, dereferencing the freed
> memory.

This one has substance and I do not want to wave it away, but it is
independent of this patch: it is identical with the patch and without
it, since the patch only adds a lock around the restore and does not
touch the teardown order or any lifetime.

For what it is worth, the analysis looks right to me as far as it goes.
nor is devm_kzalloc()'d in spi_nor_probe() and nor->mtd is embedded in
it, so the allocation is owned by devres and is freed when the device is
unbound. The kref added by 19bfa9ebebb5 ("mtd: use refcount to prevent
corruption") governs when mtd_device_release() runs, not when that
backing memory goes away. __get_mtd_device() does try_module_get(), so
an open user pins the module, but a sysfs unbind is not a module unload
and is not blocked by it.

So the question is a real one, but it is an MTD-core and devres lifetime
question rather than a spi-nor locking one, and the answer cannot live
in spi_nor_remove(). Folding it into this series would mix two unrelated
changes. If it holds up under a closer look I will report it separately
with a reproducer rather than attach it here.

Thanks,
Itai
