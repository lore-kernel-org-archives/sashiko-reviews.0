Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA3370AFD
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780028523; cv=none; b=TP8TUgTlaMVJOqGkBEMCleL4i4HftdjkNGDuIlsUm74cDz63jSL2Pfv7QeyWVT5UCF5vGqpG4miJE9h7YUrbhcPDluNUwk494mkK4d/9Wm8xR003X5lPqUgQKw8TXLbKsaPCJ91E4WxQX4beXFcjZL89MrZNmXY6xHeFBe2OpeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780028523; c=relaxed/simple;
	bh=xzW5x9iAB6Eb/h1LY4YMe654q9jJ4E6QneGu6cWFWss=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=s2UXkpXhDk830yX++3hm8WmxMrMS5EakSxbrnb0AMMzD4SEr0T+5+f5fRt+ORUeJHp+zOTurh6znKH0ouuWkDtX3BqKkYXshrbe65Z5BBpCVGaIh9f3c3Lk19O9N6HO1O55h+5wLloCK6EMiZSGVpHgSLBLFt7aJipoAEwulIdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFdNfI4M; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFdNfI4M"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8367df48711so5934729b3a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 21:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780028521; x=1780633321; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RhdO/AEgSTmHjiBbCMxjzej2oiy/N5MjAHVUgamYaBs=;
        b=PFdNfI4MBvVOtopwYHM+8ipcDCdGv0m1kcWOfJhzyQPxyy4tLU3zjXWfLCWsBOrazN
         Rqu8Z/4GGXNmuM6+RJhvfp2yVnavTUFxtswt+cpTNpPLT+HQpUttRu65Jt+iAs0NPJOv
         9T1Ux7VnncSaNgbo2f1hEIea/eNUGGzJVLrhm8Tk7tZKjYmjyS3uzLS+Y4Z8TYdiF9mK
         USfLBGkY3FC2EpPEUCuSsqjB9UJBn6fAIvCbNo4DqF4rpa+exm8stTn+X9hPf6aJ8+46
         EePN6OacXTfzifY8Rro/sav0gyrlfkAAcyQqACiWImZjlHihn28T8ru98pNvpbwvHWe+
         D5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780028521; x=1780633321;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhdO/AEgSTmHjiBbCMxjzej2oiy/N5MjAHVUgamYaBs=;
        b=jMHKPG1P8IEPPZNQm8KtdgakTa7C4YaqSknfZwv9aAWNn7U7ZjMDMJxgjIKikxWR/v
         SB0Y19ex+UNyRDI/1GBS9wMK97NWAqhNVPQV2L8hdUwJexUoxVdnjAyXVYgtxNYnhDX7
         O9TQJswz4DpF3pexTPJ9O9HVF7IZTMmouFqNUWGisHD11ZuR/akzMAuTuheg6XSDZzQ7
         GGscBi9kw0Fj6XghQXKIb5H/8gGQFSHVvsbw89oXehsxINOTrX41cuPmGrOW9i0qYTIG
         4B8/+qkTxhGejbw7gIGwkIUwtms6t4hHGHThaaKmUVPuN9r8aequwvCU+8jkyZ1soKnd
         VGfQ==
X-Gm-Message-State: AOJu0YwcZw9t71xU9FxDi/OWT0/jfE+ax36tScEqwC4vHze17jFUGIfC
	L+tlQVAkeHIA1UZe8go/wYVPD0oRW6IdsUBu1Kp3R0vzkz3wIZjw3BQK
X-Gm-Gg: Acq92OELBCgheWRzjZiiQkVBsysVPRnzUFo3oNqQVmcI7/sy7hPeue1MQbM1sa9w9k8
	xBwz53V3xQVtc82zwXF8Nrxeuh6thusdgo+uwpdHcUZyk88GdtYw6SmiHvstMAcFCHJvjbtA+/n
	nb7/XNQ4sMJDgWwEvw8sbGxjo/aMFa9KBicjv8labNKE61nk0oOVLZb12d9/jmCZA/8/uKJSDF5
	ipKge5g4aVv7tor8RwWwAqhI6DE6xPG9WQskUNeexqJXcYQuRSv2/Tb2wKZqovWVUqsUcuD3uch
	Eyj7eUfSyqqpZtm0V9wPnu7FiiQ54ixjjaIyTml06ZtsxEANkvlJR3EEitUVpTApl6uzUw3xlvT
	Q/f2kQvVZjE/JPH9HVxs3Ty5mJVkVgoi8Im+Tc2O3EPRfD+mdvN+WwVoKl6kTUMWUkkJPiwLzgC
	9PsuzE8WlIRcfXfthup84sY4mz/G8W1+Fl
X-Received: by 2002:a05:6a00:bd82:b0:837:e9cc:d470 with SMTP id d2e1a72fcca58-84212c5b1a6mr1241630b3a.20.1780028520687;
        Thu, 28 May 2026 21:22:00 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cc35a2sm352288b3a.46.2026.05.28.21.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 21:21:59 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [RFC v3 03/10] KVM: PPC: selftests: add support for powerpc
In-Reply-To: <20260527133246.26D501F000E9@smtp.kernel.org>
Date: Fri, 29 May 2026 09:42:28 +0530
Message-ID: <eciux39v.ritesh.list@gmail.com>
References: <99818a9e1c8954ba74e1861dfa2bd5eee19f4f86.1779885589.git.ritesh.list@gmail.com> <20260527133246.26D501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

sashiko-bot@kernel.org writes:


> commit 4362b48fc35809ad7a74045c726f7ffae0c70ccd
> Author: Nicholas Piggin <npiggin@gmail.com>
>
> KVM: PPC: selftests: add support for powerpc
>
> This commit implements KVM selftests support for powerpc (Book3S-64),
> including ucalls and virtual memory for the radix MMU.
>
>> diff --git a/tools/testing/selftests/kvm/lib/powerpc/processor.c b/tools/testing/selftests/kvm/lib/powerpc/processor.c
>> new file mode 100644
>> index 0000000000000..9846ec26a32aa
>> --- /dev/null
>> +++ b/tools/testing/selftests/kvm/lib/powerpc/processor.c
>
> [ ... ]
>
>> +struct handler {
>> +	void (*fn)(struct ex_regs *regs);
>> +	int trap;
>> +};
>> +
>> +#define NR_HANDLERS	10
>> +static struct handler handlers[NR_HANDLERS];
>
> [Severity: Medium]
> Could this static global array cause state leakage across VMs or race
> conditions in multi-threaded tests?
>
> Since this is defined as a static global on the host rather than a per-VM
> allocation, a new VM will start with a zeroed guest handlers array (from ELF
> loading), but the host's handlers array will retain entries from previous VMs.
>
> This appears to limit the total number of unique handlers that can be installed
> sequentially across all VMs in the entire test process to 10, which would
> eventually result in the "Out of exception handlers" failure below.
>
> Additionally, if multiple threads concurrently create VMs and install exception
> handlers, would they race on this shared host array and sync corrupted state to
> their respective guests?
>

As of now there are no multi-VM tests which creates VMs in parallel.
Also the powerpc exception handler is not used today. It is deferred for
later use when more powerpc specific tests will get added.

If there's ever a need for parallel multi-VM creation, then we can clean
this up.  Even otherwise, I think making it consistent with the other
architectures makes sense (once PowerPC-specific tests get added), so
that too can be deferred until after this base PowerPC KVM selftests
infrastructure lands.

-ritesh
