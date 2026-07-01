Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73838F259
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938587; cv=none; b=n+LmBYzZVj/tFfuT4QU1cJw1lVVnmNzP2EOX2fW/CHS6drplEZGqPvK7lhm10jhonGPEYiK/I3beZ4/STZsXpwQkCAqTiaJ9qm/XVwNEP6GUoKo72h1rQVN+n4ERhbjJ4XhYms9bBB+ZDi8k8BC/Qshx4cklsybq95geZOiTU/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938587; c=relaxed/simple;
	bh=MJHAY/0lOZtESReKmEZbrT/tBa8Uv8X4qGxYXF2Xvm4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L+GO8RJCbOxoljm8Mp++2NAxqd0VHBBj05PGG5tz5vR1Ptglm6WPR57AnrDwHRmeSzggs7AlmQaO1+6E7w4ygCqoEoLX3yIA7OK/YqQfUjX3hfRkjEk6/+94ptuLGau+OnLlJBbDXqL5rb8h+EtxtBINhDltaAF2aqGC/DrW1Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NGKu93oA; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NGKu93oA"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6bbd0afffso22665095ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 13:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782938586; x=1783543386; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul4KfkOuOrRVfcOqe8UUYQTjm8np2xMi7aWFEy9eSTw=;
        b=NGKu93oAzdZi9f8aD++xRjdGX6gk36Y9T0IwUOthYMV+3FBkqKTTVr49gliBI8LyMB
         Pxo1lvZPovreh6prLsTI6VU3PtZt65dO6Yck/kRVE83cg5r9Uh2NHm7Xbk/ngyqT8+Te
         43rgyQ6yH1WzppE0tzAya6YE36K1kb9XHFmvZnTfGw0bJ+qVtKDxG2IaU9qH8WdYyj+H
         ZZ2Sp+c7Dx/XhMiotFN4nFSdgQ9P9W/m8zaoFhJ2wdDDbXKcIaLuldN2DPHHWRZuL+29
         /FnoykCilhvFoDLM5A4gEbQ1G/xOMXcPDl3Lcdc6SZspEDmlZN/5eDfAmO0jJ4F7q/vx
         D5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782938586; x=1783543386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul4KfkOuOrRVfcOqe8UUYQTjm8np2xMi7aWFEy9eSTw=;
        b=fyUbeGXFDm2tzc1ikhcohUdcLEqriTcDKeKQ8Q9CB45bdIuKVNxBTDwaZw7H1CjoWO
         hRqbZtJHgWVEhwNzE1PgOdgwKdsZNdGmB8KlYq+1AhDzqXxo306bg3sq6gScrd/aB6Pb
         7/OtqsNjW4QyunpnWXtv/nGkshsmuqzsZ+CZOmqfHJ9CqNHiQDBrMxBjSfXUNpBpJkdG
         X8FqaQyWH7/+jHIpw9hmx2fgRzOE2JzxErZHuIXFZNwPqE8Z3NQh8uINbIKntiuvf8R8
         CCLjWpZ0KBOG9q2Hi98Rd86ShAENEnHpMr9P64l273geXEx8rjGTOQmx2doGmKfiW0K4
         wBtQ==
X-Gm-Message-State: AOJu0YxXrcFBYQUZgODBBdBBEpET6rD201730LO2J4Tj0Yg/dZ6i0Fr4
	dsJs7xulZL9dWPa/WVEUMkQWB78Dkj+v9HKfdLmsasGwh+2tHxQSZNwZtLps+L9CoBD+sGC38V9
	+GIhBDmCWgUMWKcxJcOvfaJIBmRu0+DaW9ERLuemzne18vfh0nclkeoQTvRxrzPI9rG0lTxVqvs
	/IMjlRQ/DZlrrRZDzDTrZng8jSVMQH5qsVM9gAYw1QGZnFS8iR
X-Received: from plbla16.prod.google.com ([2002:a17:902:fa10:b0:2bd:4b8c:fd31])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e785:b0:2c9:c16f:eda6
 with SMTP id d9443c01a7336-2ca7e8a899dmr38410135ad.39.1782938585487; Wed, 01
 Jul 2026 13:43:05 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:43:04 -0700
In-Reply-To: <20260701200318.B83061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com> <20260701193212.749551-30-seanjc@google.com>
 <20260701200318.B83061F000E9@smtp.kernel.org>
Message-ID: <akV72B0ORjG1rOch@google.com>
Subject: Re: [PATCH v5 29/51] x86/kvm: Don't disable kvmclock on BSP in syscore_suspend()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Does this change inadvertently leave the BSP's kvmclock enabled when
> powering off the machine for ACPI S4 hibernation?
> 
> Looking at the final S4 power-off path in hibernation_platform_enter() in
> kernel/power/hibernate.c, it calls syscore_suspend() but does not call
> save_processor_state(). Because this patch removes the unconditional BSP
> kvmclock_disable() from syscore_suspend() and relies on
> kvm_save_sched_clock_state() (which only fires during image creation),
> kvmclock appears to remain fully enabled during the S4 power-off.

No?

  hibernate()
  |
  -> hibernation_snapshot()
  |  |
  |  -> create_image()
  |     |
  |     -> save_processor_state()
  |
  -> power_down()
     |
     -> hibernation_platform_enter()

I'm not familiar with the /dev/snapshot interface, but I gotta imagine userspace
needs to do SNAPSHOT_CREATE_IMAGE before SNAPSHOT_POWER_OFF if it actually wants
to restore state after S4.

> [Severity: Critical]
> This isn't a bug introduced by this patch, but is there a use-after-free
> risk with the stack-allocated waitqueue head in the async page fault
> handling in arch/x86/kernel/kvm.c?

And I thought I had a problem with scope creep during review...

> When a guest task waits for an async page fault in
> kvm_async_pf_task_wait_schedule(), it waits on a stack-allocated struct
> kvm_task_sleep_node. Concurrently, when a waker CPU executes
> apf_task_wake_one(), it unhashes the node via hlist_del_init().
> 
> The waiter checks hlist_unhashed() locklessly. If it observes the unhashed
> state before the waker is finished, the waiter can break its loop, return,
> and destroy the stack frame. The waker might then dereference the
> deallocated waitqueue head to call swake_up_one(), potentially corrupting
> stack memory.
> 
> Can this sequence occur during concurrent page fault completions?

No idea, definitely something to sort out at a different time.
