Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF335412C05
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488166; cv=none; b=kTTfHNpq4napjyiAY0DoBvt1R7CO8rma6sc5PIsiiKxbdGc/RLMoq8dJh4bP/1/s6FgqFx3sP1m7PFFFrCkol3btC4nQssw4FmzVmBMJafrxVp55k/0HgMzlCYFfrcvxzSkP6lExD36bdSq+hDPl2HNupjX34wCj0eoa98nOHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488166; c=relaxed/simple;
	bh=3IjIYNZ//EkU7RRxo8bHkfJOqg1GwqJOxlBJJC6w2Og=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ok3l65Qa+AEEkkO0ataAj8CaW+q2cKRyffVQLxrU55CUIEiE44Li9q4I0OAj/H/9zO974pUOhXLLk7HoY/hcLHPhpQiOkpOIIuxwJyeI7qfYJOYQ10meitHt7Wtr33meh0C57unwYOH445tF9PEvzDl6L6X/DJvX/B5WFXdWn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=ClnqUk0C; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="ClnqUk0C"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-9809f3af20cso197945241.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789488162; x=1790092962; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXYuW65IGDuV4RbA68/PmJHgU6ttorOq8wX2YILfQtc=;
        b=ClnqUk0CYp0sSl2+BWzFTXauGK4rJb2YaZUBR28H7eU4Jnd34+LyeOnRUVR41kocW1
         Mr5OrRFG3bcFjHjMjVx5n+6zNANejIlrwL5EFlPt/vja9yENiYgFci2GEIFu+Vs2EcEn
         e0rT0QWrwq7JXy3+3YiGF9quT59Htzy8s8IvVbKMuHtb1dX0ezFzHY3cNfViRm3gtk4F
         skLwHGCrACCtfRH7FZhelG/W1SXEwzF/pHa18F7M26bC4cQsMH0C4RQCUPQQIE8Qs4+Z
         1kqXgKMqw0ifWvotmEo4BqhzauyrPzY9Sj7ANf0vrulGabIWxLkOSxTkYVvtgBqmpm64
         rMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488162; x=1790092962;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXYuW65IGDuV4RbA68/PmJHgU6ttorOq8wX2YILfQtc=;
        b=IoD/c+VztXxqz5rctOaHheLmF4aUMnJSUu/1oxOmKHwEybSZoGjqgsOc1dpF3gahHR
         soxzArk9FBIpYMWLiChhb0GMWmSP07Lv1Qnecks2MRhxMYL+0E+xDNUF+KomFFa3uaVz
         n7DEd0bxUkKNOAEZe2LI5H3oUDDxaJh5jBUZuBbC0vA9OpKSW3WYZpSSNmBVH2ySJHJi
         hd7yyu4GFjD6u1RLzNN4DMnfPqeNor7/kHUQylTDnZ0blq9wk+VwriwLYBqJ1W/96nCg
         lMCdO3904E5t9UDS2YcNn6jkW+6vkhj8Nx5JXcZkP6rdrG3qO/ET2zdYSrEpTggcW/vH
         V4kw==
X-Gm-Message-State: AFuF++nQ96gpo0SgKf1SdZCq21w6nv7+jMTN6IZibCYMZvzgKWz9hPCH
	7xdfw4HVM0ktpzdx5DXDXsSgkgfh0qi+ChEzX2DaZI0xs/TYp6dgQN3elacKOxBiQdBw/1H5zDz
	a1egmCA8=
X-Gm-Gg: AYBFou3caBqeXP3vfCoRFXO0f/pTTiPCVe3hiRNegGBgepd5X85JYAd0x+/0cbfdwIx
	JfYdkegBG0uxGNduR8V20++swWDvdfbnMihGCgJaCB2AlZT0DOO0gu5B3fQ7emfqopFvms8V65y
	BI5nYIMzIjdlXpIJFQG0RyZVcFzIUUKhYy0jWTv6oPBMRVWI2i7uWISklA8Vq62XT1LCMAvQgWI
	ArV2tc4w9K5haMJWS2w95v4z2eZIh+2AVwtEGHDfx/zMLJuP3fLtN707SAOdxBkYUNIcCdVhuQf
	UlstQwyt7Aflqf5yQk/rz3Hso5tAkmUrOIkBTop58ggx675BuijUBcyAFnNZMCAtFYG9BmvpTKV
	gkhNfxa5A/hTQTYQf8hnL/SQSvQ/7cNplrtYUU44W03UCZOkd546QRQrq3bi11c1cCvNMiC/65G
	RpDm6Ide2tdBrfPfnHSEjWDn7HTDIPYAt6L8Q5UIApGH4qYOryGM/Fjwmk/ySJleWtmBWX0NNWB
	FV1pVdaG5s3TIOvR4kR4l0KUNSdGHf3oEo25gw0zACXgR6t+wYOZu42
X-Received: by 2002:a05:6102:1609:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-79ed4a36e4fmr2855428137.6.1789488162285;
        Tue, 15 Sep 2026 09:02:42 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bd339easm2205466d6.0.2026.09.15.09.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:02:41 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:02:31 +0000
Message-ID: <162b7a9a7e12191a9661465090319408.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
In-Reply-To: <20260915132919.E868D1F000FF@smtp.kernel.org>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com> <20260915132919.E868D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 15 Sep 2026 13:29:19 +0000, sashiko-bot@kernel.org wrote:
> > +	if (!(ct_rcu_watching_cpu(cpu) & CT_RCU_WATCHING))
> > +		return true;
> > +	return idle_cpu(cpu);
> > +}
>
> [Severity: High]
> Could the unconditional return of idle_cpu() lead to a use-after-free crash
> if the idle task was interrupted in trampoline code?

Yes, this one is right. The classic flavor ignores idle tasks too and
leans on Tasks Rude for that, but the idle_cpu() shortcut here made it
worse than it needs to be: an idle CPU with an interrupt sitting on top
of a trampoline the idle loop had called into would be passed
immediately, and since idle is never preempted from irq exit nothing
else catches it.

For v4 that line is gone and an idle CPU only counts while RCU is not
watching it. If it is watching (the interrupt, or the traceable part of
the idle loop) it gets the resched_cpu() like any other straggler and
counts once the idle loop itself schedules, which it cannot do from
inside a trampoline. So idle ends up covered rather than ignored.

Thanks,

Josef
