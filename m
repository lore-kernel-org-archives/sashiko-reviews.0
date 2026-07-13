Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF163425CF9
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 13:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949085; cv=none; b=QfZYsArImV+bs9lw4xRNGoxJvCRbGtbA8oWogJXv5bbz3FJMQJEB1YQwrlgf5KuB62x+qf3eO6/Xbgoh3s2XQyLHqehYxgwa4ejadN5RPr9XY5MSAyWWTia/SUTQGs+yqHkU8rR1Ef7SvtEaTKX39f1nEucZJsTDRNaFZTTm78U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949085; c=relaxed/simple;
	bh=SD0QydIM+/yoeK5kEju3glLM8jKW6W+AxcIUwHNPEsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frJqD8LLT77Sw557WZ8zf5q6eEKUQd5Z7VWsxhD/B7vtSkDQGZnvJBlCAaogXCEhM/UG0HwhaCSVu+gjjn09oQyWdJ+nV3D1QFNWNrbkDT3CZ3cUUqMf7Pp9idFiOaoejn0m86pY/owvVV5Bd5Xu0LlqRSwtp4gUr8s+2akqbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=ZPZMJzf4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="ZPZMJzf4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f36a122fdso1156563f8f.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783949080; x=1784553880; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xjZ7NtwsFGiweoS+gCGkEmR8ZqgtuQmxjICy7rYDGs=;
        b=ZPZMJzf4/uRm3QTSmBUlrF0NeiYgHztyjdTE9pOh8vRur6Y73l+Rl4bVHqZsecocyP
         dVwxO7gfWPFg8EwoydNLo728krJXIzConshOoPPeydcM6kRscjkAesuivF1hzg9AfC9l
         MQQlTorFdq/4KXGAFOZ7uwuaPvmpXF8G0AW3zesIe0q4fVwUlPJKYdSgqwZWFlJw52bS
         qicLK0IVnOseM8D+0oE8Zy4dQY0gpAw7oclo6ztdOLR4B0I2HL7iPxOY8fiRXURKCeTN
         bRmAkaH1k9uDonMx1kNaBJbPNyfVKYzXqIfSq9ZIyyoHjS3LpqHlhMSAFlq3+yOhYPE6
         Dj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783949080; x=1784553880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7xjZ7NtwsFGiweoS+gCGkEmR8ZqgtuQmxjICy7rYDGs=;
        b=n73Twq1qezoiiHhEOBnFRQnOXrnAT0uothPMzPi2j0JcWeE1PyNZuLfD9RPzDZ/wFY
         YcVe1do7fJxrR9a6aZbs0q5gC0iNdVzZ3u9SEruVOYFnIIaEM6HCrj2bS7k60c541OYb
         jwCs93JLN5ZPkfaFKk1j8En60XJn6ymAvHqD71s81HzNfhUur5mGofm1GSJr07scjwzs
         P4rsPRc/2gzbAFqrzn/gXS4Fw5s06on63mRpRI7hT0DrOYg9NQnQrp3UdqYKXZRkt2KB
         ljGJKVP1AMln181P0w4DMVzFjOgHWdn2VKonCmBBrGcsQ5Xd8itLJI0SEKpoicfPqkaE
         W3og==
X-Gm-Message-State: AOJu0Yzh8ZA0dKNr3C4+MiIc4km31CRcpYjZCM5fjHriLF/gXVHZzTnS
	d8Zc11oD4PgJXJM5xm6S1WRLqwkr8TaSR5tWQdYiqB/J1jYU4sXOfBk0LCaHPvhmqHc17JJYxDE
	AAU8M
X-Gm-Gg: AfdE7cm6FfQPhMWxbelADNKG228FbDw7qcQ0PrgJilHrraEMCPfIXIdMJG+Ub6hiiyV
	Sto4GDSpCoNbaM1/kmwPrtaEMYq9OWgzJ7NTPJ+vBxJIxGoky/BHX6KdjbQi+FCz1ZM/DT9qLbc
	B4Hu5Kcd5rgtljM3dbdAqX3ohEPgkdSBiPrInA2FkpzsI/yZccrnJnC7TRM5AHApvS+whVT5HOW
	tbCuf8wBR9X1Ds+l/o8PKGP6FdulxmDsUCmTjl99EfPZ4eZBMGY9G5eMs/q3jrUDwDGJa0gEgVH
	m9wAMoVg0o5MH9raIsX/VIx2xCqtgxdhBtRDwcZG+O8X+FqIjjJEn0M28swLuD/mitye7+XP1kZ
	pWzhn23/ihInXEo6FFU7kkyTA14Yrw9AVU9RtJJhrBWOlRTitOoBmBu8gVICz1kivvri83Htb56
	GLdVF7UtOcNelhUGOOD3hAnw==
X-Received: by 2002:a05:6000:2dc9:b0:475:f100:35f7 with SMTP id ffacd0b85a97d-47f2dd3d5aamr10903873f8f.52.1783949080022;
        Mon, 13 Jul 2026 06:24:40 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm84082951f8f.8.2026.07.13.06.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:24:39 -0700 (PDT)
Date: Mon, 13 Jul 2026 15:24:35 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: sashiko-reviews@lists.linux.dev
Cc: Heiko Carstens <hca@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, tj@kernel.org, 
	linux-s390@vger.kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
Subject: Re: [PATCH rdma-next 12/13] RDMA/rxe: Implement
 disassociate_ucontext callback
Message-ID: <alTnCW2s8kA6Gc0Q@FV6GYCPJ69>
References: <20260709095532.855647-1-jiri@resnulli.us>
 <20260709095532.855647-13-jiri@resnulli.us>
 <20260710095630.C5F851F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710095630.C5F851F00A3D@smtp.kernel.org>

Fri, Jul 10, 2026 at 11:56:30AM +0200, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Critical] Implementing an empty `disassociate_ucontext` callback bypasses the core's VMA zapping because RXE uses legacy, untracked VMAs. This leads to a Use-After-Free of `ib_ucontext` and `rxe_dev` when the VMA is eventually closed, and potential kernel panics upon module unload.
>--
>
>--- Patch [12]: [PATCH rdma-next 12/13] RDMA/rxe: Implement disassociate_ucontext callback ---
>commit 8946fc9f2a378bad6f910a408699c6a70e97a6f6
>Author: Jiri Pirko <jiri@resnulli.us>
>
>RDMA/rxe: Implement disassociate_ucontext callback
>
>Implement an empty disassociate_ucontext() callback so the RDMA core
>can move rxe devices between net namespaces. The core requires this
>callback to reset user contexts without waiting for userspace.
>
>> diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband/sw/rxe/rxe_verbs.c
>> index 1ec130fee8ea7..6eb10d2f0653b 100644
>> --- a/drivers/infiniband/sw/rxe/rxe_verbs.c
>> +++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
>> @@ -240,6 +240,10 @@ static void rxe_dealloc_ucontext(struct ib_ucontext *ibuc)
>>  		rxe_err_uc(uc, "cleanup failed, err = %d\n", err);
>>  }
>>  
>> +static void rxe_disassociate_ucontext(struct ib_ucontext *ibuc)
>> +{
>> +}
>> +
>
>[Severity: Critical]
>By adding this callback, does this opt the driver into asynchronous teardown
>which can lead to a use-after-free and kernel panic?
>
>Because RXE uses legacy, untracked VMAs (bypassing the core's
>rdma_user_mmap_entry mechanism), these VMAs are invisible to the core and are
>not zapped during teardown.
>
>If a user process maps an RXE resource and the device is then removed or
>migrated to another network namespace, the asynchronous teardown will free
>the ib_ucontext and allow module unload while the process still holds the VMA.
>
>When the process later unmaps the memory or exits, the untracked VMA's close
>callback (rxe_vma_close) will trigger rxe_mmap_release(), accessing the
>already-freed ib_ucontext and rxe_dev:
>
>drivers/infiniband/sw/rxe/rxe_mmap.c:rxe_mmap_release() {
>	struct rxe_mmap_info *ip = container_of(ref,
>					struct rxe_mmap_info, ref);
>	struct rxe_dev *rxe = to_rdev(ip->context->device);
>
>	spin_lock_bh(&rxe->pending_lock);
>    ...
>}
>
>If the module was unloaded in the interim, jumping to the VMA's close callback
>could also trigger an immediate kernel panic.

Fixed.

>
>[ ... ]
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260709095532.855647-1-jiri@resnulli.us?part=12
